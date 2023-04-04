$2000:    A7            push pc
$2001:    97            pop r3
$2002:    A5 00 20      cmp r3, $2000
$2005:    9C 0F 20      je $200F
$2008:    2B            mov r2, r3
$2009:    E2 20 01      add r2, $0120
$200C:    98 08 00      jmp $0008    # <PrintStr>
$200F:    12 81 20      mov r2, $2081
$2012:    99 08 00      call $0008    # <PrintStr>
$2015:    12 4C 21      mov r2, $214C
$2018:    13 10 00      mov r3, $0010
$201B:    99 30 00      call $0030    # <ReadStr>
$201E:    12 4C 21      mov r2, $214C
$2021:    99 38 00      call $0038    # <StrTrim>
$2024:    12 D6 20      mov r2, $20D6
$2027:    99 08 00      call $0008    # <PrintStr>
$202A:    13 00 00      mov r3, $0000
 
; r0 = 0000
; r1 = 0000
; r2 = 20D6
; r3 = 0000

$202E:    A7            push pc                     ; this is actually very relevant, this gets self-modified
$202F:    4C            mov r3, byte ptr [r0]       ; r3 = 0x00FF
$2030:    21            mov r0, r1                  ; nop
$2033:    A7            push pc                     ; pushed $2033
$2034:    71            mov [r0], r1                ; nop

$2035:    58            mov r2, [r0]                ; r2 = 0x00FF 
$2037:    65            mov byte ptr [r1], low(r1)  ; nop
$2038:    3B            add r2, r3                  ; r0 = 0000; r1 = 0000; r2 = 01FE; r3 = 00FF
$203A:    DF            fixme: unknown opcode DF    ; nop
$203B:    78            mov [r2], r0                ; nop
$203C:    37            add r1, r3                  ; r0 = 0000; r1 = 00FF; r2 = 01FE; r3 = 00FF
$203D:    4F            mov r3, byte ptr [r3]       ; r0 = 0000; r1 = 00FF; r2 = 01FE; r3 = 00FF
$203E:    21            mov r0, r1                  ; r0 = 00FF; r1 = 00FF; r2 = 01FE; r3 = 00FF
$2041:    54            mov r1, [r0]                ; r0 = 00FF; r1 = 00FF; r2 = 01FE; r3 = 00FF
$2042:    5F            mov r3, [r3]                ; r0 = 00FF; r1 = 00FF; r2 = 01FE; r3 = 00FF
$2046:    49            mov r2, byte ptr [r1]       ; r0 = 00FF; r1 = 00FF; r2 = 00FF; r3 = 00FF
$2048:    49            mov r2, byte ptr [r1]       ; r0 = 00FF; r1 = 00FF; r2 = 00FF; r3 = 00FF
$2049:    95            pop r1                      ; r0 = 00FF; r1 = 2033; r2 = 00FF; r3 = 00FF
$204B:    4D            mov r3, byte ptr [r1]       ; r0 = 00FF; r1 = 2033; r2 = 00FF; r3 = 00A7
$204C:    21            mov r0, r1                  ; r0 = 2033; r1 = 2033; r2 = 00FF; r3 = 00A7
$204D:    67            mov byte ptr [r1], low(r3)  ; nop
$2051:    5B            mov r2, [r3]                ; r0 = 2033; r1 = 2033; r2 = 00FF; r3 = 00A7 (nop)
$2053:    01 3B 58      mul r0, $583B               ; r0 = F3C1; r1 = 2033; r2 = 00FF; r3 = 00A7
$2058:    4D            mov r3, byte ptr [r1]       ; nop
$205B:    64            mov byte ptr [r1], low(r0)  ; [2033] = C1;      SELF MODIFYING CODE DETECTED
$205C:    5B            mov r2, [r3]                ; r0 = F3C1; r1 = 2033; r2 = 00FF; r3 = 00A7
$205D:    01 02 3B      mul r0, $3B02               ; r0 = 6282; r1 = 2033; r2 = 00FF; r3 = 00A7
$2060:    5B            mov r2, [r3]                ; r0 = 6282; r1 = 2033; r2 = 00FF; r3 = 00A7 (nop)
$2062:    5C            mov r3, [r0]                ; r0 = 6282; r1 = 2033; r2 = 00FF; r3 = 0000
$2063:    B0 51 21      mov r0, byte ptr [$2151]    ; r0 = 006B; r1 = 2033; r2 = 00FF; r3 = 0000

