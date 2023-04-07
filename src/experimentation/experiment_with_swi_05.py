import foolsocket

f = foolsocket.FoolsSocket("fools2023.online", 13337)
f.wait_for_monitor_prompt()

f.write_bytes(0x2000, b'\x13\x00\x30\x06\x05\x7C\xAB\xAB\xA5\x00\x40\x9D\x03\x20')
f.execute_at(0x2000)
f.wait_for_monitor_prompt(5.0)

with open("random.bin", "wb") as file:
    file.write(f.read_bytes(0x3000, 0x1000))
