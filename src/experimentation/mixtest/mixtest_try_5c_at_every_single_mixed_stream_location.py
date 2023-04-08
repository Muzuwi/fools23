#!/usr/bin/env python3
import time
import random

import foolsocket


def main():
    with open("../../../root/MIXTEST_but_only_07A7_instr.bin", "rb") as f:
        mixtest = bytearray(f.read())

    for i in range(0x2F, 0x63):
        f = foolsocket.FoolsSocket("fools2023.online", 13337)
        f.wait_for_monitor_prompt()

        mutated = bytearray(mixtest)
        mutated[i] = 0x5C
        mutated[i + 1] = 0x00
        f.write_bytes(0x2000, mutated)
        f.execute_at(0x2000)
        try:
            v = f.wait_for_monitor_prompt(timeout=5.0)
            print(f"${format(0x2000 + i, 'X').zfill(4)} | {v}")
        except TimeoutError:
            print(f"${format(0x2000 + i, 'X').zfill(4)} | ILLEGAL OPCODE, mutation not valid!")
        time.sleep(random.randint(200, 700) / 1000.0)


if __name__ == '__main__':
    main()
