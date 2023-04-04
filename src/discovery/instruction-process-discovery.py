#!/usr/bin/env python3
import sys
import io
import stat
import os

basePC = 0x100c
baseRegisterValues = [0x0000, 0x0000, 0x0000, 0x0000]
baseStackValues = (0xFEFA, bytearray(b'\x01\x10L\xf2\x16\xf0\x00\x00\x00\x00\x00\x00'))

def parse_registers(line):
    out = []
    regs = line.split(" ")
    for reg in regs:
        out.append(int(reg[4:], 16))
    return out

def parse_stack(line):
    parts = line.split(" ")
    sp  = int(parts[0][4:], 16)
    top = bytearray.fromhex(parts[1][1:25])
    return (sp, top)

def check_difference_from_base(registers, stack):
    for i in range(0, 4):
        if registers[i] != baseRegisterValues[i]:
            print(f"Instruction changed register R{i}: {format(baseRegisterValues[i], 'X').zfill(4)} -> {format(registers[i], 'X').zfill(4)}")

    if baseStackValues[0] != stack[0]:
        print(f"Instruction changed SP: {format(baseStackValues[0], 'X').zfill(4)} -> {format(stack[0], 'X').zfill(4)}")
    if baseStackValues[1] != stack[1]:
        print(f"Contents of the stack changed!")
        print("Before:", baseStackValues[1])
        print(" After:", stack[1])

def process_valid_instr(fname):
    with open(fname, "r") as f:
        lines = f.readlines()
        newPC = int(lines[0].split(" ")[0][1:], 16)
        offset = newPC - basePC
        print("Instruction size:", offset, "bytes")
        if offset < 0 or offset > 10:
            print("================== WARNING: Suspicious offset detected! Is this a jump instruction? ================== ")
            print("New PC:", format(newPC, 'X').zfill(4))

        registerValues = parse_registers(lines[1])
        print("Registers after instr:", registerValues)
        stackValues = parse_stack(lines[2])
        print("Stack values:", stackValues)
        check_difference_from_base(registerValues, stackValues)

for i in range(0, 0x100):
    fname = f"instrs/instr-100000110000120000130000{format(i, 'X').zfill(2)}00000000.log"
    size = os.lstat(fname)
    if size.st_size == 20:
        print(f"{format(i, 'X').zfill(2)} - INVALID/JUMP")
    elif size.st_size == 91:
        print(f"{format(i, 'X').zfill(2)} - VALID")
        process_valid_instr(fname)
    else:
        print(f"{format(i, 'X').zfill(2)} - UNKNOWN")
    print()

