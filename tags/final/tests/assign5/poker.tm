* C- compiler version C-06
* Author: Robert B. Heckendorn
* Backend coauthor: Jorge Williams
* Apr 1, 2006
* BEGIN Prolog
  0:     LD  0,0(0) 	Set the global pointer 
  1:    LDA  1,-3(0) 	set first frame at end of globals 
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
* BEGIN function suit
 35:     ST  3,-1(1) 	Store return address. BEGIN FUNC: suit
* BEGIN compound statement
* RETURN
 36:     LD  3,-2(1) 	Load variable c
 37:     ST  3,-3(1) 	Save left side in temp 
 38:     LD  3,0(0) 	Load variable numSuits
 39:     LD  4,-3(1) 	Load left from temp into ac1 
 40:    DIV  5,4,3 	Op % 
 41:    MUL  5,5,3 	 
 42:    SUB  3,4,5 	 
 43:    LDA  2,0(3) 	Copy result to rt register 
 44:     LD  3,-1(1) 	Load return address 
 45:     LD  1,0(1) 	Adjust fp 
 46:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
 47:    LDC  2,0(6) 	Set return value to 0 
 48:     LD  3,-1(1) 	Load return address 
 49:     LD  1,0(1) 	Adjust fp 
 50:    LDA  7,0(3) 	Return 
* END of function suit
* BEGIN function pips
 51:     ST  3,-1(1) 	Store return address. BEGIN FUNC: pips
* BEGIN compound statement
* RETURN
 52:     LD  3,-2(1) 	Load variable c
 53:     ST  3,-3(1) 	Save left side in temp 
 54:     LD  3,0(0) 	Load variable numSuits
 55:     LD  4,-3(1) 	Load left from temp into ac1 
 56:    DIV  3,4,3 	Op / 
 57:    LDA  2,0(3) 	Copy result to rt register 
 58:     LD  3,-1(1) 	Load return address 
 59:     LD  1,0(1) 	Adjust fp 
 60:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
 61:    LDC  2,0(6) 	Set return value to 0 
 62:     LD  3,-1(1) 	Load return address 
 63:     LD  1,0(1) 	Adjust fp 
 64:    LDA  7,0(3) 	Return 
* END of function pips
* BEGIN function p
 65:     ST  3,-1(1) 	Store return address. BEGIN FUNC: p
* BEGIN compound statement
* RETURN
 66:     ST  1,-4(1) 	Store old fp in ghost frame 
 67:     LD  3,-2(1) 	Load variable a
 68:     ST  3,-6(1) 	Store parameter 
 69:    LDA  1,-4(1) 	Load address of new frame 
 70:    LDA  3,1(7) 	Return address in ac 
 71:    LDA  7,-21(7) 	call pips
 72:    LDA  3,0(2) 	Save the result in ac 
 73:     ST  3,-4(1) 	Save left side in temp 
 74:     ST  1,-5(1) 	Store old fp in ghost frame 
 75:     LD  3,-3(1) 	Load variable b
 76:     ST  3,-7(1) 	Store parameter 
 77:    LDA  1,-5(1) 	Load address of new frame 
 78:    LDA  3,1(7) 	Return address in ac 
 79:    LDA  7,-29(7) 	call pips
 80:    LDA  3,0(2) 	Save the result in ac 
 81:     LD  4,-4(1) 	Load left from temp into ac1 
 82:    SUB  4,4,3 	Op == 
 83:    LDC  3,1(6) 	True case 
 84:    JEQ  4,1(7) 	Jump if true 
 85:    LDC  3,0(6) 	False case 
 86:    LDA  2,0(3) 	Copy result to rt register 
 87:     LD  3,-1(1) 	Load return address 
 88:     LD  1,0(1) 	Adjust fp 
 89:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
 90:    LDC  2,0(6) 	Set return value to 0 
 91:     LD  3,-1(1) 	Load return address 
 92:     LD  1,0(1) 	Adjust fp 
 93:    LDA  7,0(3) 	Return 
* END of function p
* BEGIN function ppp
 94:     ST  3,-1(1) 	Store return address. BEGIN FUNC: ppp
* BEGIN compound statement
* RETURN
 95:     ST  1,-5(1) 	Store old fp in ghost frame 
 96:     LD  3,-2(1) 	Load variable a
 97:     ST  3,-7(1) 	Store parameter 
 98:     LD  3,-3(1) 	Load variable b
 99:     ST  3,-8(1) 	Store parameter 
