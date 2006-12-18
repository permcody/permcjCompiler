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
* BEGIN function pow
 35:     ST  3,-1(1) 	Store return address. BEGIN FUNC: pow
* BEGIN compound statement
* 8
 36:    LDC  3,1(6) 	Load constant 
 37:     ST  3,-5(1) 	Store variable ans
* 9
 38:     LD  3,-2(1) 	Load variable n
 39:     ST  3,-4(1) 	Store variable sqr
* WHILE
 40:    LDC  3,1(6) 	Load constant 
 41:    LDC  4,1(6) 	Load constant 1 
 42:    SUB  3,3,4 	While cond check 
 43:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* IF
 45:     LD  3,-3(1) 	Load variable p
 46:     ST  3,-6(1) 	Save left side in temp 
 47:    LDC  3,2(6) 	Load constant 
 48:     LD  4,-6(1) 	Load left from temp into ac1 
 49:    DIV  5,4,3 	Op % 
 50:    MUL  5,5,3 	 
 51:    SUB  3,4,5 	 
 52:     ST  3,-6(1) 	Save left side in temp 
 53:    LDC  3,1(6) 	Load constant 
 54:     LD  4,-6(1) 	Load left from temp into ac1 
 55:    SUB  4,4,3 	Op == 
 56:    LDC  3,1(6) 	True case 
 57:    JEQ  4,1(7) 	Jump if true 
 58:    LDC  3,0(6) 	False case 
 59:    LDC  4,1(6) 	Load constant 1 
 60:    SUB  3,3,4 	If cond check 
 61:    JGE  3,1(7) 	Jump to then part 
* THEN
* 11
 63:     LD  3,-5(1) 	Load variable ans
 64:     ST  3,-6(1) 	Save left side in temp 
 65:     LD  3,-4(1) 	Load variable sqr
 66:     LD  4,-6(1) 	Load left from temp into ac1 
 67:    MUL  3,4,3 	Op * 
 68:     ST  3,-5(1) 	Store variable ans
 62:    LDA  7,6(7) 	Jump around the THEN 
* ENDIF
* 12
 69:     LD  3,-3(1) 	Load variable p
 70:     ST  3,-6(1) 	Save left side in temp 
 71:    LDC  3,2(6) 	Load constant 
 72:     LD  4,-6(1) 	Load left from temp into ac1 
 73:    DIV  3,4,3 	Op / 
 74:     ST  3,-3(1) 	Store variable p
* IF
 75:     LD  3,-3(1) 	Load variable p
 76:     ST  3,-6(1) 	Save left side in temp 
 77:    LDC  3,0(6) 	Load constant 
 78:     LD  4,-6(1) 	Load left from temp into ac1 
 79:    SUB  4,4,3 	Op == 
 80:    LDC  3,1(6) 	True case 
 81:    JEQ  4,1(7) 	Jump if true 
 82:    LDC  3,0(6) 	False case 
 83:    LDC  4,1(6) 	Load constant 1 
 84:    SUB  3,3,4 	If cond check 
 85:    JGE  3,1(7) 	Jump to then part 
* THEN
* RETURN
 87:     LD  3,-5(1) 	Load variable ans
 88:    LDA  2,0(3) 	Copy result to rt register 
 89:     LD  3,-1(1) 	Load return address 
 90:     LD  1,0(1) 	Adjust fp 
 91:    LDA  7,0(3) 	Return 
 86:    LDA  7,5(7) 	Jump around the THEN 
* ENDIF
* 14
 92:     LD  3,-4(1) 	Load variable sqr
 93:     ST  3,-6(1) 	Save left side in temp 
 94:     LD  3,-4(1) 	Load variable sqr
 95:     LD  4,-6(1) 	Load left from temp into ac1 
 96:    MUL  3,4,3 	Op * 
 97:     ST  3,-4(1) 	Store variable sqr
* END compound statement
 98:    LDA  7,-59(7) 	go to beginning of loop 
 44:    LDA  7,54(7) 	No more loop 
* ENDWHILE
* END compound statement
* Add standard closing in case there is no return statement
 99:    LDC  2,0(6) 	Set return value to 0 
