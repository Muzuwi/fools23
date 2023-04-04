#!/usr/bin/env python3
import io
import subprocess
import sys
import time

cooldown_time = 0.5

for i in range(0, 0xFF):
    payload = "10000011000012000013000006" + hex(i)
    args = [
            "./expectscripts/execute-addr.sh",
            format(i, 'X').zfill(4)
            ]
    result = subprocess.run(args)
    time.sleep(cooldown_time)