100:    LDA  1,-5(1) 	Load address of new frame 
101:    LDA  3,1(7) 	Return address in ac 
102:    LDA  7,-38(7) 	call p
103:    LDA  3,0(2) 	Save the result in ac 
104:     ST  3,-5(1) 	Save left side in temp 
105:     ST  1,-6(1) 	Store old fp in ghost frame 
106:     LD  3,-3(1) 	Load variable b
107:     ST  3,-8(1) 	Store parameter 
108:     LD  3,-4(1) 	Load variable c
109:     ST  3,-9(1) 	Store parameter 
110:    LDA  1,-6(1) 	Load address of new frame 
111:    LDA  3,1(7) 	Return address in ac 
112:    LDA  7,-48(7) 	call p
113:    LDA  3,0(2) 	Save the result in ac 
114:     LD  4,-5(1) 	Load left from temp into ac1 
115:    JEQ  3,3(7) 	Jump if false for Op && 
116:    LDC  3,0(6) 	False case 
117:    JEQ  4,1(7) 	Jump if false 
118:    LDC  3,1(6) 	True case 
119:    LDA  2,0(3) 	Copy result to rt register 
120:     LD  3,-1(1) 	Load return address 
121:     LD  1,0(1) 	Adjust fp 
122:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
123:    LDC  2,0(6) 	Set return value to 0 
124:     LD  3,-1(1) 	Load return address 
125:     LD  1,0(1) 	Adjust fp 
126:    LDA  7,0(3) 	Return 
* END of function ppp
* BEGIN function pppp
127:     ST  3,-1(1) 	Store return address. BEGIN FUNC: pppp
* BEGIN compound statement
* RETURN
128:     ST  1,-6(1) 	Store old fp in ghost frame 
129:     LD  3,-2(1) 	Load variable a
130:     ST  3,-8(1) 	Store parameter 
131:     LD  3,-3(1) 	Load variable b
132:     ST  3,-9(1) 	Store parameter 
133:    LDA  1,-6(1) 	Load address of new frame 
134:    LDA  3,1(7) 	Return address in ac 
135:    LDA  7,-71(7) 	call p
136:    LDA  3,0(2) 	Save the result in ac 
137:     ST  3,-6(1) 	Save left side in temp 
138:     ST  1,-7(1) 	Store old fp in ghost frame 
139:     LD  3,-3(1) 	Load variable b
140:     ST  3,-9(1) 	Store parameter 
141:     LD  3,-4(1) 	Load variable c
142:     ST  3,-10(1) 	Store parameter 
143:    LDA  1,-7(1) 	Load address of new frame 
144:    LDA  3,1(7) 	Return address in ac 
145:    LDA  7,-81(7) 	call p
146:    LDA  3,0(2) 	Save the result in ac 
147:     LD  4,-6(1) 	Load left from temp into ac1 
148:    JEQ  3,3(7) 	Jump if false for Op && 
149:    LDC  3,0(6) 	False case 
150:    JEQ  4,1(7) 	Jump if false 
151:    LDC  3,1(6) 	True case 
152:     ST  3,-6(1) 	Save left side in temp 
153:     ST  1,-7(1) 	Store old fp in ghost frame 
154:     LD  3,-4(1) 	Load variable c
155:     ST  3,-9(1) 	Store parameter 
156:     LD  3,-5(1) 	Load variable d
157:     ST  3,-10(1) 	Store parameter 
158:    LDA  1,-7(1) 	Load address of new frame 
159:    LDA  3,1(7) 	Return address in ac 
160:    LDA  7,-96(7) 	call p
161:    LDA  3,0(2) 	Save the result in ac 
162:     LD  4,-6(1) 	Load left from temp into ac1 
163:    JEQ  3,3(7) 	Jump if false for Op && 
164:    LDC  3,0(6) 	False case 
165:    JEQ  4,1(7) 	Jump if false 
166:    LDC  3,1(6) 	True case 
167:    LDA  2,0(3) 	Copy result to rt register 
168:     LD  3,-1(1) 	Load return address 
169:     LD  1,0(1) 	Adjust fp 
170:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
171:    LDC  2,0(6) 	Set return value to 0 
172:     LD  3,-1(1) 	Load return address 
173:     LD  1,0(1) 	Adjust fp 
174:    LDA  7,0(3) 	Return 
* END of function pppp
* BEGIN function handtype
175:     ST  3,-1(1) 	Store return address. BEGIN FUNC: handtype
* BEGIN compound statement
* 19
176:     ST  1,-8(1) 	Store old fp in ghost frame 
177:     LD  3,-2(1) 	Load variable a
178:     ST  3,-10(1) 	Store parameter 
179:    LDA  1,-8(1) 	Load address of new frame 
180:    LDA  3,1(7) 	Return address in ac 
181:    LDA  7,-147(7) 	call suit
182:    LDA  3,0(2) 	Save the result in ac 
183:     ST  3,-8(1) 	Save left side in temp 
184:     ST  1,-9(1) 	Store old fp in ghost frame 
185:     LD  3,-3(1) 	Load variable b
186:     ST  3,-11(1) 	Store parameter 
187:    LDA  1,-9(1) 	Load address of new frame 
188:    LDA  3,1(7) 	Return address in ac 
189:    LDA  7,-155(7) 	call suit
190:    LDA  3,0(2) 	Save the result in ac 
191:     LD  4,-8(1) 	Load left from temp into ac1 
192:    SUB  4,4,3 	Op == 
193:    LDC  3,1(6) 	True case 
194:    JEQ  4,1(7) 	Jump if true 
195:    LDC  3,0(6) 	False case 
196:     ST  3,-8(1) 	Save left side in temp 
197:     ST  1,-9(1) 	Store old fp in ghost frame 
198:     LD  3,-2(1) 	Load variable a
199:     ST  3,-11(1) 	Store parameter 
200:    LDA  1,-9(1) 	Load address of new frame 
201:    LDA  3,1(7) 	Return address in ac 
202:    LDA  7,-168(7) 	call suit
203:    LDA  3,0(2) 	Save the result in ac 
204:     ST  3,-9(1) 	Save left side in temp 
205:     ST  1,-10(1) 	Store old fp in ghost frame 
206:     LD  3,-4(1) 	Load variable c
207:     ST  3,-12(1) 	Store parameter 
208:    LDA  1,-10(1) 	Load address of new frame 
209:    LDA  3,1(7) 	Return address in ac 
210:    LDA  7,-176(7) 	call suit
211:    LDA  3,0(2) 	Save the result in ac 
212:     LD  4,-9(1) 	Load left from temp into ac1 
213:    SUB  4,4,3 	Op == 
214:    LDC  3,1(6) 	True case 
215:    JEQ  4,1(7) 	Jump if true 
216:    LDC  3,0(6) 	False case 
217:     LD  4,-8(1) 	Load left from temp into ac1 
218:    JEQ  3,3(7) 	Jump if false for Op && 
219:    LDC  3,0(6) 	False case 
220:    JEQ  4,1(7) 	Jump if false 
221:    LDC  3,1(6) 	True case 
222:     ST  3,-8(1) 	Save left side in temp 
223:     ST  1,-9(1) 	Store old fp in ghost frame 
224:     LD  3,-2(1) 	Load variable a
225:     ST  3,-11(1) 	Store parameter 
226:    LDA  1,-9(1) 	Load address of new frame 
227:    LDA  3,1(7) 	Return address in ac 
228:    LDA  7,-194(7) 	call suit
229:    LDA  3,0(2) 	Save the result in ac 
230:     ST  3,-9(1) 	Save left side in temp 
231:     ST  1,-10(1) 	Store old fp in ghost frame 
232:     LD  3,-5(1) 	Load variable d
233:     ST  3,-12(1) 	Store parameter 
234:    LDA  1,-10(1) 	Load address of new frame 
235:    LDA  3,1(7) 	Return address in ac 
236:    LDA  7,-202(7) 	call suit
237:    LDA  3,0(2) 	Save the result in ac 
238:     LD  4,-9(1) 	Load left from temp into ac1 
239:    SUB  4,4,3 	Op == 
240:    LDC  3,1(6) 	True case 
241:    JEQ  4,1(7) 	Jump if true 
242:    LDC  3,0(6) 	False case 
243:     LD  4,-8(1) 	Load left from temp into ac1 
244:    JEQ  3,3(7) 	Jump if false for Op && 
245:    LDC  3,0(6) 	False case 
246:    JEQ  4,1(7) 	Jump if false 
247:    LDC  3,1(6) 	True case 
248:     ST  3,-8(1) 	Save left side in temp 
249:     ST  1,-9(1) 	Store old fp in ghost frame 
250:     LD  3,-2(1) 	Load variable a
251:     ST  3,-11(1) 	Store parameter 
252:    LDA  1,-9(1) 	Load address of new frame 
253:    LDA  3,1(7) 	Return address in ac 
254:    LDA  7,-220(7) 	call suit
255:    LDA  3,0(2) 	Save the result in ac 
256:     ST  3,-9(1) 	Save left side in temp 
257:     ST  1,-10(1) 	Store old fp in ghost frame 
258:     LD  3,-6(1) 	Load variable e
259:     ST  3,-12(1) 	Store parameter 
260:    LDA  1,-10(1) 	Load address of new frame 
261:    LDA  3,1(7) 	Return address in ac 
262:    LDA  7,-228(7) 	call suit
263:    LDA  3,0(2) 	Save the result in ac 
264:     LD  4,-9(1) 	Load left from temp into ac1 
265:    SUB  4,4,3 	Op == 
266:    LDC  3,1(6) 	True case 
267:    JEQ  4,1(7) 	Jump if true 
268:    LDC  3,0(6) 	False case 
269:     LD  4,-8(1) 	Load left from temp into ac1 
270:    JEQ  3,3(7) 	Jump if false for Op && 
271:    LDC  3,0(6) 	False case 
272:    JEQ  4,1(7) 	Jump if false 
273:    LDC  3,1(6) 	True case 
274:     ST  3,-7(1) 	Store variable isflush
* IF
275:     LD  3,-7(1) 	Load variable isflush
276:     ST  3,-8(1) 	Save left side in temp 
277:     ST  1,-9(1) 	Store old fp in ghost frame 
278:     LD  3,-2(1) 	Load variable a
279:     ST  3,-11(1) 	Store parameter 
280:    LDA  1,-9(1) 	Load address of new frame 
281:    LDA  3,1(7) 	Return address in ac 
282:    LDA  7,-232(7) 	call pips
283:    LDA  3,0(2) 	Save the result in ac 
284:     ST  3,-9(1) 	Save left side in temp 
285:    LDC  3,0(6) 	Load constant 
286:     LD  4,-9(1) 	Load left from temp into ac1 
287:    SUB  4,4,3 	Op == 
288:    LDC  3,1(6) 	True case 
289:    JEQ  4,1(7) 	Jump if true 
290:    LDC  3,0(6) 	False case 
291:     LD  4,-8(1) 	Load left from temp into ac1 
292:    JEQ  3,3(7) 	Jump if false for Op && 
293:    LDC  3,0(6) 	False case 
294:    JEQ  4,1(7) 	Jump if false 
295:    LDC  3,1(6) 	True case 
296:     ST  3,-8(1) 	Save left side in temp 
297:     ST  1,-9(1) 	Store old fp in ghost frame 
298:     LD  3,-3(1) 	Load variable b
299:     ST  3,-11(1) 	Store parameter 
300:    LDA  1,-9(1) 	Load address of new frame 
301:    LDA  3,1(7) 	Return address in ac 
302:    LDA  7,-252(7) 	call pips
303:    LDA  3,0(2) 	Save the result in ac 
304:     ST  3,-9(1) 	Save left side in temp 
305:     LD  3,-1(0) 	Load variable numPips
306:     ST  3,-10(1) 	Save left side in temp 
307:    LDC  3,4(6) 	Load constant 
308:     LD  4,-10(1) 	Load left from temp into ac1 
309:    SUB  3,4,3 	Op - 
310:     LD  4,-9(1) 	Load left from temp into ac1 
311:    SUB  4,4,3 	Op == 
312:    LDC  3,1(6) 	True case 
313:    JEQ  4,1(7) 	Jump if true 
314:    LDC  3,0(6) 	False case 
315:     LD  4,-8(1) 	Load left from temp into ac1 
316:    JEQ  3,3(7) 	Jump if false for Op && 
317:    LDC  3,0(6) 	False case 
318:    JEQ  4,1(7) 	Jump if false 
319:    LDC  3,1(6) 	True case 
320:     ST  3,-8(1) 	Save left side in temp 
321:     ST  1,-9(1) 	Store old fp in ghost frame 
322:     LD  3,-6(1) 	Load variable e
323:     ST  3,-11(1) 	Store parameter 
324:    LDA  1,-9(1) 	Load address of new frame 
325:    LDA  3,1(7) 	Return address in ac 
326:    LDA  7,-276(7) 	call pips
327:    LDA  3,0(2) 	Save the result in ac 
328:     ST  3,-9(1) 	Save left side in temp 
329:     LD  3,-1(0) 	Load variable numPips
330:     ST  3,-10(1) 	Save left side in temp 
331:    LDC  3,1(6) 	Load constant 
332:     LD  4,-10(1) 	Load left from temp into ac1 
333:    SUB  3,4,3 	Op - 
334:     LD  4,-9(1) 	Load left from temp into ac1 
335:    SUB  4,4,3 	Op == 
336:    LDC  3,1(6) 	True case 
337:    JEQ  4,1(7) 	Jump if true 
338:    LDC  3,0(6) 	False case 
339:     LD  4,-8(1) 	Load left from temp into ac1 
340:    JEQ  3,3(7) 	Jump if false for Op && 
341:    LDC  3,0(6) 	False case 
342:    JEQ  4,1(7) 	Jump if false 
343:    LDC  3,1(6) 	True case 
344:    LDC  4,1(6) 	Load constant 1 
345:    SUB  3,3,4 	If cond check 
346:    JGE  3,1(7) 	Jump to then part 
* THEN
* RETURN
348:    LDC  3,0(6) 	Load constant 
349:    LDA  2,0(3) 	Copy result to rt register 
350:     LD  3,-1(1) 	Load return address 
351:     LD  1,0(1) 	Adjust fp 
352:    LDA  7,0(3) 	Return 
* ELSE
347:    LDA  7,6(7) 	Jump around the THEN 
* IF
354:     LD  3,-7(1) 	Load variable isflush
355:     ST  3,-8(1) 	Save left side in temp 
356:     ST  1,-9(1) 	Store old fp in ghost frame 
357:     LD  3,-2(1) 	Load variable a
358:     ST  3,-11(1) 	Store parameter 
359:    LDA  1,-9(1) 	Load address of new frame 
360:    LDA  3,1(7) 	Return address in ac 
361:    LDA  7,-311(7) 	call pips
362:    LDA  3,0(2) 	Save the result in ac 
363:     ST  3,-9(1) 	Save left side in temp 
364:     ST  1,-10(1) 	Store old fp in ghost frame 
365:     LD  3,-6(1) 	Load variable e
366:     ST  3,-12(1) 	Store parameter 
367:    LDA  1,-10(1) 	Load address of new frame 
368:    LDA  3,1(7) 	Return address in ac 
369:    LDA  7,-319(7) 	call pips
370:    LDA  3,0(2) 	Save the result in ac 
371:     ST  3,-10(1) 	Save left side in temp 
372:    LDC  3,4(6) 	Load constant 
373:     LD  4,-10(1) 	Load left from temp into ac1 
374:    SUB  3,4,3 	Op - 
375:     LD  4,-9(1) 	Load left from temp into ac1 
376:    SUB  4,4,3 	Op == 
377:    LDC  3,1(6) 	True case 
378:    JEQ  4,1(7) 	Jump if true 
379:    LDC  3,0(6) 	False case 
380:     LD  4,-8(1) 	Load left from temp into ac1 
381:    JEQ  3,3(7) 	Jump if false for Op && 
382:    LDC  3,0(6) 	False case 
383:    JEQ  4,1(7) 	Jump if false 
384:    LDC  3,1(6) 	True case 
385:    LDC  4,1(6) 	Load constant 1 
386:    SUB  3,3,4 	If cond check 
387:    JGE  3,1(7) 	Jump to then part 
* THEN
* RETURN
389:    LDC  3,1(6) 	Load constant 
390:    LDA  2,0(3) 	Copy result to rt register 
391:     LD  3,-1(1) 	Load return address 
392:     LD  1,0(1) 	Adjust fp 
393:    LDA  7,0(3) 	Return 
* ELSE
388:    LDA  7,6(7) 	Jump around the THEN 
* IF
395:     ST  1,-8(1) 	Store old fp in ghost frame 
396:     LD  3,-2(1) 	Load variable a
397:     ST  3,-10(1) 	Store parameter 
398:     LD  3,-3(1) 	Load variable b
399:     ST  3,-11(1) 	Store parameter 
400:     LD  3,-4(1) 	Load variable c
401:     ST  3,-12(1) 	Store parameter 
402:     LD  3,-5(1) 	Load variable d
403:     ST  3,-13(1) 	Store parameter 
404:    LDA  1,-8(1) 	Load address of new frame 
405:    LDA  3,1(7) 	Return address in ac 
406:    LDA  7,-280(7) 	call pppp
407:    LDA  3,0(2) 	Save the result in ac 
408:     ST  3,-8(1) 	Save left side in temp 
409:     ST  1,-9(1) 	Store old fp in ghost frame 
410:     LD  3,-3(1) 	Load variable b
411:     ST  3,-11(1) 	Store parameter 
412:     LD  3,-4(1) 	Load variable c
413:     ST  3,-12(1) 	Store parameter 
414:     LD  3,-5(1) 	Load variable d
415:     ST  3,-13(1) 	Store parameter 
416:     LD  3,-6(1) 	Load variable e
417:     ST  3,-14(1) 	Store parameter 
418:    LDA  1,-9(1) 	Load address of new frame 
419:    LDA  3,1(7) 	Return address in ac 
420:    LDA  7,-294(7) 	call pppp
421:    LDA  3,0(2) 	Save the result in ac 
422:     LD  4,-8(1) 	Load left from temp into ac1 
423:    ADD  3,4,3 	Op || 
424:    JEQ  3,1(7) 	Jump if false 
425:    LDC  3,1(6) 	True case 
426:    LDC  4,1(6) 	Load constant 1 
427:    SUB  3,3,4 	If cond check 
428:    JGE  3,1(7) 	Jump to then part 
* THEN
* RETURN
430:    LDC  3,2(6) 	Load constant 
431:    LDA  2,0(3) 	Copy result to rt register 
432:     LD  3,-1(1) 	Load return address 
433:     LD  1,0(1) 	Adjust fp 
434:    LDA  7,0(3) 	Return 
* ELSE
429:    LDA  7,6(7) 	Jump around the THEN 
* IF
436:     ST  1,-8(1) 	Store old fp in ghost frame 
437:     LD  3,-2(1) 	Load variable a
438:     ST  3,-10(1) 	Store parameter 
439:     LD  3,-3(1) 	Load variable b
440:     ST  3,-11(1) 	Store parameter 
441:     LD  3,-4(1) 	Load variable c
442:     ST  3,-12(1) 	Store parameter 
443:    LDA  1,-8(1) 	Load address of new frame 
444:    LDA  3,1(7) 	Return address in ac 
445:    LDA  7,-352(7) 	call ppp
446:    LDA  3,0(2) 	Save the result in ac 
447:     ST  3,-8(1) 	Save left side in temp 
448:     ST  1,-9(1) 	Store old fp in ghost frame 
449:     LD  3,-5(1) 	Load variable d
450:     ST  3,-11(1) 	Store parameter 
451:     LD  3,-6(1) 	Load variable e
452:     ST  3,-12(1) 	Store parameter 
453:    LDA  1,-9(1) 	Load address of new frame 
454:    LDA  3,1(7) 	Return address in ac 
455:    LDA  7,-391(7) 	call p
456:    LDA  3,0(2) 	Save the result in ac 
457:     LD  4,-8(1) 	Load left from temp into ac1 
458:    JEQ  3,3(7) 	Jump if false for Op && 
459:    LDC  3,0(6) 	False case 
460:    JEQ  4,1(7) 	Jump if false 
461:    LDC  3,1(6) 	True case 
462:     ST  3,-8(1) 	Save left side in temp 
463:     ST  1,-9(1) 	Store old fp in ghost frame 
464:     LD  3,-2(1) 	Load variable a
465:     ST  3,-11(1) 	Store parameter 
466:     LD  3,-3(1) 	Load variable b
467:     ST  3,-12(1) 	Store parameter 
468:    LDA  1,-9(1) 	Load address of new frame 
469:    LDA  3,1(7) 	Return address in ac 
470:    LDA  7,-406(7) 	call p
471:    LDA  3,0(2) 	Save the result in ac 
472:     ST  3,-9(1) 	Save left side in temp 
473:     ST  1,-10(1) 	Store old fp in ghost frame 
474:     LD  3,-4(1) 	Load variable c
475:     ST  3,-12(1) 	Store parameter 
476:     LD  3,-5(1) 	Load variable d
477:     ST  3,-13(1) 	Store parameter 
478:     LD  3,-6(1) 	Load variable e
479:     ST  3,-14(1) 	Store parameter 
480:    LDA  1,-10(1) 	Load address of new frame 
481:    LDA  3,1(7) 	Return address in ac 
482:    LDA  7,-389(7) 	call ppp
483:    LDA  3,0(2) 	Save the result in ac 
484:     LD  4,-9(1) 	Load left from temp into ac1 
485:    JEQ  3,3(7) 	Jump if false for Op && 
486:    LDC  3,0(6) 	False case 
487:    JEQ  4,1(7) 	Jump if false 
488:    LDC  3,1(6) 	True case 
489:     LD  4,-8(1) 	Load left from temp into ac1 
490:    ADD  3,4,3 	Op || 
491:    JEQ  3,1(7) 	Jump if false 
492:    LDC  3,1(6) 	True case 
493:    LDC  4,1(6) 	Load constant 1 
494:    SUB  3,3,4 	If cond check 
495:    JGE  3,1(7) 	Jump to then part 
* THEN
* RETURN
497:    LDC  3,3(6) 	Load constant 
498:    LDA  2,0(3) 	Copy result to rt register 
499:     LD  3,-1(1) 	Load return address 
500:     LD  1,0(1) 	Adjust fp 
501:    LDA  7,0(3) 	Return 
* ELSE
496:    LDA  7,6(7) 	Jump around the THEN 
* IF
503:     LD  3,-7(1) 	Load variable isflush
504:    LDC  4,1(6) 	Load constant 1 
505:    SUB  3,3,4 	If cond check 
506:    JGE  3,1(7) 	Jump to then part 
* THEN
* RETURN
508:    LDC  3,4(6) 	Load constant 
509:    LDA  2,0(3) 	Copy result to rt register 
510:     LD  3,-1(1) 	Load return address 
511:     LD  1,0(1) 	Adjust fp 
512:    LDA  7,0(3) 	Return 
* ELSE
507:    LDA  7,6(7) 	Jump around the THEN 
* IF
514:     ST  1,-8(1) 	Store old fp in ghost frame 
515:     LD  3,-2(1) 	Load variable a
516:     ST  3,-10(1) 	Store parameter 
517:    LDA  1,-8(1) 	Load address of new frame 
518:    LDA  3,1(7) 	Return address in ac 
519:    LDA  7,-469(7) 	call pips
520:    LDA  3,0(2) 	Save the result in ac 
521:     ST  3,-8(1) 	Save left side in temp 
522:     ST  1,-9(1) 	Store old fp in ghost frame 
523:     LD  3,-3(1) 	Load variable b
524:     ST  3,-11(1) 	Store parameter 
525:    LDA  1,-9(1) 	Load address of new frame 
526:    LDA  3,1(7) 	Return address in ac 
527:    LDA  7,-477(7) 	call pips
528:    LDA  3,0(2) 	Save the result in ac 
529:     ST  3,-9(1) 	Save left side in temp 
530:    LDC  3,1(6) 	Load constant 
531:     LD  4,-9(1) 	Load left from temp into ac1 
532:    SUB  3,4,3 	Op - 
533:     LD  4,-8(1) 	Load left from temp into ac1 
534:    SUB  4,4,3 	Op == 
535:    LDC  3,1(6) 	True case 
536:    JEQ  4,1(7) 	Jump if true 
537:    LDC  3,0(6) 	False case 
538:     ST  3,-8(1) 	Save left side in temp 
539:     ST  1,-9(1) 	Store old fp in ghost frame 
540:     LD  3,-3(1) 	Load variable b
541:     ST  3,-11(1) 	Store parameter 
542:    LDA  1,-9(1) 	Load address of new frame 
543:    LDA  3,1(7) 	Return address in ac 
544:    LDA  7,-494(7) 	call pips
545:    LDA  3,0(2) 	Save the result in ac 
546:     ST  3,-9(1) 	Save left side in temp 
547:     ST  1,-10(1) 	Store old fp in ghost frame 
548:     LD  3,-4(1) 	Load variable c
549:     ST  3,-12(1) 	Store parameter 
550:    LDA  1,-10(1) 	Load address of new frame 
551:    LDA  3,1(7) 	Return address in ac 
552:    LDA  7,-502(7) 	call pips
553:    LDA  3,0(2) 	Save the result in ac 
554:     ST  3,-10(1) 	Save left side in temp 
555:    LDC  3,1(6) 	Load constant 
556:     LD  4,-10(1) 	Load left from temp into ac1 
557:    SUB  3,4,3 	Op - 
558:     LD  4,-9(1) 	Load left from temp into ac1 
559:    SUB  4,4,3 	Op == 
560:    LDC  3,1(6) 	True case 
561:    JEQ  4,1(7) 	Jump if true 
562:    LDC  3,0(6) 	False case 
563:     LD  4,-8(1) 	Load left from temp into ac1 
564:    JEQ  3,3(7) 	Jump if false for Op && 
565:    LDC  3,0(6) 	False case 
566:    JEQ  4,1(7) 	Jump if false 
567:    LDC  3,1(6) 	True case 
568:     ST  3,-8(1) 	Save left side in temp 
569:     ST  1,-9(1) 	Store old fp in ghost frame 
570:     LD  3,-4(1) 	Load variable c
571:     ST  3,-11(1) 	Store parameter 
572:    LDA  1,-9(1) 	Load address of new frame 
573:    LDA  3,1(7) 	Return address in ac 
574:    LDA  7,-524(7) 	call pips
575:    LDA  3,0(2) 	Save the result in ac 
576:     ST  3,-9(1) 	Save left side in temp 
577:     ST  1,-10(1) 	Store old fp in ghost frame 
578:     LD  3,-5(1) 	Load variable d
579:     ST  3,-12(1) 	Store parameter 
580:    LDA  1,-10(1) 	Load address of new frame 
581:    LDA  3,1(7) 	Return address in ac 
582:    LDA  7,-532(7) 	call pips
583:    LDA  3,0(2) 	Save the result in ac 
584:     ST  3,-10(1) 	Save left side in temp 
585:    LDC  3,1(6) 	Load constant 
586:     LD  4,-10(1) 	Load left from temp into ac1 
587:    SUB  3,4,3 	Op - 
588:     LD  4,-9(1) 	Load left from temp into ac1 
589:    SUB  4,4,3 	Op == 
590:    LDC  3,1(6) 	True case 
591:    JEQ  4,1(7) 	Jump if true 
592:    LDC  3,0(6) 	False case 
593:     LD  4,-8(1) 	Load left from temp into ac1 
594:    JEQ  3,3(7) 	Jump if false for Op && 
595:    LDC  3,0(6) 	False case 
596:    JEQ  4,1(7) 	Jump if false 
597:    LDC  3,1(6) 	True case 
598:     ST  3,-8(1) 	Save left side in temp 
599:     ST  1,-9(1) 	Store old fp in ghost frame 
600:     LD  3,-5(1) 	Load variable d
601:     ST  3,-11(1) 	Store parameter 
602:    LDA  1,-9(1) 	Load address of new frame 
603:    LDA  3,1(7) 	Return address in ac 
604:    LDA  7,-554(7) 	call pips
605:    LDA  3,0(2) 	Save the result in ac 
606:     ST  3,-9(1) 	Save left side in temp 
607:     ST  1,-10(1) 	Store old fp in ghost frame 
608:     LD  3,-6(1) 	Load variable e
609:     ST  3,-12(1) 	Store parameter 
610:    LDA  1,-10(1) 	Load address of new frame 
611:    LDA  3,1(7) 	Return address in ac 
612:    LDA  7,-562(7) 	call pips
613:    LDA  3,0(2) 	Save the result in ac 
614:     ST  3,-10(1) 	Save left side in temp 
615:    LDC  3,1(6) 	Load constant 
616:     LD  4,-10(1) 	Load left from temp into ac1 
617:    SUB  3,4,3 	Op - 
618:     LD  4,-9(1) 	Load left from temp into ac1 
619:    SUB  4,4,3 	Op == 
620:    LDC  3,1(6) 	True case 
621:    JEQ  4,1(7) 	Jump if true 
622:    LDC  3,0(6) 	False case 
623:     LD  4,-8(1) 	Load left from temp into ac1 
624:    JEQ  3,3(7) 	Jump if false for Op && 
625:    LDC  3,0(6) 	False case 
626:    JEQ  4,1(7) 	Jump if false 
627:    LDC  3,1(6) 	True case 
628:     ST  3,-8(1) 	Save left side in temp 
629:     ST  1,-9(1) 	Store old fp in ghost frame 
630:     LD  3,-2(1) 	Load variable a
631:     ST  3,-11(1) 	Store parameter 
632:    LDA  1,-9(1) 	Load address of new frame 
633:    LDA  3,1(7) 	Return address in ac 
634:    LDA  7,-584(7) 	call pips
635:    LDA  3,0(2) 	Save the result in ac 
636:     ST  3,-9(1) 	Save left side in temp 
637:    LDC  3,0(6) 	Load constant 
638:     LD  4,-9(1) 	Load left from temp into ac1 
639:    SUB  4,4,3 	Op == 
640:    LDC  3,1(6) 	True case 
641:    JEQ  4,1(7) 	Jump if true 
642:    LDC  3,0(6) 	False case 
643:     ST  3,-9(1) 	Save left side in temp 
644:     ST  1,-10(1) 	Store old fp in ghost frame 
645:     LD  3,-3(1) 	Load variable b
646:     ST  3,-12(1) 	Store parameter 
647:    LDA  1,-10(1) 	Load address of new frame 
648:    LDA  3,1(7) 	Return address in ac 
649:    LDA  7,-599(7) 	call pips
650:    LDA  3,0(2) 	Save the result in ac 
651:     ST  3,-10(1) 	Save left side in temp 
652:     LD  3,-1(0) 	Load variable numPips
653:     ST  3,-11(1) 	Save left side in temp 
654:    LDC  3,4(6) 	Load constant 
655:     LD  4,-11(1) 	Load left from temp into ac1 
656:    SUB  3,4,3 	Op - 
657:     LD  4,-10(1) 	Load left from temp into ac1 
658:    SUB  4,4,3 	Op == 
659:    LDC  3,1(6) 	True case 
660:    JEQ  4,1(7) 	Jump if true 
661:    LDC  3,0(6) 	False case 
662:     LD  4,-9(1) 	Load left from temp into ac1 
663:    JEQ  3,3(7) 	Jump if false for Op && 
664:    LDC  3,0(6) 	False case 
665:    JEQ  4,1(7) 	Jump if false 
666:    LDC  3,1(6) 	True case 
667:     ST  3,-9(1) 	Save left side in temp 
668:     ST  1,-10(1) 	Store old fp in ghost frame 
669:     LD  3,-4(1) 	Load variable c
670:     ST  3,-12(1) 	Store parameter 
671:    LDA  1,-10(1) 	Load address of new frame 
672:    LDA  3,1(7) 	Return address in ac 
673:    LDA  7,-623(7) 	call pips
674:    LDA  3,0(2) 	Save the result in ac 
675:     ST  3,-10(1) 	Save left side in temp 
676:     LD  3,-1(0) 	Load variable numPips
677:     ST  3,-11(1) 	Save left side in temp 
678:    LDC  3,3(6) 	Load constant 
679:     LD  4,-11(1) 	Load left from temp into ac1 
680:    SUB  3,4,3 	Op - 
681:     LD  4,-10(1) 	Load left from temp into ac1 
682:    SUB  4,4,3 	Op == 
683:    LDC  3,1(6) 	True case 
684:    JEQ  4,1(7) 	Jump if true 
685:    LDC  3,0(6) 	False case 
686:     LD  4,-9(1) 	Load left from temp into ac1 
687:    JEQ  3,3(7) 	Jump if false for Op && 
688:    LDC  3,0(6) 	False case 
689:    JEQ  4,1(7) 	Jump if false 
690:    LDC  3,1(6) 	True case 
691:     ST  3,-9(1) 	Save left side in temp 
692:     ST  1,-10(1) 	Store old fp in ghost frame 
693:     LD  3,-5(1) 	Load variable d
694:     ST  3,-12(1) 	Store parameter 
695:    LDA  1,-10(1) 	Load address of new frame 
696:    LDA  3,1(7) 	Return address in ac 
697:    LDA  7,-647(7) 	call pips
698:    LDA  3,0(2) 	Save the result in ac 
699:     ST  3,-10(1) 	Save left side in temp 
700:     LD  3,-1(0) 	Load variable numPips
701:     ST  3,-11(1) 	Save left side in temp 
702:    LDC  3,2(6) 	Load constant 
703:     LD  4,-11(1) 	Load left from temp into ac1 
704:    SUB  3,4,3 	Op - 
705:     LD  4,-10(1) 	Load left from temp into ac1 
706:    SUB  4,4,3 	Op == 
707:    LDC  3,1(6) 	True case 
708:    JEQ  4,1(7) 	Jump if true 
709:    LDC  3,0(6) 	False case 
710:     LD  4,-9(1) 	Load left from temp into ac1 
711:    JEQ  3,3(7) 	Jump if false for Op && 
712:    LDC  3,0(6) 	False case 
713:    JEQ  4,1(7) 	Jump if false 
714:    LDC  3,1(6) 	True case 
715:     ST  3,-9(1) 	Save left side in temp 
716:     ST  1,-10(1) 	Store old fp in ghost frame 
717:     LD  3,-6(1) 	Load variable e
718:     ST  3,-12(1) 	Store parameter 
719:    LDA  1,-10(1) 	Load address of new frame 
720:    LDA  3,1(7) 	Return address in ac 
721:    LDA  7,-671(7) 	call pips
722:    LDA  3,0(2) 	Save the result in ac 
723:     ST  3,-10(1) 	Save left side in temp 
724:     LD  3,-1(0) 	Load variable numPips
725:     ST  3,-11(1) 	Save left side in temp 
726:    LDC  3,1(6) 	Load constant 
727:     LD  4,-11(1) 	Load left from temp into ac1 
728:    SUB  3,4,3 	Op - 
729:     LD  4,-10(1) 	Load left from temp into ac1 
730:    SUB  4,4,3 	Op == 
731:    LDC  3,1(6) 	True case 
732:    JEQ  4,1(7) 	Jump if true 
733:    LDC  3,0(6) 	False case 
734:     LD  4,-9(1) 	Load left from temp into ac1 
735:    JEQ  3,3(7) 	Jump if false for Op && 
736:    LDC  3,0(6) 	False case 
737:    JEQ  4,1(7) 	Jump if false 
738:    LDC  3,1(6) 	True case 
739:     LD  4,-8(1) 	Load left from temp into ac1 
740:    ADD  3,4,3 	Op || 
741:    JEQ  3,1(7) 	Jump if false 
742:    LDC  3,1(6) 	True case 
743:    LDC  4,1(6) 	Load constant 1 
744:    SUB  3,3,4 	If cond check 
745:    JGE  3,1(7) 	Jump to then part 
* THEN
* RETURN
747:    LDC  3,5(6) 	Load constant 
748:    LDA  2,0(3) 	Copy result to rt register 
749:     LD  3,-1(1) 	Load return address 
750:     LD  1,0(1) 	Adjust fp 
751:    LDA  7,0(3) 	Return 
* ELSE
746:    LDA  7,6(7) 	Jump around the THEN 
* IF
753:     ST  1,-8(1) 	Store old fp in ghost frame 
754:     LD  3,-2(1) 	Load variable a
755:     ST  3,-10(1) 	Store parameter 
756:     LD  3,-3(1) 	Load variable b
757:     ST  3,-11(1) 	Store parameter 
758:     LD  3,-4(1) 	Load variable c
759:     ST  3,-12(1) 	Store parameter 
760:    LDA  1,-8(1) 	Load address of new frame 
761:    LDA  3,1(7) 	Return address in ac 
762:    LDA  7,-669(7) 	call ppp
763:    LDA  3,0(2) 	Save the result in ac 
764:     ST  3,-8(1) 	Save left side in temp 
765:     ST  1,-9(1) 	Store old fp in ghost frame 
766:     LD  3,-3(1) 	Load variable b
767:     ST  3,-11(1) 	Store parameter 
768:     LD  3,-4(1) 	Load variable c
769:     ST  3,-12(1) 	Store parameter 
770:     LD  3,-5(1) 	Load variable d
771:     ST  3,-13(1) 	Store parameter 
772:    LDA  1,-9(1) 	Load address of new frame 
773:    LDA  3,1(7) 	Return address in ac 
774:    LDA  7,-681(7) 	call ppp
775:    LDA  3,0(2) 	Save the result in ac 
776:     LD  4,-8(1) 	Load left from temp into ac1 
777:    ADD  3,4,3 	Op || 
778:    JEQ  3,1(7) 	Jump if false 
779:    LDC  3,1(6) 	True case 
780:     ST  3,-8(1) 	Save left side in temp 
781:     ST  1,-9(1) 	Store old fp in ghost frame 
782:     LD  3,-4(1) 	Load variable c
783:     ST  3,-11(1) 	Store parameter 
784:     LD  3,-5(1) 	Load variable d
785:     ST  3,-12(1) 	Store parameter 
786:     LD  3,-6(1) 	Load variable e
787:     ST  3,-13(1) 	Store parameter 
788:    LDA  1,-9(1) 	Load address of new frame 
789:    LDA  3,1(7) 	Return address in ac 
790:    LDA  7,-697(7) 	call ppp
791:    LDA  3,0(2) 	Save the result in ac 
792:     LD  4,-8(1) 	Load left from temp into ac1 
793:    ADD  3,4,3 	Op || 
794:    JEQ  3,1(7) 	Jump if false 
795:    LDC  3,1(6) 	True case 
796:    LDC  4,1(6) 	Load constant 1 
797:    SUB  3,3,4 	If cond check 
798:    JGE  3,1(7) 	Jump to then part 
* THEN
* RETURN
800:    LDC  3,6(6) 	Load constant 
801:    LDA  2,0(3) 	Copy result to rt register 
802:     LD  3,-1(1) 	Load return address 
803:     LD  1,0(1) 	Adjust fp 
804:    LDA  7,0(3) 	Return 
* ELSE
799:    LDA  7,6(7) 	Jump around the THEN 
* IF
806:     ST  1,-8(1) 	Store old fp in ghost frame 
807:     LD  3,-2(1) 	Load variable a
808:     ST  3,-10(1) 	Store parameter 
809:     LD  3,-3(1) 	Load variable b
810:     ST  3,-11(1) 	Store parameter 
811:    LDA  1,-8(1) 	Load address of new frame 
812:    LDA  3,1(7) 	Return address in ac 
813:    LDA  7,-749(7) 	call p
814:    LDA  3,0(2) 	Save the result in ac 
815:     ST  3,-8(1) 	Save left side in temp 
816:     ST  1,-9(1) 	Store old fp in ghost frame 
817:     LD  3,-4(1) 	Load variable c
818:     ST  3,-11(1) 	Store parameter 
819:     LD  3,-5(1) 	Load variable d
820:     ST  3,-12(1) 	Store parameter 
821:    LDA  1,-9(1) 	Load address of new frame 
822:    LDA  3,1(7) 	Return address in ac 
823:    LDA  7,-759(7) 	call p
824:    LDA  3,0(2) 	Save the result in ac 
825:     LD  4,-8(1) 	Load left from temp into ac1 
826:    JEQ  3,3(7) 	Jump if false for Op && 
827:    LDC  3,0(6) 	False case 
828:    JEQ  4,1(7) 	Jump if false 
829:    LDC  3,1(6) 	True case 
830:     ST  3,-8(1) 	Save left side in temp 
831:     ST  1,-9(1) 	Store old fp in ghost frame 
832:     LD  3,-2(1) 	Load variable a
833:     ST  3,-11(1) 	Store parameter 
834:     LD  3,-3(1) 	Load variable b
835:     ST  3,-12(1) 	Store parameter 
836:    LDA  1,-9(1) 	Load address of new frame 
837:    LDA  3,1(7) 	Return address in ac 
838:    LDA  7,-774(7) 	call p
839:    LDA  3,0(2) 	Save the result in ac 
840:     ST  3,-9(1) 	Save left side in temp 
841:     ST  1,-10(1) 	Store old fp in ghost frame 
842:     LD  3,-5(1) 	Load variable d
843:     ST  3,-12(1) 	Store parameter 
844:     LD  3,-6(1) 	Load variable e
845:     ST  3,-13(1) 	Store parameter 
846:    LDA  1,-10(1) 	Load address of new frame 
847:    LDA  3,1(7) 	Return address in ac 
848:    LDA  7,-784(7) 	call p
849:    LDA  3,0(2) 	Save the result in ac 
850:     LD  4,-9(1) 	Load left from temp into ac1 
851:    JEQ  3,3(7) 	Jump if false for Op && 
852:    LDC  3,0(6) 	False case 
853:    JEQ  4,1(7) 	Jump if false 
854:    LDC  3,1(6) 	True case 
855:     LD  4,-8(1) 	Load left from temp into ac1 
856:    ADD  3,4,3 	Op || 
857:    JEQ  3,1(7) 	Jump if false 
858:    LDC  3,1(6) 	True case 
859:     ST  3,-8(1) 	Save left side in temp 
860:     ST  1,-9(1) 	Store old fp in ghost frame 
861:     LD  3,-3(1) 	Load variable b
862:     ST  3,-11(1) 	Store parameter 
863:     LD  3,-4(1) 	Load variable c
864:     ST  3,-12(1) 	Store parameter 
865:    LDA  1,-9(1) 	Load address of new frame 
866:    LDA  3,1(7) 	Return address in ac 
867:    LDA  7,-803(7) 	call p
868:    LDA  3,0(2) 	Save the result in ac 
869:     ST  3,-9(1) 	Save left side in temp 
870:     ST  1,-10(1) 	Store old fp in ghost frame 
871:     LD  3,-5(1) 	Load variable d
872:     ST  3,-12(1) 	Store parameter 
873:     LD  3,-6(1) 	Load variable e
874:     ST  3,-13(1) 	Store parameter 
875:    LDA  1,-10(1) 	Load address of new frame 
876:    LDA  3,1(7) 	Return address in ac 
877:    LDA  7,-813(7) 	call p
878:    LDA  3,0(2) 	Save the result in ac 
879:     LD  4,-9(1) 	Load left from temp into ac1 
880:    JEQ  3,3(7) 	Jump if false for Op && 
881:    LDC  3,0(6) 	False case 
882:    JEQ  4,1(7) 	Jump if false 
883:    LDC  3,1(6) 	True case 
884:     LD  4,-8(1) 	Load left from temp into ac1 
885:    ADD  3,4,3 	Op || 
886:    JEQ  3,1(7) 	Jump if false 
887:    LDC  3,1(6) 	True case 
888:    LDC  4,1(6) 	Load constant 1 
889:    SUB  3,3,4 	If cond check 
890:    JGE  3,1(7) 	Jump to then part 
* THEN
* RETURN
892:    LDC  3,7(6) 	Load constant 
893:    LDA  2,0(3) 	Copy result to rt register 
894:     LD  3,-1(1) 	Load return address 
895:     LD  1,0(1) 	Adjust fp 
896:    LDA  7,0(3) 	Return 
* ELSE
891:    LDA  7,6(7) 	Jump around the THEN 
* IF
898:     ST  1,-8(1) 	Store old fp in ghost frame 
899:     LD  3,-2(1) 	Load variable a
900:     ST  3,-10(1) 	Store parameter 
901:     LD  3,-3(1) 	Load variable b
902:     ST  3,-11(1) 	Store parameter 
903:    LDA  1,-8(1) 	Load address of new frame 
904:    LDA  3,1(7) 	Return address in ac 
905:    LDA  7,-841(7) 	call p
906:    LDA  3,0(2) 	Save the result in ac 
907:     ST  3,-8(1) 	Save left side in temp 
908:     ST  1,-9(1) 	Store old fp in ghost frame 
909:     LD  3,-3(1) 	Load variable b
910:     ST  3,-11(1) 	Store parameter 
911:     LD  3,-4(1) 	Load variable c
912:     ST  3,-12(1) 	Store parameter 
913:    LDA  1,-9(1) 	Load address of new frame 
914:    LDA  3,1(7) 	Return address in ac 
915:    LDA  7,-851(7) 	call p
916:    LDA  3,0(2) 	Save the result in ac 
917:     LD  4,-8(1) 	Load left from temp into ac1 
918:    ADD  3,4,3 	Op || 
919:    JEQ  3,1(7) 	Jump if false 
920:    LDC  3,1(6) 	True case 
921:     ST  3,-8(1) 	Save left side in temp 
922:     ST  1,-9(1) 	Store old fp in ghost frame 
923:     LD  3,-4(1) 	Load variable c
924:     ST  3,-11(1) 	Store parameter 
925:     LD  3,-5(1) 	Load variable d
926:     ST  3,-12(1) 	Store parameter 
927:    LDA  1,-9(1) 	Load address of new frame 
928:    LDA  3,1(7) 	Return address in ac 
929:    LDA  7,-865(7) 	call p
930:    LDA  3,0(2) 	Save the result in ac 
931:     LD  4,-8(1) 	Load left from temp into ac1 
932:    ADD  3,4,3 	Op || 
933:    JEQ  3,1(7) 	Jump if false 
934:    LDC  3,1(6) 	True case 
935:     ST  3,-8(1) 	Save left side in temp 
936:     ST  1,-9(1) 	Store old fp in ghost frame 
937:     LD  3,-5(1) 	Load variable d
938:     ST  3,-11(1) 	Store parameter 
939:     LD  3,-6(1) 	Load variable e
940:     ST  3,-12(1) 	Store parameter 
941:    LDA  1,-9(1) 	Load address of new frame 
942:    LDA  3,1(7) 	Return address in ac 
943:    LDA  7,-879(7) 	call p
944:    LDA  3,0(2) 	Save the result in ac 
945:     LD  4,-8(1) 	Load left from temp into ac1 
946:    ADD  3,4,3 	Op || 
947:    JEQ  3,1(7) 	Jump if false 
948:    LDC  3,1(6) 	True case 
949:    LDC  4,1(6) 	Load constant 1 
950:    SUB  3,3,4 	If cond check 
951:    JGE  3,1(7) 	Jump to then part 
* THEN
* RETURN
953:    LDC  3,8(6) 	Load constant 
954:    LDA  2,0(3) 	Copy result to rt register 
955:     LD  3,-1(1) 	Load return address 
956:     LD  1,0(1) 	Adjust fp 
957:    LDA  7,0(3) 	Return 
* ELSE
952:    LDA  7,6(7) 	Jump around the THEN 
* RETURN
959:    LDC  3,9(6) 	Load constant 
960:    LDA  2,0(3) 	Copy result to rt register 
961:     LD  3,-1(1) 	Load return address 
962:     LD  1,0(1) 	Adjust fp 
963:    LDA  7,0(3) 	Return 
958:    LDA  7,5(7) 	Jump around the ELSE 
* ENDIF
897:    LDA  7,66(7) 	Jump around the ELSE 
* ENDIF
805:    LDA  7,158(7) 	Jump around the ELSE 
* ENDIF
752:    LDA  7,211(7) 	Jump around the ELSE 
* ENDIF
513:    LDA  7,450(7) 	Jump around the ELSE 
* ENDIF
502:    LDA  7,461(7) 	Jump around the ELSE 
* ENDIF
435:    LDA  7,528(7) 	Jump around the ELSE 
* ENDIF
394:    LDA  7,569(7) 	Jump around the ELSE 
* ENDIF
353:    LDA  7,610(7) 	Jump around the ELSE 
* ENDIF
* END compound statement
* Add standard closing in case there is no return statement
964:    LDC  2,0(6) 	Set return value to 0 
965:     LD  3,-1(1) 	Load return address 
966:     LD  1,0(1) 	Adjust fp 
967:    LDA  7,0(3) 	Return 
* END of function handtype
* BEGIN function main
  4:    LDA  7,963(7) 	Jump to main 
