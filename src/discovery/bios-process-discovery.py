#!/usr/bin/env python3
import sys
import io
import stat
import os

for i in range(0, 0x230):
    if i % 32 == 0:
        print()

    addr = format(i, 'X').zfill(4)
    fname = f"bios/jump-{addr}.log"
    size = os.lstat(fname)
    if size.st_size == 20:
        # print(f"{addr} - HANG")
        print(".", end="")
    elif size.st_size == 32:
        # print(f"{addr} - RETURNED")
        print("?", end="")
    elif size.st_size == 41:
        # print(f"{addr} - ILLEGAL OPCODE")
        print("!", end="")
    elif size.st_size == 143:
        # print(f"{addr} - MONITOR")
        print("0", end="")
    else:
        # print(f"{addr} - UNKNOWN")
        print("#", end="")
