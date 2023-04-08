#!/usr/bin/env python3
import time
import random

import foolsocket


def main():
    mixtest: bytearray = bytearray()
    with open("MIXTEST.PRG", "rb") as f:
        mixtest = bytearray(f.read())

    for i in range(0, 0x100):
        f = foolsocket.FoolsSocket("fools2023.online", 13338)
        f.expect(b'Username: ', timeout=3.0)
        f.communicate(b'ax.arwen\n')
        f.expect(b'Password: ', timeout=3.0)
        f.communicate(b'sYpiB;705*X\n')
        f.wait_for_monitor_prompt(5.0)

        # mutate the instruction and hope it hits breakpoint
        mixtest[0x2F] = i
        f.write_bytes(0x2000, bytes(mixtest))
        f.execute_at(0x2000)
        f.expect(b'password: ')
        f.communicate(b'FOOB\n')
        try:
            output = f.wait_for_monitor_prompt(10.0)
            with open(f"07_XX/{format(i, 'X').zfill(2)}", "wb") as file:
                file.write(output)
            print(f"07 A7 {format(i, 'X').zfill(2)} | ?????")
        except TimeoutError:
            print(f"07 A7 {format(i, 'X').zfill(2)} | Failed")
        time.sleep(random.randint(200, 700) / 1000.0)


if __name__ == '__main__':
    main()
