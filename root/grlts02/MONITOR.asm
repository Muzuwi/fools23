$F000:    09 00 FF      mov sp, $FF00
$F003:    10 F0 FF      mov r0, $FFF0
$F006:    11 98 00      mov r1, $0098
$F009:    61            mov byte ptr [r0], low(r1)
$F00A:    A8            inc r0
$F00B:    11 7E F3      mov r1, $F37E
$F00E:    71            mov [r0], r1
$F00F:    12 9C F6      mov r2, $F69C
$F012:    99 08 00      call $0008    # <PrintStr>
$F015:    12 2D F2      mov r2, $F22D
$F018:    99 08 00      call $0008    # <PrintStr>

$F01B:    13 10 00      mov r3, $0010
$F01E:    12 DB F1      mov r2, $F1DB
$F021:    99 30 00      call $0030    # <ReadStr>

$F024:    12 1E F1      mov r2, $F11E
$F027:    42            mov r0, byte ptr [r2]
$F028:    A2 00 00      cmp r0, $0000
$F02B:    9C AC F0      je $F0AC
$F02E:    13 DB F1      mov r3, $F1DB
$F031:    92            push r2
$F032:    99 10 00      call $0010    # <StrCmp>
$F035:    96            pop r2

$F036:    A2 00 00      cmp r0, $0000
$F039:    9C 42 F0      je $F042
$F03C:    E2 50 00      add r2, $0050
$F03F:    98 27 F0      jmp $F027    # <None>

$F042:    E2 10 00      add r2, $0010
$F045:    92            push r2

$F046:    99 04 F1      call $F104    # <None>
$F049:    12 38 F2      mov r2, $F238
$F04C:    99 08 00      call $0008    # <PrintStr>
$F04F:    13 30 00      mov r3, $0030
$F052:    12 EC F1      mov r2, $F1EC
$F055:    99 30 00      call $0030    # <ReadStr>
$F058:    99 04 F1      call $F104    # <None>

$F05B:    10 01 00      mov r0, $0001
$F05E:    11 00 C0      mov r1, $C000
$F061:    06 04         in r0, char
$F063:    96            pop r2


$F064:    13 EC F1      mov r3, $F1EC
$F067:    93            push r3

; r3 - input chars

$F068:    11 00 C0      mov r1, $C000
$F06B:    43            mov r0, byte ptr [r3]
$F06C:    34            add r1, r0              ; r1 = &lookup + input[n]

$F06D:    13 00 00      mov r3, $0000           ; value = 0
$F070:    41            mov r0, byte ptr [r1]   ; 
$F071:    3C            add r3, r0              ; value += lookup[input[n]]

$F072:    E1 00 01      add r1, $0100           ; 
$F075:    41            mov r0, byte ptr [r1]
$F076:    3C            add r3, r0              ; value += lookup[input[n] + 0x100]

$F077:    E1 00 01      add r1, $0100
$F07A:    41            mov r0, byte ptr [r1]
$F07B:    3C            add r3, r0              ; value += lookup[input[n] + 0x200]

$F07C:    E1 00 01      add r1, $0100
$F07F:    41            mov r0, byte ptr [r1]
$F080:    3C            add r3, r0              ; value += lookup[input[n] + 0x300]

$F081:    23            mov r0, r3
$F082:    CD FF 00      fixme: unknown opcode CD    ; ?????
$F085:    46            mov r1, byte ptr [r2]       ; 
$F086:    81            cmp r0, r1

$F087:    9D B8 F0      jne $F0B8
$F08A:    97            pop r3
$F08B:    99 C1 F0      call $F0C1    # <None>
$F08E:    AA            inc r2
$F08F:    AB            inc r3
$F090:    42            mov r0, byte ptr [r2]
$F091:    A2 00 00      cmp r0, $0000
$F094:    9C 9A F0      je $F09A
$F097:    98 67 F0      jmp $F067    # <None>
$F09A:    12 B3 F2      mov r2, $F2B3
$F09D:    99 08 00      call $0008    # <PrintStr>
$F0A0:    00            trap



$F0A1:    12 6B F8      mov r2, $F86B
$F0A4:    99 08 00      call $0008    # <PrintStr>
$F0A7:    06 03         in r0, char
$F0A9:    98 A9 F0      jmp $F0A9    # <None>

$F0AC:    99 04 F1      call $F104    # <None>
$F0AF:    12 78 F2      mov r2, $F278
$F0B2:    99 08 00      call $0008    # <PrintStr>
$F0B5:    98 15 F0      jmp $F015    # <None>
$F0B8:    12 98 F2      mov r2, $F298
$F0BB:    99 08 00      call $0008    # <PrintStr>
$F0BE:    98 15 F0      jmp $F015    # <None>
$F0C1:    B0 00 C0      mov r0, byte ptr [$C000]
$F0C4:    B8 00 F1      mov byte ptr [$F100], low(r0)
$F0C7:    B0 00 C1      mov r0, byte ptr [$C100]
$F0CA:    B8 01 F1      mov byte ptr [$F101], low(r0)
$F0CD:    B0 00 C2      mov r0, byte ptr [$C200]
$F0D0:    B8 02 F1      mov byte ptr [$F102], low(r0)
$F0D3:    B0 00 C3      mov r0, byte ptr [$C300]
$F0D6:    B8 03 F1      mov byte ptr [$F103], low(r0)
$F0D9:    11 00 C0      mov r1, $C000
$F0DC:    A9            inc r1
$F0DD:    41            mov r0, byte ptr [r1]
$F0DE:    AD            dec r1
$F0DF:    64            mov byte ptr [r1], low(r0)
$F0E0:    A9            inc r1
$F0E1:    A3 FF C3      cmp r1, $C3FF
$F0E4:    9D DC F0      jne $F0DC
$F0E7:    B0 00 F1      mov r0, byte ptr [$F100]
$F0EA:    B8 FF C0      mov byte ptr [$C0FF], low(r0)
$F0ED:    B0 01 F1      mov r0, byte ptr [$F101]
$F0F0:    B8 FF C1      mov byte ptr [$C1FF], low(r0)
$F0F3:    B0 02 F1      mov r0, byte ptr [$F102]
$F0F6:    B8 FF C2      mov byte ptr [$C2FF], low(r0)
$F0F9:    B0 03 F1      mov r0, byte ptr [$F103]
$F0FC:    B8 FF C3      mov byte ptr [$C3FF], low(r0)
$F0FF:    05            ret
$F100:    9D 90 D1      jne $D190
$F103:    98 

          92            push r2
          12 65  F2     mov r2, $F265
$F108:    99 08 00      call $0008    # <PrintStr> ; please wait
$F10B:    96            pop r2

$F10C:    10 FF 3F      mov r0, $3FFF
$F10F:    08            fixme: unknown opcode 08
$F110:    08            fixme: unknown opcode 08
$F111:    08            fixme: unknown opcode 08
$F112:    08            fixme: unknown opcode 08
$F113:    08            fixme: unknown opcode 08
$F114:    08            fixme: unknown opcode 08
$F115:    08            fixme: unknown opcode 08
$F116:    AC            dec r0
$F117:    A2 00 00      cmp r0, $0000
$F11A:    9D 0F F1      jne $F10F
$F11D:    05            ret

