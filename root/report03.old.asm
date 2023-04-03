$2000:    A7            fixme: sub sp, 2 ????
$2001:    97            pop r3
$2002:    2B            mov r2, r3
$2003:    E2 93 00      fixme: unknown opcode E2
$2006:    93            push r3
$2007:    99 08 00      fixme: jmp/call $0008    # <PrintStr>
$200A:    97            pop r3
$200B:    A5 00 20      fixme: unknown opcode A5
$200E:    9C 18 20      fixme: jmp/cond[???] $2018
$2011:    2B            mov r2, r3
$2012:    E2 CE 00      fixme: unknown opcode E2
$2015:    98 08 00      fixme: jmp/call $0008    # <PrintStr>
$2018:    12 44 21      mov r2, $2144
$201B:    11 12 00      mov r1, $0012
$201E:    10 00 00      mov r0, $0000
$2021:    99 40 00      fixme: jmp/call $0040    # <MemSet>
$2024:    12 FC 20      mov r2, $20FC
$2027:    99 08 00      fixme: jmp/call $0008    # <PrintStr>
$202A:    12 44 21      mov r2, $2144
$202D:    13 0F 00      mov r3, $000F
$2030:    99 30 00      fixme: jmp/call $0030    # <ReadStr>
$2033:    12 44 21      mov r2, $2144
$2036:    99 38 00      fixme: jmp/call $0038    # <StrTrim>

$2039:    12 44 21      mov r2, $2144
$203C:    10 C0 9F      mov r0, $9FC0
$203F:    56            mov r1, [r2]
$2040:    AA            inc r2
$2041:    A3 00 00      fixme: unknown opcode A3
$2044:    0E            lsl r0
$2045:    D9            xor r0, r1
$2046:    0E            lsl r0
$2047:    31            add r0, r1
$2048:    9C 4E 20      fixme: jmp/cond[???] $204E
$204B:    98 3F 20      fixme: jmp/call $203F    # <None>
$204E:    BC 56 21      mov [$2156], r0

; copy doc to staging area
$2051:    13 60 21      mov r3, $2160
$2054:    12 60 23      mov r2, $2360
$2057:    11 00 02      mov r1, $0200
$205A:    99 28 00      fixme: jmp/call $0028    # <MemCpy>

; loope
$205D:    12 60 23      mov r2, $2360
$2060:    13 00 01      mov r3, $0100
target:
$2063:    99 86 20      fixme: jmp/call $2086    # <None>
$2066:    24            mov r1, r0
$2067:    52            mov r0, [r2]
$2068:    D9            xor r0, r1
$2069:    78            fixme: unknown opcode 78
$206A:    AA            inc r2
$206B:    AA            inc r2
$206C:    AF            dec r3
$206D:    A5 00 00      fixme: unknown opcode A5
$2070:    9D 63 20      fixme: jmp/cond[???] $2063 






$2073:    12 1F 21      mov r2, $211F
$2076:    99 08 00      fixme: jmp/call $0008    # <PrintStr>
$2079:    12 60 23      mov r2, $2360
$207C:    99 08 00      fixme: jmp/call $0008    # <PrintStr>
$207F:    12 3F 21      mov r2, $213F
$2082:    99 08 00      fixme: jmp/call $0008    # <PrintStr>
$2085:    05            fixme: unknown opcode 05




$2086:    B4 56 21      mov r0, [$2156]
$2089:    01 A7 41      mul r0, $41A7
$208C:    CF 55 55      fixme: unknown opcode CF
$208F:    BC 56 21      mov [$2156], r0
$2092:    05            fixme: unknown opcode 05






