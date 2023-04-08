#!/usr/bin/env python3
import time
import random

import foolsocket

""" This mutates the input file at a specified offset, and reports
    what happens after running it.  
"""

filename = "../root/MIXTEST_MINIMIZED.PRG"
offset = 0x3c


def main():
    with open(filename, "rb") as f:
        file = bytearray(f.read())

    for i in range(0x0, 0x100):
        f = foolsocket.FoolsSocket("fools2023.online", 13337)
        f.wait_for_monitor_prompt()

        mutated = bytearray(file)
        mutated[offset] = i
        f.write_bytes(0x2000, mutated)
        f.execute_at(0x2000)
        try:
            v = f.wait_for_monitor_prompt(timeout=4.0)
            print(f"${format(offset, 'X').zfill(4)} = ${hex(i).zfill(2)} | {v}")
        except TimeoutError:
            print(f"${format(offset, 'X').zfill(4)} = ${hex(i).zfill(2)} | ILLEGAL OPCODE, mutation not valid!")
        time.sleep(random.randint(200, 700) / 1000.0)


if __name__ == '__main__':
    main()
