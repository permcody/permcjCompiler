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
* 4
 36:     ST  1,-2(1) 	Store old fp in ghost frame 
 37:    LDC  3,111(6) 	Load constant 
 38:     ST  3,-4(1) 	Save left side in temp 
 39:    LDC  3,222(6) 	Load constant 
 40:     LD  4,-4(1) 	Load left from temp into ac1 
 41:    SUB  4,4,3 	Op <= 
 42:    LDC  3,1(6) 	True case 
 43:    JLE  4,1(7) 	Jump if true 
 44:    LDC  3,0(6) 	False case 
 45:     ST  3,-4(1) 	Store parameter 
 46:    LDA  1,-2(1) 	Load address of new frame 
 47:    LDA  3,1(7) 	Return address in ac 
 48:    LDA  7,-26(7) 	call outputb
 49:    LDA  3,0(2) 	Save the result in ac 
* 5
 50:     ST  1,-2(1) 	Store old fp in ghost frame 
 51:    LDC  3,222(6) 	Load constant 
 52:     ST  3,-4(1) 	Save left side in temp 
 53:    LDC  3,111(6) 	Load constant 
 54:     LD  4,-4(1) 	Load left from temp into ac1 
 55:    SUB  4,4,3 	Op <= 
 56:    LDC  3,1(6) 	True case 
 57:    JLE  4,1(7) 	Jump if true 
 58:    LDC  3,0(6) 	False case 
 59:     ST  3,-4(1) 	Store parameter 
 60:    LDA  1,-2(1) 	Load address of new frame 
 61:    LDA  3,1(7) 	Return address in ac 
 62:    LDA  7,-40(7) 	call outputb
 63:    LDA  3,0(2) 	Save the result in ac 
* 6
 64:     ST  1,-2(1) 	Store old fp in ghost frame 
 65:    LDC  3,111(6) 	Load constant 
 66:     ST  3,-4(1) 	Save left side in temp 
 67:    LDC  3,111(6) 	Load constant 
 68:     LD  4,-4(1) 	Load left from temp into ac1 
 69:    SUB  4,4,3 	Op <= 
 70:    LDC  3,1(6) 	True case 
 71:    JLE  4,1(7) 	Jump if true 
 72:    LDC  3,0(6) 	False case 
 73:     ST  3,-4(1) 	Store parameter 
 74:    LDA  1,-2(1) 	Load address of new frame 
 75:    LDA  3,1(7) 	Return address in ac 
 76:    LDA  7,-54(7) 	call outputb
 77:    LDA  3,0(2) 	Save the result in ac 
* 7
 78:     ST  1,-2(1) 	Store old fp in ghost frame 
 79:    LDA  1,-2(1) 	Load address of new frame 
 80:    LDA  3,1(7) 	Return address in ac 
 81:    LDA  7,-52(7) 	call outnl
 82:    LDA  3,0(2) 	Save the result in ac 
* 9
 83:     ST  1,-2(1) 	Store old fp in ghost frame 
 84:    LDC  3,111(6) 	Load constant 
 85:     ST  3,-4(1) 	Save left side in temp 
 86:    LDC  3,222(6) 	Load constant 
 87:     LD  4,-4(1) 	Load left from temp into ac1 
 88:    SUB  4,4,3 	Op < 
 89:    LDC  3,1(6) 	True case 
 90:    JLT  4,1(7) 	Jump if true 
 91:    LDC  3,0(6) 	False case 
 92:     ST  3,-4(1) 	Store parameter 
 93:    LDA  1,-2(1) 	Load address of new frame 
 94:    LDA  3,1(7) 	Return address in ac 
 95:    LDA  7,-73(7) 	call outputb
 96:    LDA  3,0(2) 	Save the result in ac 
* 10
 97:     ST  1,-2(1) 	Store old fp in ghost frame 
 98:    LDC  3,222(6) 	Load constant 
 99:     ST  3,-4(1) 	Save left side in temp 