100:     LD  3,-1(1) 	Load return address 
101:     LD  1,0(1) 	Adjust fp 
102:    LDA  7,0(3) 	Return 
* END of function pow
* BEGIN function getFunc
103:     ST  3,-1(1) 	Store return address. BEGIN FUNC: getFunc
* BEGIN compound statement
* IF
104:     ST  1,-6(1) 	Store old fp in ghost frame 
105:    LDA  1,-6(1) 	Load address of new frame 
106:    LDA  3,1(7) 	Return address in ac 
107:    LDA  7,-102(7) 	call input
108:    LDA  3,0(2) 	Save the result in ac 
109:     ST  3,-3(1) 	Store variable numbits
110:     ST  3,-6(1) 	Save left side in temp 
111:    LDC  3,0(6) 	Load constant 
112:     LD  4,-6(1) 	Load left from temp into ac1 
113:    SUB  4,4,3 	Op == 
114:    LDC  3,1(6) 	True case 
115:    JEQ  4,1(7) 	Jump if true 
116:    LDC  3,0(6) 	False case 
117:    LDC  4,1(6) 	Load constant 1 
118:    SUB  3,3,4 	If cond check 
119:    JGE  3,1(7) 	Jump to then part 
* THEN
* RETURN
121:    LDC  3,0(6) 	Load constant 
122:    LDA  2,0(3) 	Copy result to rt register 
123:     LD  3,-1(1) 	Load return address 
124:     LD  1,0(1) 	Adjust fp 
125:    LDA  7,0(3) 	Return 
120:    LDA  7,5(7) 	Jump around the THEN 
* ENDIF
* 26
126:     ST  1,-6(1) 	Store old fp in ghost frame 
127:    LDC  3,2(6) 	Load constant 
128:     ST  3,-8(1) 	Store parameter 
129:     LD  3,-3(1) 	Load variable numbits
130:     ST  3,-9(1) 	Store parameter 
131:    LDA  1,-6(1) 	Load address of new frame 
132:    LDA  3,1(7) 	Return address in ac 
133:    LDA  7,-99(7) 	call pow
134:    LDA  3,0(2) 	Save the result in ac 
135:     ST  3,-5(1) 	Store variable size
* 27
136:    LDC  3,0(6) 	Load constant 
137:     ST  3,-4(1) 	Store variable i
* WHILE
138:     LD  3,-4(1) 	Load variable i
139:     ST  3,-6(1) 	Save left side in temp 
140:     LD  3,-5(1) 	Load variable size
141:     LD  4,-6(1) 	Load left from temp into ac1 
142:    SUB  4,4,3 	Op < 
143:    LDC  3,1(6) 	True case 
144:    JLT  4,1(7) 	Jump if true 
145:    LDC  3,0(6) 	False case 
146:    LDC  4,1(6) 	Load constant 1 
147:    SUB  3,3,4 	While cond check 
148:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 29
150:     LD  3,-4(1) 	Load variable i
151:     ST  3,-6(1) 	Save index in temp 
152:     ST  1,-7(1) 	Store old fp in ghost frame 
153:    LDA  1,-7(1) 	Load address of new frame 
154:    LDA  3,1(7) 	Return address in ac 
155:    LDA  7,-150(7) 	call input
156:    LDA  3,0(2) 	Save the result in ac 
157:     LD  4,-6(1) 	load index from temp to ac1 
158:     LD  5,-2(1) 	Load address of base of array f
159:    SUB  5,5,4 	Compute offset of value 
160:     ST  3,0(5) 	Store variable f
* 30
161:     LD  3,-4(1) 	Load variable i
162:     ST  3,-6(1) 	Save left side in temp 
163:    LDC  3,1(6) 	Load constant 
164:     LD  4,-6(1) 	Load left from temp into ac1 
165:    ADD  3,4,3 	Op + 
166:     ST  3,-4(1) 	Store variable i
* END compound statement
167:    LDA  7,-30(7) 	go to beginning of loop 
149:    LDA  7,18(7) 	No more loop 
* ENDWHILE
* RETURN
168:     LD  3,-3(1) 	Load variable numbits
169:    LDA  2,0(3) 	Copy result to rt register 
170:     LD  3,-1(1) 	Load return address 
171:     LD  1,0(1) 	Adjust fp 
172:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
173:    LDC  2,0(6) 	Set return value to 0 
174:     LD  3,-1(1) 	Load return address 
175:     LD  1,0(1) 	Adjust fp 
176:    LDA  7,0(3) 	Return 
* END of function getFunc
* BEGIN function printFunc
177:     ST  3,-1(1) 	Store return address. BEGIN FUNC: printFunc
* BEGIN compound statement
* 41
178:    LDC  3,0(6) 	Load constant 
179:     ST  3,-4(1) 	Store variable i
* WHILE
180:     LD  3,-4(1) 	Load variable i
181:     ST  3,-5(1) 	Save left side in temp 
182:     LD  3,-3(1) 	Load variable size
183:     LD  4,-5(1) 	Load left from temp into ac1 
184:    SUB  4,4,3 	Op < 
185:    LDC  3,1(6) 	True case 
186:    JLT  4,1(7) 	Jump if true 
187:    LDC  3,0(6) 	False case 
188:    LDC  4,1(6) 	Load constant 1 
189:    SUB  3,3,4 	While cond check 
190:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 43
192:     ST  1,-5(1) 	Store old fp in ghost frame 
193:     LD  3,-4(1) 	Load variable i
194:     LD  4,-2(1) 	Load address of base of array f
195:    SUB  3,4,3 	Compute offset of value 
196:     LD  3,0(3) 	Load the value 
197:     ST  3,-7(1) 	Store parameter 
198:    LDA  1,-5(1) 	Load address of new frame 
199:    LDA  3,1(7) 	Return address in ac 
200:    LDA  7,-190(7) 	call output
201:    LDA  3,0(2) 	Save the result in ac 
* 44
202:     LD  3,-4(1) 	Load variable i
203:     ST  3,-5(1) 	Save left side in temp 
204:    LDC  3,1(6) 	Load constant 
205:     LD  4,-5(1) 	Load left from temp into ac1 
206:    ADD  3,4,3 	Op + 
207:     ST  3,-4(1) 	Store variable i
* END compound statement
208:    LDA  7,-29(7) 	go to beginning of loop 
191:    LDA  7,17(7) 	No more loop 
* ENDWHILE
* 46
209:     ST  1,-5(1) 	Store old fp in ghost frame 
210:    LDA  1,-5(1) 	Load address of new frame 
211:    LDA  3,1(7) 	Return address in ac 
212:    LDA  7,-183(7) 	call outnl
213:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
214:    LDC  2,0(6) 	Set return value to 0 
215:     LD  3,-1(1) 	Load return address 
216:     LD  1,0(1) 	Adjust fp 
217:    LDA  7,0(3) 	Return 
* END of function printFunc
* BEGIN function fwt
218:     ST  3,-1(1) 	Store return address. BEGIN FUNC: fwt
* BEGIN compound statement
* 54
219:     LD  3,-4(1) 	Load variable size
220:     ST  3,-8(1) 	Save left side in temp 
221:    LDC  3,2(6) 	Load constant 
222:     LD  4,-8(1) 	Load left from temp into ac1 
223:    DIV  3,4,3 	Op / 
224:     ST  3,-4(1) 	Store variable size
* IF
225:     LD  3,-4(1) 	Load variable size
226:     ST  3,-8(1) 	Save left side in temp 
227:    LDC  3,1(6) 	Load constant 
228:     LD  4,-8(1) 	Load left from temp into ac1 
229:    SUB  4,4,3 	Op > 
230:    LDC  3,1(6) 	True case 
231:    JGT  4,1(7) 	Jump if true 
232:    LDC  3,0(6) 	False case 
233:    LDC  4,1(6) 	Load constant 1 
234:    SUB  3,3,4 	If cond check 
235:    JGE  3,1(7) 	Jump to then part 
* THEN
* BEGIN compound statement
* 56
237:     ST  1,-8(1) 	Store old fp in ghost frame 
238:     LD  3,-2(1) 	Load address of base of array w
239:     ST  3,-10(1) 	Store parameter 
240:     LD  3,-3(1) 	Load variable start
241:     ST  3,-11(1) 	Store parameter 
242:     LD  3,-4(1) 	Load variable size
243:     ST  3,-12(1) 	Store parameter 
244:    LDA  1,-8(1) 	Load address of new frame 
245:    LDA  3,1(7) 	Return address in ac 
246:    LDA  7,-29(7) 	call fwt
247:    LDA  3,0(2) 	Save the result in ac 
* 57
248:     ST  1,-8(1) 	Store old fp in ghost frame 
249:     LD  3,-2(1) 	Load address of base of array w
250:     ST  3,-10(1) 	Store parameter 
251:     LD  3,-3(1) 	Load variable start
252:     ST  3,-11(1) 	Save left side in temp 
253:     LD  3,-4(1) 	Load variable size
254:     LD  4,-11(1) 	Load left from temp into ac1 
255:    ADD  3,4,3 	Op + 
256:     ST  3,-11(1) 	Store parameter 
257:     LD  3,-4(1) 	Load variable size
258:     ST  3,-12(1) 	Store parameter 
259:    LDA  1,-8(1) 	Load address of new frame 
260:    LDA  3,1(7) 	Return address in ac 
261:    LDA  7,-44(7) 	call fwt
262:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
236:    LDA  7,26(7) 	Jump around the THEN 
* ENDIF
* 60
263:     LD  3,-3(1) 	Load variable start
264:     ST  3,-5(1) 	Store variable a
* 61
265:     LD  3,-3(1) 	Load variable start
266:     ST  3,-8(1) 	Save left side in temp 
267:     LD  3,-4(1) 	Load variable size
268:     LD  4,-8(1) 	Load left from temp into ac1 
269:    ADD  3,4,3 	Op + 
270:     ST  3,-6(1) 	Store variable b
* WHILE
271:     LD  3,-5(1) 	Load variable a
272:     ST  3,-8(1) 	Save left side in temp 
273:     LD  3,-3(1) 	Load variable start
274:     ST  3,-9(1) 	Save left side in temp 
275:     LD  3,-4(1) 	Load variable size
276:     LD  4,-9(1) 	Load left from temp into ac1 
277:    ADD  3,4,3 	Op + 
278:     LD  4,-8(1) 	Load left from temp into ac1 
279:    SUB  4,4,3 	Op < 
280:    LDC  3,1(6) 	True case 
281:    JLT  4,1(7) 	Jump if true 
282:    LDC  3,0(6) 	False case 
283:    LDC  4,1(6) 	Load constant 1 
284:    SUB  3,3,4 	While cond check 
285:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 63
287:     LD  3,-5(1) 	Load variable a
288:     LD  4,-2(1) 	Load address of base of array w
289:    SUB  3,4,3 	Compute offset of value 
290:     LD  3,0(3) 	Load the value 
291:     ST  3,-7(1) 	Store variable tmp
* 64
292:     LD  3,-5(1) 	Load variable a
293:     ST  3,-8(1) 	Save index in temp 
294:     LD  3,-5(1) 	Load variable a
295:     LD  4,-2(1) 	Load address of base of array w
296:    SUB  3,4,3 	Compute offset of value 
297:     LD  3,0(3) 	Load the value 
298:     ST  3,-9(1) 	Save left side in temp 
299:     LD  3,-6(1) 	Load variable b
300:     LD  4,-2(1) 	Load address of base of array w
301:    SUB  3,4,3 	Compute offset of value 
302:     LD  3,0(3) 	Load the value 
303:     LD  4,-9(1) 	Load left from temp into ac1 
304:    ADD  3,4,3 	Op + 
305:     LD  4,-8(1) 	load index from temp to ac1 
306:     LD  5,-2(1) 	Load address of base of array w
307:    SUB  5,5,4 	Compute offset of value 
308:     ST  3,0(5) 	Store variable w
* 65
309:     LD  3,-6(1) 	Load variable b
310:     ST  3,-8(1) 	Save index in temp 
311:     LD  3,-7(1) 	Load variable tmp
312:     ST  3,-9(1) 	Save left side in temp 
313:     LD  3,-6(1) 	Load variable b
314:     LD  4,-2(1) 	Load address of base of array w
315:    SUB  3,4,3 	Compute offset of value 
316:     LD  3,0(3) 	Load the value 
317:     LD  4,-9(1) 	Load left from temp into ac1 
318:    SUB  3,4,3 	Op - 
319:     LD  4,-8(1) 	load index from temp to ac1 
320:     LD  5,-2(1) 	Load address of base of array w
321:    SUB  5,5,4 	Compute offset of value 
322:     ST  3,0(5) 	Store variable w
* 66
323:     LD  3,-5(1) 	Load variable a
324:     ST  3,-8(1) 	Save left side in temp 
325:    LDC  3,1(6) 	Load constant 
326:     LD  4,-8(1) 	Load left from temp into ac1 
327:    ADD  3,4,3 	Op + 
328:     ST  3,-5(1) 	Store variable a
* 67
329:     LD  3,-6(1) 	Load variable b
330:     ST  3,-8(1) 	Save left side in temp 
331:    LDC  3,1(6) 	Load constant 
332:     LD  4,-8(1) 	Load left from temp into ac1 
333:    ADD  3,4,3 	Op + 
334:     ST  3,-6(1) 	Store variable b
* END compound statement
335:    LDA  7,-65(7) 	go to beginning of loop 
286:    LDA  7,49(7) 	No more loop 
* ENDWHILE
* END compound statement
* Add standard closing in case there is no return statement
336:    LDC  2,0(6) 	Set return value to 0 
337:     LD  3,-1(1) 	Load return address 
338:     LD  1,0(1) 	Adjust fp 
339:    LDA  7,0(3) 	Return 
* END of function fwt
* BEGIN function div
340:     ST  3,-1(1) 	Store return address. BEGIN FUNC: div
* BEGIN compound statement
* 76
341:    LDC  3,0(6) 	Load constant 
342:     ST  3,-4(1) 	Store variable i
* WHILE
343:     LD  3,-4(1) 	Load variable i
344:     ST  3,-5(1) 	Save left side in temp 
345:     LD  3,-3(1) 	Load variable size
346:     LD  4,-5(1) 	Load left from temp into ac1 
347:    SUB  4,4,3 	Op < 
348:    LDC  3,1(6) 	True case 
349:    JLT  4,1(7) 	Jump if true 
350:    LDC  3,0(6) 	False case 
351:    LDC  4,1(6) 	Load constant 1 
352:    SUB  3,3,4 	While cond check 
353:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 78
355:     LD  3,-4(1) 	Load variable i
356:     ST  3,-5(1) 	Save index in temp 
357:     LD  3,-4(1) 	Load variable i
358:     LD  4,-2(1) 	Load address of base of array f
359:    SUB  3,4,3 	Compute offset of value 
360:     LD  3,0(3) 	Load the value 
361:     ST  3,-6(1) 	Save left side in temp 
362:     LD  3,-3(1) 	Load variable size
363:     LD  4,-6(1) 	Load left from temp into ac1 
364:    DIV  3,4,3 	Op / 
365:     LD  4,-5(1) 	load index from temp to ac1 
366:     LD  5,-2(1) 	Load address of base of array f
367:    SUB  5,5,4 	Compute offset of value 
368:     ST  3,0(5) 	Store variable f
* 79
369:     LD  3,-4(1) 	Load variable i
370:     ST  3,-5(1) 	Save left side in temp 
371:    LDC  3,1(6) 	Load constant 
372:     LD  4,-5(1) 	Load left from temp into ac1 
373:    ADD  3,4,3 	Op + 
374:     ST  3,-4(1) 	Store variable i
* END compound statement
375:    LDA  7,-33(7) 	go to beginning of loop 
354:    LDA  7,21(7) 	No more loop 
* ENDWHILE
* END compound statement
* Add standard closing in case there is no return statement
376:    LDC  2,0(6) 	Set return value to 0 
377:     LD  3,-1(1) 	Load return address 
378:     LD  1,0(1) 	Adjust fp 
379:    LDA  7,0(3) 	Return 
* END of function div
* BEGIN function main
  4:    LDA  7,375(7) 	Jump to main 
