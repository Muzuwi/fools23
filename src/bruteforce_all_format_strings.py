#!/usr/bin/env python3
import time
import random

import foolsocket


def run_with_format(fmt: int) -> bytes:
    f = foolsocket.FoolsSocket("fools2023.online", 13339)
    data = f.expect(b"15 characters): ")
    fmtbytes = bytearray(fmt.to_bytes(1, byteorder="little"))
    fmtbytes += b'\x20\x20\n'
    f.communicate(bytes(fmtbytes))
    data = f.expect(b"to leave: ")
    return data


def main():
    for i in range(0x80, 0x100, 1):
        out = run_with_format(i)
        print(f"{format(i, 'X').zfill(2)}   | {out}")
        time.sleep(random.randint(200, 700) / 1000.0)
        with open(f"fmt/fmt-{format(i, 'X').zfill(2)}.log", "wb") as f:
            f.write(out)


if __name__ == '__main__':
    main()