100:    LDC  3,111(6) 	Load constant 
101:     LD  4,-4(1) 	Load left from temp into ac1 
102:    SUB  4,4,3 	Op < 
103:    LDC  3,1(6) 	True case 
104:    JLT  4,1(7) 	Jump if true 
105:    LDC  3,0(6) 	False case 
106:     ST  3,-4(1) 	Store parameter 
107:    LDA  1,-2(1) 	Load address of new frame 
108:    LDA  3,1(7) 	Return address in ac 
109:    LDA  7,-87(7) 	call outputb
110:    LDA  3,0(2) 	Save the result in ac 
* 11
111:     ST  1,-2(1) 	Store old fp in ghost frame 
112:    LDC  3,111(6) 	Load constant 
113:     ST  3,-4(1) 	Save left side in temp 
114:    LDC  3,111(6) 	Load constant 
115:     LD  4,-4(1) 	Load left from temp into ac1 
116:    SUB  4,4,3 	Op < 
117:    LDC  3,1(6) 	True case 
118:    JLT  4,1(7) 	Jump if true 
119:    LDC  3,0(6) 	False case 
120:     ST  3,-4(1) 	Store parameter 
121:    LDA  1,-2(1) 	Load address of new frame 
122:    LDA  3,1(7) 	Return address in ac 
123:    LDA  7,-101(7) 	call outputb
124:    LDA  3,0(2) 	Save the result in ac 
* 12
125:     ST  1,-2(1) 	Store old fp in ghost frame 
126:    LDA  1,-2(1) 	Load address of new frame 
127:    LDA  3,1(7) 	Return address in ac 
128:    LDA  7,-99(7) 	call outnl
129:    LDA  3,0(2) 	Save the result in ac 
* 14
130:     ST  1,-2(1) 	Store old fp in ghost frame 
131:    LDC  3,111(6) 	Load constant 
132:     ST  3,-4(1) 	Save left side in temp 
133:    LDC  3,222(6) 	Load constant 
134:     LD  4,-4(1) 	Load left from temp into ac1 
135:    SUB  4,4,3 	Op > 
136:    LDC  3,1(6) 	True case 
137:    JGT  4,1(7) 	Jump if true 
138:    LDC  3,0(6) 	False case 
139:     ST  3,-4(1) 	Store parameter 
140:    LDA  1,-2(1) 	Load address of new frame 
141:    LDA  3,1(7) 	Return address in ac 
142:    LDA  7,-120(7) 	call outputb
143:    LDA  3,0(2) 	Save the result in ac 
* 15
144:     ST  1,-2(1) 	Store old fp in ghost frame 
145:    LDC  3,222(6) 	Load constant 
146:     ST  3,-4(1) 	Save left side in temp 
147:    LDC  3,111(6) 	Load constant 
148:     LD  4,-4(1) 	Load left from temp into ac1 
149:    SUB  4,4,3 	Op > 
150:    LDC  3,1(6) 	True case 
151:    JGT  4,1(7) 	Jump if true 
152:    LDC  3,0(6) 	False case 
153:     ST  3,-4(1) 	Store parameter 
154:    LDA  1,-2(1) 	Load address of new frame 
155:    LDA  3,1(7) 	Return address in ac 
156:    LDA  7,-134(7) 	call outputb
157:    LDA  3,0(2) 	Save the result in ac 
* 16
158:     ST  1,-2(1) 	Store old fp in ghost frame 
159:    LDC  3,111(6) 	Load constant 
160:     ST  3,-4(1) 	Save left side in temp 
161:    LDC  3,111(6) 	Load constant 
162:     LD  4,-4(1) 	Load left from temp into ac1 
163:    SUB  4,4,3 	Op > 
164:    LDC  3,1(6) 	True case 
165:    JGT  4,1(7) 	Jump if true 
166:    LDC  3,0(6) 	False case 
167:     ST  3,-4(1) 	Store parameter 
168:    LDA  1,-2(1) 	Load address of new frame 
169:    LDA  3,1(7) 	Return address in ac 
170:    LDA  7,-148(7) 	call outputb
171:    LDA  3,0(2) 	Save the result in ac 
* 17
172:     ST  1,-2(1) 	Store old fp in ghost frame 
173:    LDA  1,-2(1) 	Load address of new frame 
174:    LDA  3,1(7) 	Return address in ac 
175:    LDA  7,-146(7) 	call outnl
176:    LDA  3,0(2) 	Save the result in ac 
* 19
177:     ST  1,-2(1) 	Store old fp in ghost frame 
178:    LDC  3,111(6) 	Load constant 
179:     ST  3,-4(1) 	Save left side in temp 
180:    LDC  3,222(6) 	Load constant 
181:     LD  4,-4(1) 	Load left from temp into ac1 
182:    SUB  4,4,3 	Op >= 
183:    LDC  3,1(6) 	True case 
184:    JGE  4,1(7) 	Jump if true 
185:    LDC  3,0(6) 	False case 
186:     ST  3,-4(1) 	Store parameter 
187:    LDA  1,-2(1) 	Load address of new frame 
188:    LDA  3,1(7) 	Return address in ac 
189:    LDA  7,-167(7) 	call outputb
190:    LDA  3,0(2) 	Save the result in ac 
* 20
191:     ST  1,-2(1) 	Store old fp in ghost frame 
192:    LDC  3,222(6) 	Load constant 
193:     ST  3,-4(1) 	Save left side in temp 
194:    LDC  3,111(6) 	Load constant 
195:     LD  4,-4(1) 	Load left from temp into ac1 
196:    SUB  4,4,3 	Op >= 
197:    LDC  3,1(6) 	True case 
198:    JGE  4,1(7) 	Jump if true 
199:    LDC  3,0(6) 	False case 
200:     ST  3,-4(1) 	Store parameter 
201:    LDA  1,-2(1) 	Load address of new frame 
202:    LDA  3,1(7) 	Return address in ac 
203:    LDA  7,-181(7) 	call outputb
204:    LDA  3,0(2) 	Save the result in ac 
* 21
205:     ST  1,-2(1) 	Store old fp in ghost frame 
206:    LDC  3,111(6) 	Load constant 
207:     ST  3,-4(1) 	Save left side in temp 
208:    LDC  3,111(6) 	Load constant 
209:     LD  4,-4(1) 	Load left from temp into ac1 
210:    SUB  4,4,3 	Op >= 
211:    LDC  3,1(6) 	True case 
212:    JGE  4,1(7) 	Jump if true 
213:    LDC  3,0(6) 	False case 
214:     ST  3,-4(1) 	Store parameter 
215:    LDA  1,-2(1) 	Load address of new frame 
216:    LDA  3,1(7) 	Return address in ac 
217:    LDA  7,-195(7) 	call outputb
218:    LDA  3,0(2) 	Save the result in ac 
* 22
219:     ST  1,-2(1) 	Store old fp in ghost frame 
220:    LDA  1,-2(1) 	Load address of new frame 
221:    LDA  3,1(7) 	Return address in ac 
222:    LDA  7,-193(7) 	call outnl
223:    LDA  3,0(2) 	Save the result in ac 
* 24
224:     ST  1,-2(1) 	Store old fp in ghost frame 
225:    LDC  3,111(6) 	Load constant 
226:     ST  3,-4(1) 	Save left side in temp 
227:    LDC  3,222(6) 	Load constant 
228:     LD  4,-4(1) 	Load left from temp into ac1 
229:    SUB  4,4,3 	Op == 
230:    LDC  3,1(6) 	True case 
231:    JEQ  4,1(7) 	Jump if true 
232:    LDC  3,0(6) 	False case 
233:     ST  3,-4(1) 	Store parameter 
234:    LDA  1,-2(1) 	Load address of new frame 
235:    LDA  3,1(7) 	Return address in ac 
236:    LDA  7,-214(7) 	call outputb
237:    LDA  3,0(2) 	Save the result in ac 
* 25
238:     ST  1,-2(1) 	Store old fp in ghost frame 
239:    LDC  3,222(6) 	Load constant 
240:     ST  3,-4(1) 	Save left side in temp 
241:    LDC  3,111(6) 	Load constant 
242:     LD  4,-4(1) 	Load left from temp into ac1 
243:    SUB  4,4,3 	Op == 
244:    LDC  3,1(6) 	True case 
245:    JEQ  4,1(7) 	Jump if true 
246:    LDC  3,0(6) 	False case 
247:     ST  3,-4(1) 	Store parameter 
248:    LDA  1,-2(1) 	Load address of new frame 
249:    LDA  3,1(7) 	Return address in ac 
250:    LDA  7,-228(7) 	call outputb
251:    LDA  3,0(2) 	Save the result in ac 
* 26
252:     ST  1,-2(1) 	Store old fp in ghost frame 
253:    LDC  3,111(6) 	Load constant 
254:     ST  3,-4(1) 	Save left side in temp 
255:    LDC  3,111(6) 	Load constant 
256:     LD  4,-4(1) 	Load left from temp into ac1 
257:    SUB  4,4,3 	Op == 
258:    LDC  3,1(6) 	True case 
259:    JEQ  4,1(7) 	Jump if true 
260:    LDC  3,0(6) 	False case 
261:     ST  3,-4(1) 	Store parameter 
262:    LDA  1,-2(1) 	Load address of new frame 
263:    LDA  3,1(7) 	Return address in ac 
264:    LDA  7,-242(7) 	call outputb
265:    LDA  3,0(2) 	Save the result in ac 
* 27
266:     ST  1,-2(1) 	Store old fp in ghost frame 
267:    LDA  1,-2(1) 	Load address of new frame 
268:    LDA  3,1(7) 	Return address in ac 
269:    LDA  7,-240(7) 	call outnl
270:    LDA  3,0(2) 	Save the result in ac 
* 29
271:     ST  1,-2(1) 	Store old fp in ghost frame 
272:    LDC  3,111(6) 	Load constant 
273:     ST  3,-4(1) 	Save left side in temp 
274:    LDC  3,222(6) 	Load constant 
275:     LD  4,-4(1) 	Load left from temp into ac1 
276:    SUB  3,4,3 	Op != 
277:    JEQ  3,1(7) 	Jump if true 
278:    LDC  3,1(6) 	True case 
279:     ST  3,-4(1) 	Store parameter 
280:    LDA  1,-2(1) 	Load address of new frame 
281:    LDA  3,1(7) 	Return address in ac 
282:    LDA  7,-260(7) 	call outputb
283:    LDA  3,0(2) 	Save the result in ac 
* 30
284:     ST  1,-2(1) 	Store old fp in ghost frame 
285:    LDC  3,222(6) 	Load constant 
286:     ST  3,-4(1) 	Save left side in temp 
287:    LDC  3,111(6) 	Load constant 
288:     LD  4,-4(1) 	Load left from temp into ac1 
289:    SUB  3,4,3 	Op != 
290:    JEQ  3,1(7) 	Jump if true 
291:    LDC  3,1(6) 	True case 
292:     ST  3,-4(1) 	Store parameter 
293:    LDA  1,-2(1) 	Load address of new frame 
294:    LDA  3,1(7) 	Return address in ac 
295:    LDA  7,-273(7) 	call outputb
296:    LDA  3,0(2) 	Save the result in ac 
* 31
297:     ST  1,-2(1) 	Store old fp in ghost frame 
298:    LDC  3,111(6) 	Load constant 
299:     ST  3,-4(1) 	Save left side in temp 
300:    LDC  3,111(6) 	Load constant 
301:     LD  4,-4(1) 	Load left from temp into ac1 
302:    SUB  3,4,3 	Op != 
303:    JEQ  3,1(7) 	Jump if true 
304:    LDC  3,1(6) 	True case 
305:     ST  3,-4(1) 	Store parameter 
306:    LDA  1,-2(1) 	Load address of new frame 
307:    LDA  3,1(7) 	Return address in ac 
308:    LDA  7,-286(7) 	call outputb
309:    LDA  3,0(2) 	Save the result in ac 
* 32
310:     ST  1,-2(1) 	Store old fp in ghost frame 
311:    LDA  1,-2(1) 	Load address of new frame 
312:    LDA  3,1(7) 	Return address in ac 
313:    LDA  7,-284(7) 	call outnl
314:    LDA  3,0(2) 	Save the result in ac 
* 34
315:     ST  1,-2(1) 	Store old fp in ghost frame 
316:    LDC  3,111(6) 	Load constant 
317:     ST  3,-4(1) 	Save left side in temp 
318:    LDC  3,222(6) 	Load constant 
319:     LD  4,-4(1) 	Load left from temp into ac1 
320:    SUB  3,4,3 	Op != 
321:    JEQ  3,1(7) 	Jump if true 
322:    LDC  3,1(6) 	True case 
323:     ST  3,-4(1) 	Store parameter 
324:    LDA  1,-2(1) 	Load address of new frame 
325:    LDA  3,1(7) 	Return address in ac 
326:    LDA  7,-304(7) 	call outputb
327:    LDA  3,0(2) 	Save the result in ac 
* 35
328:     ST  1,-2(1) 	Store old fp in ghost frame 
329:    LDC  3,222(6) 	Load constant 
330:     ST  3,-4(1) 	Save left side in temp 
331:    LDC  3,111(6) 	Load constant 
332:     LD  4,-4(1) 	Load left from temp into ac1 
333:    SUB  3,4,3 	Op != 
334:    JEQ  3,1(7) 	Jump if true 
335:    LDC  3,1(6) 	True case 
336:     ST  3,-4(1) 	Store parameter 
337:    LDA  1,-2(1) 	Load address of new frame 
338:    LDA  3,1(7) 	Return address in ac 
339:    LDA  7,-317(7) 	call outputb
340:    LDA  3,0(2) 	Save the result in ac 
* 36
341:     ST  1,-2(1) 	Store old fp in ghost frame 
342:    LDC  3,111(6) 	Load constant 
343:     ST  3,-4(1) 	Save left side in temp 
344:    LDC  3,111(6) 	Load constant 
345:     LD  4,-4(1) 	Load left from temp into ac1 
346:    SUB  3,4,3 	Op != 
347:    JEQ  3,1(7) 	Jump if true 
348:    LDC  3,1(6) 	True case 
349:     ST  3,-4(1) 	Store parameter 
350:    LDA  1,-2(1) 	Load address of new frame 
351:    LDA  3,1(7) 	Return address in ac 
352:    LDA  7,-330(7) 	call outputb
353:    LDA  3,0(2) 	Save the result in ac 
* 37
354:     ST  1,-2(1) 	Store old fp in ghost frame 
355:    LDA  1,-2(1) 	Load address of new frame 
356:    LDA  3,1(7) 	Return address in ac 
357:    LDA  7,-328(7) 	call outnl
358:    LDA  3,0(2) 	Save the result in ac 
* 39
359:     ST  1,-2(1) 	Store old fp in ghost frame 
360:    LDC  3,0(6) 	Load constant 
361:     ST  3,-4(1) 	Save left side in temp 
362:    LDC  3,0(6) 	Load constant 
363:     LD  4,-4(1) 	Load left from temp into ac1 
364:    JEQ  3,3(7) 	Jump if false for Op && 
365:    LDC  3,0(6) 	False case 
366:    JEQ  4,1(7) 	Jump if false 
367:    LDC  3,1(6) 	True case 
368:     ST  3,-4(1) 	Store parameter 
369:    LDA  1,-2(1) 	Load address of new frame 
370:    LDA  3,1(7) 	Return address in ac 
371:    LDA  7,-349(7) 	call outputb
372:    LDA  3,0(2) 	Save the result in ac 
* 40
373:     ST  1,-2(1) 	Store old fp in ghost frame 
374:    LDC  3,0(6) 	Load constant 
375:     ST  3,-4(1) 	Save left side in temp 
376:    LDC  3,1(6) 	Load constant 
377:     LD  4,-4(1) 	Load left from temp into ac1 
378:    JEQ  3,3(7) 	Jump if false for Op && 
379:    LDC  3,0(6) 	False case 
380:    JEQ  4,1(7) 	Jump if false 
381:    LDC  3,1(6) 	True case 
382:     ST  3,-4(1) 	Store parameter 
383:    LDA  1,-2(1) 	Load address of new frame 
384:    LDA  3,1(7) 	Return address in ac 
385:    LDA  7,-363(7) 	call outputb
386:    LDA  3,0(2) 	Save the result in ac 
* 41
387:     ST  1,-2(1) 	Store old fp in ghost frame 
388:    LDC  3,1(6) 	Load constant 
389:     ST  3,-4(1) 	Save left side in temp 
390:    LDC  3,0(6) 	Load constant 
391:     LD  4,-4(1) 	Load left from temp into ac1 
392:    JEQ  3,3(7) 	Jump if false for Op && 
393:    LDC  3,0(6) 	False case 
394:    JEQ  4,1(7) 	Jump if false 
395:    LDC  3,1(6) 	True case 
396:     ST  3,-4(1) 	Store parameter 
397:    LDA  1,-2(1) 	Load address of new frame 
398:    LDA  3,1(7) 	Return address in ac 
399:    LDA  7,-377(7) 	call outputb
400:    LDA  3,0(2) 	Save the result in ac 
* 42
401:     ST  1,-2(1) 	Store old fp in ghost frame 
402:    LDC  3,1(6) 	Load constant 
403:     ST  3,-4(1) 	Save left side in temp 
404:    LDC  3,1(6) 	Load constant 
405:     LD  4,-4(1) 	Load left from temp into ac1 
406:    JEQ  3,3(7) 	Jump if false for Op && 
407:    LDC  3,0(6) 	False case 
408:    JEQ  4,1(7) 	Jump if false 
409:    LDC  3,1(6) 	True case 
410:     ST  3,-4(1) 	Store parameter 
411:    LDA  1,-2(1) 	Load address of new frame 
412:    LDA  3,1(7) 	Return address in ac 
413:    LDA  7,-391(7) 	call outputb
414:    LDA  3,0(2) 	Save the result in ac 
* 43
415:     ST  1,-2(1) 	Store old fp in ghost frame 
416:    LDA  1,-2(1) 	Load address of new frame 
417:    LDA  3,1(7) 	Return address in ac 
418:    LDA  7,-389(7) 	call outnl
419:    LDA  3,0(2) 	Save the result in ac 
* 45
420:     ST  1,-2(1) 	Store old fp in ghost frame 
421:    LDC  3,0(6) 	Load constant 
422:     ST  3,-4(1) 	Save left side in temp 
423:    LDC  3,0(6) 	Load constant 
424:     LD  4,-4(1) 	Load left from temp into ac1 
425:    ADD  3,4,3 	Op || 
426:    JEQ  3,1(7) 	Jump if false 
427:    LDC  3,1(6) 	True case 
428:     ST  3,-4(1) 	Store parameter 
429:    LDA  1,-2(1) 	Load address of new frame 
430:    LDA  3,1(7) 	Return address in ac 
431:    LDA  7,-409(7) 	call outputb
432:    LDA  3,0(2) 	Save the result in ac 
* 46
433:     ST  1,-2(1) 	Store old fp in ghost frame 
434:    LDC  3,0(6) 	Load constant 
435:     ST  3,-4(1) 	Save left side in temp 
436:    LDC  3,1(6) 	Load constant 
437:     LD  4,-4(1) 	Load left from temp into ac1 
438:    ADD  3,4,3 	Op || 
439:    JEQ  3,1(7) 	Jump if false 
440:    LDC  3,1(6) 	True case 
441:     ST  3,-4(1) 	Store parameter 
442:    LDA  1,-2(1) 	Load address of new frame 
443:    LDA  3,1(7) 	Return address in ac 
444:    LDA  7,-422(7) 	call outputb
445:    LDA  3,0(2) 	Save the result in ac 
* 47
446:     ST  1,-2(1) 	Store old fp in ghost frame 
447:    LDC  3,1(6) 	Load constant 
448:     ST  3,-4(1) 	Save left side in temp 
449:    LDC  3,0(6) 	Load constant 
450:     LD  4,-4(1) 	Load left from temp into ac1 
451:    ADD  3,4,3 	Op || 
452:    JEQ  3,1(7) 	Jump if false 
453:    LDC  3,1(6) 	True case 
454:     ST  3,-4(1) 	Store parameter 
455:    LDA  1,-2(1) 	Load address of new frame 
456:    LDA  3,1(7) 	Return address in ac 
457:    LDA  7,-435(7) 	call outputb
458:    LDA  3,0(2) 	Save the result in ac 
* 48
459:     ST  1,-2(1) 	Store old fp in ghost frame 
460:    LDC  3,1(6) 	Load constant 
461:     ST  3,-4(1) 	Save left side in temp 
462:    LDC  3,1(6) 	Load constant 
463:     LD  4,-4(1) 	Load left from temp into ac1 
464:    ADD  3,4,3 	Op || 
465:    JEQ  3,1(7) 	Jump if false 
466:    LDC  3,1(6) 	True case 
467:     ST  3,-4(1) 	Store parameter 
468:    LDA  1,-2(1) 	Load address of new frame 
469:    LDA  3,1(7) 	Return address in ac 
470:    LDA  7,-448(7) 	call outputb
471:    LDA  3,0(2) 	Save the result in ac 
* 49
472:     ST  1,-2(1) 	Store old fp in ghost frame 
473:    LDA  1,-2(1) 	Load address of new frame 
474:    LDA  3,1(7) 	Return address in ac 
475:    LDA  7,-446(7) 	call outnl
476:    LDA  3,0(2) 	Save the result in ac 
* 51
477:     ST  1,-2(1) 	Store old fp in ghost frame 
478:    LDC  3,0(6) 	Load constant 
479:    LDC  4,1(6) 	Load 1 
480:    SUB  3,4,3 	Op ! 
481:     ST  3,-4(1) 	Store parameter 
482:    LDA  1,-2(1) 	Load address of new frame 
483:    LDA  3,1(7) 	Return address in ac 
484:    LDA  7,-462(7) 	call outputb
485:    LDA  3,0(2) 	Save the result in ac 
* 52
486:     ST  1,-2(1) 	Store old fp in ghost frame 
487:    LDC  3,1(6) 	Load constant 
488:    LDC  4,1(6) 	Load 1 
489:    SUB  3,4,3 	Op ! 
490:     ST  3,-4(1) 	Store parameter 
491:    LDA  1,-2(1) 	Load address of new frame 
492:    LDA  3,1(7) 	Return address in ac 
493:    LDA  7,-471(7) 	call outputb
494:    LDA  3,0(2) 	Save the result in ac 
* 53
495:     ST  1,-2(1) 	Store old fp in ghost frame 
496:    LDA  1,-2(1) 	Load address of new frame 
497:    LDA  3,1(7) 	Return address in ac 
498:    LDA  7,-469(7) 	call outnl
499:    LDA  3,0(2) 	Save the result in ac 
* 55
500:     ST  1,-2(1) 	Store old fp in ghost frame 
501:    LDC  3,333(6) 	Load constant 
502:     ST  3,-4(1) 	Save left side in temp 
503:    LDC  3,444(6) 	Load constant 
504:     LD  4,-4(1) 	Load left from temp into ac1 
505:    ADD  3,4,3 	Op + 
506:     ST  3,-4(1) 	Store parameter 
507:    LDA  1,-2(1) 	Load address of new frame 
508:    LDA  3,1(7) 	Return address in ac 
509:    LDA  7,-499(7) 	call output
510:    LDA  3,0(2) 	Save the result in ac 
* 56
511:     ST  1,-2(1) 	Store old fp in ghost frame 
512:    LDC  3,333(6) 	Load constant 
513:     ST  3,-4(1) 	Save left side in temp 
514:    LDC  3,444(6) 	Load constant 
515:     LD  4,-4(1) 	Load left from temp into ac1 
516:    SUB  3,4,3 	Op - 
517:     ST  3,-4(1) 	Store parameter 
518:    LDA  1,-2(1) 	Load address of new frame 
519:    LDA  3,1(7) 	Return address in ac 
520:    LDA  7,-510(7) 	call output
521:    LDA  3,0(2) 	Save the result in ac 
* 57
522:     ST  1,-2(1) 	Store old fp in ghost frame 
523:    LDC  3,333(6) 	Load constant 
524:     ST  3,-4(1) 	Save left side in temp 
525:    LDC  3,444(6) 	Load constant 
526:     LD  4,-4(1) 	Load left from temp into ac1 
527:    MUL  3,4,3 	Op * 
528:     ST  3,-4(1) 	Store parameter 
529:    LDA  1,-2(1) 	Load address of new frame 
530:    LDA  3,1(7) 	Return address in ac 
531:    LDA  7,-521(7) 	call output
532:    LDA  3,0(2) 	Save the result in ac 
* 58
533:     ST  1,-2(1) 	Store old fp in ghost frame 
534:    LDC  3,333(6) 	Load constant 
535:     ST  3,-4(1) 	Save left side in temp 
536:    LDC  3,444(6) 	Load constant 
537:     LD  4,-4(1) 	Load left from temp into ac1 
538:    DIV  3,4,3 	Op / 
539:     ST  3,-4(1) 	Store parameter 
540:    LDA  1,-2(1) 	Load address of new frame 
541:    LDA  3,1(7) 	Return address in ac 
542:    LDA  7,-532(7) 	call output
543:    LDA  3,0(2) 	Save the result in ac 
* 59
544:     ST  1,-2(1) 	Store old fp in ghost frame 
545:    LDC  3,3333(6) 	Load constant 
546:     ST  3,-4(1) 	Save left side in temp 
547:    LDC  3,444(6) 	Load constant 
548:     LD  4,-4(1) 	Load left from temp into ac1 
549:    DIV  5,4,3 	Op % 
550:    MUL  5,5,3 	 
551:    SUB  3,4,5 	 
552:     ST  3,-4(1) 	Store parameter 
553:    LDA  1,-2(1) 	Load address of new frame 
554:    LDA  3,1(7) 	Return address in ac 
555:    LDA  7,-545(7) 	call output
556:    LDA  3,0(2) 	Save the result in ac 
* 60
557:     ST  1,-2(1) 	Store old fp in ghost frame 
558:    LDC  3,444(6) 	Load constant 
559:    LDC  4,0(6) 	Load 0 
560:    SUB  3,4,3 	Op unary - 
561:     ST  3,-4(1) 	Store parameter 
562:    LDA  1,-2(1) 	Load address of new frame 
563:    LDA  3,1(7) 	Return address in ac 
564:    LDA  7,-554(7) 	call output
565:    LDA  3,0(2) 	Save the result in ac 
* RETURN
566:    LDA  2,0(3) 	Copy result to rt register 
567:     LD  3,-1(1) 	Load return address 
568:     LD  1,0(1) 	Adjust fp 
569:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
570:    LDC  2,0(6) 	Set return value to 0 
571:     LD  3,-1(1) 	Load return address 
572:     LD  1,0(1) 	Adjust fp 
573:    LDA  7,0(3) 	Return 
* END of function main
