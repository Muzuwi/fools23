$2000:    A7            push pc
$2001:    97            pop r3
$2002:    A5 00 20      cmp r3, $2000
$2005:    9C 0F 20      je $200F
$2008:    2B            mov r2, r3
$2009:    E2 7C 02      add r2, $027C
$200C:    98 08 00      jmp $0008    # <PrintStr>
$200F:    12 5D 20      mov r2, $205D
$2012:    99 08 00      call $0008    # <PrintStr>
$2015:    12 A8 22      mov r2, $22A8
$2018:    13 07 00      mov r3, $0007
$201B:    99 30 00      call $0030    # <ReadStr>
$201E:    B4 A8 22      mov r0, [$22A8]
$2021:    A2 59 00      cmp r0, $0059
$2024:    9C 40 20      je $2040
$2027:    A2 79 00      cmp r0, $0079
$202A:    9C 40 20      je $2040
$202D:    A2 59 0A      cmp r0, $0A59
$2030:    9C 40 20      je $2040
$2033:    A2 79 0A      cmp r0, $0A79
$2036:    9C 40 20      je $2040
$2039:    12 5A 22      mov r2, $225A
$203C:    99 08 00      call $0008    # <PrintStr>
$203F:    05            ret
$2040:    06 66         in r0, char
$2042:    06 64         in r0, char
$2044:    99 09 30      call $3009    # <None>
$2047:    06 65         in r0, char
$2049:    A2 02 00      cmp r0, $0002
$204C:    9C 56 20      je $2056
$204F:    A2 01 00      cmp r0, $0001
$2052:    9C 42 20      je $2042
$2055:    05            ret
$2056:    12 64 22      mov r2, $2264
$2059:    99 08 00      call $0008    # <PrintStr>
$205C:    05            ret
$205D:    47            mov r1, byte ptr [r3]
$205E:    6C            mov byte ptr [r3], low(r0)
$205F:    69            mov byte ptr [r2], low(r1)
$2060:    74            mov [r1], r0
$2061:    63            mov byte ptr [r0], low(r3)
$2062:    68            mov byte ptr [r2], low(r0)
$2063:    20            mov r0, r0
$2064:    52            mov r0, [r2]
$2065:    65            mov byte ptr [r1], low(r1)
$2066:    73            mov [r0], r3
$2067:    65            mov byte ptr [r1], low(r1)
$2068:    61            mov byte ptr [r0], low(r1)
$2069:    72            mov [r0], r2
$206A:    63            mov byte ptr [r0], low(r3)
$206B:    68            mov byte ptr [r2], low(r0)
$206C:    20            mov r0, r0
$206D:    4C            mov r3, byte ptr [r0]
$206E:    61            mov byte ptr [r0], low(r1)
$206F:    62            mov byte ptr [r0], low(r2)
$2070:    6F            mov byte ptr [r3], low(r3)
$2071:    72            mov [r0], r2
$2072:    61            mov byte ptr [r0], low(r1)
$2073:    74            mov [r1], r0
$2074:    6F            mov byte ptr [r3], low(r3)
$2075:    72            mov [r0], r2
$2076:    79            mov [r2], r1
$2077:    20            mov r0, r0
$2078:    4D            mov r3, byte ptr [r1]
$2079:    61            mov byte ptr [r0], low(r1)
$207A:    74            mov [r1], r0
$207B:    68            mov byte ptr [r2], low(r0)
$207C:    20            mov r0, r0
$207D:    43            mov r0, byte ptr [r3]
$207E:    6F            mov byte ptr [r3], low(r3)
$207F:    70            mov [r0], r0
$2080:    72            mov [r0], r2
$2081:    6F            mov byte ptr [r3], low(r3)
$2082:    63            mov byte ptr [r0], low(r3)
$2083:    65            mov byte ptr [r1], low(r1)
$2084:    73            mov [r0], r3
$2085:    73            mov [r0], r3
$2086:    6F            mov byte ptr [r3], low(r3)
$2087:    72            mov [r0], r2
$2088:    0A            mov r0, sp
$2089:    54            mov r1, [r0]
$208A:    65            mov byte ptr [r1], low(r1)
$208B:    73            mov [r0], r3
$208C:    74            mov [r1], r0
$208D:    69            mov byte ptr [r2], low(r1)
$208E:    6E            mov byte ptr [r3], low(r2)
$208F:    67            mov byte ptr [r1], low(r3)
$2090:    20            mov r0, r0
$2091:    53            mov r0, [r3]
$2092:    6F            mov byte ptr [r3], low(r3)
$2093:    66            mov byte ptr [r1], low(r2)
$2094:    74            mov [r1], r0
$2095:    77            mov [r1], r3
$2096:    61            mov byte ptr [r0], low(r1)
$2097:    72            mov [r0], r2
$2098:    65            mov byte ptr [r1], low(r1)
$2099:    3A            add r2, r2
$209A:    20            mov r0, r0
$209B:    46            mov r1, byte ptr [r2]
$209C:    75            mov [r1], r1
$209D:    6E            mov byte ptr [r3], low(r2)
$209E:    63            mov byte ptr [r0], low(r3)
$209F:    74            mov [r1], r0
$20A0:    69            mov byte ptr [r2], low(r1)
$20A1:    6F            mov byte ptr [r3], low(r3)
$20A2:    6E            mov byte ptr [r3], low(r2)
$20A3:    20            mov r0, r0
$20A4:    53            mov r0, [r3]
$20A5:    51            mov r0, [r1]
$20A6:    52            mov r0, [r2]
$20A7:    54            mov r1, [r0]
$20A8:    0A            mov r0, sp
$20A9:    0A            mov r0, sp
$20AA:    54            mov r1, [r0]
$20AB:    68            mov byte ptr [r2], low(r0)
$20AC:    69            mov byte ptr [r2], low(r1)
$20AD:    73            mov [r0], r3
$20AE:    20            mov r0, r0
$20AF:    70            mov [r0], r0
$20B0:    72            mov [r0], r2
$20B1:    6F            mov byte ptr [r3], low(r3)
$20B2:    67            mov byte ptr [r1], low(r3)
$20B3:    72            mov [r0], r2
$20B4:    61            mov byte ptr [r0], low(r1)
$20B5:    6D            mov byte ptr [r3], low(r1)
$20B6:    20            mov r0, r0
$20B7:    77            mov [r1], r3
$20B8:    69            mov byte ptr [r2], low(r1)
$20B9:    6C            mov byte ptr [r3], low(r0)
$20BA:    6C            mov byte ptr [r3], low(r0)
$20BB:    20            mov r0, r0
$20BC:    74            mov [r1], r0
$20BD:    65            mov byte ptr [r1], low(r1)
$20BE:    73            mov [r0], r3
$20BF:    74            mov [r1], r0
$20C0:    20            mov r0, r0
$20C1:    74            mov [r1], r0
$20C2:    68            mov byte ptr [r2], low(r0)
$20C3:    65            mov byte ptr [r1], low(r1)
$20C4:    20            mov r0, r0
$20C5:    53            mov r0, [r3]
$20C6:    51            mov r0, [r1]
$20C7:    52            mov r0, [r2]
$20C8:    54            mov r1, [r0]
$20C9:    20            mov r0, r0
$20CA:    66            mov byte ptr [r1], low(r2)
$20CB:    75            mov [r1], r1
$20CC:    6E            mov byte ptr [r3], low(r2)
$20CD:    63            mov byte ptr [r0], low(r3)
$20CE:    74            mov [r1], r0
$20CF:    69            mov byte ptr [r2], low(r1)
$20D0:    6F            mov byte ptr [r3], low(r3)
$20D1:    6E            mov byte ptr [r3], low(r2)
$20D2:    20            mov r0, r0
$20D3:    6F            mov byte ptr [r3], low(r3)
$20D4:    66            mov byte ptr [r1], low(r2)
$20D5:    20            mov r0, r0
$20D6:    74            mov [r1], r0
$20D7:    68            mov byte ptr [r2], low(r0)
$20D8:    65            mov byte ptr [r1], low(r1)
$20D9:    20            mov r0, r0
$20DA:    6D            mov byte ptr [r3], low(r1)
$20DB:    61            mov byte ptr [r0], low(r1)
$20DC:    74            mov [r1], r0
$20DD:    68            mov byte ptr [r2], low(r0)
$20DE:    20            mov r0, r0
$20DF:    6D            mov byte ptr [r3], low(r1)
$20E0:    6F            mov byte ptr [r3], low(r3)
$20E1:    64            mov byte ptr [r1], low(r0)
$20E2:    75            mov [r1], r1
$20E3:    6C            mov byte ptr [r3], low(r0)
$20E4:    65            mov byte ptr [r1], low(r1)
$20E5:    2E            mov r3, r2
$20E6:    0A            mov r0, sp
$20E7:    54            mov r1, [r0]
$20E8:    68            mov byte ptr [r2], low(r0)
$20E9:    69            mov byte ptr [r2], low(r1)
$20EA:    73            mov [r0], r3
$20EB:    20            mov r0, r0
$20EC:    66            mov byte ptr [r1], low(r2)
$20ED:    75            mov [r1], r1
$20EE:    6E            mov byte ptr [r3], low(r2)
$20EF:    63            mov byte ptr [r0], low(r3)
$20F0:    74            mov [r1], r0
$20F1:    69            mov byte ptr [r2], low(r1)
$20F2:    6F            mov byte ptr [r3], low(r3)
$20F3:    6E            mov byte ptr [r3], low(r2)
$20F4:    2C            mov r3, r0
$20F5:    20            mov r0, r0
$20F6:    65            mov byte ptr [r1], low(r1)
$20F7:    78            mov [r2], r0
$20F8:    65            mov byte ptr [r1], low(r1)
$20F9:    63            mov byte ptr [r0], low(r3)
$20FA:    75            mov [r1], r1
$20FB:    74            mov [r1], r0
$20FC:    61            mov byte ptr [r0], low(r1)
$20FD:    62            mov byte ptr [r0], low(r2)
$20FE:    6C            mov byte ptr [r3], low(r0)
$20FF:    65            mov byte ptr [r1], low(r1)
$2100:    20            mov r0, r0
$2101:    77            mov [r1], r3
$2102:    69            mov byte ptr [r2], low(r1)
$2103:    74            mov [r1], r0
$2104:    68            mov byte ptr [r2], low(r0)
$2105:    20            mov r0, r0
$2106:    43            mov r0, byte ptr [r3]
$2107:    41            mov r0, byte ptr [r1]
$2108:    4C            mov r3, byte ptr [r0]
$2109:    4C            mov r3, byte ptr [r0]
$210A:    20            mov r0, r0
$210B:    30            add r0, r0
$210C:    78            mov [r2], r0
$210D:    33            add r0, r3
$210E:    30            add r0, r0
$210F:    30            add r0, r0
$2110:    39            add r2, r1
$2111:    2C            mov r3, r0
$2112:    20            mov r0, r0
$2113:    73            mov [r0], r3
$2114:    68            mov byte ptr [r2], low(r0)
$2115:    6F            mov byte ptr [r3], low(r3)
$2116:    75            mov [r1], r1
$2117:    6C            mov byte ptr [r3], low(r0)
$2118:    64            mov byte ptr [r1], low(r0)
$2119:    20            mov r0, r0
$211A:    63            mov byte ptr [r0], low(r3)
$211B:    6F            mov byte ptr [r3], low(r3)
$211C:    6D            mov byte ptr [r3], low(r1)
$211D:    70            mov [r0], r0
$211E:    75            mov [r1], r1
$211F:    74            mov [r1], r0
$2120:    65            mov byte ptr [r1], low(r1)
$2121:    20            mov r0, r0
$2122:    74            mov [r1], r0
$2123:    68            mov byte ptr [r2], low(r0)
$2124:    65            mov byte ptr [r1], low(r1)
$2125:    0A            mov r0, sp
$2126:    69            mov byte ptr [r2], low(r1)
$2127:    6E            mov byte ptr [r3], low(r2)
$2128:    74            mov [r1], r0
$2129:    65            mov byte ptr [r1], low(r1)
$212A:    67            mov byte ptr [r1], low(r3)
$212B:    65            mov byte ptr [r1], low(r1)
$212C:    72            mov [r0], r2
$212D:    20            mov r0, r0
$212E:    70            mov [r0], r0
$212F:    61            mov byte ptr [r0], low(r1)
$2130:    72            mov [r0], r2
$2131:    74            mov [r1], r0
$2132:    20            mov r0, r0
$2133:    6F            mov byte ptr [r3], low(r3)
$2134:    66            mov byte ptr [r1], low(r2)
$2135:    20            mov r0, r0
$2136:    73            mov [r0], r3
$2137:    71            mov [r0], r1
$2138:    72            mov [r0], r2
$2139:    74            mov [r1], r0
$213A:    28            mov r2, r0
$213B:    52            mov r0, [r2]
$213C:    30            add r0, r0
$213D:    29            mov r2, r1
$213E:    20            mov r0, r0
$213F:    61            mov byte ptr [r0], low(r1)
$2140:    6E            mov byte ptr [r3], low(r2)
$2141:    64            mov byte ptr [r1], low(r0)
$2142:    20            mov r0, r0
$2143:    72            mov [r0], r2
$2144:    65            mov byte ptr [r1], low(r1)
$2145:    74            mov [r1], r0
$2146:    75            mov [r1], r1
$2147:    72            mov [r0], r2
$2148:    6E            mov byte ptr [r3], low(r2)
$2149:    20            mov r0, r0
$214A:    69            mov byte ptr [r2], low(r1)
$214B:    74            mov [r1], r0
$214C:    20            mov r0, r0
$214D:    69            mov byte ptr [r2], low(r1)
$214E:    6E            mov byte ptr [r3], low(r2)
$214F:    20            mov r0, r0
$2150:    52            mov r0, [r2]
$2151:    30            add r0, r0
$2152:    20            mov r0, r0
$2153:    28            mov r2, r0
$2154:    70            mov [r0], r0
$2155:    72            mov [r0], r2
$2156:    65            mov byte ptr [r1], low(r1)
$2157:    73            mov [r0], r3
$2158:    65            mov byte ptr [r1], low(r1)
$2159:    72            mov [r0], r2
$215A:    76            mov [r1], r2
$215B:    69            mov byte ptr [r2], low(r1)
$215C:    6E            mov byte ptr [r3], low(r2)
$215D:    67            mov byte ptr [r1], low(r3)
$215E:    20            mov r0, r0
$215F:    52            mov r0, [r2]
$2160:    31            add r0, r1
$2161:    2D            mov r3, r1
$2162:    52            mov r0, [r2]
$2163:    33            add r0, r3
$2164:    29            mov r2, r1
$2165:    2E            mov r3, r2
$2166:    0A            mov r0, sp
$2167:    0A            mov r0, sp
$2168:    4D            mov r3, byte ptr [r1]
$2169:    61            mov byte ptr [r0], low(r1)
$216A:    74            mov [r1], r0
$216B:    68            mov byte ptr [r2], low(r0)
$216C:    20            mov r0, r0
$216D:    6D            mov byte ptr [r3], low(r1)
$216E:    6F            mov byte ptr [r3], low(r3)
$216F:    64            mov byte ptr [r1], low(r0)
$2170:    75            mov [r1], r1
$2171:    6C            mov byte ptr [r3], low(r0)
$2172:    65            mov byte ptr [r1], low(r1)
$2173:    20            mov r0, r0
$2174:    72            mov [r0], r2
$2175:    65            mov byte ptr [r1], low(r1)
$2176:    73            mov [r0], r3
$2177:    75            mov [r1], r1
$2178:    6C            mov byte ptr [r3], low(r0)
$2179:    74            mov [r1], r0
$217A:    73            mov [r0], r3
$217B:    20            mov r0, r0
$217C:    77            mov [r1], r3
$217D:    69            mov byte ptr [r2], low(r1)
$217E:    6C            mov byte ptr [r3], low(r0)
$217F:    6C            mov byte ptr [r3], low(r0)
$2180:    20            mov r0, r0
$2181:    62            mov byte ptr [r0], low(r2)
$2182:    65            mov byte ptr [r1], low(r1)
$2183:    20            mov r0, r0
$2184:    63            mov byte ptr [r0], low(r3)
$2185:    6F            mov byte ptr [r3], low(r3)
$2186:    6D            mov byte ptr [r3], low(r1)
$2187:    70            mov [r0], r0
$2188:    61            mov byte ptr [r0], low(r1)
$2189:    72            mov [r0], r2
$218A:    65            mov byte ptr [r1], low(r1)
$218B:    64            mov byte ptr [r1], low(r0)
$218C:    20            mov r0, r0
$218D:    77            mov [r1], r3
$218E:    69            mov byte ptr [r2], low(r1)
$218F:    74            mov [r1], r0
$2190:    68            mov byte ptr [r2], low(r0)
$2191:    20            mov r0, r0
$2192:    74            mov [r1], r0
$2193:    68            mov byte ptr [r2], low(r0)
$2194:    65            mov byte ptr [r1], low(r1)
$2195:    20            mov r0, r0
$2196:    63            mov byte ptr [r0], low(r3)
$2197:    6F            mov byte ptr [r3], low(r3)
$2198:    70            mov [r0], r0
$2199:    72            mov [r0], r2
$219A:    6F            mov byte ptr [r3], low(r3)
$219B:    63            mov byte ptr [r0], low(r3)
$219C:    65            mov byte ptr [r1], low(r1)
$219D:    73            mov [r0], r3
$219E:    73            mov [r0], r3
$219F:    6F            mov byte ptr [r3], low(r3)
$21A0:    72            mov [r0], r2
$21A1:    2E            mov r3, r2
$21A2:    0A            mov r0, sp
$21A3:    4E            mov r3, byte ptr [r2]
$21A4:    6F            mov byte ptr [r3], low(r3)
$21A5:    74            mov [r1], r0
$21A6:    65            mov byte ptr [r1], low(r1)
$21A7:    20            mov r0, r0
$21A8:    2D            mov r3, r1
$21A9:    20            mov r0, r0
$21AA:    69            mov byte ptr [r2], low(r1)
$21AB:    66            mov byte ptr [r1], low(r2)
$21AC:    20            mov r0, r0
$21AD:    6D            mov byte ptr [r3], low(r1)
$21AE:    61            mov byte ptr [r0], low(r1)
$21AF:    74            mov [r1], r0
$21B0:    68            mov byte ptr [r2], low(r0)
$21B1:    20            mov r0, r0
$21B2:    6D            mov byte ptr [r3], low(r1)
$21B3:    6F            mov byte ptr [r3], low(r3)
$21B4:    64            mov byte ptr [r1], low(r0)
$21B5:    75            mov [r1], r1
$21B6:    6C            mov byte ptr [r3], low(r0)
$21B7:    65            mov byte ptr [r1], low(r1)
$21B8:    20            mov r0, r0
$21B9:    69            mov byte ptr [r2], low(r1)
$21BA:    73            mov [r0], r3
$21BB:    20            mov r0, r0
$21BC:    6E            mov byte ptr [r3], low(r2)
$21BD:    6F            mov byte ptr [r3], low(r3)
$21BE:    74            mov [r1], r0
$21BF:    20            mov r0, r0
$21C0:    6C            mov byte ptr [r3], low(r0)
$21C1:    6F            mov byte ptr [r3], low(r3)
$21C2:    61            mov byte ptr [r0], low(r1)
$21C3:    64            mov byte ptr [r1], low(r0)
$21C4:    65            mov byte ptr [r1], low(r1)
$21C5:    64            mov byte ptr [r1], low(r0)
$21C6:    2C            mov r3, r0
$21C7:    20            mov r0, r0
$21C8:    74            mov [r1], r0
$21C9:    68            mov byte ptr [r2], low(r0)
$21CA:    69            mov byte ptr [r2], low(r1)
$21CB:    73            mov [r0], r3
$21CC:    20            mov r0, r0
$21CD:    74            mov [r1], r0
$21CE:    65            mov byte ptr [r1], low(r1)
$21CF:    73            mov [r0], r3
$21D0:    74            mov [r1], r0
$21D1:    20            mov r0, r0
$21D2:    6D            mov byte ptr [r3], low(r1)
$21D3:    69            mov byte ptr [r2], low(r1)
$21D4:    67            mov byte ptr [r1], low(r3)
$21D5:    68            mov byte ptr [r2], low(r0)
$21D6:    74            mov [r1], r0
$21D7:    20            mov r0, r0
$21D8:    63            mov byte ptr [r0], low(r3)
$21D9:    72            mov [r0], r2
$21DA:    61            mov byte ptr [r0], low(r1)
$21DB:    73            mov [r0], r3
$21DC:    68            mov byte ptr [r2], low(r0)
$21DD:    20            mov r0, r0
$21DE:    74            mov [r1], r0
$21DF:    68            mov byte ptr [r2], low(r0)
$21E0:    65            mov byte ptr [r1], low(r1)
$21E1:    20            mov r0, r0
$21E2:    6D            mov byte ptr [r3], low(r1)
$21E3:    61            mov byte ptr [r0], low(r1)
$21E4:    63            mov byte ptr [r0], low(r3)
$21E5:    68            mov byte ptr [r2], low(r0)
$21E6:    69            mov byte ptr [r2], low(r1)
$21E7:    6E            mov byte ptr [r3], low(r2)
$21E8:    65            mov byte ptr [r1], low(r1)
$21E9:    21            mov r0, r1
$21EA:    0A            mov r0, sp
$21EB:    52            mov r0, [r2]
$21EC:    65            mov byte ptr [r1], low(r1)
$21ED:    70            mov [r0], r0
$21EE:    6F            mov byte ptr [r3], low(r3)
$21EF:    72            mov [r0], r2
$21F0:    74            mov [r1], r0
$21F1:    20            mov r0, r0
$21F2:    61            mov byte ptr [r0], low(r1)
$21F3:    6E            mov byte ptr [r3], low(r2)
$21F4:    79            mov [r2], r1
$21F5:    20            mov r0, r0
$21F6:    62            mov byte ptr [r0], low(r2)
$21F7:    75            mov [r1], r1
$21F8:    67            mov byte ptr [r1], low(r3)
$21F9:    73            mov [r0], r3
$21FA:    20            mov r0, r0
$21FB:    74            mov [r1], r0
$21FC:    6F            mov byte ptr [r3], low(r3)
$21FD:    20            mov r0, r0
$21FE:    61            mov byte ptr [r0], low(r1)
$21FF:    64            mov byte ptr [r1], low(r0)
$2200:    6D            mov byte ptr [r3], low(r1)
$2201:    69            mov byte ptr [r2], low(r1)
$2202:    6E            mov byte ptr [r3], low(r2)
$2203:    69            mov byte ptr [r2], low(r1)
$2204:    73            mov [r0], r3
$2205:    74            mov [r1], r0
$2206:    72            mov [r0], r2
$2207:    61            mov byte ptr [r0], low(r1)
$2208:    74            mov [r1], r0
$2209:    6F            mov byte ptr [r3], low(r3)
$220A:    72            mov [r0], r2
$220B:    3A            add r2, r2
$220C:    20            mov r0, r0
$220D:    61            mov byte ptr [r0], low(r1)
$220E:    78            mov [r2], r0
$220F:    2E            mov r3, r2
$2210:    61            mov byte ptr [r0], low(r1)
$2211:    72            mov [r0], r2
$2212:    77            mov [r1], r3
$2213:    65            mov byte ptr [r1], low(r1)
$2214:    6E            mov byte ptr [r3], low(r2)
$2215:    40            mov r0, byte ptr [r0]
$2216:    67            mov byte ptr [r1], low(r3)
$2217:    6C            mov byte ptr [r3], low(r0)
$2218:    69            mov byte ptr [r2], low(r1)
$2219:    74            mov [r1], r0
$221A:    63            mov byte ptr [r0], low(r3)
$221B:    68            mov byte ptr [r2], low(r0)
$221C:    6C            mov byte ptr [r3], low(r0)
$221D:    61            mov byte ptr [r0], low(r1)
$221E:    62            mov byte ptr [r0], low(r2)
$221F:    73            mov [r0], r3
$2220:    72            mov [r0], r2
$2221:    65            mov byte ptr [r1], low(r1)
$2222:    73            mov [r0], r3
$2223:    65            mov byte ptr [r1], low(r1)
$2224:    61            mov byte ptr [r0], low(r1)
$2225:    72            mov [r0], r2
$2226:    63            mov byte ptr [r0], low(r3)
$2227:    68            mov byte ptr [r2], low(r0)
$2228:    2E            mov r3, r2
$2229:    69            mov byte ptr [r2], low(r1)
$222A:    6E            mov byte ptr [r3], low(r2)
$222B:    74            mov [r1], r0
$222C:    65            mov byte ptr [r1], low(r1)
$222D:    72            mov [r0], r2
$222E:    6E            mov byte ptr [r3], low(r2)
$222F:    61            mov byte ptr [r0], low(r1)
$2230:    6C            mov byte ptr [r3], low(r0)
$2231:    0A            mov r0, sp
$2232:    0A            mov r0, sp
$2233:    43            mov r0, byte ptr [r3]
$2234:    6F            mov byte ptr [r3], low(r3)
$2235:    6E            mov byte ptr [r3], low(r2)
$2236:    74            mov [r1], r0
$2237:    69            mov byte ptr [r2], low(r1)
$2238:    6E            mov byte ptr [r3], low(r2)
$2239:    75            mov [r1], r1
$223A:    65            mov byte ptr [r1], low(r1)
$223B:    20            mov r0, r0
$223C:    77            mov [r1], r3
$223D:    69            mov byte ptr [r2], low(r1)
$223E:    74            mov [r1], r0
$223F:    68            mov byte ptr [r2], low(r0)
$2240:    20            mov r0, r0
$2241:    72            mov [r0], r2
$2242:    75            mov [r1], r1
$2243:    6E            mov byte ptr [r3], low(r2)
$2244:    6E            mov byte ptr [r3], low(r2)
$2245:    69            mov byte ptr [r2], low(r1)
$2246:    6E            mov byte ptr [r3], low(r2)
$2247:    67            mov byte ptr [r1], low(r3)
$2248:    20            mov r0, r0
$2249:    74            mov [r1], r0
$224A:    68            mov byte ptr [r2], low(r0)
$224B:    65            mov byte ptr [r1], low(r1)
$224C:    20            mov r0, r0
$224D:    74            mov [r1], r0
$224E:    65            mov byte ptr [r1], low(r1)
$224F:    73            mov [r0], r3
$2250:    74            mov [r1], r0
$2251:    20            mov r0, r0
$2252:    28            mov r2, r0
$2253:    59            mov r2, [r1]
$2254:    2F            mov r3, r3
$2255:    4E            mov r3, byte ptr [r2]
$2256:    29            mov r2, r1
$2257:    3A            add r2, r2
$2258:    20            mov r0, r0
$2259:    00            trap
$225A:    41            mov r0, byte ptr [r1]
$225B:    62            mov byte ptr [r0], low(r2)
$225C:    6F            mov byte ptr [r3], low(r3)
$225D:    72            mov [r0], r2
$225E:    74            mov [r1], r0
$225F:    65            mov byte ptr [r1], low(r1)
$2260:    64            mov byte ptr [r1], low(r0)
$2261:    2E            mov r3, r2
$2262:    0A            mov r0, sp
$2263:    00            trap
$2264:    54            mov r1, [r0]
$2265:    65            mov byte ptr [r1], low(r1)
$2266:    73            mov [r0], r3
$2267:    74            mov [r1], r0
$2268:    20            mov r0, r0
$2269:    77            mov [r1], r3
$226A:    61            mov byte ptr [r0], low(r1)
$226B:    73            mov [r0], r3
$226C:    20            mov r0, r0
$226D:    75            mov [r1], r1
$226E:    6E            mov byte ptr [r3], low(r2)
$226F:    73            mov [r0], r3
$2270:    75            mov [r1], r1
$2271:    63            mov byte ptr [r0], low(r3)
$2272:    63            mov byte ptr [r0], low(r3)
$2273:    65            mov byte ptr [r1], low(r1)
$2274:    73            mov [r0], r3
$2275:    73            mov [r0], r3
$2276:    66            mov byte ptr [r1], low(r2)
$2277:    75            mov [r1], r1
$2278:    6C            mov byte ptr [r3], low(r0)
$2279:    2E            mov r3, r2
$227A:    0A            mov r0, sp
$227B:    00            trap
$227C:    50            mov r0, [r0]
$227D:    6C            mov byte ptr [r3], low(r0)
$227E:    65            mov byte ptr [r1], low(r1)
$227F:    61            mov byte ptr [r0], low(r1)
$2280:    73            mov [r0], r3
$2281:    65            mov byte ptr [r1], low(r1)
$2282:    20            mov r0, r0
$2283:    6C            mov byte ptr [r3], low(r0)
$2284:    6F            mov byte ptr [r3], low(r3)
$2285:    61            mov byte ptr [r0], low(r1)
$2286:    64            mov byte ptr [r1], low(r0)
$2287:    20            mov r0, r0
$2288:    74            mov [r1], r0
$2289:    68            mov byte ptr [r2], low(r0)
$228A:    69            mov byte ptr [r2], low(r1)
$228B:    73            mov [r0], r3
$228C:    20            mov r0, r0
$228D:    70            mov [r0], r0
$228E:    72            mov [r0], r2
$228F:    6F            mov byte ptr [r3], low(r3)
$2290:    67            mov byte ptr [r1], low(r3)
$2291:    72            mov [r0], r2
$2292:    61            mov byte ptr [r0], low(r1)
$2293:    6D            mov byte ptr [r3], low(r1)
$2294:    20            mov r0, r0
$2295:    61            mov byte ptr [r0], low(r1)
$2296:    74            mov [r1], r0
$2297:    20            mov r0, r0
$2298:    61            mov byte ptr [r0], low(r1)
$2299:    64            mov byte ptr [r1], low(r0)
$229A:    64            mov byte ptr [r1], low(r0)
$229B:    72            mov [r0], r2
$229C:    65            mov byte ptr [r1], low(r1)
$229D:    73            mov [r0], r3
$229E:    73            mov [r0], r3
$229F:    20            mov r0, r0
$22A0:    24            mov r1, r0
$22A1:    32            add r0, r2
$22A2:    30            add r0, r0
$22A3:    30            add r0, r0
$22A4:    30            add r0, r0
$22A5:    2E            mov r3, r2
$22A6:    0A            mov r0, sp
$22A7:    00            trap
$22A8:    5F            mov r3, [r3]
$22A9:    5F            mov r3, [r3]
$22AA:    5F            mov r3, [r3]
$22AB:    5F            mov r3, [r3]
$22AC:    5F            mov r3, [r3]
$22AD:    5F            mov r3, [r3]
$22AE:    5F            mov r3, [r3]
