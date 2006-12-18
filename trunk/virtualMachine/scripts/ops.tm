* C- compiler version 1.0
* Author: Robert B. Heckendorn
* Apr 13, 2004
* BEGIN Prolog
  0:     LD  0,0(0) 	set the global pointer 
  1:    LDA  1,-12(0) 	set first frame at end of globals 
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
* BEGIN function main
  4:    LDA  7,25(7) 	Jump to main 
 30:     ST  3,-1(1) 	Store return address to caller 
* BEGIN
* 
 31:    LDC  3,50(6) 	Load constant 
 32:     ST  3,-5(1) 	Save assign value 
 33:    LDC  3,0(6) 	Load constant 
 34:     ST  3,-6(1) 	Save index 
 35:     LD  5,-6(1) 	Load index 
 36:     LD  4,-5(1) 	Load value 
 37:    LDA  3,-1(0) 	Load address of base of array y
 38:    SUB  3,3,5 	Compute offset of value 
 39:     ST  4,0(3) 	Store the value 
 40:    LDA  3,0(4) 	Adjust ac 
* 
 41:    LDC  3,1(6) 	Load constant 
 42:     ST  3,-5(1) 	Save assign value 
 43:    LDC  3,5(6) 	Load constant 
 44:     ST  3,-6(1) 	Save index 
 45:     LD  5,-6(1) 	Load index 
 46:     LD  4,-5(1) 	Load value 
 47:    LDA  3,-1(0) 	Load address of base of array y
 48:    SUB  3,3,5 	Compute offset of value 
 49:     ST  4,0(3) 	Store the value 
 50:    LDA  3,0(4) 	Adjust ac 
* 
 51:    LDC  3,2(6) 	Load constant 
 52:     ST  3,-5(1) 	Save assign value 
 53:    LDC  3,8(6) 	Load constant 
 54:     ST  3,-6(1) 	Save index 
 55:     LD  5,-6(1) 	Load index 
 56:     LD  4,-5(1) 	Load value 
 57:    LDA  3,-1(0) 	Load address of base of array y
 58:    SUB  3,3,5 	Compute offset of value 
 59:     ST  4,0(3) 	Store the value 
 60:    LDA  3,0(4) 	Adjust ac 
* 
 61:    LDC  3,0(6) 	Load constant 
 62:     ST  3,0(0) 	Store variable x
* 
 63:    LDC  3,1(6) 	Load constant 
 64:     ST  3,-11(0) 	Store variable z
* 
 65:    LDC  3,50(6) 	Load constant 
 66:     ST  3,-2(1) 	Store variable a
* 
 67:    LDC  3,1(6) 	Load constant 
 68:     ST  3,-3(1) 	Store variable b
* 
 69:    LDC  3,8(6) 	Load constant 
 70:     ST  3,-4(1) 	Store variable c
* 
 71:     ST  1,-5(1) 	Store old fp in ghost frame 
 72:     LD  3,-2(1) 	Load variable a
 73:     ST  3,-7(1) 	Save left side 
 74:    LDC  3,1(6) 	Load constant 
 75:     LD  4,-7(1) 	Load left into ac1 
 76:    SUB  3,4,3 	op <= 
 77:    JLE  3,2(7) 	br if true 
 78:    LDC  3,0(6) 	false case 
 79:    LDA  7,1(7) 	unconditional jmp 
 80:    LDC  3,1(6) 	true case 
 81:     ST  3,-7(1) 	Store parameter 
 82:    LDA  1,-5(1) 	Load address of new frame 
 83:    LDA  3,1(7) 	Return address in ac 
 84:    LDA  7,-62(7) 	call outputb
 85:    LDA  3,0(2) 	Save the result in ac 
* 
 86:     ST  1,-5(1) 	Store old fp in ghost frame 
 87:     LD  3,-3(1) 	Load variable b
 88:     ST  3,-7(1) 	Save left side 
 89:    LDC  3,50(6) 	Load constant 
 90:     LD  4,-7(1) 	Load left into ac1 
 91:    SUB  3,4,3 	op <= 
 92:    JLE  3,2(7) 	br if true 
 93:    LDC  3,0(6) 	false case 
 94:    LDA  7,1(7) 	unconditional jmp 
 95:    LDC  3,1(6) 	true case 
 96:     ST  3,-7(1) 	Store parameter 
 97:    LDA  1,-5(1) 	Load address of new frame 
 98:    LDA  3,1(7) 	Return address in ac 
 99:    LDA  7,-77(7) 	call outputb