$2066:    A2 00 00      cmp r0, $0000               ; target = r0 must be zero
$2069:    9D 6D 20      jne $206D
$206C:    AB            inc r3
$206D:    A5 04 00      cmp r3, $0004               ; four correct targets reached?
$2070:    9C 7A 20      je $207A

; wrong
$2073:    12 C3 20      mov r2, $20C3
$2076:    99 08 00      call $0008    # <PrintStr>  ; after first iteration
                                                    ; r0 = 0000; r1 = 2033; r2 = 20C3; r3 = 0000
                                                    ; after x iteration
                                                    ; r0 = 0000; r1 = XXXX; r2 = 20C3; r3 = 0000
$2079:    05            ret                         ; this is a fake return, actually jumps to $202E after first iteration

; correct
$207A:    12 E5 20      mov r2, $20E5
$207D:    99 08 00      call $0008    # <PrintStr>
$2080:    05            ret


$2081:    4D            mov r3, byte ptr [r1]
$2082:    49            mov r2, byte ptr [r1]
$2083:    58            mov r2, [r0]
$2084:    2F            mov r3, r3
$2085:    55            mov r1, [r1]
$2086:    4E            mov r3, byte ptr [r2]
$2087:    4D            mov r3, byte ptr [r1]
$2088:    49            mov r2, byte ptr [r1]
$2089:    58            mov r2, [r0]
$208A:    20            mov r0, r0
$208B:    6F            mov byte ptr [r3], low(r3)
$208C:    70            mov [r0], r0
$208D:    63            mov byte ptr [r0], low(r3)
$208E:    6F            mov byte ptr [r3], low(r3)
$208F:    64            mov byte ptr [r1], low(r0)
$2090:    65            mov byte ptr [r1], low(r1)
$2091:    73            mov [r0], r3
$2092:    20            mov r0, r0
$2093:    2D            mov r3, r1
$2094:    20            mov r0, r0
$2095:    70            mov [r0], r0
$2096:    72            mov [r0], r2
$2097:    6F            mov byte ptr [r3], low(r3)
$2098:    6F            mov byte ptr [r3], low(r3)
$2099:    66            mov byte ptr [r1], low(r2)
$209A:    20            mov r0, r0
$209B:    6F            mov byte ptr [r3], low(r3)
$209C:    66            mov byte ptr [r1], low(r2)
$209D:    20            mov r0, r0
$209E:    63            mov byte ptr [r0], low(r3)
$209F:    6F            mov byte ptr [r3], low(r3)
$20A0:    6E            mov byte ptr [r3], low(r2)
$20A1:    63            mov byte ptr [r0], low(r3)
$20A2:    65            mov byte ptr [r1], low(r1)
$20A3:    70            mov [r0], r0
$20A4:    74            mov [r1], r0
$20A5:    0A            mov r0, sp
$20A6:    45            mov r1, byte ptr [r1]
$20A7:    6E            mov byte ptr [r3], low(r2)
$20A8:    74            mov [r1], r0
$20A9:    65            mov byte ptr [r1], low(r1)
$20AA:    72            mov [r0], r2
$20AB:    20            mov r0, r0
$20AC:    61            mov byte ptr [r0], low(r1)
$20AD:    20            mov r0, r0
$20AE:    70            mov [r0], r0
$20AF:    61            mov byte ptr [r0], low(r1)
$20B0:    73            mov [r0], r3
$20B1:    73            mov [r0], r3
$20B2:    77            mov [r1], r3
$20B3:    6F            mov byte ptr [r3], low(r3)
$20B4:    72            mov [r0], r2
$20B5:    64            mov byte ptr [r1], low(r0)
$20B6:    3A            add r2, r2
$20B7:    20            mov r0, r0
$20B8:    00            trap
$20B9:    41            mov r0, byte ptr [r1]
$20BA:    62            mov byte ptr [r0], low(r2)
$20BB:    6F            mov byte ptr [r3], low(r3)
$20BC:    72            mov [r0], r2
$20BD:    74            mov [r1], r0
$20BE:    65            mov byte ptr [r1], low(r1)
$20BF:    64            mov byte ptr [r1], low(r0)
$20C0:    2E            mov r3, r2
$20C1:    0A            mov r0, sp
$20C2:    00            trap
$20C3:    4E            mov r3, byte ptr [r2]
$20C4:    6F            mov byte ptr [r3], low(r3)
$20C5:    70            mov [r0], r0
$20C6:    65            mov byte ptr [r1], low(r1)
$20C7:    2C            mov r3, r0
$20C8:    20            mov r0, r0
$20C9:    69            mov byte ptr [r2], low(r1)
$20CA:    74            mov [r1], r0
$20CB:    27            mov r1, r3
$20CC:    73            mov [r0], r3
$20CD:    20            mov r0, r0
$20CE:    77            mov [r1], r3
$20CF:    72            mov [r0], r2
$20D0:    6F            mov byte ptr [r3], low(r3)
$20D1:    6E            mov byte ptr [r3], low(r2)
$20D2:    67            mov byte ptr [r1], low(r3)
$20D3:    2E            mov r3, r2
$20D4:    0A            mov r0, sp
$20D5:    00            trap
$20D6:    56            mov r1, [r2]
$20D7:    61            mov byte ptr [r0], low(r1)
$20D8:    6C            mov byte ptr [r3], low(r0)
$20D9:    69            mov byte ptr [r2], low(r1)
$20DA:    64            mov byte ptr [r1], low(r0)
$20DB:    61            mov byte ptr [r0], low(r1)
$20DC:    74            mov [r1], r0
$20DD:    69            mov byte ptr [r2], low(r1)
$20DE:    6E            mov byte ptr [r3], low(r2)
$20DF:    67            mov byte ptr [r1], low(r3)
$20E0:    2E            mov r3, r2
$20E1:    2E            mov r3, r2
$20E2:    2E            mov r3, r2
$20E3:    0A            mov r0, sp
$20E4:    00            trap
$20E5:    59            mov r2, [r1]
$20E6:    65            mov byte ptr [r1], low(r1)
$20E7:    73            mov [r0], r3
$20E8:    2C            mov r3, r0
$20E9:    20            mov r0, r0
$20EA:    69            mov byte ptr [r2], low(r1)
$20EB:    74            mov [r1], r0
$20EC:    27            mov r1, r3
$20ED:    73            mov [r0], r3
$20EE:    20            mov r0, r0
$20EF:    63            mov byte ptr [r0], low(r3)
$20F0:    6F            mov byte ptr [r3], low(r3)
$20F1:    72            mov [r0], r2
$20F2:    72            mov [r0], r2
$20F3:    65            mov byte ptr [r1], low(r1)
$20F4:    63            mov byte ptr [r0], low(r3)
$20F5:    74            mov [r1], r0
$20F6:    21            mov r0, r1
$20F7:    20            mov r0, r0
$20F8:    46            mov r1, byte ptr [r2]
$20F9:    4F            mov r3, byte ptr [r3]
$20FA:    4F            mov r3, byte ptr [r3]
$20FB:    4C            mov r3, byte ptr [r0]
$20FC:    53            mov r0, [r3]
$20FD:    32            add r0, r2
$20FE:    30            add r0, r0
$20FF:    32            add r0, r2
$2100:    33            add r0, r3
$2101:    5F            mov r3, [r3]
$2102:    7B            mov [r2], r3
$2103:    2A            mov r2, r2
$2104:    69            mov byte ptr [r2], low(r1)
$2105:    6E            mov byte ptr [r3], low(r2)
$2106:    73            mov [r0], r3
$2107:    65            mov byte ptr [r1], low(r1)
$2108:    72            mov [r0], r2
$2109:    74            mov [r1], r0
$210A:    20            mov r0, r0
$210B:    63            mov byte ptr [r0], low(r3)
$210C:    6F            mov byte ptr [r3], low(r3)
$210D:    72            mov [r0], r2
$210E:    72            mov [r0], r2
$210F:    65            mov byte ptr [r1], low(r1)
$2110:    63            mov byte ptr [r0], low(r3)
$2111:    74            mov [r1], r0
$2112:    20            mov r0, r0
$2113:    70            mov [r0], r0
$2114:    61            mov byte ptr [r0], low(r1)
$2115:    73            mov [r0], r3
$2116:    73            mov [r0], r3
$2117:    20            mov r0, r0
$2118:    68            mov byte ptr [r2], low(r0)
$2119:    65            mov byte ptr [r1], low(r1)
$211A:    72            mov [r0], r2
$211B:    65            mov byte ptr [r1], low(r1)
$211C:    2A            mov r2, r2
$211D:    7D            mov [r3], r1
$211E:    0A            mov r0, sp
$211F:    00            trap
$2120:    50            mov r0, [r0]
$2121:    6C            mov byte ptr [r3], low(r0)
$2122:    65            mov byte ptr [r1], low(r1)
$2123:    61            mov byte ptr [r0], low(r1)
$2124:    73            mov [r0], r3
$2125:    65            mov byte ptr [r1], low(r1)
$2126:    20            mov r0, r0
$2127:    6C            mov byte ptr [r3], low(r0)
$2128:    6F            mov byte ptr [r3], low(r3)
$2129:    61            mov byte ptr [r0], low(r1)
$212A:    64            mov byte ptr [r1], low(r0)
$212B:    20            mov r0, r0
$212C:    74            mov [r1], r0
$212D:    68            mov byte ptr [r2], low(r0)
$212E:    69            mov byte ptr [r2], low(r1)
$212F:    73            mov [r0], r3
$2130:    20            mov r0, r0
$2131:    70            mov [r0], r0
$2132:    72            mov [r0], r2
$2133:    6F            mov byte ptr [r3], low(r3)
$2134:    67            mov byte ptr [r1], low(r3)
$2135:    72            mov [r0], r2
$2136:    61            mov byte ptr [r0], low(r1)
$2137:    6D            mov byte ptr [r3], low(r1)
$2138:    20            mov r0, r0
$2139:    61            mov byte ptr [r0], low(r1)
$213A:    74            mov [r1], r0
$213B:    20            mov r0, r0
$213C:    61            mov byte ptr [r0], low(r1)
$213D:    64            mov byte ptr [r1], low(r0)
$213E:    64            mov byte ptr [r1], low(r0)
$213F:    72            mov [r0], r2
$2140:    65            mov byte ptr [r1], low(r1)
$2141:    73            mov [r0], r3
$2142:    73            mov [r0], r3
$2143:    20            mov r0, r0
$2144:    24            mov r1, r0
$2145:    32            add r0, r2
$2146:    30            add r0, r0
$2147:    30            add r0, r0
$2148:    30            add r0, r0
$2149:    2E            mov r3, r2
$214A:    0A            mov r0, sp
$214B:    00            trap
$214C:    5F            mov r3, [r3]
$214D:    5F            mov r3, [r3]
$214E:    5F            mov r3, [r3]
$214F:    5F            mov r3, [r3]
$2150:    5F            mov r3, [r3]
$2151:    5F            mov r3, [r3]
$2152:    5F            mov r3, [r3]
$2153:    5F            mov r3, [r3]
$2154:    5F            mov r3, [r3]
$2155:    5F            mov r3, [r3]
$2156:    5F            mov r3, [r3]
$2157:    5F            mov r3, [r3]
$2158:    5F            mov r3, [r3]
$2159:    5F            mov r3, [r3]
$215A:    5F            mov r3, [r3]
$215B:    5F            mov r3, [r3]
$215C:    5F            mov r3, [r3]
$215D:    5F            mov r3, [r3]
$215E:    5F            mov r3, [r3]
$215F:    5F            mov r3, [r3]
$2160:    5F            mov r3, [r3]
$2161:    5F            mov r3, [r3]
$2162:    5F            mov r3, [r3]
$2163:    5F            mov r3, [r3]
$2164:    00            trap
$2165:    00            trap