$F11E:    61            mov byte ptr [r0], low(r1)
$F11F:    78            mov [r2], r0
$F120:    2E            mov r3, r2
$F121:    61            mov byte ptr [r0], low(r1)
$F122:    72            mov [r0], r2
$F123:    77            mov [r1], r3
$F124:    65            mov byte ptr [r1], low(r1)
$F125:    6E            mov byte ptr [r3], low(r2)
$F126:    00            trap
$F127:    00            trap
$F128:    00            trap
$F129:    00            trap
$F12A:    00            trap
$F12B:    00            trap
$F12C:    00            trap
$F12D:    00            trap
$F12E:    C6            fixme: unknown opcode C6
$F12F:    44            mov r1, byte ptr [r0]
$F130:    99 E3 E9      call $E9E3    # <None>
$F133:    19             === ILLEGAL OPCODE ===
$F134:    0D             === ILLEGAL OPCODE ===
$F135:    07             === ILLEGAL OPCODE ===
$F136:    0D             === ILLEGAL OPCODE ===
$F137:    12 79 00      mov r2, $0079
$F13A:    00            trap
$F13B:    00            trap
$F13C:    00            trap
$F13D:    00            trap
$F13E:    00            trap
$F13F:    00            trap
$F140:    00            trap
$F141:    00            trap
$F142:    00            trap
$F143:    00            trap
$F144:    00            trap
$F145:    00            trap
$F146:    00            trap
$F147:    00            trap
$F148:    00            trap
$F149:    00            trap
$F14A:    00            trap
$F14B:    00            trap
$F14C:    00            trap
$F14D:    00            trap
$F14E:    00            trap
$F14F:    00            trap
$F150:    00            trap
$F151:    00            trap
$F152:    00            trap
$F153:    00            trap
$F154:    00            trap
$F155:    00            trap
$F156:    00            trap
$F157:    00            trap
$F158:    00            trap
$F159:    00            trap
$F15A:    00            trap
$F15B:    00            trap
$F15C:    00            trap
$F15D:    00            trap
$F15E:    00            trap
$F15F:    00            trap
$F160:    00            trap
$F161:    00            trap
$F162:    00            trap
$F163:    00            trap
$F164:    00            trap
$F165:    00            trap
$F166:    00            trap
$F167:    00            trap
$F168:    00            trap
$F169:    00            trap
$F16A:    00            trap
$F16B:    00            trap
$F16C:    00            trap
$F16D:    00            trap
$F16E:    73            mov [r0], r3
$F16F:    62            mov byte ptr [r0], low(r2)
$F170:    77            mov [r1], r3
$F171:    2E            mov r3, r2
$F172:    73            mov [r0], r3
$F173:    68            mov byte ptr [r2], low(r0)
$F174:    61            mov byte ptr [r0], low(r1)
$F175:    64            mov byte ptr [r1], low(r0)
$F176:    6F            mov byte ptr [r3], low(r3)
$F177:    77            mov [r1], r3
$F178:    00            trap
$F179:    00            trap
$F17A:    00            trap
$F17B:    00            trap
$F17C:    00            trap
$F17D:    00            trap
$F17E:    E9            fixme: unknown opcode E9
$F17F:    22            mov r0, r2
$F180:    D8            xor r0, r0
$F181:    7C            mov [r3], r0
$F182:    3C            add r3, r0
$F183:    07             === ILLEGAL OPCODE ===
$F184:    54            mov r1, [r0]
$F185:    2D            mov r3, r1
$F186:    5E            mov r3, [r2]
$F187:    53            mov r0, [r3]
$F188:    6A            mov byte ptr [r2], low(r2)
$F189:    FF            fixme: unknown opcode FF
$F18A:    80            cmp r0, r0
$F18B:    5E            mov r3, [r2]
$F18C:    CD C8 CF      fixme: unknown opcode CD
$F18F:    FF            fixme: unknown opcode FF
$F190:    44            mov r1, byte ptr [r0]
$F191:    74            mov [r1], r0
$F192:    C8            fixme: unknown opcode C8
$F193:    D8            xor r0, r0
$F194:    4B            mov r2, byte ptr [r3]
$F195:    00            trap
$F196:    00            trap
$F197:    00            trap
$F198:    00            trap
$F199:    00            trap
$F19A:    00            trap
$F19B:    00            trap
$F19C:    00            trap
$F19D:    00            trap
$F19E:    00            trap
$F19F:    00            trap
$F1A0:    00            trap
$F1A1:    00            trap
$F1A2:    00            trap
$F1A3:    00            trap
$F1A4:    00            trap
$F1A5:    00            trap
$F1A6:    00            trap
$F1A7:    00            trap
$F1A8:    00            trap
$F1A9:    00            trap
$F1AA:    00            trap
$F1AB:    00            trap
$F1AC:    00            trap
$F1AD:    00            trap
$F1AE:    00            trap
$F1AF:    00            trap
$F1B0:    00            trap
$F1B1:    00            trap
$F1B2:    00            trap
$F1B3:    00            trap
$F1B4:    00            trap
$F1B5:    00            trap
$F1B6:    00            trap
$F1B7:    00            trap
$F1B8:    00            trap
$F1B9:    00            trap
$F1BA:    00            trap
$F1BB:    00            trap
$F1BC:    00            trap
$F1BD:    00            trap
$F1BE:    00            trap
$F1BF:    00            trap
$F1C0:    00            trap
$F1C1:    00            trap
$F1C2:    00            trap
$F1C3:    00            trap
$F1C4:    00            trap
$F1C5:    00            trap
$F1C6:    00            trap
$F1C7:    00            trap
$F1C8:    00            trap
$F1C9:    00            trap
$F1CA:    00            trap
$F1CB:    00            trap
$F1CC:    00            trap
$F1CD:    00            trap
$F1CE:    00            trap
$F1CF:    00            trap
$F1D0:    00            trap
$F1D1:    00            trap
$F1D2:    00            trap
$F1D3:    00            trap
$F1D4:    00            trap
$F1D5:    00            trap
$F1D6:    00            trap
$F1D7:    00            trap
$F1D8:    00            trap
$F1D9:    00            trap
$F1DA:    00            trap
$F1DB:    61            mov byte ptr [r0], low(r1)
$F1DC:    78            mov [r2], r0
$F1DD:    2E            mov r3, r2
$F1DE:    61            mov byte ptr [r0], low(r1)
$F1DF:    72            mov [r0], r2
$F1E0:    77            mov [r1], r3
$F1E1:    65            mov byte ptr [r1], low(r1)
$F1E2:    6E            mov byte ptr [r3], low(r2)
$F1E3:    0A            mov r0, sp
$F1E4:    00            trap
$F1E5:    5F            mov r3, [r3]
$F1E6:    5F            mov r3, [r3]
$F1E7:    5F            mov r3, [r3]
$F1E8:    5F            mov r3, [r3]
$F1E9:    5F            mov r3, [r3]
$F1EA:    5F            mov r3, [r3]
$F1EB:    00            trap
$F1EC:    73            mov [r0], r3
$F1ED:    59            mov r2, [r1]
$F1EE:    70            mov [r0], r0
$F1EF:    69            mov byte ptr [r2], low(r1)
$F1F0:    42            mov r0, byte ptr [r2]
$F1F1:    3B            add r2, r3
$F1F2:    37            add r1, r3
$F1F3:    30            add r0, r0
$F1F4:    35            add r1, r1
$F1F5:    2A            mov r2, r2
$F1F6:    58            mov r2, [r0]
$F1F7:    0A            mov r0, sp
$F1F8:    00            trap
$F1F9:    5F            mov r3, [r3]
$F1FA:    5F            mov r3, [r3]
$F1FB:    5F            mov r3, [r3]
$F1FC:    5F            mov r3, [r3]
$F1FD:    5F            mov r3, [r3]
$F1FE:    5F            mov r3, [r3]
$F1FF:    5F            mov r3, [r3]
$F200:    5F            mov r3, [r3]
$F201:    5F            mov r3, [r3]
$F202:    5F            mov r3, [r3]
$F203:    5F            mov r3, [r3]
$F204:    5F            mov r3, [r3]
$F205:    5F            mov r3, [r3]
$F206:    5F            mov r3, [r3]
$F207:    5F            mov r3, [r3]
$F208:    5F            mov r3, [r3]
$F209:    5F            mov r3, [r3]
$F20A:    5F            mov r3, [r3]
$F20B:    5F            mov r3, [r3]
$F20C:    5F            mov r3, [r3]
$F20D:    5F            mov r3, [r3]
$F20E:    5F            mov r3, [r3]
$F20F:    5F            mov r3, [r3]
$F210:    5F            mov r3, [r3]
$F211:    5F            mov r3, [r3]
$F212:    5F            mov r3, [r3]
$F213:    5F            mov r3, [r3]
$F214:    5F            mov r3, [r3]
$F215:    5F            mov r3, [r3]
$F216:    5F            mov r3, [r3]
$F217:    5F            mov r3, [r3]
$F218:    5F            mov r3, [r3]
$F219:    5F            mov r3, [r3]
$F21A:    5F            mov r3, [r3]
$F21B:    5F            mov r3, [r3]
$F21C:    5F            mov r3, [r3]
$F21D:    5F            mov r3, [r3]
$F21E:    5F            mov r3, [r3]
$F21F:    5F            mov r3, [r3]
$F220:    5F            mov r3, [r3]
$F221:    5F            mov r3, [r3]
$F222:    5F            mov r3, [r3]
$F223:    5F            mov r3, [r3]
$F224:    5F            mov r3, [r3]
$F225:    5F            mov r3, [r3]
$F226:    5F            mov r3, [r3]
$F227:    5F            mov r3, [r3]
$F228:    5F            mov r3, [r3]
$F229:    5F            mov r3, [r3]
$F22A:    5F            mov r3, [r3]
$F22B:    5F            mov r3, [r3]
$F22C:    00            trap
$F22D:    55            mov r1, [r1]
$F22E:    73            mov [r0], r3
$F22F:    65            mov byte ptr [r1], low(r1)
$F230:    72            mov [r0], r2
$F231:    6E            mov byte ptr [r3], low(r2)
$F232:    61            mov byte ptr [r0], low(r1)
$F233:    6D            mov byte ptr [r3], low(r1)
$F234:    65            mov byte ptr [r1], low(r1)
$F235:    3A            add r2, r2
$F236:    20            mov r0, r0
$F237:    00            trap
$F238:    3E            add r3, r2
$F239:    3E            add r3, r2
$F23A:    20            mov r0, r0
$F23B:    55            mov r1, [r1]
$F23C:    73            mov [r0], r3
$F23D:    65            mov byte ptr [r1], low(r1)
$F23E:    72            mov [r0], r2
$F23F:    6E            mov byte ptr [r3], low(r2)
$F240:    61            mov byte ptr [r0], low(r1)
$F241:    6D            mov byte ptr [r3], low(r1)
$F242:    65            mov byte ptr [r1], low(r1)
$F243:    20            mov r0, r0
$F244:    4F            mov r3, byte ptr [r3]
$F245:    4B            mov r2, byte ptr [r3]
$F246:    2E            mov r3, r2
$F247:    20            mov r0, r0
$F248:    50            mov r0, [r0]
$F249:    61            mov byte ptr [r0], low(r1)
$F24A:    73            mov [r0], r3
$F24B:    73            mov [r0], r3
$F24C:    77            mov [r1], r3
$F24D:    6F            mov byte ptr [r3], low(r3)
$F24E:    72            mov [r0], r2
$F24F:    64            mov byte ptr [r1], low(r0)
$F250:    20            mov r0, r0
$F251:    72            mov [r0], r2
$F252:    65            mov byte ptr [r1], low(r1)
$F253:    71            mov [r0], r1
$F254:    75            mov [r1], r1
$F255:    69            mov byte ptr [r2], low(r1)
$F256:    72            mov [r0], r2
$F257:    65            mov byte ptr [r1], low(r1)
$F258:    64            mov byte ptr [r1], low(r0)
$F259:    0A            mov r0, sp
$F25A:    50            mov r0, [r0]
$F25B:    61            mov byte ptr [r0], low(r1)
$F25C:    73            mov [r0], r3
$F25D:    73            mov [r0], r3
$F25E:    77            mov [r1], r3
$F25F:    6F            mov byte ptr [r3], low(r3)
$F260:    72            mov [r0], r2
$F261:    64            mov byte ptr [r1], low(r0)
$F262:    3A            add r2, r2
$F263:    20            mov r0, r0
$F264:    00            trap
$F265:    3E            add r3, r2
$F266:    3E            add r3, r2
$F267:    20            mov r0, r0
$F268:    50            mov r0, [r0]
$F269:    6C            mov byte ptr [r3], low(r0)
$F26A:    65            mov byte ptr [r1], low(r1)
$F26B:    61            mov byte ptr [r0], low(r1)
$F26C:    73            mov [r0], r3
$F26D:    65            mov byte ptr [r1], low(r1)
$F26E:    20            mov r0, r0
$F26F:    77            mov [r1], r3
$F270:    61            mov byte ptr [r0], low(r1)
$F271:    69            mov byte ptr [r2], low(r1)
$F272:    74            mov [r1], r0
$F273:    2E            mov r3, r2
$F274:    2E            mov r3, r2
$F275:    2E            mov r3, r2
$F276:    0A            mov r0, sp
$F277:    00            trap
$F278:    3E            add r3, r2
$F279:    3E            add r3, r2
$F27A:    20            mov r0, r0
$F27B:    55            mov r1, [r1]
$F27C:    73            mov [r0], r3
$F27D:    65            mov byte ptr [r1], low(r1)
$F27E:    72            mov [r0], r2
$F27F:    20            mov r0, r0
$F280:    6E            mov byte ptr [r3], low(r2)
$F281:    6F            mov byte ptr [r3], low(r3)
$F282:    74            mov [r1], r0
$F283:    20            mov r0, r0
$F284:    66            mov byte ptr [r1], low(r2)
$F285:    6F            mov byte ptr [r3], low(r3)
$F286:    75            mov [r1], r1
$F287:    6E            mov byte ptr [r3], low(r2)
$F288:    64            mov byte ptr [r1], low(r0)
$F289:    20            mov r0, r0
$F28A:    69            mov byte ptr [r2], low(r1)
$F28B:    6E            mov byte ptr [r3], low(r2)
$F28C:    20            mov r0, r0
$F28D:    64            mov byte ptr [r1], low(r0)
$F28E:    61            mov byte ptr [r0], low(r1)
$F28F:    74            mov [r1], r0
$F290:    61            mov byte ptr [r0], low(r1)
$F291:    62            mov byte ptr [r0], low(r2)
$F292:    61            mov byte ptr [r0], low(r1)
$F293:    73            mov [r0], r3
$F294:    65            mov byte ptr [r1], low(r1)
$F295:    2E            mov r3, r2
$F296:    0A            mov r0, sp
$F297:    00            trap
$F298:    3E            add r3, r2
$F299:    3E            add r3, r2
$F29A:    20            mov r0, r0
$F29B:    50            mov r0, [r0]
$F29C:    61            mov byte ptr [r0], low(r1)
$F29D:    73            mov [r0], r3
$F29E:    73            mov [r0], r3
$F29F:    77            mov [r1], r3
$F2A0:    6F            mov byte ptr [r3], low(r3)
$F2A1:    72            mov [r0], r2
$F2A2:    64            mov byte ptr [r1], low(r0)
$F2A3:    20            mov r0, r0
$F2A4:    69            mov byte ptr [r2], low(r1)
$F2A5:    73            mov [r0], r3
$F2A6:    20            mov r0, r0
$F2A7:    69            mov byte ptr [r2], low(r1)
$F2A8:    6E            mov byte ptr [r3], low(r2)
$F2A9:    63            mov byte ptr [r0], low(r3)
$F2AA:    6F            mov byte ptr [r3], low(r3)
$F2AB:    72            mov [r0], r2
$F2AC:    72            mov [r0], r2
$F2AD:    65            mov byte ptr [r1], low(r1)
$F2AE:    63            mov byte ptr [r0], low(r3)
$F2AF:    74            mov [r1], r0
$F2B0:    2E            mov r3, r2
$F2B1:    0A            mov r0, sp
$F2B2:    00            trap
$F2B3:    3E            add r3, r2
$F2B4:    3E            add r3, r2
$F2B5:    20            mov r0, r0
$F2B6:    4C            mov r3, byte ptr [r0]
$F2B7:    6F            mov byte ptr [r3], low(r3)
$F2B8:    67            mov byte ptr [r1], low(r3)
$F2B9:    69            mov byte ptr [r2], low(r1)
$F2BA:    6E            mov byte ptr [r3], low(r2)
$F2BB:    20            mov r0, r0
$F2BC:    73            mov [r0], r3
$F2BD:    75            mov [r1], r1
$F2BE:    63            mov byte ptr [r0], low(r3)
$F2BF:    63            mov byte ptr [r0], low(r3)
$F2C0:    65            mov byte ptr [r1], low(r1)
$F2C1:    73            mov [r0], r3
$F2C2:    73            mov [r0], r3
$F2C3:    66            mov byte ptr [r1], low(r2)
$F2C4:    75            mov [r1], r1
$F2C5:    6C            mov byte ptr [r3], low(r0)
$F2C6:    2E            mov r3, r2
$F2C7:    0A            mov r0, sp
$F2C8:    3D            add r3, r1
$F2C9:    3D            add r3, r1
$F2CA:    3D            add r3, r1
$F2CB:    3D            add r3, r1
$F2CC:    3D            add r3, r1
$F2CD:    3D            add r3, r1
$F2CE:    3D            add r3, r1
$F2CF:    3D            add r3, r1
$F2D0:    3D            add r3, r1
$F2D1:    3D            add r3, r1
$F2D2:    3D            add r3, r1
$F2D3:    3D            add r3, r1
$F2D4:    3D            add r3, r1
$F2D5:    3D            add r3, r1
$F2D6:    3D            add r3, r1
$F2D7:    3D            add r3, r1
$F2D8:    3D            add r3, r1
$F2D9:    3D            add r3, r1
$F2DA:    3D            add r3, r1
$F2DB:    3D            add r3, r1
$F2DC:    3D            add r3, r1
$F2DD:    3D            add r3, r1
$F2DE:    3D            add r3, r1
$F2DF:    3D            add r3, r1
$F2E0:    3D            add r3, r1
$F2E1:    3D            add r3, r1
$F2E2:    3D            add r3, r1
$F2E3:    3D            add r3, r1
$F2E4:    3D            add r3, r1
$F2E5:    3D            add r3, r1
$F2E6:    3D            add r3, r1
$F2E7:    3D            add r3, r1
$F2E8:    3D            add r3, r1
$F2E9:    3D            add r3, r1
$F2EA:    3D            add r3, r1
$F2EB:    3D            add r3, r1
$F2EC:    3D            add r3, r1
$F2ED:    3D            add r3, r1
$F2EE:    3D            add r3, r1
$F2EF:    3D            add r3, r1
$F2F0:    3D            add r3, r1
$F2F1:    3D            add r3, r1
$F2F2:    3D            add r3, r1
$F2F3:    3D            add r3, r1
$F2F4:    3D            add r3, r1
$F2F5:    3D            add r3, r1
$F2F6:    3D            add r3, r1
$F2F7:    3D            add r3, r1
$F2F8:    3D            add r3, r1
$F2F9:    3D            add r3, r1
$F2FA:    3D            add r3, r1
$F2FB:    3D            add r3, r1
$F2FC:    3D            add r3, r1
$F2FD:    3D            add r3, r1
$F2FE:    3D            add r3, r1
$F2FF:    3D            add r3, r1
$F300:    3D            add r3, r1
$F301:    3D            add r3, r1
$F302:    3D            add r3, r1
$F303:    3D            add r3, r1
$F304:    3D            add r3, r1
$F305:    3D            add r3, r1
$F306:    3D            add r3, r1
$F307:    3D            add r3, r1
$F308:    3D            add r3, r1
$F309:    3D            add r3, r1
$F30A:    3D            add r3, r1
$F30B:    3D            add r3, r1
$F30C:    3D            add r3, r1
$F30D:    3D            add r3, r1
$F30E:    0A            mov r0, sp
$F30F:    52            mov r0, [r2]
$F310:    75            mov [r1], r1
$F311:    6E            mov byte ptr [r3], low(r2)
$F312:    6E            mov byte ptr [r3], low(r2)
$F313:    69            mov byte ptr [r2], low(r1)
$F314:    6E            mov byte ptr [r3], low(r2)
$F315:    67            mov byte ptr [r1], low(r3)
$F316:    20            mov r0, r0
$F317:    6D            mov byte ptr [r3], low(r1)
$F318:    61            mov byte ptr [r0], low(r1)
$F319:    63            mov byte ptr [r0], low(r3)
$F31A:    68            mov byte ptr [r2], low(r0)
$F31B:    69            mov byte ptr [r2], low(r1)
$F31C:    6E            mov byte ptr [r3], low(r2)
$F31D:    65            mov byte ptr [r1], low(r1)
$F31E:    20            mov r0, r0
$F31F:    6C            mov byte ptr [r3], low(r0)
$F320:    61            mov byte ptr [r0], low(r1)
$F321:    6E            mov byte ptr [r3], low(r2)
$F322:    67            mov byte ptr [r1], low(r3)
$F323:    75            mov [r1], r1
$F324:    61            mov byte ptr [r0], low(r1)
$F325:    67            mov byte ptr [r1], low(r3)
$F326:    65            mov byte ptr [r1], low(r1)
$F327:    20            mov r0, r0
$F328:    6D            mov byte ptr [r3], low(r1)
$F329:    6F            mov byte ptr [r3], low(r3)
$F32A:    6E            mov byte ptr [r3], low(r2)
$F32B:    69            mov byte ptr [r2], low(r1)
$F32C:    74            mov [r1], r0
$F32D:    6F            mov byte ptr [r3], low(r3)
$F32E:    72            mov [r0], r2
$F32F:    20            mov r0, r0
$F330:    6E            mov byte ptr [r3], low(r2)
$F331:    6F            mov byte ptr [r3], low(r3)
$F332:    77            mov [r1], r3
$F333:    2E            mov r3, r2
$F334:    0A            mov r0, sp
$F335:    3D            add r3, r1
$F336:    3D            add r3, r1
$F337:    3D            add r3, r1
$F338:    3D            add r3, r1
$F339:    3D            add r3, r1
$F33A:    3D            add r3, r1
$F33B:    3D            add r3, r1
$F33C:    3D            add r3, r1
$F33D:    3D            add r3, r1
$F33E:    3D            add r3, r1
$F33F:    3D            add r3, r1
$F340:    3D            add r3, r1
$F341:    3D            add r3, r1
$F342:    3D            add r3, r1
$F343:    3D            add r3, r1
$F344:    3D            add r3, r1
$F345:    3D            add r3, r1
$F346:    3D            add r3, r1
$F347:    3D            add r3, r1
$F348:    3D            add r3, r1
$F349:    3D            add r3, r1
$F34A:    3D            add r3, r1
$F34B:    3D            add r3, r1
$F34C:    3D            add r3, r1
$F34D:    3D            add r3, r1
$F34E:    3D            add r3, r1
$F34F:    3D            add r3, r1
$F350:    3D            add r3, r1
$F351:    3D            add r3, r1
$F352:    3D            add r3, r1
$F353:    3D            add r3, r1
$F354:    3D            add r3, r1
$F355:    3D            add r3, r1
$F356:    3D            add r3, r1
$F357:    3D            add r3, r1
$F358:    3D            add r3, r1
$F359:    3D            add r3, r1
$F35A:    3D            add r3, r1
$F35B:    3D            add r3, r1
$F35C:    3D            add r3, r1
$F35D:    3D            add r3, r1
$F35E:    3D            add r3, r1
$F35F:    3D            add r3, r1
$F360:    3D            add r3, r1
$F361:    3D            add r3, r1
$F362:    3D            add r3, r1
$F363:    3D            add r3, r1
$F364:    3D            add r3, r1
$F365:    3D            add r3, r1
$F366:    3D            add r3, r1
$F367:    3D            add r3, r1
$F368:    3D            add r3, r1
$F369:    3D            add r3, r1
$F36A:    3D            add r3, r1
$F36B:    3D            add r3, r1
$F36C:    3D            add r3, r1
$F36D:    3D            add r3, r1
$F36E:    3D            add r3, r1
$F36F:    3D            add r3, r1
$F370:    3D            add r3, r1
$F371:    3D            add r3, r1
$F372:    3D            add r3, r1
$F373:    3D            add r3, r1
$F374:    3D            add r3, r1
$F375:    3D            add r3, r1
$F376:    3D            add r3, r1
$F377:    3D            add r3, r1
$F378:    3D            add r3, r1
$F379:    3D            add r3, r1
$F37A:    3D            add r3, r1
$F37B:    0A            mov r0, sp
$F37C:    0A            mov r0, sp
$F37D:    00            trap
$F37E:    A6            push sp
$F37F:    BC B6 FB      mov [$FBB6], r0
$F382:    BD B8 FB      mov [$FBB8], r0
$F385:    BE BA FB      mov [$FBBA], r0
$F388:    BF BC FB      mov [$FBBC], r0
$F38B:    94            pop r0
$F38C:    BC BE FB      mov [$FBBE], r0
$F38F:    0A            mov r0, sp
$F390:    50            mov r0, [r0]
$F391:    E0 FF FF      add r0, $FFFF
$F394:    BC C0 FB      mov [$FBC0], r0
$F397:    11 0C 00      mov r1, $000C
$F39A:    12 C2 FB      mov r2, $FBC2
$F39D:    B7 BE FB      mov r3, [$FBBE]
$F3A0:    99 28 00      call $0028    # <MemCpy>
$F3A3:    12 1C FB      mov r2, $FB1C
$F3A6:    99 08 00      call $0008    # <PrintStr>
$F3A9:    10 00 00      mov r0, $0000
$F3AC:    B8 02 E0      mov byte ptr [$E002], low(r0)
$F3AF:    12 12 FB      mov r2, $FB12
$F3B2:    99 08 00      call $0008    # <PrintStr>
$F3B5:    12 00 E0      mov r2, $E000
$F3B8:    13 08 00      mov r3, $0008
$F3BB:    99 30 00      call $0030    # <ReadStr>
$F3BE:    A5 00 00      cmp r3, $0000
$F3C1:    9C 39 F4      je $F439
$F3C4:    12 00 E0      mov r2, $E000
$F3C7:    99 38 00      call $0038    # <StrTrim>
$F3CA:    B0 02 E0      mov r0, byte ptr [$E002]
$F3CD:    A2 00 00      cmp r0, $0000
$F3D0:    9D 30 F4      jne $F430
$F3D3:    B4 00 E0      mov r0, [$E000]
$F3D6:    A2 68 0A      cmp r0, $0A68
$F3D9:    9C 42 F4      je $F442
$F3DC:    A2 68 00      cmp r0, $0068
$F3DF:    9C 42 F4      je $F442
$F3E2:    A2 72 00      cmp r0, $0072
$F3E5:    9C 4B F4      je $F44B
$F3E8:    A2 72 0A      cmp r0, $0A72
$F3EB:    9C 4B F4      je $F44B
$F3EE:    A2 70 00      cmp r0, $0070
$F3F1:    9C 4A F5      je $F54A
$F3F4:    A2 70 0A      cmp r0, $0A70
$F3F7:    9C 4A F5      je $F54A
$F3FA:    A2 78 00      cmp r0, $0078
$F3FD:    9C 66 F5      je $F566
$F400:    A2 78 0A      cmp r0, $0A78
$F403:    9C 66 F5      je $F566
$F406:    A2 63 00      cmp r0, $0063
$F409:    9C AC F5      je $F5AC
$F40C:    A2 63 0A      cmp r0, $0A63
$F40F:    9C AC F5      je $F5AC
$F412:    A2 55 43      cmp r0, $4355
$F415:    9C 00 F6      je $F600
$F418:    A2 6C 73      cmp r0, $736C
$F41B:    9C BF F5      je $F5BF
$F41E:    A2 72 66      cmp r0, $6672
$F421:    9C 09 F6      je $F609
$F424:    A2 77 00      cmp r0, $0077
$F427:    9C BB F4      je $F4BB
$F42A:    A2 77 0A      cmp r0, $0A77
$F42D:    9C BB F4      je $F4BB
$F430:    12 B5 F7      mov r2, $F7B5
$F433:    99 08 00      call $0008    # <PrintStr>
$F436:    98 A9 F3      jmp $F3A9    # <None>
$F439:    12 9C F7      mov r2, $F79C
$F43C:    99 08 00      call $0008    # <PrintStr>
$F43F:    98 A9 F3      jmp $F3A9    # <None>
$F442:    12 24 F9      mov r2, $F924
$F445:    99 08 00      call $0008    # <PrintStr>
$F448:    98 A9 F3      jmp $F3A9    # <None>
$F44B:    12 F0 F7      mov r2, $F7F0
$F44E:    99 08 00      call $0008    # <PrintStr>
$F451:    12 00 E0      mov r2, $E000
$F454:    13 08 00      mov r3, $0008
$F457:    99 30 00      call $0030    # <ReadStr>
$F45A:    12 00 E0      mov r2, $E000
$F45D:    99 20 00      call $0020    # <ConvertHex>
$F460:    A2 FF FF      cmp r0, $FFFF
$F463:    9C B2 F4      je $F4B2
$F466:    90            push r0
$F467:    12 02 F8      mov r2, $F802
$F46A:    99 08 00      call $0008    # <PrintStr>
$F46D:    12 00 E0      mov r2, $E000
$F470:    13 08 00      mov r3, $0008
$F473:    99 30 00      call $0030    # <ReadStr>
$F476:    12 00 E0      mov r2, $E000
$F479:    99 20 00      call $0020    # <ConvertHex>
$F47C:    A2 FF FF      cmp r0, $FFFF
$F47F:    9C B2 F4      je $F4B2
$F482:    A2 00 00      cmp r0, $0000
$F485:    9C B2 F4      je $F4B2
$F488:    2C            mov r3, r0
$F489:    96            pop r2
$F48A:    92            push r2
$F48B:    93            push r3
$F48C:    11 08 00      mov r1, $0008
$F48F:    2E            mov r3, r2
$F490:    12 CE FB      mov r2, $FBCE
$F493:    99 28 00      call $0028    # <MemCpy>
$F496:    97            pop r3
$F497:    96            pop r2
$F498:    BE D6 FB      mov [$FBD6], r0
$F49B:    92            push r2
$F49C:    93            push r3
$F49D:    12 8F FB      mov r2, $FB8F
$F4A0:    99 08 00      call $0008    # <PrintStr>
$F4A3:    97            pop r3
$F4A4:    96            pop r2
$F4A5:    E2 08 00      add r2, $0008
$F4A8:    AF            dec r3
$F4A9:    A5 00 00      cmp r3, $0000
$F4AC:    9D 8A F4      jne $F48A
$F4AF:    98 A9 F3      jmp $F3A9    # <None>
$F4B2:    12 D8 F7      mov r2, $F7D8
$F4B5:    99 08 00      call $0008    # <PrintStr>
$F4B8:    98 A9 F3      jmp $F3A9    # <None>
$F4BB:    12 F0 F7      mov r2, $F7F0
$F4BE:    99 08 00      call $0008    # <PrintStr>
$F4C1:    12 00 E0      mov r2, $E000
$F4C4:    13 08 00      mov r3, $0008
$F4C7:    99 30 00      call $0030    # <ReadStr>
$F4CA:    12 00 E0      mov r2, $E000
$F4CD:    99 20 00      call $0020    # <ConvertHex>
$F4D0:    A2 FF FF      cmp r0, $FFFF
$F4D3:    9C 41 F5      je $F541
$F4D6:    BC D6 FB      mov [$FBD6], r0
$F4D9:    12 B0 F8      mov r2, $F8B0
$F4DC:    99 08 00      call $0008    # <PrintStr>
$F4DF:    13 02 E0      mov r3, $E002
$F4E2:    10 00 00      mov r0, $0000
$F4E5:    6C            mov byte ptr [r3], low(r0)
$F4E6:    AF            dec r3
$F4E7:    6C            mov byte ptr [r3], low(r0)
$F4E8:    AF            dec r3
$F4E9:    06 02         in r0, char
$F4EB:    6C            mov byte ptr [r3], low(r0)
$F4EC:    2B            mov r2, r3
$F4ED:    A2 2E 00      cmp r0, $002E
$F4F0:    9C 30 F5      je $F530
$F4F3:    A2 0A 00      cmp r0, $000A
$F4F6:    9C E9 F4      je $F4E9
$F4F9:    93            push r3
$F4FA:    99 20 00      call $0020    # <ConvertHex>
$F4FD:    97            pop r3
$F4FE:    A2 FF FF      cmp r0, $FFFF
$F501:    9C E9 F4      je $F4E9
$F504:    AB            inc r3
$F505:    06 02         in r0, char
$F507:    6C            mov byte ptr [r3], low(r0)
$F508:    2B            mov r2, r3
$F509:    A2 2E 00      cmp r0, $002E
$F50C:    9C 30 F5      je $F530
$F50F:    A2 0A 00      cmp r0, $000A
$F512:    9C 05 F5      je $F505
$F515:    93            push r3
$F516:    99 20 00      call $0020    # <ConvertHex>
$F519:    97            pop r3
$F51A:    A2 FF FF      cmp r0, $FFFF
$F51D:    9C 05 F5      je $F505
$F520:    AF            dec r3
$F521:    2B            mov r2, r3
$F522:    99 20 00      call $0020    # <ConvertHex>
$F525:    B5 D6 FB      mov r1, [$FBD6]
$F528:    64            mov byte ptr [r1], low(r0)
$F529:    A9            inc r1
$F52A:    BD D6 FB      mov [$FBD6], r0
$F52D:    98 DF F4      jmp $F4DF    # <None>
$F530:    06 02         in r0, char
$F532:    A2 0A 00      cmp r0, $000A
$F535:    9D 30 F5      jne $F530
$F538:    12 62 F8      mov r2, $F862
$F53B:    99 08 00      call $0008    # <PrintStr>
$F53E:    98 A9 F3      jmp $F3A9    # <None>
$F541:    12 D8 F7      mov r2, $F7D8
$F544:    99 08 00      call $0008    # <PrintStr>
$F547:    98 A9 F3      jmp $F3A9    # <None>
$F54A:    12 F0 F7      mov r2, $F7F0
$F54D:    99 08 00      call $0008    # <PrintStr>
$F550:    12 00 E0      mov r2, $E000
$F553:    13 08 00      mov r3, $0008
$F556:    99 30 00      call $0030    # <ReadStr>
$F559:    12 00 E0      mov r2, $E000
$F55C:    99 20 00      call $0020    # <ConvertHex>
$F55F:    28            mov r2, r0
$F560:    99 08 00      call $0008    # <PrintStr>
$F563:    98 A9 F3      jmp $F3A9    # <None>
$F566:    12 F0 F7      mov r2, $F7F0
$F569:    99 08 00      call $0008    # <PrintStr>
$F56C:    12 00 E0      mov r2, $E000
$F56F:    13 08 00      mov r3, $0008
$F572:    99 30 00      call $0030    # <ReadStr>
$F575:    12 00 E0      mov r2, $E000
$F578:    99 20 00      call $0020    # <ConvertHex>
$F57B:    90            push r0
$F57C:    BC D6 FB      mov [$FBD6], r0
$F57F:    12 15 F8      mov r2, $F815
$F582:    99 08 00      call $0008    # <PrintStr>
$F585:    12 00 E0      mov r2, $E000
$F588:    13 08 00      mov r3, $0008
$F58B:    99 30 00      call $0030    # <ReadStr>
$F58E:    B0 00 E0      mov r0, byte ptr [$E000]
$F591:    A2 59 00      cmp r0, $0059
$F594:    9C A7 F5      je $F5A7
$F597:    A2 79 00      cmp r0, $0079
$F59A:    9C A7 F5      je $F5A7
$F59D:    12 3A F8      mov r2, $F83A
$F5A0:    99 08 00      call $0008    # <PrintStr>
$F5A3:    94            pop r0
$F5A4:    98 A9 F3      jmp $F3A9    # <None>
$F5A7:    97            pop r3
$F5A8:    CC            call r3
$F5A9:    98 A9 F3      jmp $F3A9    # <None>
$F5AC:    12 55 F8      mov r2, $F855
$F5AF:    99 08 00      call $0008    # <PrintStr>
$F5B2:    B4 B6 FB      mov r0, [$FBB6]
$F5B5:    B5 B8 FB      mov r1, [$FBB8]
$F5B8:    B6 BA FB      mov r2, [$FBBA]
$F5BB:    B7 BC FB      mov r3, [$FBBC]
$F5BE:    05            ret
$F5BF:    12 DD FA      mov r2, $FADD
$F5C2:    99 08 00      call $0008    # <PrintStr>
$F5C5:    10 00 00      mov r0, $0000
$F5C8:    11 00 E0      mov r1, $E000
$F5CB:    06 04         in r0, char
$F5CD:    13 00 E0      mov r3, $E000
$F5D0:    43            mov r0, byte ptr [r3]
$F5D1:    A2 00 00      cmp r0, $0000
$F5D4:    9C F4 F5      je $F5F4
$F5D7:    93            push r3
$F5D8:    B8 CE FB      mov byte ptr [$FBCE], low(r0)
$F5DB:    AB            inc r3
$F5DC:    53            mov r0, [r3]
$F5DD:    93            push r3
$F5DE:    BC D6 FB      mov [$FBD6], r0
$F5E1:    12 06 FB      mov r2, $FB06
$F5E4:    99 08 00      call $0008    # <PrintStr>
$F5E7:    97            pop r3
$F5E8:    AB            inc r3
$F5E9:    AB            inc r3
$F5EA:    2B            mov r2, r3
$F5EB:    99 08 00      call $0008    # <PrintStr>
$F5EE:    10 0A 00      mov r0, $000A
$F5F1:    06 01         in r0, char
$F5F3:    97            pop r3
$F5F4:    E3 10 00      add r3, $0010
$F5F7:    A5 00 EF      cmp r3, $EF00
$F5FA:    9D D0 F5      jne $F5D0
$F5FD:    98 A9 F3      jmp $F3A9    # <None>
$F600:    12 DF F8      mov r2, $F8DF
$F603:    99 08 00      call $0008    # <PrintStr>
$F606:    98 A9 F3      jmp $F3A9    # <None>
$F609:    12 8A F8      mov r2, $F88A
$F60C:    99 08 00      call $0008    # <PrintStr>
$F60F:    10 00 00      mov r0, $0000
$F612:    11 00 E0      mov r1, $E000
$F615:    06 04         in r0, char
$F617:    12 B0 EF      mov r2, $EFB0
$F61A:    13 10 00      mov r3, $0010
$F61D:    99 30 00      call $0030    # <ReadStr>
$F620:    A5 00 00      cmp r3, $0000
$F623:    9C 8A F6      je $F68A
$F626:    12 B0 EF      mov r2, $EFB0
$F629:    99 38 00      call $0038    # <StrTrim>
$F62C:    13 03 E0      mov r3, $E003
$F62F:    12 B0 EF      mov r2, $EFB0
$F632:    93            push r3
$F633:    99 10 00      call $0010    # <StrCmp>
$F636:    97            pop r3
$F637:    A2 00 00      cmp r0, $0000
$F63A:    9C 49 F6      je $F649
$F63D:    E3 10 00      add r3, $0010
$F640:    A5 03 EF      cmp r3, $EF03
$F643:    9C 81 F6      je $F681
$F646:    98 2F F6      jmp $F62F    # <None>
$F649:    AF            dec r3
$F64A:    AF            dec r3
$F64B:    AF            dec r3
$F64C:    43            mov r0, byte ptr [r3]
$F64D:    AB            inc r3
$F64E:    57            mov r1, [r3]
$F64F:    91            push r1
$F650:    11 00 E0      mov r1, $E000
$F653:    06 04         in r0, char
$F655:    12 F0 F7      mov r2, $F7F0
$F658:    99 08 00      call $0008    # <PrintStr>
$F65B:    12 E0 EF      mov r2, $EFE0
$F65E:    13 10 00      mov r3, $0010
$F661:    99 30 00      call $0030    # <ReadStr>
$F664:    12 E0 EF      mov r2, $EFE0
$F667:    99 20 00      call $0020    # <ConvertHex>
$F66A:    95            pop r1
$F66B:    A2 FF FF      cmp r0, $FFFF
$F66E:    9C 93 F6      je $F693
$F671:    28            mov r2, r0
$F672:    13 00 E0      mov r3, $E000
$F675:    99 28 00      call $0028    # <MemCpy>
$F678:    12 62 F8      mov r2, $F862
$F67B:    99 08 00      call $0008    # <PrintStr>
$F67E:    98 A9 F3      jmp $F3A9    # <None>
$F681:    12 97 F8      mov r2, $F897
$F684:    99 08 00      call $0008    # <PrintStr>
$F687:    98 A9 F3      jmp $F3A9    # <None>
$F68A:    12 9C F7      mov r2, $F79C
$F68D:    99 08 00      call $0008    # <PrintStr>
$F690:    98 A9 F3      jmp $F3A9    # <None>
$F693:    12 D8 F7      mov r2, $F7D8
$F696:    99 08 00      call $0008    # <PrintStr>
$F699:    98 A9 F3      jmp $F3A9    # <None>
$F69C:    3D            add r3, r1
$F69D:    3D            add r3, r1
$F69E:    3D            add r3, r1
$F69F:    3D            add r3, r1
$F6A0:    3D            add r3, r1
$F6A1:    3D            add r3, r1
$F6A2:    3D            add r3, r1
$F6A3:    3D            add r3, r1
$F6A4:    3D            add r3, r1
$F6A5:    3D            add r3, r1
$F6A6:    3D            add r3, r1
$F6A7:    3D            add r3, r1
$F6A8:    3D            add r3, r1
$F6A9:    3D            add r3, r1
$F6AA:    3D            add r3, r1
$F6AB:    3D            add r3, r1
$F6AC:    3D            add r3, r1
$F6AD:    3D            add r3, r1
$F6AE:    3D            add r3, r1
$F6AF:    3D            add r3, r1
$F6B0:    3D            add r3, r1
$F6B1:    3D            add r3, r1
$F6B2:    3D            add r3, r1
$F6B3:    3D            add r3, r1
$F6B4:    3D            add r3, r1
$F6B5:    3D            add r3, r1
$F6B6:    3D            add r3, r1
$F6B7:    3D            add r3, r1
$F6B8:    3D            add r3, r1
$F6B9:    3D            add r3, r1
$F6BA:    3D            add r3, r1
$F6BB:    3D            add r3, r1
$F6BC:    3D            add r3, r1
$F6BD:    3D            add r3, r1
$F6BE:    3D            add r3, r1
$F6BF:    3D            add r3, r1
$F6C0:    3D            add r3, r1
$F6C1:    3D            add r3, r1
$F6C2:    3D            add r3, r1
$F6C3:    3D            add r3, r1
$F6C4:    3D            add r3, r1
$F6C5:    3D            add r3, r1
$F6C6:    3D            add r3, r1
$F6C7:    3D            add r3, r1
$F6C8:    3D            add r3, r1
$F6C9:    3D            add r3, r1
$F6CA:    3D            add r3, r1
$F6CB:    3D            add r3, r1
$F6CC:    3D            add r3, r1
$F6CD:    3D            add r3, r1
$F6CE:    3D            add r3, r1
$F6CF:    3D            add r3, r1
$F6D0:    3D            add r3, r1
$F6D1:    3D            add r3, r1
$F6D2:    3D            add r3, r1
$F6D3:    3D            add r3, r1
$F6D4:    3D            add r3, r1
$F6D5:    3D            add r3, r1
$F6D6:    3D            add r3, r1
$F6D7:    3D            add r3, r1
$F6D8:    3D            add r3, r1
$F6D9:    3D            add r3, r1
$F6DA:    3D            add r3, r1
$F6DB:    3D            add r3, r1
$F6DC:    3D            add r3, r1
$F6DD:    3D            add r3, r1
$F6DE:    3D            add r3, r1
$F6DF:    3D            add r3, r1
$F6E0:    3D            add r3, r1
$F6E1:    3D            add r3, r1
$F6E2:    0D             === ILLEGAL OPCODE ===
$F6E3:    0A            mov r0, sp
$F6E4:    57            mov r1, [r3]
$F6E5:    65            mov byte ptr [r1], low(r1)
$F6E6:    6C            mov byte ptr [r3], low(r0)
$F6E7:    63            mov byte ptr [r0], low(r3)
$F6E8:    6F            mov byte ptr [r3], low(r3)
$F6E9:    6D            mov byte ptr [r3], low(r1)
$F6EA:    65            mov byte ptr [r1], low(r1)
$F6EB:    20            mov r0, r0
$F6EC:    74            mov [r1], r0
$F6ED:    6F            mov byte ptr [r3], low(r3)
$F6EE:    20            mov r0, r0
$F6EF:    47            mov r1, byte ptr [r3]
$F6F0:    6C            mov byte ptr [r3], low(r0)
$F6F1:    69            mov byte ptr [r2], low(r1)
$F6F2:    74            mov [r1], r0
$F6F3:    63            mov byte ptr [r0], low(r3)
$F6F4:    68            mov byte ptr [r2], low(r0)
$F6F5:    20            mov r0, r0
$F6F6:    52            mov r0, [r2]
$F6F7:    65            mov byte ptr [r1], low(r1)
$F6F8:    73            mov [r0], r3
$F6F9:    65            mov byte ptr [r1], low(r1)
$F6FA:    61            mov byte ptr [r0], low(r1)
$F6FB:    72            mov [r0], r2
$F6FC:    63            mov byte ptr [r0], low(r3)
$F6FD:    68            mov byte ptr [r2], low(r0)
$F6FE:    20            mov r0, r0
$F6FF:    4C            mov r3, byte ptr [r0]
$F700:    61            mov byte ptr [r0], low(r1)
$F701:    62            mov byte ptr [r0], low(r2)
$F702:    6F            mov byte ptr [r3], low(r3)
$F703:    72            mov [r0], r2
$F704:    61            mov byte ptr [r0], low(r1)
$F705:    74            mov [r1], r0
$F706:    6F            mov byte ptr [r3], low(r3)
$F707:    72            mov [r0], r2
$F708:    79            mov [r2], r1
$F709:    20            mov r0, r0
$F70A:    4E            mov r3, byte ptr [r2]
$F70B:    65            mov byte ptr [r1], low(r1)
$F70C:    74            mov [r1], r0
$F70D:    77            mov [r1], r3
$F70E:    6F            mov byte ptr [r3], low(r3)
$F70F:    72            mov [r0], r2
$F710:    6B            mov byte ptr [r2], low(r3)
$F711:    3A            add r2, r2
$F712:    20            mov r0, r0
$F713:    54            mov r1, [r0]
$F714:    65            mov byte ptr [r1], low(r1)
$F715:    73            mov [r0], r3
$F716:    74            mov [r1], r0
$F717:    20            mov r0, r0
$F718:    53            mov r0, [r3]
$F719:    65            mov byte ptr [r1], low(r1)
$F71A:    72            mov [r0], r2
$F71B:    76            mov [r1], r2
$F71C:    65            mov byte ptr [r1], low(r1)
$F71D:    72            mov [r0], r2
$F71E:    20            mov r0, r0
$F71F:    32            add r0, r2
$F720:    20            mov r0, r0
$F721:    28            mov r2, r0
$F722:    47            mov r1, byte ptr [r3]
$F723:    52            mov r0, [r2]
$F724:    4C            mov r3, byte ptr [r0]
$F725:    54            mov r1, [r0]
$F726:    53            mov r0, [r3]
$F727:    30            add r0, r0
$F728:    31            add r0, r1
$F729:    29            mov r2, r1
$F72A:    0D             === ILLEGAL OPCODE ===
$F72B:    0A            mov r0, sp
$F72C:    3D            add r3, r1
$F72D:    3D            add r3, r1
$F72E:    3D            add r3, r1
$F72F:    3D            add r3, r1
$F730:    3D            add r3, r1
$F731:    3D            add r3, r1
$F732:    3D            add r3, r1
$F733:    3D            add r3, r1
$F734:    3D            add r3, r1
$F735:    3D            add r3, r1
$F736:    3D            add r3, r1
$F737:    3D            add r3, r1
$F738:    3D            add r3, r1
$F739:    3D            add r3, r1
$F73A:    3D            add r3, r1
$F73B:    3D            add r3, r1
$F73C:    3D            add r3, r1
$F73D:    3D            add r3, r1
$F73E:    3D            add r3, r1
$F73F:    3D            add r3, r1
$F740:    3D            add r3, r1
$F741:    3D            add r3, r1
$F742:    3D            add r3, r1
$F743:    3D            add r3, r1
$F744:    3D            add r3, r1
$F745:    3D            add r3, r1
$F746:    3D            add r3, r1
$F747:    3D            add r3, r1
$F748:    3D            add r3, r1
$F749:    3D            add r3, r1
$F74A:    3D            add r3, r1
$F74B:    3D            add r3, r1
$F74C:    3D            add r3, r1
$F74D:    3D            add r3, r1
$F74E:    3D            add r3, r1
$F74F:    3D            add r3, r1
$F750:    3D            add r3, r1
$F751:    3D            add r3, r1
$F752:    3D            add r3, r1
$F753:    3D            add r3, r1
$F754:    3D            add r3, r1
$F755:    3D            add r3, r1
$F756:    3D            add r3, r1
$F757:    3D            add r3, r1
$F758:    3D            add r3, r1
$F759:    3D            add r3, r1
$F75A:    3D            add r3, r1
$F75B:    3D            add r3, r1
$F75C:    3D            add r3, r1
$F75D:    3D            add r3, r1
$F75E:    3D            add r3, r1
$F75F:    3D            add r3, r1
$F760:    3D            add r3, r1
$F761:    3D            add r3, r1
$F762:    3D            add r3, r1
$F763:    3D            add r3, r1
$F764:    3D            add r3, r1
$F765:    3D            add r3, r1
$F766:    3D            add r3, r1
$F767:    3D            add r3, r1
$F768:    3D            add r3, r1
$F769:    3D            add r3, r1
$F76A:    3D            add r3, r1
$F76B:    3D            add r3, r1
$F76C:    3D            add r3, r1
$F76D:    3D            add r3, r1
$F76E:    3D            add r3, r1
$F76F:    3D            add r3, r1
$F770:    3D            add r3, r1
$F771:    3D            add r3, r1
$F772:    0D             === ILLEGAL OPCODE ===
$F773:    0A            mov r0, sp
$F774:    54            mov r1, [r0]
$F775:    68            mov byte ptr [r2], low(r0)
$F776:    69            mov byte ptr [r2], low(r1)
$F777:    73            mov [r0], r3
$F778:    20            mov r0, r0
$F779:    6D            mov byte ptr [r3], low(r1)
$F77A:    61            mov byte ptr [r0], low(r1)
$F77B:    63            mov byte ptr [r0], low(r3)
$F77C:    68            mov byte ptr [r2], low(r0)
$F77D:    69            mov byte ptr [r2], low(r1)
$F77E:    6E            mov byte ptr [r3], low(r2)
$F77F:    65            mov byte ptr [r1], low(r1)
$F780:    20            mov r0, r0
$F781:    72            mov [r0], r2
$F782:    65            mov byte ptr [r1], low(r1)
$F783:    71            mov [r0], r1
$F784:    75            mov [r1], r1
$F785:    69            mov byte ptr [r2], low(r1)
$F786:    72            mov [r0], r2
$F787:    65            mov byte ptr [r1], low(r1)
$F788:    73            mov [r0], r3
$F789:    20            mov r0, r0
$F78A:    61            mov byte ptr [r0], low(r1)
$F78B:    75            mov [r1], r1
$F78C:    74            mov [r1], r0
$F78D:    68            mov byte ptr [r2], low(r0)
$F78E:    65            mov byte ptr [r1], low(r1)
$F78F:    6E            mov byte ptr [r3], low(r2)
$F790:    74            mov [r1], r0
$F791:    69            mov byte ptr [r2], low(r1)
$F792:    63            mov byte ptr [r0], low(r3)
$F793:    61            mov byte ptr [r0], low(r1)
$F794:    74            mov [r1], r0
$F795:    69            mov byte ptr [r2], low(r1)
$F796:    6F            mov byte ptr [r3], low(r3)
$F797:    6E            mov byte ptr [r3], low(r2)
$F798:    2E            mov r3, r2
$F799:    0D             === ILLEGAL OPCODE ===
$F79A:    0A            mov r0, sp
$F79B:    00            trap
$F79C:    21            mov r0, r1
$F79D:    20            mov r0, r0
$F79E:    49            mov r2, byte ptr [r1]
$F79F:    6E            mov byte ptr [r3], low(r2)
$F7A0:    70            mov [r0], r0
$F7A1:    75            mov [r1], r1
$F7A2:    74            mov [r1], r0
$F7A3:    20            mov r0, r0
$F7A4:    74            mov [r1], r0
$F7A5:    6F            mov byte ptr [r3], low(r3)
$F7A6:    6F            mov byte ptr [r3], low(r3)
$F7A7:    20            mov r0, r0
$F7A8:    6C            mov byte ptr [r3], low(r0)
$F7A9:    6F            mov byte ptr [r3], low(r3)
$F7AA:    6E            mov byte ptr [r3], low(r2)
$F7AB:    67            mov byte ptr [r1], low(r3)
$F7AC:    20            mov r0, r0
$F7AD:    65            mov byte ptr [r1], low(r1)
$F7AE:    72            mov [r0], r2
$F7AF:    72            mov [r0], r2
$F7B0:    6F            mov byte ptr [r3], low(r3)
$F7B1:    72            mov [r0], r2
$F7B2:    2E            mov r3, r2
$F7B3:    0A            mov r0, sp
$F7B4:    00            trap
$F7B5:    21            mov r0, r1
$F7B6:    20            mov r0, r0
$F7B7:    42            mov r0, byte ptr [r2]
$F7B8:    61            mov byte ptr [r0], low(r1)
$F7B9:    64            mov byte ptr [r1], low(r0)
$F7BA:    20            mov r0, r0
$F7BB:    63            mov byte ptr [r0], low(r3)
$F7BC:    6F            mov byte ptr [r3], low(r3)
$F7BD:    6D            mov byte ptr [r3], low(r1)
$F7BE:    6D            mov byte ptr [r3], low(r1)
$F7BF:    61            mov byte ptr [r0], low(r1)
$F7C0:    6E            mov byte ptr [r3], low(r2)
$F7C1:    64            mov byte ptr [r1], low(r0)
$F7C2:    20            mov r0, r0
$F7C3:    65            mov byte ptr [r1], low(r1)
$F7C4:    72            mov [r0], r2
$F7C5:    72            mov [r0], r2
$F7C6:    6F            mov byte ptr [r3], low(r3)
$F7C7:    72            mov [r0], r2
$F7C8:    20            mov r0, r0
$F7C9:    28            mov r2, r0
$F7CA:    68            mov byte ptr [r2], low(r0)
$F7CB:    20            mov r0, r0
$F7CC:    66            mov byte ptr [r1], low(r2)
$F7CD:    6F            mov byte ptr [r3], low(r3)
$F7CE:    72            mov [r0], r2
$F7CF:    20            mov r0, r0
$F7D0:    68            mov byte ptr [r2], low(r0)
$F7D1:    65            mov byte ptr [r1], low(r1)
$F7D2:    6C            mov byte ptr [r3], low(r0)
$F7D3:    70            mov [r0], r0
$F7D4:    29            mov r2, r1
$F7D5:    2E            mov r3, r2
$F7D6:    0A            mov r0, sp
$F7D7:    00            trap
$F7D8:    21            mov r0, r1
$F7D9:    20            mov r0, r0
$F7DA:    49            mov r2, byte ptr [r1]
$F7DB:    6E            mov byte ptr [r3], low(r2)
$F7DC:    76            mov [r1], r2
$F7DD:    61            mov byte ptr [r0], low(r1)
$F7DE:    6C            mov byte ptr [r3], low(r0)
$F7DF:    69            mov byte ptr [r2], low(r1)
$F7E0:    64            mov byte ptr [r1], low(r0)
$F7E1:    20            mov r0, r0
$F7E2:    69            mov byte ptr [r2], low(r1)
$F7E3:    6E            mov byte ptr [r3], low(r2)
$F7E4:    70            mov [r0], r0
$F7E5:    75            mov [r1], r1
$F7E6:    74            mov [r1], r0
$F7E7:    20            mov r0, r0
$F7E8:    65            mov byte ptr [r1], low(r1)
$F7E9:    72            mov [r0], r2
$F7EA:    72            mov [r0], r2
$F7EB:    6F            mov byte ptr [r3], low(r3)
$F7EC:    72            mov [r0], r2
$F7ED:    2E            mov r3, r2
$F7EE:    0A            mov r0, sp
$F7EF:    00            trap
$F7F0:    3E            add r3, r2
$F7F1:    20            mov r0, r0
$F7F2:    57            mov r1, [r3]
$F7F3:    68            mov byte ptr [r2], low(r0)
$F7F4:    69            mov byte ptr [r2], low(r1)
$F7F5:    63            mov byte ptr [r0], low(r3)
$F7F6:    68            mov byte ptr [r2], low(r0)
$F7F7:    20            mov r0, r0
$F7F8:    61            mov byte ptr [r0], low(r1)
$F7F9:    64            mov byte ptr [r1], low(r0)
$F7FA:    64            mov byte ptr [r1], low(r0)
$F7FB:    72            mov [r0], r2
$F7FC:    65            mov byte ptr [r1], low(r1)
$F7FD:    73            mov [r0], r3
$F7FE:    73            mov [r0], r3
$F7FF:    3F            add r3, r3
$F800:    20            mov r0, r0
$F801:    00            trap
$F802:    3E            add r3, r2
$F803:    20            mov r0, r0
$F804:    48            mov r2, byte ptr [r0]
$F805:    6F            mov byte ptr [r3], low(r3)
$F806:    77            mov [r1], r3
$F807:    20            mov r0, r0
$F808:    6D            mov byte ptr [r3], low(r1)
$F809:    61            mov byte ptr [r0], low(r1)
$F80A:    6E            mov byte ptr [r3], low(r2)
$F80B:    79            mov [r2], r1
$F80C:    20            mov r0, r0
$F80D:    6C            mov byte ptr [r3], low(r0)
$F80E:    69            mov byte ptr [r2], low(r1)
$F80F:    6E            mov byte ptr [r3], low(r2)
$F810:    65            mov byte ptr [r1], low(r1)
$F811:    73            mov [r0], r3
$F812:    3F            add r3, r3
$F813:    20            mov r0, r0
$F814:    00            trap
$F815:    3E            add r3, r2
$F816:    20            mov r0, r0
$F817:    52            mov r0, [r2]
$F818:    65            mov byte ptr [r1], low(r1)
$F819:    61            mov byte ptr [r0], low(r1)
$F81A:    6C            mov byte ptr [r3], low(r0)
$F81B:    6C            mov byte ptr [r3], low(r0)
$F81C:    79            mov [r2], r1
$F81D:    20            mov r0, r0
$F81E:    65            mov byte ptr [r1], low(r1)
$F81F:    78            mov [r2], r0
$F820:    65            mov byte ptr [r1], low(r1)
$F821:    63            mov byte ptr [r0], low(r3)
$F822:    20            mov r0, r0
$F823:    61            mov byte ptr [r0], low(r1)
$F824:    74            mov [r1], r0
$F825:    20            mov r0, r0
$F826:    F0            fixme: unknown opcode F0
$F827:    D6            fixme: unknown opcode D6
$F828:    FB            fixme: unknown opcode FB
$F829:    3F            add r3, r3
$F82A:    20            mov r0, r0
$F82B:    54            mov r1, [r0]
$F82C:    79            mov [r2], r1
$F82D:    70            mov [r0], r0
$F82E:    65            mov byte ptr [r1], low(r1)
$F82F:    20            mov r0, r0
$F830:    59            mov r2, [r1]
$F831:    20            mov r0, r0
$F832:    69            mov byte ptr [r2], low(r1)
$F833:    66            mov byte ptr [r1], low(r2)
$F834:    20            mov r0, r0
$F835:    73            mov [r0], r3
$F836:    6F            mov byte ptr [r3], low(r3)
$F837:    3A            add r2, r2
$F838:    20            mov r0, r0
$F839:    00            trap
$F83A:    21            mov r0, r1
$F83B:    20            mov r0, r0
$F83C:    43            mov r0, byte ptr [r3]
$F83D:    61            mov byte ptr [r0], low(r1)
$F83E:    6E            mov byte ptr [r3], low(r2)
$F83F:    63            mov byte ptr [r0], low(r3)
$F840:    65            mov byte ptr [r1], low(r1)
$F841:    6C            mov byte ptr [r3], low(r0)
$F842:    6C            mov byte ptr [r3], low(r0)
$F843:    65            mov byte ptr [r1], low(r1)
$F844:    64            mov byte ptr [r1], low(r0)
$F845:    20            mov r0, r0
$F846:    61            mov byte ptr [r0], low(r1)
$F847:    63            mov byte ptr [r0], low(r3)
$F848:    74            mov [r1], r0
$F849:    69            mov byte ptr [r2], low(r1)
$F84A:    6F            mov byte ptr [r3], low(r3)
$F84B:    6E            mov byte ptr [r3], low(r2)
$F84C:    20            mov r0, r0
$F84D:    65            mov byte ptr [r1], low(r1)
$F84E:    72            mov [r0], r2
$F84F:    72            mov [r0], r2
$F850:    6F            mov byte ptr [r3], low(r3)
$F851:    72            mov [r0], r2
$F852:    2E            mov r3, r2
$F853:    0A            mov r0, sp
$F854:    00            trap
$F855:    43            mov r0, byte ptr [r3]
$F856:    6F            mov byte ptr [r3], low(r3)
$F857:    6E            mov byte ptr [r3], low(r2)
$F858:    74            mov [r1], r0
$F859:    69            mov byte ptr [r2], low(r1)
$F85A:    6E            mov byte ptr [r3], low(r2)
$F85B:    75            mov [r1], r1
$F85C:    69            mov byte ptr [r2], low(r1)
$F85D:    6E            mov byte ptr [r3], low(r2)
$F85E:    67            mov byte ptr [r1], low(r3)
$F85F:    2E            mov r3, r2
$F860:    0A            mov r0, sp
$F861:    00            trap
$F862:    4C            mov r3, byte ptr [r0]
$F863:    6F            mov byte ptr [r3], low(r3)
$F864:    61            mov byte ptr [r0], low(r1)
$F865:    64            mov byte ptr [r1], low(r0)
$F866:    65            mov byte ptr [r1], low(r1)
$F867:    64            mov byte ptr [r1], low(r0)
$F868:    2E            mov r3, r2
$F869:    0A            mov r0, sp
$F86A:    00            trap
$F86B:    21            mov r0, r1
$F86C:    20            mov r0, r0
$F86D:    44            mov r1, byte ptr [r0]
$F86E:    72            mov [r0], r2
$F86F:    79            mov [r2], r1
$F870:    20            mov r0, r0
$F871:    73            mov [r0], r3
$F872:    74            mov [r1], r0
$F873:    61            mov byte ptr [r0], low(r1)
$F874:    63            mov byte ptr [r0], low(r3)
$F875:    6B            mov byte ptr [r2], low(r3)
$F876:    2E            mov r3, r2
$F877:    20            mov r0, r0
$F878:    48            mov r2, byte ptr [r0]
$F879:    61            mov byte ptr [r0], low(r1)
$F87A:    6C            mov byte ptr [r3], low(r0)
$F87B:    74            mov [r1], r0
$F87C:    69            mov byte ptr [r2], low(r1)
$F87D:    6E            mov byte ptr [r3], low(r2)
$F87E:    67            mov byte ptr [r1], low(r3)
$F87F:    20            mov r0, r0
$F880:    6D            mov byte ptr [r3], low(r1)
$F881:    61            mov byte ptr [r0], low(r1)
$F882:    63            mov byte ptr [r0], low(r3)
$F883:    68            mov byte ptr [r2], low(r0)
$F884:    69            mov byte ptr [r2], low(r1)
$F885:    6E            mov byte ptr [r3], low(r2)
$F886:    65            mov byte ptr [r1], low(r1)
$F887:    2E            mov r3, r2
$F888:    0A            mov r0, sp
$F889:    00            trap
$F88A:    3E            add r3, r2
$F88B:    20            mov r0, r0
$F88C:    46            mov r1, byte ptr [r2]
$F88D:    69            mov byte ptr [r2], low(r1)
$F88E:    6C            mov byte ptr [r3], low(r0)
$F88F:    65            mov byte ptr [r1], low(r1)
$F890:    6E            mov byte ptr [r3], low(r2)
$F891:    61            mov byte ptr [r0], low(r1)
$F892:    6D            mov byte ptr [r3], low(r1)
$F893:    65            mov byte ptr [r1], low(r1)
$F894:    3F            add r3, r3
$F895:    20            mov r0, r0
$F896:    00            trap
$F897:    21            mov r0, r1
$F898:    20            mov r0, r0
$F899:    46            mov r1, byte ptr [r2]
$F89A:    69            mov byte ptr [r2], low(r1)
$F89B:    6C            mov byte ptr [r3], low(r0)
$F89C:    65            mov byte ptr [r1], low(r1)
$F89D:    20            mov r0, r0
$F89E:    6E            mov byte ptr [r3], low(r2)
$F89F:    6F            mov byte ptr [r3], low(r3)
$F8A0:    74            mov [r1], r0
$F8A1:    20            mov r0, r0
$F8A2:    66            mov byte ptr [r1], low(r2)
$F8A3:    6F            mov byte ptr [r3], low(r3)
$F8A4:    75            mov [r1], r1
$F8A5:    6E            mov byte ptr [r3], low(r2)
$F8A6:    64            mov byte ptr [r1], low(r0)
$F8A7:    20            mov r0, r0
$F8A8:    65            mov byte ptr [r1], low(r1)
$F8A9:    72            mov [r0], r2
$F8AA:    72            mov [r0], r2
$F8AB:    6F            mov byte ptr [r3], low(r3)
$F8AC:    72            mov [r0], r2
$F8AD:    2E            mov r3, r2
$F8AE:    0A            mov r0, sp
$F8AF:    00            trap
$F8B0:    3E            add r3, r2
$F8B1:    20            mov r0, r0
$F8B2:    45            mov r1, byte ptr [r1]
$F8B3:    6E            mov byte ptr [r3], low(r2)
$F8B4:    74            mov [r1], r0
$F8B5:    65            mov byte ptr [r1], low(r1)
$F8B6:    72            mov [r0], r2
$F8B7:    20            mov r0, r0
$F8B8:    68            mov byte ptr [r2], low(r0)
$F8B9:    65            mov byte ptr [r1], low(r1)
$F8BA:    78            mov [r2], r0
$F8BB:    20            mov r0, r0
$F8BC:    64            mov byte ptr [r1], low(r0)
$F8BD:    61            mov byte ptr [r0], low(r1)
$F8BE:    74            mov [r1], r0
$F8BF:    61            mov byte ptr [r0], low(r1)
$F8C0:    2E            mov r3, r2
$F8C1:    20            mov r0, r0
$F8C2:    45            mov r1, byte ptr [r1]
$F8C3:    6E            mov byte ptr [r3], low(r2)
$F8C4:    64            mov byte ptr [r1], low(r0)
$F8C5:    20            mov r0, r0
$F8C6:    77            mov [r1], r3
$F8C7:    69            mov byte ptr [r2], low(r1)
$F8C8:    74            mov [r1], r0
$F8C9:    68            mov byte ptr [r2], low(r0)
$F8CA:    20            mov r0, r0
$F8CB:    64            mov byte ptr [r1], low(r0)
$F8CC:    6F            mov byte ptr [r3], low(r3)
$F8CD:    74            mov [r1], r0
$F8CE:    20            mov r0, r0
$F8CF:    22            mov r0, r2
$F8D0:    2E            mov r3, r2
$F8D1:    22            mov r0, r2
$F8D2:    20            mov r0, r0
$F8D3:    2B            mov r2, r3
$F8D4:    20            mov r0, r0
$F8D5:    6E            mov byte ptr [r3], low(r2)
$F8D6:    65            mov byte ptr [r1], low(r1)
$F8D7:    77            mov [r1], r3
$F8D8:    6C            mov byte ptr [r3], low(r0)
$F8D9:    69            mov byte ptr [r2], low(r1)
$F8DA:    6E            mov byte ptr [r3], low(r2)
$F8DB:    65            mov byte ptr [r1], low(r1)
$F8DC:    3A            add r2, r2
$F8DD:    0A            mov r0, sp
$F8DE:    00            trap
$F8DF:    57            mov r1, [r3]
$F8E0:    6F            mov byte ptr [r3], low(r3)
$F8E1:    77            mov [r1], r3
$F8E2:    2C            mov r3, r0
$F8E3:    20            mov r0, r0
$F8E4:    75            mov [r1], r1
$F8E5:    6E            mov byte ptr [r3], low(r2)
$F8E6:    64            mov byte ptr [r1], low(r0)
$F8E7:    6F            mov byte ptr [r3], low(r3)
$F8E8:    63            mov byte ptr [r0], low(r3)
$F8E9:    75            mov [r1], r1
$F8EA:    6D            mov byte ptr [r3], low(r1)
$F8EB:    65            mov byte ptr [r1], low(r1)
$F8EC:    6E            mov byte ptr [r3], low(r2)
$F8ED:    74            mov [r1], r0
$F8EE:    65            mov byte ptr [r1], low(r1)
$F8EF:    64            mov byte ptr [r1], low(r0)
$F8F0:    20            mov r0, r0
$F8F1:    6D            mov byte ptr [r3], low(r1)
$F8F2:    6F            mov byte ptr [r3], low(r3)
$F8F3:    6E            mov byte ptr [r3], low(r2)
$F8F4:    69            mov byte ptr [r2], low(r1)
$F8F5:    74            mov [r1], r0
$F8F6:    6F            mov byte ptr [r3], low(r3)
$F8F7:    72            mov [r0], r2
$F8F8:    20            mov r0, r0
$F8F9:    63            mov byte ptr [r0], low(r3)
$F8FA:    6F            mov byte ptr [r3], low(r3)
$F8FB:    6D            mov byte ptr [r3], low(r1)
$F8FC:    6D            mov byte ptr [r3], low(r1)
$F8FD:    61            mov byte ptr [r0], low(r1)
$F8FE:    6E            mov byte ptr [r3], low(r2)
$F8FF:    64            mov byte ptr [r1], low(r0)
$F900:    21            mov r0, r1
$F901:    20            mov r0, r0
$F902:    46            mov r1, byte ptr [r2]
$F903:    4F            mov r3, byte ptr [r3]
$F904:    4F            mov r3, byte ptr [r3]
$F905:    4C            mov r3, byte ptr [r0]
$F906:    53            mov r0, [r3]
$F907:    32            add r0, r2
$F908:    30            add r0, r0
$F909:    32            add r0, r2
$F90A:    33            add r0, r3
$F90B:    5F            mov r3, [r3]
$F90C:    7B            mov [r2], r3
$F90D:    53            mov r0, [r3]
$F90E:    65            mov byte ptr [r1], low(r1)
$F90F:    63            mov byte ptr [r0], low(r3)
$F910:    72            mov [r0], r2
$F911:    65            mov byte ptr [r1], low(r1)
$F912:    74            mov [r1], r0
$F913:    F0            fixme: unknown opcode F0
$F914:    00            trap
$F915:    E0 78 F0      add r0, $F078
$F918:    01 E0 43      mul r0, $43E0
$F91B:    6F            mov byte ptr [r3], low(r3)
$F91C:    6D            mov byte ptr [r3], low(r1)
$F91D:    6D            mov byte ptr [r3], low(r1)
$F91E:    61            mov byte ptr [r0], low(r1)
$F91F:    6E            mov byte ptr [r3], low(r2)
$F920:    64            mov byte ptr [r1], low(r0)
$F921:    7D            mov [r3], r1
$F922:    0A            mov r0, sp
$F923:    00            trap
$F924:    41            mov r0, byte ptr [r1]
$F925:    76            mov [r1], r2
$F926:    61            mov byte ptr [r0], low(r1)
$F927:    69            mov byte ptr [r2], low(r1)
$F928:    6C            mov byte ptr [r3], low(r0)
$F929:    61            mov byte ptr [r0], low(r1)
$F92A:    62            mov byte ptr [r0], low(r2)
$F92B:    6C            mov byte ptr [r3], low(r0)
$F92C:    65            mov byte ptr [r1], low(r1)
$F92D:    20            mov r0, r0
$F92E:    63            mov byte ptr [r0], low(r3)
$F92F:    6F            mov byte ptr [r3], low(r3)
$F930:    6D            mov byte ptr [r3], low(r1)
$F931:    6D            mov byte ptr [r3], low(r1)
$F932:    61            mov byte ptr [r0], low(r1)
$F933:    6E            mov byte ptr [r3], low(r2)
$F934:    64            mov byte ptr [r1], low(r0)
$F935:    73            mov [r0], r3
$F936:    3A            add r2, r2
$F937:    0A            mov r0, sp
$F938:    72            mov [r0], r2
$F939:    20            mov r0, r0
$F93A:    20            mov r0, r0
$F93B:    20            mov r0, r0
$F93C:    3A            add r2, r2
$F93D:    3A            add r2, r2
$F93E:    20            mov r0, r0
$F93F:    70            mov [r0], r0
$F940:    72            mov [r0], r2
$F941:    69            mov byte ptr [r2], low(r1)
$F942:    6E            mov byte ptr [r3], low(r2)
$F943:    74            mov [r1], r0
$F944:    20            mov r0, r0
$F945:    6D            mov byte ptr [r3], low(r1)
$F946:    65            mov byte ptr [r1], low(r1)
$F947:    6D            mov byte ptr [r3], low(r1)
$F948:    6F            mov byte ptr [r3], low(r3)
$F949:    72            mov [r0], r2
$F94A:    79            mov [r2], r1
$F94B:    20            mov r0, r0
$F94C:    61            mov byte ptr [r0], low(r1)
$F94D:    73            mov [r0], r3
$F94E:    20            mov r0, r0
$F94F:    68            mov byte ptr [r2], low(r0)
$F950:    65            mov byte ptr [r1], low(r1)
$F951:    78            mov [r2], r0
$F952:    0A            mov r0, sp
$F953:    70            mov [r0], r0
$F954:    20            mov r0, r0
$F955:    20            mov r0, r0
$F956:    20            mov r0, r0
$F957:    3A            add r2, r2
$F958:    3A            add r2, r2
$F959:    20            mov r0, r0
$F95A:    70            mov [r0], r0
$F95B:    72            mov [r0], r2
$F95C:    69            mov byte ptr [r2], low(r1)
$F95D:    6E            mov byte ptr [r3], low(r2)
$F95E:    74            mov [r1], r0
$F95F:    20            mov r0, r0
$F960:    6D            mov byte ptr [r3], low(r1)
$F961:    65            mov byte ptr [r1], low(r1)
$F962:    6D            mov byte ptr [r3], low(r1)
$F963:    6F            mov byte ptr [r3], low(r3)
$F964:    72            mov [r0], r2
$F965:    79            mov [r2], r1
$F966:    20            mov r0, r0
$F967:    61            mov byte ptr [r0], low(r1)
$F968:    73            mov [r0], r3
$F969:    20            mov r0, r0
$F96A:    74            mov [r1], r0
$F96B:    65            mov byte ptr [r1], low(r1)
$F96C:    78            mov [r2], r0
$F96D:    74            mov [r1], r0
$F96E:    0A            mov r0, sp
$F96F:    77            mov [r1], r3
$F970:    20            mov r0, r0
$F971:    20            mov r0, r0
$F972:    20            mov r0, r0
$F973:    3A            add r2, r2
$F974:    3A            add r2, r2
$F975:    20            mov r0, r0
$F976:    77            mov [r1], r3
$F977:    72            mov [r0], r2
$F978:    69            mov byte ptr [r2], low(r1)
$F979:    74            mov [r1], r0
$F97A:    65            mov byte ptr [r1], low(r1)
$F97B:    20            mov r0, r0
$F97C:    68            mov byte ptr [r2], low(r0)
$F97D:    65            mov byte ptr [r1], low(r1)
$F97E:    78            mov [r2], r0
$F97F:    20            mov r0, r0
$F980:    64            mov byte ptr [r1], low(r0)
$F981:    61            mov byte ptr [r0], low(r1)
$F982:    74            mov [r1], r0
$F983:    61            mov byte ptr [r0], low(r1)
$F984:    20            mov r0, r0
$F985:    74            mov [r1], r0
$F986:    6F            mov byte ptr [r3], low(r3)
$F987:    20            mov r0, r0
$F988:    6D            mov byte ptr [r3], low(r1)
$F989:    65            mov byte ptr [r1], low(r1)
$F98A:    6D            mov byte ptr [r3], low(r1)
$F98B:    6F            mov byte ptr [r3], low(r3)
$F98C:    72            mov [r0], r2
$F98D:    79            mov [r2], r1
$F98E:    0A            mov r0, sp
$F98F:    78            mov [r2], r0
$F990:    20            mov r0, r0
$F991:    20            mov r0, r0
$F992:    20            mov r0, r0
$F993:    3A            add r2, r2
$F994:    3A            add r2, r2
$F995:    20            mov r0, r0
$F996:    65            mov byte ptr [r1], low(r1)
$F997:    78            mov [r2], r0
$F998:    65            mov byte ptr [r1], low(r1)
$F999:    63            mov byte ptr [r0], low(r3)
$F99A:    75            mov [r1], r1
$F99B:    74            mov [r1], r0
$F99C:    65            mov byte ptr [r1], low(r1)
$F99D:    20            mov r0, r0
$F99E:    6D            mov byte ptr [r3], low(r1)
$F99F:    65            mov byte ptr [r1], low(r1)
$F9A0:    6D            mov byte ptr [r3], low(r1)
$F9A1:    6F            mov byte ptr [r3], low(r3)
$F9A2:    72            mov [r0], r2
$F9A3:    79            mov [r2], r1
$F9A4:    0A            mov r0, sp
$F9A5:    72            mov [r0], r2
$F9A6:    66            mov byte ptr [r1], low(r2)
$F9A7:    20            mov r0, r0
$F9A8:    20            mov r0, r0
$F9A9:    3A            add r2, r2
$F9AA:    3A            add r2, r2
$F9AB:    20            mov r0, r0
$F9AC:    6C            mov byte ptr [r3], low(r0)
$F9AD:    6F            mov byte ptr [r3], low(r3)
$F9AE:    61            mov byte ptr [r0], low(r1)
$F9AF:    64            mov byte ptr [r1], low(r0)
$F9B0:    20            mov r0, r0
$F9B1:    6D            mov byte ptr [r3], low(r1)
$F9B2:    65            mov byte ptr [r1], low(r1)
$F9B3:    6D            mov byte ptr [r3], low(r1)
$F9B4:    6F            mov byte ptr [r3], low(r3)
$F9B5:    72            mov [r0], r2
$F9B6:    79            mov [r2], r1
$F9B7:    20            mov r0, r0
$F9B8:    66            mov byte ptr [r1], low(r2)
$F9B9:    72            mov [r0], r2
$F9BA:    6F            mov byte ptr [r3], low(r3)
$F9BB:    6D            mov byte ptr [r3], low(r1)
$F9BC:    20            mov r0, r0
$F9BD:    66            mov byte ptr [r1], low(r2)
$F9BE:    69            mov byte ptr [r2], low(r1)
$F9BF:    6C            mov byte ptr [r3], low(r0)
$F9C0:    65            mov byte ptr [r1], low(r1)
$F9C1:    0A            mov r0, sp
$F9C2:    6C            mov byte ptr [r3], low(r0)
$F9C3:    73            mov [r0], r3
$F9C4:    20            mov r0, r0
$F9C5:    20            mov r0, r0
$F9C6:    3A            add r2, r2
$F9C7:    3A            add r2, r2
$F9C8:    20            mov r0, r0
$F9C9:    70            mov [r0], r0
$F9CA:    72            mov [r0], r2
$F9CB:    69            mov byte ptr [r2], low(r1)
$F9CC:    6E            mov byte ptr [r3], low(r2)
$F9CD:    74            mov [r1], r0
$F9CE:    20            mov r0, r0
$F9CF:    66            mov byte ptr [r1], low(r2)
$F9D0:    69            mov byte ptr [r2], low(r1)
$F9D1:    6C            mov byte ptr [r3], low(r0)
$F9D2:    65            mov byte ptr [r1], low(r1)
$F9D3:    20            mov r0, r0
$F9D4:    69            mov byte ptr [r2], low(r1)
$F9D5:    6E            mov byte ptr [r3], low(r2)
$F9D6:    64            mov byte ptr [r1], low(r0)
$F9D7:    65            mov byte ptr [r1], low(r1)
$F9D8:    78            mov [r2], r0
$F9D9:    0A            mov r0, sp
$F9DA:    68            mov byte ptr [r2], low(r0)
$F9DB:    20            mov r0, r0
$F9DC:    20            mov r0, r0
$F9DD:    20            mov r0, r0
$F9DE:    3A            add r2, r2
$F9DF:    3A            add r2, r2
$F9E0:    20            mov r0, r0
$F9E1:    70            mov [r0], r0
$F9E2:    72            mov [r0], r2
$F9E3:    69            mov byte ptr [r2], low(r1)
$F9E4:    6E            mov byte ptr [r3], low(r2)
$F9E5:    74            mov [r1], r0
$F9E6:    20            mov r0, r0
$F9E7:    74            mov [r1], r0
$F9E8:    68            mov byte ptr [r2], low(r0)
$F9E9:    69            mov byte ptr [r2], low(r1)
$F9EA:    73            mov [r0], r3
$F9EB:    20            mov r0, r0
$F9EC:    68            mov byte ptr [r2], low(r0)
$F9ED:    65            mov byte ptr [r1], low(r1)
$F9EE:    6C            mov byte ptr [r3], low(r0)
$F9EF:    70            mov [r0], r0
$F9F0:    20            mov r0, r0
$F9F1:    6D            mov byte ptr [r3], low(r1)
$F9F2:    65            mov byte ptr [r1], low(r1)
$F9F3:    73            mov [r0], r3
$F9F4:    73            mov [r0], r3
$F9F5:    61            mov byte ptr [r0], low(r1)
$F9F6:    67            mov byte ptr [r1], low(r3)
$F9F7:    65            mov byte ptr [r1], low(r1)
$F9F8:    0A            mov r0, sp
$F9F9:    63            mov byte ptr [r0], low(r3)
$F9FA:    20            mov r0, r0
$F9FB:    20            mov r0, r0
$F9FC:    20            mov r0, r0
$F9FD:    3A            add r2, r2
$F9FE:    3A            add r2, r2
$F9FF:    20            mov r0, r0
$FA00:    65            mov byte ptr [r1], low(r1)
$FA01:    78            mov [r2], r0
$FA02:    69            mov byte ptr [r2], low(r1)
$FA03:    74            mov [r1], r0
$FA04:    20            mov r0, r0
$FA05:    6D            mov byte ptr [r3], low(r1)
$FA06:    6F            mov byte ptr [r3], low(r3)
$FA07:    6E            mov byte ptr [r3], low(r2)
$FA08:    69            mov byte ptr [r2], low(r1)
$FA09:    74            mov [r1], r0
$FA0A:    6F            mov byte ptr [r3], low(r3)
$FA0B:    72            mov [r0], r2
$FA0C:    20            mov r0, r0
$FA0D:    61            mov byte ptr [r0], low(r1)
$FA0E:    6E            mov byte ptr [r3], low(r2)
$FA0F:    64            mov byte ptr [r1], low(r0)
$FA10:    20            mov r0, r0
$FA11:    63            mov byte ptr [r0], low(r3)
$FA12:    6F            mov byte ptr [r3], low(r3)
$FA13:    6E            mov byte ptr [r3], low(r2)
$FA14:    74            mov [r1], r0
$FA15:    69            mov byte ptr [r2], low(r1)
$FA16:    6E            mov byte ptr [r3], low(r2)
$FA17:    75            mov [r1], r1
$FA18:    65            mov byte ptr [r1], low(r1)
$FA19:    0A            mov r0, sp
$FA1A:    50            mov r0, [r0]
$FA1B:    6C            mov byte ptr [r3], low(r0)
$FA1C:    65            mov byte ptr [r1], low(r1)
$FA1D:    61            mov byte ptr [r0], low(r1)
$FA1E:    73            mov [r0], r3
$FA1F:    65            mov byte ptr [r1], low(r1)
$FA20:    20            mov r0, r0
$FA21:    65            mov byte ptr [r1], low(r1)
$FA22:    6E            mov byte ptr [r3], low(r2)
$FA23:    74            mov [r1], r0
$FA24:    65            mov byte ptr [r1], low(r1)
$FA25:    72            mov [r0], r2
$FA26:    20            mov r0, r0
$FA27:    68            mov byte ptr [r2], low(r0)
$FA28:    65            mov byte ptr [r1], low(r1)
$FA29:    78            mov [r2], r0
$FA2A:    20            mov r0, r0
$FA2B:    6E            mov byte ptr [r3], low(r2)
$FA2C:    75            mov [r1], r1
$FA2D:    6D            mov byte ptr [r3], low(r1)
$FA2E:    62            mov byte ptr [r0], low(r2)
$FA2F:    65            mov byte ptr [r1], low(r1)
$FA30:    72            mov [r0], r2
$FA31:    73            mov [r0], r3
$FA32:    20            mov r0, r0
$FA33:    77            mov [r1], r3
$FA34:    68            mov byte ptr [r2], low(r0)
$FA35:    65            mov byte ptr [r1], low(r1)
$FA36:    6E            mov byte ptr [r3], low(r2)
$FA37:    20            mov r0, r0
$FA38:    70            mov [r0], r0
$FA39:    72            mov [r0], r2
$FA3A:    6F            mov byte ptr [r3], low(r3)
$FA3B:    6D            mov byte ptr [r3], low(r1)
$FA3C:    70            mov [r0], r0
$FA3D:    74            mov [r1], r0
$FA3E:    65            mov byte ptr [r1], low(r1)
$FA3F:    64            mov byte ptr [r1], low(r0)
$FA40:    2E            mov r3, r2
$FA41:    0A            mov r0, sp
$FA42:    49            mov r2, byte ptr [r1]
$FA43:    66            mov byte ptr [r1], low(r2)
$FA44:    20            mov r0, r0
$FA45:    6E            mov byte ptr [r3], low(r2)
$FA46:    65            mov byte ptr [r1], low(r1)
$FA47:    63            mov byte ptr [r0], low(r3)
$FA48:    65            mov byte ptr [r1], low(r1)
$FA49:    73            mov [r0], r3
$FA4A:    73            mov [r0], r3
$FA4B:    61            mov byte ptr [r0], low(r1)
$FA4C:    72            mov [r0], r2
$FA4D:    79            mov [r2], r1
$FA4E:    20            mov r0, r0
$FA4F:    66            mov byte ptr [r1], low(r2)
$FA50:    6F            mov byte ptr [r3], low(r3)
$FA51:    72            mov [r0], r2
$FA52:    20            mov r0, r0
$FA53:    64            mov byte ptr [r1], low(r0)
$FA54:    65            mov byte ptr [r1], low(r1)
$FA55:    62            mov byte ptr [r0], low(r2)
$FA56:    75            mov [r1], r1
$FA57:    67            mov byte ptr [r1], low(r3)
$FA58:    67            mov byte ptr [r1], low(r3)
$FA59:    69            mov byte ptr [r2], low(r1)
$FA5A:    6E            mov byte ptr [r3], low(r2)
$FA5B:    67            mov byte ptr [r1], low(r3)
$FA5C:    2C            mov r3, r0
$FA5D:    20            mov r0, r0
$FA5E:    79            mov [r2], r1
$FA5F:    6F            mov byte ptr [r3], low(r3)
$FA60:    75            mov [r1], r1
$FA61:    20            mov r0, r0
$FA62:    63            mov byte ptr [r0], low(r3)
$FA63:    61            mov byte ptr [r0], low(r1)
$FA64:    6E            mov byte ptr [r3], low(r2)
$FA65:    20            mov r0, r0
$FA66:    62            mov byte ptr [r0], low(r2)
$FA67:    72            mov [r0], r2
$FA68:    65            mov byte ptr [r1], low(r1)
$FA69:    61            mov byte ptr [r0], low(r1)
$FA6A:    6B            mov byte ptr [r2], low(r3)
$FA6B:    20            mov r0, r0
$FA6C:    69            mov byte ptr [r2], low(r1)
$FA6D:    6E            mov byte ptr [r3], low(r2)
$FA6E:    74            mov [r1], r0
$FA6F:    6F            mov byte ptr [r3], low(r3)
$FA70:    20            mov r0, r0
$FA71:    6D            mov byte ptr [r3], low(r1)
$FA72:    6F            mov byte ptr [r3], low(r3)
$FA73:    6E            mov byte ptr [r3], low(r2)
$FA74:    69            mov byte ptr [r2], low(r1)
$FA75:    74            mov [r1], r0
$FA76:    6F            mov byte ptr [r3], low(r3)
$FA77:    72            mov [r0], r2
$FA78:    0A            mov r0, sp
$FA79:    77            mov [r1], r3
$FA7A:    69            mov byte ptr [r2], low(r1)
$FA7B:    74            mov [r1], r0
$FA7C:    68            mov byte ptr [r2], low(r0)
$FA7D:    20            mov r0, r0
$FA7E:    69            mov byte ptr [r2], low(r1)
$FA7F:    6E            mov byte ptr [r3], low(r2)
$FA80:    73            mov [r0], r3
$FA81:    74            mov [r1], r0
$FA82:    72            mov [r0], r2
$FA83:    75            mov [r1], r1
$FA84:    63            mov byte ptr [r0], low(r3)
$FA85:    74            mov [r1], r0
$FA86:    69            mov byte ptr [r2], low(r1)
$FA87:    6F            mov byte ptr [r3], low(r3)
$FA88:    6E            mov byte ptr [r3], low(r2)
$FA89:    20            mov r0, r0
$FA8A:    42            mov r0, byte ptr [r2]
$FA8B:    52            mov r0, [r2]
$FA8C:    4B            mov r2, byte ptr [r3]
$FA8D:    20            mov r0, r0
$FA8E:    28            mov r2, r0
$FA8F:    30            add r0, r0
$FA90:    78            mov [r2], r0
$FA91:    30            add r0, r0
$FA92:    30            add r0, r0
$FA93:    29            mov r2, r1
$FA94:    20            mov r0, r0
$FA95:    61            mov byte ptr [r0], low(r1)
$FA96:    6E            mov byte ptr [r3], low(r2)
$FA97:    64            mov byte ptr [r1], low(r0)
$FA98:    20            mov r0, r0
$FA99:    63            mov byte ptr [r0], low(r3)
$FA9A:    6F            mov byte ptr [r3], low(r3)
$FA9B:    6E            mov byte ptr [r3], low(r2)
$FA9C:    74            mov [r1], r0
$FA9D:    69            mov byte ptr [r2], low(r1)
$FA9E:    6E            mov byte ptr [r3], low(r2)
$FA9F:    75            mov [r1], r1
$FAA0:    65            mov byte ptr [r1], low(r1)
$FAA1:    20            mov r0, r0
$FAA2:    77            mov [r1], r3
$FAA3:    69            mov byte ptr [r2], low(r1)
$FAA4:    74            mov [r1], r0
$FAA5:    68            mov byte ptr [r2], low(r0)
$FAA6:    20            mov r0, r0
$FAA7:    27            mov r1, r3
$FAA8:    63            mov byte ptr [r0], low(r3)
$FAA9:    27            mov r1, r3
$FAAA:    0A            mov r0, sp
$FAAB:    4E            mov r3, byte ptr [r2]
$FAAC:    6F            mov byte ptr [r3], low(r3)
$FAAD:    74            mov [r1], r0
$FAAE:    65            mov byte ptr [r1], low(r1)
$FAAF:    3A            add r2, r2
$FAB0:    20            mov r0, r0
$FAB1:    6D            mov byte ptr [r3], low(r1)
$FAB2:    65            mov byte ptr [r1], low(r1)
$FAB3:    6D            mov byte ptr [r3], low(r1)
$FAB4:    6F            mov byte ptr [r3], low(r3)
$FAB5:    72            mov [r0], r2
$FAB6:    79            mov [r2], r1
$FAB7:    20            mov r0, r0
$FAB8:    72            mov [r0], r2
$FAB9:    65            mov byte ptr [r1], low(r1)
$FABA:    67            mov byte ptr [r1], low(r3)
$FABB:    69            mov byte ptr [r2], low(r1)
$FABC:    6F            mov byte ptr [r3], low(r3)
$FABD:    6E            mov byte ptr [r3], low(r2)
$FABE:    20            mov r0, r0
$FABF:    45            mov r1, byte ptr [r1]
$FAC0:    30            add r0, r0
$FAC1:    30            add r0, r0
$FAC2:    30            add r0, r0
$FAC3:    2D            mov r3, r1
$FAC4:    46            mov r1, byte ptr [r2]
$FAC5:    46            mov r1, byte ptr [r2]
$FAC6:    46            mov r1, byte ptr [r2]
$FAC7:    46            mov r1, byte ptr [r2]
$FAC8:    20            mov r0, r0
$FAC9:    69            mov byte ptr [r2], low(r1)
$FACA:    73            mov [r0], r3
$FACB:    20            mov r0, r0
$FACC:    75            mov [r1], r1
$FACD:    73            mov [r0], r3
$FACE:    65            mov byte ptr [r1], low(r1)
$FACF:    64            mov byte ptr [r1], low(r0)
$FAD0:    20            mov r0, r0
$FAD1:    62            mov byte ptr [r0], low(r2)
$FAD2:    79            mov [r2], r1
$FAD3:    20            mov r0, r0
$FAD4:    6D            mov byte ptr [r3], low(r1)
$FAD5:    6F            mov byte ptr [r3], low(r3)
$FAD6:    6E            mov byte ptr [r3], low(r2)
$FAD7:    69            mov byte ptr [r2], low(r1)
$FAD8:    74            mov [r1], r0
$FAD9:    6F            mov byte ptr [r3], low(r3)
$FADA:    72            mov [r0], r2
$FADB:    0A            mov r0, sp
$FADC:    00            trap
$FADD:    42            mov r0, byte ptr [r2]
$FADE:    4C            mov r3, byte ptr [r0]
$FADF:    4B            mov r2, byte ptr [r3]
$FAE0:    20            mov r0, r0
$FAE1:    20            mov r0, r0
$FAE2:    53            mov r0, [r3]
$FAE3:    49            mov r2, byte ptr [r1]
$FAE4:    5A            mov r2, [r2]
$FAE5:    45            mov r1, byte ptr [r1]
$FAE6:    20            mov r0, r0
$FAE7:    20            mov r0, r0
$FAE8:    4E            mov r3, byte ptr [r2]
$FAE9:    41            mov r0, byte ptr [r1]
$FAEA:    4D            mov r3, byte ptr [r1]
$FAEB:    45            mov r1, byte ptr [r1]
$FAEC:    0A            mov r0, sp
$FAED:    3D            add r3, r1
$FAEE:    3D            add r3, r1
$FAEF:    3D            add r3, r1
$FAF0:    3D            add r3, r1
$FAF1:    3D            add r3, r1
$FAF2:    3D            add r3, r1
$FAF3:    3D            add r3, r1
$FAF4:    3D            add r3, r1
$FAF5:    3D            add r3, r1
$FAF6:    3D            add r3, r1
$FAF7:    3D            add r3, r1
$FAF8:    3D            add r3, r1
$FAF9:    3D            add r3, r1
$FAFA:    3D            add r3, r1
$FAFB:    3D            add r3, r1
$FAFC:    3D            add r3, r1
$FAFD:    3D            add r3, r1
$FAFE:    3D            add r3, r1
$FAFF:    3D            add r3, r1
$FB00:    3D            add r3, r1
$FB01:    3D            add r3, r1
$FB02:    3D            add r3, r1
$FB03:    3D            add r3, r1
$FB04:    0A            mov r0, sp
$FB05:    00            trap
$FB06:    F1            fixme: unknown opcode F1
$FB07:    CE FB 20      fixme: unknown opcode CE
$FB0A:    20            mov r0, r0
$FB0B:    20            mov r0, r0
$FB0C:    F0            fixme: unknown opcode F0
$FB0D:    D6            fixme: unknown opcode D6
$FB0E:    FB            fixme: unknown opcode FB
$FB0F:    20            mov r0, r0
$FB10:    20            mov r0, r0
$FB11:    00            trap
$FB12:    52            mov r0, [r2]
$FB13:    65            mov byte ptr [r1], low(r1)
$FB14:    61            mov byte ptr [r0], low(r1)
$FB15:    64            mov byte ptr [r1], low(r0)
$FB16:    79            mov [r2], r1
$FB17:    2E            mov r3, r2
$FB18:    0A            mov r0, sp
$FB19:    3E            add r3, r2
$FB1A:    20            mov r0, r0
$FB1B:    00            trap
$FB1C:    2A            mov r2, r2
$FB1D:    2A            mov r2, r2
$FB1E:    2A            mov r2, r2
$FB1F:    20            mov r0, r0
$FB20:    42            mov r0, byte ptr [r2]
$FB21:    52            mov r0, [r2]
$FB22:    45            mov r1, byte ptr [r1]
$FB23:    41            mov r0, byte ptr [r1]
$FB24:    4B            mov r2, byte ptr [r3]
$FB25:    20            mov r0, r0
$FB26:    49            mov r2, byte ptr [r1]
$FB27:    4E            mov r3, byte ptr [r2]
$FB28:    54            mov r1, [r0]
$FB29:    4F            mov r3, byte ptr [r3]
$FB2A:    20            mov r0, r0
$FB2B:    4D            mov r3, byte ptr [r1]
$FB2C:    4F            mov r3, byte ptr [r3]
$FB2D:    4E            mov r3, byte ptr [r2]
$FB2E:    49            mov r2, byte ptr [r1]
$FB2F:    54            mov r1, [r0]
$FB30:    4F            mov r3, byte ptr [r3]
$FB31:    52            mov r0, [r2]
$FB32:    20            mov r0, r0
$FB33:    41            mov r0, byte ptr [r1]
$FB34:    54            mov r1, [r0]
$FB35:    20            mov r0, r0
$FB36:    24            mov r1, r0
$FB37:    F0            fixme: unknown opcode F0
$FB38:    C0            fixme: unknown opcode C0
$FB39:    FB            fixme: unknown opcode FB
$FB3A:    20            mov r0, r0
$FB3B:    2A            mov r2, r2
$FB3C:    2A            mov r2, r2
$FB3D:    2A            mov r2, r2
$FB3E:    0A            mov r0, sp
$FB3F:    52            mov r0, [r2]
$FB40:    30            add r0, r0
$FB41:    3D            add r3, r1
$FB42:    24            mov r1, r0
$FB43:    F0            fixme: unknown opcode F0
$FB44:    B6 FB 20      mov r2, [$20FB]
$FB47:    52            mov r0, [r2]
$FB48:    31            add r0, r1
$FB49:    3D            add r3, r1
$FB4A:    24            mov r1, r0
$FB4B:    F0            fixme: unknown opcode F0
$FB4C:    B8 FB 20      mov byte ptr [$20FB], low(r0)
$FB4F:    52            mov r0, [r2]
$FB50:    32            add r0, r2
$FB51:    3D            add r3, r1
$FB52:    24            mov r1, r0
$FB53:    F0            fixme: unknown opcode F0
$FB54:    BA FB 20      mov byte ptr [$20FB], low(r0)
$FB57:    52            mov r0, [r2]
$FB58:    33            add r0, r3
$FB59:    3D            add r3, r1
$FB5A:    24            mov r1, r0
$FB5B:    F0            fixme: unknown opcode F0
$FB5C:    BC FB 0A      mov [$0AFB], r0
$FB5F:    53            mov r0, [r3]
$FB60:    50            mov r0, [r0]
$FB61:    3D            add r3, r1
$FB62:    24            mov r1, r0
$FB63:    F0            fixme: unknown opcode F0
$FB64:    BE FB 20      mov [$20FB], r0
$FB67:    5B            mov r2, [r3]
$FB68:    F1            fixme: unknown opcode F1
$FB69:    C2            fixme: unknown opcode C2
$FB6A:    FB            fixme: unknown opcode FB
$FB6B:    F1            fixme: unknown opcode F1
$FB6C:    C3            fixme: unknown opcode C3
$FB6D:    FB            fixme: unknown opcode FB
$FB6E:    F1            fixme: unknown opcode F1
$FB6F:    C4            fixme: unknown opcode C4
$FB70:    FB            fixme: unknown opcode FB
$FB71:    F1            fixme: unknown opcode F1
$FB72:    C5            fixme: unknown opcode C5
$FB73:    FB            fixme: unknown opcode FB
$FB74:    F1            fixme: unknown opcode F1
$FB75:    C6            fixme: unknown opcode C6
$FB76:    FB            fixme: unknown opcode FB
$FB77:    F1            fixme: unknown opcode F1
$FB78:    C7            fixme: unknown opcode C7
$FB79:    FB            fixme: unknown opcode FB
$FB7A:    F1            fixme: unknown opcode F1
$FB7B:    C8            fixme: unknown opcode C8
$FB7C:    FB            fixme: unknown opcode FB
$FB7D:    F1            fixme: unknown opcode F1
$FB7E:    C9            call r0
$FB7F:    FB            fixme: unknown opcode FB
$FB80:    F1            fixme: unknown opcode F1
$FB81:    CA            call r1
$FB82:    FB            fixme: unknown opcode FB
$FB83:    F1            fixme: unknown opcode F1
$FB84:    CB            call r2
$FB85:    FB            fixme: unknown opcode FB
$FB86:    F1            fixme: unknown opcode F1
$FB87:    CC            call r3
$FB88:    FB            fixme: unknown opcode FB
$FB89:    F1            fixme: unknown opcode F1
$FB8A:    CD FB 5D      fixme: unknown opcode CD
$FB8D:    0A            mov r0, sp
$FB8E:    00            trap
$FB8F:    F0            fixme: unknown opcode F0
$FB90:    D6            fixme: unknown opcode D6
$FB91:    FB            fixme: unknown opcode FB
$FB92:    20            mov r0, r0
$FB93:    7C            mov [r3], r0
$FB94:    20            mov r0, r0
$FB95:    F1            fixme: unknown opcode F1
$FB96:    CE FB 20      fixme: unknown opcode CE
$FB99:    F1            fixme: unknown opcode F1
$FB9A:    CF FB 20      xor r0, $20FB
$FB9D:    F1            fixme: unknown opcode F1
$FB9E:    D0            fixme: unknown opcode D0
$FB9F:    FB            fixme: unknown opcode FB
$FBA0:    20            mov r0, r0
$FBA1:    F1            fixme: unknown opcode F1
$FBA2:    D1            fixme: unknown opcode D1
$FBA3:    FB            fixme: unknown opcode FB
$FBA4:    20            mov r0, r0
$FBA5:    F1            fixme: unknown opcode F1
$FBA6:    D2            fixme: unknown opcode D2
$FBA7:    FB            fixme: unknown opcode FB
$FBA8:    20            mov r0, r0
$FBA9:    F1            fixme: unknown opcode F1
$FBAA:    D3            fixme: unknown opcode D3
$FBAB:    FB            fixme: unknown opcode FB
$FBAC:    20            mov r0, r0
$FBAD:    F1            fixme: unknown opcode F1
$FBAE:    D4            fixme: unknown opcode D4
$FBAF:    FB            fixme: unknown opcode FB
$FBB0:    20            mov r0, r0
$FBB1:    F1            fixme: unknown opcode F1
$FBB2:    D5            fixme: unknown opcode D5
$FBB3:    FB            fixme: unknown opcode FB
$FBB4:    0A            mov r0, sp
$FBB5:    00            trap
$FBB6:    00            trap
$FBB7:    00            trap
$FBB8:    FF            fixme: unknown opcode FF
$FBB9:    C3            fixme: unknown opcode C3
$FBBA:    7D            mov [r3], r1
$FBBB:    F3            fixme: unknown opcode F3
$FBBC:    F7            fixme: unknown opcode F7
$FBBD:    F1            fixme: unknown opcode F1
$FBBE:    FE            fixme: unknown opcode FE
$FBBF:    FE            fixme: unknown opcode FE
$FBC0:    A0 F0 A1      fixme: call $A1F0
$FBC3:    F0            fixme: unknown opcode F0
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
$FBD6:    C8            fixme: unknown opcode C8
$FBD7:    FB            fixme: unknown opcode FB
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
$FE00:    00            trap
$FE01:    00            trap
$FE02:    00            trap
$FE03:    00            trap
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
$FEF0:    BD 00 00      mov [$0000], r0
$FEF3:    00            trap
$FEF4:    A9            inc r1
$FEF5:    00            trap
$FEF6:    7E            mov [r3], r2
$FEF7:    00            trap
$FEF8:    96            pop r2
$FEF9:    F4            fixme: unknown opcode F4
$FEFA:    21            mov r0, r1
$FEFB:    00            trap
$FEFC:    F8            fixme: unknown opcode F8
$FEFD:    FE            fixme: unknown opcode FE
$FEFE:    A1 F0 00      fixme: unknown opcode A1
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
$FFF0:    98 7E F3      jmp $F37E    # <None>
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
