$1000:    A7            fixme: sub sp, 2 ????
$1001:    97            pop r3
$1002:    A5 00 20      cmp r3, $2000
$1005:    9C 0F 20      fixme: jmp/cond[???] $200F
$1008:    2B            mov r2, r3
$1009:    E2 7C 02      fixme: unknown opcode E2
$100C:    98 08 00      fixme: jmp/call $0008    # <PrintStr>
$100F:    12 5D 20      mov r2, $205D
$1012:    99 08 00      fixme: jmp/call $0008    # <PrintStr>
$1015:    12 A8 22      mov r2, $22A8
$1018:    13 07 00      mov r3, $0007
$101B:    99 30 00      fixme: jmp/call $0030    # <ReadStr>
$101E:    B4 A8 22      mov r0, [$22A8]
$1021:    A2 59 00      cmp r0, $0059
$1024:    9C 40 20      fixme: jmp/cond[???] $2040
$1027:    A2 79 00      cmp r0, $0079
$102A:    9C 40 20      fixme: jmp/cond[???] $2040
$102D:    A2 59 0A      cmp r0, $0A59
$1030:    9C 40 20      fixme: jmp/cond[???] $2040
$1033:    A2 79 0A      cmp r0, $0A79
$1036:    9C 40 20      fixme: jmp/cond[???] $2040
$1039:    12 5A 22      mov r2, $225A
$103C:    99 08 00      fixme: jmp/call $0008    # <PrintStr>
$103F:    05            ret
$1040:    06            fixme: unknown opcode 06
$1041:    66            fixme: unknown opcode 66
$1042:    06            fixme: unknown opcode 06
$1043:    64            fixme: unknown opcode 64
$1044:    99 09 30      fixme: jmp/call $3009    # <None>
$1047:    06            fixme: unknown opcode 06
$1048:    65            fixme: unknown opcode 65
$1049:    A2 02 00      cmp r0, $0002
$104C:    9C 56 20      fixme: jmp/cond[???] $2056
$104F:    A2 01 00      cmp r0, $0001
$1052:    9C 42 20      fixme: jmp/cond[???] $2042
$1055:    05            ret
$1056:    12 64 22      mov r2, $2264
$1059:    99 08 00      fixme: jmp/call $0008    # <PrintStr>
$105C:    05            ret
$105D:    47            mov r1, byte ptr [r3]
$105E:    6C            fixme: unknown opcode 6C
$105F:    69            fixme: unknown opcode 69
$1060:    74            fixme: unknown opcode 74
$1061:    63            fixme: unknown opcode 63
$1062:    68            fixme: unknown opcode 68
$1063:    20            mov r0, r0
$1064:    52            mov r0, [r2]
$1065:    65            fixme: unknown opcode 65
$1066:    73            fixme: unknown opcode 73
$1067:    65            fixme: unknown opcode 65
$1068:    61            fixme: unknown opcode 61
$1069:    72            fixme: unknown opcode 72
$106A:    63            fixme: unknown opcode 63
$106B:    68            fixme: unknown opcode 68
$106C:    20            mov r0, r0
$106D:    4C            mov r3, byte ptr [r0]
$106E:    61            fixme: unknown opcode 61
$106F:    62            fixme: unknown opcode 62
$1070:    6F            fixme: unknown opcode 6F
$1071:    72            fixme: unknown opcode 72
$1072:    61            fixme: unknown opcode 61
$1073:    74            fixme: unknown opcode 74
$1074:    6F            fixme: unknown opcode 6F
$1075:    72            fixme: unknown opcode 72
$1076:    79            fixme: unknown opcode 79
$1077:    20            mov r0, r0
$1078:    4D            mov r3, byte ptr [r1]
$1079:    61            fixme: unknown opcode 61
$107A:    74            fixme: unknown opcode 74
$107B:    68            fixme: unknown opcode 68
$107C:    20            mov r0, r0
$107D:    43            mov r0, byte ptr [r3]
$107E:    6F            fixme: unknown opcode 6F
$107F:    70            fixme: unknown opcode 70
$1080:    72            fixme: unknown opcode 72
$1081:    6F            fixme: unknown opcode 6F
$1082:    63            fixme: unknown opcode 63
$1083:    65            fixme: unknown opcode 65
$1084:    73            fixme: unknown opcode 73
$1085:    73            fixme: unknown opcode 73
$1086:    6F            fixme: unknown opcode 6F
$1087:    72            fixme: unknown opcode 72
$1088:    0A            mov r0, sp
$1089:    54            mov r1, [r0]
$108A:    65            fixme: unknown opcode 65
$108B:    73            fixme: unknown opcode 73
$108C:    74            fixme: unknown opcode 74
$108D:    69            fixme: unknown opcode 69
$108E:    6E            fixme: unknown opcode 6E
$108F:    67            fixme: unknown opcode 67
$1090:    20            mov r0, r0
$1091:    53            mov r0, [r3]
$1092:    6F            fixme: unknown opcode 6F
$1093:    66            fixme: unknown opcode 66
$1094:    74            fixme: unknown opcode 74
$1095:    77            fixme: unknown opcode 77
$1096:    61            fixme: unknown opcode 61
$1097:    72            fixme: unknown opcode 72
$1098:    65            fixme: unknown opcode 65
$1099:    3A            add r2, r2
$109A:    20            mov r0, r0
$109B:    46            mov r1, byte ptr [r2]
$109C:    75            fixme: unknown opcode 75
$109D:    6E            fixme: unknown opcode 6E
$109E:    63            fixme: unknown opcode 63
$109F:    74            fixme: unknown opcode 74
$10A0:    69            fixme: unknown opcode 69
$10A1:    6F            fixme: unknown opcode 6F
$10A2:    6E            fixme: unknown opcode 6E
$10A3:    20            mov r0, r0
$10A4:    53            mov r0, [r3]
$10A5:    51            mov r0, [r1]
$10A6:    52            mov r0, [r2]
$10A7:    54            mov r1, [r0]
$10A8:    0A            mov r0, sp
$10A9:    0A            mov r0, sp
$10AA:    54            mov r1, [r0]
$10AB:    68            fixme: unknown opcode 68
$10AC:    69            fixme: unknown opcode 69
$10AD:    73            fixme: unknown opcode 73
$10AE:    20            mov r0, r0
$10AF:    70            fixme: unknown opcode 70
$10B0:    72            fixme: unknown opcode 72
$10B1:    6F            fixme: unknown opcode 6F
$10B2:    67            fixme: unknown opcode 67
$10B3:    72            fixme: unknown opcode 72
$10B4:    61            fixme: unknown opcode 61
$10B5:    6D            fixme: unknown opcode 6D
$10B6:    20            mov r0, r0
$10B7:    77            fixme: unknown opcode 77
$10B8:    69            fixme: unknown opcode 69
$10B9:    6C            fixme: unknown opcode 6C
$10BA:    6C            fixme: unknown opcode 6C
$10BB:    20            mov r0, r0
$10BC:    74            fixme: unknown opcode 74
$10BD:    65            fixme: unknown opcode 65
$10BE:    73            fixme: unknown opcode 73
$10BF:    74            fixme: unknown opcode 74
$10C0:    20            mov r0, r0
$10C1:    74            fixme: unknown opcode 74
$10C2:    68            fixme: unknown opcode 68
$10C3:    65            fixme: unknown opcode 65
$10C4:    20            mov r0, r0
$10C5:    53            mov r0, [r3]
$10C6:    51            mov r0, [r1]
$10C7:    52            mov r0, [r2]
$10C8:    54            mov r1, [r0]
$10C9:    20            mov r0, r0
$10CA:    66            fixme: unknown opcode 66
$10CB:    75            fixme: unknown opcode 75
$10CC:    6E            fixme: unknown opcode 6E
$10CD:    63            fixme: unknown opcode 63
$10CE:    74            fixme: unknown opcode 74
$10CF:    69            fixme: unknown opcode 69
$10D0:    6F            fixme: unknown opcode 6F
$10D1:    6E            fixme: unknown opcode 6E
$10D2:    20            mov r0, r0
$10D3:    6F            fixme: unknown opcode 6F
$10D4:    66            fixme: unknown opcode 66
$10D5:    20            mov r0, r0
$10D6:    74            fixme: unknown opcode 74
$10D7:    68            fixme: unknown opcode 68
$10D8:    65            fixme: unknown opcode 65
$10D9:    20            mov r0, r0
$10DA:    6D            fixme: unknown opcode 6D
$10DB:    61            fixme: unknown opcode 61
$10DC:    74            fixme: unknown opcode 74
$10DD:    68            fixme: unknown opcode 68
$10DE:    20            mov r0, r0
$10DF:    6D            fixme: unknown opcode 6D
$10E0:    6F            fixme: unknown opcode 6F
$10E1:    64            fixme: unknown opcode 64
$10E2:    75            fixme: unknown opcode 75
$10E3:    6C            fixme: unknown opcode 6C
$10E4:    65            fixme: unknown opcode 65
$10E5:    2E            mov r3, r2
$10E6:    0A            mov r0, sp
$10E7:    54            mov r1, [r0]
$10E8:    68            fixme: unknown opcode 68
$10E9:    69            fixme: unknown opcode 69
$10EA:    73            fixme: unknown opcode 73
$10EB:    20            mov r0, r0
$10EC:    66            fixme: unknown opcode 66
$10ED:    75            fixme: unknown opcode 75
$10EE:    6E            fixme: unknown opcode 6E
$10EF:    63            fixme: unknown opcode 63
$10F0:    74            fixme: unknown opcode 74
$10F1:    69            fixme: unknown opcode 69
$10F2:    6F            fixme: unknown opcode 6F
$10F3:    6E            fixme: unknown opcode 6E
$10F4:    2C            mov r3, r0
$10F5:    20            mov r0, r0
$10F6:    65            fixme: unknown opcode 65
$10F7:    78            fixme: unknown opcode 78
$10F8:    65            fixme: unknown opcode 65
$10F9:    63            fixme: unknown opcode 63
$10FA:    75            fixme: unknown opcode 75
$10FB:    74            fixme: unknown opcode 74
$10FC:    61            fixme: unknown opcode 61
$10FD:    62            fixme: unknown opcode 62
$10FE:    6C            fixme: unknown opcode 6C
$10FF:    65            fixme: unknown opcode 65
$1100:    20            mov r0, r0
$1101:    77            fixme: unknown opcode 77
$1102:    69            fixme: unknown opcode 69
$1103:    74            fixme: unknown opcode 74
$1104:    68            fixme: unknown opcode 68
$1105:    20            mov r0, r0
$1106:    43            mov r0, byte ptr [r3]
$1107:    41            mov r0, byte ptr [r1]
$1108:    4C            mov r3, byte ptr [r0]
$1109:    4C            mov r3, byte ptr [r0]
$110A:    20            mov r0, r0
$110B:    30            add r0, r0
$110C:    78            fixme: unknown opcode 78
$110D:    33            add r0, r3
$110E:    30            add r0, r0
$110F:    30            add r0, r0
$1110:    39            add r2, r1
$1111:    2C            mov r3, r0
$1112:    20            mov r0, r0
$1113:    73            fixme: unknown opcode 73
$1114:    68            fixme: unknown opcode 68
$1115:    6F            fixme: unknown opcode 6F
$1116:    75            fixme: unknown opcode 75
$1117:    6C            fixme: unknown opcode 6C
$1118:    64            fixme: unknown opcode 64
$1119:    20            mov r0, r0
$111A:    63            fixme: unknown opcode 63
$111B:    6F            fixme: unknown opcode 6F
$111C:    6D            fixme: unknown opcode 6D
$111D:    70            fixme: unknown opcode 70
$111E:    75            fixme: unknown opcode 75
$111F:    74            fixme: unknown opcode 74
$1120:    65            fixme: unknown opcode 65
$1121:    20            mov r0, r0
$1122:    74            fixme: unknown opcode 74
$1123:    68            fixme: unknown opcode 68
$1124:    65            fixme: unknown opcode 65
$1125:    0A            mov r0, sp
$1126:    69            fixme: unknown opcode 69
$1127:    6E            fixme: unknown opcode 6E
$1128:    74            fixme: unknown opcode 74
$1129:    65            fixme: unknown opcode 65
$112A:    67            fixme: unknown opcode 67
$112B:    65            fixme: unknown opcode 65
$112C:    72            fixme: unknown opcode 72
$112D:    20            mov r0, r0
$112E:    70            fixme: unknown opcode 70
$112F:    61            fixme: unknown opcode 61
$1130:    72            fixme: unknown opcode 72
$1131:    74            fixme: unknown opcode 74
$1132:    20            mov r0, r0
$1133:    6F            fixme: unknown opcode 6F
$1134:    66            fixme: unknown opcode 66
$1135:    20            mov r0, r0
$1136:    73            fixme: unknown opcode 73
$1137:    71            fixme: unknown opcode 71
$1138:    72            fixme: unknown opcode 72
$1139:    74            fixme: unknown opcode 74
$113A:    28            mov r2, r0
$113B:    52            mov r0, [r2]
$113C:    30            add r0, r0
$113D:    29            mov r2, r1
$113E:    20            mov r0, r0
$113F:    61            fixme: unknown opcode 61
$1140:    6E            fixme: unknown opcode 6E
$1141:    64            fixme: unknown opcode 64
$1142:    20            mov r0, r0
$1143:    72            fixme: unknown opcode 72
$1144:    65            fixme: unknown opcode 65
$1145:    74            fixme: unknown opcode 74
$1146:    75            fixme: unknown opcode 75
$1147:    72            fixme: unknown opcode 72
$1148:    6E            fixme: unknown opcode 6E
$1149:    20            mov r0, r0
$114A:    69            fixme: unknown opcode 69
$114B:    74            fixme: unknown opcode 74
$114C:    20            mov r0, r0
$114D:    69            fixme: unknown opcode 69
$114E:    6E            fixme: unknown opcode 6E
$114F:    20            mov r0, r0
$1150:    52            mov r0, [r2]
$1151:    30            add r0, r0
$1152:    20            mov r0, r0
$1153:    28            mov r2, r0
$1154:    70            fixme: unknown opcode 70
$1155:    72            fixme: unknown opcode 72
$1156:    65            fixme: unknown opcode 65
$1157:    73            fixme: unknown opcode 73
$1158:    65            fixme: unknown opcode 65
$1159:    72            fixme: unknown opcode 72
$115A:    76            fixme: unknown opcode 76
$115B:    69            fixme: unknown opcode 69
$115C:    6E            fixme: unknown opcode 6E
$115D:    67            fixme: unknown opcode 67
$115E:    20            mov r0, r0
$115F:    52            mov r0, [r2]
$1160:    31            add r0, r1
$1161:    2D            mov r3, r1
$1162:    52            mov r0, [r2]
$1163:    33            add r0, r3
$1164:    29            mov r2, r1
$1165:    2E            mov r3, r2
$1166:    0A            mov r0, sp
$1167:    0A            mov r0, sp
$1168:    4D            mov r3, byte ptr [r1]
$1169:    61            fixme: unknown opcode 61
$116A:    74            fixme: unknown opcode 74
$116B:    68            fixme: unknown opcode 68
$116C:    20            mov r0, r0
$116D:    6D            fixme: unknown opcode 6D
$116E:    6F            fixme: unknown opcode 6F
$116F:    64            fixme: unknown opcode 64
$1170:    75            fixme: unknown opcode 75
$1171:    6C            fixme: unknown opcode 6C
$1172:    65            fixme: unknown opcode 65
$1173:    20            mov r0, r0
$1174:    72            fixme: unknown opcode 72
$1175:    65            fixme: unknown opcode 65
$1176:    73            fixme: unknown opcode 73
$1177:    75            fixme: unknown opcode 75
$1178:    6C            fixme: unknown opcode 6C
$1179:    74            fixme: unknown opcode 74
$117A:    73            fixme: unknown opcode 73
$117B:    20            mov r0, r0
$117C:    77            fixme: unknown opcode 77
$117D:    69            fixme: unknown opcode 69
$117E:    6C            fixme: unknown opcode 6C
$117F:    6C            fixme: unknown opcode 6C
$1180:    20            mov r0, r0
$1181:    62            fixme: unknown opcode 62
$1182:    65            fixme: unknown opcode 65
$1183:    20            mov r0, r0
$1184:    63            fixme: unknown opcode 63
$1185:    6F            fixme: unknown opcode 6F
$1186:    6D            fixme: unknown opcode 6D
$1187:    70            fixme: unknown opcode 70
$1188:    61            fixme: unknown opcode 61
$1189:    72            fixme: unknown opcode 72
$118A:    65            fixme: unknown opcode 65
$118B:    64            fixme: unknown opcode 64
$118C:    20            mov r0, r0
$118D:    77            fixme: unknown opcode 77
$118E:    69            fixme: unknown opcode 69
$118F:    74            fixme: unknown opcode 74
$1190:    68            fixme: unknown opcode 68
$1191:    20            mov r0, r0
$1192:    74            fixme: unknown opcode 74
$1193:    68            fixme: unknown opcode 68
$1194:    65            fixme: unknown opcode 65
$1195:    20            mov r0, r0
$1196:    63            fixme: unknown opcode 63
$1197:    6F            fixme: unknown opcode 6F
$1198:    70            fixme: unknown opcode 70
$1199:    72            fixme: unknown opcode 72
$119A:    6F            fixme: unknown opcode 6F
$119B:    63            fixme: unknown opcode 63
$119C:    65            fixme: unknown opcode 65
$119D:    73            fixme: unknown opcode 73
$119E:    73            fixme: unknown opcode 73
$119F:    6F            fixme: unknown opcode 6F
$11A0:    72            fixme: unknown opcode 72
$11A1:    2E            mov r3, r2
$11A2:    0A            mov r0, sp
$11A3:    4E            mov r3, byte ptr [r2]
$11A4:    6F            fixme: unknown opcode 6F
$11A5:    74            fixme: unknown opcode 74
$11A6:    65            fixme: unknown opcode 65
$11A7:    20            mov r0, r0
$11A8:    2D            mov r3, r1
$11A9:    20            mov r0, r0
$11AA:    69            fixme: unknown opcode 69
$11AB:    66            fixme: unknown opcode 66
$11AC:    20            mov r0, r0
$11AD:    6D            fixme: unknown opcode 6D
$11AE:    61            fixme: unknown opcode 61
$11AF:    74            fixme: unknown opcode 74
$11B0:    68            fixme: unknown opcode 68
$11B1:    20            mov r0, r0
$11B2:    6D            fixme: unknown opcode 6D
$11B3:    6F            fixme: unknown opcode 6F
$11B4:    64            fixme: unknown opcode 64
$11B5:    75            fixme: unknown opcode 75
$11B6:    6C            fixme: unknown opcode 6C
$11B7:    65            fixme: unknown opcode 65
$11B8:    20            mov r0, r0
$11B9:    69            fixme: unknown opcode 69
$11BA:    73            fixme: unknown opcode 73
$11BB:    20            mov r0, r0
$11BC:    6E            fixme: unknown opcode 6E
$11BD:    6F            fixme: unknown opcode 6F
$11BE:    74            fixme: unknown opcode 74
$11BF:    20            mov r0, r0
$11C0:    6C            fixme: unknown opcode 6C
$11C1:    6F            fixme: unknown opcode 6F
$11C2:    61            fixme: unknown opcode 61
$11C3:    64            fixme: unknown opcode 64
$11C4:    65            fixme: unknown opcode 65
$11C5:    64            fixme: unknown opcode 64
$11C6:    2C            mov r3, r0
$11C7:    20            mov r0, r0
$11C8:    74            fixme: unknown opcode 74
$11C9:    68            fixme: unknown opcode 68
$11CA:    69            fixme: unknown opcode 69
$11CB:    73            fixme: unknown opcode 73
$11CC:    20            mov r0, r0
$11CD:    74            fixme: unknown opcode 74
$11CE:    65            fixme: unknown opcode 65
$11CF:    73            fixme: unknown opcode 73
$11D0:    74            fixme: unknown opcode 74
$11D1:    20            mov r0, r0
$11D2:    6D            fixme: unknown opcode 6D
$11D3:    69            fixme: unknown opcode 69
$11D4:    67            fixme: unknown opcode 67
$11D5:    68            fixme: unknown opcode 68
$11D6:    74            fixme: unknown opcode 74
$11D7:    20            mov r0, r0
$11D8:    63            fixme: unknown opcode 63
$11D9:    72            fixme: unknown opcode 72
$11DA:    61            fixme: unknown opcode 61
$11DB:    73            fixme: unknown opcode 73
$11DC:    68            fixme: unknown opcode 68
$11DD:    20            mov r0, r0
$11DE:    74            fixme: unknown opcode 74
$11DF:    68            fixme: unknown opcode 68
$11E0:    65            fixme: unknown opcode 65
$11E1:    20            mov r0, r0
$11E2:    6D            fixme: unknown opcode 6D
$11E3:    61            fixme: unknown opcode 61
$11E4:    63            fixme: unknown opcode 63
$11E5:    68            fixme: unknown opcode 68
$11E6:    69            fixme: unknown opcode 69
$11E7:    6E            fixme: unknown opcode 6E
$11E8:    65            fixme: unknown opcode 65
$11E9:    21            mov r0, r1
$11EA:    0A            mov r0, sp
$11EB:    52            mov r0, [r2]
$11EC:    65            fixme: unknown opcode 65
$11ED:    70            fixme: unknown opcode 70
$11EE:    6F            fixme: unknown opcode 6F
$11EF:    72            fixme: unknown opcode 72
$11F0:    74            fixme: unknown opcode 74
$11F1:    20            mov r0, r0
$11F2:    61            fixme: unknown opcode 61
$11F3:    6E            fixme: unknown opcode 6E
$11F4:    79            fixme: unknown opcode 79
$11F5:    20            mov r0, r0
$11F6:    62            fixme: unknown opcode 62
$11F7:    75            fixme: unknown opcode 75
$11F8:    67            fixme: unknown opcode 67
$11F9:    73            fixme: unknown opcode 73
$11FA:    20            mov r0, r0
$11FB:    74            fixme: unknown opcode 74
$11FC:    6F            fixme: unknown opcode 6F
$11FD:    20            mov r0, r0
$11FE:    61            fixme: unknown opcode 61
$11FF:    64            fixme: unknown opcode 64
$1200:    6D            fixme: unknown opcode 6D
$1201:    69            fixme: unknown opcode 69
$1202:    6E            fixme: unknown opcode 6E
$1203:    69            fixme: unknown opcode 69
$1204:    73            fixme: unknown opcode 73
$1205:    74            fixme: unknown opcode 74
$1206:    72            fixme: unknown opcode 72
$1207:    61            fixme: unknown opcode 61
$1208:    74            fixme: unknown opcode 74
$1209:    6F            fixme: unknown opcode 6F
$120A:    72            fixme: unknown opcode 72
$120B:    3A            add r2, r2
$120C:    20            mov r0, r0
$120D:    61            fixme: unknown opcode 61
$120E:    78            fixme: unknown opcode 78
$120F:    2E            mov r3, r2
$1210:    61            fixme: unknown opcode 61
$1211:    72            fixme: unknown opcode 72
$1212:    77            fixme: unknown opcode 77
$1213:    65            fixme: unknown opcode 65
$1214:    6E            fixme: unknown opcode 6E
$1215:    40            mov r0, byte ptr [r0]
$1216:    67            fixme: unknown opcode 67
$1217:    6C            fixme: unknown opcode 6C
$1218:    69            fixme: unknown opcode 69
$1219:    74            fixme: unknown opcode 74
$121A:    63            fixme: unknown opcode 63
$121B:    68            fixme: unknown opcode 68
$121C:    6C            fixme: unknown opcode 6C
$121D:    61            fixme: unknown opcode 61
$121E:    62            fixme: unknown opcode 62
$121F:    73            fixme: unknown opcode 73
$1220:    72            fixme: unknown opcode 72
$1221:    65            fixme: unknown opcode 65
$1222:    73            fixme: unknown opcode 73
$1223:    65            fixme: unknown opcode 65
$1224:    61            fixme: unknown opcode 61
$1225:    72            fixme: unknown opcode 72
$1226:    63            fixme: unknown opcode 63
$1227:    68            fixme: unknown opcode 68
$1228:    2E            mov r3, r2
$1229:    69            fixme: unknown opcode 69
$122A:    6E            fixme: unknown opcode 6E
$122B:    74            fixme: unknown opcode 74
$122C:    65            fixme: unknown opcode 65
$122D:    72            fixme: unknown opcode 72
$122E:    6E            fixme: unknown opcode 6E
$122F:    61            fixme: unknown opcode 61
$1230:    6C            fixme: unknown opcode 6C
$1231:    0A            mov r0, sp
$1232:    0A            mov r0, sp
$1233:    43            mov r0, byte ptr [r3]
$1234:    6F            fixme: unknown opcode 6F
$1235:    6E            fixme: unknown opcode 6E
$1236:    74            fixme: unknown opcode 74
$1237:    69            fixme: unknown opcode 69
$1238:    6E            fixme: unknown opcode 6E
$1239:    75            fixme: unknown opcode 75
$123A:    65            fixme: unknown opcode 65
$123B:    20            mov r0, r0
$123C:    77            fixme: unknown opcode 77
$123D:    69            fixme: unknown opcode 69
$123E:    74            fixme: unknown opcode 74
$123F:    68            fixme: unknown opcode 68
$1240:    20            mov r0, r0
$1241:    72            fixme: unknown opcode 72
$1242:    75            fixme: unknown opcode 75
$1243:    6E            fixme: unknown opcode 6E
$1244:    6E            fixme: unknown opcode 6E
$1245:    69            fixme: unknown opcode 69
$1246:    6E            fixme: unknown opcode 6E
$1247:    67            fixme: unknown opcode 67
$1248:    20            mov r0, r0
$1249:    74            fixme: unknown opcode 74
$124A:    68            fixme: unknown opcode 68
$124B:    65            fixme: unknown opcode 65
$124C:    20            mov r0, r0
$124D:    74            fixme: unknown opcode 74
$124E:    65            fixme: unknown opcode 65
$124F:    73            fixme: unknown opcode 73
$1250:    74            fixme: unknown opcode 74
$1251:    20            mov r0, r0
$1252:    28            mov r2, r0
$1253:    59            mov r2, [r1]
$1254:    2F            mov r3, r3
$1255:    4E            mov r3, byte ptr [r2]
$1256:    29            mov r2, r1
$1257:    3A            add r2, r2
$1258:    20            mov r0, r0
$1259:    00            trap
$125A:    41            mov r0, byte ptr [r1]
$125B:    62            fixme: unknown opcode 62
$125C:    6F            fixme: unknown opcode 6F
$125D:    72            fixme: unknown opcode 72
$125E:    74            fixme: unknown opcode 74
$125F:    65            fixme: unknown opcode 65
$1260:    64            fixme: unknown opcode 64
$1261:    2E            mov r3, r2
$1262:    0A            mov r0, sp
$1263:    00            trap
$1264:    54            mov r1, [r0]
$1265:    65            fixme: unknown opcode 65
$1266:    73            fixme: unknown opcode 73
$1267:    74            fixme: unknown opcode 74
$1268:    20            mov r0, r0
$1269:    77            fixme: unknown opcode 77
$126A:    61            fixme: unknown opcode 61
$126B:    73            fixme: unknown opcode 73
$126C:    20            mov r0, r0
$126D:    75            fixme: unknown opcode 75
$126E:    6E            fixme: unknown opcode 6E
$126F:    73            fixme: unknown opcode 73
$1270:    75            fixme: unknown opcode 75
$1271:    63            fixme: unknown opcode 63
$1272:    63            fixme: unknown opcode 63
$1273:    65            fixme: unknown opcode 65
$1274:    73            fixme: unknown opcode 73
$1275:    73            fixme: unknown opcode 73
$1276:    66            fixme: unknown opcode 66
$1277:    75            fixme: unknown opcode 75
$1278:    6C            fixme: unknown opcode 6C
$1279:    2E            mov r3, r2
$127A:    0A            mov r0, sp
$127B:    00            trap
$127C:    50            mov r0, [r0]
$127D:    6C            fixme: unknown opcode 6C
$127E:    65            fixme: unknown opcode 65
$127F:    61            fixme: unknown opcode 61
$1280:    73            fixme: unknown opcode 73
$1281:    65            fixme: unknown opcode 65
$1282:    20            mov r0, r0
$1283:    6C            fixme: unknown opcode 6C
$1284:    6F            fixme: unknown opcode 6F
$1285:    61            fixme: unknown opcode 61
$1286:    64            fixme: unknown opcode 64
$1287:    20            mov r0, r0
$1288:    74            fixme: unknown opcode 74
$1289:    68            fixme: unknown opcode 68
$128A:    69            fixme: unknown opcode 69
$128B:    73            fixme: unknown opcode 73
$128C:    20            mov r0, r0
$128D:    70            fixme: unknown opcode 70
$128E:    72            fixme: unknown opcode 72
$128F:    6F            fixme: unknown opcode 6F
$1290:    67            fixme: unknown opcode 67
$1291:    72            fixme: unknown opcode 72
$1292:    61            fixme: unknown opcode 61
$1293:    6D            fixme: unknown opcode 6D
$1294:    20            mov r0, r0
$1295:    61            fixme: unknown opcode 61
$1296:    74            fixme: unknown opcode 74
$1297:    20            mov r0, r0
$1298:    61            fixme: unknown opcode 61
$1299:    64            fixme: unknown opcode 64
$129A:    64            fixme: unknown opcode 64
$129B:    72            fixme: unknown opcode 72
$129C:    65            fixme: unknown opcode 65
$129D:    73            fixme: unknown opcode 73
$129E:    73            fixme: unknown opcode 73
$129F:    20            mov r0, r0
$12A0:    24            mov r1, r0
$12A1:    32            add r0, r2
$12A2:    30            add r0, r0
$12A3:    30            add r0, r0
$12A4:    30            add r0, r0
$12A5:    2E            mov r3, r2
$12A6:    0A            mov r0, sp
$12A7:    00            trap
$12A8:    5F            mov r3, [r3]
$12A9:    5F            mov r3, [r3]
$12AA:    5F            mov r3, [r3]
$12AB:    5F            mov r3, [r3]
$12AC:    5F            mov r3, [r3]
$12AD:    5F            mov r3, [r3]
$12AE:    5F            mov r3, [r3]
