* C- compiler version 1.0
* Author: Robert B. Heckendorn
* Apr 13, 2004
* BEGIN Prolog
  0:     LD  0,0(0) 	set the global pointer 
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
* BEGIN function minloc
 30:     ST  3,-1(1) 	Store return address to caller 
* BEGIN
* 
 31:     LD  3,-3(1) 	Load variable low
 32:     ST  3,-7(1) 	Store variable k
* 
 33:     LD  3,-3(1) 	Load variable low
 34:     ST  3,-8(1) 	Save index 
 35:     LD  3,-2(1) 	Load address of base of array a
 36:     LD  4,-8(1) 	Load index 
 37:    SUB  3,3,4 	Compute offset of value 
 38:     LD  3,0(3) 	Load the value 
 39:     ST  3,-6(1) 	Store variable x
* 
 40:     LD  3,-3(1) 	Load variable low
 41:     ST  3,-8(1) 	Save left side 
 42:    LDC  3,1(6) 	Load constant 
 43:     LD  4,-8(1) 	Load left into ac1 
 44:    ADD  3,4,3 	op + 
 45:     ST  3,-5(1) 	Store variable i
* WHILE
 46:     LD  3,-5(1) 	Load variable i
 47:     ST  3,-8(1) 	Save left side 
 48:     LD  3,-4(1) 	Load variable high
 49:     LD  4,-8(1) 	Load left into ac1 
 50:    SUB  3,4,3 	op < 
 51:    JLT  3,2(7) 	br if true 
 52:    LDC  3,0(6) 	false case 
 53:    LDA  7,1(7) 	unconditional jmp 
 54:    LDC  3,1(6) 	true case 
 55:    LDC  4,1(6) 	Load constant 1 
 56:    SUB  3,3,4 	While cond check 
 57:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN
* IF
 59:     LD  3,-5(1) 	Load variable i
 60:     ST  3,-8(1) 	Save index 
 61:     LD  3,-2(1) 	Load address of base of array a
 62:     LD  4,-8(1) 	Load index 
 63:    SUB  3,3,4 	Compute offset of value 
 64:     LD  3,0(3) 	Load the value 
 65:     ST  3,-8(1) 	Save left side 
 66:     LD  3,-6(1) 	Load variable x
 67:     LD  4,-8(1) 	Load left into ac1 
 68:    SUB  3,4,3 	op < 
 69:    JLT  3,2(7) 	br if true 
 70:    LDC  3,0(6) 	false case 
 71:    LDA  7,1(7) 	unconditional jmp 
 72:    LDC  3,1(6) 	true case 
 73:    LDC  4,1(6) 	Load constant 1 
 74:    SUB  3,3,4 	If cond check 
 75:    JGE  3,1(7) 	Jump to then part 
* THEN
* BEGIN
* 
 77:     LD  3,-5(1) 	Load variable i
 78:     ST  3,-8(1) 	Save index 
 79:     LD  3,-2(1) 	Load address of base of array a
 80:     LD  4,-8(1) 	Load index 
 81:    SUB  3,3,4 	Compute offset of value 
 82:     LD  3,0(3) 	Load the value 
 83:     ST  3,-6(1) 	Store variable x
* 
 84:     LD  3,-5(1) 	Load variable i
 85:     ST  3,-7(1) 	Store variable k
* END
 76:    LDA  7,9(7) 	 
* ENDIF
* 
 86:     LD  3,-5(1) 	Load variable i
 87:     ST  3,-8(1) 	Save left side 
 88:    LDC  3,1(6) 	Load constant 
 89:     LD  4,-8(1) 	Load left into ac1 
 90:    ADD  3,4,3 	op + 
 91:     ST  3,-5(1) 	Store variable i
* END
 92:    LDA  7,-47(7) 	go to beginning of loop 
 58:    LDA  7,34(7) 	No more loop 
* ENDWHILE
* RETURN
 93:     LD  3,-7(1) 	Load variable k
 94:    LDA  2,0(3) 	Copy result to rt register 
 95:     LD  3,-1(1) 	Load return address 
 96:     LD  1,0(1) 	Adjust fp 
 97:    LDA  7,0(3) 	Return 
* END
* Add standard closing in case there is no return statement
 98:    LDC  2,0(6) 	Set return value to 0 
 99:     LD  3,-1(1) 	Load return address 
