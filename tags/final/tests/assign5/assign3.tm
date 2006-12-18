* C- compiler version C-06
* Author: Robert B. Heckendorn
* Backend coauthor: Jorge Williams
* Apr 1, 2006
* BEGIN Prolog
  0:     LD  0,0(0) 	Set the global pointer 
  1:    LDA  1,-13(0) 	set first frame at end of globals 
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
* 8
 36:    LDC  3,5(6) 	Load constant 
 37:     ST  3,-17(1) 	Save index in temp 
 38:    LDC  3,5(6) 	Load constant 
 39:    LDA  4,-2(1) 	Load address of base of array x
 40:    SUB  3,4,3 	Compute offset of value 
 41:     LD  3,0(3) 	Load the value 
 42:     ST  3,-18(1) 	Save left side in temp 
 43:    LDC  3,111(6) 	Load constant 
 44:     LD  4,-18(1) 	Load left from temp into ac1 
 45:    ADD  3,4,3 	Op + 
 46:     LD  4,-17(1) 	load index from temp to ac1 
 47:    LDA  5,-2(1) 	Load address of base of array x
 48:    SUB  5,5,4 	Compute offset of value 
 49:     ST  3,0(5) 	Store variable x
* 9
 50:     ST  1,-17(1) 	Store old fp in ghost frame 
 51:    LDC  3,5(6) 	Load constant 
 52:    LDA  4,-2(1) 	Load address of base of array x
 53:    SUB  3,4,3 	Compute offset of value 
 54:     LD  3,0(3) 	Load the value 
 55:     ST  3,-19(1) 	Store parameter 
 56:    LDA  1,-17(1) 	Load address of new frame 
 57:    LDA  3,1(7) 	Return address in ac 
 58:    LDA  7,-48(7) 	call output
 59:    LDA  3,0(2) 	Save the result in ac 
* 10
 60:    LDC  3,4(6) 	Load constant 
 61:     ST  3,-17(1) 	Save index in temp 
 62:    LDC  3,4(6) 	Load constant 
 63:    LDA  4,-10(1) 	Load address of base of array y
 64:    SUB  3,4,3 	Compute offset of value 
 65:     LD  3,0(3) 	Load the value 
 66:     ST  3,-18(1) 	Save left side in temp 
 67:    LDC  3,222(6) 	Load constant 
 68:     LD  4,-18(1) 	Load left from temp into ac1 
 69:    ADD  3,4,3 	Op + 
 70:     LD  4,-17(1) 	load index from temp to ac1 
 71:    LDA  5,-10(1) 	Load address of base of array y
 72:    SUB  5,5,4 	Compute offset of value 
 73:     ST  3,0(5) 	Store variable y
* 11
 74:     ST  1,-17(1) 	Store old fp in ghost frame 
 75:    LDC  3,4(6) 	Load constant 
 76:    LDA  4,-10(1) 	Load address of base of array y
 77:    SUB  3,4,3 	Compute offset of value 
 78:     LD  3,0(3) 	Load the value 
 79:     ST  3,-19(1) 	Store parameter 
 80:    LDA  1,-17(1) 	Load address of new frame 
 81:    LDA  3,1(7) 	Return address in ac 
 82:    LDA  7,-72(7) 	call output
 83:    LDA  3,0(2) 	Save the result in ac 
* 12
 84:     ST  1,-17(1) 	Store old fp in ghost frame 
 85:    LDA  1,-17(1) 	Load address of new frame 
 86:    LDA  3,1(7) 	Return address in ac 
 87:    LDA  7,-58(7) 	call outnl
 88:    LDA  3,0(2) 	Save the result in ac 
* 14
 89:    LDC  3,5(6) 	Load constant 
 90:     ST  3,-17(1) 	Save index in temp 
 91:    LDC  3,5(6) 	Load constant 
 92:    LDA  4,0(0) 	Load address of base of array gx
 93:    SUB  3,4,3 	Compute offset of value 
 94:     LD  3,0(3) 	Load the value 
 95:     ST  3,-18(1) 	Save left side in temp 
 96:    LDC  3,333(6) 	Load constant 
 97:     LD  4,-18(1) 	Load left from temp into ac1 
 98:    ADD  3,4,3 	Op + 
 99:     LD  4,-17(1) 	load index from temp to ac1 
