* C- compiler version C-06
* Author: Robert B. Heckendorn
* Backend coauthor: Jorge Williams
* Apr 1, 2006
* BEGIN Prolog
  0:     LD  0,0(0) 	Set the global pointer 
  1:    LDA  1,-11(0) 	set first frame at end of globals 
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
* BEGIN function minloc
 35:     ST  3,-1(1) 	Store return address. BEGIN FUNC: minloc
* BEGIN compound statement
* 14
 36:     LD  3,-3(1) 	Load variable low
 37:     ST  3,-7(1) 	Store variable k
* 15
 38:     LD  3,-3(1) 	Load variable low
 39:     LD  4,-2(1) 	Load address of base of array a
 40:    SUB  3,4,3 	Compute offset of value 
 41:     LD  3,0(3) 	Load the value 
 42:     ST  3,-6(1) 	Store variable x
* 16
 43:     LD  3,-3(1) 	Load variable low
 44:     ST  3,-8(1) 	Save left side in temp 
 45:    LDC  3,1(6) 	Load constant 
 46:     LD  4,-8(1) 	Load left from temp into ac1 
 47:    ADD  3,4,3 	Op + 
 48:     ST  3,-5(1) 	Store variable i
* WHILE
 49:     LD  3,-5(1) 	Load variable i
 50:     ST  3,-8(1) 	Save left side in temp 
 51:     LD  3,-4(1) 	Load variable high
 52:     LD  4,-8(1) 	Load left from temp into ac1 
 53:    SUB  4,4,3 	Op < 
 54:    LDC  3,1(6) 	True case 
 55:    JLT  4,1(7) 	Jump if true 
 56:    LDC  3,0(6) 	False case 
 57:    LDC  4,1(6) 	Load constant 1 
 58:    SUB  3,3,4 	While cond check 
 59:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* IF
 61:     LD  3,-5(1) 	Load variable i
 62:     LD  4,-2(1) 	Load address of base of array a
 63:    SUB  3,4,3 	Compute offset of value 
 64:     LD  3,0(3) 	Load the value 
 65:     ST  3,-8(1) 	Save left side in temp 
 66:     LD  3,-6(1) 	Load variable x
 67:     LD  4,-8(1) 	Load left from temp into ac1 
 68:    SUB  4,4,3 	Op < 
 69:    LDC  3,1(6) 	True case 
 70:    JLT  4,1(7) 	Jump if true 
 71:    LDC  3,0(6) 	False case 
 72:    LDC  4,1(6) 	Load constant 1 
 73:    SUB  3,3,4 	If cond check 
 74:    JGE  3,1(7) 	Jump to then part 
* THEN
* BEGIN compound statement
* 20
 76:     LD  3,-5(1) 	Load variable i
 77:     LD  4,-2(1) 	Load address of base of array a
 78:    SUB  3,4,3 	Compute offset of value 
 79:     LD  3,0(3) 	Load the value 
 80:     ST  3,-6(1) 	Store variable x
* 21
 81:     LD  3,-5(1) 	Load variable i
 82:     ST  3,-7(1) 	Store variable k
* END compound statement
 75:    LDA  7,7(7) 	Jump around the THEN 
* ENDIF
* 23
 83:     LD  3,-5(1) 	Load variable i
 84:     ST  3,-8(1) 	Save left side in temp 
 85:    LDC  3,1(6) 	Load constant 
 86:     LD  4,-8(1) 	Load left from temp into ac1 
 87:    ADD  3,4,3 	Op + 
 88:     ST  3,-5(1) 	Store variable i
* END compound statement
 89:    LDA  7,-41(7) 	go to beginning of loop 
 60:    LDA  7,29(7) 	No more loop 
* ENDWHILE
* RETURN
 90:     LD  3,-7(1) 	Load variable k
 91:    LDA  2,0(3) 	Copy result to rt register 
 92:     LD  3,-1(1) 	Load return address 
 93:     LD  1,0(1) 	Adjust fp 
 94:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
 95:    LDC  2,0(6) 	Set return value to 0 
 96:     LD  3,-1(1) 	Load return address 
 97:     LD  1,0(1) 	Adjust fp 
 98:    LDA  7,0(3) 	Return 
* END of function minloc
* BEGIN function sort
 99:     ST  3,-1(1) 	Store return address. BEGIN FUNC: sort
