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

    def expect(self, pattern: bytes, timeout: Optional[float] = None) -> Optional[bytes]:
        if timeout is not None:
            self.sock.setblocking(False)
            self.sock.settimeout(timeout)
        else:
            self.sock.setblocking(True)
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

    def wait_for_monitor_prompt(self):
        _ = self.expect(b'Ready.\n> ')

    """ Monitor helper function, writes the given payload at the specified address
        Obviously assumes the session is currently in the monitor.
    """

    def write_bytes(self, addr: int, payload: bytes):
        if addr > 0xFFFF:
            raise RuntimeError("Invalid address provided, maximum of 0xFFFF allowed")
        self.communicate(b'w\n')

        addr_bytes = format(addr, 'X').zfill(4).encode('ascii')
        _ = self.expect(b'address? ')
        self.communicate(addr_bytes + b'\n')

        _ = self.expect(b'newline:\n')
        for b in payload:
            v = format(b, 'X').zfill(2)
            self.communicate(v.encode('ascii'))
        self.communicate(b'.\n')

        _ = self.expect(b'Ready.\n> ')

    """ Executes code at the specified address.
    """

    def execute_at(self, addr: int):
        self.communicate(b'x\n')

        addr_bytes = format(addr, 'X').zfill(4).encode('ascii')
        _ = self.expect(b'address?')
        self.communicate(addr_bytes + b'\n')

        _ = self.expect(b'Y if so: ')
        self.communicate(b'Y\n')
