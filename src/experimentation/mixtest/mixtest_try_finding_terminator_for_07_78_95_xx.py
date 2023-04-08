#!/usr/bin/env python3
import time
import random

import foolsocket


def main():
    for i in range(0, 0x100):
        f = foolsocket.FoolsSocket("fools2023.online", 13337)
        f.wait_for_monitor_prompt()

        payload = b'\x10\x00\x00\x11\x00\x00\x12\x00\x00\x13\x00\x00\x07\x78\x95'
        payload += i.to_bytes(1, byteorder='little')
        payload += b'\x00' * 8

        f.write_bytes(0x2000, payload)
        f.execute_at(0x2000)
        try:
            _ = f.expect(b'ILLEGAL OPCODE', timeout=2.0)
            print(f"{payload} | ILLEGAL OPCODE")
        except TimeoutError:
            print(f"{payload} | didn't throw illegal opcode!")
        time.sleep(random.randint(200, 700) / 1000.0)


if __name__ == '__main__':
    main()
