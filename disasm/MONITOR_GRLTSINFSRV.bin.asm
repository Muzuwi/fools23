;stack canary
$F000:    09 00 FF      mov sp, $FF00
$F003:    06 05         swi 5
$F005:    BC 00 FE      mov [$FE00], r0
$F008:    BC 4F F7      mov [$F74F], r0
$F00B:    06 05         swi 5
$F00D:    BC 02 FE      mov [$FE02], r0
$F010:    BC 51 F7      mov [$F751], r0

; Welcome, name pls
$F013:    12 24 F1      mov r2, $F124
$F016:    99 08 00      call $0008    # <PrintStr>

; read name
$F019:    12 3F F7      mov r2, $F73F
$F01C:    13 0F 00      mov r3, $000F
$F01F:    99 30 00      call $0030    # <ReadStr>
$F022:    12 3F F7      mov r2, $F73F
; bs bs
$F025:    99 38 00      call $0038    # <StrTrim>
$F028:    99 36 F0      call $F036    # <None>

; Welcome
$F02B:    12 75 F2      mov r2, $F275
$F02E:    99 08 00      call $0008    # <PrintStr>
$F031:    06 03         swi 3

$F033:    98 33 F0      jmp $F033    # <None>

; <username>
$F036:    12 98 F1      mov r2, $F198
$F039:    99 08 00      call $0008    # <PrintStr>

$F03C:    12 3F F7      mov r2, $F73F
$F03F:    99 08 00      call $0008    # <PrintStr>
; selection menu strings
$F042:    12 AA F1      mov r2, $F1AA
$F045:    99 08 00      call $0008    # <PrintStr>
; read selection
$F048:    12 53 F7      mov r2, $F753
$F04B:    99 A7 F0      call $F0A7    # <None>
; choice
$F04E:    B0 53 F7      mov r0, byte ptr [$F753]
; if quit, jump to canary check
$F051:    A2 51 00      cmp r0, $0051
$F054:    9C 92 F0      je $F092
$F057:    A2 71 00      cmp r0, $0071
$F05A:    9C 92 F0      je $F092
; 
$F05D:    B0 54 F7      mov r0, byte ptr [$F754]
$F060:    A2 0A 00      cmp r0, $000A
$F063:    9C 6F F0      je $F06F
$F066:    A2 00 00      cmp r0, $0000
$F069:    9C 6F F0      je $F06F
$F06C:    98 86 F0      jmp $F086    # <None>

; char converted to digit (choice)
$F06F:    B3 53 F7      mov r3, byte ptr [$F753]
$F072:    E3 D0 FF      add r3, $FFD0
$F075:    A5 03 00      cmp r3, $0003   ; 3 choices
$F078:    9B 86 F0      jl $F086
$F07B:    3F            add r3, r3      ; pick the right string 
$F07C:    E3 92 F2      add r3, $F292
$F07F:    5B            mov r2, [r3]
$F080:    99 08 00      call $0008    # <PrintStr> 
$F083:    98 36 F0      jmp $F036    # <None>

; wrong choice, dummy
$F086:    12 9A F2      mov r2, $F29A
$F089:    99 08 00      call $0008    # <PrintStr>
$F08C:    13 00 10      mov r3, $1000
$F08F:    98 36 F0      jmp $F036    # <None>

; stack canary check
$F092:    B4 4F F7      mov r0, [$F74F]
$F095:    B5 00 FE      mov r1, [$FE00]
$F098:    81            cmp r0, r1
$F099:    9D D5 F0      jne $F0D5
$F09C:    B4 51 F7      mov r0, [$F751]
$F09F:    B5 02 FE      mov r1, [$FE02]
$F0A2:    81            cmp r0, r1
$F0A3:    9D D5 F0      jne $F0D5
$F0A6:    05            ret

; read chars
$F0A7:    06 02         swi 2
$F0A9:    68            mov byte ptr [r2], low(r0)
$F0AA:    A2 0A 00      cmp r0, $000A   ; immediately after newline, jump to the canary check
$F0AD:    9C BB F0      je $F0BB
$F0B0:    A5 00 00      cmp r3, $0000
$F0B3:    9C B8 F0      je $F0B8
$F0B6:    AA            inc r2
$F0B7:    AF            dec r3
$F0B8:    98 A7 F0      jmp $F0A7    # <None>

; canary check NOW
$F0BB:    AA            inc r2
$F0BC:    10 00 00      mov r0, $0000
$F0BF:    68            mov byte ptr [r2], low(r0)
$F0C0:    B4 4F F7      mov r0, [$F74F]
$F0C3:    B5 00 FE      mov r1, [$FE00]
$F0C6:    81            cmp r0, r1
$F0C7:    9D D5 F0      jne $F0D5
$F0CA:    B4 51 F7      mov r0, [$F751]
$F0CD:    B5 02 FE      mov r1, [$FE02]
$F0D0:    81            cmp r0, r1
$F0D1:    9D D5 F0      jne $F0D5
$F0D4:    05            ret

; stack smashing detected
$F0D5:    12 DD F0      mov r2, $F0DD
$F0D8:    99 08 00      call $0008    # <PrintStr>
$F0DB:    06 03         swi 3

