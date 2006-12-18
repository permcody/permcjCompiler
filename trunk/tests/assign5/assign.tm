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
* BEGIN function dog
 35:     ST  3,-1(1) 	Store return address. BEGIN FUNC: dog
* BEGIN compound statement
* 9
 36:    LDC  3,777(6) 	Load constant 
 37:     ST  3,-4(1) 	Store variable a
* 10
 38:     ST  1,-16(1) 	Store old fp in ghost frame 
 39:     LD  3,-4(1) 	Load variable a
 40:     ST  3,-18(1) 	Store parameter 
 41:    LDA  1,-16(1) 	Load address of new frame 
 42:    LDA  3,1(7) 	Return address in ac 
 43:    LDA  7,-33(7) 	call output
 44:    LDA  3,0(2) 	Save the result in ac 
* 11
 45:     LD  3,-4(1) 	Load variable a
 46:     ST  3,-16(1) 	Save left side in temp 
 47:    LDC  3,666(6) 	Load constant 
 48:     LD  4,-16(1) 	Load left from temp into ac1 
 49:    ADD  3,4,3 	Op + 
 50:     ST  3,-4(1) 	Store variable a
* 12
 51:     ST  1,-16(1) 	Store old fp in ghost frame 
 52:     LD  3,-4(1) 	Load variable a
 53:     ST  3,-18(1) 	Store parameter 
 54:    LDA  1,-16(1) 	Load address of new frame 
 55:    LDA  3,1(7) 	Return address in ac 
 56:    LDA  7,-46(7) 	call output
 57:    LDA  3,0(2) 	Save the result in ac 
* 13
 58:     LD  3,-4(1) 	Load variable a
 59:     ST  3,-16(1) 	Save left side in temp 
 60:    LDC  3,666(6) 	Load constant 
 61:     LD  4,-16(1) 	Load left from temp into ac1 
 62:    SUB  3,4,3 	Op - 
 63:     ST  3,-4(1) 	Store variable a
* 14
 64:     ST  1,-16(1) 	Store old fp in ghost frame 
 65:     LD  3,-4(1) 	Load variable a
 66:     ST  3,-18(1) 	Store parameter 
 67:    LDA  1,-16(1) 	Load address of new frame 
 68:    LDA  3,1(7) 	Return address in ac 
 69:    LDA  7,-59(7) 	call output
 70:    LDA  3,0(2) 	Save the result in ac 
* 15
 71:     ST  1,-16(1) 	Store old fp in ghost frame 
 72:    LDA  1,-16(1) 	Load address of new frame 
 73:    LDA  3,1(7) 	Return address in ac 
 74:    LDA  7,-45(7) 	call outnl
 75:    LDA  3,0(2) 	Save the result in ac 
* 17
 76:    LDC  3,777(6) 	Load constant 
 77:     ST  3,0(0) 	Store variable g
* 18
 78:     ST  1,-16(1) 	Store old fp in ghost frame 
 79:     LD  3,0(0) 	Load variable g
 80:     ST  3,-18(1) 	Store parameter 
 81:    LDA  1,-16(1) 	Load address of new frame 
 82:    LDA  3,1(7) 	Return address in ac 
 83:    LDA  7,-73(7) 	call output
 84:    LDA  3,0(2) 	Save the result in ac 
* 19
 85:     LD  3,0(0) 	Load variable g
 86:     ST  3,-16(1) 	Save left side in temp 
 87:    LDC  3,666(6) 	Load constant 
 88:     LD  4,-16(1) 	Load left from temp into ac1 
 89:    ADD  3,4,3 	Op + 
 90:     ST  3,0(0) 	Store variable g
* 20
 91:     ST  1,-16(1) 	Store old fp in ghost frame 
 92:     LD  3,0(0) 	Load variable g
 93:     ST  3,-18(1) 	Store parameter 
 94:    LDA  1,-16(1) 	Load address of new frame 
 95:    LDA  3,1(7) 	Return address in ac 
 96:    LDA  7,-86(7) 	call output
 97:    LDA  3,0(2) 	Save the result in ac 
* 21
 98:     LD  3,0(0) 	Load variable g
 99:     ST  3,-16(1) 	Save left side in temp 
