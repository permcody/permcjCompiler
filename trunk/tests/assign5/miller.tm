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
* BEGIN function showIntArray
 35:     ST  3,-1(1) 	Store return address. BEGIN FUNC: showIntArray
* BEGIN compound statement
* 8
 36:    LDC  3,0(6) 	Load constant 
 37:     ST  3,-4(1) 	Store variable i
* WHILE
 38:     LD  3,-4(1) 	Load variable i
 39:     ST  3,-5(1) 	Save left side in temp 
 40:     LD  3,-3(1) 	Load variable size
 41:     LD  4,-5(1) 	Load left from temp into ac1 
 42:    SUB  4,4,3 	Op < 
 43:    LDC  3,1(6) 	True case 
 44:    JLT  4,1(7) 	Jump if true 
 45:    LDC  3,0(6) 	False case 
 46:    LDC  4,1(6) 	Load constant 1 
 47:    SUB  3,3,4 	While cond check 
 48:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 10
 50:     ST  1,-5(1) 	Store old fp in ghost frame 
 51:     LD  3,-4(1) 	Load variable i
 52:     LD  4,-2(1) 	Load address of base of array x
 53:    SUB  3,4,3 	Compute offset of value 
 54:     LD  3,0(3) 	Load the value 
 55:     ST  3,-7(1) 	Store parameter 
 56:    LDA  1,-5(1) 	Load address of new frame 
 57:    LDA  3,1(7) 	Return address in ac 
 58:    LDA  7,-48(7) 	call output
 59:    LDA  3,0(2) 	Save the result in ac 
* 11
 60:     LD  3,-4(1) 	Load variable i
 61:     ST  3,-5(1) 	Save left side in temp 
 62:    LDC  3,1(6) 	Load constant 
 63:     LD  4,-5(1) 	Load left from temp into ac1 
 64:    ADD  3,4,3 	Op + 
 65:     ST  3,-4(1) 	Store variable i
* END compound statement
 66:    LDA  7,-29(7) 	go to beginning of loop 
 49:    LDA  7,17(7) 	No more loop 
* ENDWHILE
* 13
 67:     ST  1,-5(1) 	Store old fp in ghost frame 
 68:    LDA  1,-5(1) 	Load address of new frame 
 69:    LDA  3,1(7) 	Return address in ac 
 70:    LDA  7,-41(7) 	call outnl
 71:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
 72:    LDC  2,0(6) 	Set return value to 0 
 73:     LD  3,-1(1) 	Load return address 
 74:     LD  1,0(1) 	Adjust fp 
 75:    LDA  7,0(3) 	Return 
* END of function showIntArray
* BEGIN function dog
 76:     ST  3,-1(1) 	Store return address. BEGIN FUNC: dog
* BEGIN compound statement
* 18
 77:     LD  3,-2(1) 	Load variable a
 78:     ST  3,-2(1) 	Store variable a
* 19
 79:    LDC  3,7(6) 	Load constant 
 80:     ST  3,-4(1) 	Save index in temp 
 81:    LDC  3,9(6) 	Load constant 
 82:     LD  4,-3(1) 	Load address of base of array b
 83:    SUB  3,4,3 	Compute offset of value 
 84:     LD  3,0(3) 	Load the value 
 85:     LD  4,-4(1) 	load index from temp to ac1 
 86:     LD  5,-3(1) 	Load address of base of array b
 87:    SUB  5,5,4 	Compute offset of value 
 88:     ST  3,0(5) 	Store variable b
* 20
 89:     ST  1,-4(1) 	Store old fp in ghost frame 
 90:     LD  3,-2(1) 	Load variable a
 91:     ST  3,-6(1) 	Store parameter 
 92:    LDA  1,-4(1) 	Load address of new frame 
 93:    LDA  3,1(7) 	Return address in ac 
 94:    LDA  7,-84(7) 	call output
 95:    LDA  3,0(2) 	Save the result in ac 
* 21
 96:     ST  1,-4(1) 	Store old fp in ghost frame 
 97:    LDA  1,-4(1) 	Load address of new frame 
 98:    LDA  3,1(7) 	Return address in ac 
 99:    LDA  7,-70(7) 	call outnl