$F0DD:    2A            mov r2, r2
$F0DE:    2A            mov r2, r2
$F0DF:    2A            mov r2, r2
$F0E0:    20            mov r0, r0
$F0E1:    73            mov [r0], r3
$F0E2:    74            mov [r1], r0
$F0E3:    61            mov byte ptr [r0], low(r1)
$F0E4:    63            mov byte ptr [r0], low(r3)
$F0E5:    6B            mov byte ptr [r2], low(r3)
$F0E6:    20            mov r0, r0
$F0E7:    73            mov [r0], r3
$F0E8:    6D            mov byte ptr [r3], low(r1)
$F0E9:    61            mov byte ptr [r0], low(r1)
$F0EA:    73            mov [r0], r3
$F0EB:    68            mov byte ptr [r2], low(r0)
$F0EC:    69            mov byte ptr [r2], low(r1)
$F0ED:    6E            mov byte ptr [r3], low(r2)
$F0EE:    67            mov byte ptr [r1], low(r3)
$F0EF:    20            mov r0, r0
$F0F0:    64            mov byte ptr [r1], low(r0)
$F0F1:    65            mov byte ptr [r1], low(r1)
$F0F2:    74            mov [r1], r0
$F0F3:    65            mov byte ptr [r1], low(r1)
$F0F4:    63            mov byte ptr [r0], low(r3)
$F0F5:    74            mov [r1], r0
$F0F6:    65            mov byte ptr [r1], low(r1)
$F0F7:    64            mov byte ptr [r1], low(r0)
$F0F8:    20            mov r0, r0
$F0F9:    2A            mov r2, r2
$F0FA:    2A            mov r2, r2
$F0FB:    2A            mov r2, r2
$F0FC:    20            mov r0, r0
$F0FD:    F1            fixme: unknown opcode F1
$F0FE:    00            trap
$F0FF:    FE            fixme: unknown opcode FE
$F100:    F1            fixme: unknown opcode F1
$F101:    01 FE F1      mul r0, $F1FE
$F104:    02 FE F1      mul r0, r1
$F107:    03 FE 20      fixme: unknown opcode 03
$F10A:    21            mov r0, r1
$F10B:    3D            add r3, r1
$F10C:    20            mov r0, r0
$F10D:    F1            fixme: unknown opcode F1
$F10E:    4F            mov r3, byte ptr [r3]
$F10F:    F7            fixme: unknown opcode F7
$F110:    F1            fixme: unknown opcode F1
$F111:    50            mov r0, [r0]
$F112:    F7            fixme: unknown opcode F7
$F113:    F1            fixme: unknown opcode F1
$F114:    51            mov r0, [r1]
$F115:    F7            fixme: unknown opcode F7
$F116:    F1            fixme: unknown opcode F1
$F117:    52            mov r0, [r2]
$F118:    F7            fixme: unknown opcode F7
$F119:    20            mov r0, r0
$F11A:    2D            mov r3, r1
$F11B:    20            mov r0, r0
$F11C:    68            mov byte ptr [r2], low(r0)
$F11D:    61            mov byte ptr [r0], low(r1)
$F11E:    6C            mov byte ptr [r3], low(r0)
$F11F:    74            mov [r1], r0
$F120:    65            mov byte ptr [r1], low(r1)
$F121:    64            mov byte ptr [r1], low(r0)
$F122:    0A            mov r0, sp
$F123:    00            trap
$F124:    57            mov r1, [r3]
$F125:    65            mov byte ptr [r1], low(r1)
$F126:    6C            mov byte ptr [r3], low(r0)
$F127:    63            mov byte ptr [r0], low(r3)
$F128:    6F            mov byte ptr [r3], low(r3)
$F129:    6D            mov byte ptr [r3], low(r1)
$F12A:    65            mov byte ptr [r1], low(r1)
$F12B:    20            mov r0, r0
$F12C:    74            mov [r1], r0
$F12D:    6F            mov byte ptr [r3], low(r3)
$F12E:    20            mov r0, r0
$F12F:    47            mov r1, byte ptr [r3]
$F130:    6C            mov byte ptr [r3], low(r0)
$F131:    69            mov byte ptr [r2], low(r1)
$F132:    74            mov [r1], r0
$F133:    63            mov byte ptr [r0], low(r3)
$F134:    68            mov byte ptr [r2], low(r0)
$F135:    20            mov r0, r0
$F136:    52            mov r0, [r2]
$F137:    65            mov byte ptr [r1], low(r1)
$F138:    73            mov [r0], r3
$F139:    65            mov byte ptr [r1], low(r1)
$F13A:    61            mov byte ptr [r0], low(r1)
$F13B:    72            mov [r0], r2
$F13C:    63            mov byte ptr [r0], low(r3)
$F13D:    68            mov byte ptr [r2], low(r0)
$F13E:    20            mov r0, r0
$F13F:    4C            mov r3, byte ptr [r0]
$F140:    61            mov byte ptr [r0], low(r1)
$F141:    62            mov byte ptr [r0], low(r2)
$F142:    20            mov r0, r0
$F143:    49            mov r2, byte ptr [r1]
$F144:    6E            mov byte ptr [r3], low(r2)
$F145:    66            mov byte ptr [r1], low(r2)
$F146:    6F            mov byte ptr [r3], low(r3)
$F147:    72            mov [r0], r2
$F148:    6D            mov byte ptr [r3], low(r1)
$F149:    61            mov byte ptr [r0], low(r1)
$F14A:    74            mov [r1], r0
$F14B:    69            mov byte ptr [r2], low(r1)
$F14C:    6F            mov byte ptr [r3], low(r3)
$F14D:    6E            mov byte ptr [r3], low(r2)
$F14E:    20            mov r0, r0
$F14F:    53            mov r0, [r3]
$F150:    65            mov byte ptr [r1], low(r1)
$F151:    72            mov [r0], r2
$F152:    76            mov [r1], r2
$F153:    65            mov byte ptr [r1], low(r1)
$F154:    72            mov [r0], r2
$F155:    20            mov r0, r0
$F156:    28            mov r2, r0
$F157:    47            mov r1, byte ptr [r3]
$F158:    52            mov r0, [r2]
$F159:    4C            mov r3, byte ptr [r0]
$F15A:    49            mov r2, byte ptr [r1]
$F15B:    4E            mov r3, byte ptr [r2]
$F15C:    46            mov r1, byte ptr [r2]
$F15D:    53            mov r0, [r3]
$F15E:    52            mov r0, [r2]
$F15F:    56            mov r1, [r2]
$F160:    29            mov r2, r1
$F161:    0A            mov r0, sp
$F162:    45            mov r1, byte ptr [r1]
$F163:    6E            mov byte ptr [r3], low(r2)
$F164:    74            mov [r1], r0
$F165:    65            mov byte ptr [r1], low(r1)
$F166:    72            mov [r0], r2
$F167:    20            mov r0, r0
$F168:    79            mov [r2], r1
$F169:    6F            mov byte ptr [r3], low(r3)
$F16A:    75            mov [r1], r1
$F16B:    72            mov [r0], r2
$F16C:    20            mov r0, r0
$F16D:    6E            mov byte ptr [r3], low(r2)
$F16E:    61            mov byte ptr [r0], low(r1)
$F16F:    6D            mov byte ptr [r3], low(r1)
$F170:    65            mov byte ptr [r1], low(r1)
$F171:    20            mov r0, r0
$F172:    66            mov byte ptr [r1], low(r2)
$F173:    6F            mov byte ptr [r3], low(r3)
$F174:    72            mov [r0], r2
$F175:    20            mov r0, r0
$F176:    6F            mov byte ptr [r3], low(r3)
$F177:    75            mov [r1], r1
$F178:    72            mov [r0], r2
$F179:    20            mov r0, r0
$F17A:    72            mov [r0], r2
$F17B:    65            mov byte ptr [r1], low(r1)
$F17C:    63            mov byte ptr [r0], low(r3)
$F17D:    6F            mov byte ptr [r3], low(r3)
$F17E:    72            mov [r0], r2
$F17F:    64            mov byte ptr [r1], low(r0)
$F180:    73            mov [r0], r3
$F181:    20            mov r0, r0
$F182:    28            mov r2, r0
$F183:    6D            mov byte ptr [r3], low(r1)
$F184:    61            mov byte ptr [r0], low(r1)
$F185:    78            mov [r2], r0
$F186:    20            mov r0, r0
$F187:    31            add r0, r1
$F188:    35            add r1, r1
$F189:    20            mov r0, r0
$F18A:    63            mov byte ptr [r0], low(r3)
$F18B:    68            mov byte ptr [r2], low(r0)
$F18C:    61            mov byte ptr [r0], low(r1)
$F18D:    72            mov [r0], r2
$F18E:    61            mov byte ptr [r0], low(r1)
$F18F:    63            mov byte ptr [r0], low(r3)
$F190:    74            mov [r1], r0
$F191:    65            mov byte ptr [r1], low(r1)
$F192:    72            mov [r0], r2
$F193:    73            mov [r0], r3
$F194:    29            mov r2, r1
$F195:    3A            add r2, r2
$F196:    20            mov r0, r0
$F197:    00            trap
$F198:    0A            mov r0, sp
$F199:    2D            mov r3, r1
$F19A:    2D            mov r3, r1
$F19B:    2D            mov r3, r1
$F19C:    2D            mov r3, r1
$F19D:    2D            mov r3, r1
$F19E:    0A            mov r0, sp
$F19F:    0A            mov r0, sp
$F1A0:    57            mov r1, [r3]
$F1A1:    65            mov byte ptr [r1], low(r1)
$F1A2:    6C            mov byte ptr [r3], low(r0)
$F1A3:    63            mov byte ptr [r0], low(r3)
$F1A4:    6F            mov byte ptr [r3], low(r3)
$F1A5:    6D            mov byte ptr [r3], low(r1)
$F1A6:    65            mov byte ptr [r1], low(r1)
$F1A7:    2C            mov r3, r0
$F1A8:    20            mov r0, r0
$F1A9:    00            trap
$F1AA:    21            mov r0, r1
$F1AB:    0A            mov r0, sp
$F1AC:    0A            mov r0, sp
$F1AD:    53            mov r0, [r3]
$F1AE:    65            mov byte ptr [r1], low(r1)
$F1AF:    6C            mov byte ptr [r3], low(r0)
$F1B0:    65            mov byte ptr [r1], low(r1)
$F1B1:    63            mov byte ptr [r0], low(r3)
$F1B2:    74            mov [r1], r0
$F1B3:    69            mov byte ptr [r2], low(r1)
$F1B4:    6F            mov byte ptr [r3], low(r3)
$F1B5:    6E            mov byte ptr [r3], low(r2)
$F1B6:    20            mov r0, r0
$F1B7:    6F            mov byte ptr [r3], low(r3)
$F1B8:    66            mov byte ptr [r1], low(r2)
$F1B9:    20            mov r0, r0
$F1BA:    74            mov [r1], r0
$F1BB:    6F            mov byte ptr [r3], low(r3)
$F1BC:    70            mov [r0], r0
$F1BD:    69            mov byte ptr [r2], low(r1)
$F1BE:    63            mov byte ptr [r0], low(r3)
$F1BF:    73            mov [r0], r3
$F1C0:    3A            add r2, r2
$F1C1:    0A            mov r0, sp
$F1C2:    28            mov r2, r0
$F1C3:    31            add r0, r1
$F1C4:    29            mov r2, r1
$F1C5:    20            mov r0, r0
$F1C6:    41            mov r0, byte ptr [r1]
$F1C7:    62            mov byte ptr [r0], low(r2)
$F1C8:    6F            mov byte ptr [r3], low(r3)
$F1C9:    75            mov [r1], r1
$F1CA:    74            mov [r1], r0
$F1CB:    20            mov r0, r0
$F1CC:    74            mov [r1], r0
$F1CD:    68            mov byte ptr [r2], low(r0)
$F1CE:    65            mov byte ptr [r1], low(r1)
$F1CF:    20            mov r0, r0
$F1D0:    47            mov r1, byte ptr [r3]
$F1D1:    6C            mov byte ptr [r3], low(r0)
$F1D2:    69            mov byte ptr [r2], low(r1)
$F1D3:    74            mov [r1], r0
$F1D4:    63            mov byte ptr [r0], low(r3)
$F1D5:    68            mov byte ptr [r2], low(r0)
$F1D6:    20            mov r0, r0
$F1D7:    52            mov r0, [r2]
$F1D8:    65            mov byte ptr [r1], low(r1)
$F1D9:    73            mov [r0], r3
$F1DA:    65            mov byte ptr [r1], low(r1)
$F1DB:    61            mov byte ptr [r0], low(r1)
$F1DC:    72            mov [r0], r2
$F1DD:    63            mov byte ptr [r0], low(r3)
$F1DE:    68            mov byte ptr [r2], low(r0)
$F1DF:    20            mov r0, r0
$F1E0:    4C            mov r3, byte ptr [r0]
$F1E1:    61            mov byte ptr [r0], low(r1)
$F1E2:    62            mov byte ptr [r0], low(r2)
$F1E3:    6F            mov byte ptr [r3], low(r3)
$F1E4:    72            mov [r0], r2
$F1E5:    61            mov byte ptr [r0], low(r1)
$F1E6:    74            mov [r1], r0
$F1E7:    6F            mov byte ptr [r3], low(r3)
$F1E8:    72            mov [r0], r2
$F1E9:    79            mov [r2], r1
$F1EA:    0A            mov r0, sp
$F1EB:    28            mov r2, r0
$F1EC:    32            add r0, r2
$F1ED:    29            mov r2, r1
$F1EE:    20            mov r0, r0
$F1EF:    41            mov r0, byte ptr [r1]
$F1F0:    62            mov byte ptr [r0], low(r2)
$F1F1:    6F            mov byte ptr [r3], low(r3)
$F1F2:    75            mov [r1], r1
$F1F3:    74            mov [r1], r0
$F1F4:    20            mov r0, r0
$F1F5:    74            mov [r1], r0
$F1F6:    68            mov byte ptr [r2], low(r0)
$F1F7:    65            mov byte ptr [r1], low(r1)
$F1F8:    20            mov r0, r0
$F1F9:    47            mov r1, byte ptr [r3]
$F1FA:    4C            mov r3, byte ptr [r0]
$F1FB:    56            mov r1, [r2]
$F1FC:    4D            mov r3, byte ptr [r1]
$F1FD:    20            mov r0, r0
$F1FE:    74            mov [r1], r0
$F1FF:    65            mov byte ptr [r1], low(r1)
$F200:    73            mov [r0], r3
$F201:    74            mov [r1], r0
$F202:    20            mov r0, r0
$F203:    73            mov [r0], r3
$F204:    65            mov byte ptr [r1], low(r1)
$F205:    72            mov [r0], r2
$F206:    76            mov [r1], r2
$F207:    65            mov byte ptr [r1], low(r1)
$F208:    72            mov [r0], r2
$F209:    73            mov [r0], r3
$F20A:    0A            mov r0, sp
$F20B:    28            mov r2, r0
$F20C:    33            add r0, r3
$F20D:    29            mov r2, r1
$F20E:    20            mov r0, r0
$F20F:    41            mov r0, byte ptr [r1]
$F210:    62            mov byte ptr [r0], low(r2)
$F211:    6F            mov byte ptr [r3], low(r3)
$F212:    75            mov [r1], r1
$F213:    74            mov [r1], r0
$F214:    20            mov r0, r0
$F215:    74            mov [r1], r0
$F216:    68            mov byte ptr [r2], low(r0)
$F217:    65            mov byte ptr [r1], low(r1)
$F218:    20            mov r0, r0
$F219:    46            mov r1, byte ptr [r2]
$F21A:    69            mov byte ptr [r2], low(r1)
$F21B:    67            mov byte ptr [r1], low(r3)
$F21C:    68            mov byte ptr [r2], low(r0)
$F21D:    74            mov [r1], r0
$F21E:    20            mov r0, r0
$F21F:    53            mov r0, [r3]
$F220:    69            mov byte ptr [r2], low(r1)
$F221:    6D            mov byte ptr [r3], low(r1)
$F222:    75            mov [r1], r1
$F223:    6C            mov byte ptr [r3], low(r0)
$F224:    61            mov byte ptr [r0], low(r1)
$F225:    74            mov [r1], r0
$F226:    69            mov byte ptr [r2], low(r1)
$F227:    6F            mov byte ptr [r3], low(r3)
$F228:    6E            mov byte ptr [r3], low(r2)
$F229:    20            mov r0, r0
$F22A:    50            mov r0, [r0]
$F22B:    72            mov [r0], r2
$F22C:    6F            mov byte ptr [r3], low(r3)
$F22D:    67            mov byte ptr [r1], low(r3)
$F22E:    72            mov [r0], r2
$F22F:    61            mov byte ptr [r0], low(r1)
$F230:    6D            mov byte ptr [r3], low(r1)
$F231:    0A            mov r0, sp
$F232:    0A            mov r0, sp
$F233:    45            mov r1, byte ptr [r1]
$F234:    6E            mov byte ptr [r3], low(r2)
$F235:    74            mov [r1], r0
$F236:    65            mov byte ptr [r1], low(r1)
$F237:    72            mov [r0], r2
$F238:    20            mov r0, r0
$F239:    74            mov [r1], r0
$F23A:    68            mov byte ptr [r2], low(r0)
$F23B:    65            mov byte ptr [r1], low(r1)
$F23C:    20            mov r0, r0
$F23D:    6E            mov byte ptr [r3], low(r2)
$F23E:    75            mov [r1], r1
$F23F:    6D            mov byte ptr [r3], low(r1)
$F240:    62            mov byte ptr [r0], low(r2)
$F241:    65            mov byte ptr [r1], low(r1)
$F242:    72            mov [r0], r2
$F243:    20            mov r0, r0
$F244:    6F            mov byte ptr [r3], low(r3)
$F245:    66            mov byte ptr [r1], low(r2)
$F246:    20            mov r0, r0
$F247:    74            mov [r1], r0
$F248:    68            mov byte ptr [r2], low(r0)
$F249:    65            mov byte ptr [r1], low(r1)
$F24A:    20            mov r0, r0
$F24B:    74            mov [r1], r0
$F24C:    6F            mov byte ptr [r3], low(r3)
$F24D:    70            mov [r0], r0
$F24E:    69            mov byte ptr [r2], low(r1)
$F24F:    63            mov byte ptr [r0], low(r3)
$F250:    20            mov r0, r0
$F251:    79            mov [r2], r1
$F252:    6F            mov byte ptr [r3], low(r3)
$F253:    75            mov [r1], r1
$F254:    20            mov r0, r0
$F255:    77            mov [r1], r3
$F256:    69            mov byte ptr [r2], low(r1)
$F257:    73            mov [r0], r3
$F258:    68            mov byte ptr [r2], low(r0)
$F259:    20            mov r0, r0
$F25A:    74            mov [r1], r0
$F25B:    6F            mov byte ptr [r3], low(r3)
$F25C:    20            mov r0, r0
$F25D:    76            mov [r1], r2
$F25E:    69            mov byte ptr [r2], low(r1)
$F25F:    65            mov byte ptr [r1], low(r1)
$F260:    77            mov [r1], r3
$F261:    2C            mov r3, r0
$F262:    20            mov r0, r0
$F263:    6F            mov byte ptr [r3], low(r3)
$F264:    72            mov [r0], r2
$F265:    20            mov r0, r0
$F266:    27            mov r1, r3
$F267:    71            mov [r0], r1
$F268:    27            mov r1, r3
$F269:    20            mov r0, r0
$F26A:    74            mov [r1], r0
$F26B:    6F            mov byte ptr [r3], low(r3)
$F26C:    20            mov r0, r0
$F26D:    6C            mov byte ptr [r3], low(r0)
$F26E:    65            mov byte ptr [r1], low(r1)
$F26F:    61            mov byte ptr [r0], low(r1)
$F270:    76            mov [r1], r2
$F271:    65            mov byte ptr [r1], low(r1)
$F272:    3A            add r2, r2
$F273:    20            mov r0, r0
$F274:    00            trap
$F275:    54            mov r1, [r0]
$F276:    68            mov byte ptr [r2], low(r0)
$F277:    61            mov byte ptr [r0], low(r1)
$F278:    6E            mov byte ptr [r3], low(r2)
$F279:    6B            mov byte ptr [r2], low(r3)
$F27A:    20            mov r0, r0
$F27B:    79            mov [r2], r1
$F27C:    6F            mov byte ptr [r3], low(r3)
$F27D:    75            mov [r1], r1
$F27E:    2E            mov r3, r2
$F27F:    20            mov r0, r0
$F280:    48            mov r2, byte ptr [r0]
$F281:    61            mov byte ptr [r0], low(r1)
$F282:    76            mov [r1], r2
$F283:    65            mov byte ptr [r1], low(r1)
$F284:    20            mov r0, r0
$F285:    61            mov byte ptr [r0], low(r1)
$F286:    20            mov r0, r0
$F287:    6E            mov byte ptr [r3], low(r2)
$F288:    69            mov byte ptr [r2], low(r1)
$F289:    63            mov byte ptr [r0], low(r3)
$F28A:    65            mov byte ptr [r1], low(r1)
$F28B:    20            mov r0, r0
$F28C:    64            mov byte ptr [r1], low(r0)
$F28D:    61            mov byte ptr [r0], low(r1)
$F28E:    79            mov [r2], r1
$F28F:    21            mov r0, r1
$F290:    0A            mov r0, sp
$F291:    00            trap
$F292:    9A F2 B9      jg $B9F2
$F295:    F2            fixme: unknown opcode F2
$F296:    9A F3 42      jg $42F3
$F299:    F5            fixme: unknown opcode F5
$F29A:    50            mov r0, [r0]
$F29B:    6C            mov byte ptr [r3], low(r0)
$F29C:    65            mov byte ptr [r1], low(r1)
$F29D:    61            mov byte ptr [r0], low(r1)
$F29E:    73            mov [r0], r3
$F29F:    65            mov byte ptr [r1], low(r1)
$F2A0:    20            mov r0, r0
$F2A1:    74            mov [r1], r0
$F2A2:    79            mov [r2], r1
$F2A3:    70            mov [r0], r0
$F2A4:    65            mov byte ptr [r1], low(r1)
$F2A5:    20            mov r0, r0
$F2A6:    31            add r0, r1
$F2A7:    2C            mov r3, r0
$F2A8:    20            mov r0, r0
$F2A9:    32            add r0, r2
$F2AA:    20            mov r0, r0
$F2AB:    6F            mov byte ptr [r3], low(r3)
$F2AC:    72            mov [r0], r2
$F2AD:    20            mov r0, r0
$F2AE:    33            add r0, r3
$F2AF:    2C            mov r3, r0
$F2B0:    20            mov r0, r0
$F2B1:    64            mov byte ptr [r1], low(r0)
$F2B2:    75            mov [r1], r1
$F2B3:    6D            mov byte ptr [r3], low(r1)
$F2B4:    6D            mov byte ptr [r3], low(r1)
$F2B5:    79            mov [r2], r1
$F2B6:    21            mov r0, r1
$F2B7:    0A            mov r0, sp
$F2B8:    00            trap
$F2B9:    0A            mov r0, sp
$F2BA:    2D            mov r3, r1
$F2BB:    2D            mov r3, r1
$F2BC:    2D            mov r3, r1
$F2BD:    2D            mov r3, r1
$F2BE:    2D            mov r3, r1
$F2BF:    0A            mov r0, sp
$F2C0:    0A            mov r0, sp
$F2C1:    47            mov r1, byte ptr [r3]
$F2C2:    6C            mov byte ptr [r3], low(r0)
$F2C3:    69            mov byte ptr [r2], low(r1)
$F2C4:    74            mov [r1], r0
$F2C5:    63            mov byte ptr [r0], low(r3)
$F2C6:    68            mov byte ptr [r2], low(r0)
$F2C7:    20            mov r0, r0
$F2C8:    52            mov r0, [r2]
$F2C9:    65            mov byte ptr [r1], low(r1)
$F2CA:    73            mov [r0], r3
$F2CB:    65            mov byte ptr [r1], low(r1)
$F2CC:    61            mov byte ptr [r0], low(r1)
$F2CD:    72            mov [r0], r2
$F2CE:    63            mov byte ptr [r0], low(r3)
$F2CF:    68            mov byte ptr [r2], low(r0)
$F2D0:    20            mov r0, r0
$F2D1:    4C            mov r3, byte ptr [r0]
$F2D2:    61            mov byte ptr [r0], low(r1)
$F2D3:    62            mov byte ptr [r0], low(r2)
$F2D4:    6F            mov byte ptr [r3], low(r3)
$F2D5:    72            mov [r0], r2
$F2D6:    61            mov byte ptr [r0], low(r1)
$F2D7:    74            mov [r1], r0
$F2D8:    6F            mov byte ptr [r3], low(r3)
$F2D9:    72            mov [r0], r2
$F2DA:    79            mov [r2], r1
$F2DB:    20            mov r0, r0
$F2DC:    69            mov byte ptr [r2], low(r1)
$F2DD:    73            mov [r0], r3
$F2DE:    20            mov r0, r0
$F2DF:    74            mov [r1], r0
$F2E0:    68            mov byte ptr [r2], low(r0)
$F2E1:    65            mov byte ptr [r1], low(r1)
$F2E2:    20            mov r0, r0
$F2E3:    6C            mov byte ptr [r3], low(r0)
$F2E4:    65            mov byte ptr [r1], low(r1)
$F2E5:    61            mov byte ptr [r0], low(r1)
$F2E6:    64            mov byte ptr [r1], low(r0)
$F2E7:    69            mov byte ptr [r2], low(r1)
$F2E8:    6E            mov byte ptr [r3], low(r2)
$F2E9:    67            mov byte ptr [r1], low(r3)
$F2EA:    20            mov r0, r0
$F2EB:    67            mov byte ptr [r1], low(r3)
$F2EC:    6C            mov byte ptr [r3], low(r0)
$F2ED:    69            mov byte ptr [r2], low(r1)
$F2EE:    74            mov [r1], r0
$F2EF:    63            mov byte ptr [r0], low(r3)
$F2F0:    68            mov byte ptr [r2], low(r0)
$F2F1:    6F            mov byte ptr [r3], low(r3)
$F2F2:    6C            mov byte ptr [r3], low(r0)
$F2F3:    6F            mov byte ptr [r3], low(r3)
$F2F4:    67            mov byte ptr [r1], low(r3)
$F2F5:    79            mov [r2], r1
$F2F6:    20            mov r0, r0
$F2F7:    72            mov [r0], r2
$F2F8:    65            mov byte ptr [r1], low(r1)
$F2F9:    73            mov [r0], r3
$F2FA:    65            mov byte ptr [r1], low(r1)
$F2FB:    61            mov byte ptr [r0], low(r1)
$F2FC:    72            mov [r0], r2
$F2FD:    63            mov byte ptr [r0], low(r3)
$F2FE:    68            mov byte ptr [r2], low(r0)
$F2FF:    0A            mov r0, sp
$F300:    66            mov byte ptr [r1], low(r2)
$F301:    61            mov byte ptr [r0], low(r1)
$F302:    63            mov byte ptr [r0], low(r3)
$F303:    69            mov byte ptr [r2], low(r1)
$F304:    6C            mov byte ptr [r3], low(r0)
$F305:    69            mov byte ptr [r2], low(r1)
$F306:    74            mov [r1], r0
$F307:    79            mov [r2], r1
$F308:    20            mov r0, r0
$F309:    69            mov byte ptr [r2], low(r1)
$F30A:    6E            mov byte ptr [r3], low(r2)
$F30B:    20            mov r0, r0
$F30C:    61            mov byte ptr [r0], low(r1)
$F30D:    6C            mov byte ptr [r3], low(r0)
$F30E:    6C            mov byte ptr [r3], low(r0)
$F30F:    20            mov r0, r0
$F310:    6F            mov byte ptr [r3], low(r3)
$F311:    66            mov byte ptr [r1], low(r2)
$F312:    20            mov r0, r0
$F313:    47            mov r1, byte ptr [r3]
$F314:    6C            mov byte ptr [r3], low(r0)
$F315:    69            mov byte ptr [r2], low(r1)
$F316:    74            mov [r1], r0
$F317:    63            mov byte ptr [r0], low(r3)
$F318:    68            mov byte ptr [r2], low(r0)
$F319:    20            mov r0, r0
$F31A:    49            mov r2, byte ptr [r1]
$F31B:    73            mov [r0], r3
$F31C:    6C            mov byte ptr [r3], low(r0)
$F31D:    61            mov byte ptr [r0], low(r1)
$F31E:    6E            mov byte ptr [r3], low(r2)
$F31F:    64            mov byte ptr [r1], low(r0)
$F320:    73            mov [r0], r3
$F321:    2E            mov r3, r2
$F322:    20            mov r0, r0
$F323:    57            mov r1, [r3]
$F324:    65            mov byte ptr [r1], low(r1)
$F325:    20            mov r0, r0
$F326:    73            mov [r0], r3
$F327:    70            mov [r0], r0
$F328:    65            mov byte ptr [r1], low(r1)
$F329:    63            mov byte ptr [r0], low(r3)
$F32A:    69            mov byte ptr [r2], low(r1)
$F32B:    61            mov byte ptr [r0], low(r1)
$F32C:    6C            mov byte ptr [r3], low(r0)
$F32D:    69            mov byte ptr [r2], low(r1)
$F32E:    7A            mov [r2], r2
$F32F:    65            mov byte ptr [r1], low(r1)
$F330:    20            mov r0, r0
$F331:    69            mov byte ptr [r2], low(r1)
$F332:    6E            mov byte ptr [r3], low(r2)
$F333:    20            mov r0, r0
$F334:    72            mov [r0], r2
$F335:    65            mov byte ptr [r1], low(r1)
$F336:    73            mov [r0], r3
$F337:    65            mov byte ptr [r1], low(r1)
$F338:    61            mov byte ptr [r0], low(r1)
$F339:    72            mov [r0], r2
$F33A:    63            mov byte ptr [r0], low(r3)
$F33B:    68            mov byte ptr [r2], low(r0)
$F33C:    20            mov r0, r0
$F33D:    6F            mov byte ptr [r3], low(r3)
$F33E:    66            mov byte ptr [r1], low(r2)
$F33F:    0A            mov r0, sp
$F340:    76            mov [r1], r2
$F341:    61            mov byte ptr [r0], low(r1)
$F342:    72            mov [r0], r2
$F343:    69            mov byte ptr [r2], low(r1)
$F344:    6F            mov byte ptr [r3], low(r3)
$F345:    75            mov [r1], r1
$F346:    73            mov [r0], r3
$F347:    20            mov r0, r0
$F348:    67            mov byte ptr [r1], low(r3)
$F349:    6C            mov byte ptr [r3], low(r0)
$F34A:    69            mov byte ptr [r2], low(r1)
$F34B:    74            mov [r1], r0
$F34C:    63            mov byte ptr [r0], low(r3)
$F34D:    68            mov byte ptr [r2], low(r0)
$F34E:    20            mov r0, r0
$F34F:    70            mov [r0], r0
$F350:    68            mov byte ptr [r2], low(r0)
$F351:    65            mov byte ptr [r1], low(r1)
$F352:    6E            mov byte ptr [r3], low(r2)
$F353:    6F            mov byte ptr [r3], low(r3)
$F354:    6D            mov byte ptr [r3], low(r1)
$F355:    65            mov byte ptr [r1], low(r1)
$F356:    6E            mov byte ptr [r3], low(r2)
$F357:    61            mov byte ptr [r0], low(r1)
$F358:    20            mov r0, r0
$F359:    65            mov byte ptr [r1], low(r1)
$F35A:    78            mov [r2], r0
$F35B:    69            mov byte ptr [r2], low(r1)
$F35C:    73            mov [r0], r3
$F35D:    74            mov [r1], r0
$F35E:    69            mov byte ptr [r2], low(r1)
$F35F:    6E            mov byte ptr [r3], low(r2)
$F360:    67            mov byte ptr [r1], low(r3)
$F361:    20            mov r0, r0
$F362:    69            mov byte ptr [r2], low(r1)
$F363:    6E            mov byte ptr [r3], low(r2)
$F364:    20            mov r0, r0
$F365:    47            mov r1, byte ptr [r3]
$F366:    6C            mov byte ptr [r3], low(r0)
$F367:    69            mov byte ptr [r2], low(r1)
$F368:    74            mov [r1], r0
$F369:    63            mov byte ptr [r0], low(r3)
$F36A:    68            mov byte ptr [r2], low(r0)
$F36B:    20            mov r0, r0
$F36C:    49            mov r2, byte ptr [r1]
$F36D:    73            mov [r0], r3
$F36E:    6C            mov byte ptr [r3], low(r0)
$F36F:    61            mov byte ptr [r0], low(r1)
$F370:    6E            mov byte ptr [r3], low(r2)
$F371:    64            mov byte ptr [r1], low(r0)
$F372:    73            mov [r0], r3
$F373:    20            mov r0, r0
$F374:    61            mov byte ptr [r0], low(r1)
$F375:    6E            mov byte ptr [r3], low(r2)
$F376:    64            mov byte ptr [r1], low(r0)
$F377:    20            mov r0, r0
$F378:    69            mov byte ptr [r2], low(r1)
$F379:    6E            mov byte ptr [r3], low(r2)
$F37A:    20            mov r0, r0
$F37B:    61            mov byte ptr [r0], low(r1)
$F37C:    6C            mov byte ptr [r3], low(r0)
$F37D:    6C            mov byte ptr [r3], low(r0)
$F37E:    20            mov r0, r0
$F37F:    6F            mov byte ptr [r3], low(r3)
$F380:    66            mov byte ptr [r1], low(r2)
$F381:    0A            mov r0, sp
$F382:    74            mov [r1], r0
$F383:    68            mov byte ptr [r2], low(r0)
$F384:    65            mov byte ptr [r1], low(r1)
$F385:    20            mov r0, r0
$F386:    73            mov [r0], r3
$F387:    75            mov [r1], r1
$F388:    72            mov [r0], r2
$F389:    72            mov [r0], r2
$F38A:    6F            mov byte ptr [r3], low(r3)
$F38B:    75            mov [r1], r1
$F38C:    6E            mov byte ptr [r3], low(r2)
$F38D:    64            mov byte ptr [r1], low(r0)
$F38E:    69            mov byte ptr [r2], low(r1)
$F38F:    6E            mov byte ptr [r3], low(r2)
$F390:    67            mov byte ptr [r1], low(r3)
$F391:    20            mov r0, r0
$F392:    61            mov byte ptr [r0], low(r1)
$F393:    72            mov [r0], r2
$F394:    65            mov byte ptr [r1], low(r1)
$F395:    61            mov byte ptr [r0], low(r1)
$F396:    73            mov [r0], r3
$F397:    2E            mov r3, r2
$F398:    0A            mov r0, sp
$F399:    00            trap
$F39A:    0A            mov r0, sp
$F39B:    2D            mov r3, r1
$F39C:    2D            mov r3, r1
$F39D:    2D            mov r3, r1
$F39E:    2D            mov r3, r1
$F39F:    2D            mov r3, r1
$F3A0:    0A            mov r0, sp
$F3A1:    0A            mov r0, sp
$F3A2:    47            mov r1, byte ptr [r3]
$F3A3:    4C            mov r3, byte ptr [r0]
$F3A4:    56            mov r1, [r2]
$F3A5:    4D            mov r3, byte ptr [r1]
$F3A6:    20            mov r0, r0
$F3A7:    69            mov byte ptr [r2], low(r1)
$F3A8:    73            mov [r0], r3
$F3A9:    20            mov r0, r0
$F3AA:    6F            mov byte ptr [r3], low(r3)
$F3AB:    75            mov [r1], r1
$F3AC:    72            mov [r0], r2
$F3AD:    20            mov r0, r0
$F3AE:    69            mov byte ptr [r2], low(r1)
$F3AF:    6E            mov byte ptr [r3], low(r2)
$F3B0:    6E            mov byte ptr [r3], low(r2)
$F3B1:    6F            mov byte ptr [r3], low(r3)
$F3B2:    76            mov [r1], r2
$F3B3:    61            mov byte ptr [r0], low(r1)
$F3B4:    74            mov [r1], r0
$F3B5:    69            mov byte ptr [r2], low(r1)
$F3B6:    76            mov [r1], r2
$F3B7:    65            mov byte ptr [r1], low(r1)
$F3B8:    2C            mov r3, r0
$F3B9:    20            mov r0, r0
$F3BA:    6E            mov byte ptr [r3], low(r2)
$F3BB:    65            mov byte ptr [r1], low(r1)
$F3BC:    77            mov [r1], r3
$F3BD:    20            mov r0, r0
$F3BE:    6D            mov byte ptr [r3], low(r1)
$F3BF:    61            mov byte ptr [r0], low(r1)
$F3C0:    63            mov byte ptr [r0], low(r3)
$F3C1:    68            mov byte ptr [r2], low(r0)
$F3C2:    69            mov byte ptr [r2], low(r1)
$F3C3:    6E            mov byte ptr [r3], low(r2)
$F3C4:    65            mov byte ptr [r1], low(r1)
$F3C5:    20            mov r0, r0
$F3C6:    61            mov byte ptr [r0], low(r1)
$F3C7:    72            mov [r0], r2
$F3C8:    63            mov byte ptr [r0], low(r3)
$F3C9:    68            mov byte ptr [r2], low(r0)
$F3CA:    69            mov byte ptr [r2], low(r1)
$F3CB:    74            mov [r1], r0
$F3CC:    65            mov byte ptr [r1], low(r1)
$F3CD:    63            mov byte ptr [r0], low(r3)
$F3CE:    74            mov [r1], r0
$F3CF:    75            mov [r1], r1
$F3D0:    72            mov [r0], r2
$F3D1:    65            mov byte ptr [r1], low(r1)
$F3D2:    2C            mov r3, r0
$F3D3:    20            mov r0, r0
$F3D4:    64            mov byte ptr [r1], low(r0)
$F3D5:    65            mov byte ptr [r1], low(r1)
$F3D6:    73            mov [r0], r3
$F3D7:    69            mov byte ptr [r2], low(r1)
$F3D8:    67            mov byte ptr [r1], low(r3)
$F3D9:    6E            mov byte ptr [r3], low(r2)
$F3DA:    65            mov byte ptr [r1], low(r1)
$F3DB:    64            mov byte ptr [r1], low(r0)
$F3DC:    20            mov r0, r0
$F3DD:    74            mov [r1], r0
$F3DE:    6F            mov byte ptr [r3], low(r3)
$F3DF:    20            mov r0, r0
$F3E0:    62            mov byte ptr [r0], low(r2)
$F3E1:    72            mov [r0], r2
$F3E2:    69            mov byte ptr [r2], low(r1)
$F3E3:    6E            mov byte ptr [r3], low(r2)
$F3E4:    67            mov byte ptr [r1], low(r3)
$F3E5:    0A            mov r0, sp
$F3E6:    74            mov [r1], r0
$F3E7:    68            mov byte ptr [r2], low(r0)
$F3E8:    65            mov byte ptr [r1], low(r1)
$F3E9:    20            mov r0, r0
$F3EA:    65            mov byte ptr [r1], low(r1)
$F3EB:    61            mov byte ptr [r0], low(r1)
$F3EC:    73            mov [r0], r3
$F3ED:    65            mov byte ptr [r1], low(r1)
$F3EE:    20            mov r0, r0
$F3EF:    6F            mov byte ptr [r3], low(r3)
$F3F0:    66            mov byte ptr [r1], low(r2)
$F3F1:    20            mov r0, r0
$F3F2:    5A            mov r2, [r2]
$F3F3:    38            add r2, r0
$F3F4:    30            add r0, r0
$F3F5:    20            mov r0, r0
$F3F6:    61            mov byte ptr [r0], low(r1)
$F3F7:    73            mov [r0], r3
$F3F8:    73            mov [r0], r3
$F3F9:    65            mov byte ptr [r1], low(r1)
$F3FA:    6D            mov byte ptr [r3], low(r1)
$F3FB:    62            mov byte ptr [r0], low(r2)
$F3FC:    6C            mov byte ptr [r3], low(r0)
$F3FD:    79            mov [r2], r1
$F3FE:    20            mov r0, r0
$F3FF:    70            mov [r0], r0
$F400:    72            mov [r0], r2
$F401:    6F            mov byte ptr [r3], low(r3)
$F402:    67            mov byte ptr [r1], low(r3)
$F403:    72            mov [r0], r2
$F404:    61            mov byte ptr [r0], low(r1)
$F405:    6D            mov byte ptr [r3], low(r1)
$F406:    6D            mov byte ptr [r3], low(r1)
$F407:    69            mov byte ptr [r2], low(r1)
$F408:    6E            mov byte ptr [r3], low(r2)
$F409:    67            mov byte ptr [r1], low(r3)
$F40A:    20            mov r0, r0
$F40B:    74            mov [r1], r0
$F40C:    6F            mov byte ptr [r3], low(r3)
$F40D:    20            mov r0, r0
$F40E:    74            mov [r1], r0
$F40F:    68            mov byte ptr [r2], low(r0)
$F410:    65            mov byte ptr [r1], low(r1)
$F411:    20            mov r0, r0
$F412:    6D            mov byte ptr [r3], low(r1)
$F413:    6F            mov byte ptr [r3], low(r3)
$F414:    64            mov byte ptr [r1], low(r0)
$F415:    65            mov byte ptr [r1], low(r1)
$F416:    72            mov [r0], r2
$F417:    6E            mov byte ptr [r3], low(r2)
$F418:    20            mov r0, r0
$F419:    77            mov [r1], r3
$F41A:    6F            mov byte ptr [r3], low(r3)
$F41B:    72            mov [r0], r2
$F41C:    6C            mov byte ptr [r3], low(r0)
$F41D:    64            mov byte ptr [r1], low(r0)
$F41E:    2E            mov r3, r2
$F41F:    0A            mov r0, sp
$F420:    54            mov r1, [r0]
$F421:    68            mov byte ptr [r2], low(r0)
$F422:    65            mov byte ptr [r1], low(r1)
$F423:    20            mov r0, r0
$F424:    73            mov [r0], r3
$F425:    69            mov byte ptr [r2], low(r1)
$F426:    6D            mov byte ptr [r3], low(r1)
$F427:    70            mov [r0], r0
$F428:    6C            mov byte ptr [r3], low(r0)
$F429:    69            mov byte ptr [r2], low(r1)
$F42A:    66            mov byte ptr [r1], low(r2)
$F42B:    69            mov byte ptr [r2], low(r1)
$F42C:    65            mov byte ptr [r1], low(r1)
$F42D:    64            mov byte ptr [r1], low(r0)
$F42E:    20            mov r0, r0
$F42F:    69            mov byte ptr [r2], low(r1)
$F430:    6E            mov byte ptr [r3], low(r2)
$F431:    73            mov [r0], r3
$F432:    74            mov [r1], r0
$F433:    72            mov [r0], r2
$F434:    75            mov [r1], r1
$F435:    63            mov byte ptr [r0], low(r3)
$F436:    74            mov [r1], r0
$F437:    69            mov byte ptr [r2], low(r1)
$F438:    6F            mov byte ptr [r3], low(r3)
$F439:    6E            mov byte ptr [r3], low(r2)
$F43A:    20            mov r0, r0
$F43B:    73            mov [r0], r3
$F43C:    65            mov byte ptr [r1], low(r1)
$F43D:    74            mov [r1], r0
$F43E:    20            mov r0, r0
$F43F:    6F            mov byte ptr [r3], low(r3)
$F440:    66            mov byte ptr [r1], low(r2)
$F441:    20            mov r0, r0
$F442:    74            mov [r1], r0
$F443:    68            mov byte ptr [r2], low(r0)
$F444:    65            mov byte ptr [r1], low(r1)
$F445:    20            mov r0, r0
$F446:    47            mov r1, byte ptr [r3]
$F447:    4C            mov r3, byte ptr [r0]
$F448:    56            mov r1, [r2]
$F449:    4D            mov r3, byte ptr [r1]
$F44A:    20            mov r0, r0
$F44B:    65            mov byte ptr [r1], low(r1)
$F44C:    6E            mov byte ptr [r3], low(r2)
$F44D:    68            mov byte ptr [r2], low(r0)
$F44E:    61            mov byte ptr [r0], low(r1)
$F44F:    6E            mov byte ptr [r3], low(r2)
$F450:    63            mov byte ptr [r0], low(r3)
$F451:    65            mov byte ptr [r1], low(r1)
$F452:    73            mov [r0], r3
$F453:    20            mov r0, r0
$F454:    70            mov [r0], r0
$F455:    72            mov [r0], r2
$F456:    6F            mov byte ptr [r3], low(r3)
$F457:    64            mov byte ptr [r1], low(r0)
$F458:    75            mov [r1], r1
$F459:    63            mov byte ptr [r0], low(r3)
$F45A:    74            mov [r1], r0
$F45B:    69            mov byte ptr [r2], low(r1)
$F45C:    76            mov [r1], r2
$F45D:    69            mov byte ptr [r2], low(r1)
$F45E:    74            mov [r1], r0
$F45F:    79            mov [r2], r1
$F460:    0A            mov r0, sp
$F461:    6F            mov byte ptr [r3], low(r3)
$F462:    66            mov byte ptr [r1], low(r2)
$F463:    20            mov r0, r0
$F464:    6F            mov byte ptr [r3], low(r3)
$F465:    75            mov [r1], r1
$F466:    72            mov [r0], r2
$F467:    20            mov r0, r0
$F468:    65            mov byte ptr [r1], low(r1)
$F469:    6D            mov byte ptr [r3], low(r1)
$F46A:    70            mov [r0], r0
$F46B:    6C            mov byte ptr [r3], low(r0)
$F46C:    6F            mov byte ptr [r3], low(r3)
$F46D:    79            mov [r2], r1
$F46E:    65            mov byte ptr [r1], low(r1)
$F46F:    65            mov byte ptr [r1], low(r1)
$F470:    73            mov [r0], r3
$F471:    20            mov r0, r0
$F472:    61            mov byte ptr [r0], low(r1)
$F473:    6E            mov byte ptr [r3], low(r2)
$F474:    64            mov byte ptr [r1], low(r0)
$F475:    20            mov r0, r0
$F476:    73            mov [r0], r3
$F477:    69            mov byte ptr [r2], low(r1)
$F478:    67            mov byte ptr [r1], low(r3)
$F479:    6E            mov byte ptr [r3], low(r2)
$F47A:    69            mov byte ptr [r2], low(r1)
$F47B:    66            mov byte ptr [r1], low(r2)
$F47C:    69            mov byte ptr [r2], low(r1)
$F47D:    63            mov byte ptr [r0], low(r3)
$F47E:    61            mov byte ptr [r0], low(r1)
$F47F:    6E            mov byte ptr [r3], low(r2)
$F480:    74            mov [r1], r0
$F481:    6C            mov byte ptr [r3], low(r0)
$F482:    79            mov [r2], r1
$F483:    20            mov r0, r0
$F484:    73            mov [r0], r3
$F485:    70            mov [r0], r0
$F486:    65            mov byte ptr [r1], low(r1)
$F487:    65            mov byte ptr [r1], low(r1)
$F488:    64            mov byte ptr [r1], low(r0)
$F489:    73            mov [r0], r3
$F48A:    20            mov r0, r0
$F48B:    75            mov [r1], r1
$F48C:    70            mov [r0], r0
$F48D:    20            mov r0, r0
$F48E:    64            mov byte ptr [r1], low(r0)
$F48F:    65            mov byte ptr [r1], low(r1)
$F490:    76            mov [r1], r2
$F491:    65            mov byte ptr [r1], low(r1)
$F492:    6C            mov byte ptr [r3], low(r0)
$F493:    6F            mov byte ptr [r3], low(r3)
$F494:    70            mov [r0], r0
$F495:    6D            mov byte ptr [r3], low(r1)
$F496:    65            mov byte ptr [r1], low(r1)
$F497:    6E            mov byte ptr [r3], low(r2)
$F498:    74            mov [r1], r0
$F499:    20            mov r0, r0
$F49A:    6F            mov byte ptr [r3], low(r3)
$F49B:    66            mov byte ptr [r1], low(r2)
$F49C:    20            mov r0, r0
$F49D:    73            mov [r0], r3
$F49E:    6F            mov byte ptr [r3], low(r3)
$F49F:    66            mov byte ptr [r1], low(r2)
$F4A0:    74            mov [r1], r0
$F4A1:    77            mov [r1], r3
$F4A2:    61            mov byte ptr [r0], low(r1)
$F4A3:    72            mov [r0], r2
$F4A4:    65            mov byte ptr [r1], low(r1)
$F4A5:    0A            mov r0, sp
$F4A6:    72            mov [r0], r2
$F4A7:    65            mov byte ptr [r1], low(r1)
$F4A8:    71            mov [r0], r1
$F4A9:    75            mov [r1], r1
$F4AA:    69            mov byte ptr [r2], low(r1)
$F4AB:    72            mov [r0], r2
$F4AC:    65            mov byte ptr [r1], low(r1)
$F4AD:    64            mov byte ptr [r1], low(r0)
$F4AE:    20            mov r0, r0
$F4AF:    66            mov byte ptr [r1], low(r2)
$F4B0:    6F            mov byte ptr [r3], low(r3)
$F4B1:    72            mov [r0], r2
$F4B2:    20            mov r0, r0
$F4B3:    6F            mov byte ptr [r3], low(r3)
$F4B4:    75            mov [r1], r1
$F4B5:    72            mov [r0], r2
$F4B6:    20            mov r0, r0
$F4B7:    72            mov [r0], r2
$F4B8:    65            mov byte ptr [r1], low(r1)
$F4B9:    73            mov [r0], r3
$F4BA:    65            mov byte ptr [r1], low(r1)
$F4BB:    61            mov byte ptr [r0], low(r1)
$F4BC:    72            mov [r0], r2
$F4BD:    63            mov byte ptr [r0], low(r3)
$F4BE:    68            mov byte ptr [r2], low(r0)
$F4BF:    2E            mov r3, r2
$F4C0:    0A            mov r0, sp
$F4C1:    57            mov r1, [r3]
$F4C2:    6F            mov byte ptr [r3], low(r3)
$F4C3:    72            mov [r0], r2
$F4C4:    6B            mov byte ptr [r2], low(r3)
$F4C5:    20            mov r0, r0
$F4C6:    6F            mov byte ptr [r3], low(r3)
$F4C7:    6E            mov byte ptr [r3], low(r2)
$F4C8:    20            mov r0, r0
$F4C9:    74            mov [r1], r0
$F4CA:    68            mov byte ptr [r2], low(r0)
$F4CB:    65            mov byte ptr [r1], low(r1)
$F4CC:    20            mov r0, r0
$F4CD:    47            mov r1, byte ptr [r3]
$F4CE:    4C            mov r3, byte ptr [r0]
$F4CF:    56            mov r1, [r2]
$F4D0:    4D            mov r3, byte ptr [r1]
$F4D1:    20            mov r0, r0
$F4D2:    61            mov byte ptr [r0], low(r1)
$F4D3:    72            mov [r0], r2
$F4D4:    63            mov byte ptr [r0], low(r3)
$F4D5:    68            mov byte ptr [r2], low(r0)
$F4D6:    69            mov byte ptr [r2], low(r1)
$F4D7:    74            mov [r1], r0
$F4D8:    65            mov byte ptr [r1], low(r1)
$F4D9:    63            mov byte ptr [r0], low(r3)
$F4DA:    74            mov [r1], r0
$F4DB:    75            mov [r1], r1
$F4DC:    72            mov [r0], r2
$F4DD:    65            mov byte ptr [r1], low(r1)
$F4DE:    20            mov r0, r0
$F4DF:    69            mov byte ptr [r2], low(r1)
$F4E0:    73            mov [r0], r3
$F4E1:    20            mov r0, r0
$F4E2:    73            mov [r0], r3
$F4E3:    74            mov [r1], r0
$F4E4:    69            mov byte ptr [r2], low(r1)
$F4E5:    6C            mov byte ptr [r3], low(r0)
$F4E6:    6C            mov byte ptr [r3], low(r0)
$F4E7:    20            mov r0, r0
$F4E8:    6F            mov byte ptr [r3], low(r3)
$F4E9:    6E            mov byte ptr [r3], low(r2)
$F4EA:    67            mov byte ptr [r1], low(r3)
$F4EB:    6F            mov byte ptr [r3], low(r3)
$F4EC:    69            mov byte ptr [r2], low(r1)
$F4ED:    6E            mov byte ptr [r3], low(r2)
$F4EE:    67            mov byte ptr [r1], low(r3)
$F4EF:    2C            mov r3, r0
$F4F0:    20            mov r0, r0
$F4F1:    61            mov byte ptr [r0], low(r1)
$F4F2:    6E            mov byte ptr [r3], low(r2)
$F4F3:    64            mov byte ptr [r1], low(r0)
$F4F4:    20            mov r0, r0
$F4F5:    61            mov byte ptr [r0], low(r1)
$F4F6:    6C            mov byte ptr [r3], low(r0)
$F4F7:    6C            mov byte ptr [r3], low(r0)
$F4F8:    20            mov r0, r0
$F4F9:    69            mov byte ptr [r2], low(r1)
$F4FA:    6D            mov byte ptr [r3], low(r1)
$F4FB:    70            mov [r0], r0
$F4FC:    6C            mov byte ptr [r3], low(r0)
$F4FD:    65            mov byte ptr [r1], low(r1)
$F4FE:    6D            mov byte ptr [r3], low(r1)
$F4FF:    65            mov byte ptr [r1], low(r1)
$F500:    6E            mov byte ptr [r3], low(r2)
$F501:    74            mov [r1], r0
$F502:    61            mov byte ptr [r0], low(r1)
$F503:    74            mov [r1], r0
$F504:    69            mov byte ptr [r2], low(r1)
$F505:    6F            mov byte ptr [r3], low(r3)
$F506:    6E            mov byte ptr [r3], low(r2)
$F507:    0A            mov r0, sp
$F508:    64            mov byte ptr [r1], low(r0)
$F509:    65            mov byte ptr [r1], low(r1)
$F50A:    74            mov [r1], r0
$F50B:    61            mov byte ptr [r0], low(r1)
$F50C:    69            mov byte ptr [r2], low(r1)
$F50D:    6C            mov byte ptr [r3], low(r0)
$F50E:    73            mov [r0], r3
$F50F:    20            mov r0, r0
$F510:    61            mov byte ptr [r0], low(r1)
$F511:    72            mov [r0], r2
$F512:    65            mov byte ptr [r1], low(r1)
$F513:    20            mov r0, r0
$F514:    73            mov [r0], r3
$F515:    74            mov [r1], r0
$F516:    72            mov [r0], r2
$F517:    69            mov byte ptr [r2], low(r1)
$F518:    63            mov byte ptr [r0], low(r3)
$F519:    74            mov [r1], r0
$F51A:    6C            mov byte ptr [r3], low(r0)
$F51B:    79            mov [r2], r1
$F51C:    20            mov r0, r0
$F51D:    63            mov byte ptr [r0], low(r3)
$F51E:    6F            mov byte ptr [r3], low(r3)
$F51F:    6E            mov byte ptr [r3], low(r2)
$F520:    66            mov byte ptr [r1], low(r2)
$F521:    69            mov byte ptr [r2], low(r1)
$F522:    64            mov byte ptr [r1], low(r0)
$F523:    65            mov byte ptr [r1], low(r1)
$F524:    6E            mov byte ptr [r3], low(r2)
$F525:    74            mov [r1], r0
$F526:    69            mov byte ptr [r2], low(r1)
$F527:    61            mov byte ptr [r0], low(r1)
$F528:    6C            mov byte ptr [r3], low(r0)
$F529:    2C            mov r3, r0
$F52A:    20            mov r0, r0
$F52B:    75            mov [r1], r1
$F52C:    6E            mov byte ptr [r3], low(r2)
$F52D:    74            mov [r1], r0
$F52E:    69            mov byte ptr [r2], low(r1)
$F52F:    6C            mov byte ptr [r3], low(r0)
$F530:    20            mov r0, r0
$F531:    66            mov byte ptr [r1], low(r2)
$F532:    75            mov [r1], r1
$F533:    72            mov [r0], r2
$F534:    74            mov [r1], r0
$F535:    68            mov byte ptr [r2], low(r0)
$F536:    65            mov byte ptr [r1], low(r1)
$F537:    72            mov [r0], r2
$F538:    20            mov r0, r0
$F539:    6E            mov byte ptr [r3], low(r2)
$F53A:    6F            mov byte ptr [r3], low(r3)
$F53B:    74            mov [r1], r0
$F53C:    69            mov byte ptr [r2], low(r1)
$F53D:    63            mov byte ptr [r0], low(r3)
$F53E:    65            mov byte ptr [r1], low(r1)
$F53F:    2E            mov r3, r2
$F540:    0A            mov r0, sp
$F541:    00            trap
$F542:    0A            mov r0, sp
$F543:    2D            mov r3, r1
$F544:    2D            mov r3, r1
$F545:    2D            mov r3, r1
$F546:    2D            mov r3, r1
$F547:    2D            mov r3, r1
$F548:    0A            mov r0, sp
$F549:    0A            mov r0, sp
$F54A:    46            mov r1, byte ptr [r2]
$F54B:    69            mov byte ptr [r2], low(r1)
$F54C:    67            mov byte ptr [r1], low(r3)
$F54D:    68            mov byte ptr [r2], low(r0)
$F54E:    74            mov [r1], r0
$F54F:    20            mov r0, r0
$F550:    53            mov r0, [r3]
$F551:    69            mov byte ptr [r2], low(r1)
$F552:    6D            mov byte ptr [r3], low(r1)
$F553:    75            mov [r1], r1
$F554:    6C            mov byte ptr [r3], low(r0)
$F555:    61            mov byte ptr [r0], low(r1)
$F556:    74            mov [r1], r0
$F557:    69            mov byte ptr [r2], low(r1)
$F558:    6F            mov byte ptr [r3], low(r3)
$F559:    6E            mov byte ptr [r3], low(r2)
$F55A:    20            mov r0, r0
$F55B:    50            mov r0, [r0]
$F55C:    72            mov [r0], r2
$F55D:    6F            mov byte ptr [r3], low(r3)
$F55E:    67            mov byte ptr [r1], low(r3)
$F55F:    72            mov [r0], r2
$F560:    61            mov byte ptr [r0], low(r1)
$F561:    6D            mov byte ptr [r3], low(r1)
$F562:    20            mov r0, r0
$F563:    69            mov byte ptr [r2], low(r1)
$F564:    73            mov [r0], r3
$F565:    20            mov r0, r0
$F566:    74            mov [r1], r0
$F567:    68            mov byte ptr [r2], low(r0)
$F568:    65            mov byte ptr [r1], low(r1)
$F569:    20            mov r0, r0
$F56A:    63            mov byte ptr [r0], low(r3)
$F56B:    75            mov [r1], r1
$F56C:    72            mov [r0], r2
$F56D:    72            mov [r0], r2
$F56E:    65            mov byte ptr [r1], low(r1)
$F56F:    6E            mov byte ptr [r3], low(r2)
$F570:    74            mov [r1], r0
$F571:    20            mov r0, r0
$F572:    6F            mov byte ptr [r3], low(r3)
$F573:    6E            mov byte ptr [r3], low(r2)
$F574:    67            mov byte ptr [r1], low(r3)
$F575:    6F            mov byte ptr [r3], low(r3)
$F576:    69            mov byte ptr [r2], low(r1)
$F577:    6E            mov byte ptr [r3], low(r2)
$F578:    67            mov byte ptr [r1], low(r3)
$F579:    20            mov r0, r0
$F57A:    70            mov [r0], r0
$F57B:    72            mov [r0], r2
$F57C:    6F            mov byte ptr [r3], low(r3)
$F57D:    6A            mov byte ptr [r2], low(r2)
$F57E:    65            mov byte ptr [r1], low(r1)
$F57F:    63            mov byte ptr [r0], low(r3)
$F580:    74            mov [r1], r0
$F581:    20            mov r0, r0
$F582:    6F            mov byte ptr [r3], low(r3)
$F583:    66            mov byte ptr [r1], low(r2)
$F584:    20            mov r0, r0
$F585:    47            mov r1, byte ptr [r3]
$F586:    6C            mov byte ptr [r3], low(r0)
$F587:    69            mov byte ptr [r2], low(r1)
$F588:    74            mov [r1], r0
$F589:    63            mov byte ptr [r0], low(r3)
$F58A:    68            mov byte ptr [r2], low(r0)
$F58B:    0A            mov r0, sp
$F58C:    52            mov r0, [r2]
$F58D:    65            mov byte ptr [r1], low(r1)
$F58E:    73            mov [r0], r3
$F58F:    65            mov byte ptr [r1], low(r1)
$F590:    61            mov byte ptr [r0], low(r1)
$F591:    72            mov [r0], r2
$F592:    63            mov byte ptr [r0], low(r3)
$F593:    68            mov byte ptr [r2], low(r0)
$F594:    20            mov r0, r0
$F595:    4C            mov r3, byte ptr [r0]
$F596:    61            mov byte ptr [r0], low(r1)
$F597:    62            mov byte ptr [r0], low(r2)
$F598:    6F            mov byte ptr [r3], low(r3)
$F599:    72            mov [r0], r2
$F59A:    61            mov byte ptr [r0], low(r1)
$F59B:    74            mov [r1], r0
$F59C:    6F            mov byte ptr [r3], low(r3)
$F59D:    72            mov [r0], r2
$F59E:    79            mov [r2], r1
$F59F:    2E            mov r3, r2
$F5A0:    20            mov r0, r0
$F5A1:    49            mov r2, byte ptr [r1]
$F5A2:    74            mov [r1], r0
$F5A3:    20            mov r0, r0
$F5A4:    61            mov byte ptr [r0], low(r1)
$F5A5:    6C            mov byte ptr [r3], low(r0)
$F5A6:    6C            mov byte ptr [r3], low(r0)
$F5A7:    6F            mov byte ptr [r3], low(r3)
$F5A8:    77            mov [r1], r3
$F5A9:    73            mov [r0], r3
$F5AA:    20            mov r0, r0
$F5AB:    66            mov byte ptr [r1], low(r2)
$F5AC:    6F            mov byte ptr [r3], low(r3)
$F5AD:    72            mov [r0], r2
$F5AE:    20            mov r0, r0
$F5AF:    65            mov byte ptr [r1], low(r1)
$F5B0:    78            mov [r2], r0
$F5B1:    61            mov byte ptr [r0], low(r1)
$F5B2:    6D            mov byte ptr [r3], low(r1)
$F5B3:    69            mov byte ptr [r2], low(r1)
$F5B4:    6E            mov byte ptr [r3], low(r2)
$F5B5:    61            mov byte ptr [r0], low(r1)
$F5B6:    74            mov [r1], r0
$F5B7:    69            mov byte ptr [r2], low(r1)
$F5B8:    6F            mov byte ptr [r3], low(r3)
$F5B9:    6E            mov byte ptr [r3], low(r2)
$F5BA:    20            mov r0, r0
$F5BB:    6F            mov byte ptr [r3], low(r3)
$F5BC:    66            mov byte ptr [r1], low(r2)
$F5BD:    20            mov r0, r0
$F5BE:    62            mov byte ptr [r0], low(r2)
$F5BF:    65            mov byte ptr [r1], low(r1)
$F5C0:    68            mov byte ptr [r2], low(r0)
$F5C1:    61            mov byte ptr [r0], low(r1)
$F5C2:    76            mov [r1], r2
$F5C3:    69            mov byte ptr [r2], low(r1)
$F5C4:    6F            mov byte ptr [r3], low(r3)
$F5C5:    72            mov [r0], r2
$F5C6:    20            mov r0, r0
$F5C7:    6F            mov byte ptr [r3], low(r3)
$F5C8:    66            mov byte ptr [r1], low(r2)
$F5C9:    0A            mov r0, sp
$F5CA:    6D            mov byte ptr [r3], low(r1)
$F5CB:    61            mov byte ptr [r0], low(r1)
$F5CC:    6C            mov byte ptr [r3], low(r0)
$F5CD:    69            mov byte ptr [r2], low(r1)
$F5CE:    63            mov byte ptr [r0], low(r3)
$F5CF:    69            mov byte ptr [r2], low(r1)
$F5D0:    6F            mov byte ptr [r3], low(r3)
$F5D1:    75            mov [r1], r1
$F5D2:    73            mov [r0], r3
$F5D3:    20            mov r0, r0
$F5D4:    67            mov byte ptr [r1], low(r3)
$F5D5:    6C            mov byte ptr [r3], low(r0)
$F5D6:    69            mov byte ptr [r2], low(r1)
$F5D7:    74            mov [r1], r0
$F5D8:    63            mov byte ptr [r0], low(r3)
$F5D9:    68            mov byte ptr [r2], low(r0)
$F5DA:    20            mov r0, r0
$F5DB:    61            mov byte ptr [r0], low(r1)
$F5DC:    63            mov byte ptr [r0], low(r3)
$F5DD:    74            mov [r1], r0
$F5DE:    6F            mov byte ptr [r3], low(r3)
$F5DF:    72            mov [r0], r2
$F5E0:    73            mov [r0], r3
$F5E1:    2C            mov r3, r0
$F5E2:    20            mov r0, r0
$F5E3:    73            mov [r0], r3
$F5E4:    75            mov [r1], r1
$F5E5:    63            mov byte ptr [r0], low(r3)
$F5E6:    68            mov byte ptr [r2], low(r0)
$F5E7:    20            mov r0, r0
$F5E8:    61            mov byte ptr [r0], low(r1)
$F5E9:    73            mov [r0], r3
$F5EA:    20            mov r0, r0
$F5EB:    4D            mov r3, byte ptr [r1]
$F5EC:    69            mov byte ptr [r2], low(r1)
$F5ED:    73            mov [r0], r3
$F5EE:    73            mov [r0], r3
$F5EF:    69            mov byte ptr [r2], low(r1)
$F5F0:    6E            mov byte ptr [r3], low(r2)
$F5F1:    67            mov byte ptr [r1], low(r3)
$F5F2:    6E            mov byte ptr [r3], low(r2)
$F5F3:    6F            mov byte ptr [r3], low(r3)
$F5F4:    2E            mov r3, r2
$F5F5:    2C            mov r3, r0
$F5F6:    20            mov r0, r0
$F5F7:    77            mov [r1], r3
$F5F8:    69            mov byte ptr [r2], low(r1)
$F5F9:    74            mov [r1], r0
$F5FA:    68            mov byte ptr [r2], low(r0)
$F5FB:    6F            mov byte ptr [r3], low(r3)
$F5FC:    75            mov [r1], r1
$F5FD:    74            mov [r1], r0
$F5FE:    20            mov r0, r0
$F5FF:    72            mov [r0], r2
$F600:    75            mov [r1], r1
$F601:    6E            mov byte ptr [r3], low(r2)
$F602:    6E            mov byte ptr [r3], low(r2)
$F603:    69            mov byte ptr [r2], low(r1)
$F604:    6E            mov byte ptr [r3], low(r2)
$F605:    67            mov byte ptr [r1], low(r3)
$F606:    20            mov r0, r0
$F607:    74            mov [r1], r0
$F608:    68            mov byte ptr [r2], low(r0)
$F609:    65            mov byte ptr [r1], low(r1)
$F60A:    20            mov r0, r0
$F60B:    72            mov [r0], r2
$F60C:    69            mov byte ptr [r2], low(r1)
$F60D:    73            mov [r0], r3
$F60E:    6B            mov byte ptr [r2], low(r3)
$F60F:    0A            mov r0, sp
$F610:    6F            mov byte ptr [r3], low(r3)
$F611:    66            mov byte ptr [r1], low(r2)
$F612:    20            mov r0, r0
$F613:    70            mov [r0], r0
$F614:    72            mov [r0], r2
$F615:    6F            mov byte ptr [r3], low(r3)
$F616:    6C            mov byte ptr [r3], low(r0)
$F617:    6F            mov byte ptr [r3], low(r3)
$F618:    6E            mov byte ptr [r3], low(r2)
$F619:    67            mov byte ptr [r1], low(r3)
$F61A:    65            mov byte ptr [r1], low(r1)
$F61B:    64            mov byte ptr [r1], low(r0)
$F61C:    20            mov r0, r0
$F61D:    65            mov byte ptr [r1], low(r1)
$F61E:    78            mov [r2], r0
$F61F:    70            mov [r0], r0
$F620:    6F            mov byte ptr [r3], low(r3)
$F621:    73            mov [r0], r3
$F622:    75            mov [r1], r1
$F623:    72            mov [r0], r2
$F624:    65            mov byte ptr [r1], low(r1)
$F625:    20            mov r0, r0
$F626:    74            mov [r1], r0
$F627:    6F            mov byte ptr [r3], low(r3)
$F628:    20            mov r0, r0
$F629:    67            mov byte ptr [r1], low(r3)
$F62A:    6C            mov byte ptr [r3], low(r0)
$F62B:    69            mov byte ptr [r2], low(r1)
$F62C:    74            mov [r1], r0
$F62D:    63            mov byte ptr [r0], low(r3)
$F62E:    68            mov byte ptr [r2], low(r0)
$F62F:    65            mov byte ptr [r1], low(r1)
$F630:    73            mov [r0], r3
$F631:    20            mov r0, r0
$F632:    6F            mov byte ptr [r3], low(r3)
$F633:    72            mov [r0], r2
$F634:    20            mov r0, r0
$F635:    63            mov byte ptr [r0], low(r3)
$F636:    6F            mov byte ptr [r3], low(r3)
$F637:    72            mov [r0], r2
$F638:    72            mov [r0], r2
$F639:    75            mov [r1], r1
$F63A:    70            mov [r0], r0
$F63B:    74            mov [r1], r0
$F63C:    69            mov byte ptr [r2], low(r1)
$F63D:    6F            mov byte ptr [r3], low(r3)
$F63E:    6E            mov byte ptr [r3], low(r2)
$F63F:    2E            mov r3, r2
$F640:    0A            mov r0, sp
$F641:    50            mov r0, [r0]
$F642:    61            mov byte ptr [r0], low(r1)
$F643:    72            mov [r0], r2
$F644:    74            mov [r1], r0
$F645:    69            mov byte ptr [r2], low(r1)
$F646:    63            mov byte ptr [r0], low(r3)
$F647:    69            mov byte ptr [r2], low(r1)
$F648:    70            mov [r0], r0
$F649:    61            mov byte ptr [r0], low(r1)
$F64A:    6E            mov byte ptr [r3], low(r2)
$F64B:    74            mov [r1], r0
$F64C:    73            mov [r0], r3
$F64D:    20            mov r0, r0
$F64E:    61            mov byte ptr [r0], low(r1)
$F64F:    72            mov [r0], r2
$F650:    65            mov byte ptr [r1], low(r1)
$F651:    20            mov r0, r0
$F652:    61            mov byte ptr [r0], low(r1)
$F653:    62            mov byte ptr [r0], low(r2)
$F654:    6C            mov byte ptr [r3], low(r0)
$F655:    65            mov byte ptr [r1], low(r1)
$F656:    20            mov r0, r0
$F657:    74            mov [r1], r0
$F658:    6F            mov byte ptr [r3], low(r3)
$F659:    20            mov r0, r0
$F65A:    66            mov byte ptr [r1], low(r2)
$F65B:    69            mov byte ptr [r2], low(r1)
$F65C:    67            mov byte ptr [r1], low(r3)
$F65D:    68            mov byte ptr [r2], low(r0)
$F65E:    74            mov [r1], r0
$F65F:    20            mov r0, r0
$F660:    61            mov byte ptr [r0], low(r1)
$F661:    67            mov byte ptr [r1], low(r3)
$F662:    61            mov byte ptr [r0], low(r1)
$F663:    69            mov byte ptr [r2], low(r1)
$F664:    6E            mov byte ptr [r3], low(r2)
$F665:    73            mov [r0], r3
$F666:    74            mov [r1], r0
$F667:    20            mov r0, r0
$F668:    6F            mov byte ptr [r3], low(r3)
$F669:    70            mov [r0], r0
$F66A:    70            mov [r0], r0
$F66B:    6F            mov byte ptr [r3], low(r3)
$F66C:    6E            mov byte ptr [r3], low(r2)
$F66D:    65            mov byte ptr [r1], low(r1)
$F66E:    6E            mov byte ptr [r3], low(r2)
$F66F:    74            mov [r1], r0
$F670:    73            mov [r0], r3
$F671:    20            mov r0, r0
$F672:    69            mov byte ptr [r2], low(r1)
$F673:    6E            mov byte ptr [r3], low(r2)
$F674:    20            mov r0, r0
$F675:    61            mov byte ptr [r0], low(r1)
$F676:    6E            mov byte ptr [r3], low(r2)
$F677:    20            mov r0, r0
$F678:    69            mov byte ptr [r2], low(r1)
$F679:    73            mov [r0], r3
$F67A:    6F            mov byte ptr [r3], low(r3)
$F67B:    6C            mov byte ptr [r3], low(r0)
$F67C:    61            mov byte ptr [r0], low(r1)
$F67D:    74            mov [r1], r0
$F67E:    65            mov byte ptr [r1], low(r1)
$F67F:    64            mov byte ptr [r1], low(r0)
$F680:    0A            mov r0, sp
$F681:    65            mov byte ptr [r1], low(r1)
$F682:    6E            mov byte ptr [r3], low(r2)
$F683:    76            mov [r1], r2
$F684:    69            mov byte ptr [r2], low(r1)
$F685:    72            mov [r0], r2
$F686:    6F            mov byte ptr [r3], low(r3)
$F687:    6E            mov byte ptr [r3], low(r2)
$F688:    6D            mov byte ptr [r3], low(r1)
$F689:    65            mov byte ptr [r1], low(r1)
$F68A:    6E            mov byte ptr [r3], low(r2)
$F68B:    74            mov [r1], r0
$F68C:    2C            mov r3, r0
$F68D:    20            mov r0, r0
$F68E:    73            mov [r0], r3
$F68F:    69            mov byte ptr [r2], low(r1)
$F690:    6D            mov byte ptr [r3], low(r1)
$F691:    69            mov byte ptr [r2], low(r1)
$F692:    6C            mov byte ptr [r3], low(r0)
$F693:    61            mov byte ptr [r0], low(r1)
$F694:    72            mov [r0], r2
$F695:    20            mov r0, r0
$F696:    74            mov [r1], r0
$F697:    6F            mov byte ptr [r3], low(r3)
$F698:    20            mov r0, r0
$F699:    74            mov [r1], r0
$F69A:    79            mov [r2], r1
$F69B:    70            mov [r0], r0
$F69C:    69            mov byte ptr [r2], low(r1)
$F69D:    63            mov byte ptr [r0], low(r3)
$F69E:    61            mov byte ptr [r0], low(r1)
$F69F:    6C            mov byte ptr [r3], low(r0)
$F6A0:    20            mov r0, r0
$F6A1:    74            mov [r1], r0
$F6A2:    75            mov [r1], r1
$F6A3:    72            mov [r0], r2
$F6A4:    6E            mov byte ptr [r3], low(r2)
$F6A5:    2D            mov r3, r1
$F6A6:    62            mov byte ptr [r0], low(r2)
$F6A7:    61            mov byte ptr [r0], low(r1)
$F6A8:    73            mov [r0], r3
$F6A9:    65            mov byte ptr [r1], low(r1)
$F6AA:    64            mov byte ptr [r1], low(r0)
$F6AB:    20            mov r0, r0
$F6AC:    73            mov [r0], r3
$F6AD:    74            mov [r1], r0
$F6AE:    72            mov [r0], r2
$F6AF:    61            mov byte ptr [r0], low(r1)
$F6B0:    74            mov [r1], r0
$F6B1:    65            mov byte ptr [r1], low(r1)
$F6B2:    67            mov byte ptr [r1], low(r3)
$F6B3:    79            mov [r2], r1
$F6B4:    20            mov r0, r0
$F6B5:    67            mov byte ptr [r1], low(r3)
$F6B6:    61            mov byte ptr [r0], low(r1)
$F6B7:    6D            mov byte ptr [r3], low(r1)
$F6B8:    65            mov byte ptr [r1], low(r1)
$F6B9:    73            mov [r0], r3
$F6BA:    2E            mov r3, r2
$F6BB:    0A            mov r0, sp
$F6BC:    54            mov r1, [r0]
$F6BD:    68            mov byte ptr [r2], low(r0)
$F6BE:    65            mov byte ptr [r1], low(r1)
$F6BF:    20            mov r0, r0
$F6C0:    70            mov [r0], r0
$F6C1:    72            mov [r0], r2
$F6C2:    6F            mov byte ptr [r3], low(r3)
$F6C3:    67            mov byte ptr [r1], low(r3)
$F6C4:    72            mov [r0], r2
$F6C5:    61            mov byte ptr [r0], low(r1)
$F6C6:    6D            mov byte ptr [r3], low(r1)
$F6C7:    20            mov r0, r0
$F6C8:    69            mov byte ptr [r2], low(r1)
$F6C9:    73            mov [r0], r3
$F6CA:    20            mov r0, r0
$F6CB:    73            mov [r0], r3
$F6CC:    74            mov [r1], r0
$F6CD:    69            mov byte ptr [r2], low(r1)
$F6CE:    6C            mov byte ptr [r3], low(r0)
$F6CF:    6C            mov byte ptr [r3], low(r0)
$F6D0:    20            mov r0, r0
$F6D1:    69            mov byte ptr [r2], low(r1)
$F6D2:    6E            mov byte ptr [r3], low(r2)
$F6D3:    20            mov r0, r0
$F6D4:    64            mov byte ptr [r1], low(r0)
$F6D5:    65            mov byte ptr [r1], low(r1)
$F6D6:    76            mov [r1], r2
$F6D7:    65            mov byte ptr [r1], low(r1)
$F6D8:    6C            mov byte ptr [r3], low(r0)
$F6D9:    6F            mov byte ptr [r3], low(r3)
$F6DA:    70            mov [r0], r0
$F6DB:    6D            mov byte ptr [r3], low(r1)
$F6DC:    65            mov byte ptr [r1], low(r1)
$F6DD:    6E            mov byte ptr [r3], low(r2)
$F6DE:    74            mov [r1], r0
$F6DF:    2C            mov r3, r0
$F6E0:    20            mov r0, r0
$F6E1:    61            mov byte ptr [r0], low(r1)
$F6E2:    6E            mov byte ptr [r3], low(r2)
$F6E3:    64            mov byte ptr [r1], low(r0)
$F6E4:    20            mov r0, r0
$F6E5:    61            mov byte ptr [r0], low(r1)
$F6E6:    73            mov [r0], r3
$F6E7:    20            mov r0, r0
$F6E8:    73            mov [r0], r3
$F6E9:    75            mov [r1], r1
$F6EA:    63            mov byte ptr [r0], low(r3)
$F6EB:    68            mov byte ptr [r2], low(r0)
$F6EC:    2C            mov r3, r0
$F6ED:    20            mov r0, r0
$F6EE:    61            mov byte ptr [r0], low(r1)
$F6EF:    6C            mov byte ptr [r3], low(r0)
$F6F0:    6C            mov byte ptr [r3], low(r0)
$F6F1:    20            mov r0, r0
$F6F2:    64            mov byte ptr [r1], low(r0)
$F6F3:    65            mov byte ptr [r1], low(r1)
$F6F4:    74            mov [r1], r0
$F6F5:    61            mov byte ptr [r0], low(r1)
$F6F6:    69            mov byte ptr [r2], low(r1)
$F6F7:    6C            mov byte ptr [r3], low(r0)
$F6F8:    73            mov [r0], r3
$F6F9:    20            mov r0, r0
$F6FA:    61            mov byte ptr [r0], low(r1)
$F6FB:    72            mov [r0], r2
$F6FC:    65            mov byte ptr [r1], low(r1)
$F6FD:    0A            mov r0, sp
$F6FE:    73            mov [r0], r3
$F6FF:    74            mov [r1], r0
$F700:    72            mov [r0], r2
$F701:    69            mov byte ptr [r2], low(r1)
$F702:    63            mov byte ptr [r0], low(r3)
$F703:    74            mov [r1], r0
$F704:    6C            mov byte ptr [r3], low(r0)
$F705:    79            mov [r2], r1
$F706:    20            mov r0, r0
$F707:    63            mov byte ptr [r0], low(r3)
$F708:    6F            mov byte ptr [r3], low(r3)
$F709:    6E            mov byte ptr [r3], low(r2)
$F70A:    66            mov byte ptr [r1], low(r2)
$F70B:    69            mov byte ptr [r2], low(r1)
$F70C:    64            mov byte ptr [r1], low(r0)
$F70D:    65            mov byte ptr [r1], low(r1)
$F70E:    6E            mov byte ptr [r3], low(r2)
$F70F:    74            mov [r1], r0
$F710:    69            mov byte ptr [r2], low(r1)
$F711:    61            mov byte ptr [r0], low(r1)
$F712:    6C            mov byte ptr [r3], low(r0)
$F713:    2E            mov r3, r2
$F714:    0A            mov r0, sp
$F715:    00            trap
$F716:    46            mov r1, byte ptr [r2]
$F717:    4F            mov r3, byte ptr [r3]
$F718:    4F            mov r3, byte ptr [r3]
$F719:    4C            mov r3, byte ptr [r0]
$F71A:    53            mov r0, [r3]
$F71B:    32            add r0, r2
$F71C:    30            add r0, r0
$F71D:    32            add r0, r2
$F71E:    33            add r0, r3
$F71F:    5F            mov r3, [r3]
$F720:    7B            mov [r2], r3
$F721:    44            mov r1, byte ptr [r0]
$F722:    6F            mov byte ptr [r3], low(r3)
$F723:    65            mov byte ptr [r1], low(r1)
$F724:    73            mov [r0], r3
$F725:    54            mov r1, [r0]
$F726:    68            mov byte ptr [r2], low(r0)
$F727:    69            mov byte ptr [r2], low(r1)
$F728:    73            mov [r0], r3
$F729:    43            mov r0, byte ptr [r3]
$F72A:    6F            mov byte ptr [r3], low(r3)
$F72B:    75            mov [r1], r1
$F72C:    6E            mov byte ptr [r3], low(r2)
$F72D:    74            mov [r1], r0
$F72E:    41            mov r0, byte ptr [r1]
$F72F:    73            mov [r0], r3
$F730:    46            mov r1, byte ptr [r2]
$F731:    6F            mov byte ptr [r3], low(r3)
$F732:    72            mov [r0], r2
$F733:    6D            mov byte ptr [r3], low(r1)
$F734:    61            mov byte ptr [r0], low(r1)
$F735:    74            mov [r1], r0
$F736:    53            mov r0, [r3]
$F737:    74            mov [r1], r0
$F738:    72            mov [r0], r2
$F739:    69            mov byte ptr [r2], low(r1)
$F73A:    6E            mov byte ptr [r3], low(r2)
$F73B:    67            mov byte ptr [r1], low(r3)
$F73C:    7D            mov [r3], r1
$F73D:    0A            mov r0, sp
$F73E:    00            trap
$F73F:    F0            fixme: unknown opcode F0
$F740:    3A            add r2, r2
$F741:    F7            fixme: unknown opcode F7
$F742:    F0            fixme: unknown opcode F0
$F743:    3C            add r3, r0
$F744:    F7            fixme: unknown opcode F7
$F745:    F0            fixme: unknown opcode F0
$F746:    48            mov r2, byte ptr [r0]
$F747:    F7            fixme: unknown opcode F7
$F748:    F0            fixme: unknown opcode F0
$F749:    4A            mov r2, byte ptr [r2]
$F74A:    F7            fixme: unknown opcode F7
$F74B:    F0            fixme: unknown opcode F0
$F74C:    4C            mov r3, byte ptr [r0]
$F74D:    F7            fixme: unknown opcode F7
$F74E:    00            trap
$F74F:    00            trap
$F750:    3F            add r3, r3
$F751:    C3            fixme: unknown opcode C3
$F752:    F8            fixme: unknown opcode F8
$F753:    5F            mov r3, [r3]
$F754:    5F            mov r3, [r3]
$F755:    5F            mov r3, [r3]
$F756:    5F            mov r3, [r3]
$F757:    5F            mov r3, [r3]
$F758:    5F            mov r3, [r3]
$F759:    5F            mov r3, [r3]
$F75A:    5F            mov r3, [r3]
$F75B:    00            trap
$F75C:    00            trap
$F75D:    00            trap
$F75E:    00            trap
$F75F:    00            trap
$F760:    00            trap
$F761:    00            trap
$F762:    00            trap
$F763:    00            trap
$F764:    00            trap
$F765:    00            trap
$F766:    00            trap
$F767:    00            trap
$F768:    00            trap
$F769:    00            trap
$F76A:    00            trap
$F76B:    00            trap
$F76C:    00            trap
$F76D:    00            trap
$F76E:    00            trap
$F76F:    00            trap
$F770:    00            trap
$F771:    00            trap
$F772:    00            trap
$F773:    00            trap
$F774:    00            trap
$F775:    00            trap
$F776:    00            trap
$F777:    00            trap
$F778:    00            trap
$F779:    00            trap
$F77A:    00            trap
$F77B:    00            trap
$F77C:    00            trap
$F77D:    00            trap
$F77E:    00            trap
$F77F:    00            trap
$F780:    00            trap
$F781:    00            trap
$F782:    00            trap
$F783:    00            trap
$F784:    00            trap
$F785:    00            trap
$F786:    00            trap
$F787:    00            trap
$F788:    00            trap
$F789:    00            trap
$F78A:    00            trap
$F78B:    00            trap
$F78C:    00            trap
$F78D:    00            trap
$F78E:    00            trap
$F78F:    00            trap
$F790:    00            trap
$F791:    00            trap
$F792:    00            trap
$F793:    00            trap
$F794:    00            trap
$F795:    00            trap
$F796:    00            trap
$F797:    00            trap
$F798:    00            trap
$F799:    00            trap
$F79A:    00            trap
$F79B:    00            trap
$F79C:    00            trap
$F79D:    00            trap
$F79E:    00            trap
$F79F:    00            trap
$F7A0:    00            trap
$F7A1:    00            trap
$F7A2:    00            trap
$F7A3:    00            trap
$F7A4:    00            trap
$F7A5:    00            trap
$F7A6:    00            trap
$F7A7:    00            trap
$F7A8:    00            trap
$F7A9:    00            trap
$F7AA:    00            trap
$F7AB:    00            trap
$F7AC:    00            trap
$F7AD:    00            trap
$F7AE:    00            trap
$F7AF:    00            trap
$F7B0:    00            trap
$F7B1:    00            trap
$F7B2:    00            trap
$F7B3:    00            trap
$F7B4:    00            trap
$F7B5:    00            trap
$F7B6:    00            trap
$F7B7:    00            trap
$F7B8:    00            trap
$F7B9:    00            trap
$F7BA:    00            trap
$F7BB:    00            trap
$F7BC:    00            trap
$F7BD:    00            trap
$F7BE:    00            trap
$F7BF:    00            trap
$F7C0:    00            trap
$F7C1:    00            trap
$F7C2:    00            trap
$F7C3:    00            trap
$F7C4:    00            trap
$F7C5:    00            trap
$F7C6:    00            trap
$F7C7:    00            trap
$F7C8:    00            trap
$F7C9:    00            trap
$F7CA:    00            trap
$F7CB:    00            trap
$F7CC:    00            trap
$F7CD:    00            trap
$F7CE:    00            trap
$F7CF:    00            trap
$F7D0:    00            trap
$F7D1:    00            trap
$F7D2:    00            trap
$F7D3:    00            trap
$F7D4:    00            trap
$F7D5:    00            trap
$F7D6:    00            trap
$F7D7:    00            trap
$F7D8:    00            trap
$F7D9:    00            trap
$F7DA:    00            trap
$F7DB:    00            trap
$F7DC:    00            trap
$F7DD:    00            trap
$F7DE:    00            trap
$F7DF:    00            trap
$F7E0:    00            trap
$F7E1:    00            trap
$F7E2:    00            trap
$F7E3:    00            trap
$F7E4:    00            trap
$F7E5:    00            trap
$F7E6:    00            trap
$F7E7:    00            trap
$F7E8:    00            trap
$F7E9:    00            trap
$F7EA:    00            trap
$F7EB:    00            trap
$F7EC:    00            trap
$F7ED:    00            trap
$F7EE:    00            trap
$F7EF:    00            trap
$F7F0:    00            trap
$F7F1:    00            trap
$F7F2:    00            trap
$F7F3:    00            trap
$F7F4:    00            trap
$F7F5:    00            trap
$F7F6:    00            trap
$F7F7:    00            trap
$F7F8:    00            trap
$F7F9:    00            trap
$F7FA:    00            trap
$F7FB:    00            trap
$F7FC:    00            trap
$F7FD:    00            trap
$F7FE:    00            trap
$F7FF:    00            trap
$F800:    00            trap
$F801:    00            trap
$F802:    00            trap
$F803:    00            trap
$F804:    00            trap
$F805:    00            trap
$F806:    00            trap
$F807:    00            trap
$F808:    00            trap
$F809:    00            trap
$F80A:    00            trap
$F80B:    00            trap
$F80C:    00            trap
$F80D:    00            trap
$F80E:    00            trap
$F80F:    00            trap
$F810:    00            trap
$F811:    00            trap
$F812:    00            trap
$F813:    00            trap
$F814:    00            trap
$F815:    00            trap
$F816:    00            trap
$F817:    00            trap
$F818:    00            trap
$F819:    00            trap
$F81A:    00            trap
$F81B:    00            trap
$F81C:    00            trap
$F81D:    00            trap
$F81E:    00            trap
$F81F:    00            trap
$F820:    00            trap
$F821:    00            trap
$F822:    00            trap
$F823:    00            trap
$F824:    00            trap
$F825:    00            trap
$F826:    00            trap
$F827:    00            trap
$F828:    00            trap
$F829:    00            trap
$F82A:    00            trap
$F82B:    00            trap
$F82C:    00            trap
$F82D:    00            trap
$F82E:    00            trap
$F82F:    00            trap
$F830:    00            trap
$F831:    00            trap
$F832:    00            trap
$F833:    00            trap
$F834:    00            trap
$F835:    00            trap
$F836:    00            trap
$F837:    00            trap
$F838:    00            trap
$F839:    00            trap
$F83A:    00            trap
$F83B:    00            trap
$F83C:    00            trap
$F83D:    00            trap
$F83E:    00            trap
$F83F:    00            trap
$F840:    00            trap
$F841:    00            trap
$F842:    00            trap
$F843:    00            trap
$F844:    00            trap
$F845:    00            trap
$F846:    00            trap
$F847:    00            trap
$F848:    00            trap
$F849:    00            trap
$F84A:    00            trap
$F84B:    00            trap
$F84C:    00            trap
$F84D:    00            trap
$F84E:    00            trap
$F84F:    00            trap
$F850:    00            trap
$F851:    00            trap
$F852:    00            trap
$F853:    00            trap
$F854:    00            trap
$F855:    00            trap
$F856:    00            trap
$F857:    00            trap
$F858:    00            trap
$F859:    00            trap
$F85A:    00            trap
$F85B:    00            trap
$F85C:    00            trap
$F85D:    00            trap
$F85E:    00            trap
$F85F:    00            trap
$F860:    00            trap
$F861:    00            trap
$F862:    00            trap
$F863:    00            trap
$F864:    00            trap
$F865:    00            trap
$F866:    00            trap
$F867:    00            trap
$F868:    00            trap
$F869:    00            trap
$F86A:    00            trap
$F86B:    00            trap
$F86C:    00            trap
$F86D:    00            trap
$F86E:    00            trap
$F86F:    00            trap
$F870:    00            trap
$F871:    00            trap
$F872:    00            trap
$F873:    00            trap
$F874:    00            trap
$F875:    00            trap
$F876:    00            trap
$F877:    00            trap
$F878:    00            trap
$F879:    00            trap
$F87A:    00            trap
$F87B:    00            trap
$F87C:    00            trap
$F87D:    00            trap
$F87E:    00            trap
$F87F:    00            trap
$F880:    00            trap
$F881:    00            trap
$F882:    00            trap
$F883:    00            trap
$F884:    00            trap
$F885:    00            trap
$F886:    00            trap
$F887:    00            trap
$F888:    00            trap
$F889:    00            trap
$F88A:    00            trap
$F88B:    00            trap
$F88C:    00            trap
$F88D:    00            trap
$F88E:    00            trap
$F88F:    00            trap
$F890:    00            trap
$F891:    00            trap
$F892:    00            trap
$F893:    00            trap
$F894:    00            trap
$F895:    00            trap
$F896:    00            trap
$F897:    00            trap
$F898:    00            trap
$F899:    00            trap
$F89A:    00            trap
$F89B:    00            trap
$F89C:    00            trap
$F89D:    00            trap
$F89E:    00            trap
$F89F:    00            trap
$F8A0:    00            trap
$F8A1:    00            trap
$F8A2:    00            trap
$F8A3:    00            trap
$F8A4:    00            trap
$F8A5:    00            trap
$F8A6:    00            trap
$F8A7:    00            trap
$F8A8:    00            trap
$F8A9:    00            trap
$F8AA:    00            trap
$F8AB:    00            trap
$F8AC:    00            trap
$F8AD:    00            trap
$F8AE:    00            trap
$F8AF:    00            trap
$F8B0:    00            trap
$F8B1:    00            trap
$F8B2:    00            trap
$F8B3:    00            trap
$F8B4:    00            trap
$F8B5:    00            trap
$F8B6:    00            trap
$F8B7:    00            trap
$F8B8:    00            trap
$F8B9:    00            trap
$F8BA:    00            trap
$F8BB:    00            trap
$F8BC:    00            trap
$F8BD:    00            trap
$F8BE:    00            trap
$F8BF:    00            trap
$F8C0:    00            trap
$F8C1:    00            trap
$F8C2:    00            trap
$F8C3:    00            trap
$F8C4:    00            trap
$F8C5:    00            trap
$F8C6:    00            trap
$F8C7:    00            trap
$F8C8:    00            trap
$F8C9:    00            trap
$F8CA:    00            trap
$F8CB:    00            trap
$F8CC:    00            trap
$F8CD:    00            trap
$F8CE:    00            trap
$F8CF:    00            trap
$F8D0:    00            trap
$F8D1:    00            trap
$F8D2:    00            trap
$F8D3:    00            trap
$F8D4:    00            trap
$F8D5:    00            trap
$F8D6:    00            trap
$F8D7:    00            trap
$F8D8:    00            trap
$F8D9:    00            trap
$F8DA:    00            trap
$F8DB:    00            trap
$F8DC:    00            trap
$F8DD:    00            trap
$F8DE:    00            trap
$F8DF:    00            trap
$F8E0:    00            trap
$F8E1:    00            trap
$F8E2:    00            trap
$F8E3:    00            trap
$F8E4:    00            trap
$F8E5:    00            trap
$F8E6:    00            trap
$F8E7:    00            trap
$F8E8:    00            trap
$F8E9:    00            trap
$F8EA:    00            trap
$F8EB:    00            trap
$F8EC:    00            trap
$F8ED:    00            trap
$F8EE:    00            trap
$F8EF:    00            trap
$F8F0:    00            trap
$F8F1:    00            trap
$F8F2:    00            trap
$F8F3:    00            trap
$F8F4:    00            trap
$F8F5:    00            trap
$F8F6:    00            trap
$F8F7:    00            trap
$F8F8:    00            trap
$F8F9:    00            trap
$F8FA:    00            trap
$F8FB:    00            trap
$F8FC:    00            trap
$F8FD:    00            trap
$F8FE:    00            trap
$F8FF:    00            trap
$F900:    00            trap
$F901:    00            trap
$F902:    00            trap
$F903:    00            trap
$F904:    00            trap
$F905:    00            trap
$F906:    00            trap
$F907:    00            trap
$F908:    00            trap
$F909:    00            trap
$F90A:    00            trap
$F90B:    00            trap
$F90C:    00            trap
$F90D:    00            trap
$F90E:    00            trap
$F90F:    00            trap
$F910:    00            trap
$F911:    00            trap
$F912:    00            trap
$F913:    00            trap
$F914:    00            trap
$F915:    00            trap
$F916:    00            trap
$F917:    00            trap
$F918:    00            trap
$F919:    00            trap
$F91A:    00            trap
$F91B:    00            trap
$F91C:    00            trap
$F91D:    00            trap
$F91E:    00            trap
$F91F:    00            trap
$F920:    00            trap
$F921:    00            trap
$F922:    00            trap
$F923:    00            trap
$F924:    00            trap
$F925:    00            trap
$F926:    00            trap
$F927:    00            trap
$F928:    00            trap
$F929:    00            trap
$F92A:    00            trap
$F92B:    00            trap
$F92C:    00            trap
$F92D:    00            trap
$F92E:    00            trap
$F92F:    00            trap
$F930:    00            trap
$F931:    00            trap
$F932:    00            trap
$F933:    00            trap
$F934:    00            trap
$F935:    00            trap
$F936:    00            trap
$F937:    00            trap
$F938:    00            trap
$F939:    00            trap
$F93A:    00            trap
$F93B:    00            trap
$F93C:    00            trap
$F93D:    00            trap
$F93E:    00            trap
$F93F:    00            trap
$F940:    00            trap
$F941:    00            trap
$F942:    00            trap
$F943:    00            trap
$F944:    00            trap
$F945:    00            trap
$F946:    00            trap
$F947:    00            trap
$F948:    00            trap
$F949:    00            trap
$F94A:    00            trap
$F94B:    00            trap
$F94C:    00            trap
$F94D:    00            trap
$F94E:    00            trap
$F94F:    00            trap
$F950:    00            trap
$F951:    00            trap
$F952:    00            trap
$F953:    00            trap
$F954:    00            trap
$F955:    00            trap
$F956:    00            trap
$F957:    00            trap
$F958:    00            trap
$F959:    00            trap
$F95A:    00            trap
$F95B:    00            trap
$F95C:    00            trap
$F95D:    00            trap
$F95E:    00            trap
$F95F:    00            trap
$F960:    00            trap
$F961:    00            trap
$F962:    00            trap
$F963:    00            trap
$F964:    00            trap
$F965:    00            trap
$F966:    00            trap
$F967:    00            trap
$F968:    00            trap
$F969:    00            trap
$F96A:    00            trap
$F96B:    00            trap
$F96C:    00            trap
$F96D:    00            trap
$F96E:    00            trap
$F96F:    00            trap
$F970:    00            trap
$F971:    00            trap
$F972:    00            trap
$F973:    00            trap
$F974:    00            trap
$F975:    00            trap
$F976:    00            trap
$F977:    00            trap
$F978:    00            trap
$F979:    00            trap
$F97A:    00            trap
$F97B:    00            trap
$F97C:    00            trap
$F97D:    00            trap
$F97E:    00            trap
$F97F:    00            trap
$F980:    00            trap
$F981:    00            trap
$F982:    00            trap
$F983:    00            trap
$F984:    00            trap
$F985:    00            trap
$F986:    00            trap
$F987:    00            trap
$F988:    00            trap
$F989:    00            trap
$F98A:    00            trap
$F98B:    00            trap
$F98C:    00            trap
$F98D:    00            trap
$F98E:    00            trap
$F98F:    00            trap
$F990:    00            trap
$F991:    00            trap
$F992:    00            trap
$F993:    00            trap
$F994:    00            trap
$F995:    00            trap
$F996:    00            trap
$F997:    00            trap
$F998:    00            trap
$F999:    00            trap
$F99A:    00            trap
$F99B:    00            trap
$F99C:    00            trap
$F99D:    00            trap
$F99E:    00            trap
$F99F:    00            trap
$F9A0:    00            trap
$F9A1:    00            trap
$F9A2:    00            trap
$F9A3:    00            trap
$F9A4:    00            trap
$F9A5:    00            trap
$F9A6:    00            trap
$F9A7:    00            trap
$F9A8:    00            trap
$F9A9:    00            trap
$F9AA:    00            trap
$F9AB:    00            trap
$F9AC:    00            trap
$F9AD:    00            trap
$F9AE:    00            trap
$F9AF:    00            trap
$F9B0:    00            trap
$F9B1:    00            trap
$F9B2:    00            trap
$F9B3:    00            trap
$F9B4:    00            trap
$F9B5:    00            trap
$F9B6:    00            trap
$F9B7:    00            trap
$F9B8:    00            trap
$F9B9:    00            trap
$F9BA:    00            trap
$F9BB:    00            trap
$F9BC:    00            trap
$F9BD:    00            trap
$F9BE:    00            trap
$F9BF:    00            trap
$F9C0:    00            trap
$F9C1:    00            trap
$F9C2:    00            trap
$F9C3:    00            trap
$F9C4:    00            trap
$F9C5:    00            trap
$F9C6:    00            trap
$F9C7:    00            trap
$F9C8:    00            trap
$F9C9:    00            trap
$F9CA:    00            trap
$F9CB:    00            trap
$F9CC:    00            trap
$F9CD:    00            trap
$F9CE:    00            trap
$F9CF:    00            trap
$F9D0:    00            trap
$F9D1:    00            trap
$F9D2:    00            trap
$F9D3:    00            trap
$F9D4:    00            trap
$F9D5:    00            trap
$F9D6:    00            trap
$F9D7:    00            trap
$F9D8:    00            trap
$F9D9:    00            trap
$F9DA:    00            trap
$F9DB:    00            trap
$F9DC:    00            trap
$F9DD:    00            trap
$F9DE:    00            trap
$F9DF:    00            trap
$F9E0:    00            trap
$F9E1:    00            trap
$F9E2:    00            trap
$F9E3:    00            trap
$F9E4:    00            trap
$F9E5:    00            trap
$F9E6:    00            trap
$F9E7:    00            trap
$F9E8:    00            trap
$F9E9:    00            trap
$F9EA:    00            trap
$F9EB:    00            trap
$F9EC:    00            trap
$F9ED:    00            trap
$F9EE:    00            trap
$F9EF:    00            trap
$F9F0:    00            trap
$F9F1:    00            trap
$F9F2:    00            trap
$F9F3:    00            trap
$F9F4:    00            trap
$F9F5:    00            trap
$F9F6:    00            trap
$F9F7:    00            trap
$F9F8:    00            trap
$F9F9:    00            trap
$F9FA:    00            trap
$F9FB:    00            trap
$F9FC:    00            trap
$F9FD:    00            trap
$F9FE:    00            trap
$F9FF:    00            trap
$FA00:    00            trap
$FA01:    00            trap
$FA02:    00            trap
$FA03:    00            trap
$FA04:    00            trap
$FA05:    00            trap
$FA06:    00            trap
$FA07:    00            trap
$FA08:    00            trap
$FA09:    00            trap
$FA0A:    00            trap
$FA0B:    00            trap
$FA0C:    00            trap
$FA0D:    00            trap
$FA0E:    00            trap
$FA0F:    00            trap
$FA10:    00            trap
$FA11:    00            trap
$FA12:    00            trap
$FA13:    00            trap
$FA14:    00            trap
$FA15:    00            trap
$FA16:    00            trap
$FA17:    00            trap
$FA18:    00            trap
$FA19:    00            trap
$FA1A:    00            trap
$FA1B:    00            trap
$FA1C:    00            trap
$FA1D:    00            trap
$FA1E:    00            trap
$FA1F:    00            trap
$FA20:    00            trap
$FA21:    00            trap
$FA22:    00            trap
$FA23:    00            trap
$FA24:    00            trap
$FA25:    00            trap
$FA26:    00            trap
$FA27:    00            trap
$FA28:    00            trap
$FA29:    00            trap
$FA2A:    00            trap
$FA2B:    00            trap
$FA2C:    00            trap
$FA2D:    00            trap
$FA2E:    00            trap
$FA2F:    00            trap
$FA30:    00            trap
$FA31:    00            trap
$FA32:    00            trap
$FA33:    00            trap
$FA34:    00            trap
$FA35:    00            trap
$FA36:    00            trap
$FA37:    00            trap
$FA38:    00            trap
$FA39:    00            trap
$FA3A:    00            trap
$FA3B:    00            trap
$FA3C:    00            trap
$FA3D:    00            trap
$FA3E:    00            trap
$FA3F:    00            trap
$FA40:    00            trap
$FA41:    00            trap
$FA42:    00            trap
$FA43:    00            trap
$FA44:    00            trap
$FA45:    00            trap
$FA46:    00            trap
$FA47:    00            trap
$FA48:    00            trap
$FA49:    00            trap
$FA4A:    00            trap
$FA4B:    00            trap
$FA4C:    00            trap
$FA4D:    00            trap
$FA4E:    00            trap
$FA4F:    00            trap
$FA50:    00            trap
$FA51:    00            trap
$FA52:    00            trap
$FA53:    00            trap
$FA54:    00            trap
$FA55:    00            trap
$FA56:    00            trap
$FA57:    00            trap
$FA58:    00            trap
$FA59:    00            trap
$FA5A:    00            trap
$FA5B:    00            trap
$FA5C:    00            trap
$FA5D:    00            trap
$FA5E:    00            trap
$FA5F:    00            trap
$FA60:    00            trap
$FA61:    00            trap
$FA62:    00            trap
$FA63:    00            trap
$FA64:    00            trap
$FA65:    00            trap
$FA66:    00            trap
$FA67:    00            trap
$FA68:    00            trap
$FA69:    00            trap
$FA6A:    00            trap
$FA6B:    00            trap
$FA6C:    00            trap
$FA6D:    00            trap
$FA6E:    00            trap
$FA6F:    00            trap
$FA70:    00            trap
$FA71:    00            trap
$FA72:    00            trap
$FA73:    00            trap
$FA74:    00            trap
$FA75:    00            trap
$FA76:    00            trap
$FA77:    00            trap
$FA78:    00            trap
$FA79:    00            trap
$FA7A:    00            trap
$FA7B:    00            trap
$FA7C:    00            trap
$FA7D:    00            trap
$FA7E:    00            trap
$FA7F:    00            trap
$FA80:    00            trap
$FA81:    00            trap
$FA82:    00            trap
$FA83:    00            trap
$FA84:    00            trap
$FA85:    00            trap
$FA86:    00            trap
$FA87:    00            trap
$FA88:    00            trap
$FA89:    00            trap
$FA8A:    00            trap
$FA8B:    00            trap
$FA8C:    00            trap
$FA8D:    00            trap
$FA8E:    00            trap
$FA8F:    00            trap
$FA90:    00            trap
$FA91:    00            trap
$FA92:    00            trap
$FA93:    00            trap
$FA94:    00            trap
$FA95:    00            trap
$FA96:    00            trap
$FA97:    00            trap
$FA98:    00            trap
$FA99:    00            trap
$FA9A:    00            trap
$FA9B:    00            trap
$FA9C:    00            trap
$FA9D:    00            trap
$FA9E:    00            trap
$FA9F:    00            trap
$FAA0:    00            trap
$FAA1:    00            trap
$FAA2:    00            trap
$FAA3:    00            trap
$FAA4:    00            trap
$FAA5:    00            trap
$FAA6:    00            trap
$FAA7:    00            trap
$FAA8:    00            trap
$FAA9:    00            trap
$FAAA:    00            trap
$FAAB:    00            trap
$FAAC:    00            trap
$FAAD:    00            trap
$FAAE:    00            trap
$FAAF:    00            trap
$FAB0:    00            trap
$FAB1:    00            trap
$FAB2:    00            trap
$FAB3:    00            trap
$FAB4:    00            trap
$FAB5:    00            trap
$FAB6:    00            trap
$FAB7:    00            trap
$FAB8:    00            trap
$FAB9:    00            trap
$FABA:    00            trap
$FABB:    00            trap
$FABC:    00            trap
$FABD:    00            trap
$FABE:    00            trap
$FABF:    00            trap
$FAC0:    00            trap
$FAC1:    00            trap
$FAC2:    00            trap
$FAC3:    00            trap
$FAC4:    00            trap
$FAC5:    00            trap
$FAC6:    00            trap
$FAC7:    00            trap
$FAC8:    00            trap
$FAC9:    00            trap
$FACA:    00            trap
$FACB:    00            trap
$FACC:    00            trap
$FACD:    00            trap
$FACE:    00            trap
$FACF:    00            trap
$FAD0:    00            trap
$FAD1:    00            trap
$FAD2:    00            trap
$FAD3:    00            trap
$FAD4:    00            trap
$FAD5:    00            trap
$FAD6:    00            trap
$FAD7:    00            trap
$FAD8:    00            trap
$FAD9:    00            trap
$FADA:    00            trap
$FADB:    00            trap
$FADC:    00            trap
$FADD:    00            trap
$FADE:    00            trap
$FADF:    00            trap
$FAE0:    00            trap
$FAE1:    00            trap
$FAE2:    00            trap
$FAE3:    00            trap
$FAE4:    00            trap
$FAE5:    00            trap
$FAE6:    00            trap
$FAE7:    00            trap
$FAE8:    00            trap
$FAE9:    00            trap
$FAEA:    00            trap
$FAEB:    00            trap
$FAEC:    00            trap
$FAED:    00            trap
$FAEE:    00            trap
$FAEF:    00            trap
$FAF0:    00            trap
$FAF1:    00            trap
$FAF2:    00            trap
$FAF3:    00            trap
$FAF4:    00            trap
$FAF5:    00            trap
$FAF6:    00            trap
$FAF7:    00            trap
$FAF8:    00            trap
$FAF9:    00            trap
$FAFA:    00            trap
$FAFB:    00            trap
$FAFC:    00            trap
$FAFD:    00            trap
$FAFE:    00            trap
$FAFF:    00            trap
$FB00:    00            trap
$FB01:    00            trap
$FB02:    00            trap
$FB03:    00            trap
$FB04:    00            trap
$FB05:    00            trap
$FB06:    00            trap
$FB07:    00            trap
$FB08:    00            trap
$FB09:    00            trap
$FB0A:    00            trap
$FB0B:    00            trap
$FB0C:    00            trap
$FB0D:    00            trap
$FB0E:    00            trap
$FB0F:    00            trap
$FB10:    00            trap
$FB11:    00            trap
$FB12:    00            trap
$FB13:    00            trap
$FB14:    00            trap
$FB15:    00            trap
$FB16:    00            trap
$FB17:    00            trap
$FB18:    00            trap
$FB19:    00            trap
$FB1A:    00            trap
$FB1B:    00            trap
$FB1C:    00            trap
$FB1D:    00            trap
$FB1E:    00            trap
$FB1F:    00            trap
$FB20:    00            trap
$FB21:    00            trap
$FB22:    00            trap
$FB23:    00            trap
$FB24:    00            trap
$FB25:    00            trap
$FB26:    00            trap
$FB27:    00            trap
$FB28:    00            trap
$FB29:    00            trap
$FB2A:    00            trap
$FB2B:    00            trap
$FB2C:    00            trap
$FB2D:    00            trap
$FB2E:    00            trap
$FB2F:    00            trap
$FB30:    00            trap
$FB31:    00            trap
$FB32:    00            trap
$FB33:    00            trap
$FB34:    00            trap
$FB35:    00            trap
$FB36:    00            trap
$FB37:    00            trap
$FB38:    00            trap
$FB39:    00            trap
$FB3A:    00            trap
$FB3B:    00            trap
$FB3C:    00            trap
$FB3D:    00            trap
$FB3E:    00            trap
$FB3F:    00            trap
$FB40:    00            trap
$FB41:    00            trap
$FB42:    00            trap
$FB43:    00            trap
$FB44:    00            trap
$FB45:    00            trap
$FB46:    00            trap
$FB47:    00            trap
$FB48:    00            trap
$FB49:    00            trap
$FB4A:    00            trap
$FB4B:    00            trap
$FB4C:    00            trap
$FB4D:    00            trap
$FB4E:    00            trap
$FB4F:    00            trap
$FB50:    00            trap
$FB51:    00            trap
$FB52:    00            trap
$FB53:    00            trap
$FB54:    00            trap
$FB55:    00            trap
$FB56:    00            trap
$FB57:    00            trap
$FB58:    00            trap
$FB59:    00            trap
$FB5A:    00            trap
$FB5B:    00            trap
$FB5C:    00            trap
$FB5D:    00            trap
$FB5E:    00            trap
$FB5F:    00            trap
$FB60:    00            trap
$FB61:    00            trap
$FB62:    00            trap
$FB63:    00            trap
$FB64:    00            trap
$FB65:    00            trap
$FB66:    00            trap
$FB67:    00            trap
$FB68:    00            trap
$FB69:    00            trap
$FB6A:    00            trap
$FB6B:    00            trap
$FB6C:    00            trap
$FB6D:    00            trap
$FB6E:    00            trap
$FB6F:    00            trap
$FB70:    00            trap
$FB71:    00            trap
$FB72:    00            trap
$FB73:    00            trap
$FB74:    00            trap
$FB75:    00            trap
$FB76:    00            trap
$FB77:    00            trap
$FB78:    00            trap
$FB79:    00            trap
$FB7A:    00            trap
$FB7B:    00            trap
$FB7C:    00            trap
$FB7D:    00            trap
$FB7E:    00            trap
$FB7F:    00            trap
$FB80:    00            trap
$FB81:    00            trap
$FB82:    00            trap
$FB83:    00            trap
$FB84:    00            trap
$FB85:    00            trap
$FB86:    00            trap
$FB87:    00            trap
$FB88:    00            trap
$FB89:    00            trap
$FB8A:    00            trap
$FB8B:    00            trap
$FB8C:    00            trap
$FB8D:    00            trap
$FB8E:    00            trap
$FB8F:    00            trap
$FB90:    00            trap
$FB91:    00            trap
$FB92:    00            trap
$FB93:    00            trap
$FB94:    00            trap
$FB95:    00            trap
$FB96:    00            trap
$FB97:    00            trap
$FB98:    00            trap
$FB99:    00            trap
$FB9A:    00            trap
$FB9B:    00            trap
$FB9C:    00            trap
$FB9D:    00            trap
$FB9E:    00            trap
$FB9F:    00            trap
$FBA0:    00            trap
$FBA1:    00            trap
$FBA2:    00            trap
$FBA3:    00            trap
$FBA4:    00            trap
$FBA5:    00            trap
$FBA6:    00            trap
$FBA7:    00            trap
$FBA8:    00            trap
$FBA9:    00            trap
$FBAA:    00            trap
$FBAB:    00            trap
$FBAC:    00            trap
$FBAD:    00            trap
$FBAE:    00            trap
$FBAF:    00            trap
$FBB0:    00            trap
$FBB1:    00            trap
$FBB2:    00            trap
$FBB3:    00            trap
$FBB4:    00            trap
$FBB5:    00            trap
$FBB6:    00            trap
$FBB7:    00            trap
$FBB8:    00            trap
$FBB9:    00            trap
$FBBA:    00            trap
$FBBB:    00            trap
$FBBC:    00            trap
$FBBD:    00            trap
$FBBE:    00            trap
$FBBF:    00            trap
$FBC0:    00            trap
$FBC1:    00            trap
$FBC2:    00            trap
$FBC3:    00            trap
$FBC4:    00            trap
$FBC5:    00            trap
$FBC6:    00            trap
$FBC7:    00            trap
$FBC8:    00            trap
$FBC9:    00            trap
$FBCA:    00            trap
$FBCB:    00            trap
$FBCC:    00            trap
$FBCD:    00            trap
$FBCE:    00            trap
$FBCF:    00            trap
$FBD0:    00            trap
$FBD1:    00            trap
$FBD2:    00            trap
$FBD3:    00            trap
$FBD4:    00            trap
$FBD5:    00            trap
$FBD6:    00            trap
$FBD7:    00            trap
$FBD8:    00            trap
$FBD9:    00            trap
$FBDA:    00            trap
$FBDB:    00            trap
$FBDC:    00            trap
$FBDD:    00            trap
$FBDE:    00            trap
$FBDF:    00            trap
$FBE0:    00            trap
$FBE1:    00            trap
$FBE2:    00            trap
$FBE3:    00            trap
$FBE4:    00            trap
$FBE5:    00            trap
$FBE6:    00            trap
$FBE7:    00            trap
$FBE8:    00            trap
$FBE9:    00            trap
$FBEA:    00            trap
$FBEB:    00            trap
$FBEC:    00            trap
$FBED:    00            trap
$FBEE:    00            trap
$FBEF:    00            trap
$FBF0:    00            trap
$FBF1:    00            trap
$FBF2:    00            trap
$FBF3:    00            trap
$FBF4:    00            trap
$FBF5:    00            trap
$FBF6:    00            trap
$FBF7:    00            trap
$FBF8:    00            trap
$FBF9:    00            trap
$FBFA:    00            trap
$FBFB:    00            trap
$FBFC:    00            trap
$FBFD:    00            trap
$FBFE:    00            trap
$FBFF:    00            trap
$FC00:    00            trap
$FC01:    00            trap
$FC02:    00            trap
$FC03:    00            trap
$FC04:    00            trap
$FC05:    00            trap
$FC06:    00            trap
$FC07:    00            trap
$FC08:    00            trap
$FC09:    00            trap
$FC0A:    00            trap
$FC0B:    00            trap
$FC0C:    00            trap
$FC0D:    00            trap
$FC0E:    00            trap
$FC0F:    00            trap
$FC10:    00            trap
$FC11:    00            trap
$FC12:    00            trap
$FC13:    00            trap
$FC14:    00            trap
$FC15:    00            trap
$FC16:    00            trap
$FC17:    00            trap
$FC18:    00            trap
$FC19:    00            trap
$FC1A:    00            trap
$FC1B:    00            trap
$FC1C:    00            trap
$FC1D:    00            trap
$FC1E:    00            trap
$FC1F:    00            trap
$FC20:    00            trap
$FC21:    00            trap
$FC22:    00            trap
$FC23:    00            trap
$FC24:    00            trap
$FC25:    00            trap
$FC26:    00            trap
$FC27:    00            trap
$FC28:    00            trap
$FC29:    00            trap
$FC2A:    00            trap
$FC2B:    00            trap
$FC2C:    00            trap
$FC2D:    00            trap
$FC2E:    00            trap
$FC2F:    00            trap
$FC30:    00            trap
$FC31:    00            trap
$FC32:    00            trap
$FC33:    00            trap
$FC34:    00            trap
$FC35:    00            trap
$FC36:    00            trap
$FC37:    00            trap
$FC38:    00            trap
$FC39:    00            trap
$FC3A:    00            trap
$FC3B:    00            trap
$FC3C:    00            trap
$FC3D:    00            trap
$FC3E:    00            trap
$FC3F:    00            trap
$FC40:    00            trap
$FC41:    00            trap
$FC42:    00            trap
$FC43:    00            trap
$FC44:    00            trap
$FC45:    00            trap
$FC46:    00            trap
$FC47:    00            trap
$FC48:    00            trap
$FC49:    00            trap
$FC4A:    00            trap
$FC4B:    00            trap
$FC4C:    00            trap
$FC4D:    00            trap
$FC4E:    00            trap
$FC4F:    00            trap
$FC50:    00            trap
$FC51:    00            trap
$FC52:    00            trap
$FC53:    00            trap
$FC54:    00            trap
$FC55:    00            trap
$FC56:    00            trap
$FC57:    00            trap
$FC58:    00            trap
$FC59:    00            trap
$FC5A:    00            trap
$FC5B:    00            trap
$FC5C:    00            trap
$FC5D:    00            trap
$FC5E:    00            trap
$FC5F:    00            trap
$FC60:    00            trap
$FC61:    00            trap
$FC62:    00            trap
$FC63:    00            trap
$FC64:    00            trap
$FC65:    00            trap
$FC66:    00            trap
$FC67:    00            trap
$FC68:    00            trap
$FC69:    00            trap
$FC6A:    00            trap
$FC6B:    00            trap
$FC6C:    00            trap
$FC6D:    00            trap
$FC6E:    00            trap
$FC6F:    00            trap
$FC70:    00            trap
$FC71:    00            trap
$FC72:    00            trap
$FC73:    00            trap
$FC74:    00            trap
$FC75:    00            trap
$FC76:    00            trap
$FC77:    00            trap
$FC78:    00            trap
$FC79:    00            trap
$FC7A:    00            trap
$FC7B:    00            trap
$FC7C:    00            trap
$FC7D:    00            trap
$FC7E:    00            trap
$FC7F:    00            trap
$FC80:    00            trap
$FC81:    00            trap
$FC82:    00            trap
$FC83:    00            trap
$FC84:    00            trap
$FC85:    00            trap
$FC86:    00            trap
$FC87:    00            trap
$FC88:    00            trap
$FC89:    00            trap
$FC8A:    00            trap
$FC8B:    00            trap
$FC8C:    00            trap
$FC8D:    00            trap
$FC8E:    00            trap
$FC8F:    00            trap
$FC90:    00            trap
$FC91:    00            trap
$FC92:    00            trap
$FC93:    00            trap
$FC94:    00            trap
$FC95:    00            trap
$FC96:    00            trap
$FC97:    00            trap
$FC98:    00            trap
$FC99:    00            trap
$FC9A:    00            trap
$FC9B:    00            trap
$FC9C:    00            trap
$FC9D:    00            trap
$FC9E:    00            trap
$FC9F:    00            trap
$FCA0:    00            trap
$FCA1:    00            trap
$FCA2:    00            trap
$FCA3:    00            trap
$FCA4:    00            trap
$FCA5:    00            trap
$FCA6:    00            trap
$FCA7:    00            trap
$FCA8:    00            trap
$FCA9:    00            trap
$FCAA:    00            trap
$FCAB:    00            trap
$FCAC:    00            trap
$FCAD:    00            trap
$FCAE:    00            trap
$FCAF:    00            trap
$FCB0:    00            trap
$FCB1:    00            trap
$FCB2:    00            trap
$FCB3:    00            trap
$FCB4:    00            trap
$FCB5:    00            trap
$FCB6:    00            trap
$FCB7:    00            trap
$FCB8:    00            trap
$FCB9:    00            trap
$FCBA:    00            trap
$FCBB:    00            trap
$FCBC:    00            trap
$FCBD:    00            trap
$FCBE:    00            trap
$FCBF:    00            trap
$FCC0:    00            trap
$FCC1:    00            trap
$FCC2:    00            trap
$FCC3:    00            trap
$FCC4:    00            trap
$FCC5:    00            trap
$FCC6:    00            trap
$FCC7:    00            trap
$FCC8:    00            trap
$FCC9:    00            trap
$FCCA:    00            trap
$FCCB:    00            trap
$FCCC:    00            trap
$FCCD:    00            trap
$FCCE:    00            trap
$FCCF:    00            trap
$FCD0:    00            trap
$FCD1:    00            trap
$FCD2:    00            trap
$FCD3:    00            trap
$FCD4:    00            trap
$FCD5:    00            trap
$FCD6:    00            trap
$FCD7:    00            trap
$FCD8:    00            trap
$FCD9:    00            trap
$FCDA:    00            trap
$FCDB:    00            trap
$FCDC:    00            trap
$FCDD:    00            trap
$FCDE:    00            trap
$FCDF:    00            trap
$FCE0:    00            trap
$FCE1:    00            trap
$FCE2:    00            trap
$FCE3:    00            trap
$FCE4:    00            trap
$FCE5:    00            trap
$FCE6:    00            trap
$FCE7:    00            trap
$FCE8:    00            trap
$FCE9:    00            trap
$FCEA:    00            trap
$FCEB:    00            trap
$FCEC:    00            trap
$FCED:    00            trap
$FCEE:    00            trap
$FCEF:    00            trap
$FCF0:    00            trap
$FCF1:    00            trap
$FCF2:    00            trap
$FCF3:    00            trap
$FCF4:    00            trap
$FCF5:    00            trap
$FCF6:    00            trap
$FCF7:    00            trap
$FCF8:    00            trap
$FCF9:    00            trap
$FCFA:    00            trap
$FCFB:    00            trap
$FCFC:    00            trap
$FCFD:    00            trap
$FCFE:    00            trap
$FCFF:    00            trap
$FD00:    00            trap
$FD01:    00            trap
$FD02:    00            trap
$FD03:    00            trap
$FD04:    00            trap
$FD05:    00            trap
$FD06:    00            trap
$FD07:    00            trap
$FD08:    00            trap
$FD09:    00            trap
$FD0A:    00            trap
$FD0B:    00            trap
$FD0C:    00            trap
$FD0D:    00            trap
$FD0E:    00            trap
$FD0F:    00            trap
$FD10:    00            trap
$FD11:    00            trap
$FD12:    00            trap
$FD13:    00            trap
$FD14:    00            trap
$FD15:    00            trap
$FD16:    00            trap
$FD17:    00            trap
$FD18:    00            trap
$FD19:    00            trap
$FD1A:    00            trap
$FD1B:    00            trap
$FD1C:    00            trap
$FD1D:    00            trap
$FD1E:    00            trap
$FD1F:    00            trap
$FD20:    00            trap
$FD21:    00            trap
$FD22:    00            trap
$FD23:    00            trap
$FD24:    00            trap
$FD25:    00            trap
$FD26:    00            trap
$FD27:    00            trap
$FD28:    00            trap
$FD29:    00            trap
$FD2A:    00            trap
$FD2B:    00            trap
$FD2C:    00            trap
$FD2D:    00            trap
$FD2E:    00            trap
$FD2F:    00            trap
$FD30:    00            trap
$FD31:    00            trap
$FD32:    00            trap
$FD33:    00            trap
$FD34:    00            trap
$FD35:    00            trap
$FD36:    00            trap
$FD37:    00            trap
$FD38:    00            trap
$FD39:    00            trap
$FD3A:    00            trap
$FD3B:    00            trap
$FD3C:    00            trap
$FD3D:    00            trap
$FD3E:    00            trap
$FD3F:    00            trap
$FD40:    00            trap
$FD41:    00            trap
$FD42:    00            trap
$FD43:    00            trap
$FD44:    00            trap
$FD45:    00            trap
$FD46:    00            trap
$FD47:    00            trap
$FD48:    00            trap
$FD49:    00            trap
$FD4A:    00            trap
$FD4B:    00            trap
$FD4C:    00            trap
$FD4D:    00            trap
$FD4E:    00            trap
$FD4F:    00            trap
$FD50:    00            trap
$FD51:    00            trap
$FD52:    00            trap
$FD53:    00            trap
$FD54:    00            trap
$FD55:    00            trap
$FD56:    00            trap
$FD57:    00            trap
$FD58:    00            trap
$FD59:    00            trap
$FD5A:    00            trap
$FD5B:    00            trap
$FD5C:    00            trap
$FD5D:    00            trap
$FD5E:    00            trap
$FD5F:    00            trap
$FD60:    00            trap
$FD61:    00            trap
$FD62:    00            trap
$FD63:    00            trap
$FD64:    00            trap
$FD65:    00            trap
$FD66:    00            trap
$FD67:    00            trap
$FD68:    00            trap
$FD69:    00            trap
$FD6A:    00            trap
$FD6B:    00            trap
$FD6C:    00            trap
$FD6D:    00            trap
$FD6E:    00            trap
$FD6F:    00            trap
$FD70:    00            trap
$FD71:    00            trap
$FD72:    00            trap
$FD73:    00            trap
$FD74:    00            trap
$FD75:    00            trap
$FD76:    00            trap
$FD77:    00            trap
$FD78:    00            trap
$FD79:    00            trap
$FD7A:    00            trap
$FD7B:    00            trap
$FD7C:    00            trap
$FD7D:    00            trap
$FD7E:    00            trap
$FD7F:    00            trap
$FD80:    00            trap
$FD81:    00            trap
$FD82:    00            trap
$FD83:    00            trap
$FD84:    00            trap
$FD85:    00            trap
$FD86:    00            trap
$FD87:    00            trap
$FD88:    00            trap
$FD89:    00            trap
$FD8A:    00            trap
$FD8B:    00            trap
$FD8C:    00            trap
$FD8D:    00            trap
$FD8E:    00            trap
$FD8F:    00            trap
$FD90:    00            trap
$FD91:    00            trap
$FD92:    00            trap
$FD93:    00            trap
$FD94:    00            trap
$FD95:    00            trap
$FD96:    00            trap
$FD97:    00            trap
$FD98:    00            trap
$FD99:    00            trap
$FD9A:    00            trap
$FD9B:    00            trap
$FD9C:    00            trap
$FD9D:    00            trap
$FD9E:    00            trap
$FD9F:    00            trap
$FDA0:    00            trap
$FDA1:    00            trap
$FDA2:    00            trap
$FDA3:    00            trap
$FDA4:    00            trap
$FDA5:    00            trap
$FDA6:    00            trap
$FDA7:    00            trap
$FDA8:    00            trap
$FDA9:    00            trap
$FDAA:    00            trap
$FDAB:    00            trap
$FDAC:    00            trap
$FDAD:    00            trap
$FDAE:    00            trap
$FDAF:    00            trap
$FDB0:    00            trap
$FDB1:    00            trap
$FDB2:    00            trap
$FDB3:    00            trap
$FDB4:    00            trap
$FDB5:    00            trap
$FDB6:    00            trap
$FDB7:    00            trap
$FDB8:    00            trap
$FDB9:    00            trap
$FDBA:    00            trap
$FDBB:    00            trap
$FDBC:    00            trap
$FDBD:    00            trap
$FDBE:    00            trap
$FDBF:    00            trap
$FDC0:    00            trap
$FDC1:    00            trap
$FDC2:    00            trap
$FDC3:    00            trap
$FDC4:    00            trap
$FDC5:    00            trap
$FDC6:    00            trap
$FDC7:    00            trap
$FDC8:    00            trap
$FDC9:    00            trap
$FDCA:    00            trap
$FDCB:    00            trap
$FDCC:    00            trap
$FDCD:    00            trap
$FDCE:    00            trap
$FDCF:    00            trap
$FDD0:    00            trap
$FDD1:    00            trap
$FDD2:    00            trap
$FDD3:    00            trap
$FDD4:    00            trap
$FDD5:    00            trap
$FDD6:    00            trap
$FDD7:    00            trap
$FDD8:    00            trap
$FDD9:    00            trap
$FDDA:    00            trap
$FDDB:    00            trap
$FDDC:    00            trap
$FDDD:    00            trap
$FDDE:    00            trap
$FDDF:    00            trap
$FDE0:    00            trap
$FDE1:    00            trap
$FDE2:    00            trap
$FDE3:    00            trap
$FDE4:    00            trap
$FDE5:    00            trap
$FDE6:    00            trap
$FDE7:    00            trap
$FDE8:    00            trap
$FDE9:    00            trap
$FDEA:    00            trap
$FDEB:    00            trap
$FDEC:    00            trap
$FDED:    00            trap
$FDEE:    00            trap
$FDEF:    00            trap
$FDF0:    00            trap
$FDF1:    00            trap
$FDF2:    00            trap
$FDF3:    00            trap
$FDF4:    00            trap
$FDF5:    00            trap
$FDF6:    00            trap
$FDF7:    00            trap
$FDF8:    00            trap
$FDF9:    00            trap
$FDFA:    00            trap
$FDFB:    00            trap
$FDFC:    00            trap
$FDFD:    00            trap
$FDFE:    00            trap
$FDFF:    00            trap
$FE00:    09 E3 27      mov sp, $27E3
$FE03:    8D            cmp r3, r1
$FE04:    00            trap
$FE05:    00            trap
$FE06:    00            trap
$FE07:    00            trap
$FE08:    00            trap
$FE09:    00            trap
$FE0A:    00            trap
$FE0B:    00            trap
$FE0C:    00            trap
$FE0D:    00            trap
$FE0E:    00            trap
$FE0F:    00            trap
$FE10:    00            trap
$FE11:    00            trap
$FE12:    00            trap
$FE13:    00            trap
$FE14:    00            trap
$FE15:    00            trap
$FE16:    00            trap
$FE17:    00            trap
$FE18:    00            trap
$FE19:    00            trap
$FE1A:    00            trap
$FE1B:    00            trap
$FE1C:    00            trap
$FE1D:    00            trap
$FE1E:    00            trap
$FE1F:    00            trap
$FE20:    00            trap
$FE21:    00            trap
$FE22:    00            trap
$FE23:    00            trap
$FE24:    00            trap
$FE25:    00            trap
$FE26:    00            trap
$FE27:    00            trap
$FE28:    00            trap
$FE29:    00            trap
$FE2A:    00            trap
$FE2B:    00            trap
$FE2C:    00            trap
$FE2D:    00            trap
$FE2E:    00            trap
$FE2F:    00            trap
$FE30:    00            trap
$FE31:    00            trap
$FE32:    00            trap
$FE33:    00            trap
$FE34:    00            trap
$FE35:    00            trap
$FE36:    00            trap
$FE37:    00            trap
$FE38:    00            trap
$FE39:    00            trap
$FE3A:    00            trap
$FE3B:    00            trap
$FE3C:    00            trap
$FE3D:    00            trap
$FE3E:    00            trap
$FE3F:    00            trap
$FE40:    00            trap
$FE41:    00            trap
$FE42:    00            trap
$FE43:    00            trap
$FE44:    00            trap
$FE45:    00            trap
$FE46:    00            trap
$FE47:    00            trap
$FE48:    00            trap
$FE49:    00            trap
$FE4A:    00            trap
$FE4B:    00            trap
$FE4C:    00            trap
$FE4D:    00            trap
$FE4E:    00            trap
$FE4F:    00            trap
$FE50:    00            trap
$FE51:    00            trap
$FE52:    00            trap
$FE53:    00            trap
$FE54:    00            trap
$FE55:    00            trap
$FE56:    00            trap
$FE57:    00            trap
$FE58:    00            trap
$FE59:    00            trap
$FE5A:    00            trap
$FE5B:    00            trap
$FE5C:    00            trap
$FE5D:    00            trap
$FE5E:    00            trap
$FE5F:    00            trap
$FE60:    00            trap
$FE61:    00            trap
$FE62:    00            trap
$FE63:    00            trap
$FE64:    00            trap
$FE65:    00            trap
$FE66:    00            trap
$FE67:    00            trap
$FE68:    00            trap
$FE69:    00            trap
$FE6A:    00            trap
$FE6B:    00            trap
$FE6C:    00            trap
$FE6D:    00            trap
$FE6E:    00            trap
$FE6F:    00            trap
$FE70:    00            trap
$FE71:    00            trap
$FE72:    00            trap
$FE73:    00            trap
$FE74:    00            trap
$FE75:    00            trap
$FE76:    00            trap
$FE77:    00            trap
$FE78:    00            trap
$FE79:    00            trap
$FE7A:    00            trap
$FE7B:    00            trap
$FE7C:    00            trap
$FE7D:    00            trap
$FE7E:    00            trap
$FE7F:    00            trap
$FE80:    00            trap
$FE81:    00            trap
$FE82:    00            trap
$FE83:    00            trap
$FE84:    00            trap
$FE85:    00            trap
$FE86:    00            trap
$FE87:    00            trap
$FE88:    00            trap
$FE89:    00            trap
$FE8A:    00            trap
$FE8B:    00            trap
$FE8C:    00            trap
$FE8D:    00            trap
$FE8E:    00            trap
$FE8F:    00            trap
$FE90:    00            trap
$FE91:    00            trap
$FE92:    00            trap
$FE93:    00            trap
$FE94:    00            trap
$FE95:    00            trap
$FE96:    00            trap
$FE97:    00            trap
$FE98:    00            trap
$FE99:    00            trap
$FE9A:    00            trap
$FE9B:    00            trap
$FE9C:    00            trap
$FE9D:    00            trap
$FE9E:    00            trap
$FE9F:    00            trap
$FEA0:    00            trap
$FEA1:    00            trap
$FEA2:    00            trap
$FEA3:    00            trap
$FEA4:    00            trap
$FEA5:    00            trap
$FEA6:    00            trap
$FEA7:    00            trap
$FEA8:    00            trap
$FEA9:    00            trap
$FEAA:    00            trap
$FEAB:    00            trap
$FEAC:    00            trap
$FEAD:    00            trap
$FEAE:    00            trap
$FEAF:    00            trap
$FEB0:    00            trap
$FEB1:    00            trap
$FEB2:    00            trap
$FEB3:    00            trap
$FEB4:    00            trap
$FEB5:    00            trap
$FEB6:    00            trap
$FEB7:    00            trap
$FEB8:    00            trap
$FEB9:    00            trap
$FEBA:    00            trap
$FEBB:    00            trap
$FEBC:    00            trap
$FEBD:    00            trap
$FEBE:    00            trap
$FEBF:    00            trap
$FEC0:    00            trap
$FEC1:    00            trap
$FEC2:    00            trap
$FEC3:    00            trap
$FEC4:    00            trap
$FEC5:    00            trap
$FEC6:    00            trap
$FEC7:    00            trap
$FEC8:    00            trap
$FEC9:    00            trap
$FECA:    00            trap
$FECB:    00            trap
$FECC:    00            trap
$FECD:    00            trap
$FECE:    00            trap
$FECF:    00            trap
$FED0:    00            trap
$FED1:    00            trap
$FED2:    00            trap
$FED3:    00            trap
$FED4:    00            trap
$FED5:    00            trap
$FED6:    00            trap
$FED7:    00            trap
$FED8:    00            trap
$FED9:    00            trap
$FEDA:    00            trap
$FEDB:    00            trap
$FEDC:    00            trap
$FEDD:    00            trap
$FEDE:    00            trap
$FEDF:    00            trap
$FEE0:    00            trap
$FEE1:    00            trap
$FEE2:    00            trap
$FEE3:    00            trap
$FEE4:    00            trap
$FEE5:    00            trap
$FEE6:    00            trap
$FEE7:    00            trap
$FEE8:    00            trap
$FEE9:    00            trap
$FEEA:    00            trap
$FEEB:    00            trap
$FEEC:    00            trap
$FEED:    00            trap
$FEEE:    00            trap
$FEEF:    00            trap
$FEF0:    00            trap
$FEF1:    00            trap
$FEF2:    00            trap
$FEF3:    00            trap
$FEF4:    BD 00 00      mov [$0000], r0
$FEF7:    00            trap
$FEF8:    A9            inc r1
$FEF9:    00            trap
$FEFA:    6D            mov byte ptr [r3], low(r1)
$FEFB:    00            trap
$FEFC:    42            mov r0, byte ptr [r2]
$FEFD:    F0            fixme: unknown opcode F0
$FEFE:    2B            mov r2, r3
$FEFF:    F0            fixme: unknown opcode F0
$FF00:    00            trap
$FF01:    00            trap
$FF02:    00            trap
$FF03:    00            trap
$FF04:    00            trap
$FF05:    00            trap
$FF06:    00            trap
$FF07:    00            trap
$FF08:    00            trap
$FF09:    00            trap
$FF0A:    00            trap
$FF0B:    00            trap
$FF0C:    00            trap
$FF0D:    00            trap
$FF0E:    00            trap
$FF0F:    00            trap
$FF10:    00            trap
$FF11:    00            trap
$FF12:    00            trap
$FF13:    00            trap
$FF14:    00            trap
$FF15:    00            trap
$FF16:    00            trap
$FF17:    00            trap
$FF18:    00            trap
$FF19:    00            trap
$FF1A:    00            trap
$FF1B:    00            trap
$FF1C:    00            trap
$FF1D:    00            trap
$FF1E:    00            trap
$FF1F:    00            trap
$FF20:    00            trap
$FF21:    00            trap
$FF22:    00            trap
$FF23:    00            trap
$FF24:    00            trap
$FF25:    00            trap
$FF26:    00            trap
$FF27:    00            trap
$FF28:    00            trap
$FF29:    00            trap
$FF2A:    00            trap
$FF2B:    00            trap
$FF2C:    00            trap
$FF2D:    00            trap
$FF2E:    00            trap
$FF2F:    00            trap
$FF30:    00            trap
$FF31:    00            trap
$FF32:    00            trap
$FF33:    00            trap
$FF34:    00            trap
$FF35:    00            trap
$FF36:    00            trap
$FF37:    00            trap
$FF38:    00            trap
$FF39:    00            trap
$FF3A:    00            trap
$FF3B:    00            trap
$FF3C:    00            trap
$FF3D:    00            trap
$FF3E:    00            trap
$FF3F:    00            trap
$FF40:    00            trap
$FF41:    00            trap
$FF42:    00            trap
$FF43:    00            trap
$FF44:    00            trap
$FF45:    00            trap
$FF46:    00            trap
$FF47:    00            trap
$FF48:    00            trap
$FF49:    00            trap
$FF4A:    00            trap
$FF4B:    00            trap
$FF4C:    00            trap
$FF4D:    00            trap
$FF4E:    00            trap
$FF4F:    00            trap
$FF50:    00            trap
$FF51:    00            trap
$FF52:    00            trap
$FF53:    00            trap
$FF54:    00            trap
$FF55:    00            trap
$FF56:    00            trap
$FF57:    00            trap
$FF58:    00            trap
$FF59:    00            trap
$FF5A:    00            trap
$FF5B:    00            trap
$FF5C:    00            trap
$FF5D:    00            trap
$FF5E:    00            trap
$FF5F:    00            trap
$FF60:    00            trap
$FF61:    00            trap
$FF62:    00            trap
$FF63:    00            trap
$FF64:    00            trap
$FF65:    00            trap
$FF66:    00            trap
$FF67:    00            trap
$FF68:    00            trap
$FF69:    00            trap
$FF6A:    00            trap
$FF6B:    00            trap
$FF6C:    00            trap
$FF6D:    00            trap
$FF6E:    00            trap
$FF6F:    00            trap
$FF70:    00            trap
$FF71:    00            trap
$FF72:    00            trap
$FF73:    00            trap
$FF74:    00            trap
$FF75:    00            trap
$FF76:    00            trap
$FF77:    00            trap
$FF78:    00            trap
$FF79:    00            trap
$FF7A:    00            trap
$FF7B:    00            trap
$FF7C:    00            trap
$FF7D:    00            trap
$FF7E:    00            trap
$FF7F:    00            trap
$FF80:    00            trap
$FF81:    00            trap
$FF82:    00            trap
$FF83:    00            trap
$FF84:    00            trap
$FF85:    00            trap
$FF86:    00            trap
$FF87:    00            trap
$FF88:    00            trap
$FF89:    00            trap
$FF8A:    00            trap
$FF8B:    00            trap
$FF8C:    00            trap
$FF8D:    00            trap
$FF8E:    00            trap
$FF8F:    00            trap
$FF90:    00            trap
$FF91:    00            trap
$FF92:    00            trap
$FF93:    00            trap
$FF94:    00            trap
$FF95:    00            trap
$FF96:    00            trap
$FF97:    00            trap
$FF98:    00            trap
$FF99:    00            trap
$FF9A:    00            trap
$FF9B:    00            trap
$FF9C:    00            trap
$FF9D:    00            trap
$FF9E:    00            trap
$FF9F:    00            trap
$FFA0:    00            trap
$FFA1:    00            trap
$FFA2:    00            trap
$FFA3:    00            trap
$FFA4:    00            trap
$FFA5:    00            trap
$FFA6:    00            trap
$FFA7:    00            trap
$FFA8:    00            trap
$FFA9:    00            trap
$FFAA:    00            trap
$FFAB:    00            trap
$FFAC:    00            trap
$FFAD:    00            trap
$FFAE:    00            trap
$FFAF:    00            trap
$FFB0:    00            trap
$FFB1:    00            trap
$FFB2:    00            trap
$FFB3:    00            trap
$FFB4:    00            trap
$FFB5:    00            trap
$FFB6:    00            trap
$FFB7:    00            trap
$FFB8:    00            trap
$FFB9:    00            trap
$FFBA:    00            trap
$FFBB:    00            trap
$FFBC:    00            trap
$FFBD:    00            trap
$FFBE:    00            trap
$FFBF:    00            trap
$FFC0:    00            trap
$FFC1:    00            trap
$FFC2:    00            trap
$FFC3:    00            trap
$FFC4:    00            trap
$FFC5:    00            trap
$FFC6:    00            trap
$FFC7:    00            trap
$FFC8:    00            trap
$FFC9:    00            trap
$FFCA:    00            trap
$FFCB:    00            trap
$FFCC:    00            trap
$FFCD:    00            trap
$FFCE:    00            trap
$FFCF:    00            trap
$FFD0:    00            trap
$FFD1:    00            trap
$FFD2:    00            trap
$FFD3:    00            trap
$FFD4:    00            trap
$FFD5:    00            trap
$FFD6:    00            trap
$FFD7:    00            trap
$FFD8:    00            trap
$FFD9:    00            trap
$FFDA:    00            trap
$FFDB:    00            trap
$FFDC:    00            trap
$FFDD:    00            trap
$FFDE:    00            trap
$FFDF:    00            trap
$FFE0:    00            trap
$FFE1:    00            trap
$FFE2:    00            trap
$FFE3:    00            trap
$FFE4:    00            trap
$FFE5:    00            trap
$FFE6:    00            trap
$FFE7:    00            trap
$FFE8:    00            trap
$FFE9:    00            trap
$FFEA:    00            trap
$FFEB:    00            trap
$FFEC:    00            trap
$FFED:    00            trap
$FFEE:    00            trap
$FFEF:    00            trap
$FFF0:    00            trap
$FFF1:    00            trap
$FFF2:    00            trap
$FFF3:    00            trap
$FFF4:    00            trap
$FFF5:    00            trap
$FFF6:    00            trap
$FFF7:    00            trap
$FFF8:    00            trap
$FFF9:    00            trap
$FFFA:    00            trap
$FFFB:    00            trap
$FFFC:    00            trap
$FFFD:    00            trap
