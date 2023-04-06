import io
import argparse
import sys
import itertools
from typing import *


def advance_m2156(current: int) -> int:
    current *= 0x41A7
    current ^= 0x5555
    return current & 0xFFFF


def low(u16: int) -> int:
    return u16 & 0xFF


def high(u16: int) -> int:
    return (u16 >> 8) & 0xFF


def decrypt(data: bytes, m2156: int) -> bytes:
    arr = bytearray(data)
    for i in range(0, len(arr), 2):
        m2156 = advance_m2156(m2156)
        arr[i] ^= low(m2156)
        arr[i + 1] ^= high(m2156)

    return arr


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("file", help="File to decrypt", type=str)
    args = parser.parse_args()

    with open(args.file, "rb") as f:
        filebytes = f.read()
        for i in range(0, 0x10000):
            decrypted = decrypt(filebytes, i)
            print("Decrypted data:", decrypted)


if __name__ == '__main__':
    main()
