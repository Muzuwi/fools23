#!/usr/bin/env python3
import io
import subprocess
import sys
import time

cooldown_time = 1.0

for i in range(0, 0x100):
    payload = "100000110000120000130000" + format(i, 'X').zfill(2) + "00000000"
    args = [
            "./expectscripts/execute-at-1000-expect-break.sh",
            payload
            ]
    result = subprocess.run(args)
    time.sleep(cooldown_time)
