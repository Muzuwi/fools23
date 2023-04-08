#!/usr/bin/env python3
import time
import random

import foolsocket

offset = 0x5f


def main():
    with open("MIXTEST_MINIMIZED.PRG", "rb") as f:
        mixtest = bytearray(f.read())

    for i in range(0x0, 0x100):
        f = foolsocket.FoolsSocket("fools2023.online", 13337)
        f.wait_for_monitor_prompt()

        mixtest[offset] = i
        f.write_bytes(0x2000, mixtest)
        f.execute_at(0x2000)
        try:
            v = f.wait_for_monitor_prompt(timeout=4.0)
            print(f"${format(0x2000 + offset, 'X').zfill(4)} = ${hex(i)} | {v}")
        except TimeoutError:
            print(f"${format(0x2000 + offset, 'X').zfill(4)} = ${hex(i)} | ILLEGAL OPCODE, mutation not valid!")
        time.sleep(random.randint(200, 700) / 1000.0)


if __name__ == '__main__':
    main()
