* Begin Prolog code
  0:     LD  0,0(0) 	load global poiniter with end of memory
  1:    LDA  1,-12(0) 	load fp
  2:     ST  1,0(1) 	store old fp
  3:    LDA  3,1(7) 	return address in ac
  5:   HALT  0,0,0 	DONE!
* End Prolog code
* Being Generating IO Functions
* Begin function input
  6:     ST  3,-1(1) 	store return address
  7:     IN  2,2,2 	input integer
  8:     LD  3,-1(1) 	load return address
  9:     LD  1,0(1) 	adjust fp
 10:    LDA  7,0(3) 	jump to return address
* End function input
* Begin function output
 11:     ST  3,-1(1) 	store return address
 12:     LD  3,-2(1) 	load parameter
 13:    OUT  3,3,3 	output integer
 14:    LDC  2,0(2) 	set return to 0
 15:     LD  3,-1(1) 	load return address
 16:     LD  1,0(1) 	adjust fp
 17:    LDA  7,0(3) 	jump to return address
* End function output
* Begin function inputb
 18:     ST  3,-1(1) 	store return address
 19:    INB  2,2,2 	input boolean
 20:     LD  3,-1(1) 	load return address
 21:     LD  1,0(1) 	adjust fp
 22:    LDA  7,0(3) 	jump to return address
* End function inputb
* Begin function outputb
 23:     ST  3,-1(1) 	store return address
 24:     LD  3,-2(1) 	load parameter
 25:   OUTB  3,3,3 	output boolean
 26:    LDC  2,0(2) 	set return to 0
 27:     LD  3,-1(1) 	load return address
 28:     LD  1,0(1) 	adjust fp
 29:    LDA  7,0(3) 	jump to return address
* End function outputb
* End Generating IO Functions
 30:     ST  3,-1(1) 	store return address
  4:    LDA  7,25(7) 	jump to main
* Function main returns void
* BEGIN
 31:    LDC  3,50(0) 	load constant
 32:     ST  3,-5(1) 	Store RHS of assignment
 33:    LDC  3,0(0) 	load constant
 34:    LDA  2,-1(0) 	array base
 35:    SUB  3,2,3 	index off of the base
 36:     LD  2,-5(1) 	Load RHS value
 37:     ST  2,0(3) 	store indexed variable y
 38:    LDA  3,0(2) 	adjust current accumulator
* 
 39:    LDC  3,1(0) 	load constant
 40:     ST  3,-5(1) 	Store RHS of assignment
 41:    LDC  3,5(0) 	load constant
 42:    LDA  2,-1(0) 	array base
 43:    SUB  3,2,3 	index off of the base
 44:     LD  2,-5(1) 	Load RHS value
 45:     ST  2,0(3) 	store indexed variable y
 46:    LDA  3,0(2) 	adjust current accumulator
* 
 47:    LDC  3,2(0) 	load constant
 48:     ST  3,-5(1) 	Store RHS of assignment
 49:    LDC  3,8(0) 	load constant
 50:    LDA  2,-1(0) 	array base
 51:    SUB  3,2,3 	index off of the base
 52:     LD  2,-5(1) 	Load RHS value
 53:     ST  2,0(3) 	store indexed variable y
 54:    LDA  3,0(2) 	adjust current accumulator
* 
 55:    LDC  3,0(0) 	load constant
 56:     ST  3,0(0) 	store variable x
* 
 57:    LDC  3,1(0) 	load constant
 58:     ST  3,-11(0) 	store variable z
* 
 59:    LDC  3,50(0) 	load constant
 60:     ST  3,-2(1) 	store variable a
* 
 61:    LDC  3,1(0) 	load constant
 62:     ST  3,-3(1) 	store variable b
* 
 63:    LDC  3,8(0) 	load constant
 64:     ST  3,-4(1) 	store variable c
* 
 65:     ST  1,-5(1) 	Store old fp in ghost frame
 66:     LD  3,-2(1) 	load variable a
* Left side will remain in register
 67:    LDC  4,1(0) 	load constant
 68:    SUB  3,3,4 	prepare for comparison op
 69:    JLE  3,2(7) 	op <=
 70:    LDC  3,0(0) 	load false into ac
 71:    LDA  7,1(7) 	jump past true case
 72:    LDC  3,1(0) 	load true into ac
 73:     ST  3,-7(1) 	Save parameter
 74:    LDA  1,-5(1) 	Load address of new frame
 75:    LDA  3,1(7) 	Put return address in current accumulator
 76:    LDA  7,-54(7) 	Call outputb
 77:    LDA  3,0(2) 	Save the result in ac
* 
 78:     ST  1,-5(1) 	Store old fp in ghost frame
 79:     LD  3,-3(1) 	load variable b
