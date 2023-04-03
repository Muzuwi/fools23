#!/usr/bin/env bash

find . -name "*.PRG" -exec bash -c "python ../../src/disassembler.py {} 0x2000 > {}.ASM" \;


