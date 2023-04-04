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


def read8(addr: int) -> int:
    if addr < 0x1000:
        print("nop - READ BIOS")
        return 0xFF if addr % 2 == 0 else 0x0
    elif addr == 0x2033:
        print("READ PRINTABLE STRING")
        return 0xA7
    else:
        print(f"UNDEFINED READ {format(addr, 'X').zfill(4)}")
        return 0x0


def write8(addr: int, value16: int):
    if addr < 0x1000:
        print("nop - WRITE BIOS")
        return
    else:
        print(f"WRITE TO {format(addr, 'X').zfill(4)}")
        return


def write16(addr: int, value: int):
    write8(addr, value & 0xFF)
    write8(addr + 1, (value >> 8) & 0xFF)


def read16(addr: int) -> int:
    return read8(addr) | (read8(addr + 1) << 8)


def main():
    r0 = 0x0
    r1 = 0x0
    r2 = 0x0
    r3 = 0x0

    r3 = read8(r0)
    r0 = r1
    # push pc
    write16(r0, r1 & 0xFF)

    r2 = read16(r0)
    write8(r1, r1 & 0xFF)
    r2 += r3
    # DF - endian swap
    r0 = ((r0 >> 8) & 0xFF) | ((r0 & 0xFF) << 8)
    write16(r2, r0)
    r1 += r3
    r3 = read8(r3)
    r0 = r1
    r1 = read16(r0)
    r3 = read16(r3)
    r2 = read8(r1)
    r2 = read8(r1)
    # pop r1
    r1 = 0x2033
    r3 = read8(r1)
    r0 = r1
    write8(r1, r3 & 0xFF)
    r2 = read16(r3)
    r0 = (r0 * 0x583B) & 0xFFFF
    r3 = read8(r1)
    write8(r1, r0 & 0xFF)
    r2 = read16(r3)
    r0 = (r0 * 0x3B02) & 0xFFFF
    r2 = read16(r3)
    r3 = read16(r0)
    r0 = read8(0x2151)

    print(
        f"R0={format(r0, 'X').zfill(4)} R1={format(r1, 'X').zfill(4)} R2={format(r2, 'X').zfill(4)} R3={format(r3, 'X').zfill(4)}")


if __name__ == '__main__':
    main()