$2093:    47            mov r1, byte ptr [r3]
$2094:    4C            mov r3, byte ptr [r0]
$2095:    49            mov r2, byte ptr [r1]
$2096:    54            mov r1, [r0]
$2097:    43            mov r0, byte ptr [r3]
$2098:    48            mov r2, byte ptr [r0]
$2099:    20            mov r0, r0
$209A:    52            mov r0, [r2]
$209B:    45            mov r1, byte ptr [r1]
$209C:    53            mov r0, [r3]
$209D:    45            mov r1, byte ptr [r1]
$209E:    41            mov r0, byte ptr [r1]
$209F:    52            mov r0, [r2]
$20A0:    43            mov r0, byte ptr [r3]
$20A1:    48            mov r2, byte ptr [r0]
$20A2:    20            mov r0, r0
$20A3:    4C            mov r3, byte ptr [r0]
$20A4:    41            mov r0, byte ptr [r1]
$20A5:    42            mov r0, byte ptr [r2]
$20A6:    4F            mov r3, byte ptr [r3]
$20A7:    52            mov r0, [r2]
$20A8:    41            mov r0, byte ptr [r1]
$20A9:    54            mov r1, [r0]
$20AA:    4F            mov r3, byte ptr [r3]
$20AB:    52            mov r0, [r2]
$20AC:    59            mov r2, [r1]
$20AD:    20            mov r0, r0
$20AE:    53            mov r0, [r3]
$20AF:    45            mov r1, byte ptr [r1]
$20B0:    4C            mov r3, byte ptr [r0]
$20B1:    46            mov r1, byte ptr [r2]
$20B2:    2D            mov r3, r1
$20B3:    43            mov r0, byte ptr [r3]
$20B4:    4F            mov r3, byte ptr [r3]
$20B5:    4E            mov r3, byte ptr [r2]
$20B6:    54            mov r1, [r0]
$20B7:    41            mov r0, byte ptr [r1]
$20B8:    49            mov r2, byte ptr [r1]
$20B9:    4E            mov r3, byte ptr [r2]
$20BA:    45            mov r1, byte ptr [r1]
$20BB:    44            mov r1, byte ptr [r0]
$20BC:    20            mov r0, r0
$20BD:    45            mov r1, byte ptr [r1]
$20BE:    4E            mov r3, byte ptr [r2]
$20BF:    43            mov r0, byte ptr [r3]
$20C0:    52            mov r0, [r2]
$20C1:    59            mov r2, [r1]
$20C2:    50            mov r0, [r0]
$20C3:    54            mov r1, [r0]
$20C4:    49            mov r2, byte ptr [r1]
$20C5:    4F            mov r3, byte ptr [r3]
$20C6:    4E            mov r3, byte ptr [r2]
$20C7:    20            mov r0, r0
$20C8:    54            mov r1, [r0]
$20C9:    4F            mov r3, byte ptr [r3]
$20CA:    4F            mov r3, byte ptr [r3]
$20CB:    4C            mov r3, byte ptr [r0]
$20CC:    0A            mov r0, sp
$20CD:    00            trap
$20CE:    50            mov r0, [r0]
$20CF:    4C            mov r3, byte ptr [r0]
$20D0:    45            mov r1, byte ptr [r1]
$20D1:    41            mov r0, byte ptr [r1]
$20D2:    53            mov r0, [r3]
$20D3:    45            mov r1, byte ptr [r1]
$20D4:    20            mov r0, r0
$20D5:    4C            mov r3, byte ptr [r0]
$20D6:    4F            mov r3, byte ptr [r3]
$20D7:    41            mov r0, byte ptr [r1]
$20D8:    44            mov r1, byte ptr [r0]
$20D9:    20            mov r0, r0
$20DA:    4D            mov r3, byte ptr [r1]
$20DB:    45            mov r1, byte ptr [r1]
$20DC:    20            mov r0, r0
$20DD:    41            mov r0, byte ptr [r1]
$20DE:    54            mov r1, [r0]
$20DF:    20            mov r0, r0
$20E0:    41            mov r0, byte ptr [r1]
$20E1:    44            mov r1, byte ptr [r0]
$20E2:    44            mov r1, byte ptr [r0]
$20E3:    52            mov r0, [r2]
$20E4:    45            mov r1, byte ptr [r1]
$20E5:    53            mov r0, [r3]
$20E6:    53            mov r0, [r3]
$20E7:    20            mov r0, r0
$20E8:    24            mov r1, r0
$20E9:    32            add r0, r2
$20EA:    30            add r0, r0
$20EB:    30            add r0, r0
$20EC:    30            add r0, r0
$20ED:    2E            mov r3, r2
$20EE:    2E            mov r3, r2
$20EF:    2E            mov r3, r2
$20F0:    20            mov r0, r0
$20F1:    28            mov r2, r0
$20F2:    45            mov r1, byte ptr [r1]
$20F3:    58            mov r2, [r0]
$20F4:    49            mov r2, byte ptr [r1]
$20F5:    54            mov r1, [r0]
$20F6:    49            mov r2, byte ptr [r1]
$20F7:    4E            mov r3, byte ptr [r2]
$20F8:    47            mov r1, byte ptr [r3]
$20F9:    29            mov r2, r1
$20FA:    0A            mov r0, sp
$20FB:    00            trap
$20FC:    50            mov r0, [r0]
$20FD:    4C            mov r3, byte ptr [r0]
$20FE:    45            mov r1, byte ptr [r1]
$20FF:    41            mov r0, byte ptr [r1]
$2100:    53            mov r0, [r3]
$2101:    45            mov r1, byte ptr [r1]
$2102:    20            mov r0, r0
$2103:    45            mov r1, byte ptr [r1]
$2104:    4E            mov r3, byte ptr [r2]
$2105:    54            mov r1, [r0]
$2106:    45            mov r1, byte ptr [r1]
$2107:    52            mov r0, [r2]
$2108:    20            mov r0, r0
$2109:    45            mov r1, byte ptr [r1]
$210A:    4E            mov r3, byte ptr [r2]
$210B:    43            mov r0, byte ptr [r3]
$210C:    52            mov r0, [r2]
$210D:    59            mov r2, [r1]
$210E:    50            mov r0, [r0]
$210F:    54            mov r1, [r0]
$2110:    49            mov r2, byte ptr [r1]
$2111:    4F            mov r3, byte ptr [r3]
$2112:    4E            mov r3, byte ptr [r2]
$2113:    20            mov r0, r0
$2114:    50            mov r0, [r0]
$2115:    41            mov r0, byte ptr [r1]
$2116:    53            mov r0, [r3]
$2117:    53            mov r0, [r3]
$2118:    57            mov r1, [r3]
$2119:    4F            mov r3, byte ptr [r3]
$211A:    52            mov r0, [r2]
$211B:    44            mov r1, byte ptr [r0]
$211C:    3A            add r2, r2
$211D:    20            mov r0, r0
$211E:    00            trap
$211F:    48            mov r2, byte ptr [r0]
$2120:    45            mov r1, byte ptr [r1]
$2121:    52            mov r0, [r2]
$2122:    45            mov r1, byte ptr [r1]
$2123:    20            mov r0, r0
$2124:    49            mov r2, byte ptr [r1]
$2125:    53            mov r0, [r3]
$2126:    20            mov r0, r0
$2127:    54            mov r1, [r0]
$2128:    48            mov r2, byte ptr [r0]
$2129:    45            mov r1, byte ptr [r1]
$212A:    20            mov r0, r0
$212B:    45            mov r1, byte ptr [r1]
$212C:    4E            mov r3, byte ptr [r2]
$212D:    43            mov r0, byte ptr [r3]
$212E:    52            mov r0, [r2]
$212F:    59            mov r2, [r1]
$2130:    50            mov r0, [r0]
$2131:    54            mov r1, [r0]
$2132:    45            mov r1, byte ptr [r1]
$2133:    44            mov r1, byte ptr [r0]
$2134:    20            mov r0, r0
$2135:    44            mov r1, byte ptr [r0]
$2136:    4F            mov r3, byte ptr [r3]
$2137:    43            mov r0, byte ptr [r3]
$2138:    55            mov r1, [r1]
$2139:    4D            mov r3, byte ptr [r1]
$213A:    45            mov r1, byte ptr [r1]
$213B:    4E            mov r3, byte ptr [r2]
$213C:    54            mov r1, [r0]
$213D:    3A            add r2, r2
$213E:    20            mov r0, r0
$213F:    0A            mov r0, sp
$2140:    2D            mov r3, r1
$2141:    2D            mov r3, r1
$2142:    0A            mov r0, sp
$2143:    00            trap
$2144:    5F            mov r3, [r3]
$2145:    5F            mov r3, [r3]
$2146:    5F            mov r3, [r3]
$2147:    5F            mov r3, [r3]
$2148:    5F            mov r3, [r3]
$2149:    5F            mov r3, [r3]
$214A:    5F            mov r3, [r3]
$214B:    5F            mov r3, [r3]
$214C:    5F            mov r3, [r3]
$214D:    5F            mov r3, [r3]
$214E:    5F            mov r3, [r3]
$214F:    5F            mov r3, [r3]
$2150:    5F            mov r3, [r3]
$2151:    5F            mov r3, [r3]
$2152:    5F            mov r3, [r3]
$2153:    5F            mov r3, [r3]
$2154:    00            trap
$2155:    00            trap
$2156:    5F            mov r3, [r3]
$2157:    5F            mov r3, [r3]
$2158:    33            add r0, r3
$2159:    33            add r0, r3
$215A:    33            add r0, r3
$215B:    33            add r0, r3
$215C:    33            add r0, r3
$215D:    33            add r0, r3
$215E:    33            add r0, r3
$215F:    33            add r0, r3
$2160:    FB            fixme: unknown opcode FB
$2161:    72            fixme: unknown opcode 72
$2162:    3A            add r2, r2
$2163:    22            mov r0, r2
$2164:    21            mov r0, r1
$2165:    4B            mov r2, byte ptr [r3]
$2166:    6A            fixme: unknown opcode 6A
$2167:    C2            fixme: unknown opcode C2
$2168:    28            mov r2, r0
$2169:    E6            fixme: unknown opcode E6
$216A:    E4            fixme: unknown opcode E4
$216B:    C1            fixme: unknown opcode C1
$216C:    A7            fixme: sub sp, 2 ????
$216D:    25            mov r1, r1
$216E:    B6 E0 98      mov r2, [$98E0]
$2171:    B2 0A E0      mov r2, byte ptr [$E00A
$2174:    9B AB C1      fixme: jmp/cond[???] $C1AB
$2177:    84            fixme: unknown opcode 84
$2178:    B8 2D 8F      mov byte ptr [$8F2D], low(r0)
$217B:    D8            fixme: unknown opcode D8
$217C:    7E            fixme: unknown opcode 7E
$217D:    07            fixme: unknown opcode 07
$217E:    3A            add r2, r2
$217F:    CB            call r2
$2180:    C9            call r0
$2181:    F0            fixme: unknown opcode F0
$2182:    F5            fixme: unknown opcode F5
$2183:    38            add r2, r0
$2184:    51            mov r0, [r1]
$2185:    43            mov r0, byte ptr [r3]
$2186:    ED            fixme: unknown opcode ED
$2187:    52            mov r0, [r2]
$2188:    F8            fixme: unknown opcode F8
$2189:    44            mov r1, byte ptr [r0]
$218A:    E4            fixme: unknown opcode E4
$218B:    C2            fixme: unknown opcode C2
$218C:    50            mov r0, [r0]
$218D:    22            mov r0, r2
$218E:    27            mov r1, r3
$218F:    2A            mov r2, r2
$2190:    65            fixme: unknown opcode 65
$2191:    44            mov r1, byte ptr [r0]
$2192:    81            fixme: unknown opcode 81
$2193:    79            fixme: unknown opcode 79
$2194:    C2            fixme: unknown opcode C2
$2195:    6C            fixme: unknown opcode 6C
$2196:    B4 AF D9      mov r0, [$D9AF]
$2199:    9D 7C 74      fixme: jmp/cond[???] $747C
$219C:    B3 58 EA      mov r3, byte ptr [$EA58
$219F:    CD 69 E2      fixme: unknown opcode CD
$21A2:    A2 DF E7      fixme: unknown opcode A2
$21A5:    CA            call r1
$21A6:    C4            fixme: unknown opcode C4
$21A7:    65            fixme: unknown opcode 65
$21A8:    E0            fixme: unknown opcode E0
$21A9:    E8            fixme: unknown opcode E8
$21AA:    F3            fixme: unknown opcode F3
$21AB:    BE EE 97      mov [$97EE], r0
$21AE:    68            fixme: unknown opcode 68
$21AF:    AD            dec r1
$21B0:    61            fixme: unknown opcode 61
$21B1:    0E            lsl r0
$21B2:    27            mov r1, r3
$21B3:    78            fixme: unknown opcode 78
$21B4:    32            add r0, r2
$21B5:    86            fixme: unknown opcode 86
$21B6:    6D            fixme: unknown opcode 6D
$21B7:    5C            mov r3, [r0]
$21B8:    02 C2 6E      mul r0, r1
$21BB:    D1            fixme: unknown opcode D1
$21BC:    DF            fixme: unknown opcode DF
$21BD:    93            push r3
$21BE:    14            fixme: unknown opcode 14
$21BF:    4D            mov r3, byte ptr [r1]
$21C0:    CB            call r2
$21C1:    1A            fixme: unknown opcode 1A
$21C2:    90            push r0
$21C3:    F4            fixme: unknown opcode F4
$21C4:    20            mov r0, r0
$21C5:    95            pop r1
$21C6:    C0            fixme: unknown opcode C0
$21C7:    D3            fixme: unknown opcode D3
$21C8:    1D            fixme: unknown opcode 1D
$21C9:    E8            fixme: unknown opcode E8
$21CA:    73            fixme: unknown opcode 73
$21CB:    2B            mov r2, r3
$21CC:    DB            fixme: unknown opcode DB
$21CD:    AF            dec r3
$21CE:    AE            dec r2
$21CF:    74            fixme: unknown opcode 74
$21D0:    7A            fixme: unknown opcode 7A
$21D1:    1D            fixme: unknown opcode 1D
$21D2:    50            mov r0, [r0]
$21D3:    4A            mov r2, byte ptr [r2]
$21D4:    A6            fixme: sub sp, 2 ????
$21D5:    9D 56 CC      fixme: jmp/cond[???] $CC56
$21D8:    B5 5D 07      mov r1, [$075D]
$21DB:    D1            fixme: unknown opcode D1
$21DC:    04            div r0, r1
$21DD:    A7            fixme: sub sp, 2 ????
$21DE:    16            fixme: unknown opcode 16
$21DF:    5C            mov r3, [r0]
$21E0:    1D            fixme: unknown opcode 1D
$21E1:    40            mov r0, byte ptr [r0]
$21E2:    4E            mov r3, byte ptr [r2]
$21E3:    65            fixme: unknown opcode 65
$21E4:    51            mov r0, [r1]
$21E5:    F2            fixme: unknown opcode F2
$21E6:    68            fixme: unknown opcode 68
$21E7:    0A            mov r0, sp
$21E8:    4A            mov r2, byte ptr [r2]
$21E9:    B3 56 56      mov r3, byte ptr [$5656
$21EC:    C1            fixme: unknown opcode C1
$21ED:    51            mov r0, [r1]
$21EE:    1F            fixme: unknown opcode 1F
$21EF:    0F            lsr r0
$21F0:    C2            fixme: unknown opcode C2
$21F1:    7D            fixme: unknown opcode 7D
$21F2:    4B            mov r2, byte ptr [r3]
$21F3:    29            mov r2, r1
$21F4:    5B            mov r2, [r3]
$21F5:    58            mov r2, [r0]
$21F6:    1D            fixme: unknown opcode 1D
$21F7:    2F            mov r3, r3
$21F8:    FF            fixme: unknown opcode FF
$21F9:    66            fixme: unknown opcode 66
$21FA:    C0            fixme: unknown opcode C0
$21FB:    3C            add r3, r0
$21FC:    BB BB 34      mov byte ptr [$34BB], low(r0)
$21FF:    93            push r3
$2200:    30            add r0, r0
$2201:    E6            fixme: unknown opcode E6
$2202:    34            add r1, r0
$2203:    B7 8D D4      mov r3, [$D48D]
$2206:    4A            mov r2, byte ptr [r2]
$2207:    A3 D7 88      fixme: unknown opcode A3
$220A:    00            trap
$220B:    72            fixme: unknown opcode 72
$220C:    BA 13 0C      mov byte ptr [$0C13], low(r0)
$220F:    4D            mov r3, byte ptr [r1]
$2210:    97            pop r3
$2211:    46            mov r1, byte ptr [r2]
$2212:    E0            fixme: unknown opcode E0
$2213:    BB 07 A6      mov byte ptr [$A607], low(r0)
$2216:    EF            fixme: unknown opcode EF
$2217:    FA            fixme: unknown opcode FA
$2218:    12 0A FE      mov r2, $FE0A
$221B:    56            mov r1, [r2]
$221C:    E9            fixme: unknown opcode E9
$221D:    14            fixme: unknown opcode 14
$221E:    2B            mov r2, r3
$221F:    DA            fixme: unknown opcode DA
$2220:    64            fixme: unknown opcode 64
$2221:    3C            add r3, r0
$2222:    FE            fixme: unknown opcode FE
$2223:    C5            fixme: unknown opcode C5
$2224:    3C            add r3, r0
$2225:    A3 50 02      fixme: unknown opcode A3
$2228:    20            mov r0, r0
$2229:    B7 20 05      mov r3, [$0520]
$222C:    3D            add r3, r1
$222D:    DB            fixme: unknown opcode DB
$222E:    F1            fixme: unknown opcode F1
$222F:    8A            fixme: unknown opcode 8A
$2230:    81            fixme: unknown opcode 81
$2231:    41            mov r0, byte ptr [r1]
$2232:    4C            mov r3, byte ptr [r0]
$2233:    24            mov r1, r0
$2234:    52            mov r0, [r2]
$2235:    38            add r2, r0
$2236:    8F            fixme: unknown opcode 8F
$2237:    B9 7E 2E      mov byte ptr [$2E7E], low(r0)
$223A:    6F            fixme: unknown opcode 6F
$223B:    76            fixme: unknown opcode 76
$223C:    1C            fixme: unknown opcode 1C
$223D:    3F            add r3, r3
$223E:    97            pop r3
$223F:    87            fixme: unknown opcode 87
$2240:    16            fixme: unknown opcode 16
$2241:    D5            fixme: unknown opcode D5
$2242:    D3            fixme: unknown opcode D3
$2243:    C9            call r0
$2244:    70            fixme: unknown opcode 70
$2245:    92            push r2
$2246:    D7            fixme: unknown opcode D7
$2247:    D2            fixme: unknown opcode D2
$2248:    47            mov r1, byte ptr [r3]
$2249:    59            mov r2, [r1]
$224A:    E6            fixme: unknown opcode E6
$224B:    87            fixme: unknown opcode 87
$224C:    12 2C E0      mov r2, $E02C
$224F:    A5 6C 17      fixme: unknown opcode A5
$2252:    9C BE EE      fixme: jmp/cond[???] $EEBE
$2255:    E4            fixme: unknown opcode E4
$2256:    D4            fixme: unknown opcode D4
$2257:    50            mov r0, [r0]
$2258:    EA            fixme: unknown opcode EA
$2259:    94            pop r0
$225A:    57            mov r1, [r3]
$225B:    91            push r1
$225C:    4F            mov r3, byte ptr [r3]
$225D:    B1 57 AA      mov r1, byte ptr [$AA57
$2260:    46            mov r1, byte ptr [r2]
$2261:    E9            fixme: unknown opcode E9
$2262:    86            fixme: unknown opcode 86
$2263:    76            fixme: unknown opcode 76
$2264:    D3            fixme: unknown opcode D3
$2265:    F8            fixme: unknown opcode F8
$2266:    B9 A5 8C      mov byte ptr [$8CA5], low(r0)
$2269:    9C 57 56      fixme: jmp/cond[???] $5657
$226C:    0A            mov r0, sp
$226D:    72            fixme: unknown opcode 72
$226E:    48            mov r2, byte ptr [r0]
$226F:    C8            fixme: unknown opcode C8
$2270:    14            fixme: unknown opcode 14
$2271:    B6 8B F2      mov r2, [$F28B]
$2274:    48            mov r2, byte ptr [r0]
$2275:    3C            add r3, r0
$2276:    4D            mov r3, byte ptr [r1]
$2277:    B5 3A 48      mov r1, [$483A]
$227A:    07            fixme: unknown opcode 07
$227B:    A6            fixme: sub sp, 2 ????
$227C:    F2            fixme: unknown opcode F2
$227D:    8E            fixme: unknown opcode 8E
$227E:    A3 0B 39      fixme: unknown opcode A3
$2281:    02 75 9B      mul r0, r1
$2284:    C8            fixme: unknown opcode C8
$2285:    DC            fixme: unknown opcode DC
$2286:    6F            fixme: unknown opcode 6F
$2287:    0A            mov r0, sp
$2288:    75            fixme: unknown opcode 75
$2289:    00            trap
$228A:    52            mov r0, [r2]
$228B:    6D            fixme: unknown opcode 6D
$228C:    BF 77 89      mov [$8977], r0
$228F:    2F            mov r3, r3
$2290:    CE B0 27      fixme: unknown opcode CE
$2293:    EF            fixme: unknown opcode EF
$2294:    42            mov r0, byte ptr [r2]
$2295:    1E            fixme: unknown opcode 1E
$2296:    36            add r1, r2
$2297:    E1            fixme: unknown opcode E1
$2298:    37            add r1, r3
$2299:    C6            fixme: unknown opcode C6
$229A:    F7            fixme: unknown opcode F7
$229B:    77            fixme: unknown opcode 77
$229C:    34            add r1, r0
$229D:    1D            fixme: unknown opcode 1D
$229E:    6A            fixme: unknown opcode 6A
$229F:    D3            fixme: unknown opcode D3
$22A0:    A7            fixme: sub sp, 2 ????
$22A1:    48            mov r2, byte ptr [r0]
$22A2:    6A            fixme: unknown opcode 6A
$22A3:    C1            fixme: unknown opcode C1
$22A4:    7D            fixme: unknown opcode 7D
$22A5:    E7            fixme: unknown opcode E7
$22A6:    76            fixme: unknown opcode 76
$22A7:    8C            fixme: unknown opcode 8C
$22A8:    62            fixme: unknown opcode 62
$22A9:    8F            fixme: unknown opcode 8F
$22AA:    62            fixme: unknown opcode 62
$22AB:    8C            fixme: unknown opcode 8C
$22AC:    5C            mov r3, [r0]
$22AD:    E4            fixme: unknown opcode E4
$22AE:    F1            fixme: unknown opcode F1
$22AF:    F3            fixme: unknown opcode F3
$22B0:    FD            fixme: unknown opcode FD
$22B1:    5F            mov r3, [r3]
$22B2:    B6 9D B4      mov r2, [$B49D]
$22B5:    D7            fixme: unknown opcode D7
$22B6:    A8            inc r0
$22B7:    A0 CD DE      call $DECD
$22BA:    8B            fixme: unknown opcode 8B
$22BB:    72            fixme: unknown opcode 72
$22BC:    73            fixme: unknown opcode 73
$22BD:    E4            fixme: unknown opcode E4
$22BE:    FA            fixme: unknown opcode FA
$22BF:    E7            fixme: unknown opcode E7
$22C0:    33            add r0, r3
$22C1:    8F            fixme: unknown opcode 8F
$22C2:    11 1E AF      mov r1, $AF1E
$22C5:    D3            fixme: unknown opcode D3
$22C6:    40            mov r0, byte ptr [r0]
$22C7:    A7            fixme: sub sp, 2 ????
$22C8:    86            fixme: unknown opcode 86
$22C9:    26            mov r1, r2
$22CA:    F3            fixme: unknown opcode F3
$22CB:    77            fixme: unknown opcode 77
$22CC:    4C            mov r3, byte ptr [r0]
$22CD:    6E            fixme: unknown opcode 6E
$22CE:    2D            mov r3, r1
$22CF:    2D            mov r3, r1
$22D0:    A4 03 C2      fixme: unknown opcode A4
$22D3:    74            fixme: unknown opcode 74
$22D4:    2E            mov r3, r2
$22D5:    B3 DD 85      mov r3, byte ptr [$85DD
$22D8:    29            mov r2, r1
$22D9:    41            mov r0, byte ptr [r1]
$22DA:    90            push r0
$22DB:    C3            fixme: unknown opcode C3
$22DC:    C7            fixme: unknown opcode C7
$22DD:    3A            add r2, r2
$22DE:    96            pop r2
$22DF:    B9 8E 35      mov byte ptr [$358E], low(r0)
$22E2:    CF 37 C0      fixme: unknown opcode CF
$22E5:    C8            fixme: unknown opcode C8
$22E6:    FF            fixme: unknown opcode FF
$22E7:    D5            fixme: unknown opcode D5
$22E8:    8B            fixme: unknown opcode 8B
$22E9:    9F A1 D9      fixme: jmp/cond[???] $D9A1
$22EC:    0F            lsr r0
$22ED:    8E            fixme: unknown opcode 8E
$22EE:    8E            fixme: unknown opcode 8E
$22EF:    C6            fixme: unknown opcode C6
$22F0:    11 C1 C0      mov r1, $C0C1
$22F3:    C9            call r0
$22F4:    9E 5B 9C      fixme: jmp/cond[???] $9C5B
$22F7:    A1 2D C6      fixme: unknown opcode A1
$22FA:    4B            mov r2, byte ptr [r3]
$22FB:    F5            fixme: unknown opcode F5
$22FC:    34            add r1, r0
$22FD:    65            fixme: unknown opcode 65
$22FE:    B4 CC AC      mov r0, [$ACCC]
$2301:    88            fixme: unknown opcode 88
$2302:    BF 49 43      mov [$4349], r0
$2305:    77            fixme: unknown opcode 77
$2306:    AC            dec r0
$2307:    8F            fixme: unknown opcode 8F
$2308:    61            fixme: unknown opcode 61
$2309:    71            fixme: unknown opcode 71
$230A:    8E            fixme: unknown opcode 8E
$230B:    59            mov r2, [r1]
$230C:    7F            fixme: unknown opcode 7F
$230D:    78            fixme: unknown opcode 78
$230E:    D9            fixme: unknown opcode D9
$230F:    73            fixme: unknown opcode 73
$2310:    41            mov r0, byte ptr [r1]
$2311:    90            push r0
$2312:    73            fixme: unknown opcode 73
$2313:    8B            fixme: unknown opcode 8B
$2314:    8E            fixme: unknown opcode 8E
$2315:    93            push r3
$2316:    3F            add r3, r3
$2317:    6E            fixme: unknown opcode 6E
$2318:    DD            fixme: unknown opcode DD
$2319:    2E            mov r3, r2
$231A:    37            add r1, r3
$231B:    E8            fixme: unknown opcode E8
$231C:    72            fixme: unknown opcode 72
$231D:    43            mov r0, byte ptr [r3]
$231E:    A1 F3 A9      fixme: unknown opcode A1
$2321:    FE            fixme: unknown opcode FE
$2322:    7F            fixme: unknown opcode 7F
$2323:    98 F3 A5      fixme: jmp/call $A5F3    # <None>
$2326:    98 43 E5      fixme: jmp/call $E543    # <None>
$2329:    60            fixme: unknown opcode 60
$232A:    B9 5D BD      mov byte ptr [$BD5D], low(r0)
$232D:    BA 3F AE      mov byte ptr [$AE3F], low(r0)
$2330:    71            fixme: unknown opcode 71
$2331:    F6            fixme: unknown opcode F6
$2332:    ED            fixme: unknown opcode ED
$2333:    C1            fixme: unknown opcode C1
$2334:    FE            fixme: unknown opcode FE
$2335:    8F            fixme: unknown opcode 8F
$2336:    2D            mov r3, r1
$2337:    15            fixme: unknown opcode 15
$2338:    D9            fixme: unknown opcode D9
$2339:    C6            fixme: unknown opcode C6
$233A:    F7            fixme: unknown opcode F7
$233B:    57            mov r1, [r3]
$233C:    83            fixme: unknown opcode 83
$233D:    57            mov r1, [r3]
$233E:    7E            fixme: unknown opcode 7E
$233F:    10 B6 C3      mov r0, $C3B6
$2342:    76            fixme: unknown opcode 76
$2343:    29            mov r2, r1
$2344:    B1 10 12      mov r1, byte ptr [$1210
$2347:    1E            fixme: unknown opcode 1E
$2348:    EA            fixme: unknown opcode EA
$2349:    A1 15 81      fixme: unknown opcode A1
$234C:    9C 22 5F      fixme: jmp/cond[???] $5F22
$234F:    8A            fixme: unknown opcode 8A
$2350:    F3            fixme: unknown opcode F3
$2351:    FF            fixme: unknown opcode FF
$2352:    1C            fixme: unknown opcode 1C
$2353:    37            add r1, r3
$2354:    4E            mov r3, byte ptr [r2]
$2355:    57            mov r1, [r3]
$2356:    1B            fixme: unknown opcode 1B
$2357:    26            mov r1, r2
$2358:    64            fixme: unknown opcode 64
$2359:    B7 CA 7C      mov r3, [$7CCA]
$235C:    C8            fixme: unknown opcode C8
$235D:    57            mov r1, [r3]
$235E:    D9            fixme: unknown opcode D9
$235F:    57            mov r1, [r3]
$2360:    00            trap
$2361:    00            trap
$2362:    00            trap
$2363:    00            trap
$2364:    00            trap
$2365:    00            trap
$2366:    00            trap
$2367:    00            trap
$2368:    00            trap
$2369:    00            trap
$236A:    00            trap
$236B:    00            trap
$236C:    00            trap
$236D:    00            trap
$236E:    00            trap
$236F:    00            trap
$2370:    00            trap
$2371:    00            trap
$2372:    00            trap
$2373:    00            trap
$2374:    00            trap
$2375:    00            trap
$2376:    00            trap
$2377:    00            trap
$2378:    00            trap
$2379:    00            trap
$237A:    00            trap
$237B:    00            trap
$237C:    00            trap
$237D:    00            trap
$237E:    00            trap
$237F:    00            trap
$2380:    00            trap
$2381:    00            trap
$2382:    00            trap
$2383:    00            trap
$2384:    00            trap
$2385:    00            trap
$2386:    00            trap
$2387:    00            trap
$2388:    00            trap
$2389:    00            trap
$238A:    00            trap
$238B:    00            trap
$238C:    00            trap
$238D:    00            trap
$238E:    00            trap
$238F:    00            trap
$2390:    00            trap
$2391:    00            trap
$2392:    00            trap
$2393:    00            trap
$2394:    00            trap
$2395:    00            trap
$2396:    00            trap
$2397:    00            trap
$2398:    00            trap
$2399:    00            trap
$239A:    00            trap
$239B:    00            trap
$239C:    00            trap
$239D:    00            trap
$239E:    00            trap
$239F:    00            trap
$23A0:    00            trap
$23A1:    00            trap
$23A2:    00            trap
$23A3:    00            trap
$23A4:    00            trap
$23A5:    00            trap
$23A6:    00            trap
$23A7:    00            trap
$23A8:    00            trap
$23A9:    00            trap
$23AA:    00            trap
$23AB:    00            trap
$23AC:    00            trap
$23AD:    00            trap
$23AE:    00            trap
$23AF:    00            trap
$23B0:    00            trap
$23B1:    00            trap
$23B2:    00            trap
$23B3:    00            trap
$23B4:    00            trap
$23B5:    00            trap
$23B6:    00            trap
$23B7:    00            trap
$23B8:    00            trap
$23B9:    00            trap
$23BA:    00            trap
$23BB:    00            trap
$23BC:    00            trap
$23BD:    00            trap
$23BE:    00            trap
$23BF:    00            trap
$23C0:    00            trap
$23C1:    00            trap
$23C2:    00            trap
$23C3:    00            trap
$23C4:    00            trap
$23C5:    00            trap
$23C6:    00            trap
$23C7:    00            trap
$23C8:    00            trap
$23C9:    00            trap
$23CA:    00            trap
$23CB:    00            trap
$23CC:    00            trap
$23CD:    00            trap
$23CE:    00            trap
$23CF:    00            trap
$23D0:    00            trap
$23D1:    00            trap
$23D2:    00            trap
$23D3:    00            trap
$23D4:    00            trap
$23D5:    00            trap
$23D6:    00            trap
$23D7:    00            trap
$23D8:    00            trap
$23D9:    00            trap
$23DA:    00            trap
$23DB:    00            trap
$23DC:    00            trap
$23DD:    00            trap
$23DE:    00            trap
$23DF:    00            trap
$23E0:    00            trap
$23E1:    00            trap
$23E2:    00            trap
$23E3:    00            trap
$23E4:    00            trap
$23E5:    00            trap
$23E6:    00            trap
$23E7:    00            trap
$23E8:    00            trap
$23E9:    00            trap
$23EA:    00            trap
$23EB:    00            trap
$23EC:    00            trap
$23ED:    00            trap
$23EE:    00            trap
$23EF:    00            trap
$23F0:    00            trap
$23F1:    00            trap
$23F2:    00            trap
$23F3:    00            trap
$23F4:    00            trap
$23F5:    00            trap
$23F6:    00            trap
$23F7:    00            trap
$23F8:    00            trap
$23F9:    00            trap
$23FA:    00            trap
$23FB:    00            trap
$23FC:    00            trap
$23FD:    00            trap
$23FE:    00            trap
$23FF:    00            trap
$2400:    00            trap
$2401:    00            trap
$2402:    00            trap
$2403:    00            trap
$2404:    00            trap
$2405:    00            trap
$2406:    00            trap
$2407:    00            trap
$2408:    00            trap
$2409:    00            trap
$240A:    00            trap
$240B:    00            trap
$240C:    00            trap
$240D:    00            trap
$240E:    00            trap
$240F:    00            trap
$2410:    00            trap
$2411:    00            trap
$2412:    00            trap
$2413:    00            trap
$2414:    00            trap
$2415:    00            trap
$2416:    00            trap
$2417:    00            trap
$2418:    00            trap
$2419:    00            trap
$241A:    00            trap
$241B:    00            trap
$241C:    00            trap
$241D:    00            trap
$241E:    00            trap
$241F:    00            trap
$2420:    00            trap
$2421:    00            trap
$2422:    00            trap
$2423:    00            trap
$2424:    00            trap
$2425:    00            trap
$2426:    00            trap
$2427:    00            trap
$2428:    00            trap
$2429:    00            trap
$242A:    00            trap
$242B:    00            trap
$242C:    00            trap
$242D:    00            trap
$242E:    00            trap
$242F:    00            trap
$2430:    00            trap
$2431:    00            trap
$2432:    00            trap
$2433:    00            trap
$2434:    00            trap
$2435:    00            trap
$2436:    00            trap
$2437:    00            trap
$2438:    00            trap
$2439:    00            trap
$243A:    00            trap
$243B:    00            trap
$243C:    00            trap
$243D:    00            trap
$243E:    00            trap
$243F:    00            trap
$2440:    00            trap
$2441:    00            trap
$2442:    00            trap
$2443:    00            trap
$2444:    00            trap
$2445:    00            trap
$2446:    00            trap
$2447:    00            trap
$2448:    00            trap
$2449:    00            trap
$244A:    00            trap
$244B:    00            trap
$244C:    00            trap
$244D:    00            trap
$244E:    00            trap
$244F:    00            trap
$2450:    00            trap
$2451:    00            trap
$2452:    00            trap
$2453:    00            trap
$2454:    00            trap
$2455:    00            trap
$2456:    00            trap
$2457:    00            trap
$2458:    00            trap
$2459:    00            trap
$245A:    00            trap
$245B:    00            trap
$245C:    00            trap
$245D:    00            trap
$245E:    00            trap
$245F:    00            trap
$2460:    00            trap
$2461:    00            trap
$2462:    00            trap
$2463:    00            trap
$2464:    00            trap
$2465:    00            trap
$2466:    00            trap
$2467:    00            trap
$2468:    00            trap
$2469:    00            trap
$246A:    00            trap
$246B:    00            trap
$246C:    00            trap
$246D:    00            trap
$246E:    00            trap
$246F:    00            trap
$2470:    00            trap
$2471:    00            trap
$2472:    00            trap
$2473:    00            trap
$2474:    00            trap
$2475:    00            trap
$2476:    00            trap
$2477:    00            trap
$2478:    00            trap
$2479:    00            trap
$247A:    00            trap
$247B:    00            trap
$247C:    00            trap
$247D:    00            trap
$247E:    00            trap
$247F:    00            trap
$2480:    00            trap
$2481:    00            trap
$2482:    00            trap
$2483:    00            trap
$2484:    00            trap
$2485:    00            trap
$2486:    00            trap
$2487:    00            trap
$2488:    00            trap
$2489:    00            trap
$248A:    00            trap
$248B:    00            trap
$248C:    00            trap
$248D:    00            trap
$248E:    00            trap
$248F:    00            trap
$2490:    00            trap
$2491:    00            trap
$2492:    00            trap
$2493:    00            trap
$2494:    00            trap
$2495:    00            trap
$2496:    00            trap
$2497:    00            trap
$2498:    00            trap
$2499:    00            trap
$249A:    00            trap
$249B:    00            trap
$249C:    00            trap
$249D:    00            trap
$249E:    00            trap
$249F:    00            trap
$24A0:    00            trap
$24A1:    00            trap
$24A2:    00            trap
$24A3:    00            trap
$24A4:    00            trap
$24A5:    00            trap
$24A6:    00            trap
$24A7:    00            trap
$24A8:    00            trap
$24A9:    00            trap
$24AA:    00            trap
$24AB:    00            trap
$24AC:    00            trap
$24AD:    00            trap
$24AE:    00            trap
$24AF:    00            trap
$24B0:    00            trap
$24B1:    00            trap
$24B2:    00            trap
$24B3:    00            trap
$24B4:    00            trap
$24B5:    00            trap
$24B6:    00            trap
$24B7:    00            trap
$24B8:    00            trap
$24B9:    00            trap
$24BA:    00            trap
$24BB:    00            trap
$24BC:    00            trap
$24BD:    00            trap
$24BE:    00            trap
$24BF:    00            trap
$24C0:    00            trap
$24C1:    00            trap
$24C2:    00            trap
$24C3:    00            trap
$24C4:    00            trap
$24C5:    00            trap
$24C6:    00            trap
$24C7:    00            trap
$24C8:    00            trap
$24C9:    00            trap
$24CA:    00            trap
$24CB:    00            trap
$24CC:    00            trap
$24CD:    00            trap
$24CE:    00            trap
$24CF:    00            trap
$24D0:    00            trap
$24D1:    00            trap
$24D2:    00            trap
$24D3:    00            trap
$24D4:    00            trap
$24D5:    00            trap
$24D6:    00            trap
$24D7:    00            trap
$24D8:    00            trap
$24D9:    00            trap
$24DA:    00            trap
$24DB:    00            trap
$24DC:    00            trap
$24DD:    00            trap
$24DE:    00            trap
$24DF:    00            trap
$24E0:    00            trap
$24E1:    00            trap
$24E2:    00            trap
$24E3:    00            trap
$24E4:    00            trap
$24E5:    00            trap
$24E6:    00            trap
$24E7:    00            trap
$24E8:    00            trap
$24E9:    00            trap
$24EA:    00            trap
$24EB:    00            trap
$24EC:    00            trap
$24ED:    00            trap
$24EE:    00            trap
$24EF:    00            trap
$24F0:    00            trap
$24F1:    00            trap
$24F2:    00            trap
$24F3:    00            trap
$24F4:    00            trap
$24F5:    00            trap
$24F6:    00            trap
$24F7:    00            trap
$24F8:    00            trap
$24F9:    00            trap
$24FA:    00            trap
$24FB:    00            trap
$24FC:    00            trap
$24FD:    00            trap
$24FE:    00            trap
$24FF:    00            trap
$2500:    00            trap
$2501:    00            trap
$2502:    00            trap
$2503:    00            trap
$2504:    00            trap
$2505:    00            trap
$2506:    00            trap
$2507:    00            trap
$2508:    00            trap
$2509:    00            trap
$250A:    00            trap
$250B:    00            trap
$250C:    00            trap
$250D:    00            trap
$250E:    00            trap
$250F:    00            trap
$2510:    00            trap
$2511:    00            trap
$2512:    00            trap
$2513:    00            trap
$2514:    00            trap
$2515:    00            trap
$2516:    00            trap
$2517:    00            trap
$2518:    00            trap
$2519:    00            trap
$251A:    00            trap
$251B:    00            trap
$251C:    00            trap
$251D:    00            trap
$251E:    00            trap
$251F:    00            trap
$2520:    00            trap
$2521:    00            trap
$2522:    00            trap
$2523:    00            trap
$2524:    00            trap
$2525:    00            trap
$2526:    00            trap
$2527:    00            trap
$2528:    00            trap
$2529:    00            trap
$252A:    00            trap
$252B:    00            trap
$252C:    00            trap
$252D:    00            trap
$252E:    00            trap
$252F:    00            trap
$2530:    00            trap
$2531:    00            trap
$2532:    00            trap
$2533:    00            trap
$2534:    00            trap
$2535:    00            trap
$2536:    00            trap
$2537:    00            trap
$2538:    00            trap
$2539:    00            trap
$253A:    00            trap
$253B:    00            trap
$253C:    00            trap
$253D:    00            trap
$253E:    00            trap
$253F:    00            trap
$2540:    00            trap
$2541:    00            trap
$2542:    00            trap
$2543:    00            trap
$2544:    00            trap
$2545:    00            trap
$2546:    00            trap
$2547:    00            trap
$2548:    00            trap
$2549:    00            trap
$254A:    00            trap
$254B:    00            trap
$254C:    00            trap
$254D:    00            trap
$254E:    00            trap
$254F:    00            trap
$2550:    00            trap
$2551:    00            trap
$2552:    00            trap
$2553:    00            trap
$2554:    00            trap
$2555:    00            trap
$2556:    00            trap
$2557:    00            trap
$2558:    00            trap
$2559:    00            trap
$255A:    00            trap
$255B:    00            trap
$255C:    00            trap
$255D:    00            trap
