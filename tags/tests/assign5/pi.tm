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
 36:    LDC  3,80(6) 	Load constant 
 37:     ST  3,-2(1) 	Store variable N
* 10
 38:     LD  3,-2(1) 	Load variable N
 39:     ST  3,-411(1) 	Save left side in temp 
 40:    LDC  3,10(6) 	Load constant 
 41:     LD  4,-411(1) 	Load left from temp into ac1 
 42:    MUL  3,4,3 	Op * 
 43:     ST  3,-411(1) 	Save left side in temp 
 44:    LDC  3,3(6) 	Load constant 
 45:     LD  4,-411(1) 	Load left from temp into ac1 
 46:    DIV  3,4,3 	Op / 
 47:     ST  3,-3(1) 	Store variable LEN
* 12
 48:    LDC  3,0(6) 	Load constant 
 49:     ST  3,-5(1) 	Store variable j
* WHILE
 50:     LD  3,-5(1) 	Load variable j
 51:     ST  3,-411(1) 	Save left side in temp 
 52:     LD  3,-3(1) 	Load variable LEN
 53:     LD  4,-411(1) 	Load left from temp into ac1 
 54:    SUB  4,4,3 	Op < 
 55:    LDC  3,1(6) 	True case 
 56:    JLT  4,1(7) 	Jump if true 
 57:    LDC  3,0(6) 	False case 
 58:    LDC  4,1(6) 	Load constant 1 
 59:    SUB  3,3,4 	While cond check 
 60:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 14
 62:     LD  3,-5(1) 	Load variable j
 63:     ST  3,-411(1) 	Save index in temp 
 64:    LDC  3,2(6) 	Load constant 
 65:     LD  4,-411(1) 	load index from temp to ac1 
 66:    LDA  5,-11(1) 	Load address of base of array a
 67:    SUB  5,5,4 	Compute offset of value 
 68:     ST  3,0(5) 	Store variable a
* 15
 69:     LD  3,-5(1) 	Load variable j
 70:     ST  3,-411(1) 	Save left side in temp 
 71:    LDC  3,1(6) 	Load constant 
 72:     LD  4,-411(1) 	Load left from temp into ac1 
 73:    ADD  3,4,3 	Op + 
 74:     ST  3,-5(1) 	Store variable j
* END compound statement
 75:    LDA  7,-26(7) 	go to beginning of loop 
 61:    LDA  7,14(7) 	No more loop 
* ENDWHILE
* 18
 76:    LDC  3,0(6) 	Load constant 
 77:     ST  3,-9(1) 	Store variable nines
* 18
 78:    LDC  3,0(6) 	Load constant 
 79:     ST  3,-10(1) 	Store variable predigit
* 19
 80:    LDC  3,0(6) 	Load constant 
 81:     ST  3,-5(1) 	Store variable j
* WHILE
 82:     LD  3,-5(1) 	Load variable j
 83:     ST  3,-411(1) 	Save left side in temp 
 84:     LD  3,-2(1) 	Load variable N
 85:     LD  4,-411(1) 	Load left from temp into ac1 
 86:    SUB  4,4,3 	Op < 
 87:    LDC  3,1(6) 	True case 
 88:    JLT  4,1(7) 	Jump if true 
 89:    LDC  3,0(6) 	False case 
 90:    LDC  4,1(6) 	Load constant 1 
 91:    SUB  3,3,4 	While cond check 
 92:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 21
 94:    LDC  3,0(6) 	Load constant 
 95:     ST  3,-7(1) 	Store variable q
* 22
 96:     LD  3,-3(1) 	Load variable LEN
 97:     ST  3,-4(1) 	Store variable i
* WHILE
 98:     LD  3,-4(1) 	Load variable i
 99:     ST  3,-411(1) 	Save left side in temp 