968:     ST  3,-1(1) 	Store return address. BEGIN FUNC: main
* BEGIN compound statement
* 71
969:    LDC  3,0(6) 	Load constant 
970:     ST  3,-19(1) 	Store variable i
* WHILE
971:     LD  3,-19(1) 	Load variable i
972:     ST  3,-20(1) 	Save left side in temp 
973:    LDC  3,10(6) 	Load constant 
974:     LD  4,-20(1) 	Load left from temp into ac1 
975:    SUB  4,4,3 	Op < 
976:    LDC  3,1(6) 	True case 
977:    JLT  4,1(7) 	Jump if true 
978:    LDC  3,0(6) 	False case 
979:    LDC  4,1(6) 	Load constant 1 
980:    SUB  3,3,4 	While cond check 
981:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 73
983:     LD  3,-19(1) 	Load variable i
984:     ST  3,-20(1) 	Save index in temp 
985:    LDC  3,0(6) 	Load constant 
986:     LD  4,-20(1) 	load index from temp to ac1 
987:    LDA  5,-2(1) 	Load address of base of array hands
988:    SUB  5,5,4 	Compute offset of value 
989:     ST  3,0(5) 	Store variable hands
* 74
990:     LD  3,-19(1) 	Load variable i
991:     ST  3,-20(1) 	Save left side in temp 
992:    LDC  3,1(6) 	Load constant 
993:     LD  4,-20(1) 	Load left from temp into ac1 
994:    ADD  3,4,3 	Op + 
995:     ST  3,-19(1) 	Store variable i
* END compound statement
996:    LDA  7,-26(7) 	go to beginning of loop 
982:    LDA  7,14(7) 	No more loop 
* ENDWHILE
* 77
997:    LDC  3,4(6) 	Load constant 
998:     ST  3,0(0) 	Store variable numSuits
* 78
999:    LDC  3,5(6) 	Load constant 
1000:     ST  3,-1(0) 	Store variable numPips
* 79
1001:     LD  3,-1(0) 	Load variable numPips
1002:     ST  3,-20(1) 	Save left side in temp 
1003:     LD  3,0(0) 	Load variable numSuits
1004:     LD  4,-20(1) 	Load left from temp into ac1 
1005:    MUL  3,4,3 	Op * 
1006:     ST  3,-20(1) 	Save left side in temp 
1007:    LDC  3,1(6) 	Load constant 
1008:     LD  4,-20(1) 	Load left from temp into ac1 
1009:    SUB  3,4,3 	Op - 
1010:     ST  3,-2(0) 	Store variable numCards
* 81
1011:    LDC  3,0(6) 	Load constant 
1012:     ST  3,-18(1) 	Store variable possible
* 82
1013:    LDC  3,0(6) 	Load constant 
1014:     ST  3,-12(1) 	Store variable a
* WHILE
1015:     LD  3,-12(1) 	Load variable a
1016:     ST  3,-20(1) 	Save left side in temp 
1017:     LD  3,-2(0) 	Load variable numCards
1018:     LD  4,-20(1) 	Load left from temp into ac1 
1019:    SUB  4,4,3 	Op <= 
1020:    LDC  3,1(6) 	True case 
1021:    JLE  4,1(7) 	Jump if true 
1022:    LDC  3,0(6) 	False case 
1023:    LDC  4,1(6) 	Load constant 1 
1024:    SUB  3,3,4 	While cond check 
1025:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 84
1027:     ST  1,-20(1) 	Store old fp in ghost frame 
1028:     LD  3,-12(1) 	Load variable a
1029:     ST  3,-22(1) 	Store parameter 
1030:    LDA  1,-20(1) 	Load address of new frame 
1031:    LDA  3,1(7) 	Return address in ac 
1032:    LDA  7,-1022(7) 	call output
1033:    LDA  3,0(2) 	Save the result in ac 
* 84
1034:     ST  1,-20(1) 	Store old fp in ghost frame 
1035:    LDA  1,-20(1) 	Load address of new frame 
1036:    LDA  3,1(7) 	Return address in ac 
1037:    LDA  7,-1008(7) 	call outnl
1038:    LDA  3,0(2) 	Save the result in ac 
* 85
1039:     LD  3,-12(1) 	Load variable a
1040:     ST  3,-20(1) 	Save left side in temp 
1041:    LDC  3,1(6) 	Load constant 
1042:     LD  4,-20(1) 	Load left from temp into ac1 
1043:    ADD  3,4,3 	Op + 
1044:     ST  3,-13(1) 	Store variable b
* WHILE
1045:     LD  3,-13(1) 	Load variable b
1046:     ST  3,-20(1) 	Save left side in temp 
1047:     LD  3,-2(0) 	Load variable numCards
1048:     LD  4,-20(1) 	Load left from temp into ac1 
1049:    SUB  4,4,3 	Op <= 
1050:    LDC  3,1(6) 	True case 
1051:    JLE  4,1(7) 	Jump if true 
1052:    LDC  3,0(6) 	False case 
1053:    LDC  4,1(6) 	Load constant 1 
1054:    SUB  3,3,4 	While cond check 
1055:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 87
1057:     LD  3,-13(1) 	Load variable b
1058:     ST  3,-20(1) 	Save left side in temp 
1059:    LDC  3,1(6) 	Load constant 
1060:     LD  4,-20(1) 	Load left from temp into ac1 
1061:    ADD  3,4,3 	Op + 
1062:     ST  3,-14(1) 	Store variable c
* WHILE
1063:     LD  3,-14(1) 	Load variable c
1064:     ST  3,-20(1) 	Save left side in temp 
1065:     LD  3,-2(0) 	Load variable numCards
1066:     LD  4,-20(1) 	Load left from temp into ac1 
1067:    SUB  4,4,3 	Op <= 
1068:    LDC  3,1(6) 	True case 
1069:    JLE  4,1(7) 	Jump if true 
1070:    LDC  3,0(6) 	False case 
1071:    LDC  4,1(6) 	Load constant 1 
1072:    SUB  3,3,4 	While cond check 
1073:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 89
1075:     LD  3,-14(1) 	Load variable c
1076:     ST  3,-20(1) 	Save left side in temp 
1077:    LDC  3,1(6) 	Load constant 
1078:     LD  4,-20(1) 	Load left from temp into ac1 
1079:    ADD  3,4,3 	Op + 
1080:     ST  3,-15(1) 	Store variable d
* WHILE
1081:     LD  3,-15(1) 	Load variable d
1082:     ST  3,-20(1) 	Save left side in temp 
1083:     LD  3,-2(0) 	Load variable numCards
1084:     LD  4,-20(1) 	Load left from temp into ac1 
1085:    SUB  4,4,3 	Op <= 
1086:    LDC  3,1(6) 	True case 
1087:    JLE  4,1(7) 	Jump if true 
1088:    LDC  3,0(6) 	False case 
1089:    LDC  4,1(6) 	Load constant 1 
1090:    SUB  3,3,4 	While cond check 
1091:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 91
1093:     LD  3,-15(1) 	Load variable d
1094:     ST  3,-20(1) 	Save left side in temp 
1095:    LDC  3,1(6) 	Load constant 
1096:     LD  4,-20(1) 	Load left from temp into ac1 
1097:    ADD  3,4,3 	Op + 
1098:     ST  3,-16(1) 	Store variable e
* WHILE
1099:     LD  3,-16(1) 	Load variable e
1100:     ST  3,-20(1) 	Save left side in temp 
1101:     LD  3,-2(0) 	Load variable numCards
1102:     LD  4,-20(1) 	Load left from temp into ac1 
1103:    SUB  4,4,3 	Op <= 
1104:    LDC  3,1(6) 	True case 
1105:    JLE  4,1(7) 	Jump if true 
1106:    LDC  3,0(6) 	False case 
1107:    LDC  4,1(6) 	Load constant 1 
1108:    SUB  3,3,4 	While cond check 
1109:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 93
1111:     LD  3,-18(1) 	Load variable possible
1112:     ST  3,-20(1) 	Save left side in temp 
1113:    LDC  3,1(6) 	Load constant 
1114:     LD  4,-20(1) 	Load left from temp into ac1 
1115:    ADD  3,4,3 	Op + 
1116:     ST  3,-18(1) 	Store variable possible
* 94
1117:     ST  1,-20(1) 	Store old fp in ghost frame 
1118:     LD  3,-12(1) 	Load variable a
1119:     ST  3,-22(1) 	Store parameter 
1120:     LD  3,-13(1) 	Load variable b
1121:     ST  3,-23(1) 	Store parameter 
1122:     LD  3,-14(1) 	Load variable c
1123:     ST  3,-24(1) 	Store parameter 
1124:     LD  3,-15(1) 	Load variable d
1125:     ST  3,-25(1) 	Store parameter 
1126:     LD  3,-16(1) 	Load variable e
1127:     ST  3,-26(1) 	Store parameter 
1128:    LDA  1,-20(1) 	Load address of new frame 
1129:    LDA  3,1(7) 	Return address in ac 
1130:    LDA  7,-956(7) 	call handtype
1131:    LDA  3,0(2) 	Save the result in ac 
1132:     ST  3,-17(1) 	Store variable h
* 95
1133:     LD  3,-17(1) 	Load variable h
1134:     ST  3,-20(1) 	Save index in temp 
1135:     LD  3,-17(1) 	Load variable h
1136:    LDA  4,-2(1) 	Load address of base of array hands
1137:    SUB  3,4,3 	Compute offset of value 
1138:     LD  3,0(3) 	Load the value 
1139:     ST  3,-21(1) 	Save left side in temp 
1140:    LDC  3,1(6) 	Load constant 
1141:     LD  4,-21(1) 	Load left from temp into ac1 
1142:    ADD  3,4,3 	Op + 
1143:     LD  4,-20(1) 	load index from temp to ac1 
1144:    LDA  5,-2(1) 	Load address of base of array hands
1145:    SUB  5,5,4 	Compute offset of value 
1146:     ST  3,0(5) 	Store variable hands
* 96
1147:     LD  3,-16(1) 	Load variable e
1148:     ST  3,-20(1) 	Save left side in temp 
1149:    LDC  3,1(6) 	Load constant 
1150:     LD  4,-20(1) 	Load left from temp into ac1 
1151:    ADD  3,4,3 	Op + 
1152:     ST  3,-16(1) 	Store variable e
* END compound statement
1153:    LDA  7,-55(7) 	go to beginning of loop 
1110:    LDA  7,43(7) 	No more loop 
* ENDWHILE
* 98
1154:     LD  3,-15(1) 	Load variable d
1155:     ST  3,-20(1) 	Save left side in temp 
1156:    LDC  3,1(6) 	Load constant 
1157:     LD  4,-20(1) 	Load left from temp into ac1 
1158:    ADD  3,4,3 	Op + 
1159:     ST  3,-15(1) 	Store variable d
* END compound statement
1160:    LDA  7,-80(7) 	go to beginning of loop 
1092:    LDA  7,68(7) 	No more loop 
* ENDWHILE
* 100
1161:     LD  3,-14(1) 	Load variable c
1162:     ST  3,-20(1) 	Save left side in temp 
1163:    LDC  3,1(6) 	Load constant 
1164:     LD  4,-20(1) 	Load left from temp into ac1 
1165:    ADD  3,4,3 	Op + 
1166:     ST  3,-14(1) 	Store variable c
* END compound statement
1167:    LDA  7,-105(7) 	go to beginning of loop 
1074:    LDA  7,93(7) 	No more loop 
* ENDWHILE
* 102
1168:     LD  3,-13(1) 	Load variable b
1169:     ST  3,-20(1) 	Save left side in temp 
1170:    LDC  3,1(6) 	Load constant 
1171:     LD  4,-20(1) 	Load left from temp into ac1 
1172:    ADD  3,4,3 	Op + 
1173:     ST  3,-13(1) 	Store variable b
* END compound statement
1174:    LDA  7,-130(7) 	go to beginning of loop 
1056:    LDA  7,118(7) 	No more loop 
* ENDWHILE
* 104
1175:     LD  3,-12(1) 	Load variable a
1176:     ST  3,-20(1) 	Save left side in temp 
1177:    LDC  3,1(6) 	Load constant 
1178:     LD  4,-20(1) 	Load left from temp into ac1 
1179:    ADD  3,4,3 	Op + 
1180:     ST  3,-12(1) 	Store variable a
* END compound statement
1181:    LDA  7,-167(7) 	go to beginning of loop 
1026:    LDA  7,155(7) 	No more loop 
* ENDWHILE
* 106
1182:    LDC  3,0(6) 	Load constant 
1183:     ST  3,-17(1) 	Store variable h
* WHILE
1184:     LD  3,-17(1) 	Load variable h
1185:     ST  3,-20(1) 	Save left side in temp 
1186:    LDC  3,10(6) 	Load constant 
1187:     LD  4,-20(1) 	Load left from temp into ac1 
1188:    SUB  4,4,3 	Op < 
1189:    LDC  3,1(6) 	True case 
1190:    JLT  4,1(7) 	Jump if true 
1191:    LDC  3,0(6) 	False case 
1192:    LDC  4,1(6) 	Load constant 1 
1193:    SUB  3,3,4 	While cond check 
1194:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 109
1196:     ST  1,-20(1) 	Store old fp in ghost frame 
1197:     LD  3,-17(1) 	Load variable h
1198:     ST  3,-22(1) 	Store parameter 
1199:    LDA  1,-20(1) 	Load address of new frame 
1200:    LDA  3,1(7) 	Return address in ac 
1201:    LDA  7,-1191(7) 	call output
1202:    LDA  3,0(2) 	Save the result in ac 
* 110
1203:     ST  1,-20(1) 	Store old fp in ghost frame 
1204:     LD  3,-17(1) 	Load variable h
1205:    LDA  4,-2(1) 	Load address of base of array hands
1206:    SUB  3,4,3 	Compute offset of value 
1207:     LD  3,0(3) 	Load the value 
1208:     ST  3,-22(1) 	Store parameter 
1209:    LDA  1,-20(1) 	Load address of new frame 
1210:    LDA  3,1(7) 	Return address in ac 
1211:    LDA  7,-1201(7) 	call output
1212:    LDA  3,0(2) 	Save the result in ac 
* 111
1213:     ST  1,-20(1) 	Store old fp in ghost frame 
1214:    LDA  1,-20(1) 	Load address of new frame 
1215:    LDA  3,1(7) 	Return address in ac 
1216:    LDA  7,-1187(7) 	call outnl
1217:    LDA  3,0(2) 	Save the result in ac 
* 112
1218:     LD  3,-17(1) 	Load variable h
1219:     ST  3,-20(1) 	Save left side in temp 
1220:    LDC  3,1(6) 	Load constant 
1221:     LD  4,-20(1) 	Load left from temp into ac1 
1222:    ADD  3,4,3 	Op + 
1223:     ST  3,-17(1) 	Store variable h
* END compound statement
1224:    LDA  7,-41(7) 	go to beginning of loop 
1195:    LDA  7,29(7) 	No more loop 
* ENDWHILE
* RETURN
1225:    LDC  3,0(6) 	Load constant 
1226:    LDA  2,0(3) 	Copy result to rt register 
1227:     LD  3,-1(1) 	Load return address 
1228:     LD  1,0(1) 	Adjust fp 
1229:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
1230:    LDC  2,0(6) 	Set return value to 0 
1231:     LD  3,-1(1) 	Load return address 
1232:     LD  1,0(1) 	Adjust fp 
1233:    LDA  7,0(3) 	Return 
* END of function main