100:    LDA  3,0(2) 	Save the result in ac 
* 22
101:     ST  1,-4(1) 	Store old fp in ghost frame 
102:    LDC  3,7(6) 	Load constant 
103:     LD  4,-3(1) 	Load address of base of array b
104:    SUB  3,4,3 	Compute offset of value 
105:     LD  3,0(3) 	Load the value 
106:     ST  3,-6(1) 	Store parameter 
107:    LDA  1,-4(1) 	Load address of new frame 
108:    LDA  3,1(7) 	Return address in ac 
109:    LDA  7,-99(7) 	call output
110:    LDA  3,0(2) 	Save the result in ac 
* 23
111:     ST  1,-4(1) 	Store old fp in ghost frame 
112:    LDA  1,-4(1) 	Load address of new frame 
113:    LDA  3,1(7) 	Return address in ac 
114:    LDA  7,-85(7) 	call outnl
115:    LDA  3,0(2) 	Save the result in ac 
* 24
116:     ST  1,-4(1) 	Store old fp in ghost frame 
117:    LDA  1,-4(1) 	Load address of new frame 
118:    LDA  3,1(7) 	Return address in ac 
119:    LDA  7,-90(7) 	call outnl
120:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
121:    LDC  2,0(6) 	Set return value to 0 
122:     LD  3,-1(1) 	Load return address 
123:     LD  1,0(1) 	Adjust fp 
124:    LDA  7,0(3) 	Return 
* END of function dog
* BEGIN function getnxtindex
125:     ST  3,-1(1) 	Store return address. BEGIN FUNC: getnxtindex
* BEGIN compound statement
* RETURN
126:     LD  3,-2(1) 	Load variable x
127:     ST  3,-3(1) 	Save left side in temp 
128:    LDC  3,1(6) 	Load constant 
129:     LD  4,-3(1) 	Load left from temp into ac1 
130:    ADD  3,4,3 	Op + 
131:    LDA  2,0(3) 	Copy result to rt register 
132:     LD  3,-1(1) 	Load return address 
133:     LD  1,0(1) 	Adjust fp 
134:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
135:    LDC  2,0(6) 	Set return value to 0 
136:     LD  3,-1(1) 	Load return address 
137:     LD  1,0(1) 	Adjust fp 
138:    LDA  7,0(3) 	Return 
* END of function getnxtindex
* BEGIN function main
  4:    LDA  7,134(7) 	Jump to main 
