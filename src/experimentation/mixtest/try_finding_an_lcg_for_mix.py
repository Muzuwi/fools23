import io
import argparse
import sys
import itertools
from typing import *
from z3 import *


def calc_state(redirects, n):
    value = 0x0
    for i in range(0, 8):
        bit = ((n >> i) & 0x1)
        value |= bit << redirects[i]
    return value


def main():
    # a*x + b
    solver = Solver()

    redirects = []
    for i in range(0, 8):
        redirects.append(BitVec(f"redirect-bit-{i}", 8))
        solver.add(redirects[i] >= 0)
        solver.add(redirects[i] < 8)

    # xAB = calc_state(redirects, 0xAB)
    # x22 = calc_state(redirects, 0x22)
    # x54 = calc_state(redirects, 0x54)
    # xA9 = calc_state(redirects, 0xA9)
    # xA8 = calc_state(redirects, 0xA8)
    # xDF = calc_state(redirects, 0xDF)
    # x09 = calc_state(redirects, 0x09)
    # x23 = calc_state(redirects, 0x23)
    # xB7 = calc_state(redirects, 0xB7)
    # x27 = calc_state(redirects, 0x27)
    # x10 = calc_state(redirects, 0x10)
    # x5F = calc_state(redirects, 0x5F)
    # x36 = calc_state(redirects, 0x36)
    # x40 = calc_state(redirects, 0x40)

    # solver.add(xAB == 0xDF)
    # solver.add(x22 == 0x37)
    # solver.add(x54 == 0x4F)
    # solver.add(xA9 == 0xFC)
    # solver.add(xA8 == 0xC2)
    # solver.add(xDF == 0x54)
    # solver.add(x09 == 0x49)
    # solver.add(x23 == 0x95)
    # solver.add(xB7 == 0x01)
    # solver.add(x27 == 0xF2)
    # solver.add(x10 == 0x5B)
    # solver.add(x5F == 0x3B)
    # solver.add(x36 == 0x58)
    # solver.add(x40 == 0x20)

    x80 = calc_state(redirects, 0x80)
    solver.add(x80 == 0x01)

    print(format(0xAB ^ 0xDF, 'X').zfill(2), format(0xAB ^ 0xDF, 'b').zfill(8))
    print(format(0x22 ^ 0x37, 'X').zfill(2), format(0x22 ^ 0x37, 'b').zfill(8))
    print(format(0x54 ^ 0x4F, 'X').zfill(2), format(0x54 ^ 0x4F, 'b').zfill(8))
    print(format(0xA9 ^ 0xFC, 'X').zfill(2), format(0xA9 ^ 0xFC, 'b').zfill(8))
    print(format(0xA8 ^ 0xC2, 'X').zfill(2), format(0xA8 ^ 0xC2, 'b').zfill(8))
    print(format(0xDF ^ 0x54, 'X').zfill(2), format(0xDF ^ 0x54, 'b').zfill(8))
    print(format(0x09 ^ 0x49, 'X').zfill(2), format(0x09 ^ 0x49, 'b').zfill(8))
    print(format(0x23 ^ 0x95, 'X').zfill(2), format(0x23 ^ 0x95, 'b').zfill(8))
    print(format(0xB7 ^ 0x01, 'X').zfill(2), format(0xB7 ^ 0x01, 'b').zfill(8))
    print(format(0x27 ^ 0xF2, 'X').zfill(2), format(0x27 ^ 0xF2, 'b').zfill(8))
    print(format(0x10 ^ 0x5B, 'X').zfill(2), format(0x10 ^ 0x5B, 'b').zfill(8))
    print(format(0x5F ^ 0x3B, 'X').zfill(2), format(0x5F ^ 0x3B, 'b').zfill(8))
    print(format(0x36 ^ 0x58, 'X').zfill(2), format(0x36 ^ 0x58, 'b').zfill(8))
    print(format(0x40 ^ 0x20, 'X').zfill(2), format(0x40 ^ 0x20, 'b').zfill(8))

    print(solver)
    print(solver.check())
    print("traversing model...")
    for d in solver.model().decls():
        print("%s = %s" % (d.name(), solver.model()[d]))
    print(solver.assertions())

    pass


if __name__ == '__main__':
    main()
