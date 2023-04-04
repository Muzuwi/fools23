import io
import argparse
import sys
import itertools
from typing import *

ignore = [1, 2, 3, 4]

with open("swi_sled.bin", "wb") as f:
    for i in range(0, 0x100):
        if i in ignore:
            continue
        f.write(b"\x10\x00\x10\x11\x00\x10\x12\x00\x10\x13\x00\x10")
        swi = b"\x06" + i.to_bytes(1, byteorder='little') + b"\x00"
        f.write(swi)
    f.write(b"\x00")
