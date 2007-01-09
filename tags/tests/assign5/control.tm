* C- compiler version C-06
* Author: Robert B. Heckendorn
* Backend coauthor: Jorge Williams
* Apr 1, 2006
* BEGIN Prolog
  0:     LD  0,0(0) 	Set the global pointer 
  1:    LDA  1,0(0) 	set first frame at end of globals 
  2:     ST  1,0(1) 	store old fp (point to self) 
  3:    LDA  3,1(7) 	Return address in ac 
  5:   HALT  0,0,0 	DONE! 
* END Prolog
* BEGIN function input
  6:     ST  3,-1(1) 	Store return address 
  7:     IN  2,2,2 	Grab int input 
  8:     LD  3,-1(1) 	Load return address 
  9:     LD  1,0(1) 	Adjust fp 
 10:    LDA  7,0(3) 	Return 
* END of function input
* BEGIN function output
 11:     ST  3,-1(1) 	Store return address 
 12:     LD  3,-2(1) 	Load parameter 
 13:    OUT  3,3,3 	Output integer 
 14:    LDC  2,0(6) 	Set return to 0 
 15:     LD  3,-1(1) 	Load return address 
 16:     LD  1,0(1) 	Adjust fp 
 17:    LDA  7,0(3) 	Return 
* END of function output
* BEGIN function inputb
 18:     ST  3,-1(1) 	Store return address 
 19:    INB  2,2,2 	Grab bool input 
 20:     LD  3,-1(1) 	Load return address 
 21:     LD  1,0(1) 	Adjust fp 
 22:    LDA  7,0(3) 	Return 
* END of function inputb
* BEGIN function outputb
 23:     ST  3,-1(1) 	Store return address 
 24:     LD  3,-2(1) 	Load parameter 
 25:   OUTB  3,3,3 	Output bool 
 26:    LDC  2,0(6) 	Set return to 0 
 27:     LD  3,-1(1) 	Load return address 
 28:     LD  1,0(1) 	Adjust fp 
 29:    LDA  7,0(3) 	Return 
* END of function outputb
* BEGIN function outnl
 30:     ST  3,-1(1) 	Store return address 
 31:  OUTNL  3,3,3 	Output a newline 
 32:     LD  3,-1(1) 	Load return address 
 33:     LD  1,0(1) 	Adjust fp 
 34:    LDA  7,0(3) 	Return 
* END of function outnl
* BEGIN function main
  4:    LDA  7,30(7) 	Jump to main 
 35:     ST  3,-1(1) 	Store return address. BEGIN FUNC: main
* BEGIN compound statement
* 9
 36:    LDC  3,2(6) 	Load constant 
 37:     ST  3,-2(1) 	Store variable x
* 10
 38:    LDC  3,3(6) 	Load constant 
 39:     ST  3,-3(1) 	Store variable y
* IF
 40:     LD  3,-2(1) 	Load variable x
 41:     ST  3,-4(1) 	Save left side in temp 
 42:     LD  3,-3(1) 	Load variable y
 43:     LD  4,-4(1) 	Load left from temp into ac1 
 44:    SUB  3,4,3 	Op != 
 45:    JEQ  3,1(7) 	Jump if true 
 46:    LDC  3,1(6) 	True case 
 47:    LDC  4,1(6) 	Load constant 1 
 48:    SUB  3,3,4 	If cond check 
 49:    JGE  3,1(7) 	Jump to then part 
* THEN
 50:    LDA  7,0(7) 	Jump around the THEN 
* ENDIF
* IF
 51:     LD  3,-2(1) 	Load variable x
 52:     ST  3,-4(1) 	Save left side in temp 
 53:     LD  3,-3(1) 	Load variable y
 54:     LD  4,-4(1) 	Load left from temp into ac1 
 55:    SUB  4,4,3 	Op < 
 56:    LDC  3,1(6) 	True case 
 57:    JLT  4,1(7) 	Jump if true 
 58:    LDC  3,0(6) 	False case 
 59:    LDC  4,1(6) 	Load constant 1 
 60:    SUB  3,3,4 	If cond check 
 61:    JGE  3,1(7) 	Jump to then part 
