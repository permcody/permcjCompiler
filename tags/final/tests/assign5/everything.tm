* C- compiler version C-06
* Author: Robert B. Heckendorn
* Backend coauthor: Jorge Williams
* Apr 1, 2006
* BEGIN Prolog
  0:     LD  0,0(0) 	Set the global pointer 
  1:    LDA  1,-1(0) 	set first frame at end of globals 
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
* BEGIN function wallace
 35:     ST  3,-1(1) 	Store return address. BEGIN FUNC: wallace
* BEGIN compound statement
* 12
 36:     LD  3,-4(1) 	Load variable close
* 13
 37:     LD  3,-5(1) 	Load variable shave
 38:     ST  3,-4(1) 	Store variable close
* 14
 39:     LD  3,-3(1) 	Load variable trousers
 40:     ST  3,-22(1) 	Save left side in temp 
 41:    LDC  3,666(6) 	Load constant 
 42:     ST  3,-23(1) 	Save left side in temp 
 43:     LD  3,-2(1) 	Load variable wrong
 44:     LD  4,-23(1) 	Load left from temp into ac1 
 45:    DIV  3,4,3 	Op / 
 46:     LD  4,-22(1) 	Load left from temp into ac1 
 47:    DIV  5,4,3 	Op % 
 48:    MUL  5,5,3 	 
 49:    SUB  3,4,5 	 
 50:     ST  3,-2(1) 	Store variable wrong
* 15
 51:     LD  3,-2(1) 	Load variable wrong
 52:     ST  3,-22(1) 	Save left side in temp 
 53:     LD  3,-3(1) 	Load variable trousers
 54:     LD  4,-22(1) 	Load left from temp into ac1 
 55:    MUL  3,4,3 	Op * 
 56:     ST  3,-22(1) 	Save left side in temp 
 57:     LD  3,0(0) 	Load variable gromet
 58:     LD  4,-22(1) 	Load left from temp into ac1 
 59:    SUB  3,4,3 	Op - 
 60:     ST  3,-22(1) 	Save left side in temp 
 61:    LDC  3,42(6) 	Load constant 
 62:    LDC  4,0(6) 	Load 0 
 63:    SUB  3,4,3 	Op unary - 
 64:     LD  4,-22(1) 	Load left from temp into ac1 
 65:    ADD  3,4,3 	Op + 
 66:     ST  3,0(0) 	Store variable gromet
* 16
 67:     LD  3,0(0) 	Load variable gromet
 68:     ST  3,-22(1) 	Save left side in temp 
 69:    LDC  3,27182818(6) 	Load constant 
 70:     LD  4,-22(1) 	Load left from temp into ac1 
 71:    ADD  3,4,3 	Op + 
 72:     ST  3,0(0) 	Store variable gromet
* 17
 73:     LD  3,0(0) 	Load variable gromet
 74:     ST  3,-22(1) 	Save left side in temp 
 75:    LDC  3,31415927(6) 	Load constant 
 76:     LD  4,-22(1) 	Load left from temp into ac1 
 77:    SUB  3,4,3 	Op - 
 78:     ST  3,0(0) 	Store variable gromet
* 18
 79:     LD  3,-2(1) 	Load variable wrong
 80:     ST  3,-22(1) 	Save left side in temp 
 81:     LD  3,-3(1) 	Load variable trousers
 82:     LD  4,-22(1) 	Load left from temp into ac1 
 83:    SUB  4,4,3 	Op < 
 84:    LDC  3,1(6) 	True case 
 85:    JLT  4,1(7) 	Jump if true 
 86:    LDC  3,0(6) 	False case 
 87:     ST  3,-22(1) 	Save left side in temp 
 88:     LD  3,-3(1) 	Load variable trousers
 89:     ST  3,-23(1) 	Save left side in temp 
 90:     LD  3,0(0) 	Load variable gromet
 91:     LD  4,-23(1) 	Load left from temp into ac1 
 92:    SUB  4,4,3 	Op <= 
 93:    LDC  3,1(6) 	True case 
 94:    JLE  4,1(7) 	Jump if true 
 95:    LDC  3,0(6) 	False case 
 96:     LD  4,-22(1) 	Load left from temp into ac1 
 97:    JEQ  3,3(7) 	Jump if false for Op && 
 98:    LDC  3,0(6) 	False case 
 99:    JEQ  4,1(7) 	Jump if false 
