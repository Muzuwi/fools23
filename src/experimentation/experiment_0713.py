import foolsocket

f = foolsocket.FoolsSocket("fools2023.online", 13337)
f.wait_for_monitor_prompt()

with open("before_DA.bin", "wb") as file:
    file.write(f.read_bytes(0x0, 0x10000))

f.write_bytes(0x2000, b'\x10\xDA\x20\x11\xDA\x20\x12\xDA\x20\x13\xDA\x20\x07\x13\x00')
# f.write_bytes(0x2000, b'\x10\x00\x20\x11\x00\x20\x12\x00\x20\x13\x00\x20\x07\x13\x00')
f.execute_at(0x2000)
f.wait_for_monitor_prompt(5.0)

with open("after_DA.bin", "wb") as file:
    file.write(f.read_bytes(0x0, 0x10000))
