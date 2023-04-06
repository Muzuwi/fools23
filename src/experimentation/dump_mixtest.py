import foolsocket

# f = foolsocket.FoolsSocket("fools2023.online", 13337)
# f.write_bytes(0x1000, b'\x10\x11\x11\x11\x22\x22\x12\x33\x33\x13\x44\x44\x00')
# f.execute_at(0x1000)
# out = f.expect(b'Ready.\n> ')
# print(out)

f = foolsocket.FoolsSocket("fools2023.online", 13338)
f.expect(b'Username: ', timeout=3.0)
f.communicate(b'ax.arwen\n')
f.expect(b'Password: ', timeout=3.0)
f.communicate(b'sYpiB;705*X\n')
f.wait_for_monitor_prompt(5.0)
f.communicate(b'rf\n')
f.expect(b'Filename? ')
f.communicate(b'MIXTEST.PRG\n')
f.expect(b'address? ')
f.communicate(b'1000\n')

b = f.read_bytes(0x1000, 0x165)
with open("MIXTEST.PRG", "wb") as f:
    f.write(b)
