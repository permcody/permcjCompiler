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
* BEGIN function showInt
 35:     ST  3,-1(1) 	Store return address. BEGIN FUNC: showInt
* BEGIN compound statement
* 4
 36:     ST  1,-3(1) 	Store old fp in ghost frame 
 37:     LD  3,-2(1) 	Load variable x
 38:     ST  3,-5(1) 	Store parameter 
 39:    LDA  1,-3(1) 	Load address of new frame 
 40:    LDA  3,1(7) 	Return address in ac 
 41:    LDA  7,-31(7) 	call output
 42:    LDA  3,0(2) 	Save the result in ac 
* 5
 43:     ST  1,-3(1) 	Store old fp in ghost frame 
 44:    LDA  1,-3(1) 	Load address of new frame 
 45:    LDA  3,1(7) 	Return address in ac 
 46:    LDA  7,-17(7) 	call outnl
 47:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
 48:    LDC  2,0(6) 	Set return value to 0 
 49:     LD  3,-1(1) 	Load return address 
 50:     LD  1,0(1) 	Adjust fp 
 51:    LDA  7,0(3) 	Return 
* END of function showInt
* BEGIN function showIntArray
 52:     ST  3,-1(1) 	Store return address. BEGIN FUNC: showIntArray
* BEGIN compound statement
* 11
 53:    LDC  3,0(6) 	Load constant 
 54:     ST  3,-4(1) 	Store variable i
* WHILE
 55:     LD  3,-4(1) 	Load variable i
 56:     ST  3,-5(1) 	Save left side in temp 
 57:     LD  3,-3(1) 	Load variable size
 58:     LD  4,-5(1) 	Load left from temp into ac1 
 59:    SUB  4,4,3 	Op < 
 60:    LDC  3,1(6) 	True case 
 61:    JLT  4,1(7) 	Jump if true 
 62:    LDC  3,0(6) 	False case 
 63:    LDC  4,1(6) 	Load constant 1 
 64:    SUB  3,3,4 	While cond check 
 65:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 13
 67:     ST  1,-5(1) 	Store old fp in ghost frame 
 68:     LD  3,-4(1) 	Load variable i
 69:     LD  4,-2(1) 	Load address of base of array x
 70:    SUB  3,4,3 	Compute offset of value 
 71:     LD  3,0(3) 	Load the value 
 72:     ST  3,-7(1) 	Store parameter 
 73:    LDA  1,-5(1) 	Load address of new frame 
 74:    LDA  3,1(7) 	Return address in ac 
 75:    LDA  7,-65(7) 	call output
 76:    LDA  3,0(2) 	Save the result in ac 
* 14
 77:     LD  3,-4(1) 	Load variable i
 78:     ST  3,-5(1) 	Save left side in temp 
 79:    LDC  3,1(6) 	Load constant 
 80:     LD  4,-5(1) 	Load left from temp into ac1 
 81:    ADD  3,4,3 	Op + 
 82:     ST  3,-4(1) 	Store variable i
* END compound statement
 83:    LDA  7,-29(7) 	go to beginning of loop 
 66:    LDA  7,17(7) 	No more loop 
* ENDWHILE
* 16
 84:     ST  1,-5(1) 	Store old fp in ghost frame 
 85:    LDA  1,-5(1) 	Load address of new frame 
 86:    LDA  3,1(7) 	Return address in ac 
 87:    LDA  7,-58(7) 	call outnl
 88:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
 89:    LDC  2,0(6) 	Set return value to 0 
 90:     LD  3,-1(1) 	Load return address 
 91:     LD  1,0(1) 	Adjust fp 
 92:    LDA  7,0(3) 	Return 
* END of function showIntArray
* BEGIN function showBool
 93:     ST  3,-1(1) 	Store return address. BEGIN FUNC: showBool
* BEGIN compound statement
* 21
 94:     ST  1,-3(1) 	Store old fp in ghost frame 
 95:     LD  3,-2(1) 	Load variable x
 96:     ST  3,-5(1) 	Store parameter 
 97:    LDA  1,-3(1) 	Load address of new frame 
 98:    LDA  3,1(7) 	Return address in ac 
 99:    LDA  7,-77(7) 	call outputb