* THEN
* 13
 63:     ST  1,-4(1) 	Store old fp in ghost frame 
 64:    LDC  3,11(6) 	Load constant 
 65:     ST  3,-6(1) 	Store parameter 
 66:    LDA  1,-4(1) 	Load address of new frame 
 67:    LDA  3,1(7) 	Return address in ac 
 68:    LDA  7,-58(7) 	call output
 69:    LDA  3,0(2) 	Save the result in ac 
 62:    LDA  7,7(7) 	Jump around the THEN 
* ENDIF
* IF
 70:     LD  3,-2(1) 	Load variable x
 71:     ST  3,-4(1) 	Save left side in temp 
 72:     LD  3,-3(1) 	Load variable y
 73:     LD  4,-4(1) 	Load left from temp into ac1 
 74:    SUB  4,4,3 	Op == 
 75:    LDC  3,1(6) 	True case 
 76:    JEQ  4,1(7) 	Jump if true 
 77:    LDC  3,0(6) 	False case 
 78:    LDC  4,1(6) 	Load constant 1 
 79:    SUB  3,3,4 	If cond check 
 80:    JGE  3,1(7) 	Jump to then part 
* THEN
* 14
 82:     ST  1,-4(1) 	Store old fp in ghost frame 
 83:    LDC  3,22(6) 	Load constant 
 84:     ST  3,-6(1) 	Store parameter 
 85:    LDA  1,-4(1) 	Load address of new frame 
 86:    LDA  3,1(7) 	Return address in ac 
 87:    LDA  7,-77(7) 	call output
 88:    LDA  3,0(2) 	Save the result in ac 
* ELSE
 81:    LDA  7,8(7) 	Jump around the THEN 
* 15
 90:     ST  1,-4(1) 	Store old fp in ghost frame 
 91:    LDC  3,33(6) 	Load constant 
 92:     ST  3,-6(1) 	Store parameter 
 93:    LDA  1,-4(1) 	Load address of new frame 
 94:    LDA  3,1(7) 	Return address in ac 
 95:    LDA  7,-85(7) 	call output
 96:    LDA  3,0(2) 	Save the result in ac 
 89:    LDA  7,7(7) 	Jump around the ELSE 
* ENDIF
* IF
 97:     LD  3,-2(1) 	Load variable x
 98:     ST  3,-4(1) 	Save left side in temp 
 99:     LD  3,-3(1) 	Load variable y