100:    LDC  3,666(6) 	Load constant 
101:     LD  4,-16(1) 	Load left from temp into ac1 
102:    SUB  3,4,3 	Op - 
103:     ST  3,0(0) 	Store variable g
* 22
104:     ST  1,-16(1) 	Store old fp in ghost frame 
105:     LD  3,0(0) 	Load variable g
106:     ST  3,-18(1) 	Store parameter 
107:    LDA  1,-16(1) 	Load address of new frame 
108:    LDA  3,1(7) 	Return address in ac 
109:    LDA  7,-99(7) 	call output
110:    LDA  3,0(2) 	Save the result in ac 
* 23
111:     ST  1,-16(1) 	Store old fp in ghost frame 
112:    LDA  1,-16(1) 	Load address of new frame 
113:    LDA  3,1(7) 	Return address in ac 
114:    LDA  7,-85(7) 	call outnl
115:    LDA  3,0(2) 	Save the result in ac 
* 25
116:    LDC  3,777(6) 	Load constant 
117:     ST  3,-2(1) 	Store variable p
* 26
118:     ST  1,-16(1) 	Store old fp in ghost frame 
119:     LD  3,-2(1) 	Load variable p
120:     ST  3,-18(1) 	Store parameter 
121:    LDA  1,-16(1) 	Load address of new frame 
122:    LDA  3,1(7) 	Return address in ac 
123:    LDA  7,-113(7) 	call output
124:    LDA  3,0(2) 	Save the result in ac 
* 27
125:     LD  3,-2(1) 	Load variable p
126:     ST  3,-16(1) 	Save left side in temp 
127:    LDC  3,666(6) 	Load constant 
128:     LD  4,-16(1) 	Load left from temp into ac1 
129:    ADD  3,4,3 	Op + 
130:     ST  3,-2(1) 	Store variable p
* 28
131:     ST  1,-16(1) 	Store old fp in ghost frame 
132:     LD  3,-2(1) 	Load variable p
133:     ST  3,-18(1) 	Store parameter 
134:    LDA  1,-16(1) 	Load address of new frame 
135:    LDA  3,1(7) 	Return address in ac 
136:    LDA  7,-126(7) 	call output
137:    LDA  3,0(2) 	Save the result in ac 
* 29
138:     LD  3,-2(1) 	Load variable p
139:     ST  3,-16(1) 	Save left side in temp 
140:    LDC  3,666(6) 	Load constant 
141:     LD  4,-16(1) 	Load left from temp into ac1 
142:    SUB  3,4,3 	Op - 
143:     ST  3,-2(1) 	Store variable p
* 30
144:     ST  1,-16(1) 	Store old fp in ghost frame 
145:     LD  3,-2(1) 	Load variable p
146:     ST  3,-18(1) 	Store parameter 
147:    LDA  1,-16(1) 	Load address of new frame 
148:    LDA  3,1(7) 	Return address in ac 
149:    LDA  7,-139(7) 	call output
150:    LDA  3,0(2) 	Save the result in ac 
* 31
151:     ST  1,-16(1) 	Store old fp in ghost frame 
152:    LDA  1,-16(1) 	Load address of new frame 
153:    LDA  3,1(7) 	Return address in ac 
154:    LDA  7,-125(7) 	call outnl
155:    LDA  3,0(2) 	Save the result in ac 
* 33
156:    LDC  3,1(6) 	Load constant 
157:     ST  3,-16(1) 	Save index in temp 
158:    LDC  3,777(6) 	Load constant 
159:     LD  4,-16(1) 	load index from temp to ac1 
160:    LDA  5,-5(1) 	Load address of base of array b
161:    SUB  5,5,4 	Compute offset of value 
162:     ST  3,0(5) 	Store variable b
* 34
163:     ST  1,-16(1) 	Store old fp in ghost frame 
164:    LDC  3,1(6) 	Load constant 
165:    LDA  4,-5(1) 	Load address of base of array b
166:    SUB  3,4,3 	Compute offset of value 
167:     LD  3,0(3) 	Load the value 
168:     ST  3,-18(1) 	Store parameter 
169:    LDA  1,-16(1) 	Load address of new frame 
170:    LDA  3,1(7) 	Return address in ac 
171:    LDA  7,-161(7) 	call output
172:    LDA  3,0(2) 	Save the result in ac 
* 35
173:    LDC  3,1(6) 	Load constant 
174:     ST  3,-16(1) 	Save index in temp 
175:    LDC  3,1(6) 	Load constant 
176:    LDA  4,-5(1) 	Load address of base of array b
177:    SUB  3,4,3 	Compute offset of value 
178:     LD  3,0(3) 	Load the value 
179:     ST  3,-17(1) 	Save left side in temp 
180:    LDC  3,666(6) 	Load constant 
181:     LD  4,-17(1) 	Load left from temp into ac1 
182:    ADD  3,4,3 	Op + 
183:     LD  4,-16(1) 	load index from temp to ac1 
184:    LDA  5,-5(1) 	Load address of base of array b
185:    SUB  5,5,4 	Compute offset of value 
186:     ST  3,0(5) 	Store variable b
* 36
187:     ST  1,-16(1) 	Store old fp in ghost frame 
188:    LDC  3,1(6) 	Load constant 
189:    LDA  4,-5(1) 	Load address of base of array b
190:    SUB  3,4,3 	Compute offset of value 
191:     LD  3,0(3) 	Load the value 
192:     ST  3,-18(1) 	Store parameter 
193:    LDA  1,-16(1) 	Load address of new frame 
194:    LDA  3,1(7) 	Return address in ac 
195:    LDA  7,-185(7) 	call output
196:    LDA  3,0(2) 	Save the result in ac 
* 37
197:    LDC  3,1(6) 	Load constant 
198:     ST  3,-16(1) 	Save index in temp 
199:    LDC  3,1(6) 	Load constant 
200:    LDA  4,-5(1) 	Load address of base of array b
201:    SUB  3,4,3 	Compute offset of value 
202:     LD  3,0(3) 	Load the value 
203:     ST  3,-17(1) 	Save left side in temp 
204:    LDC  3,666(6) 	Load constant 
205:     LD  4,-17(1) 	Load left from temp into ac1 
206:    SUB  3,4,3 	Op - 
207:     LD  4,-16(1) 	load index from temp to ac1 
208:    LDA  5,-5(1) 	Load address of base of array b
209:    SUB  5,5,4 	Compute offset of value 
210:     ST  3,0(5) 	Store variable b
* 38
211:     ST  1,-16(1) 	Store old fp in ghost frame 
212:    LDC  3,1(6) 	Load constant 
213:    LDA  4,-5(1) 	Load address of base of array b
214:    SUB  3,4,3 	Compute offset of value 
215:     LD  3,0(3) 	Load the value 
216:     ST  3,-18(1) 	Store parameter 
217:    LDA  1,-16(1) 	Load address of new frame 
218:    LDA  3,1(7) 	Return address in ac 
219:    LDA  7,-209(7) 	call output
220:    LDA  3,0(2) 	Save the result in ac 
* 39
221:     ST  1,-16(1) 	Store old fp in ghost frame 
222:    LDA  1,-16(1) 	Load address of new frame 
223:    LDA  3,1(7) 	Return address in ac 
224:    LDA  7,-195(7) 	call outnl
225:    LDA  3,0(2) 	Save the result in ac 
* 41
226:    LDC  3,1(6) 	Load constant 
227:     ST  3,-16(1) 	Save index in temp 
228:    LDC  3,777(6) 	Load constant 
229:     LD  4,-16(1) 	load index from temp to ac1 
230:    LDA  5,-1(0) 	Load address of base of array h
231:    SUB  5,5,4 	Compute offset of value 
232:     ST  3,0(5) 	Store variable h
* 42
233:     ST  1,-16(1) 	Store old fp in ghost frame 
234:    LDC  3,1(6) 	Load constant 
235:    LDA  4,-1(0) 	Load address of base of array h
236:    SUB  3,4,3 	Compute offset of value 
237:     LD  3,0(3) 	Load the value 
238:     ST  3,-18(1) 	Store parameter 
239:    LDA  1,-16(1) 	Load address of new frame 
240:    LDA  3,1(7) 	Return address in ac 
241:    LDA  7,-231(7) 	call output
242:    LDA  3,0(2) 	Save the result in ac 
* 43
243:    LDC  3,1(6) 	Load constant 
244:     ST  3,-16(1) 	Save index in temp 
245:    LDC  3,1(6) 	Load constant 
246:    LDA  4,-1(0) 	Load address of base of array h
247:    SUB  3,4,3 	Compute offset of value 
248:     LD  3,0(3) 	Load the value 
249:     ST  3,-17(1) 	Save left side in temp 
250:    LDC  3,666(6) 	Load constant 
251:     LD  4,-17(1) 	Load left from temp into ac1 
252:    ADD  3,4,3 	Op + 
253:     LD  4,-16(1) 	load index from temp to ac1 
254:    LDA  5,-1(0) 	Load address of base of array h
255:    SUB  5,5,4 	Compute offset of value 
256:     ST  3,0(5) 	Store variable h
* 44
257:     ST  1,-16(1) 	Store old fp in ghost frame 
258:    LDC  3,1(6) 	Load constant 
259:    LDA  4,-1(0) 	Load address of base of array h
260:    SUB  3,4,3 	Compute offset of value 
261:     LD  3,0(3) 	Load the value 
262:     ST  3,-18(1) 	Store parameter 
263:    LDA  1,-16(1) 	Load address of new frame 
264:    LDA  3,1(7) 	Return address in ac 
265:    LDA  7,-255(7) 	call output
266:    LDA  3,0(2) 	Save the result in ac 
* 45
267:    LDC  3,1(6) 	Load constant 
268:     ST  3,-16(1) 	Save index in temp 
269:    LDC  3,1(6) 	Load constant 
270:    LDA  4,-1(0) 	Load address of base of array h
271:    SUB  3,4,3 	Compute offset of value 
272:     LD  3,0(3) 	Load the value 
273:     ST  3,-17(1) 	Save left side in temp 
274:    LDC  3,666(6) 	Load constant 
275:     LD  4,-17(1) 	Load left from temp into ac1 
276:    SUB  3,4,3 	Op - 
277:     LD  4,-16(1) 	load index from temp to ac1 
278:    LDA  5,-1(0) 	Load address of base of array h
279:    SUB  5,5,4 	Compute offset of value 
280:     ST  3,0(5) 	Store variable h
* 46
281:     ST  1,-16(1) 	Store old fp in ghost frame 
282:    LDC  3,1(6) 	Load constant 
283:    LDA  4,-1(0) 	Load address of base of array h
284:    SUB  3,4,3 	Compute offset of value 
285:     LD  3,0(3) 	Load the value 
286:     ST  3,-18(1) 	Store parameter 
287:    LDA  1,-16(1) 	Load address of new frame 
288:    LDA  3,1(7) 	Return address in ac 
289:    LDA  7,-279(7) 	call output
290:    LDA  3,0(2) 	Save the result in ac 
* 47
291:     ST  1,-16(1) 	Store old fp in ghost frame 
292:    LDA  1,-16(1) 	Load address of new frame 
293:    LDA  3,1(7) 	Return address in ac 
294:    LDA  7,-265(7) 	call outnl
295:    LDA  3,0(2) 	Save the result in ac 
* 49
296:    LDC  3,1(6) 	Load constant 
297:     ST  3,-16(1) 	Save index in temp 
298:    LDC  3,777(6) 	Load constant 
299:     LD  4,-16(1) 	load index from temp to ac1 
300:     LD  5,-3(1) 	Load address of base of array q
301:    SUB  5,5,4 	Compute offset of value 
302:     ST  3,0(5) 	Store variable q
* 50
303:     ST  1,-16(1) 	Store old fp in ghost frame 
304:    LDC  3,1(6) 	Load constant 
305:     LD  4,-3(1) 	Load address of base of array q
306:    SUB  3,4,3 	Compute offset of value 
307:     LD  3,0(3) 	Load the value 
308:     ST  3,-18(1) 	Store parameter 
309:    LDA  1,-16(1) 	Load address of new frame 
310:    LDA  3,1(7) 	Return address in ac 
311:    LDA  7,-301(7) 	call output
312:    LDA  3,0(2) 	Save the result in ac 
* 51
313:    LDC  3,1(6) 	Load constant 
314:     ST  3,-16(1) 	Save index in temp 
315:    LDC  3,1(6) 	Load constant 
316:     LD  4,-3(1) 	Load address of base of array q
317:    SUB  3,4,3 	Compute offset of value 
318:     LD  3,0(3) 	Load the value 
319:     ST  3,-17(1) 	Save left side in temp 
320:    LDC  3,666(6) 	Load constant 
321:     LD  4,-17(1) 	Load left from temp into ac1 
322:    ADD  3,4,3 	Op + 
323:     LD  4,-16(1) 	load index from temp to ac1 
324:     LD  5,-3(1) 	Load address of base of array q
325:    SUB  5,5,4 	Compute offset of value 
326:     ST  3,0(5) 	Store variable q
* 52
327:     ST  1,-16(1) 	Store old fp in ghost frame 
328:    LDC  3,1(6) 	Load constant 
329:     LD  4,-3(1) 	Load address of base of array q
330:    SUB  3,4,3 	Compute offset of value 
331:     LD  3,0(3) 	Load the value 
332:     ST  3,-18(1) 	Store parameter 
333:    LDA  1,-16(1) 	Load address of new frame 
334:    LDA  3,1(7) 	Return address in ac 
335:    LDA  7,-325(7) 	call output
336:    LDA  3,0(2) 	Save the result in ac 
* 53
337:    LDC  3,1(6) 	Load constant 
338:     ST  3,-16(1) 	Save index in temp 
339:    LDC  3,1(6) 	Load constant 
340:     LD  4,-3(1) 	Load address of base of array q
341:    SUB  3,4,3 	Compute offset of value 
342:     LD  3,0(3) 	Load the value 
343:     ST  3,-17(1) 	Save left side in temp 
344:    LDC  3,666(6) 	Load constant 
345:     LD  4,-17(1) 	Load left from temp into ac1 
346:    SUB  3,4,3 	Op - 
347:     LD  4,-16(1) 	load index from temp to ac1 
348:     LD  5,-3(1) 	Load address of base of array q
349:    SUB  5,5,4 	Compute offset of value 
350:     ST  3,0(5) 	Store variable q
* 54
351:     ST  1,-16(1) 	Store old fp in ghost frame 
352:    LDC  3,1(6) 	Load constant 
353:     LD  4,-3(1) 	Load address of base of array q
354:    SUB  3,4,3 	Compute offset of value 
355:     LD  3,0(3) 	Load the value 
356:     ST  3,-18(1) 	Store parameter 
357:    LDA  1,-16(1) 	Load address of new frame 
358:    LDA  3,1(7) 	Return address in ac 
359:    LDA  7,-349(7) 	call output
360:    LDA  3,0(2) 	Save the result in ac 
* 55
361:     ST  1,-16(1) 	Store old fp in ghost frame 
362:    LDA  1,-16(1) 	Load address of new frame 
363:    LDA  3,1(7) 	Return address in ac 
364:    LDA  7,-335(7) 	call outnl
365:    LDA  3,0(2) 	Save the result in ac 
* 57
366:    LDC  3,1(6) 	Load constant 
367:     ST  3,-16(1) 	Save index in temp 
368:    LDC  3,3(6) 	Load constant 
369:     LD  4,-16(1) 	load index from temp to ac1 
370:    LDA  5,-5(1) 	Load address of base of array b
371:    SUB  5,5,4 	Compute offset of value 
372:     ST  3,0(5) 	Store variable b
* 58
373:    LDC  3,1(6) 	Load constant 
374:    LDA  4,-5(1) 	Load address of base of array b
375:    SUB  3,4,3 	Compute offset of value 
376:     LD  3,0(3) 	Load the value 
377:     ST  3,-16(1) 	Save left side in temp 
378:    LDC  3,1(6) 	Load constant 
379:     LD  4,-16(1) 	Load left from temp into ac1 
380:    ADD  3,4,3 	Op + 
381:     ST  3,-16(1) 	Save index in temp 
382:    LDC  3,777(6) 	Load constant 
383:     LD  4,-16(1) 	load index from temp to ac1 
384:     LD  5,-3(1) 	Load address of base of array q
385:    SUB  5,5,4 	Compute offset of value 
386:     ST  3,0(5) 	Store variable q
* 59
387:     ST  1,-16(1) 	Store old fp in ghost frame 
388:    LDC  3,1(6) 	Load constant 
389:    LDA  4,-5(1) 	Load address of base of array b
390:    SUB  3,4,3 	Compute offset of value 
391:     LD  3,0(3) 	Load the value 
392:     ST  3,-18(1) 	Save left side in temp 
393:    LDC  3,1(6) 	Load constant 
394:     LD  4,-18(1) 	Load left from temp into ac1 
395:    ADD  3,4,3 	Op + 
396:     LD  4,-3(1) 	Load address of base of array q
397:    SUB  3,4,3 	Compute offset of value 
398:     LD  3,0(3) 	Load the value 
399:     ST  3,-18(1) 	Store parameter 
400:    LDA  1,-16(1) 	Load address of new frame 
401:    LDA  3,1(7) 	Return address in ac 
402:    LDA  7,-392(7) 	call output
403:    LDA  3,0(2) 	Save the result in ac 
* 60
404:    LDC  3,1(6) 	Load constant 
405:    LDA  4,-5(1) 	Load address of base of array b
406:    SUB  3,4,3 	Compute offset of value 
407:     LD  3,0(3) 	Load the value 
408:     ST  3,-16(1) 	Save left side in temp 
409:    LDC  3,1(6) 	Load constant 
410:     LD  4,-16(1) 	Load left from temp into ac1 
411:    ADD  3,4,3 	Op + 
412:     ST  3,-16(1) 	Save index in temp 
413:    LDC  3,1(6) 	Load constant 
414:    LDA  4,-5(1) 	Load address of base of array b
415:    SUB  3,4,3 	Compute offset of value 
416:     LD  3,0(3) 	Load the value 
417:     ST  3,-17(1) 	Save left side in temp 
418:    LDC  3,1(6) 	Load constant 
419:     LD  4,-17(1) 	Load left from temp into ac1 
420:    ADD  3,4,3 	Op + 
421:     LD  4,-3(1) 	Load address of base of array q
422:    SUB  3,4,3 	Compute offset of value 
423:     LD  3,0(3) 	Load the value 
424:     ST  3,-17(1) 	Save left side in temp 
425:    LDC  3,666(6) 	Load constant 
426:     LD  4,-17(1) 	Load left from temp into ac1 
427:    ADD  3,4,3 	Op + 
428:     LD  4,-16(1) 	load index from temp to ac1 
429:     LD  5,-3(1) 	Load address of base of array q
430:    SUB  5,5,4 	Compute offset of value 
431:     ST  3,0(5) 	Store variable q
* 61
432:     ST  1,-16(1) 	Store old fp in ghost frame 
433:    LDC  3,1(6) 	Load constant 
434:    LDA  4,-5(1) 	Load address of base of array b
435:    SUB  3,4,3 	Compute offset of value 
436:     LD  3,0(3) 	Load the value 
437:     ST  3,-18(1) 	Save left side in temp 
438:    LDC  3,1(6) 	Load constant 
439:     LD  4,-18(1) 	Load left from temp into ac1 
440:    ADD  3,4,3 	Op + 
441:     LD  4,-3(1) 	Load address of base of array q
442:    SUB  3,4,3 	Compute offset of value 
443:     LD  3,0(3) 	Load the value 
444:     ST  3,-18(1) 	Store parameter 
445:    LDA  1,-16(1) 	Load address of new frame 
446:    LDA  3,1(7) 	Return address in ac 
447:    LDA  7,-437(7) 	call output
448:    LDA  3,0(2) 	Save the result in ac 
* 62
449:    LDC  3,1(6) 	Load constant 
450:    LDA  4,-5(1) 	Load address of base of array b
451:    SUB  3,4,3 	Compute offset of value 
452:     LD  3,0(3) 	Load the value 
453:     ST  3,-16(1) 	Save left side in temp 
454:    LDC  3,1(6) 	Load constant 
455:     LD  4,-16(1) 	Load left from temp into ac1 
456:    ADD  3,4,3 	Op + 
457:     ST  3,-16(1) 	Save index in temp 
458:    LDC  3,1(6) 	Load constant 
459:    LDA  4,-5(1) 	Load address of base of array b
460:    SUB  3,4,3 	Compute offset of value 
461:     LD  3,0(3) 	Load the value 
462:     ST  3,-17(1) 	Save left side in temp 
463:    LDC  3,1(6) 	Load constant 
464:     LD  4,-17(1) 	Load left from temp into ac1 
465:    ADD  3,4,3 	Op + 
466:     LD  4,-3(1) 	Load address of base of array q
467:    SUB  3,4,3 	Compute offset of value 
468:     LD  3,0(3) 	Load the value 
469:     ST  3,-17(1) 	Save left side in temp 
470:    LDC  3,666(6) 	Load constant 
471:     LD  4,-17(1) 	Load left from temp into ac1 
472:    SUB  3,4,3 	Op - 
473:     LD  4,-16(1) 	load index from temp to ac1 
474:     LD  5,-3(1) 	Load address of base of array q
475:    SUB  5,5,4 	Compute offset of value 
476:     ST  3,0(5) 	Store variable q
* 63
477:     ST  1,-16(1) 	Store old fp in ghost frame 
478:    LDC  3,1(6) 	Load constant 
479:    LDA  4,-5(1) 	Load address of base of array b
480:    SUB  3,4,3 	Compute offset of value 
481:     LD  3,0(3) 	Load the value 
482:     ST  3,-18(1) 	Save left side in temp 
483:    LDC  3,1(6) 	Load constant 
484:     LD  4,-18(1) 	Load left from temp into ac1 
485:    ADD  3,4,3 	Op + 
486:     LD  4,-3(1) 	Load address of base of array q
487:    SUB  3,4,3 	Compute offset of value 
488:     LD  3,0(3) 	Load the value 
489:     ST  3,-18(1) 	Store parameter 
490:    LDA  1,-16(1) 	Load address of new frame 
491:    LDA  3,1(7) 	Return address in ac 
492:    LDA  7,-482(7) 	call output
493:    LDA  3,0(2) 	Save the result in ac 
* 64
494:     ST  1,-16(1) 	Store old fp in ghost frame 
495:    LDA  1,-16(1) 	Load address of new frame 
496:    LDA  3,1(7) 	Return address in ac 
497:    LDA  7,-468(7) 	call outnl
498:    LDA  3,0(2) 	Save the result in ac 
* 66
499:    LDC  3,777(6) 	Load constant 
500:     ST  3,-4(1) 	Store variable a
501:     ST  3,-15(1) 	Store variable x
* 67
502:     ST  1,-16(1) 	Store old fp in ghost frame 
503:     LD  3,-15(1) 	Load variable x
504:     ST  3,-18(1) 	Store parameter 
505:    LDA  1,-16(1) 	Load address of new frame 
506:    LDA  3,1(7) 	Return address in ac 
507:    LDA  7,-497(7) 	call output
508:    LDA  3,0(2) 	Save the result in ac 
* 68
509:     LD  3,-4(1) 	Load variable a
510:     ST  3,-16(1) 	Save left side in temp 
511:    LDC  3,666(6) 	Load constant 
512:     LD  4,-16(1) 	Load left from temp into ac1 
513:    ADD  3,4,3 	Op + 
514:     ST  3,-4(1) 	Store variable a
515:     ST  3,-15(1) 	Store variable x
* 69
516:     ST  1,-16(1) 	Store old fp in ghost frame 
517:     LD  3,-15(1) 	Load variable x
518:     ST  3,-18(1) 	Store parameter 
519:    LDA  1,-16(1) 	Load address of new frame 
520:    LDA  3,1(7) 	Return address in ac 
521:    LDA  7,-511(7) 	call output
522:    LDA  3,0(2) 	Save the result in ac 
* 70
523:     LD  3,-4(1) 	Load variable a
524:     ST  3,-16(1) 	Save left side in temp 
525:    LDC  3,666(6) 	Load constant 
526:     LD  4,-16(1) 	Load left from temp into ac1 
527:    SUB  3,4,3 	Op - 
528:     ST  3,-4(1) 	Store variable a
529:     ST  3,-15(1) 	Store variable x
* 71
530:     ST  1,-16(1) 	Store old fp in ghost frame 
531:     LD  3,-15(1) 	Load variable x
532:     ST  3,-18(1) 	Store parameter 
533:    LDA  1,-16(1) 	Load address of new frame 
534:    LDA  3,1(7) 	Return address in ac 
535:    LDA  7,-525(7) 	call output
536:    LDA  3,0(2) 	Save the result in ac 
* 72
537:     ST  1,-16(1) 	Store old fp in ghost frame 
538:    LDA  1,-16(1) 	Load address of new frame 
539:    LDA  3,1(7) 	Return address in ac 
540:    LDA  7,-511(7) 	call outnl
541:    LDA  3,0(2) 	Save the result in ac 
* 74
542:    LDC  3,1(6) 	Load constant 
543:     ST  3,-16(1) 	Save index in temp 
544:    LDC  3,2(6) 	Load constant 
545:     ST  3,-17(1) 	Save index in temp 
546:    LDC  3,777(6) 	Load constant 
547:     LD  4,-17(1) 	load index from temp to ac1 
548:    LDA  5,-5(1) 	Load address of base of array b
549:    SUB  5,5,4 	Compute offset of value 
550:     ST  3,0(5) 	Store variable b
551:     LD  4,-16(1) 	load index from temp to ac1 
552:    LDA  5,-5(1) 	Load address of base of array b
553:    SUB  5,5,4 	Compute offset of value 
554:     ST  3,0(5) 	Store variable b
* 75
555:     ST  1,-16(1) 	Store old fp in ghost frame 
556:    LDC  3,1(6) 	Load constant 
557:    LDA  4,-5(1) 	Load address of base of array b
558:    SUB  3,4,3 	Compute offset of value 
559:     LD  3,0(3) 	Load the value 
560:     ST  3,-18(1) 	Store parameter 
561:    LDA  1,-16(1) 	Load address of new frame 
562:    LDA  3,1(7) 	Return address in ac 
563:    LDA  7,-553(7) 	call output
564:    LDA  3,0(2) 	Save the result in ac 
* 76
565:    LDC  3,1(6) 	Load constant 
566:     ST  3,-16(1) 	Save index in temp 
567:    LDC  3,2(6) 	Load constant 
568:     ST  3,-17(1) 	Save index in temp 
569:    LDC  3,2(6) 	Load constant 
570:    LDA  4,-5(1) 	Load address of base of array b
571:    SUB  3,4,3 	Compute offset of value 
572:     LD  3,0(3) 	Load the value 
573:     ST  3,-18(1) 	Save left side in temp 
574:    LDC  3,666(6) 	Load constant 
575:     LD  4,-18(1) 	Load left from temp into ac1 
576:    ADD  3,4,3 	Op + 
577:     LD  4,-17(1) 	load index from temp to ac1 
578:    LDA  5,-5(1) 	Load address of base of array b
579:    SUB  5,5,4 	Compute offset of value 
580:     ST  3,0(5) 	Store variable b
581:     LD  4,-16(1) 	load index from temp to ac1 
582:    LDA  5,-5(1) 	Load address of base of array b
583:    SUB  5,5,4 	Compute offset of value 
584:     ST  3,0(5) 	Store variable b
* 77
585:     ST  1,-16(1) 	Store old fp in ghost frame 
586:    LDC  3,1(6) 	Load constant 
587:    LDA  4,-5(1) 	Load address of base of array b
588:    SUB  3,4,3 	Compute offset of value 
589:     LD  3,0(3) 	Load the value 
590:     ST  3,-18(1) 	Store parameter 
591:    LDA  1,-16(1) 	Load address of new frame 
592:    LDA  3,1(7) 	Return address in ac 
593:    LDA  7,-583(7) 	call output
594:    LDA  3,0(2) 	Save the result in ac 
* 78
595:    LDC  3,1(6) 	Load constant 
596:     ST  3,-16(1) 	Save index in temp 
597:    LDC  3,2(6) 	Load constant 
598:     ST  3,-17(1) 	Save index in temp 
599:    LDC  3,2(6) 	Load constant 
600:    LDA  4,-5(1) 	Load address of base of array b
601:    SUB  3,4,3 	Compute offset of value 
602:     LD  3,0(3) 	Load the value 
603:     ST  3,-18(1) 	Save left side in temp 
604:    LDC  3,666(6) 	Load constant 
605:     LD  4,-18(1) 	Load left from temp into ac1 
606:    SUB  3,4,3 	Op - 
607:     LD  4,-17(1) 	load index from temp to ac1 
608:    LDA  5,-5(1) 	Load address of base of array b
609:    SUB  5,5,4 	Compute offset of value 
610:     ST  3,0(5) 	Store variable b
611:     LD  4,-16(1) 	load index from temp to ac1 
612:    LDA  5,-5(1) 	Load address of base of array b
613:    SUB  5,5,4 	Compute offset of value 
614:     ST  3,0(5) 	Store variable b
* 79
615:     ST  1,-16(1) 	Store old fp in ghost frame 
616:    LDC  3,1(6) 	Load constant 
617:    LDA  4,-5(1) 	Load address of base of array b
618:    SUB  3,4,3 	Compute offset of value 
619:     LD  3,0(3) 	Load the value 
620:     ST  3,-18(1) 	Store parameter 
621:    LDA  1,-16(1) 	Load address of new frame 
622:    LDA  3,1(7) 	Return address in ac 
623:    LDA  7,-613(7) 	call output
624:    LDA  3,0(2) 	Save the result in ac 
* 80
625:     ST  1,-16(1) 	Store old fp in ghost frame 
626:    LDA  1,-16(1) 	Load address of new frame 
627:    LDA  3,1(7) 	Return address in ac 
628:    LDA  7,-599(7) 	call outnl
629:    LDA  3,0(2) 	Save the result in ac 
* 82
630:     LD  3,-4(1) 	Load variable a
631:     ST  3,-16(1) 	Save left side in temp 
632:     LD  3,-4(1) 	Load variable a
633:     ST  3,-17(1) 	Save left side in temp 
634:     LD  3,-15(1) 	Load variable x
635:     LD  4,-17(1) 	Load left from temp into ac1 
636:    MUL  3,4,3 	Op * 
637:     LD  4,-16(1) 	Load left from temp into ac1 
638:    ADD  3,4,3 	Op + 
639:     ST  3,-4(1) 	Store variable a
* 83
640:     ST  1,-16(1) 	Store old fp in ghost frame 
641:     LD  3,-4(1) 	Load variable a
642:     ST  3,-18(1) 	Store parameter 
643:    LDA  1,-16(1) 	Load address of new frame 
644:    LDA  3,1(7) 	Return address in ac 
645:    LDA  7,-635(7) 	call output
646:    LDA  3,0(2) 	Save the result in ac 
* 84
647:     ST  1,-16(1) 	Store old fp in ghost frame 
648:    LDA  1,-16(1) 	Load address of new frame 
649:    LDA  3,1(7) 	Return address in ac 
650:    LDA  7,-621(7) 	call outnl
651:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
652:    LDC  2,0(6) 	Set return value to 0 
653:     LD  3,-1(1) 	Load return address 
654:     LD  1,0(1) 	Adjust fp 
655:    LDA  7,0(3) 	Return 
* END of function dog
* BEGIN function main
  4:    LDA  7,651(7) 	Jump to main 
