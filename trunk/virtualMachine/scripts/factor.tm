* C- compiler version 1.0
* Author: Robert B. Heckendorn
* Apr 13, 2004
* BEGIN Prolog
  0:     LD  0,0(0) 	set the global pointer 
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
* BEGIN function sqrt
 30:     ST  3,-1(1) 	Store return address to caller 
* BEGIN
* IF
 31:     LD  3,-2(1) 	Load variable x
 32:     ST  3,-5(1) 	Save left side 
 33:    LDC  3,1(6) 	Load constant 
 34:     LD  4,-5(1) 	Load left into ac1 
 35:    SUB  3,4,3 	op == 
 36:    JEQ  3,2(7) 	br if true 
 37:    LDC  3,0(6) 	false case 
 38:    LDA  7,1(7) 	unconditional jmp 
 39:    LDC  3,1(6) 	true case 
 40:    LDC  4,1(6) 	Load constant 1 
 41:    SUB  3,3,4 	If cond check 
 42:    JGE  3,1(7) 	Jump to then part 
* THEN
* RETURN
 44:    LDC  3,1(6) 	Load constant 
 45:    LDA  2,0(3) 	Copy result to rt register 
 46:     LD  3,-1(1) 	Load return address 
 47:     LD  1,0(1) 	Adjust fp 
 48:    LDA  7,0(3) 	Return 
 43:    LDA  7,5(7) 	 
* ENDIF
* 
 49:     LD  3,-2(1) 	Load variable x
 50:     ST  3,-5(1) 	Save left side 
 51:    LDC  3,2(6) 	Load constant 
 52:     LD  4,-5(1) 	Load left into ac1 
 53:    DIV  3,4,3 	op / 
 54:     ST  3,-3(1) 	Store variable guess
* 
 55:     LD  3,-2(1) 	Load variable x
 56:     ST  3,-5(1) 	Save left side 
 57:     LD  3,-3(1) 	Load variable guess
 58:     LD  4,-5(1) 	Load left into ac1 
 59:    DIV  3,4,3 	op / 
 60:     ST  3,-5(1) 	Save left side 
 61:     LD  3,-3(1) 	Load variable guess
 62:     LD  4,-5(1) 	Load left into ac1 
 63:    ADD  3,4,3 	op + 
 64:     ST  3,-5(1) 	Save left side 
 65:    LDC  3,2(6) 	Load constant 
 66:     LD  4,-5(1) 	Load left into ac1 
 67:    DIV  3,4,3 	op / 
 68:     ST  3,-4(1) 	Store variable newguess
* WHILE
 69:     LD  3,-3(1) 	Load variable guess
 70:     ST  3,-5(1) 	Save left side 
 71:     LD  3,-4(1) 	Load variable newguess
 72:     LD  4,-5(1) 	Load left into ac1 
 73:    SUB  3,4,3 	op - 
 74:     ST  3,-5(1) 	Save left side 
 75:    LDC  3,1(6) 	Load constant 
 76:     LD  4,-5(1) 	Load left into ac1 
 77:    SUB  3,4,3 	op > 
 78:    JGT  3,2(7) 	br if true 
 79:    LDC  3,0(6) 	false case 
 80:    LDA  7,1(7) 	unconditional jmp 
 81:    LDC  3,1(6) 	true case 
 82:    LDC  4,1(6) 	Load constant 1 
 83:    SUB  3,3,4 	While cond check 
 84:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN
* 
 86:     LD  3,-4(1) 	Load variable newguess
 87:     ST  3,-3(1) 	Store variable guess
* 
 88:     LD  3,-2(1) 	Load variable x
 89:     ST  3,-5(1) 	Save left side 
 90:     LD  3,-3(1) 	Load variable guess
 91:     LD  4,-5(1) 	Load left into ac1 
 92:    DIV  3,4,3 	op / 
 93:     ST  3,-5(1) 	Save left side 
 94:     LD  3,-3(1) 	Load variable guess
 95:     LD  4,-5(1) 	Load left into ac1 
 96:    ADD  3,4,3 	op + 
 97:     ST  3,-5(1) 	Save left side 
 98:    LDC  3,2(6) 	Load constant 
 99:     LD  4,-5(1) 	Load left into ac1 
100:    DIV  3,4,3 	op / 
101:     ST  3,-4(1) 	Store variable newguess
* END
102:    LDA  7,-34(7) 	go to beginning of loop 
 85:    LDA  7,17(7) 	No more loop 