139:     ST  3,-1(1) 	Store return address. BEGIN FUNC: main
* BEGIN compound statement
* 41
140:    LDC  3,0(6) 	Load constant 
141:     ST  3,-55(1) 	Save index in temp 
142:    LDC  3,3(6) 	Load constant 
143:     LD  4,-55(1) 	load index from temp to ac1 
144:    LDA  5,-3(1) 	Load address of base of array c
145:    SUB  5,5,4 	Compute offset of value 
146:     ST  3,0(5) 	Store variable c
* 42
147:    LDC  3,3(6) 	Load constant 
148:     ST  3,-55(1) 	Save index in temp 
149:    LDC  3,5(6) 	Load constant 
150:     LD  4,-55(1) 	load index from temp to ac1 
151:    LDA  5,-13(1) 	Load address of base of array d
152:    SUB  5,5,4 	Compute offset of value 
153:     ST  3,0(5) 	Store variable d
* 43
154:    LDC  3,4(6) 	Load constant 
155:     ST  3,-55(1) 	Save index in temp 
156:    LDC  3,9(6) 	Load constant 
157:     LD  4,-55(1) 	load index from temp to ac1 
158:    LDA  5,-13(1) 	Load address of base of array d
159:    SUB  5,5,4 	Compute offset of value 
160:     ST  3,0(5) 	Store variable d
* 44
161:    LDC  3,5(6) 	Load constant 
162:     ST  3,-55(1) 	Save index in temp 
163:    LDC  3,100(6) 	Load constant 
164:     LD  4,-55(1) 	load index from temp to ac1 
165:    LDA  5,-23(1) 	Load address of base of array y
166:    SUB  5,5,4 	Compute offset of value 
167:     ST  3,0(5) 	Store variable y
* 45
168:    LDC  3,9(6) 	Load constant 
169:     ST  3,-55(1) 	Save index in temp 
170:    LDC  3,50(6) 	Load constant 
171:     LD  4,-55(1) 	load index from temp to ac1 
172:    LDA  5,-43(1) 	Load address of base of array w
173:    SUB  5,5,4 	Compute offset of value 
174:     ST  3,0(5) 	Store variable w
* 46
175:     ST  1,-55(1) 	Store old fp in ghost frame 
176:    LDC  3,5(6) 	Load constant 
177:    LDA  4,-23(1) 	Load address of base of array y
178:    SUB  3,4,3 	Compute offset of value 
179:     LD  3,0(3) 	Load the value 
180:     ST  3,-57(1) 	Store parameter 
181:    LDA  3,-43(1) 	Load address of base of array w
182:     ST  3,-58(1) 	Store parameter 
183:    LDA  1,-55(1) 	Load address of new frame 
184:    LDA  3,1(7) 	Return address in ac 
185:    LDA  7,-110(7) 	call dog
186:    LDA  3,0(2) 	Save the result in ac 
* 48
187:    LDC  3,9(6) 	Load constant 
188:     ST  3,-55(1) 	Save index in temp 
189:    LDC  3,12(6) 	Load constant 
190:     LD  4,-55(1) 	load index from temp to ac1 
191:    LDA  5,-43(1) 	Load address of base of array w
192:    SUB  5,5,4 	Compute offset of value 
193:     ST  3,0(5) 	Store variable w
* 49
194:     ST  1,-55(1) 	Store old fp in ghost frame 
195:    LDC  3,3(6) 	Load constant 
196:    LDA  4,-13(1) 	Load address of base of array d
197:    SUB  3,4,3 	Compute offset of value 
198:     LD  3,0(3) 	Load the value 
199:    LDA  4,-23(1) 	Load address of base of array y
200:    SUB  3,4,3 	Compute offset of value 
201:     LD  3,0(3) 	Load the value 
202:     ST  3,-57(1) 	Store parameter 
203:    LDA  3,-43(1) 	Load address of base of array w
204:     ST  3,-58(1) 	Store parameter 
205:    LDA  1,-55(1) 	Load address of new frame 
206:    LDA  3,1(7) 	Return address in ac 
207:    LDA  7,-132(7) 	call dog
208:    LDA  3,0(2) 	Save the result in ac 
* 51
209:    LDC  3,8(6) 	Load constant 
210:     ST  3,-55(1) 	Save index in temp 
211:    LDC  3,4(6) 	Load constant 
212:     LD  4,-55(1) 	load index from temp to ac1 
213:    LDA  5,-3(1) 	Load address of base of array c
214:    SUB  5,5,4 	Compute offset of value 
215:     ST  3,0(5) 	Store variable c
* 52
216:    LDC  3,9(6) 	Load constant 
217:     ST  3,-55(1) 	Save index in temp 
218:    LDC  3,25(6) 	Load constant 
219:     LD  4,-55(1) 	load index from temp to ac1 
220:    LDA  5,-3(1) 	Load address of base of array c
221:    SUB  5,5,4 	Compute offset of value 
222:     ST  3,0(5) 	Store variable c
* 53
223:    LDC  3,9(6) 	Load constant 
224:     ST  3,-55(1) 	Save index in temp 
225:    LDC  3,66(6) 	Load constant 
226:     LD  4,-55(1) 	load index from temp to ac1 
227:    LDA  5,-23(1) 	Load address of base of array y
228:    SUB  5,5,4 	Compute offset of value 
229:     ST  3,0(5) 	Store variable y
* 54
230:     ST  1,-55(1) 	Store old fp in ghost frame 
231:    LDC  3,8(6) 	Load constant 
232:    LDA  4,-3(1) 	Load address of base of array c
233:    SUB  3,4,3 	Compute offset of value 
234:     LD  3,0(3) 	Load the value 
235:    LDA  4,-13(1) 	Load address of base of array d
236:    SUB  3,4,3 	Compute offset of value 
237:     LD  3,0(3) 	Load the value 
238:    LDA  4,-23(1) 	Load address of base of array y
239:    SUB  3,4,3 	Compute offset of value 
240:     LD  3,0(3) 	Load the value 
241:     ST  3,-57(1) 	Store parameter 
242:    LDA  3,-3(1) 	Load address of base of array c
243:     ST  3,-58(1) 	Store parameter 
244:    LDA  1,-55(1) 	Load address of new frame 
245:    LDA  3,1(7) 	Return address in ac 
246:    LDA  7,-171(7) 	call dog
247:    LDA  3,0(2) 	Save the result in ac 
* 56
248:    LDC  3,777(6) 	Load constant 
249:     ST  3,-2(1) 	Store variable x
* 57
250:    LDC  3,7(6) 	Load constant 
251:     ST  3,-55(1) 	Save index in temp 
252:    LDC  3,123(6) 	Load constant 
253:     LD  4,-55(1) 	load index from temp to ac1 
254:    LDA  5,-23(1) 	Load address of base of array y
255:    SUB  5,5,4 	Compute offset of value 
256:     ST  3,0(5) 	Store variable y
* 58
257:    LDC  3,9(6) 	Load constant 
258:     ST  3,-55(1) 	Save index in temp 
259:    LDC  3,7(6) 	Load constant 
260:    LDA  4,-23(1) 	Load address of base of array y
261:    SUB  3,4,3 	Compute offset of value 
262:     LD  3,0(3) 	Load the value 
263:     LD  4,-55(1) 	load index from temp to ac1 
264:    LDA  5,-23(1) 	Load address of base of array y
265:    SUB  5,5,4 	Compute offset of value 
266:     ST  3,0(5) 	Store variable y
* 59
267:     ST  1,-55(1) 	Store old fp in ghost frame 
268:     LD  3,-2(1) 	Load variable x
269:     ST  3,-57(1) 	Store parameter 
270:    LDA  3,-23(1) 	Load address of base of array y
271:     ST  3,-58(1) 	Store parameter 
272:    LDA  1,-55(1) 	Load address of new frame 
273:    LDA  3,1(7) 	Return address in ac 
274:    LDA  7,-199(7) 	call dog
275:    LDA  3,0(2) 	Save the result in ac 
* 61
276:     LD  3,-2(1) 	Load variable x
277:     ST  3,-2(1) 	Store variable x
* 63
278:    LDC  3,9(6) 	Load constant 
279:     ST  3,-55(1) 	Save index in temp 
280:     LD  3,-2(1) 	Load variable x
281:     LD  4,-55(1) 	load index from temp to ac1 
282:    LDA  5,-3(1) 	Load address of base of array c
283:    SUB  5,5,4 	Compute offset of value 
284:     ST  3,0(5) 	Store variable c
* 64
285:    LDC  3,888(6) 	Load constant 
286:     ST  3,-10(0) 	Store variable glx
* 65
287:    LDC  3,7(6) 	Load constant 
288:     ST  3,-55(1) 	Save index in temp 
289:     LD  3,-10(0) 	Load variable glx
290:     LD  4,-55(1) 	load index from temp to ac1 
291:    LDA  5,-23(1) 	Load address of base of array y
292:    SUB  5,5,4 	Compute offset of value 
293:     ST  3,0(5) 	Store variable y
* 66
294:    LDC  3,6(6) 	Load constant 
295:     ST  3,-55(1) 	Save index in temp 
296:    LDC  3,2(6) 	Load constant 
297:     LD  4,-55(1) 	load index from temp to ac1 
298:    LDA  5,-13(1) 	Load address of base of array d
299:    SUB  5,5,4 	Compute offset of value 
300:     ST  3,0(5) 	Store variable d
* 67
301:    LDC  3,2(6) 	Load constant 
302:     ST  3,-55(1) 	Save index in temp 
303:    LDC  3,4(6) 	Load constant 
304:     LD  4,-55(1) 	load index from temp to ac1 
305:    LDA  5,-3(1) 	Load address of base of array c
306:    SUB  5,5,4 	Compute offset of value 
307:     ST  3,0(5) 	Store variable c
* 68
308:    LDC  3,4(6) 	Load constant 
309:     ST  3,-55(1) 	Save index in temp 
310:    LDC  3,7(6) 	Load constant 
311:     LD  4,-55(1) 	load index from temp to ac1 
312:    LDA  5,-13(1) 	Load address of base of array d
313:    SUB  5,5,4 	Compute offset of value 
314:     ST  3,0(5) 	Store variable d
* 69
315:    LDC  3,2(6) 	Load constant 
316:     ST  3,-55(1) 	Save index in temp 
317:    LDC  3,6(6) 	Load constant 
318:    LDA  4,-13(1) 	Load address of base of array d
319:    SUB  3,4,3 	Compute offset of value 
320:     LD  3,0(3) 	Load the value 
321:    LDA  4,-3(1) 	Load address of base of array c
322:    SUB  3,4,3 	Compute offset of value 
323:     LD  3,0(3) 	Load the value 
324:    LDA  4,-13(1) 	Load address of base of array d
325:    SUB  3,4,3 	Compute offset of value 
326:     LD  3,0(3) 	Load the value 
327:    LDA  4,-23(1) 	Load address of base of array y
328:    SUB  3,4,3 	Compute offset of value 
329:     LD  3,0(3) 	Load the value 
330:     LD  4,-55(1) 	load index from temp to ac1 
331:    LDA  5,-13(1) 	Load address of base of array d
332:    SUB  5,5,4 	Compute offset of value 
333:     ST  3,0(5) 	Store variable d
* 70
334:     ST  1,-55(1) 	Store old fp in ghost frame 
335:    LDC  3,8(6) 	Load constant 
336:    LDA  4,-3(1) 	Load address of base of array c
337:    SUB  3,4,3 	Compute offset of value 
338:     LD  3,0(3) 	Load the value 
339:    LDA  4,-13(1) 	Load address of base of array d
340:    SUB  3,4,3 	Compute offset of value 
341:     LD  3,0(3) 	Load the value 
342:    LDA  4,-23(1) 	Load address of base of array y
343:    SUB  3,4,3 	Compute offset of value 
344:     LD  3,0(3) 	Load the value 
345:     ST  3,-57(1) 	Store parameter 
346:    LDA  3,-3(1) 	Load address of base of array c
347:     ST  3,-58(1) 	Store parameter 
348:    LDA  1,-55(1) 	Load address of new frame 
349:    LDA  3,1(7) 	Return address in ac 
350:    LDA  7,-275(7) 	call dog
351:    LDA  3,0(2) 	Save the result in ac 
* 72
352:    LDC  3,2(6) 	Load constant 
353:     ST  3,-55(1) 	Save index in temp 
354:    LDC  3,3(6) 	Load constant 
355:    LDA  4,-3(1) 	Load address of base of array c
356:    SUB  3,4,3 	Compute offset of value 
357:     LD  3,0(3) 	Load the value 
358:     LD  4,-55(1) 	load index from temp to ac1 
359:    LDA  5,-13(1) 	Load address of base of array d
360:    SUB  5,5,4 	Compute offset of value 
361:     ST  3,0(5) 	Store variable d
* 73
362:    LDC  3,7(6) 	Load constant 
363:     ST  3,-55(1) 	Save index in temp 
364:    LDC  3,9(6) 	Load constant 
365:    LDA  4,-23(1) 	Load address of base of array y
366:    SUB  3,4,3 	Compute offset of value 
367:     LD  3,0(3) 	Load the value 
368:     LD  4,-55(1) 	load index from temp to ac1 
369:    LDA  5,-23(1) 	Load address of base of array y
370:    SUB  5,5,4 	Compute offset of value 
371:     ST  3,0(5) 	Store variable y
* 74
372:    LDC  3,2(6) 	Load constant 
373:     ST  3,-55(1) 	Save index in temp 
374:    LDC  3,3(6) 	Load constant 
375:     LD  4,-55(1) 	load index from temp to ac1 
376:    LDA  5,0(0) 	Load address of base of array gl
377:    SUB  5,5,4 	Compute offset of value 
378:     ST  3,0(5) 	Store variable gl
* 75
379:    LDC  3,2(6) 	Load constant 
380:    LDA  4,0(0) 	Load address of base of array gl
381:    SUB  3,4,3 	Compute offset of value 
382:     LD  3,0(3) 	Load the value 
383:     ST  3,-2(1) 	Store variable x
* 76
384:    LDC  3,7(6) 	Load constant 
385:     ST  3,-55(1) 	Save index in temp 
386:    LDC  3,9(6) 	Load constant 
387:    LDA  4,0(0) 	Load address of base of array gl
388:    SUB  3,4,3 	Compute offset of value 
389:     LD  3,0(3) 	Load the value 
390:     LD  4,-55(1) 	load index from temp to ac1 
391:    LDA  5,-23(1) 	Load address of base of array y
392:    SUB  5,5,4 	Compute offset of value 
393:     ST  3,0(5) 	Store variable y
* 77
394:    LDC  3,7(6) 	Load constant 
395:     ST  3,-55(1) 	Save index in temp 
396:    LDC  3,9(6) 	Load constant 
397:    LDA  4,-23(1) 	Load address of base of array y
398:    SUB  3,4,3 	Compute offset of value 
399:     LD  3,0(3) 	Load the value 
400:     LD  4,-55(1) 	load index from temp to ac1 
401:    LDA  5,0(0) 	Load address of base of array gl
402:    SUB  5,5,4 	Compute offset of value 
403:     ST  3,0(5) 	Store variable gl
* 78
404:    LDC  3,0(6) 	Load constant 
405:     ST  3,-55(1) 	Save index in temp 
406:    LDC  3,5(6) 	Load constant 
407:     LD  4,-55(1) 	load index from temp to ac1 
408:    LDA  5,-23(1) 	Load address of base of array y
409:    SUB  5,5,4 	Compute offset of value 
410:     ST  3,0(5) 	Store variable y
* 79
411:    LDC  3,5(6) 	Load constant 
412:     ST  3,-55(1) 	Save index in temp 
413:    LDC  3,3(6) 	Load constant 
414:     LD  4,-55(1) 	load index from temp to ac1 
415:    LDA  5,-13(1) 	Load address of base of array d
416:    SUB  5,5,4 	Compute offset of value 
417:     ST  3,0(5) 	Store variable d
* 80
418:    LDC  3,8(6) 	Load constant 
419:     ST  3,-55(1) 	Save index in temp 
420:    LDC  3,0(6) 	Load constant 
421:    LDA  4,-23(1) 	Load address of base of array y
422:    SUB  3,4,3 	Compute offset of value 
423:     LD  3,0(3) 	Load the value 
424:    LDA  4,-13(1) 	Load address of base of array d
425:    SUB  3,4,3 	Compute offset of value 
426:     LD  3,0(3) 	Load the value 
427:     LD  4,-55(1) 	load index from temp to ac1 
428:    LDA  5,-3(1) 	Load address of base of array c
429:    SUB  5,5,4 	Compute offset of value 
430:     ST  3,0(5) 	Store variable c
* 81
431:     ST  1,-55(1) 	Store old fp in ghost frame 
432:    LDC  3,8(6) 	Load constant 
433:    LDA  4,-3(1) 	Load address of base of array c
434:    SUB  3,4,3 	Compute offset of value 
435:     LD  3,0(3) 	Load the value 
436:     ST  3,-57(1) 	Store parameter 
437:    LDA  1,-55(1) 	Load address of new frame 
438:    LDA  3,1(7) 	Return address in ac 
439:    LDA  7,-429(7) 	call output
440:    LDA  3,0(2) 	Save the result in ac 
* 81
441:     ST  1,-55(1) 	Store old fp in ghost frame 
442:    LDA  1,-55(1) 	Load address of new frame 
443:    LDA  3,1(7) 	Return address in ac 
444:    LDA  7,-415(7) 	call outnl
445:    LDA  3,0(2) 	Save the result in ac 
* 82
446:    LDC  3,3(6) 	Load constant 
447:     ST  3,-55(1) 	Save index in temp 
448:    LDC  3,4(6) 	Load constant 
449:     LD  4,-55(1) 	load index from temp to ac1 
450:    LDA  5,-13(1) 	Load address of base of array d
451:    SUB  5,5,4 	Compute offset of value 
452:     ST  3,0(5) 	Store variable d
* 83
453:    LDC  3,4(6) 	Load constant 
454:     ST  3,-55(1) 	Save index in temp 
455:    LDC  3,987(6) 	Load constant 
456:     LD  4,-55(1) 	load index from temp to ac1 
457:    LDA  5,-23(1) 	Load address of base of array y
458:    SUB  5,5,4 	Compute offset of value 
459:     ST  3,0(5) 	Store variable y
* 84
460:    LDC  3,9(6) 	Load constant 
461:     ST  3,-55(1) 	Save index in temp 
462:    LDC  3,9(6) 	Load constant 
463:    LDA  4,-3(1) 	Load address of base of array c
464:    SUB  3,4,3 	Compute offset of value 
465:     LD  3,0(3) 	Load the value 
466:     ST  3,-56(1) 	Save left side in temp 
467:    LDC  3,3(6) 	Load constant 
468:     LD  4,-56(1) 	Load left from temp into ac1 
469:    SUB  3,4,3 	Op - 
470:     LD  4,-55(1) 	load index from temp to ac1 
471:    LDA  5,-3(1) 	Load address of base of array c
472:    SUB  5,5,4 	Compute offset of value 
473:     ST  3,0(5) 	Store variable c
* 86
474:     ST  1,-55(1) 	Store old fp in ghost frame 
475:    LDC  3,8(6) 	Load constant 
476:    LDA  4,-3(1) 	Load address of base of array c
477:    SUB  3,4,3 	Compute offset of value 
478:     LD  3,0(3) 	Load the value 
479:    LDA  4,-13(1) 	Load address of base of array d
480:    SUB  3,4,3 	Compute offset of value 
481:     LD  3,0(3) 	Load the value 
482:    LDA  4,-23(1) 	Load address of base of array y
483:    SUB  3,4,3 	Compute offset of value 
484:     LD  3,0(3) 	Load the value 
485:     ST  3,-57(1) 	Store parameter 
486:    LDA  3,-3(1) 	Load address of base of array c
487:     ST  3,-58(1) 	Store parameter 
488:    LDA  1,-55(1) 	Load address of new frame 
489:    LDA  3,1(7) 	Return address in ac 
490:    LDA  7,-415(7) 	call dog
491:    LDA  3,0(2) 	Save the result in ac 
* 88
492:     LD  3,-2(1) 	Load variable x
493:     ST  3,-55(1) 	Save left side in temp 
494:    LDC  3,9(6) 	Load constant 
495:    LDA  4,-3(1) 	Load address of base of array c
496:    SUB  3,4,3 	Compute offset of value 
497:     LD  3,0(3) 	Load the value 
498:     LD  4,-55(1) 	Load left from temp into ac1 
499:    ADD  3,4,3 	Op + 
500:     ST  3,-2(1) 	Store variable x
* 89
501:     LD  3,-2(1) 	Load variable x
502:     ST  3,-55(1) 	Save left side in temp 
503:    LDC  3,9(6) 	Load constant 
504:    LDA  4,-3(1) 	Load address of base of array c
505:    SUB  3,4,3 	Compute offset of value 
506:     LD  3,0(3) 	Load the value 
507:     LD  4,-55(1) 	Load left from temp into ac1 
508:    SUB  3,4,3 	Op - 
509:     ST  3,-2(1) 	Store variable x
* 90
510:    LDC  3,8(6) 	Load constant 
511:     ST  3,-55(1) 	Save index in temp 
512:    LDC  3,8(6) 	Load constant 
513:     LD  4,-55(1) 	load index from temp to ac1 
514:    LDA  5,-23(1) 	Load address of base of array y
515:    SUB  5,5,4 	Compute offset of value 
516:     ST  3,0(5) 	Store variable y
* 91
517:    LDC  3,9(6) 	Load constant 
518:     ST  3,-55(1) 	Save index in temp 
519:     ST  1,-56(1) 	Store old fp in ghost frame 
520:    LDC  3,7(6) 	Load constant 
521:     ST  3,-58(1) 	Store parameter 
522:    LDA  1,-56(1) 	Load address of new frame 
523:    LDA  3,1(7) 	Return address in ac 
524:    LDA  7,-400(7) 	call getnxtindex
525:    LDA  3,0(2) 	Save the result in ac 
526:    LDA  4,-23(1) 	Load address of base of array y
527:    SUB  3,4,3 	Compute offset of value 
528:     LD  3,0(3) 	Load the value 
529:     ST  3,-56(1) 	Save left side in temp 
530:    LDC  3,1(6) 	Load constant 
531:     LD  4,-56(1) 	Load left from temp into ac1 
532:    ADD  3,4,3 	Op + 
533:     LD  4,-55(1) 	load index from temp to ac1 
534:    LDA  5,-23(1) 	Load address of base of array y
535:    SUB  5,5,4 	Compute offset of value 
536:     ST  3,0(5) 	Store variable y
* 93
537:     ST  1,-55(1) 	Store old fp in ghost frame 
538:    LDC  3,4(6) 	Load constant 
539:    LDA  4,-23(1) 	Load address of base of array y
540:    SUB  3,4,3 	Compute offset of value 
541:     LD  3,0(3) 	Load the value 
542:     ST  3,-57(1) 	Store parameter 
543:    LDA  3,-23(1) 	Load address of base of array y
544:     ST  3,-58(1) 	Store parameter 
545:    LDA  1,-55(1) 	Load address of new frame 
546:    LDA  3,1(7) 	Return address in ac 
547:    LDA  7,-472(7) 	call dog
548:    LDA  3,0(2) 	Save the result in ac 
* 95
549:    LDC  3,5(6) 	Load constant 
550:     ST  3,-55(1) 	Save index in temp 
551:    LDC  3,0(6) 	Load constant 
552:     LD  4,-55(1) 	load index from temp to ac1 
553:    LDA  5,-3(1) 	Load address of base of array c
554:    SUB  5,5,4 	Compute offset of value 
555:     ST  3,0(5) 	Store variable c
* 96
556:    LDC  3,0(6) 	Load constant 
557:     ST  3,-55(1) 	Save index in temp 
558:    LDC  3,3(6) 	Load constant 
559:     LD  4,-55(1) 	load index from temp to ac1 
560:    LDA  5,-43(1) 	Load address of base of array w
561:    SUB  5,5,4 	Compute offset of value 
562:     ST  3,0(5) 	Store variable w
* 97
563:    LDC  3,3(6) 	Load constant 
564:     ST  3,-55(1) 	Save index in temp 
565:    LDC  3,9(6) 	Load constant 
566:     LD  4,-55(1) 	load index from temp to ac1 
567:    LDA  5,-33(1) 	Load address of base of array z
568:    SUB  5,5,4 	Compute offset of value 
569:     ST  3,0(5) 	Store variable z
* 98
570:    LDC  3,9(6) 	Load constant 
571:     ST  3,-55(1) 	Save index in temp 
572:    LDC  3,1(6) 	Load constant 
573:     LD  4,-55(1) 	load index from temp to ac1 
574:    LDA  5,-23(1) 	Load address of base of array y
575:    SUB  5,5,4 	Compute offset of value 
576:     ST  3,0(5) 	Store variable y
* 100
577:    LDC  3,5(6) 	Load constant 
578:    LDA  4,-3(1) 	Load address of base of array c
579:    SUB  3,4,3 	Compute offset of value 
580:     LD  3,0(3) 	Load the value 
581:    LDA  4,-43(1) 	Load address of base of array w
582:    SUB  3,4,3 	Compute offset of value 
583:     LD  3,0(3) 	Load the value 
584:    LDA  4,-33(1) 	Load address of base of array z
585:    SUB  3,4,3 	Compute offset of value 
586:     LD  3,0(3) 	Load the value 
587:    LDA  4,-23(1) 	Load address of base of array y
588:    SUB  3,4,3 	Compute offset of value 
589:     LD  3,0(3) 	Load the value 
590:     ST  3,-55(1) 	Save index in temp 
591:    LDC  3,77(6) 	Load constant 
592:     LD  4,-55(1) 	load index from temp to ac1 
593:    LDA  5,-13(1) 	Load address of base of array d
594:    SUB  5,5,4 	Compute offset of value 
595:     ST  3,0(5) 	Store variable d
* 101
596:    LDC  3,9(6) 	Load constant 
597:     ST  3,-55(1) 	Save index in temp 
598:    LDC  3,1(6) 	Load constant 
599:    LDA  4,-13(1) 	Load address of base of array d
600:    SUB  3,4,3 	Compute offset of value 
601:     LD  3,0(3) 	Load the value 
602:     LD  4,-55(1) 	load index from temp to ac1 
603:    LDA  5,-3(1) 	Load address of base of array c
604:    SUB  5,5,4 	Compute offset of value 
605:     ST  3,0(5) 	Store variable c
* 103
606:     ST  1,-55(1) 	Store old fp in ghost frame 
607:    LDC  3,66(6) 	Load constant 
608:     ST  3,-57(1) 	Store parameter 
609:    LDA  3,-3(1) 	Load address of base of array c
610:     ST  3,-58(1) 	Store parameter 
611:    LDA  1,-55(1) 	Load address of new frame 
612:    LDA  3,1(7) 	Return address in ac 
613:    LDA  7,-538(7) 	call dog
614:    LDA  3,0(2) 	Save the result in ac 
* BEGIN compound statement
* 108
615:    LDC  3,0(6) 	Load constant 
616:     ST  3,-53(1) 	Store variable p
* WHILE
617:     LD  3,-53(1) 	Load variable p
618:     ST  3,-55(1) 	Save left side in temp 
619:    LDC  3,10(6) 	Load constant 
620:     LD  4,-55(1) 	Load left from temp into ac1 
621:    SUB  4,4,3 	Op < 
622:    LDC  3,1(6) 	True case 
623:    JLT  4,1(7) 	Jump if true 
624:    LDC  3,0(6) 	False case 
625:    LDC  4,1(6) 	Load constant 1 
626:    SUB  3,3,4 	While cond check 
627:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 110
629:     LD  3,-53(1) 	Load variable p
630:     ST  3,-54(1) 	Store variable q
* 111
631:    LDC  3,9(6) 	Load constant 
632:     ST  3,-55(1) 	Save left side in temp 
633:     LD  3,-54(1) 	Load variable q
634:     LD  4,-55(1) 	Load left from temp into ac1 
635:    SUB  3,4,3 	Op - 
636:     ST  3,-55(1) 	Save index in temp 
637:     LD  3,-53(1) 	Load variable p
638:     ST  3,-56(1) 	Save left side in temp 
639:    LDC  3,1(6) 	Load constant 
640:     LD  4,-56(1) 	Load left from temp into ac1 
641:    ADD  3,4,3 	Op + 
642:     ST  3,-53(1) 	Store variable p
643:     LD  4,-55(1) 	load index from temp to ac1 
644:    LDA  5,-3(1) 	Load address of base of array c
645:    SUB  5,5,4 	Compute offset of value 
646:     ST  3,0(5) 	Store variable c
* END compound statement
647:    LDA  7,-31(7) 	go to beginning of loop 
628:    LDA  7,19(7) 	No more loop 
* ENDWHILE
* END compound statement
* 115
648:     ST  1,-55(1) 	Store old fp in ghost frame 
649:    LDA  3,-3(1) 	Load address of base of array c
650:     ST  3,-57(1) 	Store parameter 
651:    LDC  3,10(6) 	Load constant 
652:     ST  3,-58(1) 	Store parameter 
653:    LDA  1,-55(1) 	Load address of new frame 
654:    LDA  3,1(7) 	Return address in ac 
655:    LDA  7,-621(7) 	call showIntArray
656:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
657:    LDC  2,0(6) 	Set return value to 0 
658:     LD  3,-1(1) 	Load return address 
659:     LD  1,0(1) 	Adjust fp 
660:    LDA  7,0(3) 	Return 
* END of function main