* Left side will remain in register
 80:    LDC  4,50(0) 	load constant
 81:    SUB  3,3,4 	prepare for comparison op
 82:    JLE  3,2(7) 	op <=
 83:    LDC  3,0(0) 	load false into ac
 84:    LDA  7,1(7) 	jump past true case
 85:    LDC  3,1(0) 	load true into ac
 86:     ST  3,-7(1) 	Save parameter
 87:    LDA  1,-5(1) 	Load address of new frame
 88:    LDA  3,1(7) 	Put return address in current accumulator
 89:    LDA  7,-67(7) 	Call outputb
 90:    LDA  3,0(2) 	Save the result in ac
* 
 91:     ST  1,-5(1) 	Store old fp in ghost frame
 92:    LDC  3,50(0) 	load constant
* Left side will remain in register
 93:    LDC  4,50(0) 	load constant
 94:    SUB  3,3,4 	prepare for comparison op
 95:    JLE  3,2(7) 	op <=
 96:    LDC  3,0(0) 	load false into ac
 97:    LDA  7,1(7) 	jump past true case
 98:    LDC  3,1(0) 	load true into ac
 99:     ST  3,-7(1) 	Save parameter
100:    LDA  1,-5(1) 	Load address of new frame
101:    LDA  3,1(7) 	Put return address in current accumulator
102:    LDA  7,-80(7) 	Call outputb
103:    LDA  3,0(2) 	Save the result in ac
* 
104:     ST  1,-5(1) 	Store old fp in ghost frame
105:    LDC  3,50(0) 	load constant
* Left side will remain in register
106:    LDC  4,1(0) 	load constant
107:    SUB  3,3,4 	prepare for comparison op
108:    JLT  3,2(7) 	op <
109:    LDC  3,0(0) 	load false into ac
110:    LDA  7,1(7) 	jump past true case
111:    LDC  3,1(0) 	load true into ac
112:     ST  3,-7(1) 	Save parameter
113:    LDA  1,-5(1) 	Load address of new frame
114:    LDA  3,1(7) 	Put return address in current accumulator
115:    LDA  7,-93(7) 	Call outputb
116:    LDA  3,0(2) 	Save the result in ac
* 
117:     ST  1,-5(1) 	Store old fp in ghost frame
118:     LD  3,-3(1) 	load variable b
* Left side will remain in register
119:     LD  4,-2(1) 	load variable a
120:    SUB  3,3,4 	prepare for comparison op
121:    JLT  3,2(7) 	op <
122:    LDC  3,0(0) 	load false into ac
123:    LDA  7,1(7) 	jump past true case
124:    LDC  3,1(0) 	load true into ac
125:     ST  3,-7(1) 	Save parameter
126:    LDA  1,-5(1) 	Load address of new frame
127:    LDA  3,1(7) 	Put return address in current accumulator
128:    LDA  7,-106(7) 	Call outputb
129:    LDA  3,0(2) 	Save the result in ac
* 
130:     ST  1,-5(1) 	Store old fp in ghost frame
131:     LD  3,-2(1) 	load variable a
* Left side will remain in register
132:     LD  4,-2(1) 	load variable a
133:    SUB  3,3,4 	prepare for comparison op
134:    JLT  3,2(7) 	op <
135:    LDC  3,0(0) 	load false into ac
136:    LDA  7,1(7) 	jump past true case
137:    LDC  3,1(0) 	load true into ac
138:     ST  3,-7(1) 	Save parameter
139:    LDA  1,-5(1) 	Load address of new frame
140:    LDA  3,1(7) 	Put return address in current accumulator
141:    LDA  7,-119(7) 	Call outputb
142:    LDA  3,0(2) 	Save the result in ac
* 
143:     ST  1,-5(1) 	Store old fp in ghost frame
144:    LDC  3,50(0) 	load constant
* Left side will remain in register
145:    LDC  4,1(0) 	load constant
146:    SUB  3,3,4 	prepare for comparison op
147:    JGT  3,2(7) 	op >
148:    LDC  3,0(0) 	load false into ac
149:    LDA  7,1(7) 	jump past true case
150:    LDC  3,1(0) 	load true into ac
151:     ST  3,-7(1) 	Save parameter
152:    LDA  1,-5(1) 	Load address of new frame
153:    LDA  3,1(7) 	Put return address in current accumulator
154:    LDA  7,-132(7) 	Call outputb
155:    LDA  3,0(2) 	Save the result in ac
* 
156:     ST  1,-5(1) 	Store old fp in ghost frame
157:    LDC  3,1(0) 	load constant
* Left side will remain in register
158:    LDC  4,50(0) 	load constant
159:    SUB  3,3,4 	prepare for comparison op
160:    JGT  3,2(7) 	op >
161:    LDC  3,0(0) 	load false into ac
162:    LDA  7,1(7) 	jump past true case
163:    LDC  3,1(0) 	load true into ac
164:     ST  3,-7(1) 	Save parameter
165:    LDA  1,-5(1) 	Load address of new frame
166:    LDA  3,1(7) 	Put return address in current accumulator
167:    LDA  7,-145(7) 	Call outputb
168:    LDA  3,0(2) 	Save the result in ac
* 
169:     ST  1,-5(1) 	Store old fp in ghost frame
170:    LDC  3,50(0) 	load constant
* Left side will remain in register
171:    LDC  4,50(0) 	load constant
172:    SUB  3,3,4 	prepare for comparison op
173:    JGT  3,2(7) 	op >
174:    LDC  3,0(0) 	load false into ac
175:    LDA  7,1(7) 	jump past true case
176:    LDC  3,1(0) 	load true into ac
177:     ST  3,-7(1) 	Save parameter
178:    LDA  1,-5(1) 	Load address of new frame
179:    LDA  3,1(7) 	Put return address in current accumulator
180:    LDA  7,-158(7) 	Call outputb
181:    LDA  3,0(2) 	Save the result in ac
* 
182:     ST  1,-5(1) 	Store old fp in ghost frame
183:    LDC  3,50(0) 	load constant
* Left side will remain in register
184:    LDC  4,1(0) 	load constant
185:    SUB  3,3,4 	prepare for comparison op
186:    JGE  3,2(7) 	op >=
187:    LDC  3,0(0) 	load false into ac
188:    LDA  7,1(7) 	jump past true case
189:    LDC  3,1(0) 	load true into ac
190:     ST  3,-7(1) 	Save parameter
191:    LDA  1,-5(1) 	Load address of new frame
192:    LDA  3,1(7) 	Put return address in current accumulator
193:    LDA  7,-171(7) 	Call outputb
194:    LDA  3,0(2) 	Save the result in ac
* 
195:     ST  1,-5(1) 	Store old fp in ghost frame
196:    LDC  3,1(0) 	load constant
* Left side will remain in register
197:    LDC  4,50(0) 	load constant
198:    SUB  3,3,4 	prepare for comparison op
199:    JGE  3,2(7) 	op >=
200:    LDC  3,0(0) 	load false into ac
201:    LDA  7,1(7) 	jump past true case
202:    LDC  3,1(0) 	load true into ac
203:     ST  3,-7(1) 	Save parameter
204:    LDA  1,-5(1) 	Load address of new frame
205:    LDA  3,1(7) 	Put return address in current accumulator
206:    LDA  7,-184(7) 	Call outputb
207:    LDA  3,0(2) 	Save the result in ac
* 
208:     ST  1,-5(1) 	Store old fp in ghost frame
209:    LDC  3,50(0) 	load constant
* Left side will remain in register
210:    LDC  4,50(0) 	load constant
211:    SUB  3,3,4 	prepare for comparison op
212:    JGE  3,2(7) 	op >=
213:    LDC  3,0(0) 	load false into ac
214:    LDA  7,1(7) 	jump past true case
215:    LDC  3,1(0) 	load true into ac
216:     ST  3,-7(1) 	Save parameter
217:    LDA  1,-5(1) 	Load address of new frame
218:    LDA  3,1(7) 	Put return address in current accumulator
219:    LDA  7,-197(7) 	Call outputb
220:    LDA  3,0(2) 	Save the result in ac
* 
221:     ST  1,-5(1) 	Store old fp in ghost frame
222:    LDC  3,0(0) 	load constant
223:    LDA  2,-1(0) 	Load address of base of array y
224:    SUB  3,2,3 	index off of the base
225:     LD  3,0(3) 	load the value
* Left side will remain in register
226:     LD  4,-3(1) 	load variable b
227:    SUB  3,3,4 	prepare for comparison op
228:    JEQ  3,2(7) 	op ==
229:    LDC  3,0(0) 	load false into ac
230:    LDA  7,1(7) 	jump past true case
231:    LDC  3,1(0) 	load true into ac
232:     ST  3,-7(1) 	Save parameter
233:    LDA  1,-5(1) 	Load address of new frame
234:    LDA  3,1(7) 	Put return address in current accumulator
235:    LDA  7,-213(7) 	Call outputb
236:    LDA  3,0(2) 	Save the result in ac
* 
237:     ST  1,-5(1) 	Store old fp in ghost frame
238:     LD  3,-2(1) 	load variable a
* Left side will remain in register
239:     LD  4,-3(1) 	load variable b
240:    SUB  3,3,4 	prepare for comparison op
241:    JEQ  3,2(7) 	op ==
242:    LDC  3,0(0) 	load false into ac
243:    LDA  7,1(7) 	jump past true case
244:    LDC  3,1(0) 	load true into ac
245:     ST  3,-7(1) 	Save parameter
246:    LDA  1,-5(1) 	Load address of new frame
247:    LDA  3,1(7) 	Put return address in current accumulator
248:    LDA  7,-226(7) 	Call outputb
249:    LDA  3,0(2) 	Save the result in ac
* 
250:     ST  1,-5(1) 	Store old fp in ghost frame
251:     LD  3,-3(1) 	load variable b
* Left side will remain in register
252:     LD  4,-3(1) 	load variable b
253:    SUB  3,3,4 	prepare for comparison op
254:    JEQ  3,2(7) 	op ==
255:    LDC  3,0(0) 	load false into ac
256:    LDA  7,1(7) 	jump past true case
257:    LDC  3,1(0) 	load true into ac
258:     ST  3,-7(1) 	Save parameter
259:    LDA  1,-5(1) 	Load address of new frame
260:    LDA  3,1(7) 	Put return address in current accumulator
261:    LDA  7,-239(7) 	Call outputb
262:    LDA  3,0(2) 	Save the result in ac
* 
263:     ST  1,-5(1) 	Store old fp in ghost frame
264:    LDC  3,0(0) 	load constant
265:    LDA  2,-1(0) 	Load address of base of array y
266:    SUB  3,2,3 	index off of the base
267:     LD  3,0(3) 	load the value
* Left side will remain in register
268:     LD  4,-2(1) 	load variable a
269:    SUB  3,3,4 	prepare for comparison op
270:    JNE  3,2(7) 	op !=
271:    LDC  3,0(0) 	load false into ac
272:    LDA  7,1(7) 	jump past true case
273:    LDC  3,1(0) 	load true into ac
274:     ST  3,-7(1) 	Save parameter
275:    LDA  1,-5(1) 	Load address of new frame
276:    LDA  3,1(7) 	Put return address in current accumulator
277:    LDA  7,-255(7) 	Call outputb
278:    LDA  3,0(2) 	Save the result in ac
* 
279:     ST  1,-5(1) 	Store old fp in ghost frame
280:    LDC  3,0(0) 	load constant
281:    LDA  2,-1(0) 	Load address of base of array y
282:    SUB  3,2,3 	index off of the base
283:     LD  3,0(3) 	load the value
* Left side will remain in register
284:     LD  4,-3(1) 	load variable b
285:    SUB  3,3,4 	prepare for comparison op
286:    JNE  3,2(7) 	op !=
287:    LDC  3,0(0) 	load false into ac
288:    LDA  7,1(7) 	jump past true case
289:    LDC  3,1(0) 	load true into ac
290:     ST  3,-7(1) 	Save parameter
291:    LDA  1,-5(1) 	Load address of new frame
292:    LDA  3,1(7) 	Put return address in current accumulator
293:    LDA  7,-271(7) 	Call outputb
294:    LDA  3,0(2) 	Save the result in ac
* 
295:     ST  1,-5(1) 	Store old fp in ghost frame
296:     LD  3,-2(1) 	load variable a
* Left side will remain in register
297:     LD  4,-3(1) 	load variable b
298:    SUB  3,3,4 	prepare for comparison op
299:    JNE  3,2(7) 	op !=
300:    LDC  3,0(0) 	load false into ac
301:    LDA  7,1(7) 	jump past true case
302:    LDC  3,1(0) 	load true into ac
303:     ST  3,-7(1) 	Save parameter
304:    LDA  1,-5(1) 	Load address of new frame
305:    LDA  3,1(7) 	Put return address in current accumulator
306:    LDA  7,-284(7) 	Call outputb
307:    LDA  3,0(2) 	Save the result in ac
* 
308:     ST  1,-5(1) 	Store old fp in ghost frame
309:     LD  3,-3(1) 	load variable b
* Left side will remain in register
310:     LD  4,-3(1) 	load variable b
311:    SUB  3,3,4 	prepare for comparison op
312:    JNE  3,2(7) 	op !=
313:    LDC  3,0(0) 	load false into ac
314:    LDA  7,1(7) 	jump past true case
315:    LDC  3,1(0) 	load true into ac
316:     ST  3,-7(1) 	Save parameter
317:    LDA  1,-5(1) 	Load address of new frame
318:    LDA  3,1(7) 	Put return address in current accumulator
319:    LDA  7,-297(7) 	Call outputb
320:    LDA  3,0(2) 	Save the result in ac
* 
321:     ST  1,-5(1) 	Store old fp in ghost frame
322:    LDC  3,1(0) 	load constant
* Left side will remain in register
324:    LDC  4,1(0) 	load constant
325:    JGT  4,2(7) 	op && (right side)
323:    JEQ  3,2(7) 	Skip right child of && if left is false
326:    LDC  3,0(0) 	load false into ac
327:    LDA  7,1(7) 	jump past true case
328:    LDC  3,1(0) 	load true into ac
329:     ST  3,-7(1) 	Save parameter
330:    LDA  1,-5(1) 	Load address of new frame
331:    LDA  3,1(7) 	Put return address in current accumulator
332:    LDA  7,-310(7) 	Call outputb
333:    LDA  3,0(2) 	Save the result in ac
* 
334:     ST  1,-5(1) 	Store old fp in ghost frame
335:    LDC  3,1(0) 	load constant
* Left side will remain in register
337:    LDC  4,0(0) 	load constant
338:    JGT  4,2(7) 	op && (right side)
336:    JEQ  3,2(7) 	Skip right child of && if left is false
339:    LDC  3,0(0) 	load false into ac
340:    LDA  7,1(7) 	jump past true case
341:    LDC  3,1(0) 	load true into ac
342:     ST  3,-7(1) 	Save parameter
343:    LDA  1,-5(1) 	Load address of new frame
344:    LDA  3,1(7) 	Put return address in current accumulator
345:    LDA  7,-323(7) 	Call outputb
346:    LDA  3,0(2) 	Save the result in ac
* 
347:     ST  1,-5(1) 	Store old fp in ghost frame
348:    LDC  3,0(0) 	load constant
* Left side will remain in register
350:    LDC  4,1(0) 	load constant
351:    JGT  4,2(7) 	op && (right side)
349:    JEQ  3,2(7) 	Skip right child of && if left is false
352:    LDC  3,0(0) 	load false into ac
353:    LDA  7,1(7) 	jump past true case
354:    LDC  3,1(0) 	load true into ac
355:     ST  3,-7(1) 	Save parameter
356:    LDA  1,-5(1) 	Load address of new frame
357:    LDA  3,1(7) 	Put return address in current accumulator
358:    LDA  7,-336(7) 	Call outputb
359:    LDA  3,0(2) 	Save the result in ac
* 
360:     ST  1,-5(1) 	Store old fp in ghost frame
361:    LDC  3,0(0) 	load constant
* Left side will remain in register
363:    LDC  4,0(0) 	load constant
364:    JGT  4,2(7) 	op && (right side)
362:    JEQ  3,2(7) 	Skip right child of && if left is false
365:    LDC  3,0(0) 	load false into ac
366:    LDA  7,1(7) 	jump past true case
367:    LDC  3,1(0) 	load true into ac
368:     ST  3,-7(1) 	Save parameter
369:    LDA  1,-5(1) 	Load address of new frame
370:    LDA  3,1(7) 	Put return address in current accumulator
371:    LDA  7,-349(7) 	Call outputb
372:    LDA  3,0(2) 	Save the result in ac
* 
373:     ST  1,-5(1) 	Store old fp in ghost frame
374:    LDC  3,1(0) 	load constant
* Left side will remain in register
376:    LDC  4,1(0) 	load constant
377:    JEQ  4,2(7) 	op || (right side)
375:    JGT  3,2(7) 	Skip right child of || if left is true
378:    LDC  3,1(0) 	load true into ac
379:    LDA  7,1(7) 	jump past false case
380:    LDC  3,0(0) 	load false into ac
381:     ST  3,-7(1) 	Save parameter
382:    LDA  1,-5(1) 	Load address of new frame
383:    LDA  3,1(7) 	Put return address in current accumulator
384:    LDA  7,-362(7) 	Call outputb
385:    LDA  3,0(2) 	Save the result in ac
* 
386:     ST  1,-5(1) 	Store old fp in ghost frame
387:     LD  3,-11(0) 	load variable z
* Left side will remain in register
389:    LDC  4,0(0) 	load constant
390:    JEQ  4,2(7) 	op || (right side)
388:    JGT  3,2(7) 	Skip right child of || if left is true
391:    LDC  3,1(0) 	load true into ac
392:    LDA  7,1(7) 	jump past false case
393:    LDC  3,0(0) 	load false into ac
394:     ST  3,-7(1) 	Save parameter
395:    LDA  1,-5(1) 	Load address of new frame
396:    LDA  3,1(7) 	Put return address in current accumulator
397:    LDA  7,-375(7) 	Call outputb
398:    LDA  3,0(2) 	Save the result in ac
* 
399:     ST  1,-5(1) 	Store old fp in ghost frame
400:    LDC  3,0(0) 	load constant
* Left side will remain in register
402:    LDC  4,1(0) 	load constant
403:    JEQ  4,2(7) 	op || (right side)
401:    JGT  3,2(7) 	Skip right child of || if left is true
404:    LDC  3,1(0) 	load true into ac
405:    LDA  7,1(7) 	jump past false case
406:    LDC  3,0(0) 	load false into ac
407:     ST  3,-7(1) 	Save parameter
408:    LDA  1,-5(1) 	Load address of new frame
409:    LDA  3,1(7) 	Put return address in current accumulator
410:    LDA  7,-388(7) 	Call outputb
411:    LDA  3,0(2) 	Save the result in ac
* 
412:     ST  1,-5(1) 	Store old fp in ghost frame
413:    LDC  3,0(0) 	load constant
* Left side will remain in register
415:    LDC  4,0(0) 	load constant
416:    JEQ  4,2(7) 	op || (right side)
414:    JGT  3,2(7) 	Skip right child of || if left is true
417:    LDC  3,1(0) 	load true into ac
418:    LDA  7,1(7) 	jump past false case
419:    LDC  3,0(0) 	load false into ac
420:     ST  3,-7(1) 	Save parameter
421:    LDA  1,-5(1) 	Load address of new frame
422:    LDA  3,1(7) 	Put return address in current accumulator
423:    LDA  7,-401(7) 	Call outputb
424:    LDA  3,0(2) 	Save the result in ac
* 
425:     ST  1,-5(1) 	Store old fp in ghost frame
426:    LDC  3,1(0) 	load constant
427:    JEQ  3,2(7) 	op !
428:    LDC  3,0(0) 	load false into ac
429:    LDA  7,1(7) 	jump past true case
430:    LDC  3,1(0) 	load true into ac
431:     ST  3,-7(1) 	Save parameter
432:    LDA  1,-5(1) 	Load address of new frame
433:    LDA  3,1(7) 	Put return address in current accumulator
434:    LDA  7,-412(7) 	Call outputb
435:    LDA  3,0(2) 	Save the result in ac
* 
436:     ST  1,-5(1) 	Store old fp in ghost frame
437:     LD  3,0(0) 	load variable x
438:    JEQ  3,2(7) 	op !
439:    LDC  3,0(0) 	load false into ac
440:    LDA  7,1(7) 	jump past true case
441:    LDC  3,1(0) 	load true into ac
442:     ST  3,-7(1) 	Save parameter
443:    LDA  1,-5(1) 	Load address of new frame
444:    LDA  3,1(7) 	Put return address in current accumulator
445:    LDA  7,-423(7) 	Call outputb
446:    LDA  3,0(2) 	Save the result in ac
* 
447:     ST  1,-5(1) 	Store old fp in ghost frame
448:    LDC  3,5(0) 	load constant
* Left side will remain in register
449:    LDC  4,50(0) 	load constant
450:    ADD  3,3,4 	op +
451:     ST  3,-7(1) 	Save parameter
452:    LDA  1,-5(1) 	Load address of new frame
453:    LDA  3,1(7) 	Put return address in current accumulator
454:    LDA  7,-444(7) 	Call output
455:    LDA  3,0(2) 	Save the result in ac
* 
456:     ST  1,-5(1) 	Store old fp in ghost frame
457:     LD  3,-4(1) 	load variable c
458:    LDA  2,-1(0) 	Load address of base of array y
459:    SUB  3,2,3 	index off of the base
460:     LD  3,0(3) 	load the value
* Left side will remain in register
461:    LDC  4,50(0) 	load constant
462:    ADD  3,3,4 	op +
463:     ST  3,-7(1) 	Save parameter
464:    LDA  1,-5(1) 	Load address of new frame
465:    LDA  3,1(7) 	Put return address in current accumulator
466:    LDA  7,-456(7) 	Call output
467:    LDA  3,0(2) 	Save the result in ac
* 
468:     ST  1,-5(1) 	Store old fp in ghost frame
469:    LDC  3,5(0) 	load constant
* Left side will remain in register
470:    LDC  4,50(0) 	load constant
471:    SUB  3,3,4 	op -
472:     ST  3,-7(1) 	Save parameter
473:    LDA  1,-5(1) 	Load address of new frame
474:    LDA  3,1(7) 	Put return address in current accumulator
475:    LDA  7,-465(7) 	Call output
476:    LDA  3,0(2) 	Save the result in ac
* 
477:     ST  1,-5(1) 	Store old fp in ghost frame
478:    LDC  3,30(0) 	load constant
* Left side will remain in register
479:    LDC  4,5(0) 	load constant
480:    SUB  3,3,4 	op -
* Left side will remain in register
481:    LDC  4,50(0) 	load constant
482:    SUB  3,3,4 	op -
483:     ST  3,-7(1) 	Save parameter
484:    LDA  1,-5(1) 	Load address of new frame
485:    LDA  3,1(7) 	Put return address in current accumulator
486:    LDA  7,-476(7) 	Call output
487:    LDA  3,0(2) 	Save the result in ac
* 
488:     ST  1,-5(1) 	Store old fp in ghost frame
489:     LD  3,-2(1) 	load variable a
490:    LDC  2,0(0) 	Load zero in rt for unary -
491:    SUB  3,2,3 	op unary -
492:     ST  3,-7(1) 	Save parameter
493:    LDA  1,-5(1) 	Load address of new frame
494:    LDA  3,1(7) 	Put return address in current accumulator
495:    LDA  7,-485(7) 	Call output
496:    LDA  3,0(2) 	Save the result in ac
* 
497:     ST  1,-5(1) 	Store old fp in ghost frame
498:    LDC  3,0(0) 	load constant
499:    LDC  2,0(0) 	Load zero in rt for unary -
500:    SUB  3,2,3 	op unary -
501:     ST  3,-7(1) 	Save parameter
502:    LDA  1,-5(1) 	Load address of new frame
503:    LDA  3,1(7) 	Put return address in current accumulator
504:    LDA  7,-494(7) 	Call output
505:    LDA  3,0(2) 	Save the result in ac
* 
506:     ST  1,-5(1) 	Store old fp in ghost frame
507:    LDC  3,1(0) 	load constant
508:    LDC  2,0(0) 	Load zero in rt for unary -
509:    SUB  3,2,3 	op unary -
510:     ST  3,-7(1) 	Save parameter
511:    LDA  1,-5(1) 	Load address of new frame
512:    LDA  3,1(7) 	Put return address in current accumulator
513:    LDA  7,-503(7) 	Call output
514:    LDA  3,0(2) 	Save the result in ac
* 
515:     ST  1,-5(1) 	Store old fp in ghost frame
516:    LDC  3,2(0) 	load constant
* Left side will remain in register
517:    LDC  4,3(0) 	load constant
518:    MUL  3,3,4 	op *
* Left side will remain in register
519:    LDC  4,5(0) 	load constant
520:    MUL  3,3,4 	op *
* Left side will remain in register
521:    LDC  4,7(0) 	load constant
522:    MUL  3,3,4 	op *
* Left side will remain in register
523:    LDC  4,11(0) 	load constant
524:    MUL  3,3,4 	op *
525:     ST  3,-7(1) 	Save parameter
526:    LDA  1,-5(1) 	Load address of new frame
527:    LDA  3,1(7) 	Put return address in current accumulator
528:    LDA  7,-518(7) 	Call output
529:    LDA  3,0(2) 	Save the result in ac
* 
530:     ST  1,-5(1) 	Store old fp in ghost frame
531:    LDC  3,50(0) 	load constant
* Left side will remain in register
532:    LDC  4,8(0) 	load constant
533:    LDA  2,-1(0) 	Load address of base of array y
534:    SUB  4,2,4 	index off of the base
535:     LD  4,0(4) 	load the value
536:    MUL  3,3,4 	op *
537:     ST  3,-7(1) 	Save parameter
538:    LDA  1,-5(1) 	Load address of new frame
539:    LDA  3,1(7) 	Put return address in current accumulator
540:    LDA  7,-530(7) 	Call output
541:    LDA  3,0(2) 	Save the result in ac
* 
542:     ST  1,-5(1) 	Store old fp in ghost frame
543:    LDC  3,8(0) 	load constant
544:    LDA  2,-1(0) 	Load address of base of array y
545:    SUB  3,2,3 	index off of the base
546:     LD  3,0(3) 	load the value
* Left side will remain in register
547:    LDC  4,50(0) 	load constant
548:    MUL  3,3,4 	op *
549:     ST  3,-7(1) 	Save parameter
550:    LDA  1,-5(1) 	Load address of new frame
551:    LDA  3,1(7) 	Put return address in current accumulator
552:    LDA  7,-542(7) 	Call output
553:    LDA  3,0(2) 	Save the result in ac
* 
554:     ST  1,-5(1) 	Store old fp in ghost frame
555:    LDC  3,50(0) 	load constant
* Left side will remain in register
556:    LDC  4,8(0) 	load constant
557:    LDA  2,-1(0) 	Load address of base of array y
558:    SUB  4,2,4 	index off of the base
559:     LD  4,0(4) 	load the value
560:    DIV  3,3,4 	op /
561:     ST  3,-7(1) 	Save parameter
562:    LDA  1,-5(1) 	Load address of new frame
563:    LDA  3,1(7) 	Put return address in current accumulator
564:    LDA  7,-554(7) 	Call output
565:    LDA  3,0(2) 	Save the result in ac
* 
566:     ST  1,-5(1) 	Store old fp in ghost frame
567:    LDC  3,8(0) 	load constant
568:    LDA  2,-1(0) 	Load address of base of array y
569:    SUB  3,2,3 	index off of the base
570:     LD  3,0(3) 	load the value
* Left side will remain in register
571:    LDC  4,50(0) 	load constant
572:    DIV  3,3,4 	op /
573:     ST  3,-7(1) 	Save parameter
574:    LDA  1,-5(1) 	Load address of new frame
575:    LDA  3,1(7) 	Put return address in current accumulator
576:    LDA  7,-566(7) 	Call output
577:    LDA  3,0(2) 	Save the result in ac
* 
578:     ST  1,-5(1) 	Store old fp in ghost frame
579:    LDC  3,8(0) 	load constant
580:    LDA  2,-1(0) 	Load address of base of array y
581:    SUB  3,2,3 	index off of the base
582:     LD  3,0(3) 	load the value
* Left side will remain in register
583:     LD  4,-3(1) 	load variable b
584:    DIV  3,3,4 	op /
585:     ST  3,-7(1) 	Save parameter
586:    LDA  1,-5(1) 	Load address of new frame
587:    LDA  3,1(7) 	Put return address in current accumulator
588:    LDA  7,-578(7) 	Call output
589:    LDA  3,0(2) 	Save the result in ac
* 
590:     ST  1,-5(1) 	Store old fp in ghost frame
591:    LDC  3,210(0) 	load constant
* Left side will remain in register
592:    LDC  4,7(0) 	load constant
593:    DIV  3,3,4 	op /
* Left side will remain in register
594:    LDC  4,3(0) 	load constant
595:    DIV  3,3,4 	op /
596:     ST  3,-7(1) 	Save parameter
597:    LDA  1,-5(1) 	Load address of new frame
598:    LDA  3,1(7) 	Put return address in current accumulator
599:    LDA  7,-589(7) 	Call output
600:    LDA  3,0(2) 	Save the result in ac
* 
601:     ST  1,-5(1) 	Store old fp in ghost frame
602:    LDC  3,211(0) 	load constant
* Left side will remain in register
603:    LDC  4,7(0) 	load constant
604:    DIV  2,3,4 	begin op %
605:    MUL  4,2,4 	
606:    SUB  3,3,4 	end op %
607:     ST  3,-7(1) 	Save parameter
608:    LDA  1,-5(1) 	Load address of new frame
609:    LDA  3,1(7) 	Put return address in current accumulator
610:    LDA  7,-600(7) 	Call output
611:    LDA  3,0(2) 	Save the result in ac
* 
612:     ST  1,-5(1) 	Store old fp in ghost frame
613:    LDC  3,211(0) 	load constant
* Left side will remain in register
614:    LDC  4,6(0) 	load constant
615:    DIV  2,3,4 	begin op %
616:    MUL  4,2,4 	
617:    SUB  3,3,4 	end op %
618:     ST  3,-7(1) 	Save parameter
619:    LDA  1,-5(1) 	Load address of new frame
620:    LDA  3,1(7) 	Put return address in current accumulator
621:    LDA  7,-611(7) 	Call output
622:    LDA  3,0(2) 	Save the result in ac
* 
623:     ST  1,-5(1) 	Store old fp in ghost frame
624:    LDC  3,211(0) 	load constant
* Left side will remain in register
625:    LDC  4,5(0) 	load constant
626:    DIV  2,3,4 	begin op %
627:    MUL  4,2,4 	
628:    SUB  3,3,4 	end op %
629:     ST  3,-7(1) 	Save parameter
630:    LDA  1,-5(1) 	Load address of new frame
631:    LDA  3,1(7) 	Put return address in current accumulator
632:    LDA  7,-622(7) 	Call output
633:    LDA  3,0(2) 	Save the result in ac
* 
634:     ST  1,-5(1) 	Store old fp in ghost frame
635:    LDC  3,211(0) 	load constant
* Left side will remain in register
636:    LDC  4,4(0) 	load constant
637:    DIV  2,3,4 	begin op %
638:    MUL  4,2,4 	
639:    SUB  3,3,4 	end op %
640:     ST  3,-7(1) 	Save parameter
641:    LDA  1,-5(1) 	Load address of new frame
642:    LDA  3,1(7) 	Put return address in current accumulator
643:    LDA  7,-633(7) 	Call output
644:    LDA  3,0(2) 	Save the result in ac
* 
645:     ST  1,-5(1) 	Store old fp in ghost frame
646:    LDC  3,211(0) 	load constant
* Left side will remain in register
647:    LDC  4,100(0) 	load constant
648:    DIV  2,3,4 	begin op %
649:    MUL  4,2,4 	
650:    SUB  3,3,4 	end op %
* Left side will remain in register
651:    LDC  4,3(0) 	load constant
652:    DIV  2,3,4 	begin op %
653:    MUL  4,2,4 	
654:    SUB  3,3,4 	end op %
655:     ST  3,-7(1) 	Save parameter
656:    LDA  1,-5(1) 	Load address of new frame
657:    LDA  3,1(7) 	Put return address in current accumulator
658:    LDA  7,-648(7) 	Call output
659:    LDA  3,0(2) 	Save the result in ac
* 
660:     ST  1,-5(1) 	Store old fp in ghost frame
661:    LDC  3,43(0) 	load constant
662:     ST  3,-4(1) 	store variable c
663:     ST  3,-3(1) 	store variable b
664:     ST  3,-2(1) 	store variable a
665:     ST  3,-7(1) 	Save parameter
666:    LDA  1,-5(1) 	Load address of new frame
667:    LDA  3,1(7) 	Put return address in current accumulator
668:    LDA  7,-658(7) 	Call output
669:    LDA  3,0(2) 	Save the result in ac
* 
670:     ST  1,-5(1) 	Store old fp in ghost frame
671:     LD  3,-2(1) 	load variable a
672:     ST  3,-7(1) 	Save parameter
673:    LDA  1,-5(1) 	Load address of new frame
674:    LDA  3,1(7) 	Put return address in current accumulator
675:    LDA  7,-665(7) 	Call output
676:    LDA  3,0(2) 	Save the result in ac
* 
677:    LDC  3,3(0) 	load constant
678:     ST  3,-3(1) 	store variable b
* Left side will remain in register
679:    LDC  4,4(0) 	load constant
680:     ST  3,-4(1) 	store variable c
681:    MUL  3,3,4 	op *
682:     ST  3,-2(1) 	store variable a
* 
683:     ST  1,-5(1) 	Store old fp in ghost frame
684:     LD  3,-2(1) 	load variable a
685:     ST  3,-7(1) 	Save parameter
686:    LDA  1,-5(1) 	Load address of new frame
687:    LDA  3,1(7) 	Put return address in current accumulator
688:    LDA  7,-678(7) 	Call output
689:    LDA  3,0(2) 	Save the result in ac
* END
* Add standard closing in case there is no return statement
690:    LDC  2,0(0) 	Set return value to 0
691:     LD  3,-1(1) 	Load return address
692:     LD  1,0(1) 	Adjust fp
693:    LDA  7,0(3) 	Return
* End Function main