* ENDWHILE
* IF
103:     LD  3,-4(1) 	Load variable newguess
104:     ST  3,-5(1) 	Save left side 
105:     LD  3,-4(1) 	Load variable newguess
106:     LD  4,-5(1) 	Load left into ac1 
107:    MUL  3,4,3 	op * 
108:     ST  3,-5(1) 	Save left side 
109:     LD  3,-2(1) 	Load variable x
110:     LD  4,-5(1) 	Load left into ac1 
111:    SUB  3,4,3 	op > 
112:    JGT  3,2(7) 	br if true 
113:    LDC  3,0(6) 	false case 
114:    LDA  7,1(7) 	unconditional jmp 
115:    LDC  3,1(6) 	true case 
116:    LDC  4,1(6) 	Load constant 1 
117:    SUB  3,3,4 	If cond check 
118:    JGE  3,1(7) 	Jump to then part 
* THEN
* 
120:     LD  3,-4(1) 	Load variable newguess
121:     ST  3,-5(1) 	Save left side 
122:    LDC  3,1(6) 	Load constant 
123:     LD  4,-5(1) 	Load left into ac1 
124:    SUB  3,4,3 	op - 
125:     ST  3,-4(1) 	Store variable newguess
119:    LDA  7,6(7) 	 
* ENDIF
* RETURN
126:     LD  3,-4(1) 	Load variable newguess
127:    LDA  2,0(3) 	Copy result to rt register 
128:     LD  3,-1(1) 	Load return address 
129:     LD  1,0(1) 	Adjust fp 
130:    LDA  7,0(3) 	Return 
* END
* Add standard closing in case there is no return statement
131:    LDC  2,0(6) 	Set return value to 0 
132:     LD  3,-1(1) 	Load return address 
133:     LD  1,0(1) 	Adjust fp 
134:    LDA  7,0(3) 	Return 
* END of function sqrt
* BEGIN function main
  4:    LDA  7,130(7) 	Jump to main 
