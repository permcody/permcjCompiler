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
* BEGIN function main
  4:    LDA  7,30(7) 	Jump to main 
 35:     ST  3,-1(1) 	Store return address. BEGIN FUNC: main
* BEGIN compound statement
* 14
 36:    LDC  3,0(6) 	Load constant 
 37:     ST  3,-6(1) 	Save index in temp 
 38:    LDC  3,50(6) 	Load constant 
 39:     LD  4,-6(1) 	load index from temp to ac1 
 40:    LDA  5,0(0) 	Load address of base of array y
 41:    SUB  5,5,4 	Compute offset of value 
 42:     ST  3,0(5) 	Store variable y
* 15
 43:    LDC  3,5(6) 	Load constant 
 44:     ST  3,-6(1) 	Save index in temp 
 45:    LDC  3,1(6) 	Load constant 
 46:     LD  4,-6(1) 	load index from temp to ac1 
 47:    LDA  5,0(0) 	Load address of base of array y
 48:    SUB  5,5,4 	Compute offset of value 
 49:     ST  3,0(5) 	Store variable y
* 16
 50:    LDC  3,8(6) 	Load constant 
 51:     ST  3,-6(1) 	Save index in temp 
 52:    LDC  3,2(6) 	Load constant 
 53:     LD  4,-6(1) 	load index from temp to ac1 
 54:    LDA  5,0(0) 	Load address of base of array y
 55:    SUB  5,5,4 	Compute offset of value 
 56:     ST  3,0(5) 	Store variable y
* 18
 57:    LDC  3,50(6) 	Load constant 
 58:     ST  3,-2(1) 	Store variable a
* 19
 59:    LDC  3,1(6) 	Load constant 
 60:     ST  3,-3(1) 	Store variable b
* 20
 61:    LDC  3,8(6) 	Load constant 
 62:     ST  3,-4(1) 	Store variable c
* 22
 63:    LDC  3,0(6) 	Load constant 
 64:     ST  3,-10(0) 	Store variable x
* 23
 65:    LDC  3,1(6) 	Load constant 
 66:     ST  3,-5(1) 	Store variable z
* 25
 67:     ST  1,-6(1) 	Store old fp in ghost frame 
 68:     LD  3,-2(1) 	Load variable a
 69:     ST  3,-8(1) 	Save left side in temp 
 70:    LDC  3,1(6) 	Load constant 
 71:     LD  4,-8(1) 	Load left from temp into ac1 
 72:    SUB  4,4,3 	Op <= 
 73:    LDC  3,1(6) 	True case 
 74:    JLE  4,1(7) 	Jump if true 
 75:    LDC  3,0(6) 	False case 
 76:     ST  3,-8(1) 	Store parameter 
 77:    LDA  1,-6(1) 	Load address of new frame 
 78:    LDA  3,1(7) 	Return address in ac 
 79:    LDA  7,-57(7) 	call outputb
 80:    LDA  3,0(2) 	Save the result in ac 
* 26
 81:     ST  1,-6(1) 	Store old fp in ghost frame 
 82:     LD  3,-3(1) 	Load variable b
 83:     ST  3,-8(1) 	Save left side in temp 
 84:    LDC  3,50(6) 	Load constant 
 85:     LD  4,-8(1) 	Load left from temp into ac1 
 86:    SUB  4,4,3 	Op <= 
 87:    LDC  3,1(6) 	True case 
 88:    JLE  4,1(7) 	Jump if true 
 89:    LDC  3,0(6) 	False case 
 90:     ST  3,-8(1) 	Store parameter 
 91:    LDA  1,-6(1) 	Load address of new frame 
 92:    LDA  3,1(7) 	Return address in ac 
 93:    LDA  7,-71(7) 	call outputb
 94:    LDA  3,0(2) 	Save the result in ac 
* 27
 95:     ST  1,-6(1) 	Store old fp in ghost frame 
 96:    LDC  3,50(6) 	Load constant 
 97:     ST  3,-8(1) 	Save left side in temp 
 98:    LDC  3,50(6) 	Load constant 
 99:     LD  4,-8(1) 	Load left from temp into ac1 