656:     ST  3,-1(1) 	Store return address. BEGIN FUNC: main
* BEGIN compound statement
* 90
657:    LDC  3,888(6) 	Load constant 
658:     ST  3,-2(1) 	Store variable pp
* 91
659:    LDC  3,1(6) 	Load constant 
660:     ST  3,-23(1) 	Save index in temp 
661:    LDC  3,999(6) 	Load constant 
662:     LD  4,-23(1) 	load index from temp to ac1 
663:    LDA  5,-3(1) 	Load address of base of array qq
664:    SUB  5,5,4 	Compute offset of value 
665:     ST  3,0(5) 	Store variable qq
* 92
666:     ST  1,-23(1) 	Store old fp in ghost frame 
667:     LD  3,-2(1) 	Load variable pp
668:     ST  3,-25(1) 	Store parameter 
669:    LDA  3,-3(1) 	Load address of base of array qq
670:     ST  3,-26(1) 	Store parameter 
671:    LDA  1,-23(1) 	Load address of new frame 
672:    LDA  3,1(7) 	Return address in ac 
673:    LDA  7,-639(7) 	call dog
674:    LDA  3,0(2) 	Save the result in ac 
* 93
675:     ST  1,-23(1) 	Store old fp in ghost frame 
676:     LD  3,-2(1) 	Load variable pp
677:     ST  3,-25(1) 	Store parameter 
678:    LDA  1,-23(1) 	Load address of new frame 
679:    LDA  3,1(7) 	Return address in ac 
680:    LDA  7,-670(7) 	call output
681:    LDA  3,0(2) 	Save the result in ac 
* 94
682:     ST  1,-23(1) 	Store old fp in ghost frame 
683:    LDC  3,1(6) 	Load constant 
684:    LDA  4,-3(1) 	Load address of base of array qq
685:    SUB  3,4,3 	Compute offset of value 
686:     LD  3,0(3) 	Load the value 
687:     ST  3,-25(1) 	Store parameter 
688:    LDA  1,-23(1) 	Load address of new frame 
689:    LDA  3,1(7) 	Return address in ac 
690:    LDA  7,-680(7) 	call output
691:    LDA  3,0(2) 	Save the result in ac 
* 95
692:     ST  1,-23(1) 	Store old fp in ghost frame 
693:    LDA  1,-23(1) 	Load address of new frame 
694:    LDA  3,1(7) 	Return address in ac 
695:    LDA  7,-666(7) 	call outnl
696:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
697:    LDC  2,0(6) 	Set return value to 0 
698:     LD  3,-1(1) 	Load return address 
699:     LD  1,0(1) 	Adjust fp 
700:    LDA  7,0(3) 	Return 
* END of function main