100:    LDA  3,0(2) 	Save the result in ac 
* 22
101:     ST  1,-3(1) 	Store old fp in ghost frame 
102:    LDA  1,-3(1) 	Load address of new frame 
103:    LDA  3,1(7) 	Return address in ac 
104:    LDA  7,-75(7) 	call outnl
105:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
106:    LDC  2,0(6) 	Set return value to 0 
107:     LD  3,-1(1) 	Load return address 
108:     LD  1,0(1) 	Adjust fp 
109:    LDA  7,0(3) 	Return 
* END of function showBool
* BEGIN function truth
110:     ST  3,-1(1) 	Store return address. BEGIN FUNC: truth
* BEGIN compound statement
* RETURN
111:    LDC  3,1(6) 	Load constant 
112:    LDA  2,0(3) 	Copy result to rt register 
113:     LD  3,-1(1) 	Load return address 
114:     LD  1,0(1) 	Adjust fp 
115:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
116:    LDC  2,0(6) 	Set return value to 0 
117:     LD  3,-1(1) 	Load return address 
118:     LD  1,0(1) 	Adjust fp 
119:    LDA  7,0(3) 	Return 
* END of function truth
* BEGIN function magic
120:     ST  3,-1(1) 	Store return address. BEGIN FUNC: magic
* BEGIN compound statement
* RETURN
121:    LDC  3,666(6) 	Load constant 
122:    LDA  2,0(3) 	Copy result to rt register 
123:     LD  3,-1(1) 	Load return address 
124:     LD  1,0(1) 	Adjust fp 
125:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
126:    LDC  2,0(6) 	Set return value to 0 
127:     LD  3,-1(1) 	Load return address 
128:     LD  1,0(1) 	Adjust fp 
129:    LDA  7,0(3) 	Return 
* END of function magic
* BEGIN function sqr
130:     ST  3,-1(1) 	Store return address. BEGIN FUNC: sqr
* BEGIN compound statement
* RETURN
131:     LD  3,-2(1) 	Load variable x
132:     ST  3,-3(1) 	Save left side in temp 
133:     LD  3,-2(1) 	Load variable x
134:     LD  4,-3(1) 	Load left from temp into ac1 
135:    MUL  3,4,3 	Op * 
136:    LDA  2,0(3) 	Copy result to rt register 
137:     LD  3,-1(1) 	Load return address 
138:     LD  1,0(1) 	Adjust fp 
139:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
140:    LDC  2,0(6) 	Set return value to 0 
141:     LD  3,-1(1) 	Load return address 
142:     LD  1,0(1) 	Adjust fp 
143:    LDA  7,0(3) 	Return 
* END of function sqr
* BEGIN function add
144:     ST  3,-1(1) 	Store return address. BEGIN FUNC: add
* BEGIN compound statement
* RETURN
145:     LD  3,-2(1) 	Load variable x
146:     ST  3,-4(1) 	Save left side in temp 
147:     LD  3,-3(1) 	Load variable y
148:     LD  4,-4(1) 	Load left from temp into ac1 
149:    ADD  3,4,3 	Op + 
150:    LDA  2,0(3) 	Copy result to rt register 
151:     LD  3,-1(1) 	Load return address 
152:     LD  1,0(1) 	Adjust fp 
153:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
154:    LDC  2,0(6) 	Set return value to 0 
155:     LD  3,-1(1) 	Load return address 
156:     LD  1,0(1) 	Adjust fp 
157:    LDA  7,0(3) 	Return 
* END of function add
* BEGIN function mul
158:     ST  3,-1(1) 	Store return address. BEGIN FUNC: mul
* BEGIN compound statement
* RETURN
159:     LD  3,-2(1) 	Load variable x
160:     ST  3,-4(1) 	Save left side in temp 
161:     LD  3,-3(1) 	Load variable y
162:     LD  4,-4(1) 	Load left from temp into ac1 
163:    MUL  3,4,3 	Op * 
164:    LDA  2,0(3) 	Copy result to rt register 
165:     LD  3,-1(1) 	Load return address 
166:     LD  1,0(1) 	Adjust fp 
167:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
168:    LDC  2,0(6) 	Set return value to 0 
169:     LD  3,-1(1) 	Load return address 
170:     LD  1,0(1) 	Adjust fp 
171:    LDA  7,0(3) 	Return 
* END of function mul
* BEGIN function caller
172:     ST  3,-1(1) 	Store return address. BEGIN FUNC: caller
* BEGIN compound statement
* 57
173:    LDC  3,666(6) 	Load constant 
174:     ST  3,-5(1) 	Store variable a
* 58
175:    LDC  3,777(6) 	Load constant 
176:     ST  3,0(0) 	Store variable g
* 60
177:     ST  1,-6(1) 	Store old fp in ghost frame 
178:     LD  3,-2(1) 	Load variable x
179:     ST  3,-8(1) 	Store parameter 
180:    LDA  1,-6(1) 	Load address of new frame 
181:    LDA  3,1(7) 	Return address in ac 
182:    LDA  7,-53(7) 	call sqr
183:    LDA  3,0(2) 	Save the result in ac 
184:     ST  3,-4(1) 	Store variable z
* 61
185:     ST  1,-6(1) 	Store old fp in ghost frame 
186:     LD  3,-4(1) 	Load variable z
187:     ST  3,-8(1) 	Store parameter 
188:    LDA  1,-6(1) 	Load address of new frame 
189:    LDA  3,1(7) 	Return address in ac 
190:    LDA  7,-180(7) 	call output
191:    LDA  3,0(2) 	Save the result in ac 
* 62
192:     ST  1,-6(1) 	Store old fp in ghost frame 
193:    LDA  1,-6(1) 	Load address of new frame 
194:    LDA  3,1(7) 	Return address in ac 
195:    LDA  7,-166(7) 	call outnl
196:    LDA  3,0(2) 	Save the result in ac 
* 64
197:     ST  1,-6(1) 	Store old fp in ghost frame 
198:    LDC  3,7(6) 	Load constant 
199:     LD  4,-3(1) 	Load address of base of array y
200:    SUB  3,4,3 	Compute offset of value 
201:     LD  3,0(3) 	Load the value 
202:     ST  3,-8(1) 	Store parameter 
203:    LDA  1,-6(1) 	Load address of new frame 
204:    LDA  3,1(7) 	Return address in ac 
205:    LDA  7,-76(7) 	call sqr
206:    LDA  3,0(2) 	Save the result in ac 
207:     ST  3,-4(1) 	Store variable z
* 65
208:     ST  1,-6(1) 	Store old fp in ghost frame 
209:     LD  3,-4(1) 	Load variable z
210:     ST  3,-8(1) 	Store parameter 
211:    LDA  1,-6(1) 	Load address of new frame 
212:    LDA  3,1(7) 	Return address in ac 
213:    LDA  7,-203(7) 	call output
214:    LDA  3,0(2) 	Save the result in ac 
* 66
215:     ST  1,-6(1) 	Store old fp in ghost frame 
216:    LDA  1,-6(1) 	Load address of new frame 
217:    LDA  3,1(7) 	Return address in ac 
218:    LDA  7,-189(7) 	call outnl
219:    LDA  3,0(2) 	Save the result in ac 
* 68
220:     ST  1,-6(1) 	Store old fp in ghost frame 
221:     LD  3,-5(1) 	Load variable a
222:     ST  3,-8(1) 	Store parameter 
223:    LDA  1,-6(1) 	Load address of new frame 
224:    LDA  3,1(7) 	Return address in ac 
225:    LDA  7,-96(7) 	call sqr
226:    LDA  3,0(2) 	Save the result in ac 
227:     ST  3,-4(1) 	Store variable z
* 69
228:     ST  1,-6(1) 	Store old fp in ghost frame 
229:     LD  3,-4(1) 	Load variable z
230:     ST  3,-8(1) 	Store parameter 
231:    LDA  1,-6(1) 	Load address of new frame 
232:    LDA  3,1(7) 	Return address in ac 
233:    LDA  7,-223(7) 	call output
234:    LDA  3,0(2) 	Save the result in ac 
* 70
235:     ST  1,-6(1) 	Store old fp in ghost frame 
236:    LDA  1,-6(1) 	Load address of new frame 
237:    LDA  3,1(7) 	Return address in ac 
238:    LDA  7,-209(7) 	call outnl
239:    LDA  3,0(2) 	Save the result in ac 
* 72
240:     ST  1,-6(1) 	Store old fp in ghost frame 
241:     LD  3,0(0) 	Load variable g
242:     ST  3,-8(1) 	Store parameter 
243:    LDA  1,-6(1) 	Load address of new frame 
244:    LDA  3,1(7) 	Return address in ac 
245:    LDA  7,-116(7) 	call sqr
246:    LDA  3,0(2) 	Save the result in ac 
247:     ST  3,-4(1) 	Store variable z
* 73
248:     ST  1,-6(1) 	Store old fp in ghost frame 
249:     LD  3,-4(1) 	Load variable z
250:     ST  3,-8(1) 	Store parameter 
251:    LDA  1,-6(1) 	Load address of new frame 
252:    LDA  3,1(7) 	Return address in ac 
253:    LDA  7,-243(7) 	call output
254:    LDA  3,0(2) 	Save the result in ac 
* 74
255:     ST  1,-6(1) 	Store old fp in ghost frame 
256:    LDA  1,-6(1) 	Load address of new frame 
257:    LDA  3,1(7) 	Return address in ac 
258:    LDA  7,-229(7) 	call outnl
259:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
260:    LDC  2,0(6) 	Set return value to 0 
261:     LD  3,-1(1) 	Load return address 
262:     LD  1,0(1) 	Adjust fp 
263:    LDA  7,0(3) 	Return 
* END of function caller
* BEGIN function swap
264:     ST  3,-1(1) 	Store return address. BEGIN FUNC: swap
* BEGIN compound statement
* 81
265:     LD  3,-3(1) 	Load variable z1
266:     LD  4,-2(1) 	Load address of base of array x
267:    SUB  3,4,3 	Compute offset of value 
268:     LD  3,0(3) 	Load the value 
269:     ST  3,-5(1) 	Store variable tmp
* 82
270:     LD  3,-3(1) 	Load variable z1
271:     ST  3,-6(1) 	Save index in temp 
272:     LD  3,-4(1) 	Load variable z2
273:     LD  4,-2(1) 	Load address of base of array x
274:    SUB  3,4,3 	Compute offset of value 
275:     LD  3,0(3) 	Load the value 
276:     LD  4,-6(1) 	load index from temp to ac1 
277:     LD  5,-2(1) 	Load address of base of array x
278:    SUB  5,5,4 	Compute offset of value 
279:     ST  3,0(5) 	Store variable x
* 83
280:     LD  3,-4(1) 	Load variable z2
281:     ST  3,-6(1) 	Save index in temp 
282:     LD  3,-5(1) 	Load variable tmp
283:     LD  4,-6(1) 	load index from temp to ac1 
284:     LD  5,-2(1) 	Load address of base of array x
285:    SUB  5,5,4 	Compute offset of value 
286:     ST  3,0(5) 	Store variable x
* END compound statement
* Add standard closing in case there is no return statement
287:    LDC  2,0(6) 	Set return value to 0 
288:     LD  3,-1(1) 	Load return address 
289:     LD  1,0(1) 	Adjust fp 
290:    LDA  7,0(3) 	Return 
* END of function swap
* BEGIN function main
  4:    LDA  7,286(7) 	Jump to main 
