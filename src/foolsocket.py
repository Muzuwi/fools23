import socket
from typing import *


class FoolsSocket:
    def __init__(self, host, port):
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.host = host
        self.port = port
        self.connect()

    def connect(self):
        self.sock.connect((self.host, self.port))

    def expect(self, pattern: bytes) -> Optional[bytes]:
        chunks = []
        while True:
            # don't let anybody see this, ever
            chunk = self.sock.recv(1)
            if chunk == b'':
                # eof
                return None

            # not like this
            chunks.append(chunk)
            if pattern in b''.join(chunks):
                break
        return b''.join(chunks)

    def communicate(self, message: bytes) -> int:
        sent = 0
        while sent < len(message):
            sent = self.sock.send(message[sent:])
            if sent == 0:
                raise RuntimeError("socket connection broken")
            sent = sent + sent
        return sent
