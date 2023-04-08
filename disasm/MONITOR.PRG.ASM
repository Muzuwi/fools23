$2000:    09 00 FF      mov sp, $FF00
$2003:    10 F0 FF      mov r0, $FFF0
$2006:    11 98 00      mov r1, $0098
$2009:    61            mov byte ptr [r0], low(r1)
$200A:    A8            inc r0
$200B:    11 7E F3      mov r1, $F37E
$200E:    71            mov [r0], r1
$200F:    12 9C F6      mov r2, $F69C
$2012:    99 08 00      call $0008    # <PrintStr>
$2015:    12 2D F2      mov r2, $F22D
$2018:    99 08 00      call $0008    # <PrintStr>
$201B:    13 10 00      mov r3, $0010
$201E:    12 DB F1      mov r2, $F1DB
$2021:    99 30 00      call $0030    # <ReadStr>
$2024:    12 1E F1      mov r2, $F11E
$2027:    42            mov r0, byte ptr [r2]
$2028:    A2 00 00      cmp r0, $0000
$202B:    9C AC F0      je $F0AC
$202E:    13 DB F1      mov r3, $F1DB
$2031:    92            push r2
$2032:    99 10 00      call $0010    # <StrCmp>
$2035:    96            pop r2
$2036:    A2 00 00      cmp r0, $0000
$2039:    9C 42 F0      je $F042
$203C:    E2 50 00      add r2, $0050
$203F:    98 27 F0      jmp $F027    # <None>
$2042:    E2 10 00      add r2, $0010
$2045:    92            push r2
$2046:    99 04 F1      call $F104    # <None>
$2049:    12 38 F2      mov r2, $F238
$204C:    99 08 00      call $0008    # <PrintStr>
$204F:    13 30 00      mov r3, $0030
$2052:    12 EC F1      mov r2, $F1EC
$2055:    99 30 00      call $0030    # <ReadStr>
$2058:    99 04 F1      call $F104    # <None>
$205B:    10 01 00      mov r0, $0001
$205E:    11 00 C0      mov r1, $C000
$2061:    06 04         swi 4
$2063:    96            pop r2
$2064:    13 EC F1      mov r3, $F1EC
$2067:    93            push r3
$2068:    11 00 C0      mov r1, $C000
$206B:    43            mov r0, byte ptr [r3]
$206C:    34            add r1, r0
$206D:    13 00 00      mov r3, $0000
$2070:    41            mov r0, byte ptr [r1]
$2071:    3C            add r3, r0
$2072:    E1 00 01      add r1, $0100
$2075:    41            mov r0, byte ptr [r1]
$2076:    3C            add r3, r0
$2077:    E1 00 01      add r1, $0100
$207A:    41            mov r0, byte ptr [r1]
$207B:    3C            add r3, r0
$207C:    E1 00 01      add r1, $0100
$207F:    41            mov r0, byte ptr [r1]
$2080:    3C            add r3, r0
$2081:    23            mov r0, r3
$2082:    CD FF 00      and r0, $00FF
$2085:    46            mov r1, byte ptr [r2]
$2086:    81            cmp r0, r1
$2087:    9D B8 F0      jne $F0B8
$208A:    97            pop r3
$208B:    99 C1 F0      call $F0C1    # <None>
$208E:    AA            inc r2
$208F:    AB            inc r3
$2090:    42            mov r0, byte ptr [r2]
$2091:    A2 00 00      cmp r0, $0000
$2094:    9C 9A F0      je $F09A
$2097:    98 67 F0      jmp $F067    # <None>
$209A:    12 B3 F2      mov r2, $F2B3
$209D:    99 08 00      call $0008    # <PrintStr>
$20A0:    00            trap
$20A1:    12 6B F8      mov r2, $F86B
$20A4:    99 08 00      call $0008    # <PrintStr>
$20A7:    06 03         swi 3
$20A9:    98 A9 F0      jmp $F0A9    # <None>
$20AC:    99 04 F1      call $F104    # <None>
$20AF:    12 78 F2      mov r2, $F278
$20B2:    99 08 00      call $0008    # <PrintStr>
$20B5:    98 15 F0      jmp $F015    # <None>
$20B8:    12 98 F2      mov r2, $F298
$20BB:    99 08 00      call $0008    # <PrintStr>
$20BE:    98 15 F0      jmp $F015    # <None>
$20C1:    B0 00 C0      mov r0, byte ptr [$C000]
$20C4:    B8 00 F1      mov byte ptr [$F100], low(r0)
$20C7:    B0 00 C1      mov r0, byte ptr [$C100]
$20CA:    B8 01 F1      mov byte ptr [$F101], low(r0)
$20CD:    B0 00 C2      mov r0, byte ptr [$C200]
$20D0:    B8 02 F1      mov byte ptr [$F102], low(r0)
$20D3:    B0 00 C3      mov r0, byte ptr [$C300]
$20D6:    B8 03 F1      mov byte ptr [$F103], low(r0)
$20D9:    11 00 C0      mov r1, $C000
$20DC:    A9            inc r1
$20DD:    41            mov r0, byte ptr [r1]
$20DE:    AD            dec r1
$20DF:    64            mov byte ptr [r1], low(r0)
$20E0:    A9            inc r1
$20E1:    A3 FF C3      cmp r1, $C3FF
$20E4:    9D DC F0      jne $F0DC
$20E7:    B0 00 F1      mov r0, byte ptr [$F100]
$20EA:    B8 FF C0      mov byte ptr [$C0FF], low(r0)
$20ED:    B0 01 F1      mov r0, byte ptr [$F101]
$20F0:    B8 FF C1      mov byte ptr [$C1FF], low(r0)
$20F3:    B0 02 F1      mov r0, byte ptr [$F102]
$20F6:    B8 FF C2      mov byte ptr [$C2FF], low(r0)
$20F9:    B0 03 F1      mov r0, byte ptr [$F103]
$20FC:    B8 FF C3      mov byte ptr [$C3FF], low(r0)
$20FF:    05            ret
$2100:    9D 90 D1      jne $D190
$2103:    98 92 12      jmp $1292    # <None>
$2106:    65            mov byte ptr [r1], low(r1)
$2107:    F2            fixme: unknown opcode F2
$2108:    99 08 00      call $0008    # <PrintStr>
$210B:    96            pop r2
$210C:    10 FF 3F      mov r0, $3FFF
$210F:    08            fixme: unknown opcode 08
$2110:    08            fixme: unknown opcode 08
$2111:    08            fixme: unknown opcode 08
$2112:    08            fixme: unknown opcode 08
$2113:    08            fixme: unknown opcode 08
$2114:    08            fixme: unknown opcode 08
$2115:    08            fixme: unknown opcode 08
$2116:    AC            dec r0
$2117:    A2 00 00      cmp r0, $0000
$211A:    9D 0F F1      jne $F10F
$211D:    05            ret
$211E:    61            mov byte ptr [r0], low(r1)
$211F:    78            mov [r2], r0
$2120:    2E            mov r3, r2
$2121:    61            mov byte ptr [r0], low(r1)
$2122:    72            mov [r0], r2
$2123:    77            mov [r1], r3
$2124:    65            mov byte ptr [r1], low(r1)
$2125:    6E            mov byte ptr [r3], low(r2)
$2126:    00            trap
$2127:    00            trap
$2128:    00            trap
$2129:    00            trap
$212A:    00            trap
$212B:    00            trap
$212C:    00            trap
$212D:    00            trap
$212E:    C6            fixme: unknown opcode C6
$212F:    44            mov r1, byte ptr [r0]
$2130:    99 E3 E9      call $E9E3    # <None>
$2133:    19             === ILLEGAL OPCODE ===
$2134:    0D             === ILLEGAL OPCODE ===
$2135:    07 0D 12       ==== secret opcode 0x7 ====
$2138:    79            mov [r2], r1
$2139:    00            trap
$213A:    00            trap
$213B:    00            trap
$213C:    00            trap
$213D:    00            trap
$213E:    00            trap
$213F:    00            trap
$2140:    00            trap
$2141:    00            trap
$2142:    00            trap
$2143:    00            trap
$2144:    00            trap
$2145:    00            trap
$2146:    00            trap
$2147:    00            trap
$2148:    00            trap
$2149:    00            trap
$214A:    00            trap
$214B:    00            trap
$214C:    00            trap
$214D:    00            trap
$214E:    00            trap
$214F:    00            trap
$2150:    00            trap
$2151:    00            trap
$2152:    00            trap
$2153:    00            trap
$2154:    00            trap
$2155:    00            trap
$2156:    00            trap
$2157:    00            trap
$2158:    00            trap
$2159:    00            trap
$215A:    00            trap
$215B:    00            trap
$215C:    00            trap
$215D:    00            trap
$215E:    00            trap
$215F:    00            trap
$2160:    00            trap
$2161:    00            trap
$2162:    00            trap
$2163:    00            trap
$2164:    00            trap
$2165:    00            trap
$2166:    00            trap
$2167:    00            trap
$2168:    00            trap
$2169:    00            trap
$216A:    00            trap
$216B:    00            trap
$216C:    00            trap
$216D:    00            trap
$216E:    73            mov [r0], r3
$216F:    62            mov byte ptr [r0], low(r2)
$2170:    77            mov [r1], r3
$2171:    2E            mov r3, r2
$2172:    73            mov [r0], r3
$2173:    68            mov byte ptr [r2], low(r0)
$2174:    61            mov byte ptr [r0], low(r1)
$2175:    64            mov byte ptr [r1], low(r0)
$2176:    6F            mov byte ptr [r3], low(r3)
$2177:    77            mov [r1], r3
$2178:    00            trap
$2179:    00            trap
$217A:    00            trap
$217B:    00            trap
$217C:    00            trap
$217D:    00            trap
$217E:    E9            fixme: unknown opcode E9
$217F:    22            mov r0, r2
$2180:    D8            xor r0, r0
$2181:    7C            mov [r3], r0
$2182:    3C            add r3, r0
$2183:    07 54 2D       ==== secret opcode 0x7 ====
$2186:    5E            mov r3, [r2]
$2187:    53            mov r0, [r3]
$2188:    6A            mov byte ptr [r2], low(r2)
$2189:    FF            fixme: unknown opcode FF
$218A:    80            cmp r0, r0
$218B:    5E            mov r3, [r2]
$218C:    CD C8 CF      and r0, $CFC8
$218F:    FF            fixme: unknown opcode FF
$2190:    44            mov r1, byte ptr [r0]
$2191:    74            mov [r1], r0
$2192:    C8            fixme: unknown opcode C8
$2193:    D8            xor r0, r0
$2194:    4B            mov r2, byte ptr [r3]
$2195:    00            trap
$2196:    00            trap
$2197:    00            trap
$2198:    00            trap
$2199:    00            trap
$219A:    00            trap
$219B:    00            trap
$219C:    00            trap
$219D:    00            trap
$219E:    00            trap
$219F:    00            trap
$21A0:    00            trap
$21A1:    00            trap
$21A2:    00            trap
$21A3:    00            trap
$21A4:    00            trap
$21A5:    00            trap
$21A6:    00            trap
$21A7:    00            trap
$21A8:    00            trap
$21A9:    00            trap
$21AA:    00            trap
$21AB:    00            trap
$21AC:    00            trap
$21AD:    00            trap
$21AE:    00            trap
$21AF:    00            trap
$21B0:    00            trap
$21B1:    00            trap
$21B2:    00            trap
$21B3:    00            trap
$21B4:    00            trap
$21B5:    00            trap
$21B6:    00            trap
$21B7:    00            trap
$21B8:    00            trap
$21B9:    00            trap
$21BA:    00            trap
$21BB:    00            trap
$21BC:    00            trap
$21BD:    00            trap
$21BE:    00            trap
$21BF:    00            trap
$21C0:    00            trap
$21C1:    00            trap
$21C2:    00            trap
$21C3:    00            trap
$21C4:    00            trap
$21C5:    00            trap
$21C6:    00            trap
$21C7:    00            trap
$21C8:    00            trap
$21C9:    00            trap
$21CA:    00            trap
$21CB:    00            trap
$21CC:    00            trap
$21CD:    00            trap
$21CE:    00            trap
$21CF:    00            trap
$21D0:    00            trap
$21D1:    00            trap
$21D2:    00            trap
$21D3:    00            trap
$21D4:    00            trap
$21D5:    00            trap
$21D6:    00            trap
$21D7:    00            trap
$21D8:    00            trap
$21D9:    00            trap
$21DA:    00            trap
$21DB:    61            mov byte ptr [r0], low(r1)
$21DC:    78            mov [r2], r0
$21DD:    2E            mov r3, r2
$21DE:    61            mov byte ptr [r0], low(r1)
$21DF:    72            mov [r0], r2
$21E0:    77            mov [r1], r3
$21E1:    65            mov byte ptr [r1], low(r1)
$21E2:    6E            mov byte ptr [r3], low(r2)
$21E3:    0A            mov r0, sp
$21E4:    00            trap
$21E5:    5F            mov r3, [r3]
$21E6:    5F            mov r3, [r3]
$21E7:    5F            mov r3, [r3]
$21E8:    5F            mov r3, [r3]
$21E9:    5F            mov r3, [r3]
$21EA:    5F            mov r3, [r3]
$21EB:    00            trap
$21EC:    73            mov [r0], r3
$21ED:    59            mov r2, [r1]
$21EE:    70            mov [r0], r0
$21EF:    69            mov byte ptr [r2], low(r1)
$21F0:    42            mov r0, byte ptr [r2]
$21F1:    3B            add r2, r3
$21F2:    37            add r1, r3
$21F3:    30            add r0, r0
$21F4:    35            add r1, r1
$21F5:    2A            mov r2, r2
$21F6:    58            mov r2, [r0]
$21F7:    0A            mov r0, sp
$21F8:    00            trap
$21F9:    5F            mov r3, [r3]
$21FA:    5F            mov r3, [r3]
$21FB:    5F            mov r3, [r3]
$21FC:    5F            mov r3, [r3]
$21FD:    5F            mov r3, [r3]
$21FE:    5F            mov r3, [r3]
$21FF:    5F            mov r3, [r3]
$2200:    5F            mov r3, [r3]
$2201:    5F            mov r3, [r3]
$2202:    5F            mov r3, [r3]
$2203:    5F            mov r3, [r3]
$2204:    5F            mov r3, [r3]
$2205:    5F            mov r3, [r3]
$2206:    5F            mov r3, [r3]
$2207:    5F            mov r3, [r3]
$2208:    5F            mov r3, [r3]
$2209:    5F            mov r3, [r3]
$220A:    5F            mov r3, [r3]
$220B:    5F            mov r3, [r3]
$220C:    5F            mov r3, [r3]
$220D:    5F            mov r3, [r3]
$220E:    5F            mov r3, [r3]
$220F:    5F            mov r3, [r3]
$2210:    5F            mov r3, [r3]
$2211:    5F            mov r3, [r3]
$2212:    5F            mov r3, [r3]
$2213:    5F            mov r3, [r3]
$2214:    5F            mov r3, [r3]
$2215:    5F            mov r3, [r3]
$2216:    5F            mov r3, [r3]
$2217:    5F            mov r3, [r3]
$2218:    5F            mov r3, [r3]
$2219:    5F            mov r3, [r3]
$221A:    5F            mov r3, [r3]
$221B:    5F            mov r3, [r3]
$221C:    5F            mov r3, [r3]
$221D:    5F            mov r3, [r3]
$221E:    5F            mov r3, [r3]
$221F:    5F            mov r3, [r3]
$2220:    5F            mov r3, [r3]
$2221:    5F            mov r3, [r3]
$2222:    5F            mov r3, [r3]
$2223:    5F            mov r3, [r3]
$2224:    5F            mov r3, [r3]
$2225:    5F            mov r3, [r3]
$2226:    5F            mov r3, [r3]
$2227:    5F            mov r3, [r3]
$2228:    5F            mov r3, [r3]
$2229:    5F            mov r3, [r3]
$222A:    5F            mov r3, [r3]
$222B:    5F            mov r3, [r3]
$222C:    00            trap
$222D:    55            mov r1, [r1]
$222E:    73            mov [r0], r3
$222F:    65            mov byte ptr [r1], low(r1)
$2230:    72            mov [r0], r2
$2231:    6E            mov byte ptr [r3], low(r2)
$2232:    61            mov byte ptr [r0], low(r1)
$2233:    6D            mov byte ptr [r3], low(r1)
$2234:    65            mov byte ptr [r1], low(r1)
$2235:    3A            add r2, r2
$2236:    20            mov r0, r0
$2237:    00            trap
$2238:    3E            add r3, r2
$2239:    3E            add r3, r2
$223A:    20            mov r0, r0
$223B:    55            mov r1, [r1]
$223C:    73            mov [r0], r3
$223D:    65            mov byte ptr [r1], low(r1)
$223E:    72            mov [r0], r2
$223F:    6E            mov byte ptr [r3], low(r2)
$2240:    61            mov byte ptr [r0], low(r1)
$2241:    6D            mov byte ptr [r3], low(r1)
$2242:    65            mov byte ptr [r1], low(r1)
$2243:    20            mov r0, r0
$2244:    4F            mov r3, byte ptr [r3]
$2245:    4B            mov r2, byte ptr [r3]
$2246:    2E            mov r3, r2
$2247:    20            mov r0, r0
$2248:    50            mov r0, [r0]
$2249:    61            mov byte ptr [r0], low(r1)
$224A:    73            mov [r0], r3
$224B:    73            mov [r0], r3
$224C:    77            mov [r1], r3
$224D:    6F            mov byte ptr [r3], low(r3)
$224E:    72            mov [r0], r2
$224F:    64            mov byte ptr [r1], low(r0)
$2250:    20            mov r0, r0
$2251:    72            mov [r0], r2
$2252:    65            mov byte ptr [r1], low(r1)
$2253:    71            mov [r0], r1
$2254:    75            mov [r1], r1
$2255:    69            mov byte ptr [r2], low(r1)
$2256:    72            mov [r0], r2
$2257:    65            mov byte ptr [r1], low(r1)
$2258:    64            mov byte ptr [r1], low(r0)
$2259:    0A            mov r0, sp
$225A:    50            mov r0, [r0]
$225B:    61            mov byte ptr [r0], low(r1)
$225C:    73            mov [r0], r3
$225D:    73            mov [r0], r3
$225E:    77            mov [r1], r3
$225F:    6F            mov byte ptr [r3], low(r3)
$2260:    72            mov [r0], r2
$2261:    64            mov byte ptr [r1], low(r0)
$2262:    3A            add r2, r2
$2263:    20            mov r0, r0
$2264:    00            trap
$2265:    3E            add r3, r2
$2266:    3E            add r3, r2
$2267:    20            mov r0, r0
$2268:    50            mov r0, [r0]
$2269:    6C            mov byte ptr [r3], low(r0)
$226A:    65            mov byte ptr [r1], low(r1)
$226B:    61            mov byte ptr [r0], low(r1)
$226C:    73            mov [r0], r3
$226D:    65            mov byte ptr [r1], low(r1)
$226E:    20            mov r0, r0
$226F:    77            mov [r1], r3
$2270:    61            mov byte ptr [r0], low(r1)
$2271:    69            mov byte ptr [r2], low(r1)
$2272:    74            mov [r1], r0
$2273:    2E            mov r3, r2
$2274:    2E            mov r3, r2
$2275:    2E            mov r3, r2
$2276:    0A            mov r0, sp
$2277:    00            trap
$2278:    3E            add r3, r2
$2279:    3E            add r3, r2
$227A:    20            mov r0, r0
$227B:    55            mov r1, [r1]
$227C:    73            mov [r0], r3
$227D:    65            mov byte ptr [r1], low(r1)
$227E:    72            mov [r0], r2
$227F:    20            mov r0, r0
$2280:    6E            mov byte ptr [r3], low(r2)
$2281:    6F            mov byte ptr [r3], low(r3)
$2282:    74            mov [r1], r0
$2283:    20            mov r0, r0
$2284:    66            mov byte ptr [r1], low(r2)
$2285:    6F            mov byte ptr [r3], low(r3)
$2286:    75            mov [r1], r1
$2287:    6E            mov byte ptr [r3], low(r2)
$2288:    64            mov byte ptr [r1], low(r0)
$2289:    20            mov r0, r0
$228A:    69            mov byte ptr [r2], low(r1)
$228B:    6E            mov byte ptr [r3], low(r2)
$228C:    20            mov r0, r0
$228D:    64            mov byte ptr [r1], low(r0)
$228E:    61            mov byte ptr [r0], low(r1)
$228F:    74            mov [r1], r0
$2290:    61            mov byte ptr [r0], low(r1)
$2291:    62            mov byte ptr [r0], low(r2)
$2292:    61            mov byte ptr [r0], low(r1)
$2293:    73            mov [r0], r3
$2294:    65            mov byte ptr [r1], low(r1)
$2295:    2E            mov r3, r2
$2296:    0A            mov r0, sp
$2297:    00            trap
$2298:    3E            add r3, r2
$2299:    3E            add r3, r2
$229A:    20            mov r0, r0
$229B:    50            mov r0, [r0]
$229C:    61            mov byte ptr [r0], low(r1)
$229D:    73            mov [r0], r3
$229E:    73            mov [r0], r3
$229F:    77            mov [r1], r3
$22A0:    6F            mov byte ptr [r3], low(r3)
$22A1:    72            mov [r0], r2
$22A2:    64            mov byte ptr [r1], low(r0)
$22A3:    20            mov r0, r0
$22A4:    69            mov byte ptr [r2], low(r1)
$22A5:    73            mov [r0], r3
$22A6:    20            mov r0, r0
$22A7:    69            mov byte ptr [r2], low(r1)
$22A8:    6E            mov byte ptr [r3], low(r2)
$22A9:    63            mov byte ptr [r0], low(r3)
$22AA:    6F            mov byte ptr [r3], low(r3)
$22AB:    72            mov [r0], r2
$22AC:    72            mov [r0], r2
$22AD:    65            mov byte ptr [r1], low(r1)
$22AE:    63            mov byte ptr [r0], low(r3)
$22AF:    74            mov [r1], r0
$22B0:    2E            mov r3, r2
$22B1:    0A            mov r0, sp
$22B2:    00            trap
$22B3:    3E            add r3, r2
$22B4:    3E            add r3, r2
$22B5:    20            mov r0, r0
$22B6:    4C            mov r3, byte ptr [r0]
$22B7:    6F            mov byte ptr [r3], low(r3)
$22B8:    67            mov byte ptr [r1], low(r3)
$22B9:    69            mov byte ptr [r2], low(r1)
$22BA:    6E            mov byte ptr [r3], low(r2)
$22BB:    20            mov r0, r0
$22BC:    73            mov [r0], r3
$22BD:    75            mov [r1], r1
$22BE:    63            mov byte ptr [r0], low(r3)
$22BF:    63            mov byte ptr [r0], low(r3)
$22C0:    65            mov byte ptr [r1], low(r1)
$22C1:    73            mov [r0], r3
$22C2:    73            mov [r0], r3
$22C3:    66            mov byte ptr [r1], low(r2)
$22C4:    75            mov [r1], r1
$22C5:    6C            mov byte ptr [r3], low(r0)
$22C6:    2E            mov r3, r2
$22C7:    0A            mov r0, sp
$22C8:    3D            add r3, r1
$22C9:    3D            add r3, r1
$22CA:    3D            add r3, r1
$22CB:    3D            add r3, r1
$22CC:    3D            add r3, r1
$22CD:    3D            add r3, r1
$22CE:    3D            add r3, r1
$22CF:    3D            add r3, r1
$22D0:    3D            add r3, r1
$22D1:    3D            add r3, r1
$22D2:    3D            add r3, r1
$22D3:    3D            add r3, r1
$22D4:    3D            add r3, r1
$22D5:    3D            add r3, r1
$22D6:    3D            add r3, r1
$22D7:    3D            add r3, r1
$22D8:    3D            add r3, r1
$22D9:    3D            add r3, r1
$22DA:    3D            add r3, r1
$22DB:    3D            add r3, r1
$22DC:    3D            add r3, r1
$22DD:    3D            add r3, r1
$22DE:    3D            add r3, r1
$22DF:    3D            add r3, r1
$22E0:    3D            add r3, r1
$22E1:    3D            add r3, r1
$22E2:    3D            add r3, r1
$22E3:    3D            add r3, r1
$22E4:    3D            add r3, r1
$22E5:    3D            add r3, r1
$22E6:    3D            add r3, r1
$22E7:    3D            add r3, r1
$22E8:    3D            add r3, r1
$22E9:    3D            add r3, r1
$22EA:    3D            add r3, r1
$22EB:    3D            add r3, r1
$22EC:    3D            add r3, r1
$22ED:    3D            add r3, r1
$22EE:    3D            add r3, r1
$22EF:    3D            add r3, r1
$22F0:    3D            add r3, r1
$22F1:    3D            add r3, r1
$22F2:    3D            add r3, r1
$22F3:    3D            add r3, r1
$22F4:    3D            add r3, r1
$22F5:    3D            add r3, r1
$22F6:    3D            add r3, r1
$22F7:    3D            add r3, r1
$22F8:    3D            add r3, r1
$22F9:    3D            add r3, r1
$22FA:    3D            add r3, r1
$22FB:    3D            add r3, r1
$22FC:    3D            add r3, r1
$22FD:    3D            add r3, r1
$22FE:    3D            add r3, r1
$22FF:    3D            add r3, r1
$2300:    3D            add r3, r1
$2301:    3D            add r3, r1
$2302:    3D            add r3, r1
$2303:    3D            add r3, r1
$2304:    3D            add r3, r1
$2305:    3D            add r3, r1
$2306:    3D            add r3, r1
$2307:    3D            add r3, r1
$2308:    3D            add r3, r1
$2309:    3D            add r3, r1
$230A:    3D            add r3, r1
$230B:    3D            add r3, r1
$230C:    3D            add r3, r1
$230D:    3D            add r3, r1
$230E:    0A            mov r0, sp
$230F:    52            mov r0, [r2]
$2310:    75            mov [r1], r1
$2311:    6E            mov byte ptr [r3], low(r2)
$2312:    6E            mov byte ptr [r3], low(r2)
$2313:    69            mov byte ptr [r2], low(r1)
$2314:    6E            mov byte ptr [r3], low(r2)
$2315:    67            mov byte ptr [r1], low(r3)
$2316:    20            mov r0, r0
$2317:    6D            mov byte ptr [r3], low(r1)
$2318:    61            mov byte ptr [r0], low(r1)
$2319:    63            mov byte ptr [r0], low(r3)
$231A:    68            mov byte ptr [r2], low(r0)
$231B:    69            mov byte ptr [r2], low(r1)
$231C:    6E            mov byte ptr [r3], low(r2)
$231D:    65            mov byte ptr [r1], low(r1)
$231E:    20            mov r0, r0
$231F:    6C            mov byte ptr [r3], low(r0)
$2320:    61            mov byte ptr [r0], low(r1)
$2321:    6E            mov byte ptr [r3], low(r2)
$2322:    67            mov byte ptr [r1], low(r3)
$2323:    75            mov [r1], r1
$2324:    61            mov byte ptr [r0], low(r1)
$2325:    67            mov byte ptr [r1], low(r3)
$2326:    65            mov byte ptr [r1], low(r1)
$2327:    20            mov r0, r0
$2328:    6D            mov byte ptr [r3], low(r1)
$2329:    6F            mov byte ptr [r3], low(r3)
$232A:    6E            mov byte ptr [r3], low(r2)
$232B:    69            mov byte ptr [r2], low(r1)
$232C:    74            mov [r1], r0
$232D:    6F            mov byte ptr [r3], low(r3)
$232E:    72            mov [r0], r2
$232F:    20            mov r0, r0
$2330:    6E            mov byte ptr [r3], low(r2)
$2331:    6F            mov byte ptr [r3], low(r3)
$2332:    77            mov [r1], r3
$2333:    2E            mov r3, r2
$2334:    0A            mov r0, sp
$2335:    3D            add r3, r1
$2336:    3D            add r3, r1
$2337:    3D            add r3, r1
$2338:    3D            add r3, r1
$2339:    3D            add r3, r1
$233A:    3D            add r3, r1
$233B:    3D            add r3, r1
$233C:    3D            add r3, r1
$233D:    3D            add r3, r1
$233E:    3D            add r3, r1
$233F:    3D            add r3, r1
$2340:    3D            add r3, r1
$2341:    3D            add r3, r1
$2342:    3D            add r3, r1
$2343:    3D            add r3, r1
$2344:    3D            add r3, r1
$2345:    3D            add r3, r1
$2346:    3D            add r3, r1
$2347:    3D            add r3, r1
$2348:    3D            add r3, r1
$2349:    3D            add r3, r1
$234A:    3D            add r3, r1
$234B:    3D            add r3, r1
$234C:    3D            add r3, r1
$234D:    3D            add r3, r1
$234E:    3D            add r3, r1
$234F:    3D            add r3, r1
$2350:    3D            add r3, r1
$2351:    3D            add r3, r1
$2352:    3D            add r3, r1
$2353:    3D            add r3, r1
$2354:    3D            add r3, r1
$2355:    3D            add r3, r1
$2356:    3D            add r3, r1
$2357:    3D            add r3, r1
$2358:    3D            add r3, r1
$2359:    3D            add r3, r1
$235A:    3D            add r3, r1
$235B:    3D            add r3, r1
$235C:    3D            add r3, r1
$235D:    3D            add r3, r1
$235E:    3D            add r3, r1
$235F:    3D            add r3, r1
$2360:    3D            add r3, r1
$2361:    3D            add r3, r1
$2362:    3D            add r3, r1
$2363:    3D            add r3, r1
$2364:    3D            add r3, r1
$2365:    3D            add r3, r1
$2366:    3D            add r3, r1
$2367:    3D            add r3, r1
$2368:    3D            add r3, r1
$2369:    3D            add r3, r1
$236A:    3D            add r3, r1
$236B:    3D            add r3, r1
$236C:    3D            add r3, r1
$236D:    3D            add r3, r1
$236E:    3D            add r3, r1
$236F:    3D            add r3, r1
$2370:    3D            add r3, r1
$2371:    3D            add r3, r1
$2372:    3D            add r3, r1
$2373:    3D            add r3, r1
$2374:    3D            add r3, r1
$2375:    3D            add r3, r1
$2376:    3D            add r3, r1
$2377:    3D            add r3, r1
$2378:    3D            add r3, r1
$2379:    3D            add r3, r1
$237A:    3D            add r3, r1
$237B:    0A            mov r0, sp
$237C:    0A            mov r0, sp
$237D:    00            trap
$237E:    A6            push sp
$237F:    BC B6 FB      mov [$FBB6], r0
$2382:    BD B8 FB      mov [$FBB8], r0
$2385:    BE BA FB      mov [$FBBA], r0
$2388:    BF BC FB      mov [$FBBC], r0
$238B:    94            pop r0
$238C:    BC BE FB      mov [$FBBE], r0
$238F:    0A            mov r0, sp
$2390:    50            mov r0, [r0]
$2391:    E0 FF FF      add r0, $FFFF
$2394:    BC C0 FB      mov [$FBC0], r0
$2397:    11 0C 00      mov r1, $000C
$239A:    12 C2 FB      mov r2, $FBC2
$239D:    B7 BE FB      mov r3, [$FBBE]
$23A0:    99 28 00      call $0028    # <MemCpy>
$23A3:    12 1C FB      mov r2, $FB1C
$23A6:    99 08 00      call $0008    # <PrintStr>
$23A9:    10 00 00      mov r0, $0000
$23AC:    B8 02 E0      mov byte ptr [$E002], low(r0)
$23AF:    12 12 FB      mov r2, $FB12
$23B2:    99 08 00      call $0008    # <PrintStr>
$23B5:    12 00 E0      mov r2, $E000
$23B8:    13 08 00      mov r3, $0008
$23BB:    99 30 00      call $0030    # <ReadStr>
$23BE:    A5 00 00      cmp r3, $0000
$23C1:    9C 39 F4      je $F439
$23C4:    12 00 E0      mov r2, $E000
$23C7:    99 38 00      call $0038    # <StrTrim>
$23CA:    B0 02 E0      mov r0, byte ptr [$E002]
$23CD:    A2 00 00      cmp r0, $0000
$23D0:    9D 30 F4      jne $F430
$23D3:    B4 00 E0      mov r0, [$E000]
$23D6:    A2 68 0A      cmp r0, $0A68
$23D9:    9C 42 F4      je $F442
$23DC:    A2 68 00      cmp r0, $0068
$23DF:    9C 42 F4      je $F442
$23E2:    A2 72 00      cmp r0, $0072
$23E5:    9C 4B F4      je $F44B
$23E8:    A2 72 0A      cmp r0, $0A72
$23EB:    9C 4B F4      je $F44B
$23EE:    A2 70 00      cmp r0, $0070
$23F1:    9C 4A F5      je $F54A
$23F4:    A2 70 0A      cmp r0, $0A70
$23F7:    9C 4A F5      je $F54A
$23FA:    A2 78 00      cmp r0, $0078
$23FD:    9C 66 F5      je $F566
$2400:    A2 78 0A      cmp r0, $0A78
$2403:    9C 66 F5      je $F566
$2406:    A2 63 00      cmp r0, $0063
$2409:    9C AC F5      je $F5AC
$240C:    A2 63 0A      cmp r0, $0A63
$240F:    9C AC F5      je $F5AC
$2412:    A2 55 43      cmp r0, $4355
$2415:    9C 00 F6      je $F600
$2418:    A2 6C 73      cmp r0, $736C
$241B:    9C BF F5      je $F5BF
$241E:    A2 72 66      cmp r0, $6672
$2421:    9C 09 F6      je $F609
$2424:    A2 77 00      cmp r0, $0077
$2427:    9C BB F4      je $F4BB
$242A:    A2 77 0A      cmp r0, $0A77
$242D:    9C BB F4      je $F4BB
$2430:    12 B5 F7      mov r2, $F7B5
$2433:    99 08 00      call $0008    # <PrintStr>
$2436:    98 A9 F3      jmp $F3A9    # <None>
$2439:    12 9C F7      mov r2, $F79C
$243C:    99 08 00      call $0008    # <PrintStr>
$243F:    98 A9 F3      jmp $F3A9    # <None>
$2442:    12 24 F9      mov r2, $F924
$2445:    99 08 00      call $0008    # <PrintStr>
$2448:    98 A9 F3      jmp $F3A9    # <None>
$244B:    12 F0 F7      mov r2, $F7F0
$244E:    99 08 00      call $0008    # <PrintStr>
$2451:    12 00 E0      mov r2, $E000
$2454:    13 08 00      mov r3, $0008
$2457:    99 30 00      call $0030    # <ReadStr>
$245A:    12 00 E0      mov r2, $E000
$245D:    99 20 00      call $0020    # <ConvertHex>
$2460:    A2 FF FF      cmp r0, $FFFF
$2463:    9C B2 F4      je $F4B2
$2466:    90            push r0
$2467:    12 02 F8      mov r2, $F802
$246A:    99 08 00      call $0008    # <PrintStr>
$246D:    12 00 E0      mov r2, $E000
$2470:    13 08 00      mov r3, $0008
$2473:    99 30 00      call $0030    # <ReadStr>
$2476:    12 00 E0      mov r2, $E000
$2479:    99 20 00      call $0020    # <ConvertHex>
$247C:    A2 FF FF      cmp r0, $FFFF
$247F:    9C B2 F4      je $F4B2
$2482:    A2 00 00      cmp r0, $0000
$2485:    9C B2 F4      je $F4B2
$2488:    2C            mov r3, r0
$2489:    96            pop r2
$248A:    92            push r2
$248B:    93            push r3
$248C:    11 08 00      mov r1, $0008
$248F:    2E            mov r3, r2
$2490:    12 CE FB      mov r2, $FBCE
$2493:    99 28 00      call $0028    # <MemCpy>
$2496:    97            pop r3
$2497:    96            pop r2
$2498:    BE D6 FB      mov [$FBD6], r0
$249B:    92            push r2
$249C:    93            push r3
$249D:    12 8F FB      mov r2, $FB8F
$24A0:    99 08 00      call $0008    # <PrintStr>
$24A3:    97            pop r3
$24A4:    96            pop r2
$24A5:    E2 08 00      add r2, $0008
$24A8:    AF            dec r3
$24A9:    A5 00 00      cmp r3, $0000
$24AC:    9D 8A F4      jne $F48A
$24AF:    98 A9 F3      jmp $F3A9    # <None>
$24B2:    12 D8 F7      mov r2, $F7D8
$24B5:    99 08 00      call $0008    # <PrintStr>
$24B8:    98 A9 F3      jmp $F3A9    # <None>
$24BB:    12 F0 F7      mov r2, $F7F0
$24BE:    99 08 00      call $0008    # <PrintStr>
$24C1:    12 00 E0      mov r2, $E000
$24C4:    13 08 00      mov r3, $0008
$24C7:    99 30 00      call $0030    # <ReadStr>
$24CA:    12 00 E0      mov r2, $E000
$24CD:    99 20 00      call $0020    # <ConvertHex>
$24D0:    A2 FF FF      cmp r0, $FFFF
$24D3:    9C 41 F5      je $F541
$24D6:    BC D6 FB      mov [$FBD6], r0
$24D9:    12 B0 F8      mov r2, $F8B0
$24DC:    99 08 00      call $0008    # <PrintStr>
$24DF:    13 02 E0      mov r3, $E002
$24E2:    10 00 00      mov r0, $0000
$24E5:    6C            mov byte ptr [r3], low(r0)
$24E6:    AF            dec r3
$24E7:    6C            mov byte ptr [r3], low(r0)
$24E8:    AF            dec r3
$24E9:    06 02         swi 2
$24EB:    6C            mov byte ptr [r3], low(r0)
$24EC:    2B            mov r2, r3
$24ED:    A2 2E 00      cmp r0, $002E
$24F0:    9C 30 F5      je $F530
$24F3:    A2 0A 00      cmp r0, $000A
$24F6:    9C E9 F4      je $F4E9
$24F9:    93            push r3
$24FA:    99 20 00      call $0020    # <ConvertHex>
$24FD:    97            pop r3
$24FE:    A2 FF FF      cmp r0, $FFFF
$2501:    9C E9 F4      je $F4E9
$2504:    AB            inc r3
$2505:    06 02         swi 2
$2507:    6C            mov byte ptr [r3], low(r0)
$2508:    2B            mov r2, r3
$2509:    A2 2E 00      cmp r0, $002E
$250C:    9C 30 F5      je $F530
$250F:    A2 0A 00      cmp r0, $000A
$2512:    9C 05 F5      je $F505
$2515:    93            push r3
$2516:    99 20 00      call $0020    # <ConvertHex>
$2519:    97            pop r3
$251A:    A2 FF FF      cmp r0, $FFFF
$251D:    9C 05 F5      je $F505
$2520:    AF            dec r3
$2521:    2B            mov r2, r3
$2522:    99 20 00      call $0020    # <ConvertHex>
$2525:    B5 D6 FB      mov r1, [$FBD6]
$2528:    64            mov byte ptr [r1], low(r0)
$2529:    A9            inc r1
$252A:    BD D6 FB      mov [$FBD6], r0
$252D:    98 DF F4      jmp $F4DF    # <None>
$2530:    06 02         swi 2
$2532:    A2 0A 00      cmp r0, $000A
$2535:    9D 30 F5      jne $F530
$2538:    12 62 F8      mov r2, $F862
$253B:    99 08 00      call $0008    # <PrintStr>
$253E:    98 A9 F3      jmp $F3A9    # <None>
$2541:    12 D8 F7      mov r2, $F7D8
$2544:    99 08 00      call $0008    # <PrintStr>
$2547:    98 A9 F3      jmp $F3A9    # <None>
$254A:    12 F0 F7      mov r2, $F7F0
$254D:    99 08 00      call $0008    # <PrintStr>
$2550:    12 00 E0      mov r2, $E000
$2553:    13 08 00      mov r3, $0008
$2556:    99 30 00      call $0030    # <ReadStr>
$2559:    12 00 E0      mov r2, $E000
$255C:    99 20 00      call $0020    # <ConvertHex>
$255F:    28            mov r2, r0
$2560:    99 08 00      call $0008    # <PrintStr>
$2563:    98 A9 F3      jmp $F3A9    # <None>
$2566:    12 F0 F7      mov r2, $F7F0
$2569:    99 08 00      call $0008    # <PrintStr>
$256C:    12 00 E0      mov r2, $E000
$256F:    13 08 00      mov r3, $0008
$2572:    99 30 00      call $0030    # <ReadStr>
$2575:    12 00 E0      mov r2, $E000
$2578:    99 20 00      call $0020    # <ConvertHex>
$257B:    90            push r0
$257C:    BC D6 FB      mov [$FBD6], r0
$257F:    12 15 F8      mov r2, $F815
$2582:    99 08 00      call $0008    # <PrintStr>
$2585:    12 00 E0      mov r2, $E000
$2588:    13 08 00      mov r3, $0008
$258B:    99 30 00      call $0030    # <ReadStr>
$258E:    B0 00 E0      mov r0, byte ptr [$E000]
$2591:    A2 59 00      cmp r0, $0059
$2594:    9C A7 F5      je $F5A7
$2597:    A2 79 00      cmp r0, $0079
$259A:    9C A7 F5      je $F5A7
$259D:    12 3A F8      mov r2, $F83A
$25A0:    99 08 00      call $0008    # <PrintStr>
$25A3:    94            pop r0
$25A4:    98 A9 F3      jmp $F3A9    # <None>
$25A7:    97            pop r3
$25A8:    CC            call r3
$25A9:    98 A9 F3      jmp $F3A9    # <None>
$25AC:    12 55 F8      mov r2, $F855
$25AF:    99 08 00      call $0008    # <PrintStr>
$25B2:    B4 B6 FB      mov r0, [$FBB6]
$25B5:    B5 B8 FB      mov r1, [$FBB8]
$25B8:    B6 BA FB      mov r2, [$FBBA]
$25BB:    B7 BC FB      mov r3, [$FBBC]
$25BE:    05            ret
$25BF:    12 DD FA      mov r2, $FADD
$25C2:    99 08 00      call $0008    # <PrintStr>
$25C5:    10 00 00      mov r0, $0000
$25C8:    11 00 E0      mov r1, $E000
$25CB:    06 04         swi 4
$25CD:    13 00 E0      mov r3, $E000
$25D0:    43            mov r0, byte ptr [r3]
$25D1:    A2 00 00      cmp r0, $0000
$25D4:    9C F4 F5      je $F5F4
$25D7:    93            push r3
$25D8:    B8 CE FB      mov byte ptr [$FBCE], low(r0)
$25DB:    AB            inc r3
$25DC:    53            mov r0, [r3]
$25DD:    93            push r3
$25DE:    BC D6 FB      mov [$FBD6], r0
$25E1:    12 06 FB      mov r2, $FB06
$25E4:    99 08 00      call $0008    # <PrintStr>
$25E7:    97            pop r3
$25E8:    AB            inc r3
$25E9:    AB            inc r3
$25EA:    2B            mov r2, r3
$25EB:    99 08 00      call $0008    # <PrintStr>
$25EE:    10 0A 00      mov r0, $000A
$25F1:    06 01         swi 1
$25F3:    97            pop r3
$25F4:    E3 10 00      add r3, $0010
$25F7:    A5 00 EF      cmp r3, $EF00
$25FA:    9D D0 F5      jne $F5D0
$25FD:    98 A9 F3      jmp $F3A9    # <None>
$2600:    12 DF F8      mov r2, $F8DF
$2603:    99 08 00      call $0008    # <PrintStr>
$2606:    98 A9 F3      jmp $F3A9    # <None>
$2609:    12 8A F8      mov r2, $F88A
$260C:    99 08 00      call $0008    # <PrintStr>
$260F:    10 00 00      mov r0, $0000
$2612:    11 00 E0      mov r1, $E000
$2615:    06 04         swi 4
$2617:    12 B0 EF      mov r2, $EFB0
$261A:    13 10 00      mov r3, $0010
$261D:    99 30 00      call $0030    # <ReadStr>
$2620:    A5 00 00      cmp r3, $0000
$2623:    9C 8A F6      je $F68A
$2626:    12 B0 EF      mov r2, $EFB0
$2629:    99 38 00      call $0038    # <StrTrim>
$262C:    13 03 E0      mov r3, $E003
$262F:    12 B0 EF      mov r2, $EFB0
$2632:    93            push r3
$2633:    99 10 00      call $0010    # <StrCmp>
$2636:    97            pop r3
$2637:    A2 00 00      cmp r0, $0000
$263A:    9C 49 F6      je $F649
$263D:    E3 10 00      add r3, $0010
$2640:    A5 03 EF      cmp r3, $EF03
$2643:    9C 81 F6      je $F681
$2646:    98 2F F6      jmp $F62F    # <None>
$2649:    AF            dec r3
$264A:    AF            dec r3
$264B:    AF            dec r3
$264C:    43            mov r0, byte ptr [r3]
$264D:    AB            inc r3
$264E:    57            mov r1, [r3]
$264F:    91            push r1
$2650:    11 00 E0      mov r1, $E000
$2653:    06 04         swi 4
$2655:    12 F0 F7      mov r2, $F7F0
$2658:    99 08 00      call $0008    # <PrintStr>
$265B:    12 E0 EF      mov r2, $EFE0
$265E:    13 10 00      mov r3, $0010
$2661:    99 30 00      call $0030    # <ReadStr>
$2664:    12 E0 EF      mov r2, $EFE0
$2667:    99 20 00      call $0020    # <ConvertHex>
$266A:    95            pop r1
$266B:    A2 FF FF      cmp r0, $FFFF
$266E:    9C 93 F6      je $F693
$2671:    28            mov r2, r0
$2672:    13 00 E0      mov r3, $E000
$2675:    99 28 00      call $0028    # <MemCpy>
$2678:    12 62 F8      mov r2, $F862
$267B:    99 08 00      call $0008    # <PrintStr>
$267E:    98 A9 F3      jmp $F3A9    # <None>
$2681:    12 97 F8      mov r2, $F897
$2684:    99 08 00      call $0008    # <PrintStr>
$2687:    98 A9 F3      jmp $F3A9    # <None>
$268A:    12 9C F7      mov r2, $F79C
$268D:    99 08 00      call $0008    # <PrintStr>
$2690:    98 A9 F3      jmp $F3A9    # <None>
$2693:    12 D8 F7      mov r2, $F7D8
$2696:    99 08 00      call $0008    # <PrintStr>
$2699:    98 A9 F3      jmp $F3A9    # <None>
$269C:    3D            add r3, r1
$269D:    3D            add r3, r1
$269E:    3D            add r3, r1
$269F:    3D            add r3, r1
$26A0:    3D            add r3, r1
$26A1:    3D            add r3, r1
$26A2:    3D            add r3, r1
$26A3:    3D            add r3, r1
$26A4:    3D            add r3, r1
$26A5:    3D            add r3, r1
$26A6:    3D            add r3, r1
$26A7:    3D            add r3, r1
$26A8:    3D            add r3, r1
$26A9:    3D            add r3, r1
$26AA:    3D            add r3, r1
$26AB:    3D            add r3, r1
$26AC:    3D            add r3, r1
$26AD:    3D            add r3, r1
$26AE:    3D            add r3, r1
$26AF:    3D            add r3, r1
$26B0:    3D            add r3, r1
$26B1:    3D            add r3, r1
$26B2:    3D            add r3, r1
$26B3:    3D            add r3, r1
$26B4:    3D            add r3, r1
$26B5:    3D            add r3, r1
$26B6:    3D            add r3, r1
$26B7:    3D            add r3, r1
$26B8:    3D            add r3, r1
$26B9:    3D            add r3, r1
$26BA:    3D            add r3, r1
$26BB:    3D            add r3, r1
$26BC:    3D            add r3, r1
$26BD:    3D            add r3, r1
$26BE:    3D            add r3, r1
$26BF:    3D            add r3, r1
$26C0:    3D            add r3, r1
$26C1:    3D            add r3, r1
$26C2:    3D            add r3, r1
$26C3:    3D            add r3, r1
$26C4:    3D            add r3, r1
$26C5:    3D            add r3, r1
$26C6:    3D            add r3, r1
$26C7:    3D            add r3, r1
$26C8:    3D            add r3, r1
$26C9:    3D            add r3, r1
$26CA:    3D            add r3, r1
$26CB:    3D            add r3, r1
$26CC:    3D            add r3, r1
$26CD:    3D            add r3, r1
$26CE:    3D            add r3, r1
$26CF:    3D            add r3, r1
$26D0:    3D            add r3, r1
$26D1:    3D            add r3, r1
$26D2:    3D            add r3, r1
$26D3:    3D            add r3, r1
$26D4:    3D            add r3, r1
$26D5:    3D            add r3, r1
$26D6:    3D            add r3, r1
$26D7:    3D            add r3, r1
$26D8:    3D            add r3, r1
$26D9:    3D            add r3, r1
$26DA:    3D            add r3, r1
$26DB:    3D            add r3, r1
$26DC:    3D            add r3, r1
$26DD:    3D            add r3, r1
$26DE:    3D            add r3, r1
$26DF:    3D            add r3, r1
$26E0:    3D            add r3, r1
$26E1:    3D            add r3, r1
$26E2:    0D             === ILLEGAL OPCODE ===
$26E3:    0A            mov r0, sp
$26E4:    57            mov r1, [r3]
$26E5:    65            mov byte ptr [r1], low(r1)
$26E6:    6C            mov byte ptr [r3], low(r0)
$26E7:    63            mov byte ptr [r0], low(r3)
$26E8:    6F            mov byte ptr [r3], low(r3)
$26E9:    6D            mov byte ptr [r3], low(r1)
$26EA:    65            mov byte ptr [r1], low(r1)
$26EB:    20            mov r0, r0
$26EC:    74            mov [r1], r0
$26ED:    6F            mov byte ptr [r3], low(r3)
$26EE:    20            mov r0, r0
$26EF:    47            mov r1, byte ptr [r3]
$26F0:    6C            mov byte ptr [r3], low(r0)
$26F1:    69            mov byte ptr [r2], low(r1)
$26F2:    74            mov [r1], r0
$26F3:    63            mov byte ptr [r0], low(r3)
$26F4:    68            mov byte ptr [r2], low(r0)
$26F5:    20            mov r0, r0
$26F6:    52            mov r0, [r2]
$26F7:    65            mov byte ptr [r1], low(r1)
$26F8:    73            mov [r0], r3
$26F9:    65            mov byte ptr [r1], low(r1)
$26FA:    61            mov byte ptr [r0], low(r1)
$26FB:    72            mov [r0], r2
$26FC:    63            mov byte ptr [r0], low(r3)
$26FD:    68            mov byte ptr [r2], low(r0)
$26FE:    20            mov r0, r0
$26FF:    4C            mov r3, byte ptr [r0]
$2700:    61            mov byte ptr [r0], low(r1)
$2701:    62            mov byte ptr [r0], low(r2)
$2702:    6F            mov byte ptr [r3], low(r3)
$2703:    72            mov [r0], r2
$2704:    61            mov byte ptr [r0], low(r1)
$2705:    74            mov [r1], r0
$2706:    6F            mov byte ptr [r3], low(r3)
$2707:    72            mov [r0], r2
$2708:    79            mov [r2], r1
$2709:    20            mov r0, r0
$270A:    4E            mov r3, byte ptr [r2]
$270B:    65            mov byte ptr [r1], low(r1)
$270C:    74            mov [r1], r0
$270D:    77            mov [r1], r3
$270E:    6F            mov byte ptr [r3], low(r3)
$270F:    72            mov [r0], r2
$2710:    6B            mov byte ptr [r2], low(r3)
$2711:    3A            add r2, r2
$2712:    20            mov r0, r0
$2713:    54            mov r1, [r0]
$2714:    65            mov byte ptr [r1], low(r1)
$2715:    73            mov [r0], r3
$2716:    74            mov [r1], r0
$2717:    20            mov r0, r0
$2718:    53            mov r0, [r3]
$2719:    65            mov byte ptr [r1], low(r1)
$271A:    72            mov [r0], r2
$271B:    76            mov [r1], r2
$271C:    65            mov byte ptr [r1], low(r1)
$271D:    72            mov [r0], r2
$271E:    20            mov r0, r0
$271F:    32            add r0, r2
$2720:    20            mov r0, r0
$2721:    28            mov r2, r0
$2722:    47            mov r1, byte ptr [r3]
$2723:    52            mov r0, [r2]
$2724:    4C            mov r3, byte ptr [r0]
$2725:    54            mov r1, [r0]
$2726:    53            mov r0, [r3]
$2727:    30            add r0, r0
$2728:    31            add r0, r1
$2729:    29            mov r2, r1
$272A:    0D             === ILLEGAL OPCODE ===
$272B:    0A            mov r0, sp
$272C:    3D            add r3, r1
$272D:    3D            add r3, r1
$272E:    3D            add r3, r1
$272F:    3D            add r3, r1
$2730:    3D            add r3, r1
$2731:    3D            add r3, r1
$2732:    3D            add r3, r1
$2733:    3D            add r3, r1
$2734:    3D            add r3, r1
$2735:    3D            add r3, r1
$2736:    3D            add r3, r1
$2737:    3D            add r3, r1
$2738:    3D            add r3, r1
$2739:    3D            add r3, r1
$273A:    3D            add r3, r1
$273B:    3D            add r3, r1
$273C:    3D            add r3, r1
$273D:    3D            add r3, r1
$273E:    3D            add r3, r1
$273F:    3D            add r3, r1
$2740:    3D            add r3, r1
$2741:    3D            add r3, r1
$2742:    3D            add r3, r1
$2743:    3D            add r3, r1
$2744:    3D            add r3, r1
$2745:    3D            add r3, r1
$2746:    3D            add r3, r1
$2747:    3D            add r3, r1
$2748:    3D            add r3, r1
$2749:    3D            add r3, r1
$274A:    3D            add r3, r1
$274B:    3D            add r3, r1
$274C:    3D            add r3, r1
$274D:    3D            add r3, r1
$274E:    3D            add r3, r1
$274F:    3D            add r3, r1
$2750:    3D            add r3, r1
$2751:    3D            add r3, r1
$2752:    3D            add r3, r1
$2753:    3D            add r3, r1
$2754:    3D            add r3, r1
$2755:    3D            add r3, r1
$2756:    3D            add r3, r1
$2757:    3D            add r3, r1
$2758:    3D            add r3, r1
$2759:    3D            add r3, r1
$275A:    3D            add r3, r1
$275B:    3D            add r3, r1
$275C:    3D            add r3, r1
$275D:    3D            add r3, r1
$275E:    3D            add r3, r1
$275F:    3D            add r3, r1
$2760:    3D            add r3, r1
$2761:    3D            add r3, r1
$2762:    3D            add r3, r1
$2763:    3D            add r3, r1
$2764:    3D            add r3, r1
$2765:    3D            add r3, r1
$2766:    3D            add r3, r1
$2767:    3D            add r3, r1
$2768:    3D            add r3, r1
$2769:    3D            add r3, r1
$276A:    3D            add r3, r1
$276B:    3D            add r3, r1
$276C:    3D            add r3, r1
$276D:    3D            add r3, r1
$276E:    3D            add r3, r1
$276F:    3D            add r3, r1
$2770:    3D            add r3, r1
$2771:    3D            add r3, r1
$2772:    0D             === ILLEGAL OPCODE ===
$2773:    0A            mov r0, sp
$2774:    54            mov r1, [r0]
$2775:    68            mov byte ptr [r2], low(r0)
$2776:    69            mov byte ptr [r2], low(r1)
$2777:    73            mov [r0], r3
$2778:    20            mov r0, r0
$2779:    6D            mov byte ptr [r3], low(r1)
$277A:    61            mov byte ptr [r0], low(r1)
$277B:    63            mov byte ptr [r0], low(r3)
$277C:    68            mov byte ptr [r2], low(r0)
$277D:    69            mov byte ptr [r2], low(r1)
$277E:    6E            mov byte ptr [r3], low(r2)
$277F:    65            mov byte ptr [r1], low(r1)
$2780:    20            mov r0, r0
$2781:    72            mov [r0], r2
$2782:    65            mov byte ptr [r1], low(r1)
$2783:    71            mov [r0], r1
$2784:    75            mov [r1], r1
$2785:    69            mov byte ptr [r2], low(r1)
$2786:    72            mov [r0], r2
$2787:    65            mov byte ptr [r1], low(r1)
$2788:    73            mov [r0], r3
$2789:    20            mov r0, r0
$278A:    61            mov byte ptr [r0], low(r1)
$278B:    75            mov [r1], r1
$278C:    74            mov [r1], r0
$278D:    68            mov byte ptr [r2], low(r0)
$278E:    65            mov byte ptr [r1], low(r1)
$278F:    6E            mov byte ptr [r3], low(r2)
$2790:    74            mov [r1], r0
$2791:    69            mov byte ptr [r2], low(r1)
$2792:    63            mov byte ptr [r0], low(r3)
$2793:    61            mov byte ptr [r0], low(r1)
$2794:    74            mov [r1], r0
$2795:    69            mov byte ptr [r2], low(r1)
$2796:    6F            mov byte ptr [r3], low(r3)
$2797:    6E            mov byte ptr [r3], low(r2)
$2798:    2E            mov r3, r2
$2799:    0D             === ILLEGAL OPCODE ===
$279A:    0A            mov r0, sp
$279B:    00            trap
$279C:    21            mov r0, r1
$279D:    20            mov r0, r0
$279E:    49            mov r2, byte ptr [r1]
$279F:    6E            mov byte ptr [r3], low(r2)
$27A0:    70            mov [r0], r0
$27A1:    75            mov [r1], r1
$27A2:    74            mov [r1], r0
$27A3:    20            mov r0, r0
$27A4:    74            mov [r1], r0
$27A5:    6F            mov byte ptr [r3], low(r3)
$27A6:    6F            mov byte ptr [r3], low(r3)
$27A7:    20            mov r0, r0
$27A8:    6C            mov byte ptr [r3], low(r0)
$27A9:    6F            mov byte ptr [r3], low(r3)
$27AA:    6E            mov byte ptr [r3], low(r2)
$27AB:    67            mov byte ptr [r1], low(r3)
$27AC:    20            mov r0, r0
$27AD:    65            mov byte ptr [r1], low(r1)
$27AE:    72            mov [r0], r2
$27AF:    72            mov [r0], r2
$27B0:    6F            mov byte ptr [r3], low(r3)
$27B1:    72            mov [r0], r2
$27B2:    2E            mov r3, r2
$27B3:    0A            mov r0, sp
$27B4:    00            trap
$27B5:    21            mov r0, r1
$27B6:    20            mov r0, r0
$27B7:    42            mov r0, byte ptr [r2]
$27B8:    61            mov byte ptr [r0], low(r1)
$27B9:    64            mov byte ptr [r1], low(r0)
$27BA:    20            mov r0, r0
$27BB:    63            mov byte ptr [r0], low(r3)
$27BC:    6F            mov byte ptr [r3], low(r3)
$27BD:    6D            mov byte ptr [r3], low(r1)
$27BE:    6D            mov byte ptr [r3], low(r1)
$27BF:    61            mov byte ptr [r0], low(r1)
$27C0:    6E            mov byte ptr [r3], low(r2)
$27C1:    64            mov byte ptr [r1], low(r0)
$27C2:    20            mov r0, r0
$27C3:    65            mov byte ptr [r1], low(r1)
$27C4:    72            mov [r0], r2
$27C5:    72            mov [r0], r2
$27C6:    6F            mov byte ptr [r3], low(r3)
$27C7:    72            mov [r0], r2
$27C8:    20            mov r0, r0
$27C9:    28            mov r2, r0
$27CA:    68            mov byte ptr [r2], low(r0)
$27CB:    20            mov r0, r0
$27CC:    66            mov byte ptr [r1], low(r2)
$27CD:    6F            mov byte ptr [r3], low(r3)
$27CE:    72            mov [r0], r2
$27CF:    20            mov r0, r0
$27D0:    68            mov byte ptr [r2], low(r0)
$27D1:    65            mov byte ptr [r1], low(r1)
$27D2:    6C            mov byte ptr [r3], low(r0)
$27D3:    70            mov [r0], r0
$27D4:    29            mov r2, r1
$27D5:    2E            mov r3, r2
$27D6:    0A            mov r0, sp
$27D7:    00            trap
$27D8:    21            mov r0, r1
$27D9:    20            mov r0, r0
$27DA:    49            mov r2, byte ptr [r1]
$27DB:    6E            mov byte ptr [r3], low(r2)
$27DC:    76            mov [r1], r2
$27DD:    61            mov byte ptr [r0], low(r1)
$27DE:    6C            mov byte ptr [r3], low(r0)
$27DF:    69            mov byte ptr [r2], low(r1)
$27E0:    64            mov byte ptr [r1], low(r0)
$27E1:    20            mov r0, r0
$27E2:    69            mov byte ptr [r2], low(r1)
$27E3:    6E            mov byte ptr [r3], low(r2)
$27E4:    70            mov [r0], r0
$27E5:    75            mov [r1], r1
$27E6:    74            mov [r1], r0
$27E7:    20            mov r0, r0
$27E8:    65            mov byte ptr [r1], low(r1)
$27E9:    72            mov [r0], r2
$27EA:    72            mov [r0], r2
$27EB:    6F            mov byte ptr [r3], low(r3)
$27EC:    72            mov [r0], r2
$27ED:    2E            mov r3, r2
$27EE:    0A            mov r0, sp
$27EF:    00            trap
$27F0:    3E            add r3, r2
$27F1:    20            mov r0, r0
$27F2:    57            mov r1, [r3]
$27F3:    68            mov byte ptr [r2], low(r0)
$27F4:    69            mov byte ptr [r2], low(r1)
$27F5:    63            mov byte ptr [r0], low(r3)
$27F6:    68            mov byte ptr [r2], low(r0)
$27F7:    20            mov r0, r0
$27F8:    61            mov byte ptr [r0], low(r1)
$27F9:    64            mov byte ptr [r1], low(r0)
$27FA:    64            mov byte ptr [r1], low(r0)
$27FB:    72            mov [r0], r2
$27FC:    65            mov byte ptr [r1], low(r1)
$27FD:    73            mov [r0], r3
$27FE:    73            mov [r0], r3
$27FF:    3F            add r3, r3
$2800:    20            mov r0, r0
$2801:    00            trap
$2802:    3E            add r3, r2
$2803:    20            mov r0, r0
$2804:    48            mov r2, byte ptr [r0]
$2805:    6F            mov byte ptr [r3], low(r3)
$2806:    77            mov [r1], r3
$2807:    20            mov r0, r0
$2808:    6D            mov byte ptr [r3], low(r1)
$2809:    61            mov byte ptr [r0], low(r1)
$280A:    6E            mov byte ptr [r3], low(r2)
$280B:    79            mov [r2], r1
$280C:    20            mov r0, r0
$280D:    6C            mov byte ptr [r3], low(r0)
$280E:    69            mov byte ptr [r2], low(r1)
$280F:    6E            mov byte ptr [r3], low(r2)
$2810:    65            mov byte ptr [r1], low(r1)
$2811:    73            mov [r0], r3
$2812:    3F            add r3, r3
$2813:    20            mov r0, r0
$2814:    00            trap
$2815:    3E            add r3, r2
$2816:    20            mov r0, r0
$2817:    52            mov r0, [r2]
$2818:    65            mov byte ptr [r1], low(r1)
$2819:    61            mov byte ptr [r0], low(r1)
$281A:    6C            mov byte ptr [r3], low(r0)
$281B:    6C            mov byte ptr [r3], low(r0)
$281C:    79            mov [r2], r1
$281D:    20            mov r0, r0
$281E:    65            mov byte ptr [r1], low(r1)
$281F:    78            mov [r2], r0
$2820:    65            mov byte ptr [r1], low(r1)
$2821:    63            mov byte ptr [r0], low(r3)
$2822:    20            mov r0, r0
$2823:    61            mov byte ptr [r0], low(r1)
$2824:    74            mov [r1], r0
$2825:    20            mov r0, r0
$2826:    F0            fixme: unknown opcode F0
$2827:    D6            or r0, r2
$2828:    FB            fixme: unknown opcode FB
$2829:    3F            add r3, r3
$282A:    20            mov r0, r0
$282B:    54            mov r1, [r0]
$282C:    79            mov [r2], r1
$282D:    70            mov [r0], r0
$282E:    65            mov byte ptr [r1], low(r1)
$282F:    20            mov r0, r0
$2830:    59            mov r2, [r1]
$2831:    20            mov r0, r0
$2832:    69            mov byte ptr [r2], low(r1)
$2833:    66            mov byte ptr [r1], low(r2)
$2834:    20            mov r0, r0
$2835:    73            mov [r0], r3
$2836:    6F            mov byte ptr [r3], low(r3)
$2837:    3A            add r2, r2
$2838:    20            mov r0, r0
$2839:    00            trap
$283A:    21            mov r0, r1
$283B:    20            mov r0, r0
$283C:    43            mov r0, byte ptr [r3]
$283D:    61            mov byte ptr [r0], low(r1)
$283E:    6E            mov byte ptr [r3], low(r2)
$283F:    63            mov byte ptr [r0], low(r3)
$2840:    65            mov byte ptr [r1], low(r1)
$2841:    6C            mov byte ptr [r3], low(r0)
$2842:    6C            mov byte ptr [r3], low(r0)
$2843:    65            mov byte ptr [r1], low(r1)
$2844:    64            mov byte ptr [r1], low(r0)
$2845:    20            mov r0, r0
$2846:    61            mov byte ptr [r0], low(r1)
$2847:    63            mov byte ptr [r0], low(r3)
$2848:    74            mov [r1], r0
$2849:    69            mov byte ptr [r2], low(r1)
$284A:    6F            mov byte ptr [r3], low(r3)
$284B:    6E            mov byte ptr [r3], low(r2)
$284C:    20            mov r0, r0
$284D:    65            mov byte ptr [r1], low(r1)
$284E:    72            mov [r0], r2
$284F:    72            mov [r0], r2
$2850:    6F            mov byte ptr [r3], low(r3)
$2851:    72            mov [r0], r2
$2852:    2E            mov r3, r2
$2853:    0A            mov r0, sp
$2854:    00            trap
$2855:    43            mov r0, byte ptr [r3]
$2856:    6F            mov byte ptr [r3], low(r3)
$2857:    6E            mov byte ptr [r3], low(r2)
$2858:    74            mov [r1], r0
$2859:    69            mov byte ptr [r2], low(r1)
$285A:    6E            mov byte ptr [r3], low(r2)
$285B:    75            mov [r1], r1
$285C:    69            mov byte ptr [r2], low(r1)
$285D:    6E            mov byte ptr [r3], low(r2)
$285E:    67            mov byte ptr [r1], low(r3)
$285F:    2E            mov r3, r2
$2860:    0A            mov r0, sp
$2861:    00            trap
$2862:    4C            mov r3, byte ptr [r0]
$2863:    6F            mov byte ptr [r3], low(r3)
$2864:    61            mov byte ptr [r0], low(r1)
$2865:    64            mov byte ptr [r1], low(r0)
$2866:    65            mov byte ptr [r1], low(r1)
$2867:    64            mov byte ptr [r1], low(r0)
$2868:    2E            mov r3, r2
$2869:    0A            mov r0, sp
$286A:    00            trap
$286B:    21            mov r0, r1
$286C:    20            mov r0, r0
$286D:    44            mov r1, byte ptr [r0]
$286E:    72            mov [r0], r2
$286F:    79            mov [r2], r1
$2870:    20            mov r0, r0
$2871:    73            mov [r0], r3
$2872:    74            mov [r1], r0
$2873:    61            mov byte ptr [r0], low(r1)
$2874:    63            mov byte ptr [r0], low(r3)
$2875:    6B            mov byte ptr [r2], low(r3)
$2876:    2E            mov r3, r2
$2877:    20            mov r0, r0
$2878:    48            mov r2, byte ptr [r0]
$2879:    61            mov byte ptr [r0], low(r1)
$287A:    6C            mov byte ptr [r3], low(r0)
$287B:    74            mov [r1], r0
$287C:    69            mov byte ptr [r2], low(r1)
$287D:    6E            mov byte ptr [r3], low(r2)
$287E:    67            mov byte ptr [r1], low(r3)
$287F:    20            mov r0, r0
$2880:    6D            mov byte ptr [r3], low(r1)
$2881:    61            mov byte ptr [r0], low(r1)
$2882:    63            mov byte ptr [r0], low(r3)
$2883:    68            mov byte ptr [r2], low(r0)
$2884:    69            mov byte ptr [r2], low(r1)
$2885:    6E            mov byte ptr [r3], low(r2)
$2886:    65            mov byte ptr [r1], low(r1)
$2887:    2E            mov r3, r2
$2888:    0A            mov r0, sp
$2889:    00            trap
$288A:    3E            add r3, r2
$288B:    20            mov r0, r0
$288C:    46            mov r1, byte ptr [r2]
$288D:    69            mov byte ptr [r2], low(r1)
$288E:    6C            mov byte ptr [r3], low(r0)
$288F:    65            mov byte ptr [r1], low(r1)
$2890:    6E            mov byte ptr [r3], low(r2)
$2891:    61            mov byte ptr [r0], low(r1)
$2892:    6D            mov byte ptr [r3], low(r1)
$2893:    65            mov byte ptr [r1], low(r1)
$2894:    3F            add r3, r3
$2895:    20            mov r0, r0
$2896:    00            trap
$2897:    21            mov r0, r1
$2898:    20            mov r0, r0
$2899:    46            mov r1, byte ptr [r2]
$289A:    69            mov byte ptr [r2], low(r1)
$289B:    6C            mov byte ptr [r3], low(r0)
$289C:    65            mov byte ptr [r1], low(r1)
$289D:    20            mov r0, r0
$289E:    6E            mov byte ptr [r3], low(r2)
$289F:    6F            mov byte ptr [r3], low(r3)
$28A0:    74            mov [r1], r0
$28A1:    20            mov r0, r0
$28A2:    66            mov byte ptr [r1], low(r2)
$28A3:    6F            mov byte ptr [r3], low(r3)
$28A4:    75            mov [r1], r1
$28A5:    6E            mov byte ptr [r3], low(r2)
$28A6:    64            mov byte ptr [r1], low(r0)
$28A7:    20            mov r0, r0
$28A8:    65            mov byte ptr [r1], low(r1)
$28A9:    72            mov [r0], r2
$28AA:    72            mov [r0], r2
$28AB:    6F            mov byte ptr [r3], low(r3)
$28AC:    72            mov [r0], r2
$28AD:    2E            mov r3, r2
$28AE:    0A            mov r0, sp
$28AF:    00            trap
$28B0:    3E            add r3, r2
$28B1:    20            mov r0, r0
$28B2:    45            mov r1, byte ptr [r1]
$28B3:    6E            mov byte ptr [r3], low(r2)
$28B4:    74            mov [r1], r0
$28B5:    65            mov byte ptr [r1], low(r1)
$28B6:    72            mov [r0], r2
$28B7:    20            mov r0, r0
$28B8:    68            mov byte ptr [r2], low(r0)
$28B9:    65            mov byte ptr [r1], low(r1)
$28BA:    78            mov [r2], r0
$28BB:    20            mov r0, r0
$28BC:    64            mov byte ptr [r1], low(r0)
$28BD:    61            mov byte ptr [r0], low(r1)
$28BE:    74            mov [r1], r0
$28BF:    61            mov byte ptr [r0], low(r1)
$28C0:    2E            mov r3, r2
$28C1:    20            mov r0, r0
$28C2:    45            mov r1, byte ptr [r1]
$28C3:    6E            mov byte ptr [r3], low(r2)
$28C4:    64            mov byte ptr [r1], low(r0)
$28C5:    20            mov r0, r0
$28C6:    77            mov [r1], r3
$28C7:    69            mov byte ptr [r2], low(r1)
$28C8:    74            mov [r1], r0
$28C9:    68            mov byte ptr [r2], low(r0)
$28CA:    20            mov r0, r0
$28CB:    64            mov byte ptr [r1], low(r0)
$28CC:    6F            mov byte ptr [r3], low(r3)
$28CD:    74            mov [r1], r0
$28CE:    20            mov r0, r0
$28CF:    22            mov r0, r2
$28D0:    2E            mov r3, r2
$28D1:    22            mov r0, r2
$28D2:    20            mov r0, r0
$28D3:    2B            mov r2, r3
$28D4:    20            mov r0, r0
$28D5:    6E            mov byte ptr [r3], low(r2)
$28D6:    65            mov byte ptr [r1], low(r1)
$28D7:    77            mov [r1], r3
$28D8:    6C            mov byte ptr [r3], low(r0)
$28D9:    69            mov byte ptr [r2], low(r1)
$28DA:    6E            mov byte ptr [r3], low(r2)
$28DB:    65            mov byte ptr [r1], low(r1)
$28DC:    3A            add r2, r2
$28DD:    0A            mov r0, sp
$28DE:    00            trap
$28DF:    57            mov r1, [r3]
$28E0:    6F            mov byte ptr [r3], low(r3)
$28E1:    77            mov [r1], r3
$28E2:    2C            mov r3, r0
$28E3:    20            mov r0, r0
$28E4:    75            mov [r1], r1
$28E5:    6E            mov byte ptr [r3], low(r2)
$28E6:    64            mov byte ptr [r1], low(r0)
$28E7:    6F            mov byte ptr [r3], low(r3)
$28E8:    63            mov byte ptr [r0], low(r3)
$28E9:    75            mov [r1], r1
$28EA:    6D            mov byte ptr [r3], low(r1)
$28EB:    65            mov byte ptr [r1], low(r1)
$28EC:    6E            mov byte ptr [r3], low(r2)
$28ED:    74            mov [r1], r0
$28EE:    65            mov byte ptr [r1], low(r1)
$28EF:    64            mov byte ptr [r1], low(r0)
$28F0:    20            mov r0, r0
$28F1:    6D            mov byte ptr [r3], low(r1)
$28F2:    6F            mov byte ptr [r3], low(r3)
$28F3:    6E            mov byte ptr [r3], low(r2)
$28F4:    69            mov byte ptr [r2], low(r1)
$28F5:    74            mov [r1], r0
$28F6:    6F            mov byte ptr [r3], low(r3)
$28F7:    72            mov [r0], r2
$28F8:    20            mov r0, r0
$28F9:    63            mov byte ptr [r0], low(r3)
$28FA:    6F            mov byte ptr [r3], low(r3)
$28FB:    6D            mov byte ptr [r3], low(r1)
$28FC:    6D            mov byte ptr [r3], low(r1)
$28FD:    61            mov byte ptr [r0], low(r1)
$28FE:    6E            mov byte ptr [r3], low(r2)
$28FF:    64            mov byte ptr [r1], low(r0)
$2900:    21            mov r0, r1
$2901:    20            mov r0, r0
$2902:    46            mov r1, byte ptr [r2]
$2903:    4F            mov r3, byte ptr [r3]
$2904:    4F            mov r3, byte ptr [r3]
$2905:    4C            mov r3, byte ptr [r0]
$2906:    53            mov r0, [r3]
$2907:    32            add r0, r2
$2908:    30            add r0, r0
$2909:    32            add r0, r2
$290A:    33            add r0, r3
$290B:    5F            mov r3, [r3]
$290C:    7B            mov [r2], r3
$290D:    53            mov r0, [r3]
$290E:    65            mov byte ptr [r1], low(r1)
$290F:    63            mov byte ptr [r0], low(r3)
$2910:    72            mov [r0], r2
$2911:    65            mov byte ptr [r1], low(r1)
$2912:    74            mov [r1], r0
$2913:    F0            fixme: unknown opcode F0
$2914:    00            trap
$2915:    E0 78 F0      add r0, $F078
$2918:    01 E0 43      mul r0, $43E0
$291B:    6F            mov byte ptr [r3], low(r3)
$291C:    6D            mov byte ptr [r3], low(r1)
$291D:    6D            mov byte ptr [r3], low(r1)
$291E:    61            mov byte ptr [r0], low(r1)
$291F:    6E            mov byte ptr [r3], low(r2)
$2920:    64            mov byte ptr [r1], low(r0)
$2921:    7D            mov [r3], r1
$2922:    0A            mov r0, sp
$2923:    00            trap
$2924:    41            mov r0, byte ptr [r1]
$2925:    76            mov [r1], r2
$2926:    61            mov byte ptr [r0], low(r1)
$2927:    69            mov byte ptr [r2], low(r1)
$2928:    6C            mov byte ptr [r3], low(r0)
$2929:    61            mov byte ptr [r0], low(r1)
$292A:    62            mov byte ptr [r0], low(r2)
$292B:    6C            mov byte ptr [r3], low(r0)
$292C:    65            mov byte ptr [r1], low(r1)
$292D:    20            mov r0, r0
$292E:    63            mov byte ptr [r0], low(r3)
$292F:    6F            mov byte ptr [r3], low(r3)
$2930:    6D            mov byte ptr [r3], low(r1)
$2931:    6D            mov byte ptr [r3], low(r1)
$2932:    61            mov byte ptr [r0], low(r1)
$2933:    6E            mov byte ptr [r3], low(r2)
$2934:    64            mov byte ptr [r1], low(r0)
$2935:    73            mov [r0], r3
$2936:    3A            add r2, r2
$2937:    0A            mov r0, sp
$2938:    72            mov [r0], r2
$2939:    20            mov r0, r0
$293A:    20            mov r0, r0
$293B:    20            mov r0, r0
$293C:    3A            add r2, r2
$293D:    3A            add r2, r2
$293E:    20            mov r0, r0
$293F:    70            mov [r0], r0
$2940:    72            mov [r0], r2
$2941:    69            mov byte ptr [r2], low(r1)
$2942:    6E            mov byte ptr [r3], low(r2)
$2943:    74            mov [r1], r0
$2944:    20            mov r0, r0
$2945:    6D            mov byte ptr [r3], low(r1)
$2946:    65            mov byte ptr [r1], low(r1)
$2947:    6D            mov byte ptr [r3], low(r1)
$2948:    6F            mov byte ptr [r3], low(r3)
$2949:    72            mov [r0], r2
$294A:    79            mov [r2], r1
$294B:    20            mov r0, r0
$294C:    61            mov byte ptr [r0], low(r1)
$294D:    73            mov [r0], r3
$294E:    20            mov r0, r0
$294F:    68            mov byte ptr [r2], low(r0)
$2950:    65            mov byte ptr [r1], low(r1)
$2951:    78            mov [r2], r0
$2952:    0A            mov r0, sp
$2953:    70            mov [r0], r0
$2954:    20            mov r0, r0
$2955:    20            mov r0, r0
$2956:    20            mov r0, r0
$2957:    3A            add r2, r2
$2958:    3A            add r2, r2
$2959:    20            mov r0, r0
$295A:    70            mov [r0], r0
$295B:    72            mov [r0], r2
$295C:    69            mov byte ptr [r2], low(r1)
$295D:    6E            mov byte ptr [r3], low(r2)
$295E:    74            mov [r1], r0
$295F:    20            mov r0, r0
$2960:    6D            mov byte ptr [r3], low(r1)
$2961:    65            mov byte ptr [r1], low(r1)
$2962:    6D            mov byte ptr [r3], low(r1)
$2963:    6F            mov byte ptr [r3], low(r3)
$2964:    72            mov [r0], r2
$2965:    79            mov [r2], r1
$2966:    20            mov r0, r0
$2967:    61            mov byte ptr [r0], low(r1)
$2968:    73            mov [r0], r3
$2969:    20            mov r0, r0
$296A:    74            mov [r1], r0
$296B:    65            mov byte ptr [r1], low(r1)
$296C:    78            mov [r2], r0
$296D:    74            mov [r1], r0
$296E:    0A            mov r0, sp
$296F:    77            mov [r1], r3
$2970:    20            mov r0, r0
$2971:    20            mov r0, r0
$2972:    20            mov r0, r0
$2973:    3A            add r2, r2
$2974:    3A            add r2, r2
$2975:    20            mov r0, r0
$2976:    77            mov [r1], r3
$2977:    72            mov [r0], r2
$2978:    69            mov byte ptr [r2], low(r1)
$2979:    74            mov [r1], r0
$297A:    65            mov byte ptr [r1], low(r1)
$297B:    20            mov r0, r0
$297C:    68            mov byte ptr [r2], low(r0)
$297D:    65            mov byte ptr [r1], low(r1)
$297E:    78            mov [r2], r0
$297F:    20            mov r0, r0
$2980:    64            mov byte ptr [r1], low(r0)
$2981:    61            mov byte ptr [r0], low(r1)
$2982:    74            mov [r1], r0
$2983:    61            mov byte ptr [r0], low(r1)
$2984:    20            mov r0, r0
$2985:    74            mov [r1], r0
$2986:    6F            mov byte ptr [r3], low(r3)
$2987:    20            mov r0, r0
$2988:    6D            mov byte ptr [r3], low(r1)
$2989:    65            mov byte ptr [r1], low(r1)
$298A:    6D            mov byte ptr [r3], low(r1)
$298B:    6F            mov byte ptr [r3], low(r3)
$298C:    72            mov [r0], r2
$298D:    79            mov [r2], r1
$298E:    0A            mov r0, sp
$298F:    78            mov [r2], r0
$2990:    20            mov r0, r0
$2991:    20            mov r0, r0
$2992:    20            mov r0, r0
$2993:    3A            add r2, r2
$2994:    3A            add r2, r2
$2995:    20            mov r0, r0
$2996:    65            mov byte ptr [r1], low(r1)
$2997:    78            mov [r2], r0
$2998:    65            mov byte ptr [r1], low(r1)
$2999:    63            mov byte ptr [r0], low(r3)
$299A:    75            mov [r1], r1
$299B:    74            mov [r1], r0
$299C:    65            mov byte ptr [r1], low(r1)
$299D:    20            mov r0, r0
$299E:    6D            mov byte ptr [r3], low(r1)
$299F:    65            mov byte ptr [r1], low(r1)
$29A0:    6D            mov byte ptr [r3], low(r1)
$29A1:    6F            mov byte ptr [r3], low(r3)
$29A2:    72            mov [r0], r2
$29A3:    79            mov [r2], r1
$29A4:    0A            mov r0, sp
$29A5:    72            mov [r0], r2
$29A6:    66            mov byte ptr [r1], low(r2)
$29A7:    20            mov r0, r0
$29A8:    20            mov r0, r0
$29A9:    3A            add r2, r2
$29AA:    3A            add r2, r2
$29AB:    20            mov r0, r0
$29AC:    6C            mov byte ptr [r3], low(r0)
$29AD:    6F            mov byte ptr [r3], low(r3)
$29AE:    61            mov byte ptr [r0], low(r1)
$29AF:    64            mov byte ptr [r1], low(r0)
$29B0:    20            mov r0, r0
$29B1:    6D            mov byte ptr [r3], low(r1)
$29B2:    65            mov byte ptr [r1], low(r1)
$29B3:    6D            mov byte ptr [r3], low(r1)
$29B4:    6F            mov byte ptr [r3], low(r3)
$29B5:    72            mov [r0], r2
$29B6:    79            mov [r2], r1
$29B7:    20            mov r0, r0
$29B8:    66            mov byte ptr [r1], low(r2)
$29B9:    72            mov [r0], r2
$29BA:    6F            mov byte ptr [r3], low(r3)
$29BB:    6D            mov byte ptr [r3], low(r1)
$29BC:    20            mov r0, r0
$29BD:    66            mov byte ptr [r1], low(r2)
$29BE:    69            mov byte ptr [r2], low(r1)
$29BF:    6C            mov byte ptr [r3], low(r0)
$29C0:    65            mov byte ptr [r1], low(r1)
$29C1:    0A            mov r0, sp
$29C2:    6C            mov byte ptr [r3], low(r0)
$29C3:    73            mov [r0], r3
$29C4:    20            mov r0, r0
$29C5:    20            mov r0, r0
$29C6:    3A            add r2, r2
$29C7:    3A            add r2, r2
$29C8:    20            mov r0, r0
$29C9:    70            mov [r0], r0
$29CA:    72            mov [r0], r2
$29CB:    69            mov byte ptr [r2], low(r1)
$29CC:    6E            mov byte ptr [r3], low(r2)
$29CD:    74            mov [r1], r0
$29CE:    20            mov r0, r0
$29CF:    66            mov byte ptr [r1], low(r2)
$29D0:    69            mov byte ptr [r2], low(r1)
$29D1:    6C            mov byte ptr [r3], low(r0)
$29D2:    65            mov byte ptr [r1], low(r1)
$29D3:    20            mov r0, r0
$29D4:    69            mov byte ptr [r2], low(r1)
$29D5:    6E            mov byte ptr [r3], low(r2)
$29D6:    64            mov byte ptr [r1], low(r0)
$29D7:    65            mov byte ptr [r1], low(r1)
$29D8:    78            mov [r2], r0
$29D9:    0A            mov r0, sp
$29DA:    68            mov byte ptr [r2], low(r0)
$29DB:    20            mov r0, r0
$29DC:    20            mov r0, r0
$29DD:    20            mov r0, r0
$29DE:    3A            add r2, r2
$29DF:    3A            add r2, r2
$29E0:    20            mov r0, r0
$29E1:    70            mov [r0], r0
$29E2:    72            mov [r0], r2
$29E3:    69            mov byte ptr [r2], low(r1)
$29E4:    6E            mov byte ptr [r3], low(r2)
$29E5:    74            mov [r1], r0
$29E6:    20            mov r0, r0
$29E7:    74            mov [r1], r0
$29E8:    68            mov byte ptr [r2], low(r0)
$29E9:    69            mov byte ptr [r2], low(r1)
$29EA:    73            mov [r0], r3
$29EB:    20            mov r0, r0
$29EC:    68            mov byte ptr [r2], low(r0)
$29ED:    65            mov byte ptr [r1], low(r1)
$29EE:    6C            mov byte ptr [r3], low(r0)
$29EF:    70            mov [r0], r0
$29F0:    20            mov r0, r0
$29F1:    6D            mov byte ptr [r3], low(r1)
$29F2:    65            mov byte ptr [r1], low(r1)
$29F3:    73            mov [r0], r3
$29F4:    73            mov [r0], r3
$29F5:    61            mov byte ptr [r0], low(r1)
$29F6:    67            mov byte ptr [r1], low(r3)
$29F7:    65            mov byte ptr [r1], low(r1)
$29F8:    0A            mov r0, sp
$29F9:    63            mov byte ptr [r0], low(r3)
$29FA:    20            mov r0, r0
$29FB:    20            mov r0, r0
$29FC:    20            mov r0, r0
$29FD:    3A            add r2, r2
$29FE:    3A            add r2, r2
$29FF:    20            mov r0, r0
$2A00:    65            mov byte ptr [r1], low(r1)
$2A01:    78            mov [r2], r0
$2A02:    69            mov byte ptr [r2], low(r1)
$2A03:    74            mov [r1], r0
$2A04:    20            mov r0, r0
$2A05:    6D            mov byte ptr [r3], low(r1)
$2A06:    6F            mov byte ptr [r3], low(r3)
$2A07:    6E            mov byte ptr [r3], low(r2)
$2A08:    69            mov byte ptr [r2], low(r1)
$2A09:    74            mov [r1], r0
$2A0A:    6F            mov byte ptr [r3], low(r3)
$2A0B:    72            mov [r0], r2
$2A0C:    20            mov r0, r0
$2A0D:    61            mov byte ptr [r0], low(r1)
$2A0E:    6E            mov byte ptr [r3], low(r2)
$2A0F:    64            mov byte ptr [r1], low(r0)
$2A10:    20            mov r0, r0
$2A11:    63            mov byte ptr [r0], low(r3)
$2A12:    6F            mov byte ptr [r3], low(r3)
$2A13:    6E            mov byte ptr [r3], low(r2)
$2A14:    74            mov [r1], r0
$2A15:    69            mov byte ptr [r2], low(r1)
$2A16:    6E            mov byte ptr [r3], low(r2)
$2A17:    75            mov [r1], r1
$2A18:    65            mov byte ptr [r1], low(r1)
$2A19:    0A            mov r0, sp
$2A1A:    50            mov r0, [r0]
$2A1B:    6C            mov byte ptr [r3], low(r0)
$2A1C:    65            mov byte ptr [r1], low(r1)
$2A1D:    61            mov byte ptr [r0], low(r1)
$2A1E:    73            mov [r0], r3
$2A1F:    65            mov byte ptr [r1], low(r1)
$2A20:    20            mov r0, r0
$2A21:    65            mov byte ptr [r1], low(r1)
$2A22:    6E            mov byte ptr [r3], low(r2)
$2A23:    74            mov [r1], r0
$2A24:    65            mov byte ptr [r1], low(r1)
$2A25:    72            mov [r0], r2
$2A26:    20            mov r0, r0
$2A27:    68            mov byte ptr [r2], low(r0)
$2A28:    65            mov byte ptr [r1], low(r1)
$2A29:    78            mov [r2], r0
$2A2A:    20            mov r0, r0
$2A2B:    6E            mov byte ptr [r3], low(r2)
$2A2C:    75            mov [r1], r1
$2A2D:    6D            mov byte ptr [r3], low(r1)
$2A2E:    62            mov byte ptr [r0], low(r2)
$2A2F:    65            mov byte ptr [r1], low(r1)
$2A30:    72            mov [r0], r2
$2A31:    73            mov [r0], r3
$2A32:    20            mov r0, r0
$2A33:    77            mov [r1], r3
$2A34:    68            mov byte ptr [r2], low(r0)
$2A35:    65            mov byte ptr [r1], low(r1)
$2A36:    6E            mov byte ptr [r3], low(r2)
$2A37:    20            mov r0, r0
$2A38:    70            mov [r0], r0
$2A39:    72            mov [r0], r2
$2A3A:    6F            mov byte ptr [r3], low(r3)
$2A3B:    6D            mov byte ptr [r3], low(r1)
$2A3C:    70            mov [r0], r0
$2A3D:    74            mov [r1], r0
$2A3E:    65            mov byte ptr [r1], low(r1)
$2A3F:    64            mov byte ptr [r1], low(r0)
$2A40:    2E            mov r3, r2
$2A41:    0A            mov r0, sp
$2A42:    49            mov r2, byte ptr [r1]
$2A43:    66            mov byte ptr [r1], low(r2)
$2A44:    20            mov r0, r0
$2A45:    6E            mov byte ptr [r3], low(r2)
$2A46:    65            mov byte ptr [r1], low(r1)
$2A47:    63            mov byte ptr [r0], low(r3)
$2A48:    65            mov byte ptr [r1], low(r1)
$2A49:    73            mov [r0], r3
$2A4A:    73            mov [r0], r3
$2A4B:    61            mov byte ptr [r0], low(r1)
$2A4C:    72            mov [r0], r2
$2A4D:    79            mov [r2], r1
$2A4E:    20            mov r0, r0
$2A4F:    66            mov byte ptr [r1], low(r2)
$2A50:    6F            mov byte ptr [r3], low(r3)
$2A51:    72            mov [r0], r2
$2A52:    20            mov r0, r0
$2A53:    64            mov byte ptr [r1], low(r0)
$2A54:    65            mov byte ptr [r1], low(r1)
$2A55:    62            mov byte ptr [r0], low(r2)
$2A56:    75            mov [r1], r1
$2A57:    67            mov byte ptr [r1], low(r3)
$2A58:    67            mov byte ptr [r1], low(r3)
$2A59:    69            mov byte ptr [r2], low(r1)
$2A5A:    6E            mov byte ptr [r3], low(r2)
$2A5B:    67            mov byte ptr [r1], low(r3)
$2A5C:    2C            mov r3, r0
$2A5D:    20            mov r0, r0
$2A5E:    79            mov [r2], r1
$2A5F:    6F            mov byte ptr [r3], low(r3)
$2A60:    75            mov [r1], r1
$2A61:    20            mov r0, r0
$2A62:    63            mov byte ptr [r0], low(r3)
$2A63:    61            mov byte ptr [r0], low(r1)
$2A64:    6E            mov byte ptr [r3], low(r2)
$2A65:    20            mov r0, r0
$2A66:    62            mov byte ptr [r0], low(r2)
$2A67:    72            mov [r0], r2
$2A68:    65            mov byte ptr [r1], low(r1)
$2A69:    61            mov byte ptr [r0], low(r1)
$2A6A:    6B            mov byte ptr [r2], low(r3)
$2A6B:    20            mov r0, r0
$2A6C:    69            mov byte ptr [r2], low(r1)
$2A6D:    6E            mov byte ptr [r3], low(r2)
$2A6E:    74            mov [r1], r0
$2A6F:    6F            mov byte ptr [r3], low(r3)
$2A70:    20            mov r0, r0
$2A71:    6D            mov byte ptr [r3], low(r1)
$2A72:    6F            mov byte ptr [r3], low(r3)
$2A73:    6E            mov byte ptr [r3], low(r2)
$2A74:    69            mov byte ptr [r2], low(r1)
$2A75:    74            mov [r1], r0
$2A76:    6F            mov byte ptr [r3], low(r3)
$2A77:    72            mov [r0], r2
$2A78:    0A            mov r0, sp
$2A79:    77            mov [r1], r3
$2A7A:    69            mov byte ptr [r2], low(r1)
$2A7B:    74            mov [r1], r0
$2A7C:    68            mov byte ptr [r2], low(r0)
$2A7D:    20            mov r0, r0
$2A7E:    69            mov byte ptr [r2], low(r1)
$2A7F:    6E            mov byte ptr [r3], low(r2)
$2A80:    73            mov [r0], r3
$2A81:    74            mov [r1], r0
$2A82:    72            mov [r0], r2
$2A83:    75            mov [r1], r1
$2A84:    63            mov byte ptr [r0], low(r3)
$2A85:    74            mov [r1], r0
$2A86:    69            mov byte ptr [r2], low(r1)
$2A87:    6F            mov byte ptr [r3], low(r3)
$2A88:    6E            mov byte ptr [r3], low(r2)
$2A89:    20            mov r0, r0
$2A8A:    42            mov r0, byte ptr [r2]
$2A8B:    52            mov r0, [r2]
$2A8C:    4B            mov r2, byte ptr [r3]
$2A8D:    20            mov r0, r0
$2A8E:    28            mov r2, r0
$2A8F:    30            add r0, r0
$2A90:    78            mov [r2], r0
$2A91:    30            add r0, r0
$2A92:    30            add r0, r0
$2A93:    29            mov r2, r1
$2A94:    20            mov r0, r0
$2A95:    61            mov byte ptr [r0], low(r1)
$2A96:    6E            mov byte ptr [r3], low(r2)
$2A97:    64            mov byte ptr [r1], low(r0)
$2A98:    20            mov r0, r0
$2A99:    63            mov byte ptr [r0], low(r3)
$2A9A:    6F            mov byte ptr [r3], low(r3)
$2A9B:    6E            mov byte ptr [r3], low(r2)
$2A9C:    74            mov [r1], r0
$2A9D:    69            mov byte ptr [r2], low(r1)
$2A9E:    6E            mov byte ptr [r3], low(r2)
$2A9F:    75            mov [r1], r1
$2AA0:    65            mov byte ptr [r1], low(r1)
$2AA1:    20            mov r0, r0
$2AA2:    77            mov [r1], r3
$2AA3:    69            mov byte ptr [r2], low(r1)
$2AA4:    74            mov [r1], r0
$2AA5:    68            mov byte ptr [r2], low(r0)
$2AA6:    20            mov r0, r0
$2AA7:    27            mov r1, r3
$2AA8:    63            mov byte ptr [r0], low(r3)
$2AA9:    27            mov r1, r3
$2AAA:    0A            mov r0, sp
$2AAB:    4E            mov r3, byte ptr [r2]
$2AAC:    6F            mov byte ptr [r3], low(r3)
$2AAD:    74            mov [r1], r0
$2AAE:    65            mov byte ptr [r1], low(r1)
$2AAF:    3A            add r2, r2
$2AB0:    20            mov r0, r0
$2AB1:    6D            mov byte ptr [r3], low(r1)
$2AB2:    65            mov byte ptr [r1], low(r1)
$2AB3:    6D            mov byte ptr [r3], low(r1)
$2AB4:    6F            mov byte ptr [r3], low(r3)
$2AB5:    72            mov [r0], r2
$2AB6:    79            mov [r2], r1
$2AB7:    20            mov r0, r0
$2AB8:    72            mov [r0], r2
$2AB9:    65            mov byte ptr [r1], low(r1)
$2ABA:    67            mov byte ptr [r1], low(r3)
$2ABB:    69            mov byte ptr [r2], low(r1)
$2ABC:    6F            mov byte ptr [r3], low(r3)
$2ABD:    6E            mov byte ptr [r3], low(r2)
$2ABE:    20            mov r0, r0
$2ABF:    45            mov r1, byte ptr [r1]
$2AC0:    30            add r0, r0
$2AC1:    30            add r0, r0
$2AC2:    30            add r0, r0
$2AC3:    2D            mov r3, r1
$2AC4:    46            mov r1, byte ptr [r2]
$2AC5:    46            mov r1, byte ptr [r2]
$2AC6:    46            mov r1, byte ptr [r2]
$2AC7:    46            mov r1, byte ptr [r2]
$2AC8:    20            mov r0, r0
$2AC9:    69            mov byte ptr [r2], low(r1)
$2ACA:    73            mov [r0], r3
$2ACB:    20            mov r0, r0
$2ACC:    75            mov [r1], r1
$2ACD:    73            mov [r0], r3
$2ACE:    65            mov byte ptr [r1], low(r1)
$2ACF:    64            mov byte ptr [r1], low(r0)
$2AD0:    20            mov r0, r0
$2AD1:    62            mov byte ptr [r0], low(r2)
$2AD2:    79            mov [r2], r1
$2AD3:    20            mov r0, r0
$2AD4:    6D            mov byte ptr [r3], low(r1)
$2AD5:    6F            mov byte ptr [r3], low(r3)
$2AD6:    6E            mov byte ptr [r3], low(r2)
$2AD7:    69            mov byte ptr [r2], low(r1)
$2AD8:    74            mov [r1], r0
$2AD9:    6F            mov byte ptr [r3], low(r3)
$2ADA:    72            mov [r0], r2
$2ADB:    0A            mov r0, sp
$2ADC:    00            trap
$2ADD:    42            mov r0, byte ptr [r2]
$2ADE:    4C            mov r3, byte ptr [r0]
$2ADF:    4B            mov r2, byte ptr [r3]
$2AE0:    20            mov r0, r0
$2AE1:    20            mov r0, r0
$2AE2:    53            mov r0, [r3]
$2AE3:    49            mov r2, byte ptr [r1]
$2AE4:    5A            mov r2, [r2]
$2AE5:    45            mov r1, byte ptr [r1]
$2AE6:    20            mov r0, r0
$2AE7:    20            mov r0, r0
$2AE8:    4E            mov r3, byte ptr [r2]
$2AE9:    41            mov r0, byte ptr [r1]
$2AEA:    4D            mov r3, byte ptr [r1]
$2AEB:    45            mov r1, byte ptr [r1]
$2AEC:    0A            mov r0, sp
$2AED:    3D            add r3, r1
$2AEE:    3D            add r3, r1
$2AEF:    3D            add r3, r1
$2AF0:    3D            add r3, r1
$2AF1:    3D            add r3, r1
$2AF2:    3D            add r3, r1
$2AF3:    3D            add r3, r1
$2AF4:    3D            add r3, r1
$2AF5:    3D            add r3, r1
$2AF6:    3D            add r3, r1
$2AF7:    3D            add r3, r1
$2AF8:    3D            add r3, r1
$2AF9:    3D            add r3, r1
$2AFA:    3D            add r3, r1
$2AFB:    3D            add r3, r1
$2AFC:    3D            add r3, r1
$2AFD:    3D            add r3, r1
$2AFE:    3D            add r3, r1
$2AFF:    3D            add r3, r1
$2B00:    3D            add r3, r1
$2B01:    3D            add r3, r1
$2B02:    3D            add r3, r1
$2B03:    3D            add r3, r1
$2B04:    0A            mov r0, sp
$2B05:    00            trap
$2B06:    F1            fixme: unknown opcode F1
$2B07:    CE FB 20      or r0, $20FB
$2B0A:    20            mov r0, r0
$2B0B:    20            mov r0, r0
$2B0C:    F0            fixme: unknown opcode F0
$2B0D:    D6            or r0, r2
$2B0E:    FB            fixme: unknown opcode FB
$2B0F:    20            mov r0, r0
$2B10:    20            mov r0, r0
$2B11:    00            trap
$2B12:    52            mov r0, [r2]
$2B13:    65            mov byte ptr [r1], low(r1)
$2B14:    61            mov byte ptr [r0], low(r1)
$2B15:    64            mov byte ptr [r1], low(r0)
$2B16:    79            mov [r2], r1
$2B17:    2E            mov r3, r2
$2B18:    0A            mov r0, sp
$2B19:    3E            add r3, r2
$2B1A:    20            mov r0, r0
$2B1B:    00            trap
$2B1C:    2A            mov r2, r2
$2B1D:    2A            mov r2, r2
$2B1E:    2A            mov r2, r2
$2B1F:    20            mov r0, r0
$2B20:    42            mov r0, byte ptr [r2]
$2B21:    52            mov r0, [r2]
$2B22:    45            mov r1, byte ptr [r1]
$2B23:    41            mov r0, byte ptr [r1]
$2B24:    4B            mov r2, byte ptr [r3]
$2B25:    20            mov r0, r0
$2B26:    49            mov r2, byte ptr [r1]
$2B27:    4E            mov r3, byte ptr [r2]
$2B28:    54            mov r1, [r0]
$2B29:    4F            mov r3, byte ptr [r3]
$2B2A:    20            mov r0, r0
$2B2B:    4D            mov r3, byte ptr [r1]
$2B2C:    4F            mov r3, byte ptr [r3]
$2B2D:    4E            mov r3, byte ptr [r2]
$2B2E:    49            mov r2, byte ptr [r1]
$2B2F:    54            mov r1, [r0]
$2B30:    4F            mov r3, byte ptr [r3]
$2B31:    52            mov r0, [r2]
$2B32:    20            mov r0, r0
$2B33:    41            mov r0, byte ptr [r1]
$2B34:    54            mov r1, [r0]
$2B35:    20            mov r0, r0
$2B36:    24            mov r1, r0
$2B37:    F0            fixme: unknown opcode F0
$2B38:    C0            fixme: unknown opcode C0
$2B39:    FB            fixme: unknown opcode FB
$2B3A:    20            mov r0, r0
$2B3B:    2A            mov r2, r2
$2B3C:    2A            mov r2, r2
$2B3D:    2A            mov r2, r2
$2B3E:    0A            mov r0, sp
$2B3F:    52            mov r0, [r2]
$2B40:    30            add r0, r0
$2B41:    3D            add r3, r1
$2B42:    24            mov r1, r0
$2B43:    F0            fixme: unknown opcode F0
$2B44:    B6 FB 20      mov r2, [$20FB]
$2B47:    52            mov r0, [r2]
$2B48:    31            add r0, r1
$2B49:    3D            add r3, r1
$2B4A:    24            mov r1, r0
$2B4B:    F0            fixme: unknown opcode F0
$2B4C:    B8 FB 20      mov byte ptr [$20FB], low(r0)
$2B4F:    52            mov r0, [r2]
$2B50:    32            add r0, r2
$2B51:    3D            add r3, r1
$2B52:    24            mov r1, r0
$2B53:    F0            fixme: unknown opcode F0
$2B54:    BA FB 20      mov byte ptr [$20FB], low(r0)
$2B57:    52            mov r0, [r2]
$2B58:    33            add r0, r3
$2B59:    3D            add r3, r1
$2B5A:    24            mov r1, r0
$2B5B:    F0            fixme: unknown opcode F0
$2B5C:    BC FB 0A      mov [$0AFB], r0
$2B5F:    53            mov r0, [r3]
$2B60:    50            mov r0, [r0]
$2B61:    3D            add r3, r1
$2B62:    24            mov r1, r0
$2B63:    F0            fixme: unknown opcode F0
$2B64:    BE FB 20      mov [$20FB], r0
$2B67:    5B            mov r2, [r3]
$2B68:    F1            fixme: unknown opcode F1
$2B69:    C2            fixme: unknown opcode C2
$2B6A:    FB            fixme: unknown opcode FB
$2B6B:    F1            fixme: unknown opcode F1
$2B6C:    C3            fixme: unknown opcode C3
$2B6D:    FB            fixme: unknown opcode FB
$2B6E:    F1            fixme: unknown opcode F1
$2B6F:    C4            fixme: unknown opcode C4
$2B70:    FB            fixme: unknown opcode FB
$2B71:    F1            fixme: unknown opcode F1
$2B72:    C5            fixme: unknown opcode C5
$2B73:    FB            fixme: unknown opcode FB
$2B74:    F1            fixme: unknown opcode F1
$2B75:    C6            fixme: unknown opcode C6
$2B76:    FB            fixme: unknown opcode FB
$2B77:    F1            fixme: unknown opcode F1
$2B78:    C7            fixme: unknown opcode C7
$2B79:    FB            fixme: unknown opcode FB
$2B7A:    F1            fixme: unknown opcode F1
$2B7B:    C8            fixme: unknown opcode C8
$2B7C:    FB            fixme: unknown opcode FB
$2B7D:    F1            fixme: unknown opcode F1
$2B7E:    C9            call r0
$2B7F:    FB            fixme: unknown opcode FB
$2B80:    F1            fixme: unknown opcode F1
$2B81:    CA            call r1
$2B82:    FB            fixme: unknown opcode FB
$2B83:    F1            fixme: unknown opcode F1
$2B84:    CB            call r2
$2B85:    FB            fixme: unknown opcode FB
$2B86:    F1            fixme: unknown opcode F1
$2B87:    CC            call r3
$2B88:    FB            fixme: unknown opcode FB
$2B89:    F1            fixme: unknown opcode F1
$2B8A:    CD FB 5D      and r0, $5DFB
$2B8D:    0A            mov r0, sp
$2B8E:    00            trap
$2B8F:    F0            fixme: unknown opcode F0
$2B90:    D6            or r0, r2
$2B91:    FB            fixme: unknown opcode FB
$2B92:    20            mov r0, r0
$2B93:    7C            mov [r3], r0
$2B94:    20            mov r0, r0
$2B95:    F1            fixme: unknown opcode F1
$2B96:    CE FB 20      or r0, $20FB
$2B99:    F1            fixme: unknown opcode F1
$2B9A:    CF FB 20      xor r0, $20FB
$2B9D:    F1            fixme: unknown opcode F1
$2B9E:    D0            and r0, r0
$2B9F:    FB            fixme: unknown opcode FB
$2BA0:    20            mov r0, r0
$2BA1:    F1            fixme: unknown opcode F1
$2BA2:    D1            and r0, r1
$2BA3:    FB            fixme: unknown opcode FB
$2BA4:    20            mov r0, r0
$2BA5:    F1            fixme: unknown opcode F1
$2BA6:    D2            and r0, r2
$2BA7:    FB            fixme: unknown opcode FB
$2BA8:    20            mov r0, r0
$2BA9:    F1            fixme: unknown opcode F1
$2BAA:    D3            and r0, r3
$2BAB:    FB            fixme: unknown opcode FB
$2BAC:    20            mov r0, r0
$2BAD:    F1            fixme: unknown opcode F1
$2BAE:    D4            or r0, r0
$2BAF:    FB            fixme: unknown opcode FB
$2BB0:    20            mov r0, r0
$2BB1:    F1            fixme: unknown opcode F1
$2BB2:    D5            or r0, r1
$2BB3:    FB            fixme: unknown opcode FB
$2BB4:    0A            mov r0, sp
$2BB5:    00            trap
$2BB6:    00            trap
$2BB7:    00            trap
$2BB8:    FF            fixme: unknown opcode FF
$2BB9:    C3            fixme: unknown opcode C3
$2BBA:    7D            mov [r3], r1
$2BBB:    F3            fixme: unknown opcode F3
$2BBC:    F7            fixme: unknown opcode F7
$2BBD:    F1            fixme: unknown opcode F1
$2BBE:    FE            fixme: unknown opcode FE
$2BBF:    FE            fixme: unknown opcode FE
$2BC0:    A0 F0 A1      call.eq $A1F0
$2BC3:    F0            fixme: unknown opcode F0
$2BC4:    00            trap
$2BC5:    00            trap
$2BC6:    00            trap
$2BC7:    00            trap
$2BC8:    00            trap
$2BC9:    00            trap
$2BCA:    00            trap
$2BCB:    00            trap
$2BCC:    00            trap
$2BCD:    00            trap
$2BCE:    00            trap
$2BCF:    00            trap
$2BD0:    00            trap
$2BD1:    00            trap
$2BD2:    00            trap
$2BD3:    00            trap
$2BD4:    00            trap
$2BD5:    00            trap
$2BD6:    C8            fixme: unknown opcode C8
$2BD7:    FB            fixme: unknown opcode FB
$2BD8:    00            trap
$2BD9:    00            trap
$2BDA:    00            trap
$2BDB:    00            trap
$2BDC:    00            trap
$2BDD:    00            trap
$2BDE:    00            trap
$2BDF:    00            trap
$2BE0:    00            trap
$2BE1:    00            trap
$2BE2:    00            trap
$2BE3:    00            trap
$2BE4:    00            trap
$2BE5:    00            trap
$2BE6:    00            trap
$2BE7:    00            trap
$2BE8:    00            trap
$2BE9:    00            trap
$2BEA:    00            trap
$2BEB:    00            trap
$2BEC:    00            trap
$2BED:    00            trap
$2BEE:    00            trap
$2BEF:    00            trap
$2BF0:    00            trap
$2BF1:    00            trap
$2BF2:    00            trap
$2BF3:    00            trap
$2BF4:    00            trap
$2BF5:    00            trap
$2BF6:    00            trap
$2BF7:    00            trap
$2BF8:    00            trap
$2BF9:    00            trap
$2BFA:    00            trap
$2BFB:    00            trap
$2BFC:    00            trap
$2BFD:    00            trap
$2BFE:    00            trap
$2BFF:    00            trap
$2C00:    00            trap
$2C01:    00            trap
$2C02:    00            trap
$2C03:    00            trap
$2C04:    00            trap
$2C05:    00            trap
$2C06:    00            trap
$2C07:    00            trap
$2C08:    00            trap
$2C09:    00            trap
$2C0A:    00            trap
$2C0B:    00            trap
$2C0C:    00            trap
$2C0D:    00            trap
$2C0E:    00            trap
$2C0F:    00            trap
$2C10:    00            trap
$2C11:    00            trap
$2C12:    00            trap
$2C13:    00            trap
$2C14:    00            trap
$2C15:    00            trap
$2C16:    00            trap
$2C17:    00            trap
$2C18:    00            trap
$2C19:    00            trap
$2C1A:    00            trap
$2C1B:    00            trap
$2C1C:    00            trap
$2C1D:    00            trap
$2C1E:    00            trap
$2C1F:    00            trap
$2C20:    00            trap
$2C21:    00            trap
$2C22:    00            trap
$2C23:    00            trap
$2C24:    00            trap
$2C25:    00            trap
$2C26:    00            trap
$2C27:    00            trap
$2C28:    00            trap
$2C29:    00            trap
$2C2A:    00            trap
$2C2B:    00            trap
$2C2C:    00            trap
$2C2D:    00            trap
$2C2E:    00            trap
$2C2F:    00            trap
$2C30:    00            trap
$2C31:    00            trap
$2C32:    00            trap
$2C33:    00            trap
$2C34:    00            trap
$2C35:    00            trap
$2C36:    00            trap
$2C37:    00            trap
$2C38:    00            trap
$2C39:    00            trap
$2C3A:    00            trap
$2C3B:    00            trap
$2C3C:    00            trap
$2C3D:    00            trap
$2C3E:    00            trap
$2C3F:    00            trap
$2C40:    00            trap
$2C41:    00            trap
$2C42:    00            trap
$2C43:    00            trap
$2C44:    00            trap
$2C45:    00            trap
$2C46:    00            trap
$2C47:    00            trap
$2C48:    00            trap
$2C49:    00            trap
$2C4A:    00            trap
$2C4B:    00            trap
$2C4C:    00            trap
$2C4D:    00            trap
$2C4E:    00            trap
$2C4F:    00            trap
$2C50:    00            trap
$2C51:    00            trap
$2C52:    00            trap
$2C53:    00            trap
$2C54:    00            trap
$2C55:    00            trap
$2C56:    00            trap
$2C57:    00            trap
$2C58:    00            trap
$2C59:    00            trap
$2C5A:    00            trap
$2C5B:    00            trap
$2C5C:    00            trap
$2C5D:    00            trap
$2C5E:    00            trap
$2C5F:    00            trap
$2C60:    00            trap
$2C61:    00            trap
$2C62:    00            trap
$2C63:    00            trap
$2C64:    00            trap
$2C65:    00            trap
$2C66:    00            trap
$2C67:    00            trap
$2C68:    00            trap
$2C69:    00            trap
$2C6A:    00            trap
$2C6B:    00            trap
$2C6C:    00            trap
$2C6D:    00            trap
$2C6E:    00            trap
$2C6F:    00            trap
$2C70:    00            trap
$2C71:    00            trap
$2C72:    00            trap
$2C73:    00            trap
$2C74:    00            trap
$2C75:    00            trap
$2C76:    00            trap
$2C77:    00            trap
$2C78:    00            trap
$2C79:    00            trap
$2C7A:    00            trap
$2C7B:    00            trap
$2C7C:    00            trap
$2C7D:    00            trap
$2C7E:    00            trap
$2C7F:    00            trap
$2C80:    00            trap
$2C81:    00            trap
$2C82:    00            trap
$2C83:    00            trap
$2C84:    00            trap
$2C85:    00            trap
$2C86:    00            trap
$2C87:    00            trap
$2C88:    00            trap
$2C89:    00            trap
$2C8A:    00            trap
$2C8B:    00            trap
$2C8C:    00            trap
$2C8D:    00            trap
$2C8E:    00            trap
$2C8F:    00            trap
$2C90:    00            trap
$2C91:    00            trap
$2C92:    00            trap
$2C93:    00            trap
$2C94:    00            trap
$2C95:    00            trap
$2C96:    00            trap
$2C97:    00            trap
$2C98:    00            trap
$2C99:    00            trap
$2C9A:    00            trap
$2C9B:    00            trap
$2C9C:    00            trap
$2C9D:    00            trap
$2C9E:    00            trap
$2C9F:    00            trap
$2CA0:    00            trap
$2CA1:    00            trap
$2CA2:    00            trap
$2CA3:    00            trap
$2CA4:    00            trap
$2CA5:    00            trap
$2CA6:    00            trap
$2CA7:    00            trap
$2CA8:    00            trap
$2CA9:    00            trap
$2CAA:    00            trap
$2CAB:    00            trap
$2CAC:    00            trap
$2CAD:    00            trap
$2CAE:    00            trap
$2CAF:    00            trap
$2CB0:    00            trap
$2CB1:    00            trap
$2CB2:    00            trap
$2CB3:    00            trap
$2CB4:    00            trap
$2CB5:    00            trap
$2CB6:    00            trap
$2CB7:    00            trap
$2CB8:    00            trap
$2CB9:    00            trap
$2CBA:    00            trap
$2CBB:    00            trap
$2CBC:    00            trap
$2CBD:    00            trap
$2CBE:    00            trap
$2CBF:    00            trap
$2CC0:    00            trap
$2CC1:    00            trap
$2CC2:    00            trap
$2CC3:    00            trap
$2CC4:    00            trap
$2CC5:    00            trap
$2CC6:    00            trap
$2CC7:    00            trap
$2CC8:    00            trap
$2CC9:    00            trap
$2CCA:    00            trap
$2CCB:    00            trap
$2CCC:    00            trap
$2CCD:    00            trap
$2CCE:    00            trap
$2CCF:    00            trap
$2CD0:    00            trap
$2CD1:    00            trap
$2CD2:    00            trap
$2CD3:    00            trap
$2CD4:    00            trap
$2CD5:    00            trap
$2CD6:    00            trap
$2CD7:    00            trap
$2CD8:    00            trap
$2CD9:    00            trap
$2CDA:    00            trap
$2CDB:    00            trap
$2CDC:    00            trap
$2CDD:    00            trap
$2CDE:    00            trap
$2CDF:    00            trap
$2CE0:    00            trap
$2CE1:    00            trap
$2CE2:    00            trap
$2CE3:    00            trap
$2CE4:    00            trap
$2CE5:    00            trap
$2CE6:    00            trap
$2CE7:    00            trap
$2CE8:    00            trap
$2CE9:    00            trap
$2CEA:    00            trap
$2CEB:    00            trap
$2CEC:    00            trap
$2CED:    00            trap
$2CEE:    00            trap
$2CEF:    00            trap
$2CF0:    00            trap
$2CF1:    00            trap
$2CF2:    00            trap
$2CF3:    00            trap
$2CF4:    00            trap
$2CF5:    00            trap
$2CF6:    00            trap
$2CF7:    00            trap
$2CF8:    00            trap
$2CF9:    00            trap
$2CFA:    00            trap
$2CFB:    00            trap
$2CFC:    00            trap
$2CFD:    00            trap
$2CFE:    00            trap
$2CFF:    00            trap
$2D00:    00            trap
$2D01:    00            trap
$2D02:    00            trap
$2D03:    00            trap
$2D04:    00            trap
$2D05:    00            trap
$2D06:    00            trap
$2D07:    00            trap
$2D08:    00            trap
$2D09:    00            trap
$2D0A:    00            trap
$2D0B:    00            trap
$2D0C:    00            trap
$2D0D:    00            trap
$2D0E:    00            trap
$2D0F:    00            trap
$2D10:    00            trap
$2D11:    00            trap
$2D12:    00            trap
$2D13:    00            trap
$2D14:    00            trap
$2D15:    00            trap
$2D16:    00            trap
$2D17:    00            trap
$2D18:    00            trap
$2D19:    00            trap
$2D1A:    00            trap
$2D1B:    00            trap
$2D1C:    00            trap
$2D1D:    00            trap
$2D1E:    00            trap
$2D1F:    00            trap
$2D20:    00            trap
$2D21:    00            trap
$2D22:    00            trap
$2D23:    00            trap
$2D24:    00            trap
$2D25:    00            trap
$2D26:    00            trap
$2D27:    00            trap
$2D28:    00            trap
$2D29:    00            trap
$2D2A:    00            trap
$2D2B:    00            trap
$2D2C:    00            trap
$2D2D:    00            trap
$2D2E:    00            trap
$2D2F:    00            trap
$2D30:    00            trap
$2D31:    00            trap
$2D32:    00            trap
$2D33:    00            trap
$2D34:    00            trap
$2D35:    00            trap
$2D36:    00            trap
$2D37:    00            trap
$2D38:    00            trap
$2D39:    00            trap
$2D3A:    00            trap
$2D3B:    00            trap
$2D3C:    00            trap
$2D3D:    00            trap
$2D3E:    00            trap
$2D3F:    00            trap
$2D40:    00            trap
$2D41:    00            trap
$2D42:    00            trap
$2D43:    00            trap
$2D44:    00            trap
$2D45:    00            trap
$2D46:    00            trap
$2D47:    00            trap
$2D48:    00            trap
$2D49:    00            trap
$2D4A:    00            trap
$2D4B:    00            trap
$2D4C:    00            trap
$2D4D:    00            trap
$2D4E:    00            trap
$2D4F:    00            trap
$2D50:    00            trap
$2D51:    00            trap
$2D52:    00            trap
$2D53:    00            trap
$2D54:    00            trap
$2D55:    00            trap
$2D56:    00            trap
$2D57:    00            trap
$2D58:    00            trap
$2D59:    00            trap
$2D5A:    00            trap
$2D5B:    00            trap
$2D5C:    00            trap
$2D5D:    00            trap
$2D5E:    00            trap
$2D5F:    00            trap
$2D60:    00            trap
$2D61:    00            trap
$2D62:    00            trap
$2D63:    00            trap
$2D64:    00            trap
$2D65:    00            trap
$2D66:    00            trap
$2D67:    00            trap
$2D68:    00            trap
$2D69:    00            trap
$2D6A:    00            trap
$2D6B:    00            trap
$2D6C:    00            trap
$2D6D:    00            trap
$2D6E:    00            trap
$2D6F:    00            trap
$2D70:    00            trap
$2D71:    00            trap
$2D72:    00            trap
$2D73:    00            trap
$2D74:    00            trap
$2D75:    00            trap
$2D76:    00            trap
$2D77:    00            trap
$2D78:    00            trap
$2D79:    00            trap
$2D7A:    00            trap
$2D7B:    00            trap
$2D7C:    00            trap
$2D7D:    00            trap
$2D7E:    00            trap
$2D7F:    00            trap
$2D80:    00            trap
$2D81:    00            trap
$2D82:    00            trap
$2D83:    00            trap
$2D84:    00            trap
$2D85:    00            trap
$2D86:    00            trap
$2D87:    00            trap
$2D88:    00            trap
$2D89:    00            trap
$2D8A:    00            trap
$2D8B:    00            trap
$2D8C:    00            trap
$2D8D:    00            trap
$2D8E:    00            trap
$2D8F:    00            trap
$2D90:    00            trap
$2D91:    00            trap
$2D92:    00            trap
$2D93:    00            trap
$2D94:    00            trap
$2D95:    00            trap
$2D96:    00            trap
$2D97:    00            trap
$2D98:    00            trap
$2D99:    00            trap
$2D9A:    00            trap
$2D9B:    00            trap
$2D9C:    00            trap
$2D9D:    00            trap
$2D9E:    00            trap
$2D9F:    00            trap
$2DA0:    00            trap
$2DA1:    00            trap
$2DA2:    00            trap
$2DA3:    00            trap
$2DA4:    00            trap
$2DA5:    00            trap
$2DA6:    00            trap
$2DA7:    00            trap
$2DA8:    00            trap
$2DA9:    00            trap
$2DAA:    00            trap
$2DAB:    00            trap
$2DAC:    00            trap
$2DAD:    00            trap
$2DAE:    00            trap
$2DAF:    00            trap
$2DB0:    00            trap
$2DB1:    00            trap
$2DB2:    00            trap
$2DB3:    00            trap
$2DB4:    00            trap
$2DB5:    00            trap
$2DB6:    00            trap
$2DB7:    00            trap
$2DB8:    00            trap
$2DB9:    00            trap
$2DBA:    00            trap
$2DBB:    00            trap
$2DBC:    00            trap
$2DBD:    00            trap
$2DBE:    00            trap
$2DBF:    00            trap
$2DC0:    00            trap
$2DC1:    00            trap
$2DC2:    00            trap
$2DC3:    00            trap
$2DC4:    00            trap
$2DC5:    00            trap
$2DC6:    00            trap
$2DC7:    00            trap
$2DC8:    00            trap
$2DC9:    00            trap
$2DCA:    00            trap
$2DCB:    00            trap
$2DCC:    00            trap
$2DCD:    00            trap
$2DCE:    00            trap
$2DCF:    00            trap
$2DD0:    00            trap
$2DD1:    00            trap
$2DD2:    00            trap
$2DD3:    00            trap
$2DD4:    00            trap
$2DD5:    00            trap
$2DD6:    00            trap
$2DD7:    00            trap
$2DD8:    00            trap
$2DD9:    00            trap
$2DDA:    00            trap
$2DDB:    00            trap
$2DDC:    00            trap
$2DDD:    00            trap
$2DDE:    00            trap
$2DDF:    00            trap
$2DE0:    00            trap
$2DE1:    00            trap
$2DE2:    00            trap
$2DE3:    00            trap
$2DE4:    00            trap
$2DE5:    00            trap
$2DE6:    00            trap
$2DE7:    00            trap
$2DE8:    00            trap
$2DE9:    00            trap
$2DEA:    00            trap
$2DEB:    00            trap
$2DEC:    00            trap
$2DED:    00            trap
$2DEE:    00            trap
$2DEF:    00            trap
$2DF0:    00            trap
$2DF1:    00            trap
$2DF2:    00            trap
$2DF3:    00            trap
$2DF4:    00            trap
$2DF5:    00            trap
$2DF6:    00            trap
$2DF7:    00            trap
$2DF8:    00            trap
$2DF9:    00            trap
$2DFA:    00            trap
$2DFB:    00            trap
$2DFC:    00            trap
$2DFD:    00            trap
$2DFE:    00            trap
$2DFF:    00            trap
$2E00:    00            trap
$2E01:    00            trap
$2E02:    00            trap
$2E03:    00            trap
$2E04:    00            trap
$2E05:    00            trap
$2E06:    00            trap
$2E07:    00            trap
$2E08:    00            trap
$2E09:    00            trap
$2E0A:    00            trap
$2E0B:    00            trap
$2E0C:    00            trap
$2E0D:    00            trap
$2E0E:    00            trap
$2E0F:    00            trap
$2E10:    00            trap
$2E11:    00            trap
$2E12:    00            trap
$2E13:    00            trap
$2E14:    00            trap
$2E15:    00            trap
$2E16:    00            trap
$2E17:    00            trap
$2E18:    00            trap
$2E19:    00            trap
$2E1A:    00            trap
$2E1B:    00            trap
$2E1C:    00            trap
$2E1D:    00            trap
$2E1E:    00            trap
$2E1F:    00            trap
$2E20:    00            trap
$2E21:    00            trap
$2E22:    00            trap
$2E23:    00            trap
$2E24:    00            trap
$2E25:    00            trap
$2E26:    00            trap
$2E27:    00            trap
$2E28:    00            trap
$2E29:    00            trap
$2E2A:    00            trap
$2E2B:    00            trap
$2E2C:    00            trap
$2E2D:    00            trap
$2E2E:    00            trap
$2E2F:    00            trap
$2E30:    00            trap
$2E31:    00            trap
$2E32:    00            trap
$2E33:    00            trap
$2E34:    00            trap
$2E35:    00            trap
$2E36:    00            trap
$2E37:    00            trap
$2E38:    00            trap
$2E39:    00            trap
$2E3A:    00            trap
$2E3B:    00            trap
$2E3C:    00            trap
$2E3D:    00            trap
$2E3E:    00            trap
$2E3F:    00            trap
$2E40:    00            trap
$2E41:    00            trap
$2E42:    00            trap
$2E43:    00            trap
$2E44:    00            trap
$2E45:    00            trap
$2E46:    00            trap
$2E47:    00            trap
$2E48:    00            trap
$2E49:    00            trap
$2E4A:    00            trap
$2E4B:    00            trap
$2E4C:    00            trap
$2E4D:    00            trap
$2E4E:    00            trap
$2E4F:    00            trap
$2E50:    00            trap
$2E51:    00            trap
$2E52:    00            trap
$2E53:    00            trap
$2E54:    00            trap
$2E55:    00            trap
$2E56:    00            trap
$2E57:    00            trap
$2E58:    00            trap
$2E59:    00            trap
$2E5A:    00            trap
$2E5B:    00            trap
$2E5C:    00            trap
$2E5D:    00            trap
$2E5E:    00            trap
$2E5F:    00            trap
$2E60:    00            trap
$2E61:    00            trap
$2E62:    00            trap
$2E63:    00            trap
$2E64:    00            trap
$2E65:    00            trap
$2E66:    00            trap
$2E67:    00            trap
$2E68:    00            trap
$2E69:    00            trap
$2E6A:    00            trap
$2E6B:    00            trap
$2E6C:    00            trap
$2E6D:    00            trap
$2E6E:    00            trap
$2E6F:    00            trap
$2E70:    00            trap
$2E71:    00            trap
$2E72:    00            trap
$2E73:    00            trap
$2E74:    00            trap
$2E75:    00            trap
$2E76:    00            trap
$2E77:    00            trap
$2E78:    00            trap
$2E79:    00            trap
$2E7A:    00            trap
$2E7B:    00            trap
$2E7C:    00            trap
$2E7D:    00            trap
$2E7E:    00            trap
$2E7F:    00            trap
$2E80:    00            trap
$2E81:    00            trap
$2E82:    00            trap
$2E83:    00            trap
$2E84:    00            trap
$2E85:    00            trap
$2E86:    00            trap
$2E87:    00            trap
$2E88:    00            trap
$2E89:    00            trap
$2E8A:    00            trap
$2E8B:    00            trap
$2E8C:    00            trap
$2E8D:    00            trap
$2E8E:    00            trap
$2E8F:    00            trap
$2E90:    00            trap
$2E91:    00            trap
$2E92:    00            trap
$2E93:    00            trap
$2E94:    00            trap
$2E95:    00            trap
$2E96:    00            trap
$2E97:    00            trap
$2E98:    00            trap
$2E99:    00            trap
$2E9A:    00            trap
$2E9B:    00            trap
$2E9C:    00            trap
$2E9D:    00            trap
$2E9E:    00            trap
$2E9F:    00            trap
$2EA0:    00            trap
$2EA1:    00            trap
$2EA2:    00            trap
$2EA3:    00            trap
$2EA4:    00            trap
$2EA5:    00            trap
$2EA6:    00            trap
$2EA7:    00            trap
$2EA8:    00            trap
$2EA9:    00            trap
$2EAA:    00            trap
$2EAB:    00            trap
$2EAC:    00            trap
$2EAD:    00            trap
$2EAE:    00            trap
$2EAF:    00            trap
$2EB0:    00            trap
$2EB1:    00            trap
$2EB2:    00            trap
$2EB3:    00            trap
$2EB4:    00            trap
$2EB5:    00            trap
$2EB6:    00            trap
$2EB7:    00            trap
$2EB8:    00            trap
$2EB9:    00            trap
$2EBA:    00            trap
$2EBB:    00            trap
$2EBC:    00            trap
$2EBD:    00            trap
$2EBE:    00            trap
$2EBF:    00            trap
$2EC0:    00            trap
$2EC1:    00            trap
$2EC2:    00            trap
$2EC3:    00            trap
$2EC4:    00            trap
$2EC5:    00            trap
$2EC6:    00            trap
$2EC7:    00            trap
$2EC8:    00            trap
$2EC9:    00            trap
$2ECA:    00            trap
$2ECB:    00            trap
$2ECC:    00            trap
$2ECD:    00            trap
$2ECE:    00            trap
$2ECF:    00            trap
$2ED0:    00            trap
$2ED1:    00            trap
$2ED2:    00            trap
$2ED3:    00            trap
$2ED4:    00            trap
$2ED5:    00            trap
$2ED6:    00            trap
$2ED7:    00            trap
$2ED8:    00            trap
$2ED9:    00            trap
$2EDA:    00            trap
$2EDB:    00            trap
$2EDC:    00            trap
$2EDD:    00            trap
$2EDE:    00            trap
$2EDF:    00            trap
$2EE0:    00            trap
$2EE1:    00            trap
$2EE2:    00            trap
$2EE3:    00            trap
$2EE4:    00            trap
$2EE5:    00            trap
$2EE6:    00            trap
$2EE7:    00            trap
$2EE8:    00            trap
$2EE9:    00            trap
$2EEA:    00            trap
$2EEB:    00            trap
$2EEC:    00            trap
$2EED:    00            trap
$2EEE:    00            trap
$2EEF:    00            trap
$2EF0:    BD 00 00      mov [$0000], r0
$2EF3:    00            trap
$2EF4:    A9            inc r1
$2EF5:    00            trap
$2EF6:    7E            mov [r3], r2
$2EF7:    00            trap
$2EF8:    96            pop r2
$2EF9:    F4            fixme: unknown opcode F4
$2EFA:    21            mov r0, r1
$2EFB:    00            trap
$2EFC:    F8            fixme: unknown opcode F8
$2EFD:    FE            fixme: unknown opcode FE
$2EFE:    A1 F0 00      call.neq $00F0
$2F01:    00            trap
$2F02:    00            trap
$2F03:    00            trap
$2F04:    00            trap
$2F05:    00            trap
$2F06:    00            trap
$2F07:    00            trap
$2F08:    00            trap
$2F09:    00            trap
$2F0A:    00            trap
$2F0B:    00            trap
$2F0C:    00            trap
$2F0D:    00            trap
$2F0E:    00            trap
$2F0F:    00            trap
$2F10:    00            trap
$2F11:    00            trap
$2F12:    00            trap
$2F13:    00            trap
$2F14:    00            trap
$2F15:    00            trap
$2F16:    00            trap
$2F17:    00            trap
$2F18:    00            trap
$2F19:    00            trap
$2F1A:    00            trap
$2F1B:    00            trap
$2F1C:    00            trap
$2F1D:    00            trap
$2F1E:    00            trap
$2F1F:    00            trap
$2F20:    00            trap
$2F21:    00            trap
$2F22:    00            trap
$2F23:    00            trap
$2F24:    00            trap
$2F25:    00            trap
$2F26:    00            trap
$2F27:    00            trap
$2F28:    00            trap
$2F29:    00            trap
$2F2A:    00            trap
$2F2B:    00            trap
$2F2C:    00            trap
$2F2D:    00            trap
$2F2E:    00            trap
$2F2F:    00            trap
$2F30:    00            trap
$2F31:    00            trap
$2F32:    00            trap
$2F33:    00            trap
$2F34:    00            trap
$2F35:    00            trap
$2F36:    00            trap
$2F37:    00            trap
$2F38:    00            trap
$2F39:    00            trap
$2F3A:    00            trap
$2F3B:    00            trap
$2F3C:    00            trap
$2F3D:    00            trap
$2F3E:    00            trap
$2F3F:    00            trap
$2F40:    00            trap
$2F41:    00            trap
$2F42:    00            trap
$2F43:    00            trap
$2F44:    00            trap
$2F45:    00            trap
$2F46:    00            trap
$2F47:    00            trap
$2F48:    00            trap
$2F49:    00            trap
$2F4A:    00            trap
$2F4B:    00            trap
$2F4C:    00            trap
$2F4D:    00            trap
$2F4E:    00            trap
$2F4F:    00            trap
$2F50:    00            trap
$2F51:    00            trap
$2F52:    00            trap
$2F53:    00            trap
$2F54:    00            trap
$2F55:    00            trap
$2F56:    00            trap
$2F57:    00            trap
$2F58:    00            trap
$2F59:    00            trap
$2F5A:    00            trap
$2F5B:    00            trap
$2F5C:    00            trap
$2F5D:    00            trap
$2F5E:    00            trap
$2F5F:    00            trap
$2F60:    00            trap
$2F61:    00            trap
$2F62:    00            trap
$2F63:    00            trap
$2F64:    00            trap
$2F65:    00            trap
$2F66:    00            trap
$2F67:    00            trap
$2F68:    00            trap
$2F69:    00            trap
$2F6A:    00            trap
$2F6B:    00            trap
$2F6C:    00            trap
$2F6D:    00            trap
$2F6E:    00            trap
$2F6F:    00            trap
$2F70:    00            trap
$2F71:    00            trap
$2F72:    00            trap
$2F73:    00            trap
$2F74:    00            trap
$2F75:    00            trap
$2F76:    00            trap
$2F77:    00            trap
$2F78:    00            trap
$2F79:    00            trap
$2F7A:    00            trap
$2F7B:    00            trap
$2F7C:    00            trap
$2F7D:    00            trap
$2F7E:    00            trap
$2F7F:    00            trap
$2F80:    00            trap
$2F81:    00            trap
$2F82:    00            trap
$2F83:    00            trap
$2F84:    00            trap
$2F85:    00            trap
$2F86:    00            trap
$2F87:    00            trap
$2F88:    00            trap
$2F89:    00            trap
$2F8A:    00            trap
$2F8B:    00            trap
$2F8C:    00            trap
$2F8D:    00            trap
$2F8E:    00            trap
$2F8F:    00            trap
$2F90:    00            trap
$2F91:    00            trap
$2F92:    00            trap
$2F93:    00            trap
$2F94:    00            trap
$2F95:    00            trap
$2F96:    00            trap
$2F97:    00            trap
$2F98:    00            trap
$2F99:    00            trap
$2F9A:    00            trap
$2F9B:    00            trap
$2F9C:    00            trap
$2F9D:    00            trap
$2F9E:    00            trap
$2F9F:    00            trap
$2FA0:    00            trap
$2FA1:    00            trap
$2FA2:    00            trap
$2FA3:    00            trap
$2FA4:    00            trap
$2FA5:    00            trap
$2FA6:    00            trap
$2FA7:    00            trap
$2FA8:    00            trap
$2FA9:    00            trap
$2FAA:    00            trap
$2FAB:    00            trap
$2FAC:    00            trap
$2FAD:    00            trap
$2FAE:    00            trap
$2FAF:    00            trap
$2FB0:    00            trap
$2FB1:    00            trap
$2FB2:    00            trap
$2FB3:    00            trap
$2FB4:    00            trap
$2FB5:    00            trap
$2FB6:    00            trap
$2FB7:    00            trap
$2FB8:    00            trap
$2FB9:    00            trap
$2FBA:    00            trap
$2FBB:    00            trap
$2FBC:    00            trap
$2FBD:    00            trap
$2FBE:    00            trap
$2FBF:    00            trap
$2FC0:    00            trap
$2FC1:    00            trap
$2FC2:    00            trap
$2FC3:    00            trap
$2FC4:    00            trap
$2FC5:    00            trap
$2FC6:    00            trap
$2FC7:    00            trap
$2FC8:    00            trap
$2FC9:    00            trap
$2FCA:    00            trap
$2FCB:    00            trap
$2FCC:    00            trap
$2FCD:    00            trap
$2FCE:    00            trap
$2FCF:    00            trap
$2FD0:    00            trap
$2FD1:    00            trap
$2FD2:    00            trap
$2FD3:    00            trap
$2FD4:    00            trap
$2FD5:    00            trap
$2FD6:    00            trap
$2FD7:    00            trap
$2FD8:    00            trap
$2FD9:    00            trap
$2FDA:    00            trap
$2FDB:    00            trap
$2FDC:    00            trap
$2FDD:    00            trap
$2FDE:    00            trap
$2FDF:    00            trap
$2FE0:    00            trap
$2FE1:    00            trap
$2FE2:    00            trap
$2FE3:    00            trap
$2FE4:    00            trap
$2FE5:    00            trap
$2FE6:    00            trap
$2FE7:    00            trap
$2FE8:    00            trap
$2FE9:    00            trap
$2FEA:    00            trap
$2FEB:    00            trap
$2FEC:    00            trap
$2FED:    00            trap
$2FEE:    00            trap
$2FEF:    00            trap
$2FF0:    98 7E F3      jmp $F37E    # <None>
$2FF3:    00            trap
$2FF4:    00            trap
$2FF5:    00            trap
$2FF6:    00            trap
$2FF7:    00            trap
$2FF8:    00            trap
$2FF9:    00            trap
$2FFA:    00            trap
$2FFB:    00            trap
$2FFC:    00            trap
$2FFD:    00            trap