100:     LD  1,0(1) 	Adjust fp 
101:    LDA  7,0(3) 	Return 
* END of function minloc
* BEGIN function sort
102:     ST  3,-1(1) 	Store return address to caller 
* BEGIN
* 
103:     LD  3,-3(1) 	Load variable low
104:     ST  3,-5(1) 	Store variable i
* WHILE
105:     LD  3,-5(1) 	Load variable i
106:     ST  3,-8(1) 	Save left side 
107:     LD  3,-4(1) 	Load variable high
108:     ST  3,-9(1) 	Save left side 
109:    LDC  3,1(6) 	Load constant 
110:     LD  4,-9(1) 	Load left into ac1 
111:    SUB  3,4,3 	op - 
112:     LD  4,-8(1) 	Load left into ac1 
113:    SUB  3,4,3 	op < 
114:    JLT  3,2(7) 	br if true 
115:    LDC  3,0(6) 	false case 
116:    LDA  7,1(7) 	unconditional jmp 
117:    LDC  3,1(6) 	true case 
118:    LDC  4,1(6) 	Load constant 1 
119:    SUB  3,3,4 	While cond check 
120:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN
* 
122:     ST  1,-8(1) 	Store old fp in ghost frame 
123:     LD  3,-2(1) 	Load address of base of array a
124:     ST  3,-10(1) 	Store parameter 
125:     LD  3,-5(1) 	Load variable i
126:     ST  3,-11(1) 	Store parameter 
127:     LD  3,-4(1) 	Load variable high
128:     ST  3,-12(1) 	Store parameter 
129:    LDA  1,-8(1) 	Load address of new frame 
130:    LDA  3,1(7) 	Return address in ac 
131:    LDA  7,-102(7) 	call minloc
132:    LDA  3,0(2) 	Save the result in ac 
133:     ST  3,-6(1) 	Store variable k
* 
134:     LD  3,-6(1) 	Load variable k
135:     ST  3,-8(1) 	Save index 
136:     LD  3,-2(1) 	Load address of base of array a
137:     LD  4,-8(1) 	Load index 
138:    SUB  3,3,4 	Compute offset of value 
139:     LD  3,0(3) 	Load the value 
140:     ST  3,-7(1) 	Store variable t
* 
141:     LD  3,-5(1) 	Load variable i
142:     ST  3,-8(1) 	Save index 
143:     LD  3,-2(1) 	Load address of base of array a
144:     LD  4,-8(1) 	Load index 
145:    SUB  3,3,4 	Compute offset of value 
146:     LD  3,0(3) 	Load the value 
147:     ST  3,-8(1) 	Save assign value 
148:     LD  3,-6(1) 	Load variable k
149:     ST  3,-9(1) 	Save index 
150:     LD  5,-9(1) 	Load index 
151:     LD  4,-8(1) 	Load value 
152:     LD  3,-2(1) 	Load address of base of array a
153:    SUB  3,3,5 	Compute offset of value 
154:     ST  4,0(3) 	Store the value 
155:    LDA  3,0(4) 	Adjust ac 
* 
156:     LD  3,-7(1) 	Load variable t
157:     ST  3,-8(1) 	Save assign value 
158:     LD  3,-5(1) 	Load variable i
159:     ST  3,-9(1) 	Save index 
160:     LD  5,-9(1) 	Load index 
161:     LD  4,-8(1) 	Load value 
162:     LD  3,-2(1) 	Load address of base of array a
163:    SUB  3,3,5 	Compute offset of value 
164:     ST  4,0(3) 	Store the value 
165:    LDA  3,0(4) 	Adjust ac 
* 
166:     LD  3,-5(1) 	Load variable i
167:     ST  3,-8(1) 	Save left side 
168:    LDC  3,1(6) 	Load constant 
169:     LD  4,-8(1) 	Load left into ac1 
170:    ADD  3,4,3 	op + 
171:     ST  3,-5(1) 	Store variable i
* END
172:    LDA  7,-68(7) 	go to beginning of loop 
121:    LDA  7,51(7) 	No more loop 
* ENDWHILE
* END
* Add standard closing in case there is no return statement
173:    LDC  2,0(6) 	Set return value to 0 
174:     LD  3,-1(1) 	Load return address 
175:     LD  1,0(1) 	Adjust fp 
176:    LDA  7,0(3) 	Return 
* END of function sort
* BEGIN function main
  4:    LDA  7,172(7) 	Jump to main 
