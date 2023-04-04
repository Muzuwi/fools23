#!/usr/bin/env python3
import io
import subprocess
import sys
import time

cooldown_time = 0.5

for i in range(0, 0x100):
    payload = "10001011001012001013001006" + format(i, 'X') + "00"
    args = [
        "./expectscripts/swi-discovery.sh",
        payload
    ]
    result = subprocess.run(args)
    time.sleep(cooldown_time)