380:     ST  3,-1(1) 	Store return address. BEGIN FUNC: main
* BEGIN compound statement
* WHILE
381:    LDC  3,1(6) 	Load constant 
382:    LDC  4,1(6) 	Load constant 1 
383:    SUB  3,3,4 	While cond check 
384:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* IF
386:     ST  1,-262(1) 	Store old fp in ghost frame 
387:    LDA  3,-2(1) 	Load address of base of array f
388:     ST  3,-264(1) 	Store parameter 
389:    LDA  1,-262(1) 	Load address of new frame 
390:    LDA  3,1(7) 	Return address in ac 
391:    LDA  7,-289(7) 	call getFunc
392:    LDA  3,0(2) 	Save the result in ac 
393:     ST  3,-260(1) 	Store variable numbits
394:     ST  3,-262(1) 	Save left side in temp 
395:    LDC  3,0(6) 	Load constant 
396:     LD  4,-262(1) 	Load left from temp into ac1 
397:    SUB  4,4,3 	Op == 
398:    LDC  3,1(6) 	True case 
399:    JEQ  4,1(7) 	Jump if true 
400:    LDC  3,0(6) 	False case 
401:    LDC  4,1(6) 	Load constant 1 
402:    SUB  3,3,4 	If cond check 
403:    JGE  3,1(7) 	Jump to then part 
* THEN
* RETURN
405:    LDC  3,0(6) 	Load constant 
406:    LDA  2,0(3) 	Copy result to rt register 
407:     LD  3,-1(1) 	Load return address 
408:     LD  1,0(1) 	Adjust fp 
409:    LDA  7,0(3) 	Return 
404:    LDA  7,5(7) 	Jump around the THEN 
* ENDIF
* 94
410:     ST  1,-262(1) 	Store old fp in ghost frame 
411:    LDC  3,2(6) 	Load constant 
412:     ST  3,-264(1) 	Store parameter 
413:     LD  3,-260(1) 	Load variable numbits
414:     ST  3,-265(1) 	Store parameter 
415:    LDA  1,-262(1) 	Load address of new frame 
416:    LDA  3,1(7) 	Return address in ac 
417:    LDA  7,-383(7) 	call pow
418:    LDA  3,0(2) 	Save the result in ac 
419:     ST  3,-259(1) 	Store variable size
* 95
420:     LD  3,-259(1) 	Load variable size
421:     ST  3,-262(1) 	Save left side in temp 
422:    LDC  3,2(6) 	Load constant 
423:     LD  4,-262(1) 	Load left from temp into ac1 
424:    DIV  3,4,3 	Op / 
425:     ST  3,-261(1) 	Store variable half
* 97
426:     ST  1,-262(1) 	Store old fp in ghost frame 
427:    LDA  3,-2(1) 	Load address of base of array f
428:     ST  3,-264(1) 	Store parameter 
429:    LDC  3,0(6) 	Load constant 
430:     ST  3,-265(1) 	Store parameter 
431:     LD  3,-259(1) 	Load variable size
432:     ST  3,-266(1) 	Store parameter 
433:    LDA  1,-262(1) 	Load address of new frame 
434:    LDA  3,1(7) 	Return address in ac 
435:    LDA  7,-218(7) 	call fwt
436:    LDA  3,0(2) 	Save the result in ac 
* 98
437:     ST  1,-262(1) 	Store old fp in ghost frame 
438:    LDA  3,-2(1) 	Load address of base of array f
439:     ST  3,-264(1) 	Store parameter 
440:     LD  3,-259(1) 	Load variable size
441:     ST  3,-265(1) 	Store parameter 
442:    LDA  1,-262(1) 	Load address of new frame 
443:    LDA  3,1(7) 	Return address in ac 
444:    LDA  7,-268(7) 	call printFunc
445:    LDA  3,0(2) 	Save the result in ac 
* 100
446:     ST  1,-262(1) 	Store old fp in ghost frame 
447:    LDA  3,-2(1) 	Load address of base of array f
448:     ST  3,-264(1) 	Store parameter 
449:    LDC  3,0(6) 	Load constant 
450:     ST  3,-265(1) 	Store parameter 
451:     LD  3,-259(1) 	Load variable size
452:     ST  3,-266(1) 	Store parameter 
453:    LDA  1,-262(1) 	Load address of new frame 
454:    LDA  3,1(7) 	Return address in ac 
455:    LDA  7,-238(7) 	call fwt
456:    LDA  3,0(2) 	Save the result in ac 
* 101
457:     ST  1,-262(1) 	Store old fp in ghost frame 
458:    LDA  3,-2(1) 	Load address of base of array f
459:     ST  3,-264(1) 	Store parameter 
460:     LD  3,-259(1) 	Load variable size
461:     ST  3,-265(1) 	Store parameter 
462:    LDA  1,-262(1) 	Load address of new frame 
463:    LDA  3,1(7) 	Return address in ac 
464:    LDA  7,-125(7) 	call div
465:    LDA  3,0(2) 	Save the result in ac 
* 102
466:     ST  1,-262(1) 	Store old fp in ghost frame 
467:    LDA  3,-2(1) 	Load address of base of array f
468:     ST  3,-264(1) 	Store parameter 
469:     LD  3,-259(1) 	Load variable size
470:     ST  3,-265(1) 	Store parameter 
471:    LDA  1,-262(1) 	Load address of new frame 
472:    LDA  3,1(7) 	Return address in ac 
473:    LDA  7,-297(7) 	call printFunc
474:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
475:    LDA  7,-95(7) 	go to beginning of loop 
385:    LDA  7,90(7) 	No more loop 
* ENDWHILE
* RETURN
476:    LDC  3,0(6) 	Load constant 
477:    LDA  2,0(3) 	Copy result to rt register 
478:     LD  3,-1(1) 	Load return address 
479:     LD  1,0(1) 	Adjust fp 
480:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
481:    LDC  2,0(6) 	Set return value to 0 
482:     LD  3,-1(1) 	Load return address 
483:     LD  1,0(1) 	Adjust fp 
484:    LDA  7,0(3) 	Return 
* END of function main