100:     LD  4,-4(1) 	Load left from temp into ac1 
101:    SUB  3,4,3 	Op != 
102:    JEQ  3,1(7) 	Jump if true 
103:    LDC  3,1(6) 	True case 
104:    LDC  4,1(6) 	Load constant 1 
105:    SUB  3,3,4 	If cond check 
106:    JGE  3,1(7) 	Jump to then part 
* THEN
* IF
108:    LDC  3,1(6) 	Load constant 
109:    LDC  4,1(6) 	Load constant 1 
110:    SUB  3,3,4 	If cond check 
111:    JGE  3,1(7) 	Jump to then part 
* THEN
* 16
113:     ST  1,-4(1) 	Store old fp in ghost frame 
114:    LDC  3,22(6) 	Load constant 
115:     ST  3,-6(1) 	Store parameter 
116:    LDA  1,-4(1) 	Load address of new frame 
117:    LDA  3,1(7) 	Return address in ac 
118:    LDA  7,-108(7) 	call output
119:    LDA  3,0(2) 	Save the result in ac 
* ELSE
112:    LDA  7,8(7) 	Jump around the THEN 
* 17
121:     ST  1,-4(1) 	Store old fp in ghost frame 
122:    LDC  3,33(6) 	Load constant 
123:     ST  3,-6(1) 	Store parameter 
124:    LDA  1,-4(1) 	Load address of new frame 
125:    LDA  3,1(7) 	Return address in ac 
126:    LDA  7,-116(7) 	call output
127:    LDA  3,0(2) 	Save the result in ac 
120:    LDA  7,7(7) 	Jump around the ELSE 
* ENDIF
107:    LDA  7,20(7) 	Jump around the THEN 
* ENDIF
* IF
128:     LD  3,-2(1) 	Load variable x
129:     ST  3,-4(1) 	Save left side in temp 
130:     LD  3,-3(1) 	Load variable y
131:     LD  4,-4(1) 	Load left from temp into ac1 
132:    SUB  3,4,3 	Op != 
133:    JEQ  3,1(7) 	Jump if true 
134:    LDC  3,1(6) 	True case 
135:    LDC  4,1(6) 	Load constant 1 
136:    SUB  3,3,4 	If cond check 
137:    JGE  3,1(7) 	Jump to then part 
* THEN
* IF
139:    LDC  3,0(6) 	Load constant 
140:    LDC  4,1(6) 	Load constant 1 
141:    SUB  3,3,4 	If cond check 
142:    JGE  3,1(7) 	Jump to then part 
* THEN
* 18
144:     ST  1,-4(1) 	Store old fp in ghost frame 
145:    LDC  3,22(6) 	Load constant 
146:     ST  3,-6(1) 	Store parameter 
147:    LDA  1,-4(1) 	Load address of new frame 
148:    LDA  3,1(7) 	Return address in ac 
149:    LDA  7,-139(7) 	call output
150:    LDA  3,0(2) 	Save the result in ac 
* ELSE
143:    LDA  7,8(7) 	Jump around the THEN 
* 19
152:     ST  1,-4(1) 	Store old fp in ghost frame 
153:    LDC  3,33(6) 	Load constant 
154:     ST  3,-6(1) 	Store parameter 
155:    LDA  1,-4(1) 	Load address of new frame 
156:    LDA  3,1(7) 	Return address in ac 
157:    LDA  7,-147(7) 	call output
158:    LDA  3,0(2) 	Save the result in ac 
151:    LDA  7,7(7) 	Jump around the ELSE 
* ENDIF
138:    LDA  7,20(7) 	Jump around the THEN 
* ENDIF
* WHILE
159:     LD  3,-2(1) 	Load variable x
160:     ST  3,-4(1) 	Save left side in temp 
161:     LD  3,-3(1) 	Load variable y
162:     LD  4,-4(1) 	Load left from temp into ac1 
163:    SUB  4,4,3 	Op >= 
164:    LDC  3,1(6) 	True case 
165:    JGE  4,1(7) 	Jump if true 
166:    LDC  3,0(6) 	False case 
167:    LDC  4,1(6) 	Load constant 1 
168:    SUB  3,3,4 	While cond check 
169:    JGE  3,1(7) 	Jump to while part 
* DO
171:    LDA  7,-13(7) 	go to beginning of loop 
170:    LDA  7,1(7) 	No more loop 
* ENDWHILE
* WHILE
172:     LD  3,-2(1) 	Load variable x
173:     ST  3,-4(1) 	Save left side in temp 
174:     LD  3,-3(1) 	Load variable y
175:     LD  4,-4(1) 	Load left from temp into ac1 
176:    SUB  4,4,3 	Op < 
177:    LDC  3,1(6) 	True case 
178:    JLT  4,1(7) 	Jump if true 
179:    LDC  3,0(6) 	False case 
180:    LDC  4,1(6) 	Load constant 1 
181:    SUB  3,3,4 	While cond check 
182:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 21
184:     ST  1,-4(1) 	Store old fp in ghost frame 
185:    LDC  3,44(6) 	Load constant 
186:     ST  3,-6(1) 	Store parameter 
187:    LDA  1,-4(1) 	Load address of new frame 
188:    LDA  3,1(7) 	Return address in ac 
189:    LDA  7,-179(7) 	call output
190:    LDA  3,0(2) 	Save the result in ac 
* 21
191:    LDC  3,500(6) 	Load constant 
192:     ST  3,-2(1) 	Store variable x
* END compound statement
193:    LDA  7,-22(7) 	go to beginning of loop 
183:    LDA  7,10(7) 	No more loop 
* ENDWHILE
* 22
194:     ST  1,-4(1) 	Store old fp in ghost frame 
195:    LDA  1,-4(1) 	Load address of new frame 
196:    LDA  3,1(7) 	Return address in ac 
197:    LDA  7,-168(7) 	call outnl
198:    LDA  3,0(2) 	Save the result in ac 
* RETURN
199:    LDA  2,0(3) 	Copy result to rt register 
200:     LD  3,-1(1) 	Load return address 
201:     LD  1,0(1) 	Adjust fp 
202:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
203:    LDC  2,0(6) 	Set return value to 0 
204:     LD  3,-1(1) 	Load return address 
205:     LD  1,0(1) 	Adjust fp 
206:    LDA  7,0(3) 	Return 
* END of function main
