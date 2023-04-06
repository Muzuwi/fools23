#!/usr/bin/env python3
import time
import random

import foolsocket


def run_07_with_argument(argument: int) -> bytes:
    payload = b'\x13\x00\x00'
    payload += b'\x07'
    payload += bytearray(argument.to_bytes(1, byteorder="little"))
    payload += b'\x00'

    f = foolsocket.FoolsSocket("fools2023.online", 13337)
    _ = f.expect(b'Ready.\n> ')
    f.communicate(b'w\n')
    _ = f.expect(b'address? ')
    f.communicate(b'1000\n')
    _ = f.expect(b'newline:\n')
    for b in payload:
        v = format(b, 'X').zfill(2)
        f.communicate(v.encode('ascii'))
    f.communicate(b'.\n')
    _ = f.expect(b'Ready.\n')
    f.communicate(b'x\n')
    _ = f.expect(b'address?')
    f.communicate(b'1000\n')
    _ = f.expect(b'Y if so: ')
    f.communicate(b'Y\n')

    data = f.expect(b"ILLEGAL OPCODE", 2.0)
    return data


def main():
    for i in range(0x0, 0x100, 1):
        try:
            out = run_07_with_argument(i)
            print(f"07 {format(i, 'X').zfill(2)}   | {out}")
            time.sleep(random.randint(200, 700) / 1000.0)
            with open(f"07/07-{format(i, 'X').zfill(2)}.log", "wb") as f:
                f.write(out)
        except:
            print(f"07 {format(i, 'X').zfill(2)}   | Timed out, seems interesting")


if __name__ == '__main__':
    main()
