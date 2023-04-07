import foolsocket

f = foolsocket.FoolsSocket("fools2023.online", 13337)
f.wait_for_monitor_prompt()
print(f.read_bytes(0x0, 0x1000))