100:    LDC  3,1(6) 	True case 
101:     ST  3,-4(1) 	Store variable close
* 19
102:     LD  3,-2(1) 	Load variable wrong
103:     ST  3,-22(1) 	Save left side in temp 
104:     LD  3,-3(1) 	Load variable trousers
105:     LD  4,-22(1) 	Load left from temp into ac1 
106:    SUB  4,4,3 	Op > 
107:    LDC  3,1(6) 	True case 
108:    JGT  4,1(7) 	Jump if true 
109:    LDC  3,0(6) 	False case 
110:     ST  3,-22(1) 	Save left side in temp 
111:     LD  3,-3(1) 	Load variable trousers
112:     ST  3,-23(1) 	Save left side in temp 
113:     LD  3,0(0) 	Load variable gromet
114:     LD  4,-23(1) 	Load left from temp into ac1 
115:    SUB  4,4,3 	Op >= 
116:    LDC  3,1(6) 	True case 
117:    JGE  4,1(7) 	Jump if true 
118:    LDC  3,0(6) 	False case 
119:     LD  4,-22(1) 	Load left from temp into ac1 
120:    JEQ  3,3(7) 	Jump if false for Op && 
121:    LDC  3,0(6) 	False case 
122:    JEQ  4,1(7) 	Jump if false 
123:    LDC  3,1(6) 	True case 
124:     ST  3,-5(1) 	Store variable shave
* BEGIN compound statement
* 22
125:     LD  3,-8(1) 	Load variable day
126:     ST  3,-22(1) 	Save left side in temp 
127:     LD  3,-9(1) 	Load variable out
128:     LD  4,-22(1) 	Load left from temp into ac1 
129:    SUB  3,4,3 	Op - 
130:     ST  3,-7(1) 	Store variable grand
131:     ST  3,-6(1) 	Store variable a
* END compound statement
* 24
132:    LDC  3,1(6) 	Load constant 
133:    LDC  4,0(6) 	Load 0 
134:    SUB  3,4,3 	Op unary - 
135:     ST  3,-22(1) 	Save left side in temp 
136:    LDC  3,2(6) 	Load constant 
137:     LD  4,-22(1) 	Load left from temp into ac1 
138:    MUL  3,4,3 	Op * 
139:     ST  3,-22(1) 	Save left side in temp 
140:    LDC  3,3(6) 	Load constant 
141:     LD  4,-22(1) 	Load left from temp into ac1 
142:    ADD  3,4,3 	Op + 
143:     ST  3,-22(1) 	Save left side in temp 
144:    LDC  3,4(6) 	Load constant 
145:     ST  3,-23(1) 	Save left side in temp 
146:    LDC  3,5(6) 	Load constant 
147:     LD  4,-23(1) 	Load left from temp into ac1 
148:    MUL  3,4,3 	Op * 
149:     LD  4,-22(1) 	Load left from temp into ac1 
150:    SUB  4,4,3 	Op < 
151:    LDC  3,1(6) 	True case 
152:    JLT  4,1(7) 	Jump if true 
153:    LDC  3,0(6) 	False case 
154:     ST  3,-22(1) 	Save left side in temp 
155:    LDC  3,6(6) 	Load constant 
156:     ST  3,-23(1) 	Save left side in temp 
157:    LDC  3,7(6) 	Load constant 
158:     LD  4,-23(1) 	Load left from temp into ac1 
159:    ADD  3,4,3 	Op + 
160:     ST  3,-23(1) 	Save left side in temp 
161:    LDC  3,3(6) 	Load constant 
162:    LDC  4,0(6) 	Load 0 
163:    SUB  3,4,3 	Op unary - 
164:     LD  4,-23(1) 	Load left from temp into ac1 
165:    SUB  4,4,3 	Op > 
166:    LDC  3,1(6) 	True case 
167:    JGT  4,1(7) 	Jump if true 
168:    LDC  3,0(6) 	False case 
169:     LD  4,-22(1) 	Load left from temp into ac1 
170:    JEQ  3,3(7) 	Jump if false for Op && 
171:    LDC  3,0(6) 	False case 
172:    JEQ  4,1(7) 	Jump if false 
173:    LDC  3,1(6) 	True case 
174:     ST  3,-4(1) 	Store variable close
* 25
175:    LDC  3,1(6) 	Load constant 
176:     ST  3,-22(1) 	Save left side in temp 
177:    LDC  3,1(6) 	Load constant 
178:     ST  3,-23(1) 	Save left side in temp 
179:    LDC  3,2(6) 	Load constant 
180:     ST  3,-24(1) 	Save left side in temp 
181:    LDC  3,3(6) 	Load constant 
182:     LD  4,-24(1) 	Load left from temp into ac1 
183:    ADD  3,4,3 	Op + 
184:     LD  4,-23(1) 	Load left from temp into ac1 
185:    MUL  3,4,3 	Op * 
186:    LDC  4,0(6) 	Load 0 
187:    SUB  3,4,3 	Op unary - 
188:     ST  3,-23(1) 	Save left side in temp 
189:    LDC  3,4(6) 	Load constant 
190:     ST  3,-24(1) 	Save left side in temp 
191:    LDC  3,5(6) 	Load constant 
192:     LD  4,-24(1) 	Load left from temp into ac1 
193:    MUL  3,4,3 	Op * 
194:     LD  4,-23(1) 	Load left from temp into ac1 
195:    SUB  4,4,3 	Op < 
196:    LDC  3,1(6) 	True case 
197:    JLT  4,1(7) 	Jump if true 
198:    LDC  3,0(6) 	False case 
199:     ST  3,-23(1) 	Save left side in temp 
200:    LDC  3,6(6) 	Load constant 
201:     ST  3,-24(1) 	Save left side in temp 
202:    LDC  3,7(6) 	Load constant 
203:     LD  4,-24(1) 	Load left from temp into ac1 
204:    ADD  3,4,3 	Op + 
205:     ST  3,-24(1) 	Save left side in temp 
206:    LDC  3,3(6) 	Load constant 
207:    LDC  4,0(6) 	Load 0 
208:    SUB  3,4,3 	Op unary - 
209:     LD  4,-24(1) 	Load left from temp into ac1 
210:    SUB  4,4,3 	Op > 
211:    LDC  3,1(6) 	True case 
212:    JGT  4,1(7) 	Jump if true 
213:    LDC  3,0(6) 	False case 
214:     LD  4,-23(1) 	Load left from temp into ac1 
215:    JEQ  3,3(7) 	Jump if false for Op && 
216:    LDC  3,0(6) 	False case 
217:    JEQ  4,1(7) 	Jump if false 
218:    LDC  3,1(6) 	True case 
219:     LD  4,-22(1) 	Load left from temp into ac1 
220:    ADD  3,4,3 	Op || 
221:    JEQ  3,1(7) 	Jump if false 
222:    LDC  3,1(6) 	True case 
223:     ST  3,-5(1) 	Store variable shave
* IF
224:     LD  3,-5(1) 	Load variable shave
225:     ST  3,-22(1) 	Save left side in temp 
226:     LD  3,-4(1) 	Load variable close
227:     LD  4,-22(1) 	Load left from temp into ac1 
228:    SUB  3,4,3 	Op != 
229:    JEQ  3,1(7) 	Jump if true 
230:    LDC  3,1(6) 	True case 
231:    LDC  4,1(6) 	Load constant 1 
232:    SUB  3,3,4 	If cond check 
233:    JGE  3,1(7) 	Jump to then part 
* THEN
* 26
235:     LD  3,-4(1) 	Load variable close
236:    LDC  4,1(6) 	Load 1 
237:    SUB  3,4,3 	Op ! 
238:     ST  3,-5(1) 	Store variable shave
234:    LDA  7,4(7) 	Jump around the THEN 
* ENDIF
* IF
239:     LD  3,-5(1) 	Load variable shave
240:     ST  3,-22(1) 	Save left side in temp 
241:     LD  3,-4(1) 	Load variable close
242:     LD  4,-22(1) 	Load left from temp into ac1 
243:    SUB  4,4,3 	Op == 
244:    LDC  3,1(6) 	True case 
245:    JEQ  4,1(7) 	Jump if true 
246:    LDC  3,0(6) 	False case 
247:    LDC  4,1(6) 	Load 1 
248:    SUB  3,4,3 	Op ! 
249:     ST  3,-22(1) 	Save left side in temp 
250:     LD  3,-4(1) 	Load variable close
251:    LDC  4,1(6) 	Load 1 
252:    SUB  3,4,3 	Op ! 
253:     LD  4,-22(1) 	Load left from temp into ac1 
254:    ADD  3,4,3 	Op || 
255:    JEQ  3,1(7) 	Jump if false 
256:    LDC  3,1(6) 	True case 
257:    LDC  4,1(6) 	Load constant 1 
258:    SUB  3,3,4 	If cond check 
259:    JGE  3,1(7) 	Jump to then part 
* THEN
* 27
261:    LDC  3,1(6) 	Load constant 
262:     ST  3,-5(1) 	Store variable shave
* ELSE
260:    LDA  7,3(7) 	Jump around the THEN 
* 28
264:    LDC  3,0(6) 	Load constant 
265:     ST  3,-4(1) 	Store variable close
263:    LDA  7,2(7) 	Jump around the ELSE 
* ENDIF
* WHILE
266:     LD  3,-5(1) 	Load variable shave
267:    LDC  4,1(6) 	Load constant 1 
268:    SUB  3,3,4 	While cond check 
269:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 33
271:    LDC  3,2(6) 	Load constant 
272:     ST  3,-22(1) 	Save index in temp 
273:    LDC  3,1618(6) 	Load constant 
274:     LD  4,-22(1) 	load index from temp to ac1 
275:    LDA  5,-12(1) 	Load address of base of array sheep
276:    SUB  5,5,4 	Compute offset of value 
277:     ST  3,0(5) 	Store variable sheep
* IF
278:    LDC  3,2(6) 	Load constant 
279:    LDA  4,-12(1) 	Load address of base of array sheep
280:    SUB  3,4,3 	Compute offset of value 
281:     LD  3,0(3) 	Load the value 
282:     ST  3,-22(1) 	Save left side in temp 
283:    LDC  3,496(6) 	Load constant 
284:     LD  4,-22(1) 	Load left from temp into ac1 
285:    SUB  4,4,3 	Op < 
286:    LDC  3,1(6) 	True case 
287:    JLT  4,1(7) 	Jump if true 
288:    LDC  3,0(6) 	False case 
289:    LDC  4,1(6) 	Load constant 1 
290:    SUB  3,3,4 	If cond check 
291:    JGE  3,1(7) 	Jump to then part 
* THEN
* BREAK
293:    LDA  7,-24(7) 	break 
292:    LDA  7,1(7) 	Jump around the THEN 
* ENDIF
* 35
294:     ST  1,-22(1) 	Store old fp in ghost frame 
295:     LD  3,0(0) 	Load variable gromet
296:     ST  3,-24(1) 	Store parameter 
297:     LD  3,-10(1) 	Load variable were
298:     ST  3,-25(1) 	Save left side in temp 
299:     LD  3,-11(1) 	Load variable rabbit
300:     LD  4,-25(1) 	Load left from temp into ac1 
301:    SUB  3,4,3 	Op - 
302:     ST  3,-25(1) 	Store parameter 
303:    LDA  1,-22(1) 	Load address of new frame 
304:    LDA  3,1(7) 	Return address in ac 
305:    LDA  7,-271(7) 	call wallace
306:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
307:    LDA  7,-42(7) 	go to beginning of loop 
270:    LDA  7,37(7) 	No more loop 
* ENDWHILE
* RETURN
308:    LDA  2,0(3) 	Copy result to rt register 
309:     LD  3,-1(1) 	Load return address 
310:     LD  1,0(1) 	Adjust fp 
311:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
312:    LDC  2,0(6) 	Set return value to 0 
313:     LD  3,-1(1) 	Load return address 
314:     LD  1,0(1) 	Adjust fp 
315:    LDA  7,0(3) 	Return 
* END of function wallace
* BEGIN function Wendolene
316:     ST  3,-1(1) 	Store return address. BEGIN FUNC: Wendolene
* BEGIN compound statement
* RETURN
317:     LD  3,-2(1) 	Load variable wool
318:     ST  3,-6(1) 	Save left side in temp 
319:    LDC  3,0(6) 	Load constant 
320:     LD  4,-4(1) 	Load address of base of array yarn
321:    SUB  3,4,3 	Compute offset of value 
322:     LD  3,0(3) 	Load the value 
323:     LD  4,-6(1) 	Load left from temp into ac1 
324:    ADD  3,4,3 	Op + 
325:    LDA  2,0(3) 	Copy result to rt register 
326:     LD  3,-1(1) 	Load return address 
327:     LD  1,0(1) 	Adjust fp 
328:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
329:    LDC  2,0(6) 	Set return value to 0 
330:     LD  3,-1(1) 	Load return address 
331:     LD  1,0(1) 	Adjust fp 
332:    LDA  7,0(3) 	Return 
* END of function Wendolene
* BEGIN function ramsBottom
333:     ST  3,-1(1) 	Store return address. BEGIN FUNC: ramsBottom
* BEGIN compound statement
* 52
334:    LDC  3,42(6) 	Load constant 
335:     ST  3,-12(1) 	Save left side in temp 
336:     ST  1,-13(1) 	Store old fp in ghost frame 
337:    LDC  3,1(6) 	Load constant 
338:     ST  3,-15(1) 	Save left side in temp 
339:    LDC  3,2(6) 	Load constant 
340:     LD  4,-15(1) 	Load left from temp into ac1 
341:    ADD  3,4,3 	Op + 
342:     ST  3,-15(1) 	Save left side in temp 
343:    LDC  3,3(6) 	Load constant 
344:     LD  4,-15(1) 	Load left from temp into ac1 
345:    ADD  3,4,3 	Op + 
346:     ST  3,-15(1) 	Store parameter 
347:    LDC  3,1(6) 	Load constant 
348:     ST  3,-16(1) 	Save left side in temp 
349:    LDC  3,0(6) 	Load constant 
350:     LD  4,-16(1) 	Load left from temp into ac1 
351:    ADD  3,4,3 	Op || 
352:    JEQ  3,1(7) 	Jump if false 
353:    LDC  3,1(6) 	True case 
354:     ST  3,-16(1) 	Save left side in temp 
355:    LDC  3,1(6) 	Load constant 
356:     LD  4,-16(1) 	Load left from temp into ac1 
357:    JEQ  3,3(7) 	Jump if false for Op && 
358:    LDC  3,0(6) 	False case 
359:    JEQ  4,1(7) 	Jump if false 
360:    LDC  3,1(6) 	True case 
361:     ST  3,-16(1) 	Store parameter 
362:    LDA  3,-2(1) 	Load address of base of array chicken
363:     ST  3,-17(1) 	Store parameter 
364:    LDA  3,-4(1) 	Load address of base of array run
365:     ST  3,-18(1) 	Store parameter 
366:    LDA  1,-13(1) 	Load address of new frame 
367:    LDA  3,1(7) 	Return address in ac 
368:    LDA  7,-53(7) 	call Wendolene
369:    LDA  3,0(2) 	Save the result in ac 
370:     LD  4,-12(1) 	Load left from temp into ac1 
371:    MUL  3,4,3 	Op * 
* RETURN
372:    LDC  3,1(6) 	Load constant 
373:    LDA  4,-7(1) 	Load address of base of array wallace
374:    SUB  3,4,3 	Compute offset of value 
375:     LD  3,0(3) 	Load the value 
376:     ST  3,-12(1) 	Save left side in temp 
377:    LDC  3,2(6) 	Load constant 
378:    LDA  4,-9(1) 	Load address of base of array gromet
379:    SUB  3,4,3 	Compute offset of value 
380:     LD  3,0(3) 	Load the value 
381:    LDC  4,0(6) 	Load 0 
382:    SUB  3,4,3 	Op unary - 
383:     ST  3,-13(1) 	Save left side in temp 
384:    LDC  3,3(6) 	Load constant 
385:     LD  4,-13(1) 	Load left from temp into ac1 
386:    MUL  3,4,3 	Op * 
387:     LD  4,-12(1) 	Load left from temp into ac1 
388:    SUB  4,4,3 	Op >= 
389:    LDC  3,1(6) 	True case 
390:    JGE  4,1(7) 	Jump if true 
391:    LDC  3,0(6) 	False case 
392:    LDA  2,0(3) 	Copy result to rt register 
393:     LD  3,-1(1) 	Load return address 
394:     LD  1,0(1) 	Adjust fp 
395:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
396:    LDC  2,0(6) 	Set return value to 0 
397:     LD  3,-1(1) 	Load return address 
398:     LD  1,0(1) 	Adjust fp 
399:    LDA  7,0(3) 	Return 
* END of function ramsBottom
* BEGIN function main
  4:    LDA  7,395(7) 	Jump to main 
400:     ST  3,-1(1) 	Store return address. BEGIN FUNC: main
* BEGIN compound statement
* 59
401:     ST  1,-2(1) 	Store old fp in ghost frame 
402:     ST  1,-4(1) 	Store old fp in ghost frame 
403:    LDA  1,-4(1) 	Load address of new frame 
404:    LDA  3,1(7) 	Return address in ac 
405:    LDA  7,-73(7) 	call ramsBottom
406:    LDA  3,0(2) 	Save the result in ac 
407:     ST  3,-4(1) 	Store parameter 
408:    LDA  1,-2(1) 	Load address of new frame 
409:    LDA  3,1(7) 	Return address in ac 
410:    LDA  7,-388(7) 	call outputb
411:    LDA  3,0(2) 	Save the result in ac 
* 60
412:     ST  1,-2(1) 	Store old fp in ghost frame 
413:    LDA  1,-2(1) 	Load address of new frame 
414:    LDA  3,1(7) 	Return address in ac 
415:    LDA  7,-386(7) 	call outnl
416:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
417:    LDC  2,0(6) 	Set return value to 0 
418:     LD  3,-1(1) 	Load return address 
419:     LD  1,0(1) 	Adjust fp 
420:    LDA  7,0(3) 	Return 
* END of function main
