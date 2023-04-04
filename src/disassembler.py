import io
import argparse
import sys
import itertools
from typing import *


def read16(rom: bytes, position: int) -> int:
    return rom[position] | (rom[position + 1] << 8)


def readHex16(rom: bytes, position: int) -> str:
    return format(read16(rom, position), 'X').zfill(4)


def checkSwiType(swi: int) -> Optional[str]:
    if swi == 0x0008:
        return "PrintStr"
    elif swi == 0x0010:
        return "StrCmp"
    elif swi == 0x0018:
        return "FindIndex"
    elif swi == 0x0020:
        return "ConvertHex"
    elif swi == 0x0028:
        return "MemCpy"
    elif swi == 0x0030:
        return "ReadStr"
    elif swi == 0x0038:
        return "StrTrim"
    elif swi == 0x0040:
        return "MemSet"
    return None


def decode_instr(rom: bytes, position: int) -> Tuple[int, str]:
    unknown: Tuple[int, str] = (1, f"fixme: unknown opcode {format(rom[position], 'X').zfill(2)}")
    return {
        0x00: (1, "trap"),
        0x01: (3, f"mul r0, ${readHex16(rom, position + 1)}"),
        0x02: (3, f"mul r0, r1"),

        0x03: (3, unknown[1]),

        0x04: (1, "div r0, r1"),
        0x05: (1, "ret"),

        0x06: (2, f"swi {format(rom[position + 1], 'X')}"),
        0x08: (1, unknown[1]),

        0x09: (3, f"mov sp, ${readHex16(rom, position + 1)}"),
        0x0A: (1, "mov r0, sp"),
        0x0B: (1, "mov sp, r0"),

        0x0C: (1, unknown[1]),
        0x0D: (1, " === ILLEGAL OPCODE ==="),

        0x0E: (1, "lsl r0"),
        0x0F: (1, "lsr r0"),
        0x10: (3, f"mov r0, ${readHex16(rom, position + 1)}"),
        0x11: (3, f"mov r1, ${readHex16(rom, position + 1)}"),
        0x12: (3, f"mov r2, ${readHex16(rom, position + 1)}"),
        0x13: (3, f"mov r3, ${readHex16(rom, position + 1)}"),

        0x14: (1, " === ILLEGAL OPCODE ==="),
        0x15: (1, " === ILLEGAL OPCODE ==="),
        0x16: (1, " === ILLEGAL OPCODE ==="),
        0x17: (1, " === ILLEGAL OPCODE ==="),
        0x18: (1, " === ILLEGAL OPCODE ==="),
        0x19: (1, " === ILLEGAL OPCODE ==="),
        0x1A: (1, " === ILLEGAL OPCODE ==="),
        0x1B: (1, " === ILLEGAL OPCODE ==="),
        0x1C: (1, " === ILLEGAL OPCODE ==="),
        0x1D: (1, " === ILLEGAL OPCODE ==="),
        0x1E: (1, " === ILLEGAL OPCODE ==="),
        0x1F: (1, " === ILLEGAL OPCODE ==="),

        0x20: (1, "mov r0, r0"),
        0x21: (1, "mov r0, r1"),
        0x22: (1, "mov r0, r2"),
        0x23: (1, "mov r0, r3"),
        0x24: (1, "mov r1, r0"),
        0x25: (1, "mov r1, r1"),
        0x26: (1, "mov r1, r2"),
        0x27: (1, "mov r1, r3"),
        0x28: (1, "mov r2, r0"),
        0x29: (1, "mov r2, r1"),
        0x2A: (1, "mov r2, r2"),
        0x2B: (1, "mov r2, r3"),
        0x2C: (1, "mov r3, r0"),
        0x2D: (1, "mov r3, r1"),
        0x2E: (1, "mov r3, r2"),
        0x2F: (1, "mov r3, r3"),
        0x30: (1, "add r0, r0"),
        0x31: (1, "add r0, r1"),
        0x32: (1, "add r0, r2"),
        0x33: (1, "add r0, r3"),
        0x34: (1, "add r1, r0"),
        0x35: (1, "add r1, r1"),
        0x36: (1, "add r1, r2"),
        0x37: (1, "add r1, r3"),
        0x38: (1, "add r2, r0"),
        0x39: (1, "add r2, r1"),
        0x3A: (1, "add r2, r2"),
        0x3B: (1, "add r2, r3"),
        0x3C: (1, "add r3, r0"),
        0x3D: (1, "add r3, r1"),
        0x3E: (1, "add r3, r2"),
        0x3F: (1, "add r3, r3"),
        0x40: (1, "mov r0, byte ptr [r0]"),
        0x41: (1, "mov r0, byte ptr [r1]"),
        0x42: (1, "mov r0, byte ptr [r2]"),
        0x43: (1, "mov r0, byte ptr [r3]"),
        0x44: (1, "mov r1, byte ptr [r0]"),
        0x45: (1, "mov r1, byte ptr [r1]"),
        0x46: (1, "mov r1, byte ptr [r2]"),
        0x47: (1, "mov r1, byte ptr [r3]"),
        0x48: (1, "mov r2, byte ptr [r0]"),
        0x49: (1, "mov r2, byte ptr [r1]"),
        0x4A: (1, "mov r2, byte ptr [r2]"),
        0x4B: (1, "mov r2, byte ptr [r3]"),
        0x4C: (1, "mov r3, byte ptr [r0]"),
        0x4D: (1, "mov r3, byte ptr [r1]"),
        0x4E: (1, "mov r3, byte ptr [r2]"),
        0x4F: (1, "mov r3, byte ptr [r3]"),
        0x50: (1, "mov r0, [r0]"),
        0x51: (1, "mov r0, [r1]"),
        0x52: (1, "mov r0, [r2]"),
        0x53: (1, "mov r0, [r3]"),
        0x54: (1, "mov r1, [r0]"),
        0x55: (1, "mov r1, [r1]"),
        0x56: (1, "mov r1, [r2]"),
        0x57: (1, "mov r1, [r3]"),
        0x58: (1, "mov r2, [r0]"),
        0x59: (1, "mov r2, [r1]"),
        0x5A: (1, "mov r2, [r2]"),
        0x5B: (1, "mov r2, [r3]"),
        0x5C: (1, "mov r3, [r0]"),
        0x5D: (1, "mov r3, [r1]"),
        0x5E: (1, "mov r3, [r2]"),
        0x5F: (1, "mov r3, [r3]"),

        0x60: (1, "mov byte ptr [r0], low(r0)"),
        0x61: (1, "mov byte ptr [r0], low(r1)"),
        0x62: (1, "mov byte ptr [r0], low(r2)"),
        0x63: (1, "mov byte ptr [r0], low(r3)"),
        0x64: (1, "mov byte ptr [r1], low(r0)"),
        0x65: (1, "mov byte ptr [r1], low(r1)"),
        0x66: (1, "mov byte ptr [r1], low(r2)"),
        0x67: (1, "mov byte ptr [r1], low(r3)"),
        0x68: (1, "mov byte ptr [r2], low(r0)"),
        0x69: (1, "mov byte ptr [r2], low(r1)"),
        0x6A: (1, "mov byte ptr [r2], low(r2)"),
        0x6B: (1, "mov byte ptr [r2], low(r3)"),
        0x6C: (1, "mov byte ptr [r3], low(r0)"),
        0x6D: (1, "mov byte ptr [r3], low(r1)"),
        0x6E: (1, "mov byte ptr [r3], low(r2)"),
        0x6F: (1, "mov byte ptr [r3], low(r3)"),
        0x70: (1, "mov [r0], r0"),
        0x71: (1, "mov [r0], r1"),
        0x72: (1, "mov [r0], r2"),
        0x73: (1, "mov [r0], r3"),
        0x74: (1, "mov [r1], r0"),
        0x75: (1, "mov [r1], r1"),
        0x76: (1, "mov [r1], r2"),
        0x77: (1, "mov [r1], r3"),
        0x78: (1, "mov [r2], r0"),
        0x79: (1, "mov [r2], r1"),
        0x7A: (1, "mov [r2], r2"),
        0x7B: (1, "mov [r2], r3"),
        0x7C: (1, "mov [r3], r0"),
        0x7D: (1, "mov [r3], r1"),
        0x7E: (1, "mov [r3], r2"),
        0x7F: (1, "mov [r3], r3"),
        0x80: (1, "cmp r0, r0"),
        0x81: (1, "cmp r0, r1"),
        0x82: (1, "cmp r0, r2"),
        0x83: (1, "cmp r0, r3"),
        0x84: (1, "cmp r1, r0"),
        0x85: (1, "cmp r1, r1"),
        0x86: (1, "cmp r1, r2"),
        0x87: (1, "cmp r1, r3"),
        0x88: (1, "cmp r2, r0"),
        0x89: (1, "cmp r2, r1"),
        0x8A: (1, "cmp r2, r2"),
        0x8B: (1, "cmp r2, r3"),
        0x8C: (1, "cmp r3, r0"),
        0x8D: (1, "cmp r3, r1"),
        0x8E: (1, "cmp r3, r2"),
        0x8F: (1, "cmp r3, r3"),

        0x90: (1, "push r0"),
        0x91: (1, "push r1"),
        0x92: (1, "push r2"),
        0x93: (1, "push r3"),
        0x94: (1, "pop r0"),
        0x95: (1, "pop r1"),
        0x96: (1, "pop r2"),
        0x97: (1, "pop r3"),

        0x98: (3, f"jmp ${readHex16(rom, position + 1)}    # <{checkSwiType(read16(rom, position + 1))}>"),
        0x99: (3, f"call ${readHex16(rom, position + 1)}    # <{checkSwiType(read16(rom, position + 1))}>"),
        0x9A: (3, f"jg ${readHex16(rom, position + 1)}"),
        0x9B: (3, f"jl ${readHex16(rom, position + 1)}"),
        0x9C: (3, f"je ${readHex16(rom, position + 1)}"),
        0x9D: (3, f"jne ${readHex16(rom, position + 1)}"),
        0x9E: (3, f"jl ${readHex16(rom, position + 1)}"),  # FIXME: This seems weird for some reason? But it works fine
        0x9F: (3, f"jg ${readHex16(rom, position + 1)}"),  # FIXME: This seems weird for some reason? But it works fine
        0xA0: (3, f"call.eq ${readHex16(rom, position + 1)}"),
        0xA1: (3, f"call.neq ${readHex16(rom, position + 1)}"),
        0xA2: (3, f"cmp r0, ${readHex16(rom, position + 1)}"),
        0xA3: (3, f"cmp r1, ${readHex16(rom, position + 1)}"),
        0xA4: (3, f"cmp r2, ${readHex16(rom, position + 1)}"),
        0xA5: (3, f"cmp r3, ${readHex16(rom, position + 1)}"),
        0xA6: (1, "push sp"),
        0xA7: (1, "push pc"),

        0xA8: (1, "inc r0"),
        0xA9: (1, "inc r1"),
        0xAA: (1, "inc r2"),
        0xAB: (1, "inc r3"),
        0xAC: (1, "dec r0"),
        0xAD: (1, "dec r1"),
        0xAE: (1, "dec r2"),
        0xAF: (1, "dec r3"),
        0xB0: (3, f"mov r0, byte ptr [${readHex16(rom, position + 1)}]"),
        0xB1: (3, f"mov r1, byte ptr [${readHex16(rom, position + 1)}]"),
        0xB2: (3, f"mov r2, byte ptr [${readHex16(rom, position + 1)}]"),
        0xB3: (3, f"mov r3, byte ptr [${readHex16(rom, position + 1)}]"),
        0xB4: (3, f"mov r0, [${readHex16(rom, position + 1)}]"),
        0xB5: (3, f"mov r1, [${readHex16(rom, position + 1)}]"),
        0xB6: (3, f"mov r2, [${readHex16(rom, position + 1)}]"),
        0xB7: (3, f"mov r3, [${readHex16(rom, position + 1)}]"),
        0xB8: (3, f"mov byte ptr [${readHex16(rom, position + 1)}], low(r0)"),
        0xB9: (3, f"mov byte ptr [${readHex16(rom, position + 1)}], low(r0)"),
        0xBA: (3, f"mov byte ptr [${readHex16(rom, position + 1)}], low(r0)"),
        0xBB: (3, f"mov byte ptr [${readHex16(rom, position + 1)}], low(r0)"),
        0xBC: (3, f"mov [${readHex16(rom, position + 1)}], r0"),
        0xBD: (3, f"mov [${readHex16(rom, position + 1)}], r0"),
        0xBE: (3, f"mov [${readHex16(rom, position + 1)}], r0"),
        0xBF: (3, f"mov [${readHex16(rom, position + 1)}], r0"),

        0xC0: (1, unknown[1]),
        0xC1: (1, unknown[1]),
        0xC2: (1, unknown[1]),
        0xC3: (1, unknown[1]),
        0xC4: (1, unknown[1]),
        0xC5: (1, unknown[1]),
        0xC6: (1, unknown[1]),
        0xC7: (1, unknown[1]),
        0xC8: (1, unknown[1]),
        0xC9: (1, "call r0"),
        0xCA: (1, "call r1"),
        0xCB: (1, "call r2"),
        0xCC: (1, "call r3"),
        0xCD: (3, f"and r0, ${readHex16(rom, position + 1)}"),
        0xCE: (3, f"or r0, ${readHex16(rom, position + 1)}"),
        0xCF: (3, f"xor r0, ${readHex16(rom, position + 1)}"),

        0xD0: (1, "and r0, r0"),
        0xD1: (1, "and r0, r1"),
        0xD2: (1, "and r0, r2"),
        0xD3: (1, "and r0, r3"),
        0xD4: (1, "or r0, r0"),
        0xD5: (1, "or r0, r1"),
        0xD6: (1, "or r0, r2"),
        0xD7: (1, "or r0, r3"),
        0xD8: (1, "xor r0, r0"),
        0xD9: (1, "xor r0, r1"),
        0xDA: (1, "xor r0, r2"),
        0xDB: (1, "xor r0, r3"),
        0xDC: (1, unknown[1]),
        0xDD: (1, unknown[1]),
        0xDE: (1, unknown[1]),
        0xDF: (1, unknown[1]),

        0xE0: (3, f"add r0, ${readHex16(rom, position + 1)}"),
        0xE1: (3, f"add r1, ${readHex16(rom, position + 1)}"),
        0xE2: (3, f"add r2, ${readHex16(rom, position + 1)}"),
        0xE3: (3, f"add r3, ${readHex16(rom, position + 1)}"),

        # This is entirely untested and a massive stretch, but...
        0x07: (3, " ==== secret opcode 0x7 ===="),
        0xFC: (3, " ==== secret opcode 0xFC ===="),

    }.get(rom[position], unknown)


def run_disassembly(rom: bytes, baseAddress: int) -> None:
    pc = 0x0

    while pc < len(rom):
        count, label = decode_instr(rom, pc)

        address = format(pc + baseAddress, 'X').zfill(4)
        opBytes = ' '.join(map(lambda v: format(v, 'X').zfill(2), rom[pc:pc + count])).ljust(10)
        print(f"${address}:    {opBytes}    {label}")
        pc += count


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("file", help="File to disassemble", type=str)
    parser.add_argument("base", nargs='?', help="Base address of the file to assume", type=str, default="0x1000")

    args = parser.parse_args()
    baseAddress = int(args.base, 16)

    with open(args.file, "rb") as f:
        fbytes = f.read()
        run_disassembly(fbytes, baseAddress)


if __name__ == '__main__':
    main()
