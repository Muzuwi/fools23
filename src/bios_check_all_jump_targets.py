# !/usr/bin/env python3
import threading
import time
import random

import foolsocket

# Max concurrent connections
max_connections = 5
# Highest address to check
# BIOS is for the most part empty (00)
max_addr = 0x230


def connection_entrypoint(start: int, count: int) -> None:
    for target in range(start, start + count):
        f = foolsocket.FoolsSocket("fools2023.online", 13337)
        f.wait_for_monitor_prompt(5.0)

        payload = b'\x10\x00\x00\x11\x00\x00\x12\x00\x00\x13\x00\x00'
        payload += b'\x99' + target.to_bytes(2, byteorder='little')
        payload += b'\x00'
        f.write_bytes(0x1000, payload)
        f.execute_at(0x1000)

        try:
            result = f.wait_for_monitor_prompt(5.0)
            if result is None:
                print(f"{format(target, 'X').zfill(4)} | ILLEGAL OPCODE")
            else:
                print(f"{format(target, 'X').zfill(4)} | {result}")
        except TimeoutError:
            print(f"{format(target, 'X').zfill(4)} | Timed out, infinite loop?")
        time.sleep(random.randint(200, 700) / 1000.0)


def main():
    threads = []
    for i in range(0, max_connections):
        count = int(max_addr / max_connections)
        start = count * i
        if i == max_connections - 1:
            count = min(max_addr - max_connections * count, count)

        thread = threading.Thread(target=connection_entrypoint, args=(start, count))
        threads.append(thread)

    for thread in threads:
        thread.start()
        time.sleep(0.1)

    for thread in threads:
        thread.join()
    pass


if __name__ == '__main__':
    main()