177:     ST  3,-1(1) 	Store return address to caller 
* BEGIN
* 
178:     ST  1,-3(1) 	Store old fp in ghost frame 
179:    LDA  1,-3(1) 	Load address of new frame 
180:    LDA  3,1(7) 	Return address in ac 
181:    LDA  7,-176(7) 	call input
182:    LDA  3,0(2) 	Save the result in ac 
183:     ST  3,0(0) 	Store variable size
* 
184:    LDC  3,0(6) 	Load constant 
185:     ST  3,-2(1) 	Store variable i
* WHILE
186:     LD  3,-2(1) 	Load variable i
187:     ST  3,-3(1) 	Save left side 
188:     LD  3,0(0) 	Load variable size
189:     LD  4,-3(1) 	Load left into ac1 
190:    SUB  3,4,3 	op < 
191:    JLT  3,2(7) 	br if true 
192:    LDC  3,0(6) 	false case 
193:    LDA  7,1(7) 	unconditional jmp 
194:    LDC  3,1(6) 	true case 
195:    LDC  4,1(6) 	Load constant 1 
196:    SUB  3,3,4 	While cond check 
197:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN
* 
199:     ST  1,-3(1) 	Store old fp in ghost frame 
200:    LDA  1,-3(1) 	Load address of new frame 
201:    LDA  3,1(7) 	Return address in ac 
202:    LDA  7,-197(7) 	call input
203:    LDA  3,0(2) 	Save the result in ac 
204:     ST  3,-3(1) 	Save assign value 
205:     LD  3,-2(1) 	Load variable i
206:     ST  3,-4(1) 	Save index 
207:     LD  5,-4(1) 	Load index 
208:     LD  4,-3(1) 	Load value 
209:    LDA  3,-1(0) 	Load address of base of array x
210:    SUB  3,3,5 	Compute offset of value 
211:     ST  4,0(3) 	Store the value 
212:    LDA  3,0(4) 	Adjust ac 
* 
213:     LD  3,-2(1) 	Load variable i
214:     ST  3,-3(1) 	Save left side 
215:    LDC  3,1(6) 	Load constant 
216:     LD  4,-3(1) 	Load left into ac1 
217:    ADD  3,4,3 	op + 
218:     ST  3,-2(1) 	Store variable i
* END
219:    LDA  7,-34(7) 	go to beginning of loop 
198:    LDA  7,21(7) 	No more loop 
* ENDWHILE
* 
220:     ST  1,-3(1) 	Store old fp in ghost frame 
221:    LDA  3,-1(0) 	Load address of base of array x
222:     ST  3,-5(1) 	Store parameter 
223:    LDC  3,0(6) 	Load constant 
224:     ST  3,-6(1) 	Store parameter 
225:     LD  3,0(0) 	Load variable size
226:     ST  3,-7(1) 	Store parameter 
227:    LDA  1,-3(1) 	Load address of new frame 
228:    LDA  3,1(7) 	Return address in ac 
229:    LDA  7,-128(7) 	call sort
230:    LDA  3,0(2) 	Save the result in ac 
* 
231:    LDC  3,0(6) 	Load constant 
232:     ST  3,-2(1) 	Store variable i
* WHILE
233:     LD  3,-2(1) 	Load variable i
234:     ST  3,-3(1) 	Save left side 
235:     LD  3,0(0) 	Load variable size
236:     LD  4,-3(1) 	Load left into ac1 
237:    SUB  3,4,3 	op < 
238:    JLT  3,2(7) 	br if true 
239:    LDC  3,0(6) 	false case 
240:    LDA  7,1(7) 	unconditional jmp 
241:    LDC  3,1(6) 	true case 
242:    LDC  4,1(6) 	Load constant 1 
243:    SUB  3,3,4 	While cond check 
244:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN
* 
246:     ST  1,-3(1) 	Store old fp in ghost frame 
247:     LD  3,-2(1) 	Load variable i
248:     ST  3,-5(1) 	Save index 
249:    LDA  3,-1(0) 	Load address of base of array x
250:     LD  4,-5(1) 	Load index 
251:    SUB  3,3,4 	Compute offset of value 
252:     LD  3,0(3) 	Load the value 
253:     ST  3,-5(1) 	Store parameter 
254:    LDA  1,-3(1) 	Load address of new frame 
255:    LDA  3,1(7) 	Return address in ac 
256:    LDA  7,-246(7) 	call output
257:    LDA  3,0(2) 	Save the result in ac 
* 
258:     LD  3,-2(1) 	Load variable i
259:     ST  3,-3(1) 	Save left side 
260:    LDC  3,1(6) 	Load constant 
261:     LD  4,-3(1) 	Load left into ac1 
262:    ADD  3,4,3 	op + 
263:     ST  3,-2(1) 	Store variable i
* END
264:    LDA  7,-32(7) 	go to beginning of loop 
245:    LDA  7,19(7) 	No more loop 
* ENDWHILE
* END
* Add standard closing in case there is no return statement
265:    LDC  2,0(6) 	Set return value to 0 
266:     LD  3,-1(1) 	Load return address 
267:     LD  1,0(1) 	Adjust fp 
268:    LDA  7,0(3) 	Return 
* END of function main