135:     ST  3,-1(1) 	Store return address to caller 
* BEGIN
* WHILE
136:     ST  1,-5(1) 	Store old fp in ghost frame 
137:    LDA  1,-5(1) 	Load address of new frame 
138:    LDA  3,1(7) 	Return address in ac 
139:    LDA  7,-134(7) 	call input
140:    LDA  3,0(2) 	Save the result in ac 
141:     ST  3,-2(1) 	Store variable n
142:     ST  3,-5(1) 	Save left side 
143:    LDC  3,1(6) 	Load constant 
144:     LD  4,-5(1) 	Load left into ac1 
145:    SUB  3,4,3 	op > 
146:    JGT  3,2(7) 	br if true 
147:    LDC  3,0(6) 	false case 
148:    LDA  7,1(7) 	unconditional jmp 
149:    LDC  3,1(6) 	true case 
150:    LDC  4,1(6) 	Load constant 1 
151:    SUB  3,3,4 	While cond check 
152:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN
* 
154:     ST  1,-5(1) 	Store old fp in ghost frame 
155:     LD  3,-2(1) 	Load variable n
156:     ST  3,-7(1) 	Store parameter 
157:    LDA  1,-5(1) 	Load address of new frame 
158:    LDA  3,1(7) 	Return address in ac 
159:    LDA  7,-130(7) 	call sqrt
160:    LDA  3,0(2) 	Save the result in ac 
161:     ST  3,-4(1) 	Store variable limit
* WHILE
162:     LD  3,-2(1) 	Load variable n
163:     ST  3,-5(1) 	Save left side 
164:    LDC  3,2(6) 	Load constant 
165:     LD  4,-5(1) 	Load left into ac1 
166:    DIV  5,4,3 	op % 
167:    MUL  5,5,3 	 
168:    SUB  3,4,5 	 
169:     ST  3,-5(1) 	Save left side 
170:    LDC  3,0(6) 	Load constant 
171:     LD  4,-5(1) 	Load left into ac1 
172:    SUB  3,4,3 	op == 
173:    JEQ  3,2(7) 	br if true 
174:    LDC  3,0(6) 	false case 
175:    LDA  7,1(7) 	unconditional jmp 
176:    LDC  3,1(6) 	true case 
177:    LDC  4,1(6) 	Load constant 1 
178:    SUB  3,3,4 	While cond check 
179:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN
* 
181:     ST  1,-5(1) 	Store old fp in ghost frame 
182:    LDC  3,2(6) 	Load constant 
183:     ST  3,-7(1) 	Store parameter 
184:    LDA  1,-5(1) 	Load address of new frame 
185:    LDA  3,1(7) 	Return address in ac 
186:    LDA  7,-176(7) 	call output
187:    LDA  3,0(2) 	Save the result in ac 
* 
188:     LD  3,-2(1) 	Load variable n
189:     ST  3,-5(1) 	Save left side 
190:    LDC  3,2(6) 	Load constant 
191:     LD  4,-5(1) 	Load left into ac1 
192:    DIV  3,4,3 	op / 
193:     ST  3,-2(1) 	Store variable n
* END
194:    LDA  7,-33(7) 	go to beginning of loop 
180:    LDA  7,14(7) 	No more loop 
* ENDWHILE
* 
195:    LDC  3,3(6) 	Load constant 
196:     ST  3,-3(1) 	Store variable i
* WHILE
197:     LD  3,-3(1) 	Load variable i
198:     ST  3,-5(1) 	Save left side 
199:     LD  3,-4(1) 	Load variable limit
200:     LD  4,-5(1) 	Load left into ac1 
201:    SUB  3,4,3 	op <= 
202:    JLE  3,2(7) 	br if true 
203:    LDC  3,0(6) 	false case 
204:    LDA  7,1(7) 	unconditional jmp 
205:    LDC  3,1(6) 	true case 
206:    LDC  4,1(6) 	Load constant 1 
207:    SUB  3,3,4 	While cond check 
208:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN
* WHILE
210:     LD  3,-2(1) 	Load variable n
211:     ST  3,-5(1) 	Save left side 
212:     LD  3,-3(1) 	Load variable i
213:     LD  4,-5(1) 	Load left into ac1 
214:    DIV  5,4,3 	op % 
215:    MUL  5,5,3 	 
216:    SUB  3,4,5 	 
217:     ST  3,-5(1) 	Save left side 
218:    LDC  3,0(6) 	Load constant 
219:     LD  4,-5(1) 	Load left into ac1 
220:    SUB  3,4,3 	op == 
221:    JEQ  3,2(7) 	br if true 
222:    LDC  3,0(6) 	false case 
223:    LDA  7,1(7) 	unconditional jmp 
224:    LDC  3,1(6) 	true case 
225:    LDC  4,1(6) 	Load constant 1 
226:    SUB  3,3,4 	While cond check 
227:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN
* 
229:     ST  1,-5(1) 	Store old fp in ghost frame 
230:     LD  3,-3(1) 	Load variable i
231:     ST  3,-7(1) 	Store parameter 
232:    LDA  1,-5(1) 	Load address of new frame 
233:    LDA  3,1(7) 	Return address in ac 
234:    LDA  7,-224(7) 	call output
235:    LDA  3,0(2) 	Save the result in ac 
* 
236:     LD  3,-2(1) 	Load variable n
237:     ST  3,-5(1) 	Save left side 
238:     LD  3,-3(1) 	Load variable i
239:     LD  4,-5(1) 	Load left into ac1 
240:    DIV  3,4,3 	op / 
241:     ST  3,-2(1) 	Store variable n
* 
242:     ST  1,-5(1) 	Store old fp in ghost frame 
243:     LD  3,-2(1) 	Load variable n
244:     ST  3,-7(1) 	Store parameter 
245:    LDA  1,-5(1) 	Load address of new frame 
246:    LDA  3,1(7) 	Return address in ac 
247:    LDA  7,-218(7) 	call sqrt
248:    LDA  3,0(2) 	Save the result in ac 
249:     ST  3,-4(1) 	Store variable limit
* END
250:    LDA  7,-41(7) 	go to beginning of loop 
228:    LDA  7,22(7) 	No more loop 
* ENDWHILE
* 
251:     LD  3,-3(1) 	Load variable i
252:     ST  3,-5(1) 	Save left side 
253:    LDC  3,2(6) 	Load constant 
254:     LD  4,-5(1) 	Load left into ac1 
255:    ADD  3,4,3 	op + 
256:     ST  3,-3(1) 	Store variable i
* END
257:    LDA  7,-61(7) 	go to beginning of loop 
209:    LDA  7,48(7) 	No more loop 
* ENDWHILE
* IF
258:     LD  3,-2(1) 	Load variable n
259:     ST  3,-5(1) 	Save left side 
260:    LDC  3,1(6) 	Load constant 
261:     LD  4,-5(1) 	Load left into ac1 
262:    SUB  3,4,3 	op > 
263:    JGT  3,2(7) 	br if true 
264:    LDC  3,0(6) 	false case 
265:    LDA  7,1(7) 	unconditional jmp 
266:    LDC  3,1(6) 	true case 
267:    LDC  4,1(6) 	Load constant 1 
268:    SUB  3,3,4 	If cond check 
269:    JGE  3,1(7) 	Jump to then part 
* THEN
* 
271:     ST  1,-5(1) 	Store old fp in ghost frame 
272:     LD  3,-2(1) 	Load variable n
273:     ST  3,-7(1) 	Store parameter 
274:    LDA  1,-5(1) 	Load address of new frame 
275:    LDA  3,1(7) 	Return address in ac 
276:    LDA  7,-266(7) 	call output
277:    LDA  3,0(2) 	Save the result in ac 
270:    LDA  7,7(7) 	 
* ENDIF
* END
278:    LDA  7,-143(7) 	go to beginning of loop 
153:    LDA  7,125(7) 	No more loop 
* ENDWHILE
* END
* Add standard closing in case there is no return statement
279:    LDC  2,0(6) 	Set return value to 0 
280:     LD  3,-1(1) 	Load return address 
281:     LD  1,0(1) 	Adjust fp 
282:    LDA  7,0(3) 	Return 
* END of function main