291:     ST  3,-1(1) 	Store return address. BEGIN FUNC: main
* BEGIN compound statement
* 91
292:    LDC  3,0(6) 	Load constant 
293:     ST  3,-2(1) 	Store variable p
* WHILE
294:     LD  3,-2(1) 	Load variable p
295:     ST  3,-24(1) 	Save left side in temp 
296:    LDC  3,10(6) 	Load constant 
297:     LD  4,-24(1) 	Load left from temp into ac1 
298:    SUB  4,4,3 	Op < 
299:    LDC  3,1(6) 	True case 
300:    JLT  4,1(7) 	Jump if true 
301:    LDC  3,0(6) 	False case 
302:    LDC  4,1(6) 	Load constant 1 
303:    SUB  3,3,4 	While cond check 
304:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 93
306:     LD  3,-2(1) 	Load variable p
307:     ST  3,-24(1) 	Save index in temp 
308:     LD  3,-2(1) 	Load variable p
309:     LD  4,-24(1) 	load index from temp to ac1 
310:    LDA  5,-4(1) 	Load address of base of array r
311:    SUB  5,5,4 	Compute offset of value 
312:     ST  3,0(5) 	Store variable r
* 94
313:     LD  3,-2(1) 	Load variable p
314:     ST  3,-24(1) 	Save left side in temp 
315:    LDC  3,1(6) 	Load constant 
316:     LD  4,-24(1) 	Load left from temp into ac1 
317:    ADD  3,4,3 	Op + 
318:     ST  3,-2(1) 	Store variable p
* END compound statement
319:    LDA  7,-26(7) 	go to beginning of loop 
305:    LDA  7,14(7) 	No more loop 
* ENDWHILE
* 97
320:    LDC  3,111(6) 	Load constant 
321:     ST  3,-2(1) 	Store variable p
* 98
322:    LDC  3,222(6) 	Load constant 
323:     ST  3,-3(1) 	Store variable q
* 99
324:    LDC  3,7(6) 	Load constant 
325:     ST  3,-24(1) 	Save index in temp 
326:    LDC  3,333(6) 	Load constant 
327:     LD  4,-24(1) 	load index from temp to ac1 
328:    LDA  5,-4(1) 	Load address of base of array r
329:    SUB  5,5,4 	Compute offset of value 
330:     ST  3,0(5) 	Store variable r
* 100
331:    LDC  3,7(6) 	Load constant 
332:     ST  3,-24(1) 	Save index in temp 
333:    LDC  3,444(6) 	Load constant 
334:     LD  4,-24(1) 	load index from temp to ac1 
335:    LDA  5,-14(1) 	Load address of base of array s
336:    SUB  5,5,4 	Compute offset of value 
337:     ST  3,0(5) 	Store variable s
* 102
338:     ST  1,-24(1) 	Store old fp in ghost frame 
339:     LD  3,-2(1) 	Load variable p
340:     ST  3,-26(1) 	Store parameter 
341:    LDA  1,-24(1) 	Load address of new frame 
342:    LDA  3,1(7) 	Return address in ac 
343:    LDA  7,-309(7) 	call showInt
344:    LDA  3,0(2) 	Save the result in ac 
* 104
345:     ST  1,-24(1) 	Store old fp in ghost frame 
346:    LDA  3,-4(1) 	Load address of base of array r
347:     ST  3,-26(1) 	Store parameter 
348:    LDC  3,10(6) 	Load constant 
349:     ST  3,-27(1) 	Store parameter 
350:    LDA  1,-24(1) 	Load address of new frame 
351:    LDA  3,1(7) 	Return address in ac 
352:    LDA  7,-301(7) 	call showIntArray
353:    LDA  3,0(2) 	Save the result in ac 
* 106
354:     ST  1,-24(1) 	Store old fp in ghost frame 
355:     ST  1,-26(1) 	Store old fp in ghost frame 
356:    LDA  1,-26(1) 	Load address of new frame 
357:    LDA  3,1(7) 	Return address in ac 
358:    LDA  7,-249(7) 	call truth
359:    LDA  3,0(2) 	Save the result in ac 
360:     ST  3,-26(1) 	Store parameter 
361:    LDA  1,-24(1) 	Load address of new frame 
362:    LDA  3,1(7) 	Return address in ac 
363:    LDA  7,-271(7) 	call showBool
364:    LDA  3,0(2) 	Save the result in ac 
* 108
365:     ST  1,-24(1) 	Store old fp in ghost frame 
366:     LD  3,-2(1) 	Load variable p
367:     ST  3,-26(1) 	Store parameter 
368:    LDA  3,-4(1) 	Load address of base of array r
369:     ST  3,-27(1) 	Store parameter 
370:    LDA  1,-24(1) 	Load address of new frame 
371:    LDA  3,1(7) 	Return address in ac 
372:    LDA  7,-201(7) 	call caller
373:    LDA  3,0(2) 	Save the result in ac 
* 110
374:     ST  1,-24(1) 	Store old fp in ghost frame 
375:     ST  1,-26(1) 	Store old fp in ghost frame 
376:     ST  1,-28(1) 	Store old fp in ghost frame 
377:     LD  3,-2(1) 	Load variable p
378:     ST  3,-30(1) 	Store parameter 
379:     LD  3,-3(1) 	Load variable q
380:     ST  3,-31(1) 	Store parameter 
381:    LDA  1,-28(1) 	Load address of new frame 
382:    LDA  3,1(7) 	Return address in ac 
383:    LDA  7,-240(7) 	call add
384:    LDA  3,0(2) 	Save the result in ac 
385:     ST  3,-28(1) 	Store parameter 
386:     ST  1,-29(1) 	Store old fp in ghost frame 
387:     LD  3,-2(1) 	Load variable p
388:     ST  3,-31(1) 	Store parameter 
389:     LD  3,-3(1) 	Load variable q
390:     ST  3,-32(1) 	Store parameter 
391:    LDA  1,-29(1) 	Load address of new frame 
392:    LDA  3,1(7) 	Return address in ac 
393:    LDA  7,-236(7) 	call mul
394:    LDA  3,0(2) 	Save the result in ac 
395:     ST  3,-29(1) 	Store parameter 
396:    LDA  1,-26(1) 	Load address of new frame 
397:    LDA  3,1(7) 	Return address in ac 
398:    LDA  7,-255(7) 	call add
399:    LDA  3,0(2) 	Save the result in ac 
400:     ST  3,-26(1) 	Store parameter 
401:    LDA  1,-24(1) 	Load address of new frame 
402:    LDA  3,1(7) 	Return address in ac 
403:    LDA  7,-393(7) 	call output
404:    LDA  3,0(2) 	Save the result in ac 
* 111
405:     ST  1,-24(1) 	Store old fp in ghost frame 
406:    LDA  1,-24(1) 	Load address of new frame 
407:    LDA  3,1(7) 	Return address in ac 
408:    LDA  7,-379(7) 	call outnl
409:    LDA  3,0(2) 	Save the result in ac 
* 112
410:    LDC  3,9(6) 	Load constant 
411:     ST  3,-24(1) 	Save index in temp 
412:    LDC  3,555(6) 	Load constant 
413:     LD  4,-24(1) 	load index from temp to ac1 
414:    LDA  5,-4(1) 	Load address of base of array r
415:    SUB  5,5,4 	Compute offset of value 
416:     ST  3,0(5) 	Store variable r
* 113
417:     ST  1,-24(1) 	Store old fp in ghost frame 
418:    LDA  3,-4(1) 	Load address of base of array r
419:     ST  3,-26(1) 	Store parameter 
420:    LDC  3,7(6) 	Load constant 
421:     ST  3,-27(1) 	Store parameter 
422:    LDC  3,9(6) 	Load constant 
423:     ST  3,-28(1) 	Store parameter 
424:    LDA  1,-24(1) 	Load address of new frame 
425:    LDA  3,1(7) 	Return address in ac 
426:    LDA  7,-163(7) 	call swap
427:    LDA  3,0(2) 	Save the result in ac 
* 114
428:     ST  1,-24(1) 	Store old fp in ghost frame 
429:    LDC  3,9(6) 	Load constant 
430:    LDA  4,-4(1) 	Load address of base of array r
431:    SUB  3,4,3 	Compute offset of value 
432:     LD  3,0(3) 	Load the value 
433:     ST  3,-26(1) 	Store parameter 
434:    LDA  1,-24(1) 	Load address of new frame 
435:    LDA  3,1(7) 	Return address in ac 
436:    LDA  7,-426(7) 	call output
437:    LDA  3,0(2) 	Save the result in ac 
* 115
438:     ST  1,-24(1) 	Store old fp in ghost frame 
439:    LDA  1,-24(1) 	Load address of new frame 
440:    LDA  3,1(7) 	Return address in ac 
441:    LDA  7,-412(7) 	call outnl
442:    LDA  3,0(2) 	Save the result in ac 
* 116
443:     ST  1,-24(1) 	Store old fp in ghost frame 
444:    LDC  3,2(6) 	Load constant 
445:     ST  3,-26(1) 	Save left side in temp 
446:     ST  1,-27(1) 	Store old fp in ghost frame 
447:     ST  1,-29(1) 	Store old fp in ghost frame 
448:    LDC  3,3(6) 	Load constant 
449:     ST  3,-31(1) 	Save left side in temp 
450:    LDC  3,4(6) 	Load constant 
451:     LD  4,-31(1) 	Load left from temp into ac1 
452:    MUL  3,4,3 	Op * 
453:     ST  3,-31(1) 	Store parameter 
454:    LDC  3,5(6) 	Load constant 
455:     ST  3,-32(1) 	Save left side in temp 
456:    LDC  3,6(6) 	Load constant 
457:     LD  4,-32(1) 	Load left from temp into ac1 
458:    MUL  3,4,3 	Op * 
459:     ST  3,-32(1) 	Store parameter 
460:    LDA  1,-29(1) 	Load address of new frame 
461:    LDA  3,1(7) 	Return address in ac 
462:    LDA  7,-319(7) 	call add
463:    LDA  3,0(2) 	Save the result in ac 
464:     ST  3,-29(1) 	Save left side in temp 
465:    LDC  3,7(6) 	Load constant 
466:     LD  4,-29(1) 	Load left from temp into ac1 
467:    MUL  3,4,3 	Op * 
468:     ST  3,-29(1) 	Store parameter 
469:     ST  1,-30(1) 	Store old fp in ghost frame 
470:    LDC  3,9(6) 	Load constant 
471:     ST  3,-32(1) 	Save left side in temp 
472:    LDC  3,10(6) 	Load constant 
473:     LD  4,-32(1) 	Load left from temp into ac1 
474:    MUL  3,4,3 	Op * 
475:     ST  3,-32(1) 	Store parameter 
476:    LDC  3,11(6) 	Load constant 
477:     ST  3,-33(1) 	Save left side in temp 
478:    LDC  3,12(6) 	Load constant 
479:     LD  4,-33(1) 	Load left from temp into ac1 
480:    MUL  3,4,3 	Op * 
481:     ST  3,-33(1) 	Store parameter 
482:    LDA  1,-30(1) 	Load address of new frame 
483:    LDA  3,1(7) 	Return address in ac 
484:    LDA  7,-341(7) 	call add
485:    LDA  3,0(2) 	Save the result in ac 
486:     ST  3,-30(1) 	Save left side in temp 
487:    LDC  3,13(6) 	Load constant 
488:     LD  4,-30(1) 	Load left from temp into ac1 
489:    MUL  3,4,3 	Op * 
490:     ST  3,-30(1) 	Store parameter 
491:    LDA  1,-27(1) 	Load address of new frame 
492:    LDA  3,1(7) 	Return address in ac 
493:    LDA  7,-350(7) 	call add
494:    LDA  3,0(2) 	Save the result in ac 
495:     LD  4,-26(1) 	Load left from temp into ac1 
496:    MUL  3,4,3 	Op * 
497:     ST  3,-26(1) 	Store parameter 
498:    LDA  1,-24(1) 	Load address of new frame 
499:    LDA  3,1(7) 	Return address in ac 
500:    LDA  7,-490(7) 	call output
501:    LDA  3,0(2) 	Save the result in ac 
* 117
502:     ST  1,-24(1) 	Store old fp in ghost frame 
503:    LDA  1,-24(1) 	Load address of new frame 
504:    LDA  3,1(7) 	Return address in ac 
505:    LDA  7,-476(7) 	call outnl
506:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
507:    LDC  2,0(6) 	Set return value to 0 
508:     LD  3,-1(1) 	Load return address 
509:     LD  1,0(1) 	Adjust fp 
510:    LDA  7,0(3) 	Return 
* END of function main
