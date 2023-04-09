import foolsocket


def main():
    for i in range(0, 0x100):
        f = foolsocket.FoolsSocket("fools2023.online", 13338)
        if f.port == 13338:
            f.expect(b'Username: ', timeout=3.0)
            f.communicate(b'ax.arwen\n')
            f.expect(b'Password: ', timeout=3.0)
            f.communicate(b'sYpiB;705*X\n')
            f.wait_for_monitor_prompt(5.0)
        else:
            f.wait_for_monitor_prompt()

        payload = b'\x10' + i.to_bytes(1, 'little') + b'\x00'
        payload += b'\x11\x00\xC0\x06\x04\x00\x00\x00\x00\x00\x00'
        print(payload)

        f.write_bytes(0x1000, payload)
        f.execute_at(0x1000)
        v = f.wait_for_monitor_prompt(timeout=5.0)
        if v is None:
            print(f"BLK {format(i, 'X').zfill(2)} does not exist")
            continue
        with open(f"../dumps/files_{f.port}/blk_{format(i, 'X').zfill(2)}.bin", "wb") as file:
            file.write(f.read_bytes(0xC000, 0x1000))


if __name__ == '__main__':
    main()
