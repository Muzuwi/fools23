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

# Max concurrent connections
max_connections = 5


def check_jump(target: int, p: pexpect.spawn):
    p.expect("Ready.")
    p.sendline("x")
    p.expect("Which address?")
    p.sendline(hex(target))
    p.expect("Really exec")
    p.sendline("Y")
    p.expect("Ready.")


def connection_entrypoint(start: int, count: int):
    process = pexpect.spawn("nc fools2023.online 13337")
    for i in range(start, start + count, 1):
        print(f"Checking target 0x{format(i, 'X').zfill(4)}")
        check_jump(i, process)
        time.sleep(2)


def main():
    threads = []
    for i in range(0, max_connections):
        count = int(0x1000 / max_connections)
        start = count * i
        if i == max_connections - 1:
            count = min(0x1000 - max_connections * count, count)

        thread = threading.Thread(target=connection_entrypoint, args=(start, count))
        threads.append(thread)

    for thread in threads:
        thread.start()
        time.sleep(0.1)

    for thread in threads:
        thread.join()


if __name__ == '__main__':
    main()