100:    SUB  4,4,3 	Op <= 
101:    LDC  3,1(6) 	True case 
102:    JLE  4,1(7) 	Jump if true 
103:    LDC  3,0(6) 	False case 
104:     ST  3,-8(1) 	Store parameter 
105:    LDA  1,-6(1) 	Load address of new frame 
106:    LDA  3,1(7) 	Return address in ac 
107:    LDA  7,-85(7) 	call outputb
108:    LDA  3,0(2) 	Save the result in ac 
* 28
109:     ST  1,-6(1) 	Store old fp in ghost frame 
110:    LDA  1,-6(1) 	Load address of new frame 
111:    LDA  3,1(7) 	Return address in ac 
112:    LDA  7,-83(7) 	call outnl
113:    LDA  3,0(2) 	Save the result in ac 
* 30
114:     ST  1,-6(1) 	Store old fp in ghost frame 
115:    LDC  3,50(6) 	Load constant 
116:     ST  3,-8(1) 	Save left side in temp 
117:    LDC  3,1(6) 	Load constant 
118:     LD  4,-8(1) 	Load left from temp into ac1 
119:    SUB  4,4,3 	Op < 
120:    LDC  3,1(6) 	True case 
121:    JLT  4,1(7) 	Jump if true 
122:    LDC  3,0(6) 	False case 
123:     ST  3,-8(1) 	Store parameter 
124:    LDA  1,-6(1) 	Load address of new frame 
125:    LDA  3,1(7) 	Return address in ac 
126:    LDA  7,-104(7) 	call outputb
127:    LDA  3,0(2) 	Save the result in ac 
* 31
128:     ST  1,-6(1) 	Store old fp in ghost frame 
129:     LD  3,-3(1) 	Load variable b
130:     ST  3,-8(1) 	Save left side in temp 
131:     LD  3,-2(1) 	Load variable a
132:     LD  4,-8(1) 	Load left from temp into ac1 
133:    SUB  4,4,3 	Op < 
134:    LDC  3,1(6) 	True case 
135:    JLT  4,1(7) 	Jump if true 
136:    LDC  3,0(6) 	False case 
137:     ST  3,-8(1) 	Store parameter 
138:    LDA  1,-6(1) 	Load address of new frame 
139:    LDA  3,1(7) 	Return address in ac 
140:    LDA  7,-118(7) 	call outputb
141:    LDA  3,0(2) 	Save the result in ac 
* 32
142:     ST  1,-6(1) 	Store old fp in ghost frame 
143:     LD  3,-2(1) 	Load variable a
144:     ST  3,-8(1) 	Save left side in temp 
145:     LD  3,-2(1) 	Load variable a
146:     LD  4,-8(1) 	Load left from temp into ac1 
147:    SUB  4,4,3 	Op < 
148:    LDC  3,1(6) 	True case 
149:    JLT  4,1(7) 	Jump if true 
150:    LDC  3,0(6) 	False case 
151:     ST  3,-8(1) 	Store parameter 
152:    LDA  1,-6(1) 	Load address of new frame 
153:    LDA  3,1(7) 	Return address in ac 
154:    LDA  7,-132(7) 	call outputb
155:    LDA  3,0(2) 	Save the result in ac 
* 33
156:     ST  1,-6(1) 	Store old fp in ghost frame 
157:    LDA  1,-6(1) 	Load address of new frame 
158:    LDA  3,1(7) 	Return address in ac 
159:    LDA  7,-130(7) 	call outnl
160:    LDA  3,0(2) 	Save the result in ac 
* 35
161:     ST  1,-6(1) 	Store old fp in ghost frame 
162:    LDC  3,50(6) 	Load constant 
163:     ST  3,-8(1) 	Save left side in temp 
164:    LDC  3,1(6) 	Load constant 
165:     LD  4,-8(1) 	Load left from temp into ac1 
166:    SUB  4,4,3 	Op > 
167:    LDC  3,1(6) 	True case 
168:    JGT  4,1(7) 	Jump if true 
169:    LDC  3,0(6) 	False case 
170:     ST  3,-8(1) 	Store parameter 
171:    LDA  1,-6(1) 	Load address of new frame 
172:    LDA  3,1(7) 	Return address in ac 
173:    LDA  7,-151(7) 	call outputb
174:    LDA  3,0(2) 	Save the result in ac 
* 36
175:     ST  1,-6(1) 	Store old fp in ghost frame 
176:    LDC  3,1(6) 	Load constant 
177:     ST  3,-8(1) 	Save left side in temp 
178:    LDC  3,50(6) 	Load constant 
179:     LD  4,-8(1) 	Load left from temp into ac1 
180:    SUB  4,4,3 	Op > 
181:    LDC  3,1(6) 	True case 
182:    JGT  4,1(7) 	Jump if true 
183:    LDC  3,0(6) 	False case 
184:     ST  3,-8(1) 	Store parameter 
185:    LDA  1,-6(1) 	Load address of new frame 
186:    LDA  3,1(7) 	Return address in ac 
187:    LDA  7,-165(7) 	call outputb
188:    LDA  3,0(2) 	Save the result in ac 
* 37
189:     ST  1,-6(1) 	Store old fp in ghost frame 
190:    LDC  3,50(6) 	Load constant 
191:     ST  3,-8(1) 	Save left side in temp 
192:    LDC  3,50(6) 	Load constant 
193:     LD  4,-8(1) 	Load left from temp into ac1 
194:    SUB  4,4,3 	Op > 
195:    LDC  3,1(6) 	True case 
196:    JGT  4,1(7) 	Jump if true 
197:    LDC  3,0(6) 	False case 
198:     ST  3,-8(1) 	Store parameter 
199:    LDA  1,-6(1) 	Load address of new frame 
200:    LDA  3,1(7) 	Return address in ac 
201:    LDA  7,-179(7) 	call outputb
202:    LDA  3,0(2) 	Save the result in ac 
* 38
203:     ST  1,-6(1) 	Store old fp in ghost frame 
204:    LDA  1,-6(1) 	Load address of new frame 
205:    LDA  3,1(7) 	Return address in ac 
206:    LDA  7,-177(7) 	call outnl
207:    LDA  3,0(2) 	Save the result in ac 
* 40
208:     ST  1,-6(1) 	Store old fp in ghost frame 
209:    LDC  3,50(6) 	Load constant 
210:     ST  3,-8(1) 	Save left side in temp 
211:    LDC  3,1(6) 	Load constant 
212:     LD  4,-8(1) 	Load left from temp into ac1 
213:    SUB  4,4,3 	Op >= 
214:    LDC  3,1(6) 	True case 
215:    JGE  4,1(7) 	Jump if true 
216:    LDC  3,0(6) 	False case 
217:     ST  3,-8(1) 	Store parameter 
218:    LDA  1,-6(1) 	Load address of new frame 
219:    LDA  3,1(7) 	Return address in ac 
220:    LDA  7,-198(7) 	call outputb
221:    LDA  3,0(2) 	Save the result in ac 
* 41
222:     ST  1,-6(1) 	Store old fp in ghost frame 
223:    LDC  3,1(6) 	Load constant 
224:     ST  3,-8(1) 	Save left side in temp 
225:    LDC  3,50(6) 	Load constant 
226:     LD  4,-8(1) 	Load left from temp into ac1 
227:    SUB  4,4,3 	Op >= 
228:    LDC  3,1(6) 	True case 
229:    JGE  4,1(7) 	Jump if true 
230:    LDC  3,0(6) 	False case 
231:     ST  3,-8(1) 	Store parameter 
232:    LDA  1,-6(1) 	Load address of new frame 
233:    LDA  3,1(7) 	Return address in ac 
234:    LDA  7,-212(7) 	call outputb
235:    LDA  3,0(2) 	Save the result in ac 
* 42
236:     ST  1,-6(1) 	Store old fp in ghost frame 
237:    LDC  3,50(6) 	Load constant 
238:     ST  3,-8(1) 	Save left side in temp 
239:    LDC  3,50(6) 	Load constant 
240:     LD  4,-8(1) 	Load left from temp into ac1 
241:    SUB  4,4,3 	Op >= 
242:    LDC  3,1(6) 	True case 
243:    JGE  4,1(7) 	Jump if true 
244:    LDC  3,0(6) 	False case 
245:     ST  3,-8(1) 	Store parameter 
246:    LDA  1,-6(1) 	Load address of new frame 
247:    LDA  3,1(7) 	Return address in ac 
248:    LDA  7,-226(7) 	call outputb
249:    LDA  3,0(2) 	Save the result in ac 
* 43
250:     ST  1,-6(1) 	Store old fp in ghost frame 
251:    LDA  1,-6(1) 	Load address of new frame 
252:    LDA  3,1(7) 	Return address in ac 
253:    LDA  7,-224(7) 	call outnl
254:    LDA  3,0(2) 	Save the result in ac 
* 45
255:     ST  1,-6(1) 	Store old fp in ghost frame 
256:    LDC  3,0(6) 	Load constant 
257:    LDA  4,0(0) 	Load address of base of array y
258:    SUB  3,4,3 	Compute offset of value 
259:     LD  3,0(3) 	Load the value 
260:     ST  3,-8(1) 	Save left side in temp 
261:     LD  3,-3(1) 	Load variable b
262:     LD  4,-8(1) 	Load left from temp into ac1 
263:    SUB  4,4,3 	Op == 
264:    LDC  3,1(6) 	True case 
265:    JEQ  4,1(7) 	Jump if true 
266:    LDC  3,0(6) 	False case 
267:     ST  3,-8(1) 	Store parameter 
268:    LDA  1,-6(1) 	Load address of new frame 
269:    LDA  3,1(7) 	Return address in ac 
270:    LDA  7,-248(7) 	call outputb
271:    LDA  3,0(2) 	Save the result in ac 
* 46
272:     ST  1,-6(1) 	Store old fp in ghost frame 
273:     LD  3,-2(1) 	Load variable a
274:     ST  3,-8(1) 	Save left side in temp 
275:     LD  3,-3(1) 	Load variable b
276:     LD  4,-8(1) 	Load left from temp into ac1 
277:    SUB  4,4,3 	Op == 
278:    LDC  3,1(6) 	True case 
279:    JEQ  4,1(7) 	Jump if true 
280:    LDC  3,0(6) 	False case 
281:     ST  3,-8(1) 	Store parameter 
282:    LDA  1,-6(1) 	Load address of new frame 
283:    LDA  3,1(7) 	Return address in ac 
284:    LDA  7,-262(7) 	call outputb
285:    LDA  3,0(2) 	Save the result in ac 
* 47
286:     ST  1,-6(1) 	Store old fp in ghost frame 
287:     LD  3,-3(1) 	Load variable b
288:     ST  3,-8(1) 	Save left side in temp 
289:     LD  3,-3(1) 	Load variable b
290:     LD  4,-8(1) 	Load left from temp into ac1 
291:    SUB  4,4,3 	Op == 
292:    LDC  3,1(6) 	True case 
293:    JEQ  4,1(7) 	Jump if true 
294:    LDC  3,0(6) 	False case 
295:     ST  3,-8(1) 	Store parameter 
296:    LDA  1,-6(1) 	Load address of new frame 
297:    LDA  3,1(7) 	Return address in ac 
298:    LDA  7,-276(7) 	call outputb
299:    LDA  3,0(2) 	Save the result in ac 
* 48
300:     ST  1,-6(1) 	Store old fp in ghost frame 
301:    LDA  1,-6(1) 	Load address of new frame 
302:    LDA  3,1(7) 	Return address in ac 
303:    LDA  7,-274(7) 	call outnl
304:    LDA  3,0(2) 	Save the result in ac 
* 50
305:     ST  1,-6(1) 	Store old fp in ghost frame 
306:    LDC  3,0(6) 	Load constant 
307:    LDA  4,0(0) 	Load address of base of array y
308:    SUB  3,4,3 	Compute offset of value 
309:     LD  3,0(3) 	Load the value 
310:     ST  3,-8(1) 	Save left side in temp 
311:     LD  3,-2(1) 	Load variable a
312:     LD  4,-8(1) 	Load left from temp into ac1 
313:    SUB  3,4,3 	Op != 
314:    JEQ  3,1(7) 	Jump if true 
315:    LDC  3,1(6) 	True case 
316:     ST  3,-8(1) 	Store parameter 
317:    LDA  1,-6(1) 	Load address of new frame 
318:    LDA  3,1(7) 	Return address in ac 
319:    LDA  7,-297(7) 	call outputb
320:    LDA  3,0(2) 	Save the result in ac 
* 51
321:     ST  1,-6(1) 	Store old fp in ghost frame 
322:    LDC  3,0(6) 	Load constant 
323:    LDA  4,0(0) 	Load address of base of array y
324:    SUB  3,4,3 	Compute offset of value 
325:     LD  3,0(3) 	Load the value 
326:     ST  3,-8(1) 	Save left side in temp 
327:     LD  3,-3(1) 	Load variable b
328:     LD  4,-8(1) 	Load left from temp into ac1 
329:    SUB  3,4,3 	Op != 
330:    JEQ  3,1(7) 	Jump if true 
331:    LDC  3,1(6) 	True case 
332:     ST  3,-8(1) 	Store parameter 
333:    LDA  1,-6(1) 	Load address of new frame 
334:    LDA  3,1(7) 	Return address in ac 
335:    LDA  7,-313(7) 	call outputb
336:    LDA  3,0(2) 	Save the result in ac 
* 52
337:     ST  1,-6(1) 	Store old fp in ghost frame 
338:     LD  3,-2(1) 	Load variable a
339:     ST  3,-8(1) 	Save left side in temp 
340:     LD  3,-3(1) 	Load variable b
341:     LD  4,-8(1) 	Load left from temp into ac1 
342:    SUB  3,4,3 	Op != 
343:    JEQ  3,1(7) 	Jump if true 
344:    LDC  3,1(6) 	True case 
345:     ST  3,-8(1) 	Store parameter 
346:    LDA  1,-6(1) 	Load address of new frame 
347:    LDA  3,1(7) 	Return address in ac 
348:    LDA  7,-326(7) 	call outputb
349:    LDA  3,0(2) 	Save the result in ac 
* 53
350:     ST  1,-6(1) 	Store old fp in ghost frame 
351:     LD  3,-3(1) 	Load variable b
352:     ST  3,-8(1) 	Save left side in temp 
353:     LD  3,-3(1) 	Load variable b
354:     LD  4,-8(1) 	Load left from temp into ac1 
355:    SUB  3,4,3 	Op != 
356:    JEQ  3,1(7) 	Jump if true 
357:    LDC  3,1(6) 	True case 
358:     ST  3,-8(1) 	Store parameter 
359:    LDA  1,-6(1) 	Load address of new frame 
360:    LDA  3,1(7) 	Return address in ac 
361:    LDA  7,-339(7) 	call outputb
362:    LDA  3,0(2) 	Save the result in ac 
* 54
363:     ST  1,-6(1) 	Store old fp in ghost frame 
364:    LDA  1,-6(1) 	Load address of new frame 
365:    LDA  3,1(7) 	Return address in ac 
366:    LDA  7,-337(7) 	call outnl
367:    LDA  3,0(2) 	Save the result in ac 
* 56
368:     ST  1,-6(1) 	Store old fp in ghost frame 
369:    LDC  3,1(6) 	Load constant 
370:     ST  3,-8(1) 	Save left side in temp 
371:    LDC  3,1(6) 	Load constant 
372:     LD  4,-8(1) 	Load left from temp into ac1 
373:    JEQ  3,3(7) 	Jump if false for Op && 
374:    LDC  3,0(6) 	False case 
375:    JEQ  4,1(7) 	Jump if false 
376:    LDC  3,1(6) 	True case 
377:     ST  3,-8(1) 	Store parameter 
378:    LDA  1,-6(1) 	Load address of new frame 
379:    LDA  3,1(7) 	Return address in ac 
380:    LDA  7,-358(7) 	call outputb
381:    LDA  3,0(2) 	Save the result in ac 
* 57
382:     ST  1,-6(1) 	Store old fp in ghost frame 
383:    LDC  3,1(6) 	Load constant 
384:     ST  3,-8(1) 	Save left side in temp 
385:    LDC  3,0(6) 	Load constant 
386:     LD  4,-8(1) 	Load left from temp into ac1 
387:    JEQ  3,3(7) 	Jump if false for Op && 
388:    LDC  3,0(6) 	False case 
389:    JEQ  4,1(7) 	Jump if false 
390:    LDC  3,1(6) 	True case 
391:     ST  3,-8(1) 	Store parameter 
392:    LDA  1,-6(1) 	Load address of new frame 
393:    LDA  3,1(7) 	Return address in ac 
394:    LDA  7,-372(7) 	call outputb
395:    LDA  3,0(2) 	Save the result in ac 
* 58
396:     ST  1,-6(1) 	Store old fp in ghost frame 
397:    LDC  3,0(6) 	Load constant 
398:     ST  3,-8(1) 	Save left side in temp 
399:    LDC  3,1(6) 	Load constant 
400:     LD  4,-8(1) 	Load left from temp into ac1 
401:    JEQ  3,3(7) 	Jump if false for Op && 
402:    LDC  3,0(6) 	False case 
403:    JEQ  4,1(7) 	Jump if false 
404:    LDC  3,1(6) 	True case 
405:     ST  3,-8(1) 	Store parameter 
406:    LDA  1,-6(1) 	Load address of new frame 
407:    LDA  3,1(7) 	Return address in ac 
408:    LDA  7,-386(7) 	call outputb
409:    LDA  3,0(2) 	Save the result in ac 
* 59
410:     ST  1,-6(1) 	Store old fp in ghost frame 
411:    LDC  3,0(6) 	Load constant 
412:     ST  3,-8(1) 	Save left side in temp 
413:    LDC  3,0(6) 	Load constant 
414:     LD  4,-8(1) 	Load left from temp into ac1 
415:    JEQ  3,3(7) 	Jump if false for Op && 
416:    LDC  3,0(6) 	False case 
417:    JEQ  4,1(7) 	Jump if false 
418:    LDC  3,1(6) 	True case 
419:     ST  3,-8(1) 	Store parameter 
420:    LDA  1,-6(1) 	Load address of new frame 
421:    LDA  3,1(7) 	Return address in ac 
422:    LDA  7,-400(7) 	call outputb
423:    LDA  3,0(2) 	Save the result in ac 
* 60
424:     ST  1,-6(1) 	Store old fp in ghost frame 
425:    LDA  1,-6(1) 	Load address of new frame 
426:    LDA  3,1(7) 	Return address in ac 
427:    LDA  7,-398(7) 	call outnl
428:    LDA  3,0(2) 	Save the result in ac 
* 62
429:     ST  1,-6(1) 	Store old fp in ghost frame 
430:    LDC  3,1(6) 	Load constant 
431:     ST  3,-8(1) 	Save left side in temp 
432:    LDC  3,1(6) 	Load constant 
433:     LD  4,-8(1) 	Load left from temp into ac1 
434:    ADD  3,4,3 	Op || 
435:    JEQ  3,1(7) 	Jump if false 
436:    LDC  3,1(6) 	True case 
437:     ST  3,-8(1) 	Store parameter 
438:    LDA  1,-6(1) 	Load address of new frame 
439:    LDA  3,1(7) 	Return address in ac 
440:    LDA  7,-418(7) 	call outputb
441:    LDA  3,0(2) 	Save the result in ac 
* 63
442:     ST  1,-6(1) 	Store old fp in ghost frame 
443:     LD  3,-5(1) 	Load variable z
444:     ST  3,-8(1) 	Save left side in temp 
445:    LDC  3,0(6) 	Load constant 
446:     LD  4,-8(1) 	Load left from temp into ac1 
447:    ADD  3,4,3 	Op || 
448:    JEQ  3,1(7) 	Jump if false 
449:    LDC  3,1(6) 	True case 
450:     ST  3,-8(1) 	Store parameter 
451:    LDA  1,-6(1) 	Load address of new frame 
452:    LDA  3,1(7) 	Return address in ac 
453:    LDA  7,-431(7) 	call outputb
454:    LDA  3,0(2) 	Save the result in ac 
* 64
455:     ST  1,-6(1) 	Store old fp in ghost frame 
456:    LDC  3,0(6) 	Load constant 
457:     ST  3,-8(1) 	Save left side in temp 
458:    LDC  3,1(6) 	Load constant 
459:     LD  4,-8(1) 	Load left from temp into ac1 
460:    ADD  3,4,3 	Op || 
461:    JEQ  3,1(7) 	Jump if false 
462:    LDC  3,1(6) 	True case 
463:     ST  3,-8(1) 	Store parameter 
464:    LDA  1,-6(1) 	Load address of new frame 
465:    LDA  3,1(7) 	Return address in ac 
466:    LDA  7,-444(7) 	call outputb
467:    LDA  3,0(2) 	Save the result in ac 
* 65
468:     ST  1,-6(1) 	Store old fp in ghost frame 
469:    LDC  3,0(6) 	Load constant 
470:     ST  3,-8(1) 	Save left side in temp 
471:    LDC  3,0(6) 	Load constant 
472:     LD  4,-8(1) 	Load left from temp into ac1 
473:    ADD  3,4,3 	Op || 
474:    JEQ  3,1(7) 	Jump if false 
475:    LDC  3,1(6) 	True case 
476:     ST  3,-8(1) 	Store parameter 
477:    LDA  1,-6(1) 	Load address of new frame 
478:    LDA  3,1(7) 	Return address in ac 
479:    LDA  7,-457(7) 	call outputb
480:    LDA  3,0(2) 	Save the result in ac 
* 66
481:     ST  1,-6(1) 	Store old fp in ghost frame 
482:    LDA  1,-6(1) 	Load address of new frame 
483:    LDA  3,1(7) 	Return address in ac 
484:    LDA  7,-455(7) 	call outnl
485:    LDA  3,0(2) 	Save the result in ac 
* 68
486:     ST  1,-6(1) 	Store old fp in ghost frame 
487:    LDC  3,1(6) 	Load constant 
488:    LDC  4,1(6) 	Load 1 
489:    SUB  3,4,3 	Op ! 
490:     ST  3,-8(1) 	Store parameter 
491:    LDA  1,-6(1) 	Load address of new frame 
492:    LDA  3,1(7) 	Return address in ac 
493:    LDA  7,-471(7) 	call outputb
494:    LDA  3,0(2) 	Save the result in ac 
* 69
495:     ST  1,-6(1) 	Store old fp in ghost frame 
496:     LD  3,-10(0) 	Load variable x
497:    LDC  4,1(6) 	Load 1 
498:    SUB  3,4,3 	Op ! 
499:     ST  3,-8(1) 	Store parameter 
500:    LDA  1,-6(1) 	Load address of new frame 
501:    LDA  3,1(7) 	Return address in ac 
502:    LDA  7,-480(7) 	call outputb
503:    LDA  3,0(2) 	Save the result in ac 
* 70
504:     ST  1,-6(1) 	Store old fp in ghost frame 
505:    LDA  1,-6(1) 	Load address of new frame 
506:    LDA  3,1(7) 	Return address in ac 
507:    LDA  7,-478(7) 	call outnl
508:    LDA  3,0(2) 	Save the result in ac 
* 72
509:     ST  1,-6(1) 	Store old fp in ghost frame 
510:    LDC  3,5(6) 	Load constant 
511:     ST  3,-8(1) 	Save left side in temp 
512:    LDC  3,50(6) 	Load constant 
513:     LD  4,-8(1) 	Load left from temp into ac1 
514:    ADD  3,4,3 	Op + 
515:     ST  3,-8(1) 	Store parameter 
516:    LDA  1,-6(1) 	Load address of new frame 
517:    LDA  3,1(7) 	Return address in ac 
518:    LDA  7,-508(7) 	call output
519:    LDA  3,0(2) 	Save the result in ac 
* 73
520:     ST  1,-6(1) 	Store old fp in ghost frame 
521:     LD  3,-4(1) 	Load variable c
522:    LDA  4,0(0) 	Load address of base of array y
523:    SUB  3,4,3 	Compute offset of value 
524:     LD  3,0(3) 	Load the value 
525:     ST  3,-8(1) 	Save left side in temp 
526:    LDC  3,50(6) 	Load constant 
527:     LD  4,-8(1) 	Load left from temp into ac1 
528:    ADD  3,4,3 	Op + 
529:     ST  3,-8(1) 	Store parameter 
530:    LDA  1,-6(1) 	Load address of new frame 
531:    LDA  3,1(7) 	Return address in ac 
532:    LDA  7,-522(7) 	call output
533:    LDA  3,0(2) 	Save the result in ac 
* 74
534:     ST  1,-6(1) 	Store old fp in ghost frame 
535:    LDA  1,-6(1) 	Load address of new frame 
536:    LDA  3,1(7) 	Return address in ac 
537:    LDA  7,-508(7) 	call outnl
538:    LDA  3,0(2) 	Save the result in ac 
* 76
539:     ST  1,-6(1) 	Store old fp in ghost frame 
540:    LDC  3,5(6) 	Load constant 
541:     ST  3,-8(1) 	Save left side in temp 
542:    LDC  3,50(6) 	Load constant 
543:     LD  4,-8(1) 	Load left from temp into ac1 
544:    SUB  3,4,3 	Op - 
545:     ST  3,-8(1) 	Store parameter 
546:    LDA  1,-6(1) 	Load address of new frame 
547:    LDA  3,1(7) 	Return address in ac 
548:    LDA  7,-538(7) 	call output
549:    LDA  3,0(2) 	Save the result in ac 
* 77
550:     ST  1,-6(1) 	Store old fp in ghost frame 
551:    LDC  3,30(6) 	Load constant 
552:     ST  3,-8(1) 	Save left side in temp 
553:    LDC  3,5(6) 	Load constant 
554:     LD  4,-8(1) 	Load left from temp into ac1 
555:    SUB  3,4,3 	Op - 
556:     ST  3,-8(1) 	Save left side in temp 
557:    LDC  3,50(6) 	Load constant 
558:     LD  4,-8(1) 	Load left from temp into ac1 
559:    SUB  3,4,3 	Op - 
560:     ST  3,-8(1) 	Store parameter 
561:    LDA  1,-6(1) 	Load address of new frame 
562:    LDA  3,1(7) 	Return address in ac 
563:    LDA  7,-553(7) 	call output
564:    LDA  3,0(2) 	Save the result in ac 
* 78
565:     ST  1,-6(1) 	Store old fp in ghost frame 
566:    LDA  1,-6(1) 	Load address of new frame 
567:    LDA  3,1(7) 	Return address in ac 
568:    LDA  7,-539(7) 	call outnl
569:    LDA  3,0(2) 	Save the result in ac 
* 80
570:     ST  1,-6(1) 	Store old fp in ghost frame 
571:     LD  3,-2(1) 	Load variable a
572:    LDC  4,0(6) 	Load 0 
573:    SUB  3,4,3 	Op unary - 
574:     ST  3,-8(1) 	Store parameter 
575:    LDA  1,-6(1) 	Load address of new frame 
576:    LDA  3,1(7) 	Return address in ac 
577:    LDA  7,-567(7) 	call output
578:    LDA  3,0(2) 	Save the result in ac 
* 81
579:     ST  1,-6(1) 	Store old fp in ghost frame 
580:    LDC  3,0(6) 	Load constant 
581:    LDC  4,0(6) 	Load 0 
582:    SUB  3,4,3 	Op unary - 
583:     ST  3,-8(1) 	Store parameter 
584:    LDA  1,-6(1) 	Load address of new frame 
585:    LDA  3,1(7) 	Return address in ac 
586:    LDA  7,-576(7) 	call output
587:    LDA  3,0(2) 	Save the result in ac 
* 82
588:     ST  1,-6(1) 	Store old fp in ghost frame 
589:    LDC  3,1(6) 	Load constant 
590:    LDC  4,0(6) 	Load 0 
591:    SUB  3,4,3 	Op unary - 
592:     ST  3,-8(1) 	Store parameter 
593:    LDA  1,-6(1) 	Load address of new frame 
594:    LDA  3,1(7) 	Return address in ac 
595:    LDA  7,-585(7) 	call output
596:    LDA  3,0(2) 	Save the result in ac 
* 83
597:     ST  1,-6(1) 	Store old fp in ghost frame 
598:    LDA  1,-6(1) 	Load address of new frame 
599:    LDA  3,1(7) 	Return address in ac 
600:    LDA  7,-571(7) 	call outnl
601:    LDA  3,0(2) 	Save the result in ac 
* 85
602:     ST  1,-6(1) 	Store old fp in ghost frame 
603:    LDC  3,2(6) 	Load constant 
604:     ST  3,-8(1) 	Save left side in temp 
605:    LDC  3,3(6) 	Load constant 
606:     LD  4,-8(1) 	Load left from temp into ac1 
607:    MUL  3,4,3 	Op * 
608:     ST  3,-8(1) 	Save left side in temp 
609:    LDC  3,5(6) 	Load constant 
610:     LD  4,-8(1) 	Load left from temp into ac1 
611:    MUL  3,4,3 	Op * 
612:     ST  3,-8(1) 	Save left side in temp 
613:    LDC  3,7(6) 	Load constant 
614:     LD  4,-8(1) 	Load left from temp into ac1 
615:    MUL  3,4,3 	Op * 
616:     ST  3,-8(1) 	Save left side in temp 
617:    LDC  3,11(6) 	Load constant 
618:     LD  4,-8(1) 	Load left from temp into ac1 
619:    MUL  3,4,3 	Op * 
620:     ST  3,-8(1) 	Store parameter 
621:    LDA  1,-6(1) 	Load address of new frame 
622:    LDA  3,1(7) 	Return address in ac 
623:    LDA  7,-613(7) 	call output
624:    LDA  3,0(2) 	Save the result in ac 
* 86
625:     ST  1,-6(1) 	Store old fp in ghost frame 
626:    LDC  3,50(6) 	Load constant 
627:     ST  3,-8(1) 	Save left side in temp 
628:    LDC  3,8(6) 	Load constant 
629:    LDA  4,0(0) 	Load address of base of array y
630:    SUB  3,4,3 	Compute offset of value 
631:     LD  3,0(3) 	Load the value 
632:     LD  4,-8(1) 	Load left from temp into ac1 
633:    MUL  3,4,3 	Op * 
634:     ST  3,-8(1) 	Store parameter 
635:    LDA  1,-6(1) 	Load address of new frame 
636:    LDA  3,1(7) 	Return address in ac 
637:    LDA  7,-627(7) 	call output
638:    LDA  3,0(2) 	Save the result in ac 
* 87
639:     ST  1,-6(1) 	Store old fp in ghost frame 
640:    LDC  3,8(6) 	Load constant 
641:    LDA  4,0(0) 	Load address of base of array y
642:    SUB  3,4,3 	Compute offset of value 
643:     LD  3,0(3) 	Load the value 
644:     ST  3,-8(1) 	Save left side in temp 
645:    LDC  3,50(6) 	Load constant 
646:     LD  4,-8(1) 	Load left from temp into ac1 
647:    MUL  3,4,3 	Op * 
648:     ST  3,-8(1) 	Store parameter 
649:    LDA  1,-6(1) 	Load address of new frame 
650:    LDA  3,1(7) 	Return address in ac 
651:    LDA  7,-641(7) 	call output
652:    LDA  3,0(2) 	Save the result in ac 
* 88
653:     ST  1,-6(1) 	Store old fp in ghost frame 
654:    LDA  1,-6(1) 	Load address of new frame 
655:    LDA  3,1(7) 	Return address in ac 
656:    LDA  7,-627(7) 	call outnl
657:    LDA  3,0(2) 	Save the result in ac 
* 90
658:     ST  1,-6(1) 	Store old fp in ghost frame 
659:    LDC  3,50(6) 	Load constant 
660:     ST  3,-8(1) 	Save left side in temp 
661:    LDC  3,8(6) 	Load constant 
662:    LDA  4,0(0) 	Load address of base of array y
663:    SUB  3,4,3 	Compute offset of value 
664:     LD  3,0(3) 	Load the value 
665:     LD  4,-8(1) 	Load left from temp into ac1 
666:    DIV  3,4,3 	Op / 
667:     ST  3,-8(1) 	Store parameter 
668:    LDA  1,-6(1) 	Load address of new frame 
669:    LDA  3,1(7) 	Return address in ac 
670:    LDA  7,-660(7) 	call output
671:    LDA  3,0(2) 	Save the result in ac 
* 91
672:     ST  1,-6(1) 	Store old fp in ghost frame 
673:    LDC  3,8(6) 	Load constant 
674:    LDA  4,0(0) 	Load address of base of array y
675:    SUB  3,4,3 	Compute offset of value 
676:     LD  3,0(3) 	Load the value 
677:     ST  3,-8(1) 	Save left side in temp 
678:    LDC  3,50(6) 	Load constant 
679:     LD  4,-8(1) 	Load left from temp into ac1 
680:    DIV  3,4,3 	Op / 
681:     ST  3,-8(1) 	Store parameter 
682:    LDA  1,-6(1) 	Load address of new frame 
683:    LDA  3,1(7) 	Return address in ac 
684:    LDA  7,-674(7) 	call output
685:    LDA  3,0(2) 	Save the result in ac 
* 92
686:     ST  1,-6(1) 	Store old fp in ghost frame 
687:    LDC  3,8(6) 	Load constant 
688:    LDA  4,0(0) 	Load address of base of array y
689:    SUB  3,4,3 	Compute offset of value 
690:     LD  3,0(3) 	Load the value 
691:     ST  3,-8(1) 	Save left side in temp 
692:     LD  3,-3(1) 	Load variable b
693:     LD  4,-8(1) 	Load left from temp into ac1 
694:    DIV  3,4,3 	Op / 
695:     ST  3,-8(1) 	Store parameter 
696:    LDA  1,-6(1) 	Load address of new frame 
697:    LDA  3,1(7) 	Return address in ac 
698:    LDA  7,-688(7) 	call output
699:    LDA  3,0(2) 	Save the result in ac 
* 93
700:     ST  1,-6(1) 	Store old fp in ghost frame 
701:    LDC  3,210(6) 	Load constant 
702:     ST  3,-8(1) 	Save left side in temp 
703:    LDC  3,7(6) 	Load constant 
704:     LD  4,-8(1) 	Load left from temp into ac1 
705:    DIV  3,4,3 	Op / 
706:     ST  3,-8(1) 	Save left side in temp 
707:    LDC  3,3(6) 	Load constant 
708:     LD  4,-8(1) 	Load left from temp into ac1 
709:    DIV  3,4,3 	Op / 
710:     ST  3,-8(1) 	Store parameter 
711:    LDA  1,-6(1) 	Load address of new frame 
712:    LDA  3,1(7) 	Return address in ac 
713:    LDA  7,-703(7) 	call output
714:    LDA  3,0(2) 	Save the result in ac 
* 94
715:     ST  1,-6(1) 	Store old fp in ghost frame 
716:    LDA  1,-6(1) 	Load address of new frame 
717:    LDA  3,1(7) 	Return address in ac 
718:    LDA  7,-689(7) 	call outnl
719:    LDA  3,0(2) 	Save the result in ac 
* 96
720:     ST  1,-6(1) 	Store old fp in ghost frame 
721:    LDC  3,211(6) 	Load constant 
722:     ST  3,-8(1) 	Save left side in temp 
723:    LDC  3,7(6) 	Load constant 
724:     LD  4,-8(1) 	Load left from temp into ac1 
725:    DIV  5,4,3 	Op % 
726:    MUL  5,5,3 	 
727:    SUB  3,4,5 	 
728:     ST  3,-8(1) 	Store parameter 
729:    LDA  1,-6(1) 	Load address of new frame 
730:    LDA  3,1(7) 	Return address in ac 
731:    LDA  7,-721(7) 	call output
732:    LDA  3,0(2) 	Save the result in ac 
* 97
733:     ST  1,-6(1) 	Store old fp in ghost frame 
734:    LDC  3,211(6) 	Load constant 
735:     ST  3,-8(1) 	Save left side in temp 
736:    LDC  3,6(6) 	Load constant 
737:     LD  4,-8(1) 	Load left from temp into ac1 
738:    DIV  5,4,3 	Op % 
739:    MUL  5,5,3 	 
740:    SUB  3,4,5 	 
741:     ST  3,-8(1) 	Store parameter 
742:    LDA  1,-6(1) 	Load address of new frame 
743:    LDA  3,1(7) 	Return address in ac 
744:    LDA  7,-734(7) 	call output
745:    LDA  3,0(2) 	Save the result in ac 
* 98
746:     ST  1,-6(1) 	Store old fp in ghost frame 
747:    LDC  3,211(6) 	Load constant 
748:     ST  3,-8(1) 	Save left side in temp 
749:    LDC  3,5(6) 	Load constant 
750:     LD  4,-8(1) 	Load left from temp into ac1 
751:    DIV  5,4,3 	Op % 
752:    MUL  5,5,3 	 
753:    SUB  3,4,5 	 
754:     ST  3,-8(1) 	Store parameter 
755:    LDA  1,-6(1) 	Load address of new frame 
756:    LDA  3,1(7) 	Return address in ac 
757:    LDA  7,-747(7) 	call output
758:    LDA  3,0(2) 	Save the result in ac 
* 99
759:     ST  1,-6(1) 	Store old fp in ghost frame 
760:    LDC  3,211(6) 	Load constant 
761:     ST  3,-8(1) 	Save left side in temp 
762:    LDC  3,4(6) 	Load constant 
763:     LD  4,-8(1) 	Load left from temp into ac1 
764:    DIV  5,4,3 	Op % 
765:    MUL  5,5,3 	 
766:    SUB  3,4,5 	 
767:     ST  3,-8(1) 	Store parameter 
768:    LDA  1,-6(1) 	Load address of new frame 
769:    LDA  3,1(7) 	Return address in ac 
770:    LDA  7,-760(7) 	call output
771:    LDA  3,0(2) 	Save the result in ac 
* 100
772:     ST  1,-6(1) 	Store old fp in ghost frame 
773:    LDC  3,211(6) 	Load constant 
774:     ST  3,-8(1) 	Save left side in temp 
775:    LDC  3,100(6) 	Load constant 
776:     LD  4,-8(1) 	Load left from temp into ac1 
777:    DIV  5,4,3 	Op % 
778:    MUL  5,5,3 	 
779:    SUB  3,4,5 	 
780:     ST  3,-8(1) 	Save left side in temp 
781:    LDC  3,3(6) 	Load constant 
782:     LD  4,-8(1) 	Load left from temp into ac1 
783:    DIV  5,4,3 	Op % 
784:    MUL  5,5,3 	 
785:    SUB  3,4,5 	 
786:     ST  3,-8(1) 	Store parameter 
787:    LDA  1,-6(1) 	Load address of new frame 
788:    LDA  3,1(7) 	Return address in ac 
789:    LDA  7,-779(7) 	call output
790:    LDA  3,0(2) 	Save the result in ac 
* 101
791:     ST  1,-6(1) 	Store old fp in ghost frame 
792:    LDA  1,-6(1) 	Load address of new frame 
793:    LDA  3,1(7) 	Return address in ac 
794:    LDA  7,-765(7) 	call outnl
795:    LDA  3,0(2) 	Save the result in ac 
* 103
796:     ST  1,-6(1) 	Store old fp in ghost frame 
797:    LDC  3,43(6) 	Load constant 
798:     ST  3,-4(1) 	Store variable c
799:     ST  3,-3(1) 	Store variable b
800:     ST  3,-2(1) 	Store variable a
801:     ST  3,-8(1) 	Store parameter 
802:    LDA  1,-6(1) 	Load address of new frame 
803:    LDA  3,1(7) 	Return address in ac 
804:    LDA  7,-794(7) 	call output
805:    LDA  3,0(2) 	Save the result in ac 
* 104
806:     ST  1,-6(1) 	Store old fp in ghost frame 
807:     LD  3,-2(1) 	Load variable a
808:     ST  3,-8(1) 	Store parameter 
809:    LDA  1,-6(1) 	Load address of new frame 
810:    LDA  3,1(7) 	Return address in ac 
811:    LDA  7,-801(7) 	call output
812:    LDA  3,0(2) 	Save the result in ac 
* 105
813:    LDC  3,3(6) 	Load constant 
814:     ST  3,-3(1) 	Store variable b
815:     ST  3,-6(1) 	Save left side in temp 
816:    LDC  3,4(6) 	Load constant 
817:     ST  3,-4(1) 	Store variable c
818:     LD  4,-6(1) 	Load left from temp into ac1 
819:    MUL  3,4,3 	Op * 
820:     ST  3,-2(1) 	Store variable a
* 106
821:     ST  1,-6(1) 	Store old fp in ghost frame 
822:     LD  3,-2(1) 	Load variable a
823:     ST  3,-8(1) 	Store parameter 
824:    LDA  1,-6(1) 	Load address of new frame 
825:    LDA  3,1(7) 	Return address in ac 
826:    LDA  7,-816(7) 	call output
827:    LDA  3,0(2) 	Save the result in ac 
* 107
828:     ST  1,-6(1) 	Store old fp in ghost frame 
829:    LDA  1,-6(1) 	Load address of new frame 
830:    LDA  3,1(7) 	Return address in ac 
831:    LDA  7,-802(7) 	call outnl
832:    LDA  3,0(2) 	Save the result in ac 
* 109
833:    LDC  3,44(6) 	Load constant 
834:     ST  3,-2(1) 	Store variable a
* 110
835:    LDC  3,2(6) 	Load constant 
836:     ST  3,-3(1) 	Store variable b
* 111
837:     ST  1,-6(1) 	Store old fp in ghost frame 
838:     LD  3,-2(1) 	Load variable a
839:     ST  3,-8(1) 	Save left side in temp 
840:     LD  3,-3(1) 	Load variable b
841:     LD  4,-8(1) 	Load left from temp into ac1 
842:    ADD  3,4,3 	Op + 
843:     ST  3,-2(1) 	Store variable a
844:     ST  3,-8(1) 	Store parameter 
845:    LDA  1,-6(1) 	Load address of new frame 
846:    LDA  3,1(7) 	Return address in ac 
847:    LDA  7,-837(7) 	call output
848:    LDA  3,0(2) 	Save the result in ac 
* 112
849:     ST  1,-6(1) 	Store old fp in ghost frame 
850:     LD  3,-2(1) 	Load variable a
851:     ST  3,-8(1) 	Save left side in temp 
852:     LD  3,-3(1) 	Load variable b
853:     LD  4,-8(1) 	Load left from temp into ac1 
854:    SUB  3,4,3 	Op - 
855:     ST  3,-2(1) 	Store variable a
856:     ST  3,-8(1) 	Store parameter 
857:    LDA  1,-6(1) 	Load address of new frame 
858:    LDA  3,1(7) 	Return address in ac 
859:    LDA  7,-849(7) 	call output
860:    LDA  3,0(2) 	Save the result in ac 
* 113
861:     ST  1,-6(1) 	Store old fp in ghost frame 
862:     LD  3,-2(1) 	Load variable a
863:     ST  3,-8(1) 	Save left side in temp 
864:     LD  3,-2(1) 	Load variable a
865:     LD  4,-8(1) 	Load left from temp into ac1 
866:    SUB  3,4,3 	Op - 
867:     ST  3,-2(1) 	Store variable a
868:     ST  3,-8(1) 	Store parameter 
869:    LDA  1,-6(1) 	Load address of new frame 
870:    LDA  3,1(7) 	Return address in ac 
871:    LDA  7,-861(7) 	call output
872:    LDA  3,0(2) 	Save the result in ac 
* 114
873:     ST  1,-6(1) 	Store old fp in ghost frame 
874:     LD  3,-3(1) 	Load variable b
875:     ST  3,-8(1) 	Save left side in temp 
876:    LDC  3,10(6) 	Load constant 
877:     LD  4,-8(1) 	Load left from temp into ac1 
878:    ADD  3,4,3 	Op + 
879:     ST  3,-2(1) 	Store variable a
880:     ST  3,-2(1) 	Store variable a
881:     ST  3,-8(1) 	Store parameter 
882:    LDA  1,-6(1) 	Load address of new frame 
883:    LDA  3,1(7) 	Return address in ac 
884:    LDA  7,-874(7) 	call output
885:    LDA  3,0(2) 	Save the result in ac 
* 115
886:     ST  1,-6(1) 	Store old fp in ghost frame 
887:    LDA  1,-6(1) 	Load address of new frame 
888:    LDA  3,1(7) 	Return address in ac 
889:    LDA  7,-860(7) 	call outnl
890:    LDA  3,0(2) 	Save the result in ac 
* 117
891:     ST  1,-6(1) 	Store old fp in ghost frame 
892:    LDC  3,3(6) 	Load constant 
893:     ST  3,-8(1) 	Save left side in temp 
894:    LDC  3,4(6) 	Load constant 
895:     LD  4,-8(1) 	Load left from temp into ac1 
896:    SUB  3,4,3 	Op - 
897:     ST  3,-8(1) 	Save left side in temp 
898:    LDC  3,5(6) 	Load constant 
899:     LD  4,-8(1) 	Load left from temp into ac1 
900:    SUB  3,4,3 	Op - 
901:     ST  3,-8(1) 	Store parameter 
902:    LDA  1,-6(1) 	Load address of new frame 
903:    LDA  3,1(7) 	Return address in ac 
904:    LDA  7,-894(7) 	call output
905:    LDA  3,0(2) 	Save the result in ac 
* 118
906:     ST  1,-6(1) 	Store old fp in ghost frame 
907:    LDC  3,211(6) 	Load constant 
908:     ST  3,-8(1) 	Save left side in temp 
909:    LDC  3,17(6) 	Load constant 
910:     LD  4,-8(1) 	Load left from temp into ac1 
911:    DIV  3,4,3 	Op / 
912:     ST  3,-8(1) 	Save left side in temp 
913:    LDC  3,5(6) 	Load constant 
914:     LD  4,-8(1) 	Load left from temp into ac1 
915:    DIV  3,4,3 	Op / 
916:     ST  3,-8(1) 	Store parameter 
917:    LDA  1,-6(1) 	Load address of new frame 
918:    LDA  3,1(7) 	Return address in ac 
919:    LDA  7,-909(7) 	call output
920:    LDA  3,0(2) 	Save the result in ac 
* 119
921:     ST  1,-6(1) 	Store old fp in ghost frame 
922:    LDC  3,211(6) 	Load constant 
923:     ST  3,-8(1) 	Save left side in temp 
924:    LDC  3,17(6) 	Load constant 
925:     ST  3,-9(1) 	Save left side in temp 
926:    LDC  3,5(6) 	Load constant 
927:     LD  4,-9(1) 	Load left from temp into ac1 
928:    DIV  3,4,3 	Op / 
929:     LD  4,-8(1) 	Load left from temp into ac1 
930:    DIV  3,4,3 	Op / 
931:     ST  3,-8(1) 	Store parameter 
932:    LDA  1,-6(1) 	Load address of new frame 
933:    LDA  3,1(7) 	Return address in ac 
934:    LDA  7,-924(7) 	call output
935:    LDA  3,0(2) 	Save the result in ac 
* 120
936:     ST  1,-6(1) 	Store old fp in ghost frame 
937:    LDC  3,1(6) 	Load constant 
938:     ST  3,-8(1) 	Save left side in temp 
939:    LDC  3,0(6) 	Load constant 
940:     LD  4,-8(1) 	Load left from temp into ac1 
941:    ADD  3,4,3 	Op || 
942:    JEQ  3,1(7) 	Jump if false 
943:    LDC  3,1(6) 	True case 
944:     ST  3,-8(1) 	Save left side in temp 
945:    LDC  3,0(6) 	Load constant 
946:     LD  4,-8(1) 	Load left from temp into ac1 
947:    JEQ  3,3(7) 	Jump if false for Op && 
948:    LDC  3,0(6) 	False case 
949:    JEQ  4,1(7) 	Jump if false 
950:    LDC  3,1(6) 	True case 
951:     ST  3,-8(1) 	Store parameter 
952:    LDA  1,-6(1) 	Load address of new frame 
953:    LDA  3,1(7) 	Return address in ac 
954:    LDA  7,-932(7) 	call outputb
955:    LDA  3,0(2) 	Save the result in ac 
* 121
956:     ST  1,-6(1) 	Store old fp in ghost frame 
957:    LDC  3,1(6) 	Load constant 
958:     ST  3,-8(1) 	Save left side in temp 
959:    LDC  3,0(6) 	Load constant 
960:     LD  4,-8(1) 	Load left from temp into ac1 
961:    ADD  3,4,3 	Op || 
962:    JEQ  3,1(7) 	Jump if false 
963:    LDC  3,1(6) 	True case 
964:     ST  3,-8(1) 	Save left side in temp 
965:    LDC  3,0(6) 	Load constant 
966:     LD  4,-8(1) 	Load left from temp into ac1 
967:    JEQ  3,3(7) 	Jump if false for Op && 
968:    LDC  3,0(6) 	False case 
969:    JEQ  4,1(7) 	Jump if false 
970:    LDC  3,1(6) 	True case 
971:     ST  3,-8(1) 	Store parameter 
972:    LDA  1,-6(1) 	Load address of new frame 
973:    LDA  3,1(7) 	Return address in ac 
974:    LDA  7,-952(7) 	call outputb
975:    LDA  3,0(2) 	Save the result in ac 
* 122
976:     ST  1,-6(1) 	Store old fp in ghost frame 
977:    LDC  3,1(6) 	Load constant 
978:     ST  3,-8(1) 	Save left side in temp 
979:    LDC  3,0(6) 	Load constant 
980:     ST  3,-9(1) 	Save left side in temp 
981:    LDC  3,0(6) 	Load constant 
982:     LD  4,-9(1) 	Load left from temp into ac1 
983:    JEQ  3,3(7) 	Jump if false for Op && 
984:    LDC  3,0(6) 	False case 
985:    JEQ  4,1(7) 	Jump if false 
986:    LDC  3,1(6) 	True case 
987:     LD  4,-8(1) 	Load left from temp into ac1 
988:    ADD  3,4,3 	Op || 
989:    JEQ  3,1(7) 	Jump if false 
990:    LDC  3,1(6) 	True case 
991:     ST  3,-8(1) 	Store parameter 
992:    LDA  1,-6(1) 	Load address of new frame 
993:    LDA  3,1(7) 	Return address in ac 
994:    LDA  7,-972(7) 	call outputb
995:    LDA  3,0(2) 	Save the result in ac 
* 123
996:     ST  1,-6(1) 	Store old fp in ghost frame 
997:    LDA  1,-6(1) 	Load address of new frame 
998:    LDA  3,1(7) 	Return address in ac 
999:    LDA  7,-970(7) 	call outnl
1000:    LDA  3,0(2) 	Save the result in ac 
* RETURN
1001:    LDA  2,0(3) 	Copy result to rt register 
1002:     LD  3,-1(1) 	Load return address 
1003:     LD  1,0(1) 	Adjust fp 
1004:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
1005:    LDC  2,0(6) 	Set return value to 0 
1006:     LD  3,-1(1) 	Load return address 
1007:     LD  1,0(1) 	Adjust fp 
1008:    LDA  7,0(3) 	Return 
* END of function main