* BEGIN compound statement
* 36
100:     LD  3,-3(1) 	Load variable low
101:     ST  3,-5(1) 	Store variable i
* WHILE
102:     LD  3,-5(1) 	Load variable i
103:     ST  3,-8(1) 	Save left side in temp 
104:     LD  3,-4(1) 	Load variable high
105:     ST  3,-9(1) 	Save left side in temp 
106:    LDC  3,1(6) 	Load constant 
107:     LD  4,-9(1) 	Load left from temp into ac1 
108:    SUB  3,4,3 	Op - 
109:     LD  4,-8(1) 	Load left from temp into ac1 
110:    SUB  4,4,3 	Op < 
111:    LDC  3,1(6) 	True case 
112:    JLT  4,1(7) 	Jump if true 
113:    LDC  3,0(6) 	False case 
114:    LDC  4,1(6) 	Load constant 1 
115:    SUB  3,3,4 	While cond check 
116:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 40
118:     ST  1,-8(1) 	Store old fp in ghost frame 
119:     LD  3,-2(1) 	Load address of base of array a
120:     ST  3,-10(1) 	Store parameter 
121:     LD  3,-5(1) 	Load variable i
122:     ST  3,-11(1) 	Store parameter 
123:     LD  3,-4(1) 	Load variable high
124:     ST  3,-12(1) 	Store parameter 
125:    LDA  1,-8(1) 	Load address of new frame 
126:    LDA  3,1(7) 	Return address in ac 
127:    LDA  7,-93(7) 	call minloc
128:    LDA  3,0(2) 	Save the result in ac 
129:     ST  3,-6(1) 	Store variable k
* 41
130:     LD  3,-6(1) 	Load variable k
131:     LD  4,-2(1) 	Load address of base of array a
132:    SUB  3,4,3 	Compute offset of value 
133:     LD  3,0(3) 	Load the value 
134:     ST  3,-7(1) 	Store variable t
* 42
135:     LD  3,-6(1) 	Load variable k
136:     ST  3,-8(1) 	Save index in temp 
137:     LD  3,-5(1) 	Load variable i
138:     LD  4,-2(1) 	Load address of base of array a
139:    SUB  3,4,3 	Compute offset of value 
140:     LD  3,0(3) 	Load the value 
141:     LD  4,-8(1) 	load index from temp to ac1 
142:     LD  5,-2(1) 	Load address of base of array a
143:    SUB  5,5,4 	Compute offset of value 
144:     ST  3,0(5) 	Store variable a
* 43
145:     LD  3,-5(1) 	Load variable i
146:     ST  3,-8(1) 	Save index in temp 
147:     LD  3,-7(1) 	Load variable t
148:     LD  4,-8(1) 	load index from temp to ac1 
149:     LD  5,-2(1) 	Load address of base of array a
150:    SUB  5,5,4 	Compute offset of value 
151:     ST  3,0(5) 	Store variable a
* 44
152:     LD  3,-5(1) 	Load variable i
153:     ST  3,-8(1) 	Save left side in temp 
154:    LDC  3,1(6) 	Load constant 
155:     LD  4,-8(1) 	Load left from temp into ac1 
156:    ADD  3,4,3 	Op + 
157:     ST  3,-5(1) 	Store variable i
* END compound statement
158:    LDA  7,-57(7) 	go to beginning of loop 
117:    LDA  7,41(7) 	No more loop 
* ENDWHILE
* END compound statement
* Add standard closing in case there is no return statement
159:    LDC  2,0(6) 	Set return value to 0 
160:     LD  3,-1(1) 	Load return address 
161:     LD  1,0(1) 	Adjust fp 
162:    LDA  7,0(3) 	Return 
* END of function sort
* BEGIN function main
  4:    LDA  7,158(7) 	Jump to main 
