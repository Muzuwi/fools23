#!/usr/bin/env python3
import time
import random

import foolsocket


def main():
    with open("../../../root/MIXTEST_for_analyzing_dec_r1_instr.bin", "rb") as f:
        mixtest = bytearray(f.read())

    for i in range(0x0, 0x100):
        f = foolsocket.FoolsSocket("fools2023.online", 13337)
        f.wait_for_monitor_prompt()

        mutated = bytearray(mixtest)
        mutated[0x4D] = i
        f.write_bytes(0x2000, mutated)
        f.execute_at(0x2000)
        try:
            v = f.wait_for_monitor_prompt(timeout=5.0)
            print(f"${format(i, 'X').zfill(2)} | {v}")
        except TimeoutError:
            print(f"${format(i, 'X').zfill(2)} | ILLEGAL OPCODE, mutation not valid!")
        time.sleep(random.randint(200, 700) / 1000.0)


if __name__ == '__main__':
    main()
