#!/usr/bin/env python3
import time
import random

import foolsocket

""" This attempts to minimize the payload of the mixed instruction stream
    by repeatedly replacing bytes of the payload with 0x0.
    An assumption is made that 0x0 is a single-byte instr in mixed mode.
"""

filename = "../root/MIXTEST_but_only_07A7_instr.bin"


def main():
    with open(filename, "rb") as f:
        mixtest = bytearray(f.read())

    for i in range(0x2F, 0x63):
        f = foolsocket.FoolsSocket("fools2023.online", 13337)
        f.wait_for_monitor_prompt()

        old = mixtest[i]
        mixtest[i] = 0x0

        f.write_bytes(0x2000, mixtest)
        f.execute_at(0x2000)
        try:
            v = f.wait_for_monitor_prompt(timeout=4.0)
            if v is not None:
                if b'AT $2063' not in v:
                    print(
                        f"Offset ${hex(i)} | Reached monitor, but at a different address. Wtf?   <======== CHECK THIS LATER")
                    mixtest[i] = old
                else:
                    print(f"Offset ${hex(i)} | Reached monitor, this can be 0!")
                    print(v)
            else:
                print(f"Offset ${hex(i)} | Timed out???, this cannot be 0!")
                mixtest[i] = old
        except TimeoutError:
            print(f"Offset ${hex(i)} | ILLEGAL OPCODE, this cannot be 0!")
            mixtest[i] = old
        time.sleep(random.randint(200, 700) / 1000.0)

    print("Final result:", mixtest)
    with open("MIXTEST_MINIMIZED.PRG", "wb") as f:
        f.write(mixtest)


if __name__ == '__main__':
    main()