163:     ST  3,-1(1) 	Store return address. BEGIN FUNC: main
* BEGIN compound statement
* 54
164:     ST  1,-3(1) 	Store old fp in ghost frame 
165:    LDA  1,-3(1) 	Load address of new frame 
166:    LDA  3,1(7) 	Return address in ac 
167:    LDA  7,-162(7) 	call input
168:    LDA  3,0(2) 	Save the result in ac 
169:     ST  3,0(0) 	Store variable size
* 56
170:    LDC  3,0(6) 	Load constant 
171:     ST  3,-2(1) 	Store variable i
* WHILE
172:     LD  3,-2(1) 	Load variable i
173:     ST  3,-3(1) 	Save left side in temp 
174:     LD  3,0(0) 	Load variable size
175:     LD  4,-3(1) 	Load left from temp into ac1 
176:    SUB  4,4,3 	Op < 
177:    LDC  3,1(6) 	True case 
178:    JLT  4,1(7) 	Jump if true 
179:    LDC  3,0(6) 	False case 
180:    LDC  4,1(6) 	Load constant 1 
181:    SUB  3,3,4 	While cond check 
182:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 58
184:     LD  3,-2(1) 	Load variable i
185:     ST  3,-3(1) 	Save index in temp 
186:     ST  1,-4(1) 	Store old fp in ghost frame 
187:    LDA  1,-4(1) 	Load address of new frame 
188:    LDA  3,1(7) 	Return address in ac 
189:    LDA  7,-184(7) 	call input
190:    LDA  3,0(2) 	Save the result in ac 
191:     LD  4,-3(1) 	load index from temp to ac1 
192:    LDA  5,-1(0) 	Load address of base of array x
193:    SUB  5,5,4 	Compute offset of value 
194:     ST  3,0(5) 	Store variable x
* 59
195:     LD  3,-2(1) 	Load variable i
196:     ST  3,-3(1) 	Save left side in temp 
197:    LDC  3,1(6) 	Load constant 
198:     LD  4,-3(1) 	Load left from temp into ac1 
199:    ADD  3,4,3 	Op + 
200:     ST  3,-2(1) 	Store variable i
* END compound statement
201:    LDA  7,-30(7) 	go to beginning of loop 
183:    LDA  7,18(7) 	No more loop 
* ENDWHILE
* 62
202:     ST  1,-3(1) 	Store old fp in ghost frame 
203:    LDA  3,-1(0) 	Load address of base of array x
204:     ST  3,-5(1) 	Store parameter 
205:    LDC  3,0(6) 	Load constant 
206:     ST  3,-6(1) 	Store parameter 
207:     LD  3,0(0) 	Load variable size
208:     ST  3,-7(1) 	Store parameter 
209:    LDA  1,-3(1) 	Load address of new frame 
210:    LDA  3,1(7) 	Return address in ac 
211:    LDA  7,-113(7) 	call sort
212:    LDA  3,0(2) 	Save the result in ac 
* 64
213:    LDC  3,0(6) 	Load constant 
214:     ST  3,-2(1) 	Store variable i
* WHILE
215:     LD  3,-2(1) 	Load variable i
216:     ST  3,-3(1) 	Save left side in temp 
217:     LD  3,0(0) 	Load variable size
218:     LD  4,-3(1) 	Load left from temp into ac1 
219:    SUB  4,4,3 	Op < 
220:    LDC  3,1(6) 	True case 
221:    JLT  4,1(7) 	Jump if true 
222:    LDC  3,0(6) 	False case 
223:    LDC  4,1(6) 	Load constant 1 
224:    SUB  3,3,4 	While cond check 
225:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 66
227:     ST  1,-3(1) 	Store old fp in ghost frame 
228:     LD  3,-2(1) 	Load variable i
229:    LDA  4,-1(0) 	Load address of base of array x
230:    SUB  3,4,3 	Compute offset of value 
231:     LD  3,0(3) 	Load the value 
232:     ST  3,-5(1) 	Store parameter 
233:    LDA  1,-3(1) 	Load address of new frame 
234:    LDA  3,1(7) 	Return address in ac 
235:    LDA  7,-225(7) 	call output
236:    LDA  3,0(2) 	Save the result in ac 
* 67
237:     LD  3,-2(1) 	Load variable i
238:     ST  3,-3(1) 	Save left side in temp 
239:    LDC  3,1(6) 	Load constant 
240:     LD  4,-3(1) 	Load left from temp into ac1 
241:    ADD  3,4,3 	Op + 
242:     ST  3,-2(1) 	Store variable i
* END compound statement
243:    LDA  7,-29(7) 	go to beginning of loop 
226:    LDA  7,17(7) 	No more loop 
* ENDWHILE
* END compound statement
* Add standard closing in case there is no return statement
244:    LDC  2,0(6) 	Set return value to 0 
245:     LD  3,-1(1) 	Load return address 
246:     LD  1,0(1) 	Adjust fp 
247:    LDA  7,0(3) 	Return 
* END of function main