100:    LDA  5,0(0) 	Load address of base of array gx
101:    SUB  5,5,4 	Compute offset of value 
102:     ST  3,0(5) 	Store variable gx
* 15
103:     ST  1,-17(1) 	Store old fp in ghost frame 
104:    LDC  3,5(6) 	Load constant 
105:    LDA  4,0(0) 	Load address of base of array gx
106:    SUB  3,4,3 	Compute offset of value 
107:     LD  3,0(3) 	Load the value 
108:     ST  3,-19(1) 	Store parameter 
109:    LDA  1,-17(1) 	Load address of new frame 
110:    LDA  3,1(7) 	Return address in ac 
111:    LDA  7,-101(7) 	call output
112:    LDA  3,0(2) 	Save the result in ac 
* 16
113:    LDC  3,4(6) 	Load constant 
114:     ST  3,-17(1) 	Save index in temp 
115:    LDC  3,4(6) 	Load constant 
116:    LDA  4,-7(0) 	Load address of base of array gy
117:    SUB  3,4,3 	Compute offset of value 
118:     LD  3,0(3) 	Load the value 
119:     ST  3,-18(1) 	Save left side in temp 
120:    LDC  3,444(6) 	Load constant 
121:     LD  4,-18(1) 	Load left from temp into ac1 
122:    ADD  3,4,3 	Op + 
123:     LD  4,-17(1) 	load index from temp to ac1 
124:    LDA  5,-7(0) 	Load address of base of array gy
125:    SUB  5,5,4 	Compute offset of value 
126:     ST  3,0(5) 	Store variable gy
* 17
127:     ST  1,-17(1) 	Store old fp in ghost frame 
128:    LDC  3,4(6) 	Load constant 
129:    LDA  4,-7(0) 	Load address of base of array gy
130:    SUB  3,4,3 	Compute offset of value 
131:     LD  3,0(3) 	Load the value 
132:     ST  3,-19(1) 	Store parameter 
133:    LDA  1,-17(1) 	Load address of new frame 
134:    LDA  3,1(7) 	Return address in ac 
135:    LDA  7,-125(7) 	call output
136:    LDA  3,0(2) 	Save the result in ac 
* 18
137:     ST  1,-17(1) 	Store old fp in ghost frame 
138:    LDA  1,-17(1) 	Load address of new frame 
139:    LDA  3,1(7) 	Return address in ac 
140:    LDA  7,-111(7) 	call outnl
141:    LDA  3,0(2) 	Save the result in ac 
* 20
142:    LDC  3,5(6) 	Load constant 
143:     ST  3,-17(1) 	Save index in temp 
144:    LDC  3,5(6) 	Load constant 
145:    LDA  4,-2(1) 	Load address of base of array x
146:    SUB  3,4,3 	Compute offset of value 
147:     LD  3,0(3) 	Load the value 
148:     ST  3,-18(1) 	Save left side in temp 
149:    LDC  3,4(6) 	Load constant 
150:    LDA  4,-10(1) 	Load address of base of array y
151:    SUB  3,4,3 	Compute offset of value 
152:     LD  3,0(3) 	Load the value 
153:     LD  4,-18(1) 	Load left from temp into ac1 
154:    ADD  3,4,3 	Op + 
155:     LD  4,-17(1) 	load index from temp to ac1 
156:    LDA  5,-2(1) 	Load address of base of array x
157:    SUB  5,5,4 	Compute offset of value 
158:     ST  3,0(5) 	Store variable x
* 21
159:     ST  1,-17(1) 	Store old fp in ghost frame 
160:    LDC  3,5(6) 	Load constant 
161:    LDA  4,-2(1) 	Load address of base of array x
162:    SUB  3,4,3 	Compute offset of value 
163:     LD  3,0(3) 	Load the value 
164:     ST  3,-19(1) 	Store parameter 
165:    LDA  1,-17(1) 	Load address of new frame 
166:    LDA  3,1(7) 	Return address in ac 
167:    LDA  7,-157(7) 	call output
168:    LDA  3,0(2) 	Save the result in ac 
* 22
169:     ST  1,-17(1) 	Store old fp in ghost frame 
170:    LDA  1,-17(1) 	Load address of new frame 
171:    LDA  3,1(7) 	Return address in ac 
172:    LDA  7,-143(7) 	call outnl
173:    LDA  3,0(2) 	Save the result in ac 
* 24
174:    LDC  3,5(6) 	Load constant 
175:     ST  3,-17(1) 	Save index in temp 
176:    LDC  3,5(6) 	Load constant 
177:    LDA  4,0(0) 	Load address of base of array gx
178:    SUB  3,4,3 	Compute offset of value 
179:     LD  3,0(3) 	Load the value 
180:     ST  3,-18(1) 	Save left side in temp 
181:    LDC  3,4(6) 	Load constant 
182:    LDA  4,-7(0) 	Load address of base of array gy
183:    SUB  3,4,3 	Compute offset of value 
184:     LD  3,0(3) 	Load the value 
185:     LD  4,-18(1) 	Load left from temp into ac1 
186:    ADD  3,4,3 	Op + 
187:     LD  4,-17(1) 	load index from temp to ac1 
188:    LDA  5,0(0) 	Load address of base of array gx
189:    SUB  5,5,4 	Compute offset of value 
190:     ST  3,0(5) 	Store variable gx
* 25
191:     ST  1,-17(1) 	Store old fp in ghost frame 
192:    LDC  3,5(6) 	Load constant 
193:    LDA  4,0(0) 	Load address of base of array gx
194:    SUB  3,4,3 	Compute offset of value 
195:     LD  3,0(3) 	Load the value 
196:     ST  3,-19(1) 	Store parameter 
197:    LDA  1,-17(1) 	Load address of new frame 
198:    LDA  3,1(7) 	Return address in ac 
199:    LDA  7,-189(7) 	call output
200:    LDA  3,0(2) 	Save the result in ac 
* 26
201:     ST  1,-17(1) 	Store old fp in ghost frame 
202:    LDA  1,-17(1) 	Load address of new frame 
203:    LDA  3,1(7) 	Return address in ac 
204:    LDA  7,-175(7) 	call outnl
205:    LDA  3,0(2) 	Save the result in ac 
* 30
206:    LDC  3,5(6) 	Load constant 
207:     ST  3,-17(1) 	Save index in temp 
208:    LDC  3,5(6) 	Load constant 
209:    LDA  4,-2(1) 	Load address of base of array x
210:    SUB  3,4,3 	Compute offset of value 
211:     LD  3,0(3) 	Load the value 
212:     ST  3,-18(1) 	Save left side in temp 
213:    LDC  3,111(6) 	Load constant 
214:     LD  4,-18(1) 	Load left from temp into ac1 
215:    SUB  3,4,3 	Op - 
216:     LD  4,-17(1) 	load index from temp to ac1 
217:    LDA  5,-2(1) 	Load address of base of array x
218:    SUB  5,5,4 	Compute offset of value 
219:     ST  3,0(5) 	Store variable x
* 31
220:     ST  1,-17(1) 	Store old fp in ghost frame 
221:    LDC  3,5(6) 	Load constant 
222:    LDA  4,-2(1) 	Load address of base of array x
223:    SUB  3,4,3 	Compute offset of value 
224:     LD  3,0(3) 	Load the value 
225:     ST  3,-19(1) 	Store parameter 
226:    LDA  1,-17(1) 	Load address of new frame 
227:    LDA  3,1(7) 	Return address in ac 
228:    LDA  7,-218(7) 	call output
229:    LDA  3,0(2) 	Save the result in ac 
* 32
230:    LDC  3,4(6) 	Load constant 
231:     ST  3,-17(1) 	Save index in temp 
232:    LDC  3,4(6) 	Load constant 
233:    LDA  4,-10(1) 	Load address of base of array y
234:    SUB  3,4,3 	Compute offset of value 
235:     LD  3,0(3) 	Load the value 
236:     ST  3,-18(1) 	Save left side in temp 
237:    LDC  3,222(6) 	Load constant 
238:     LD  4,-18(1) 	Load left from temp into ac1 
239:    SUB  3,4,3 	Op - 
240:     LD  4,-17(1) 	load index from temp to ac1 
241:    LDA  5,-10(1) 	Load address of base of array y
242:    SUB  5,5,4 	Compute offset of value 
243:     ST  3,0(5) 	Store variable y
* 33
244:     ST  1,-17(1) 	Store old fp in ghost frame 
245:    LDC  3,4(6) 	Load constant 
246:    LDA  4,-10(1) 	Load address of base of array y
247:    SUB  3,4,3 	Compute offset of value 
248:     LD  3,0(3) 	Load the value 
249:     ST  3,-19(1) 	Store parameter 
250:    LDA  1,-17(1) 	Load address of new frame 
251:    LDA  3,1(7) 	Return address in ac 
252:    LDA  7,-242(7) 	call output
253:    LDA  3,0(2) 	Save the result in ac 
* 34
254:     ST  1,-17(1) 	Store old fp in ghost frame 
255:    LDA  1,-17(1) 	Load address of new frame 
256:    LDA  3,1(7) 	Return address in ac 
257:    LDA  7,-228(7) 	call outnl
258:    LDA  3,0(2) 	Save the result in ac 
* 36
259:    LDC  3,5(6) 	Load constant 
260:     ST  3,-17(1) 	Save index in temp 
261:    LDC  3,5(6) 	Load constant 
262:    LDA  4,0(0) 	Load address of base of array gx
263:    SUB  3,4,3 	Compute offset of value 
264:     LD  3,0(3) 	Load the value 
265:     ST  3,-18(1) 	Save left side in temp 
266:    LDC  3,333(6) 	Load constant 
267:     LD  4,-18(1) 	Load left from temp into ac1 
268:    SUB  3,4,3 	Op - 
269:     LD  4,-17(1) 	load index from temp to ac1 
270:    LDA  5,0(0) 	Load address of base of array gx
271:    SUB  5,5,4 	Compute offset of value 
272:     ST  3,0(5) 	Store variable gx
* 37
273:     ST  1,-17(1) 	Store old fp in ghost frame 
274:    LDC  3,5(6) 	Load constant 
275:    LDA  4,0(0) 	Load address of base of array gx
276:    SUB  3,4,3 	Compute offset of value 
277:     LD  3,0(3) 	Load the value 
278:     ST  3,-19(1) 	Store parameter 
279:    LDA  1,-17(1) 	Load address of new frame 
280:    LDA  3,1(7) 	Return address in ac 
281:    LDA  7,-271(7) 	call output
282:    LDA  3,0(2) 	Save the result in ac 
* 38
283:    LDC  3,4(6) 	Load constant 
284:     ST  3,-17(1) 	Save index in temp 
285:    LDC  3,4(6) 	Load constant 
286:    LDA  4,-7(0) 	Load address of base of array gy
287:    SUB  3,4,3 	Compute offset of value 
288:     LD  3,0(3) 	Load the value 
289:     ST  3,-18(1) 	Save left side in temp 
290:    LDC  3,444(6) 	Load constant 
291:     LD  4,-18(1) 	Load left from temp into ac1 
292:    SUB  3,4,3 	Op - 
293:     LD  4,-17(1) 	load index from temp to ac1 
294:    LDA  5,-7(0) 	Load address of base of array gy
295:    SUB  5,5,4 	Compute offset of value 
296:     ST  3,0(5) 	Store variable gy
* 39
297:     ST  1,-17(1) 	Store old fp in ghost frame 
298:    LDC  3,4(6) 	Load constant 
299:    LDA  4,-7(0) 	Load address of base of array gy
300:    SUB  3,4,3 	Compute offset of value 
301:     LD  3,0(3) 	Load the value 
302:     ST  3,-19(1) 	Store parameter 
303:    LDA  1,-17(1) 	Load address of new frame 
304:    LDA  3,1(7) 	Return address in ac 
305:    LDA  7,-295(7) 	call output
306:    LDA  3,0(2) 	Save the result in ac 
* 40
307:     ST  1,-17(1) 	Store old fp in ghost frame 
308:    LDA  1,-17(1) 	Load address of new frame 
309:    LDA  3,1(7) 	Return address in ac 
310:    LDA  7,-281(7) 	call outnl
311:    LDA  3,0(2) 	Save the result in ac 
* 42
312:    LDC  3,5(6) 	Load constant 
313:     ST  3,-17(1) 	Save index in temp 
314:    LDC  3,5(6) 	Load constant 
315:    LDA  4,-2(1) 	Load address of base of array x
316:    SUB  3,4,3 	Compute offset of value 
317:     LD  3,0(3) 	Load the value 
318:     ST  3,-18(1) 	Save left side in temp 
319:    LDC  3,4(6) 	Load constant 
320:    LDA  4,-10(1) 	Load address of base of array y
321:    SUB  3,4,3 	Compute offset of value 
322:     LD  3,0(3) 	Load the value 
323:     LD  4,-18(1) 	Load left from temp into ac1 
324:    SUB  3,4,3 	Op - 
325:     LD  4,-17(1) 	load index from temp to ac1 
326:    LDA  5,-2(1) 	Load address of base of array x
327:    SUB  5,5,4 	Compute offset of value 
328:     ST  3,0(5) 	Store variable x
* 43
329:     ST  1,-17(1) 	Store old fp in ghost frame 
330:    LDC  3,5(6) 	Load constant 
331:    LDA  4,-2(1) 	Load address of base of array x
332:    SUB  3,4,3 	Compute offset of value 
333:     LD  3,0(3) 	Load the value 
334:     ST  3,-19(1) 	Store parameter 
335:    LDA  1,-17(1) 	Load address of new frame 
336:    LDA  3,1(7) 	Return address in ac 
337:    LDA  7,-327(7) 	call output
338:    LDA  3,0(2) 	Save the result in ac 
* 44
339:     ST  1,-17(1) 	Store old fp in ghost frame 
340:    LDA  1,-17(1) 	Load address of new frame 
341:    LDA  3,1(7) 	Return address in ac 
342:    LDA  7,-313(7) 	call outnl
343:    LDA  3,0(2) 	Save the result in ac 
* 46
344:    LDC  3,5(6) 	Load constant 
345:     ST  3,-17(1) 	Save index in temp 
346:    LDC  3,5(6) 	Load constant 
347:    LDA  4,0(0) 	Load address of base of array gx
348:    SUB  3,4,3 	Compute offset of value 
349:     LD  3,0(3) 	Load the value 
350:     ST  3,-18(1) 	Save left side in temp 
351:    LDC  3,4(6) 	Load constant 
352:    LDA  4,-7(0) 	Load address of base of array gy
353:    SUB  3,4,3 	Compute offset of value 
354:     LD  3,0(3) 	Load the value 
355:     LD  4,-18(1) 	Load left from temp into ac1 
356:    SUB  3,4,3 	Op - 
357:     LD  4,-17(1) 	load index from temp to ac1 
358:    LDA  5,0(0) 	Load address of base of array gx
359:    SUB  5,5,4 	Compute offset of value 
360:     ST  3,0(5) 	Store variable gx
* 47
361:     ST  1,-17(1) 	Store old fp in ghost frame 
362:    LDC  3,5(6) 	Load constant 
363:    LDA  4,0(0) 	Load address of base of array gx
364:    SUB  3,4,3 	Compute offset of value 
365:     LD  3,0(3) 	Load the value 
366:     ST  3,-19(1) 	Store parameter 
367:    LDA  1,-17(1) 	Load address of new frame 
368:    LDA  3,1(7) 	Return address in ac 
369:    LDA  7,-359(7) 	call output
370:    LDA  3,0(2) 	Save the result in ac 
* 48
371:     ST  1,-17(1) 	Store old fp in ghost frame 
372:    LDA  1,-17(1) 	Load address of new frame 
373:    LDA  3,1(7) 	Return address in ac 
374:    LDA  7,-345(7) 	call outnl
375:    LDA  3,0(2) 	Save the result in ac 
* RETURN
376:    LDA  2,0(3) 	Copy result to rt register 
377:     LD  3,-1(1) 	Load return address 
378:     LD  1,0(1) 	Adjust fp 
379:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
380:    LDC  2,0(6) 	Set return value to 0 
381:     LD  3,-1(1) 	Load return address 
382:     LD  1,0(1) 	Adjust fp 
383:    LDA  7,0(3) 	Return 
* END of function main