100:    LDA  3,0(2) 	Save the result in ac 
* 
101:     ST  1,-5(1) 	Store old fp in ghost frame 
102:    LDC  3,50(6) 	Load constant 
103:     ST  3,-7(1) 	Save left side 
104:    LDC  3,50(6) 	Load constant 
105:     LD  4,-7(1) 	Load left into ac1 
106:    SUB  3,4,3 	op <= 
107:    JLE  3,2(7) 	br if true 
108:    LDC  3,0(6) 	false case 
109:    LDA  7,1(7) 	unconditional jmp 
110:    LDC  3,1(6) 	true case 
111:     ST  3,-7(1) 	Store parameter 
112:    LDA  1,-5(1) 	Load address of new frame 
113:    LDA  3,1(7) 	Return address in ac 
114:    LDA  7,-92(7) 	call outputb
115:    LDA  3,0(2) 	Save the result in ac 
* 
116:     ST  1,-5(1) 	Store old fp in ghost frame 
117:    LDC  3,50(6) 	Load constant 
118:     ST  3,-7(1) 	Save left side 
119:    LDC  3,1(6) 	Load constant 
120:     LD  4,-7(1) 	Load left into ac1 
121:    SUB  3,4,3 	op < 
122:    JLT  3,2(7) 	br if true 
123:    LDC  3,0(6) 	false case 
124:    LDA  7,1(7) 	unconditional jmp 
125:    LDC  3,1(6) 	true case 
126:     ST  3,-7(1) 	Store parameter 
127:    LDA  1,-5(1) 	Load address of new frame 
128:    LDA  3,1(7) 	Return address in ac 
129:    LDA  7,-107(7) 	call outputb
130:    LDA  3,0(2) 	Save the result in ac 
* 
131:     ST  1,-5(1) 	Store old fp in ghost frame 
132:     LD  3,-3(1) 	Load variable b
133:     ST  3,-7(1) 	Save left side 
134:     LD  3,-2(1) 	Load variable a
135:     LD  4,-7(1) 	Load left into ac1 
136:    SUB  3,4,3 	op < 
137:    JLT  3,2(7) 	br if true 
138:    LDC  3,0(6) 	false case 
139:    LDA  7,1(7) 	unconditional jmp 
140:    LDC  3,1(6) 	true case 
141:     ST  3,-7(1) 	Store parameter 
142:    LDA  1,-5(1) 	Load address of new frame 
143:    LDA  3,1(7) 	Return address in ac 
144:    LDA  7,-122(7) 	call outputb
145:    LDA  3,0(2) 	Save the result in ac 
* 
146:     ST  1,-5(1) 	Store old fp in ghost frame 
147:     LD  3,-2(1) 	Load variable a
148:     ST  3,-7(1) 	Save left side 
149:     LD  3,-2(1) 	Load variable a
150:     LD  4,-7(1) 	Load left into ac1 
151:    SUB  3,4,3 	op < 
152:    JLT  3,2(7) 	br if true 
153:    LDC  3,0(6) 	false case 
154:    LDA  7,1(7) 	unconditional jmp 
155:    LDC  3,1(6) 	true case 
156:     ST  3,-7(1) 	Store parameter 
157:    LDA  1,-5(1) 	Load address of new frame 
158:    LDA  3,1(7) 	Return address in ac 
159:    LDA  7,-137(7) 	call outputb
160:    LDA  3,0(2) 	Save the result in ac 
* 
161:     ST  1,-5(1) 	Store old fp in ghost frame 
162:    LDC  3,50(6) 	Load constant 
163:     ST  3,-7(1) 	Save left side 
164:    LDC  3,1(6) 	Load constant 
165:     LD  4,-7(1) 	Load left into ac1 
166:    SUB  3,4,3 	op > 
167:    JGT  3,2(7) 	br if true 
168:    LDC  3,0(6) 	false case 
169:    LDA  7,1(7) 	unconditional jmp 
170:    LDC  3,1(6) 	true case 
171:     ST  3,-7(1) 	Store parameter 
172:    LDA  1,-5(1) 	Load address of new frame 
173:    LDA  3,1(7) 	Return address in ac 
174:    LDA  7,-152(7) 	call outputb
175:    LDA  3,0(2) 	Save the result in ac 
* 
176:     ST  1,-5(1) 	Store old fp in ghost frame 
177:    LDC  3,1(6) 	Load constant 
178:     ST  3,-7(1) 	Save left side 
179:    LDC  3,50(6) 	Load constant 
180:     LD  4,-7(1) 	Load left into ac1 
181:    SUB  3,4,3 	op > 
182:    JGT  3,2(7) 	br if true 
183:    LDC  3,0(6) 	false case 
184:    LDA  7,1(7) 	unconditional jmp 
185:    LDC  3,1(6) 	true case 
186:     ST  3,-7(1) 	Store parameter 
187:    LDA  1,-5(1) 	Load address of new frame 
188:    LDA  3,1(7) 	Return address in ac 
189:    LDA  7,-167(7) 	call outputb
190:    LDA  3,0(2) 	Save the result in ac 
* 
191:     ST  1,-5(1) 	Store old fp in ghost frame 
192:    LDC  3,50(6) 	Load constant 
193:     ST  3,-7(1) 	Save left side 
194:    LDC  3,50(6) 	Load constant 
195:     LD  4,-7(1) 	Load left into ac1 
196:    SUB  3,4,3 	op > 
197:    JGT  3,2(7) 	br if true 
198:    LDC  3,0(6) 	false case 
199:    LDA  7,1(7) 	unconditional jmp 
200:    LDC  3,1(6) 	true case 
201:     ST  3,-7(1) 	Store parameter 
202:    LDA  1,-5(1) 	Load address of new frame 
203:    LDA  3,1(7) 	Return address in ac 
204:    LDA  7,-182(7) 	call outputb
205:    LDA  3,0(2) 	Save the result in ac 
* 
206:     ST  1,-5(1) 	Store old fp in ghost frame 
207:    LDC  3,50(6) 	Load constant 
208:     ST  3,-7(1) 	Save left side 
209:    LDC  3,1(6) 	Load constant 
210:     LD  4,-7(1) 	Load left into ac1 
211:    SUB  3,4,3 	op >= 
212:    JGE  3,2(7) 	br if true 
213:    LDC  3,0(6) 	false case 
214:    LDA  7,1(7) 	unconditional jmp 
215:    LDC  3,1(6) 	true case 
216:     ST  3,-7(1) 	Store parameter 
217:    LDA  1,-5(1) 	Load address of new frame 
218:    LDA  3,1(7) 	Return address in ac 
219:    LDA  7,-197(7) 	call outputb
220:    LDA  3,0(2) 	Save the result in ac 
* 
221:     ST  1,-5(1) 	Store old fp in ghost frame 
222:    LDC  3,1(6) 	Load constant 
223:     ST  3,-7(1) 	Save left side 
224:    LDC  3,50(6) 	Load constant 
225:     LD  4,-7(1) 	Load left into ac1 
226:    SUB  3,4,3 	op >= 
227:    JGE  3,2(7) 	br if true 
228:    LDC  3,0(6) 	false case 
229:    LDA  7,1(7) 	unconditional jmp 
230:    LDC  3,1(6) 	true case 
231:     ST  3,-7(1) 	Store parameter 
232:    LDA  1,-5(1) 	Load address of new frame 
233:    LDA  3,1(7) 	Return address in ac 
234:    LDA  7,-212(7) 	call outputb
235:    LDA  3,0(2) 	Save the result in ac 
* 
236:     ST  1,-5(1) 	Store old fp in ghost frame 
237:    LDC  3,50(6) 	Load constant 
238:     ST  3,-7(1) 	Save left side 
239:    LDC  3,50(6) 	Load constant 
240:     LD  4,-7(1) 	Load left into ac1 
241:    SUB  3,4,3 	op >= 
242:    JGE  3,2(7) 	br if true 
243:    LDC  3,0(6) 	false case 
244:    LDA  7,1(7) 	unconditional jmp 
245:    LDC  3,1(6) 	true case 
246:     ST  3,-7(1) 	Store parameter 
247:    LDA  1,-5(1) 	Load address of new frame 
248:    LDA  3,1(7) 	Return address in ac 
249:    LDA  7,-227(7) 	call outputb
250:    LDA  3,0(2) 	Save the result in ac 
* 
251:     ST  1,-5(1) 	Store old fp in ghost frame 
252:    LDC  3,0(6) 	Load constant 
253:     ST  3,-7(1) 	Save index 
254:    LDA  3,-1(0) 	Load address of base of array y
255:     LD  4,-7(1) 	Load index 
256:    SUB  3,3,4 	Compute offset of value 
257:     LD  3,0(3) 	Load the value 
258:     ST  3,-7(1) 	Save left side 
259:     LD  3,-3(1) 	Load variable b
260:     LD  4,-7(1) 	Load left into ac1 
261:    SUB  3,4,3 	op == 
262:    JEQ  3,2(7) 	br if true 
263:    LDC  3,0(6) 	false case 
264:    LDA  7,1(7) 	unconditional jmp 
265:    LDC  3,1(6) 	true case 
266:     ST  3,-7(1) 	Store parameter 
267:    LDA  1,-5(1) 	Load address of new frame 
268:    LDA  3,1(7) 	Return address in ac 
269:    LDA  7,-247(7) 	call outputb
270:    LDA  3,0(2) 	Save the result in ac 
* 
271:     ST  1,-5(1) 	Store old fp in ghost frame 
272:     LD  3,-2(1) 	Load variable a
273:     ST  3,-7(1) 	Save left side 
274:     LD  3,-3(1) 	Load variable b
275:     LD  4,-7(1) 	Load left into ac1 
276:    SUB  3,4,3 	op == 
277:    JEQ  3,2(7) 	br if true 
278:    LDC  3,0(6) 	false case 
279:    LDA  7,1(7) 	unconditional jmp 
280:    LDC  3,1(6) 	true case 
281:     ST  3,-7(1) 	Store parameter 
282:    LDA  1,-5(1) 	Load address of new frame 
283:    LDA  3,1(7) 	Return address in ac 
284:    LDA  7,-262(7) 	call outputb
285:    LDA  3,0(2) 	Save the result in ac 
* 
286:     ST  1,-5(1) 	Store old fp in ghost frame 
287:     LD  3,-3(1) 	Load variable b
288:     ST  3,-7(1) 	Save left side 
289:     LD  3,-3(1) 	Load variable b
290:     LD  4,-7(1) 	Load left into ac1 
291:    SUB  3,4,3 	op == 
292:    JEQ  3,2(7) 	br if true 
293:    LDC  3,0(6) 	false case 
294:    LDA  7,1(7) 	unconditional jmp 
295:    LDC  3,1(6) 	true case 
296:     ST  3,-7(1) 	Store parameter 
297:    LDA  1,-5(1) 	Load address of new frame 
298:    LDA  3,1(7) 	Return address in ac 
299:    LDA  7,-277(7) 	call outputb
300:    LDA  3,0(2) 	Save the result in ac 
* 
301:     ST  1,-5(1) 	Store old fp in ghost frame 
302:    LDC  3,0(6) 	Load constant 
303:     ST  3,-7(1) 	Save index 
304:    LDA  3,-1(0) 	Load address of base of array y
305:     LD  4,-7(1) 	Load index 
306:    SUB  3,3,4 	Compute offset of value 
307:     LD  3,0(3) 	Load the value 
308:     ST  3,-7(1) 	Save left side 
309:     LD  3,-2(1) 	Load variable a
310:     LD  4,-7(1) 	Load left into ac1 
311:    SUB  3,4,3 	op != 
312:    JEQ  3,1(7) 	br if true 
313:    LDC  3,1(6) 	true case 
314:     ST  3,-7(1) 	Store parameter 
315:    LDA  1,-5(1) 	Load address of new frame 
316:    LDA  3,1(7) 	Return address in ac 
317:    LDA  7,-295(7) 	call outputb
318:    LDA  3,0(2) 	Save the result in ac 
* 
319:     ST  1,-5(1) 	Store old fp in ghost frame 
320:    LDC  3,0(6) 	Load constant 
321:     ST  3,-7(1) 	Save index 
322:    LDA  3,-1(0) 	Load address of base of array y
323:     LD  4,-7(1) 	Load index 
324:    SUB  3,3,4 	Compute offset of value 
325:     LD  3,0(3) 	Load the value 
326:     ST  3,-7(1) 	Save left side 
327:     LD  3,-3(1) 	Load variable b
328:     LD  4,-7(1) 	Load left into ac1 
329:    SUB  3,4,3 	op != 
330:    JEQ  3,1(7) 	br if true 
331:    LDC  3,1(6) 	true case 
332:     ST  3,-7(1) 	Store parameter 
333:    LDA  1,-5(1) 	Load address of new frame 
334:    LDA  3,1(7) 	Return address in ac 
335:    LDA  7,-313(7) 	call outputb
336:    LDA  3,0(2) 	Save the result in ac 
* 
337:     ST  1,-5(1) 	Store old fp in ghost frame 
338:     LD  3,-2(1) 	Load variable a
339:     ST  3,-7(1) 	Save left side 
340:     LD  3,-3(1) 	Load variable b
341:     LD  4,-7(1) 	Load left into ac1 
342:    SUB  3,4,3 	op != 
343:    JEQ  3,1(7) 	br if true 
344:    LDC  3,1(6) 	true case 
345:     ST  3,-7(1) 	Store parameter 
346:    LDA  1,-5(1) 	Load address of new frame 
347:    LDA  3,1(7) 	Return address in ac 
348:    LDA  7,-326(7) 	call outputb
349:    LDA  3,0(2) 	Save the result in ac 
* 
350:     ST  1,-5(1) 	Store old fp in ghost frame 
351:     LD  3,-3(1) 	Load variable b
352:     ST  3,-7(1) 	Save left side 
353:     LD  3,-3(1) 	Load variable b
354:     LD  4,-7(1) 	Load left into ac1 
355:    SUB  3,4,3 	op != 
356:    JEQ  3,1(7) 	br if true 
357:    LDC  3,1(6) 	true case 
358:     ST  3,-7(1) 	Store parameter 
359:    LDA  1,-5(1) 	Load address of new frame 
360:    LDA  3,1(7) 	Return address in ac 
361:    LDA  7,-339(7) 	call outputb
362:    LDA  3,0(2) 	Save the result in ac 
* 
363:     ST  1,-5(1) 	Store old fp in ghost frame 
364:    LDC  3,1(6) 	Load constant 
365:     ST  3,-7(1) 	Save left side 
366:    LDC  3,1(6) 	Load constant 
367:     LD  4,-7(1) 	Load left into ac1 
368:    LDC  5,1(6) 	op && 
369:    SUB  6,4,5 	 
370:    JLT  6,4(7) 	jump if false 
371:    SUB  6,3,5 	 
372:    JLT  6,2(7) 	jump if false 
373:    LDC  3,1(6) 	true case 
374:    LDA  7,1(7) 	unconditional jmp 
375:    LDC  3,0(6) 	false case 
376:     ST  3,-7(1) 	Store parameter 
377:    LDA  1,-5(1) 	Load address of new frame 
378:    LDA  3,1(7) 	Return address in ac 
379:    LDA  7,-357(7) 	call outputb
380:    LDA  3,0(2) 	Save the result in ac 
* 
381:     ST  1,-5(1) 	Store old fp in ghost frame 
382:    LDC  3,1(6) 	Load constant 
383:     ST  3,-7(1) 	Save left side 
384:    LDC  3,0(6) 	Load constant 
385:     LD  4,-7(1) 	Load left into ac1 
386:    LDC  5,1(6) 	op && 
387:    SUB  6,4,5 	 
388:    JLT  6,4(7) 	jump if false 
389:    SUB  6,3,5 	 
390:    JLT  6,2(7) 	jump if false 
391:    LDC  3,1(6) 	true case 
392:    LDA  7,1(7) 	unconditional jmp 
393:    LDC  3,0(6) 	false case 
394:     ST  3,-7(1) 	Store parameter 
395:    LDA  1,-5(1) 	Load address of new frame 
396:    LDA  3,1(7) 	Return address in ac 
397:    LDA  7,-375(7) 	call outputb
398:    LDA  3,0(2) 	Save the result in ac 
* 
399:     ST  1,-5(1) 	Store old fp in ghost frame 
400:    LDC  3,0(6) 	Load constant 
401:     ST  3,-7(1) 	Save left side 
402:    LDC  3,1(6) 	Load constant 
403:     LD  4,-7(1) 	Load left into ac1 
404:    LDC  5,1(6) 	op && 
405:    SUB  6,4,5 	 
406:    JLT  6,4(7) 	jump if false 
407:    SUB  6,3,5 	 
408:    JLT  6,2(7) 	jump if false 
409:    LDC  3,1(6) 	true case 
410:    LDA  7,1(7) 	unconditional jmp 
411:    LDC  3,0(6) 	false case 
412:     ST  3,-7(1) 	Store parameter 
413:    LDA  1,-5(1) 	Load address of new frame 
414:    LDA  3,1(7) 	Return address in ac 
415:    LDA  7,-393(7) 	call outputb
416:    LDA  3,0(2) 	Save the result in ac 
* 
417:     ST  1,-5(1) 	Store old fp in ghost frame 
418:    LDC  3,0(6) 	Load constant 
419:     ST  3,-7(1) 	Save left side 
420:    LDC  3,0(6) 	Load constant 
421:     LD  4,-7(1) 	Load left into ac1 
422:    LDC  5,1(6) 	op && 
423:    SUB  6,4,5 	 
424:    JLT  6,4(7) 	jump if false 
425:    SUB  6,3,5 	 
426:    JLT  6,2(7) 	jump if false 
427:    LDC  3,1(6) 	true case 
428:    LDA  7,1(7) 	unconditional jmp 
429:    LDC  3,0(6) 	false case 
430:     ST  3,-7(1) 	Store parameter 
431:    LDA  1,-5(1) 	Load address of new frame 
432:    LDA  3,1(7) 	Return address in ac 
433:    LDA  7,-411(7) 	call outputb
434:    LDA  3,0(2) 	Save the result in ac 
* 
435:     ST  1,-5(1) 	Store old fp in ghost frame 
436:    LDC  3,1(6) 	Load constant 
437:     ST  3,-7(1) 	Save left side 
438:    LDC  3,1(6) 	Load constant 
439:     LD  4,-7(1) 	Load left into ac1 
440:    LDC  5,1(6) 	op && 
441:    SUB  6,4,5 	 
442:    JGE  6,4(7) 	jump if false 
443:    SUB  6,3,5 	 
444:    JGE  6,2(7) 	jump if false 
445:    LDC  3,0(6) 	false case 
446:    LDA  7,1(7) 	unconditional jmp 
447:    LDC  3,1(6) 	true case 
448:     ST  3,-7(1) 	Store parameter 
449:    LDA  1,-5(1) 	Load address of new frame 
450:    LDA  3,1(7) 	Return address in ac 
451:    LDA  7,-429(7) 	call outputb
452:    LDA  3,0(2) 	Save the result in ac 
* 
453:     ST  1,-5(1) 	Store old fp in ghost frame 
454:     LD  3,-11(0) 	Load variable z
455:     ST  3,-7(1) 	Save left side 
456:    LDC  3,0(6) 	Load constant 
457:     LD  4,-7(1) 	Load left into ac1 
458:    LDC  5,1(6) 	op && 
459:    SUB  6,4,5 	 
460:    JGE  6,4(7) 	jump if false 
461:    SUB  6,3,5 	 
462:    JGE  6,2(7) 	jump if false 
463:    LDC  3,0(6) 	false case 
464:    LDA  7,1(7) 	unconditional jmp 
465:    LDC  3,1(6) 	true case 
466:     ST  3,-7(1) 	Store parameter 
467:    LDA  1,-5(1) 	Load address of new frame 
468:    LDA  3,1(7) 	Return address in ac 
469:    LDA  7,-447(7) 	call outputb
470:    LDA  3,0(2) 	Save the result in ac 
* 
471:     ST  1,-5(1) 	Store old fp in ghost frame 
472:    LDC  3,0(6) 	Load constant 
473:     ST  3,-7(1) 	Save left side 
474:    LDC  3,1(6) 	Load constant 
475:     LD  4,-7(1) 	Load left into ac1 
476:    LDC  5,1(6) 	op && 
477:    SUB  6,4,5 	 
478:    JGE  6,4(7) 	jump if false 
479:    SUB  6,3,5 	 
480:    JGE  6,2(7) 	jump if false 
481:    LDC  3,0(6) 	false case 
482:    LDA  7,1(7) 	unconditional jmp 
483:    LDC  3,1(6) 	true case 
484:     ST  3,-7(1) 	Store parameter 
485:    LDA  1,-5(1) 	Load address of new frame 
486:    LDA  3,1(7) 	Return address in ac 
487:    LDA  7,-465(7) 	call outputb
488:    LDA  3,0(2) 	Save the result in ac 
* 
489:     ST  1,-5(1) 	Store old fp in ghost frame 
490:    LDC  3,0(6) 	Load constant 
491:     ST  3,-7(1) 	Save left side 
492:    LDC  3,0(6) 	Load constant 
493:     LD  4,-7(1) 	Load left into ac1 
494:    LDC  5,1(6) 	op && 
495:    SUB  6,4,5 	 
496:    JGE  6,4(7) 	jump if false 
497:    SUB  6,3,5 	 
498:    JGE  6,2(7) 	jump if false 
499:    LDC  3,0(6) 	false case 
500:    LDA  7,1(7) 	unconditional jmp 
501:    LDC  3,1(6) 	true case 
502:     ST  3,-7(1) 	Store parameter 
503:    LDA  1,-5(1) 	Load address of new frame 
504:    LDA  3,1(7) 	Return address in ac 
505:    LDA  7,-483(7) 	call outputb
506:    LDA  3,0(2) 	Save the result in ac 
* 
507:     ST  1,-5(1) 	Store old fp in ghost frame 
508:    LDC  3,1(6) 	Load constant 
509:    LDC  4,1(6) 	Load 1 
510:    SUB  3,4,3 	op - 
511:     ST  3,-7(1) 	Store parameter 
512:    LDA  1,-5(1) 	Load address of new frame 
513:    LDA  3,1(7) 	Return address in ac 
514:    LDA  7,-492(7) 	call outputb
515:    LDA  3,0(2) 	Save the result in ac 
* 
516:     ST  1,-5(1) 	Store old fp in ghost frame 
517:     LD  3,0(0) 	Load variable x
518:    LDC  4,1(6) 	Load 1 
519:    SUB  3,4,3 	op - 
520:     ST  3,-7(1) 	Store parameter 
521:    LDA  1,-5(1) 	Load address of new frame 
522:    LDA  3,1(7) 	Return address in ac 
523:    LDA  7,-501(7) 	call outputb
524:    LDA  3,0(2) 	Save the result in ac 
* 
525:     ST  1,-5(1) 	Store old fp in ghost frame 
526:    LDC  3,5(6) 	Load constant 
527:     ST  3,-7(1) 	Save left side 
528:    LDC  3,50(6) 	Load constant 
529:     LD  4,-7(1) 	Load left into ac1 
530:    ADD  3,4,3 	op + 
531:     ST  3,-7(1) 	Store parameter 
532:    LDA  1,-5(1) 	Load address of new frame 
533:    LDA  3,1(7) 	Return address in ac 
534:    LDA  7,-524(7) 	call output
535:    LDA  3,0(2) 	Save the result in ac 
* 
536:     ST  1,-5(1) 	Store old fp in ghost frame 
537:     LD  3,-4(1) 	Load variable c
538:     ST  3,-7(1) 	Save index 
539:    LDA  3,-1(0) 	Load address of base of array y
540:     LD  4,-7(1) 	Load index 
541:    SUB  3,3,4 	Compute offset of value 
542:     LD  3,0(3) 	Load the value 
543:     ST  3,-7(1) 	Save left side 
544:    LDC  3,50(6) 	Load constant 
545:     LD  4,-7(1) 	Load left into ac1 
546:    ADD  3,4,3 	op + 
547:     ST  3,-7(1) 	Store parameter 
548:    LDA  1,-5(1) 	Load address of new frame 
549:    LDA  3,1(7) 	Return address in ac 
550:    LDA  7,-540(7) 	call output
551:    LDA  3,0(2) 	Save the result in ac 
* 
552:     ST  1,-5(1) 	Store old fp in ghost frame 
553:    LDC  3,5(6) 	Load constant 
554:     ST  3,-7(1) 	Save left side 
555:    LDC  3,50(6) 	Load constant 
556:     LD  4,-7(1) 	Load left into ac1 
557:    SUB  3,4,3 	op - 
558:     ST  3,-7(1) 	Store parameter 
559:    LDA  1,-5(1) 	Load address of new frame 
560:    LDA  3,1(7) 	Return address in ac 
561:    LDA  7,-551(7) 	call output
562:    LDA  3,0(2) 	Save the result in ac 
* 
563:     ST  1,-5(1) 	Store old fp in ghost frame 
564:    LDC  3,30(6) 	Load constant 
565:     ST  3,-7(1) 	Save left side 
566:    LDC  3,5(6) 	Load constant 
567:     LD  4,-7(1) 	Load left into ac1 
568:    SUB  3,4,3 	op - 
569:     ST  3,-7(1) 	Save left side 
570:    LDC  3,50(6) 	Load constant 
571:     LD  4,-7(1) 	Load left into ac1 
572:    SUB  3,4,3 	op - 
573:     ST  3,-7(1) 	Store parameter 
574:    LDA  1,-5(1) 	Load address of new frame 
575:    LDA  3,1(7) 	Return address in ac 
576:    LDA  7,-566(7) 	call output
577:    LDA  3,0(2) 	Save the result in ac 
* 
578:     ST  1,-5(1) 	Store old fp in ghost frame 
579:     LD  3,-2(1) 	Load variable a
580:    LDC  4,0(6) 	Load 0 
581:    SUB  3,4,3 	op - 
582:     ST  3,-7(1) 	Store parameter 
583:    LDA  1,-5(1) 	Load address of new frame 
584:    LDA  3,1(7) 	Return address in ac 
585:    LDA  7,-575(7) 	call output
586:    LDA  3,0(2) 	Save the result in ac 
* 
587:     ST  1,-5(1) 	Store old fp in ghost frame 
588:    LDC  3,0(6) 	Load constant 
589:    LDC  4,0(6) 	Load 0 
590:    SUB  3,4,3 	op - 
591:     ST  3,-7(1) 	Store parameter 
592:    LDA  1,-5(1) 	Load address of new frame 
593:    LDA  3,1(7) 	Return address in ac 
594:    LDA  7,-584(7) 	call output
595:    LDA  3,0(2) 	Save the result in ac 
* 
596:     ST  1,-5(1) 	Store old fp in ghost frame 
597:    LDC  3,1(6) 	Load constant 
598:    LDC  4,0(6) 	Load 0 
599:    SUB  3,4,3 	op - 
600:     ST  3,-7(1) 	Store parameter 
601:    LDA  1,-5(1) 	Load address of new frame 
602:    LDA  3,1(7) 	Return address in ac 
603:    LDA  7,-593(7) 	call output
604:    LDA  3,0(2) 	Save the result in ac 
* 
605:     ST  1,-5(1) 	Store old fp in ghost frame 
606:    LDC  3,2(6) 	Load constant 
607:     ST  3,-7(1) 	Save left side 
608:    LDC  3,3(6) 	Load constant 
609:     LD  4,-7(1) 	Load left into ac1 
610:    MUL  3,4,3 	op * 
611:     ST  3,-7(1) 	Save left side 
612:    LDC  3,5(6) 	Load constant 
613:     LD  4,-7(1) 	Load left into ac1 
614:    MUL  3,4,3 	op * 
615:     ST  3,-7(1) 	Save left side 
616:    LDC  3,7(6) 	Load constant 
617:     LD  4,-7(1) 	Load left into ac1 
618:    MUL  3,4,3 	op * 
619:     ST  3,-7(1) 	Save left side 
620:    LDC  3,11(6) 	Load constant 
621:     LD  4,-7(1) 	Load left into ac1 
622:    MUL  3,4,3 	op * 
623:     ST  3,-7(1) 	Store parameter 
624:    LDA  1,-5(1) 	Load address of new frame 
625:    LDA  3,1(7) 	Return address in ac 
626:    LDA  7,-616(7) 	call output
627:    LDA  3,0(2) 	Save the result in ac 
* 
628:     ST  1,-5(1) 	Store old fp in ghost frame 
629:    LDC  3,50(6) 	Load constant 
630:     ST  3,-7(1) 	Save left side 
631:    LDC  3,8(6) 	Load constant 
632:     ST  3,-8(1) 	Save index 
633:    LDA  3,-1(0) 	Load address of base of array y
634:     LD  4,-8(1) 	Load index 
635:    SUB  3,3,4 	Compute offset of value 
636:     LD  3,0(3) 	Load the value 
637:     LD  4,-7(1) 	Load left into ac1 
638:    MUL  3,4,3 	op * 
639:     ST  3,-7(1) 	Store parameter 
640:    LDA  1,-5(1) 	Load address of new frame 
641:    LDA  3,1(7) 	Return address in ac 
642:    LDA  7,-632(7) 	call output
643:    LDA  3,0(2) 	Save the result in ac 
* 
644:     ST  1,-5(1) 	Store old fp in ghost frame 
645:    LDC  3,8(6) 	Load constant 
646:     ST  3,-7(1) 	Save index 
647:    LDA  3,-1(0) 	Load address of base of array y
648:     LD  4,-7(1) 	Load index 
649:    SUB  3,3,4 	Compute offset of value 
650:     LD  3,0(3) 	Load the value 
651:     ST  3,-7(1) 	Save left side 
652:    LDC  3,50(6) 	Load constant 
653:     LD  4,-7(1) 	Load left into ac1 
654:    MUL  3,4,3 	op * 
655:     ST  3,-7(1) 	Store parameter 
656:    LDA  1,-5(1) 	Load address of new frame 
657:    LDA  3,1(7) 	Return address in ac 
658:    LDA  7,-648(7) 	call output
659:    LDA  3,0(2) 	Save the result in ac 
* 
660:     ST  1,-5(1) 	Store old fp in ghost frame 
661:    LDC  3,50(6) 	Load constant 
662:     ST  3,-7(1) 	Save left side 
663:    LDC  3,8(6) 	Load constant 
664:     ST  3,-8(1) 	Save index 
665:    LDA  3,-1(0) 	Load address of base of array y
666:     LD  4,-8(1) 	Load index 
667:    SUB  3,3,4 	Compute offset of value 
668:     LD  3,0(3) 	Load the value 
669:     LD  4,-7(1) 	Load left into ac1 
670:    DIV  3,4,3 	op / 
671:     ST  3,-7(1) 	Store parameter 
672:    LDA  1,-5(1) 	Load address of new frame 
673:    LDA  3,1(7) 	Return address in ac 
674:    LDA  7,-664(7) 	call output
675:    LDA  3,0(2) 	Save the result in ac 
* 
676:     ST  1,-5(1) 	Store old fp in ghost frame 
677:    LDC  3,8(6) 	Load constant 
678:     ST  3,-7(1) 	Save index 
679:    LDA  3,-1(0) 	Load address of base of array y
680:     LD  4,-7(1) 	Load index 
681:    SUB  3,3,4 	Compute offset of value 
682:     LD  3,0(3) 	Load the value 
683:     ST  3,-7(1) 	Save left side 
684:    LDC  3,50(6) 	Load constant 
685:     LD  4,-7(1) 	Load left into ac1 
686:    DIV  3,4,3 	op / 
687:     ST  3,-7(1) 	Store parameter 
688:    LDA  1,-5(1) 	Load address of new frame 
689:    LDA  3,1(7) 	Return address in ac 
690:    LDA  7,-680(7) 	call output
691:    LDA  3,0(2) 	Save the result in ac 
* 
692:     ST  1,-5(1) 	Store old fp in ghost frame 
693:    LDC  3,8(6) 	Load constant 
694:     ST  3,-7(1) 	Save index 
695:    LDA  3,-1(0) 	Load address of base of array y
696:     LD  4,-7(1) 	Load index 
697:    SUB  3,3,4 	Compute offset of value 
698:     LD  3,0(3) 	Load the value 
699:     ST  3,-7(1) 	Save left side 
700:     LD  3,-3(1) 	Load variable b
701:     LD  4,-7(1) 	Load left into ac1 
702:    DIV  3,4,3 	op / 
703:     ST  3,-7(1) 	Store parameter 
704:    LDA  1,-5(1) 	Load address of new frame 
705:    LDA  3,1(7) 	Return address in ac 
706:    LDA  7,-696(7) 	call output
707:    LDA  3,0(2) 	Save the result in ac 
* 
708:     ST  1,-5(1) 	Store old fp in ghost frame 
709:    LDC  3,210(6) 	Load constant 
710:     ST  3,-7(1) 	Save left side 
711:    LDC  3,7(6) 	Load constant 
712:     LD  4,-7(1) 	Load left into ac1 
713:    DIV  3,4,3 	op / 
714:     ST  3,-7(1) 	Save left side 
715:    LDC  3,3(6) 	Load constant 
716:     LD  4,-7(1) 	Load left into ac1 
717:    DIV  3,4,3 	op / 
718:     ST  3,-7(1) 	Store parameter 
719:    LDA  1,-5(1) 	Load address of new frame 
720:    LDA  3,1(7) 	Return address in ac 
721:    LDA  7,-711(7) 	call output
722:    LDA  3,0(2) 	Save the result in ac 
* 
723:     ST  1,-5(1) 	Store old fp in ghost frame 
724:    LDC  3,211(6) 	Load constant 
725:     ST  3,-7(1) 	Save left side 
726:    LDC  3,7(6) 	Load constant 
727:     LD  4,-7(1) 	Load left into ac1 
728:    DIV  5,4,3 	op % 
729:    MUL  5,5,3 	 
730:    SUB  3,4,5 	 
731:     ST  3,-7(1) 	Store parameter 
732:    LDA  1,-5(1) 	Load address of new frame 
733:    LDA  3,1(7) 	Return address in ac 
734:    LDA  7,-724(7) 	call output
735:    LDA  3,0(2) 	Save the result in ac 
* 
736:     ST  1,-5(1) 	Store old fp in ghost frame 
737:    LDC  3,211(6) 	Load constant 
738:     ST  3,-7(1) 	Save left side 
739:    LDC  3,6(6) 	Load constant 
740:     LD  4,-7(1) 	Load left into ac1 
741:    DIV  5,4,3 	op % 
742:    MUL  5,5,3 	 
743:    SUB  3,4,5 	 
744:     ST  3,-7(1) 	Store parameter 
745:    LDA  1,-5(1) 	Load address of new frame 
746:    LDA  3,1(7) 	Return address in ac 
747:    LDA  7,-737(7) 	call output
748:    LDA  3,0(2) 	Save the result in ac 
* 
749:     ST  1,-5(1) 	Store old fp in ghost frame 
750:    LDC  3,211(6) 	Load constant 
751:     ST  3,-7(1) 	Save left side 
752:    LDC  3,5(6) 	Load constant 
753:     LD  4,-7(1) 	Load left into ac1 
754:    DIV  5,4,3 	op % 
755:    MUL  5,5,3 	 
756:    SUB  3,4,5 	 
757:     ST  3,-7(1) 	Store parameter 
758:    LDA  1,-5(1) 	Load address of new frame 
759:    LDA  3,1(7) 	Return address in ac 
760:    LDA  7,-750(7) 	call output
761:    LDA  3,0(2) 	Save the result in ac 
* 
762:     ST  1,-5(1) 	Store old fp in ghost frame 
763:    LDC  3,211(6) 	Load constant 
764:     ST  3,-7(1) 	Save left side 
765:    LDC  3,4(6) 	Load constant 
766:     LD  4,-7(1) 	Load left into ac1 
767:    DIV  5,4,3 	op % 
768:    MUL  5,5,3 	 
769:    SUB  3,4,5 	 
770:     ST  3,-7(1) 	Store parameter 
771:    LDA  1,-5(1) 	Load address of new frame 
772:    LDA  3,1(7) 	Return address in ac 
773:    LDA  7,-763(7) 	call output
774:    LDA  3,0(2) 	Save the result in ac 
* 
775:     ST  1,-5(1) 	Store old fp in ghost frame 
776:    LDC  3,211(6) 	Load constant 
777:     ST  3,-7(1) 	Save left side 
778:    LDC  3,100(6) 	Load constant 
779:     LD  4,-7(1) 	Load left into ac1 
780:    DIV  5,4,3 	op % 
781:    MUL  5,5,3 	 
782:    SUB  3,4,5 	 
783:     ST  3,-7(1) 	Save left side 
784:    LDC  3,3(6) 	Load constant 
785:     LD  4,-7(1) 	Load left into ac1 
786:    DIV  5,4,3 	op % 
787:    MUL  5,5,3 	 
788:    SUB  3,4,5 	 
789:     ST  3,-7(1) 	Store parameter 
790:    LDA  1,-5(1) 	Load address of new frame 
791:    LDA  3,1(7) 	Return address in ac 
792:    LDA  7,-782(7) 	call output
793:    LDA  3,0(2) 	Save the result in ac 
* 
794:     ST  1,-5(1) 	Store old fp in ghost frame 
795:    LDC  3,43(6) 	Load constant 
796:     ST  3,-4(1) 	Store variable c
797:     ST  3,-3(1) 	Store variable b
798:     ST  3,-2(1) 	Store variable a
799:     ST  3,-7(1) 	Store parameter 
800:    LDA  1,-5(1) 	Load address of new frame 
801:    LDA  3,1(7) 	Return address in ac 
802:    LDA  7,-792(7) 	call output
803:    LDA  3,0(2) 	Save the result in ac 
* 
804:     ST  1,-5(1) 	Store old fp in ghost frame 
805:     LD  3,-2(1) 	Load variable a
806:     ST  3,-7(1) 	Store parameter 
807:    LDA  1,-5(1) 	Load address of new frame 
808:    LDA  3,1(7) 	Return address in ac 
809:    LDA  7,-799(7) 	call output
810:    LDA  3,0(2) 	Save the result in ac 
* 
811:    LDC  3,3(6) 	Load constant 
812:     ST  3,-3(1) 	Store variable b
813:     ST  3,-5(1) 	Save left side 
814:    LDC  3,4(6) 	Load constant 
815:     ST  3,-4(1) 	Store variable c
816:     LD  4,-5(1) 	Load left into ac1 
817:    MUL  3,4,3 	op * 
818:     ST  3,-2(1) 	Store variable a
* 
819:     ST  1,-5(1) 	Store old fp in ghost frame 
820:     LD  3,-2(1) 	Load variable a
821:     ST  3,-7(1) 	Store parameter 
822:    LDA  1,-5(1) 	Load address of new frame 
823:    LDA  3,1(7) 	Return address in ac 
824:    LDA  7,-814(7) 	call output
825:    LDA  3,0(2) 	Save the result in ac 
* END
* Add standard closing in case there is no return statement
826:    LDC  2,0(6) 	Set return value to 0 
827:     LD  3,-1(1) 	Load return address 
828:     LD  1,0(1) 	Adjust fp 
829:    LDA  7,0(3) 	Return 
* END of function main