100:    LDC  3,0(6) 	Load constant 
101:     LD  4,-411(1) 	Load left from temp into ac1 
102:    SUB  4,4,3 	Op > 
103:    LDC  3,1(6) 	True case 
104:    JGT  4,1(7) 	Jump if true 
105:    LDC  3,0(6) 	False case 
106:    LDC  4,1(6) 	Load constant 1 
107:    SUB  3,3,4 	While cond check 
108:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 24
110:    LDC  3,10(6) 	Load constant 
111:     ST  3,-411(1) 	Save left side in temp 
112:     LD  3,-4(1) 	Load variable i
113:     ST  3,-412(1) 	Save left side in temp 
114:    LDC  3,1(6) 	Load constant 
115:     LD  4,-412(1) 	Load left from temp into ac1 
116:    SUB  3,4,3 	Op - 
117:    LDA  4,-11(1) 	Load address of base of array a
118:    SUB  3,4,3 	Compute offset of value 
119:     LD  3,0(3) 	Load the value 
120:     LD  4,-411(1) 	Load left from temp into ac1 
121:    MUL  3,4,3 	Op * 
122:     ST  3,-411(1) 	Save left side in temp 
123:     LD  3,-7(1) 	Load variable q
124:     ST  3,-412(1) 	Save left side in temp 
125:     LD  3,-4(1) 	Load variable i
126:     LD  4,-412(1) 	Load left from temp into ac1 
127:    MUL  3,4,3 	Op * 
128:     LD  4,-411(1) 	Load left from temp into ac1 
129:    ADD  3,4,3 	Op + 
130:     ST  3,-8(1) 	Store variable x
* 25
131:     LD  3,-4(1) 	Load variable i
132:     ST  3,-411(1) 	Save left side in temp 
133:    LDC  3,1(6) 	Load constant 
134:     LD  4,-411(1) 	Load left from temp into ac1 
135:    SUB  3,4,3 	Op - 
136:     ST  3,-411(1) 	Save index in temp 
137:     LD  3,-8(1) 	Load variable x
138:     ST  3,-412(1) 	Save left side in temp 
139:    LDC  3,2(6) 	Load constant 
140:     ST  3,-413(1) 	Save left side in temp 
141:     LD  3,-4(1) 	Load variable i
142:     LD  4,-413(1) 	Load left from temp into ac1 
143:    MUL  3,4,3 	Op * 
144:     ST  3,-413(1) 	Save left side in temp 
145:    LDC  3,1(6) 	Load constant 
146:     LD  4,-413(1) 	Load left from temp into ac1 
147:    SUB  3,4,3 	Op - 
148:     LD  4,-412(1) 	Load left from temp into ac1 
149:    DIV  5,4,3 	Op % 
150:    MUL  5,5,3 	 
151:    SUB  3,4,5 	 
152:     LD  4,-411(1) 	load index from temp to ac1 
153:    LDA  5,-11(1) 	Load address of base of array a
154:    SUB  5,5,4 	Compute offset of value 
155:     ST  3,0(5) 	Store variable a
* 26
156:     LD  3,-8(1) 	Load variable x
157:     ST  3,-411(1) 	Save left side in temp 
158:    LDC  3,2(6) 	Load constant 
159:     ST  3,-412(1) 	Save left side in temp 
160:     LD  3,-4(1) 	Load variable i
161:     LD  4,-412(1) 	Load left from temp into ac1 
162:    MUL  3,4,3 	Op * 
163:     ST  3,-412(1) 	Save left side in temp 
164:    LDC  3,1(6) 	Load constant 
165:     LD  4,-412(1) 	Load left from temp into ac1 
166:    SUB  3,4,3 	Op - 
167:     LD  4,-411(1) 	Load left from temp into ac1 
168:    DIV  3,4,3 	Op / 
169:     ST  3,-7(1) 	Store variable q
* 27
170:     LD  3,-4(1) 	Load variable i
171:     ST  3,-411(1) 	Save left side in temp 
172:    LDC  3,1(6) 	Load constant 
173:     LD  4,-411(1) 	Load left from temp into ac1 
174:    SUB  3,4,3 	Op - 
175:     ST  3,-4(1) 	Store variable i
* END compound statement
176:    LDA  7,-79(7) 	go to beginning of loop 
109:    LDA  7,67(7) 	No more loop 
* ENDWHILE
* 30
177:    LDC  3,0(6) 	Load constant 
178:     ST  3,-411(1) 	Save index in temp 
179:     LD  3,-7(1) 	Load variable q
180:     ST  3,-412(1) 	Save left side in temp 
181:    LDC  3,10(6) 	Load constant 
182:     LD  4,-412(1) 	Load left from temp into ac1 
183:    DIV  5,4,3 	Op % 
184:    MUL  5,5,3 	 
185:    SUB  3,4,5 	 
186:     LD  4,-411(1) 	load index from temp to ac1 
187:    LDA  5,-11(1) 	Load address of base of array a
188:    SUB  5,5,4 	Compute offset of value 
189:     ST  3,0(5) 	Store variable a
* 30
190:     LD  3,-7(1) 	Load variable q
191:     ST  3,-411(1) 	Save left side in temp 
192:    LDC  3,10(6) 	Load constant 
193:     LD  4,-411(1) 	Load left from temp into ac1 
194:    DIV  3,4,3 	Op / 
195:     ST  3,-7(1) 	Store variable q
* IF
196:     LD  3,-7(1) 	Load variable q
197:     ST  3,-411(1) 	Save left side in temp 
198:    LDC  3,9(6) 	Load constant 
199:     LD  4,-411(1) 	Load left from temp into ac1 
200:    SUB  4,4,3 	Op == 
201:    LDC  3,1(6) 	True case 
202:    JEQ  4,1(7) 	Jump if true 
203:    LDC  3,0(6) 	False case 
204:    LDC  4,1(6) 	Load constant 1 
205:    SUB  3,3,4 	If cond check 
206:    JGE  3,1(7) 	Jump to then part 
* THEN
* BEGIN compound statement
* 33
208:     LD  3,-9(1) 	Load variable nines
209:     ST  3,-411(1) 	Save left side in temp 
210:    LDC  3,1(6) 	Load constant 
211:     LD  4,-411(1) 	Load left from temp into ac1 
212:    ADD  3,4,3 	Op + 
213:     ST  3,-9(1) 	Store variable nines
* END compound statement
* ELSE
207:    LDA  7,7(7) 	Jump around the THEN 
* BEGIN compound statement
* IF
215:     LD  3,-7(1) 	Load variable q
216:     ST  3,-411(1) 	Save left side in temp 
217:    LDC  3,10(6) 	Load constant 
218:     LD  4,-411(1) 	Load left from temp into ac1 
219:    SUB  4,4,3 	Op == 
220:    LDC  3,1(6) 	True case 
221:    JEQ  4,1(7) 	Jump if true 
222:    LDC  3,0(6) 	False case 
223:    LDC  4,1(6) 	Load constant 1 
224:    SUB  3,3,4 	If cond check 
225:    JGE  3,1(7) 	Jump to then part 
* THEN
* BEGIN compound statement
* 37
227:     ST  1,-411(1) 	Store old fp in ghost frame 
228:     LD  3,-10(1) 	Load variable predigit
229:     ST  3,-413(1) 	Save left side in temp 
230:    LDC  3,1(6) 	Load constant 
231:     LD  4,-413(1) 	Load left from temp into ac1 
232:    ADD  3,4,3 	Op + 
233:     ST  3,-413(1) 	Store parameter 
234:    LDA  1,-411(1) 	Load address of new frame 
235:    LDA  3,1(7) 	Return address in ac 
236:    LDA  7,-226(7) 	call output
237:    LDA  3,0(2) 	Save the result in ac 
* 38
238:    LDC  3,0(6) 	Load constant 
239:     ST  3,-10(1) 	Store variable predigit
* WHILE
240:     LD  3,-9(1) 	Load variable nines
241:     ST  3,-411(1) 	Save left side in temp 
242:    LDC  3,0(6) 	Load constant 
243:     LD  4,-411(1) 	Load left from temp into ac1 
244:    SUB  4,4,3 	Op > 
245:    LDC  3,1(6) 	True case 
246:    JGT  4,1(7) 	Jump if true 
247:    LDC  3,0(6) 	False case 
248:    LDC  4,1(6) 	Load constant 1 
249:    SUB  3,3,4 	While cond check 
250:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 40
252:     ST  1,-411(1) 	Store old fp in ghost frame 
253:    LDC  3,0(6) 	Load constant 
254:     ST  3,-413(1) 	Store parameter 
255:    LDA  1,-411(1) 	Load address of new frame 
256:    LDA  3,1(7) 	Return address in ac 
257:    LDA  7,-247(7) 	call output
258:    LDA  3,0(2) 	Save the result in ac 
* 41
259:     LD  3,-9(1) 	Load variable nines
260:     ST  3,-411(1) 	Save left side in temp 
261:    LDC  3,1(6) 	Load constant 
262:     LD  4,-411(1) 	Load left from temp into ac1 
263:    SUB  3,4,3 	Op - 
264:     ST  3,-9(1) 	Store variable nines
* END compound statement
265:    LDA  7,-26(7) 	go to beginning of loop 
251:    LDA  7,14(7) 	No more loop 
* ENDWHILE
* END compound statement
* ELSE
226:    LDA  7,40(7) 	Jump around the THEN 
* BEGIN compound statement
* 45
267:     ST  1,-411(1) 	Store old fp in ghost frame 
268:     LD  3,-10(1) 	Load variable predigit
269:     ST  3,-413(1) 	Store parameter 
270:    LDA  1,-411(1) 	Load address of new frame 
271:    LDA  3,1(7) 	Return address in ac 
272:    LDA  7,-262(7) 	call output
273:    LDA  3,0(2) 	Save the result in ac 
* 46
274:     LD  3,-7(1) 	Load variable q
275:     ST  3,-10(1) 	Store variable predigit
* WHILE
276:     LD  3,-9(1) 	Load variable nines
277:     ST  3,-411(1) 	Save left side in temp 
278:    LDC  3,0(6) 	Load constant 
279:     LD  4,-411(1) 	Load left from temp into ac1 
280:    SUB  4,4,3 	Op > 
281:    LDC  3,1(6) 	True case 
282:    JGT  4,1(7) 	Jump if true 
283:    LDC  3,0(6) 	False case 
284:    LDC  4,1(6) 	Load constant 1 
285:    SUB  3,3,4 	While cond check 
286:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 48
288:     ST  1,-411(1) 	Store old fp in ghost frame 
289:    LDC  3,9(6) 	Load constant 
290:     ST  3,-413(1) 	Store parameter 
291:    LDA  1,-411(1) 	Load address of new frame 
292:    LDA  3,1(7) 	Return address in ac 
293:    LDA  7,-283(7) 	call output
294:    LDA  3,0(2) 	Save the result in ac 
* 49
295:     LD  3,-9(1) 	Load variable nines
296:     ST  3,-411(1) 	Save left side in temp 
297:    LDC  3,1(6) 	Load constant 
298:     LD  4,-411(1) 	Load left from temp into ac1 
299:    SUB  3,4,3 	Op - 
300:     ST  3,-9(1) 	Store variable nines
* END compound statement
301:    LDA  7,-26(7) 	go to beginning of loop 
287:    LDA  7,14(7) 	No more loop 
* ENDWHILE
* END compound statement
266:    LDA  7,35(7) 	Jump around the ELSE 
* ENDIF
* END compound statement
214:    LDA  7,87(7) 	Jump around the ELSE 
* ENDIF
* 53
302:     LD  3,-5(1) 	Load variable j
303:     ST  3,-411(1) 	Save left side in temp 
304:    LDC  3,1(6) 	Load constant 
305:     LD  4,-411(1) 	Load left from temp into ac1 
306:    ADD  3,4,3 	Op + 
307:     ST  3,-5(1) 	Store variable j
* END compound statement
308:    LDA  7,-227(7) 	go to beginning of loop 
 93:    LDA  7,215(7) 	No more loop 
* ENDWHILE
* 55
309:     ST  1,-411(1) 	Store old fp in ghost frame 
310:     LD  3,-10(1) 	Load variable predigit
311:     ST  3,-413(1) 	Store parameter 
312:    LDA  1,-411(1) 	Load address of new frame 
313:    LDA  3,1(7) 	Return address in ac 
314:    LDA  7,-304(7) 	call output
315:    LDA  3,0(2) 	Save the result in ac 
* 56
316:     ST  1,-411(1) 	Store old fp in ghost frame 
317:    LDA  1,-411(1) 	Load address of new frame 
318:    LDA  3,1(7) 	Return address in ac 
319:    LDA  7,-290(7) 	call outnl
320:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
321:    LDC  2,0(6) 	Set return value to 0 
322:     LD  3,-1(1) 	Load return address 
323:     LD  1,0(1) 	Adjust fp 
324:    LDA  7,0(3) 	Return 
* END of function main
