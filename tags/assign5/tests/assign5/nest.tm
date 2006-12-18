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
* BEGIN function agamemnon
 35:     ST  3,-1(1) 	Store return address. BEGIN FUNC: agamemnon
* BEGIN compound statement
* 12
 36:    LDC  3,666(6) 	Load constant 
 37:     ST  3,-2(1) 	Store variable a
* 13
 38:    LDC  3,666(6) 	Load constant 
 39:     ST  3,-3(1) 	Store variable b
* 14
 40:    LDC  3,666(6) 	Load constant 
 41:     ST  3,-4(1) 	Store variable x
* 15
 42:    LDC  3,666(6) 	Load constant 
 43:     ST  3,-2(0) 	Store variable z
* 17
 44:     ST  1,-5(1) 	Store old fp in ghost frame 
 45:     LD  3,-2(1) 	Load variable a
 46:     ST  3,-7(1) 	Store parameter 
 47:    LDA  1,-5(1) 	Load address of new frame 
 48:    LDA  3,1(7) 	Return address in ac 
 49:    LDA  7,-39(7) 	call output
 50:    LDA  3,0(2) 	Save the result in ac 
* 18
 51:     ST  1,-5(1) 	Store old fp in ghost frame 
 52:     LD  3,-3(1) 	Load variable b
 53:     ST  3,-7(1) 	Store parameter 
 54:    LDA  1,-5(1) 	Load address of new frame 
 55:    LDA  3,1(7) 	Return address in ac 
 56:    LDA  7,-46(7) 	call output
 57:    LDA  3,0(2) 	Save the result in ac 
* 19
 58:     ST  1,-5(1) 	Store old fp in ghost frame 
 59:     LD  3,-4(1) 	Load variable x
 60:     ST  3,-7(1) 	Store parameter 
 61:    LDA  1,-5(1) 	Load address of new frame 
 62:    LDA  3,1(7) 	Return address in ac 
 63:    LDA  7,-53(7) 	call output
 64:    LDA  3,0(2) 	Save the result in ac 
* 20
 65:     ST  1,-5(1) 	Store old fp in ghost frame 
 66:     LD  3,-1(0) 	Load variable y
 67:     ST  3,-7(1) 	Store parameter 
 68:    LDA  1,-5(1) 	Load address of new frame 
 69:    LDA  3,1(7) 	Return address in ac 
 70:    LDA  7,-60(7) 	call output
 71:    LDA  3,0(2) 	Save the result in ac 
* 21
 72:     ST  1,-5(1) 	Store old fp in ghost frame 
 73:     LD  3,-2(0) 	Load variable z
 74:     ST  3,-7(1) 	Store parameter 
 75:    LDA  1,-5(1) 	Load address of new frame 
 76:    LDA  3,1(7) 	Return address in ac 
 77:    LDA  7,-67(7) 	call output
 78:    LDA  3,0(2) 	Save the result in ac 
* 22
 79:    LDC  3,1(6) 	Load constant 
 80:     ST  3,-2(1) 	Store variable a
* 23
 81:    LDC  3,2(6) 	Load constant 
 82:     ST  3,-3(1) 	Store variable b
* 24
 83:    LDC  3,3(6) 	Load constant 
 84:     ST  3,-4(1) 	Store variable x
* 25
 85:    LDC  3,4(6) 	Load constant 
 86:     ST  3,-1(0) 	Store variable y
* 26
 87:    LDC  3,5(6) 	Load constant 
 88:     ST  3,-2(0) 	Store variable z
* END compound statement
* Add standard closing in case there is no return statement
 89:    LDC  2,0(6) 	Set return value to 0 
 90:     LD  3,-1(1) 	Load return address 
 91:     LD  1,0(1) 	Adjust fp 
 92:    LDA  7,0(3) 	Return 
* END of function agamemnon
* BEGIN function main
  4:    LDA  7,88(7) 	Jump to main 
 93:     ST  3,-1(1) 	Store return address. BEGIN FUNC: main
* BEGIN compound statement
* 35
 94:    LDC  3,6(6) 	Load constant 
 95:     ST  3,-2(1) 	Store variable a
* 36
 96:    LDC  3,7(6) 	Load constant 
 97:     ST  3,-3(1) 	Store variable b
* 37
 98:    LDC  3,8(6) 	Load constant 
 99:     ST  3,0(0) 	Store variable x
* 38
100:    LDC  3,9(6) 	Load constant 
101:     ST  3,-1(0) 	Store variable y
* 39
102:    LDC  3,10(6) 	Load constant 
103:     ST  3,-4(1) 	Store variable z
* 41
104:     ST  1,-8(1) 	Store old fp in ghost frame 
105:     LD  3,-2(1) 	Load variable a
106:     ST  3,-10(1) 	Store parameter 
107:    LDA  1,-8(1) 	Load address of new frame 
108:    LDA  3,1(7) 	Return address in ac 
109:    LDA  7,-99(7) 	call output
110:    LDA  3,0(2) 	Save the result in ac 
* 42
111:     ST  1,-8(1) 	Store old fp in ghost frame 
112:     LD  3,-3(1) 	Load variable b
113:     ST  3,-10(1) 	Store parameter 
114:    LDA  1,-8(1) 	Load address of new frame 
115:    LDA  3,1(7) 	Return address in ac 
116:    LDA  7,-106(7) 	call output
117:    LDA  3,0(2) 	Save the result in ac 
* 43
118:     ST  1,-8(1) 	Store old fp in ghost frame 
119:     LD  3,0(0) 	Load variable x
120:     ST  3,-10(1) 	Store parameter 
121:    LDA  1,-8(1) 	Load address of new frame 
122:    LDA  3,1(7) 	Return address in ac 
123:    LDA  7,-113(7) 	call output
124:    LDA  3,0(2) 	Save the result in ac 
* 44
125:     ST  1,-8(1) 	Store old fp in ghost frame 
126:     LD  3,-1(0) 	Load variable y
127:     ST  3,-10(1) 	Store parameter 
128:    LDA  1,-8(1) 	Load address of new frame 
129:    LDA  3,1(7) 	Return address in ac 
130:    LDA  7,-120(7) 	call output
131:    LDA  3,0(2) 	Save the result in ac 
* 45
132:     ST  1,-8(1) 	Store old fp in ghost frame 
133:     LD  3,-4(1) 	Load variable z
134:     ST  3,-10(1) 	Store parameter 
135:    LDA  1,-8(1) 	Load address of new frame 
136:    LDA  3,1(7) 	Return address in ac 
137:    LDA  7,-127(7) 	call output
138:    LDA  3,0(2) 	Save the result in ac 
* BEGIN compound statement
* 51
139:    LDC  3,666(6) 	Load constant 
140:     ST  3,-5(1) 	Store variable a
* 52
141:    LDC  3,666(6) 	Load constant 
142:     ST  3,-6(1) 	Store variable b
* 53
143:    LDC  3,666(6) 	Load constant 
144:     ST  3,-7(1) 	Store variable z
* 55
145:     ST  1,-8(1) 	Store old fp in ghost frame 
146:     LD  3,-5(1) 	Load variable a
147:     ST  3,-10(1) 	Store parameter 
148:    LDA  1,-8(1) 	Load address of new frame 
149:    LDA  3,1(7) 	Return address in ac 
150:    LDA  7,-140(7) 	call output
151:    LDA  3,0(2) 	Save the result in ac 
* 56
152:     ST  1,-8(1) 	Store old fp in ghost frame 
153:     LD  3,-6(1) 	Load variable b
154:     ST  3,-10(1) 	Store parameter 
155:    LDA  1,-8(1) 	Load address of new frame 
156:    LDA  3,1(7) 	Return address in ac 
157:    LDA  7,-147(7) 	call output
158:    LDA  3,0(2) 	Save the result in ac 
* 57
159:     ST  1,-8(1) 	Store old fp in ghost frame 
160:     LD  3,0(0) 	Load variable x
161:     ST  3,-10(1) 	Store parameter 
162:    LDA  1,-8(1) 	Load address of new frame 
163:    LDA  3,1(7) 	Return address in ac 
164:    LDA  7,-154(7) 	call output
165:    LDA  3,0(2) 	Save the result in ac 
* 58
166:     ST  1,-8(1) 	Store old fp in ghost frame 
167:     LD  3,-1(0) 	Load variable y
168:     ST  3,-10(1) 	Store parameter 
169:    LDA  1,-8(1) 	Load address of new frame 
170:    LDA  3,1(7) 	Return address in ac 
171:    LDA  7,-161(7) 	call output
172:    LDA  3,0(2) 	Save the result in ac 
* 59
173:     ST  1,-8(1) 	Store old fp in ghost frame 
174:     LD  3,-7(1) 	Load variable z
175:     ST  3,-10(1) 	Store parameter 
176:    LDA  1,-8(1) 	Load address of new frame 
177:    LDA  3,1(7) 	Return address in ac 
178:    LDA  7,-168(7) 	call output
179:    LDA  3,0(2) 	Save the result in ac 
* 61
180:    LDC  3,11(6) 	Load constant 
181:     ST  3,-5(1) 	Store variable a
* 62
182:    LDC  3,12(6) 	Load constant 
183:     ST  3,-6(1) 	Store variable b
* 63
184:    LDC  3,13(6) 	Load constant 
185:     ST  3,0(0) 	Store variable x
* 64
186:    LDC  3,14(6) 	Load constant 
187:     ST  3,-1(0) 	Store variable y
* 65
188:    LDC  3,15(6) 	Load constant 
189:     ST  3,-7(1) 	Store variable z
* 66
190:     ST  1,-8(1) 	Store old fp in ghost frame 
191:     LD  3,-5(1) 	Load variable a
192:     ST  3,-10(1) 	Store parameter 
193:    LDA  1,-8(1) 	Load address of new frame 
194:    LDA  3,1(7) 	Return address in ac 
195:    LDA  7,-185(7) 	call output
196:    LDA  3,0(2) 	Save the result in ac 
* 67
197:     ST  1,-8(1) 	Store old fp in ghost frame 
198:     LD  3,-6(1) 	Load variable b
199:     ST  3,-10(1) 	Store parameter 
200:    LDA  1,-8(1) 	Load address of new frame 
201:    LDA  3,1(7) 	Return address in ac 
202:    LDA  7,-192(7) 	call output
203:    LDA  3,0(2) 	Save the result in ac 
* 68
204:     ST  1,-8(1) 	Store old fp in ghost frame 
205:     LD  3,0(0) 	Load variable x
206:     ST  3,-10(1) 	Store parameter 
207:    LDA  1,-8(1) 	Load address of new frame 
208:    LDA  3,1(7) 	Return address in ac 
209:    LDA  7,-199(7) 	call output
210:    LDA  3,0(2) 	Save the result in ac 
* 69
211:     ST  1,-8(1) 	Store old fp in ghost frame 
212:     LD  3,-1(0) 	Load variable y
213:     ST  3,-10(1) 	Store parameter 
214:    LDA  1,-8(1) 	Load address of new frame 
215:    LDA  3,1(7) 	Return address in ac 
216:    LDA  7,-206(7) 	call output
217:    LDA  3,0(2) 	Save the result in ac 
* 70
218:     ST  1,-8(1) 	Store old fp in ghost frame 
219:     LD  3,-7(1) 	Load variable z
220:     ST  3,-10(1) 	Store parameter 
221:    LDA  1,-8(1) 	Load address of new frame 
222:    LDA  3,1(7) 	Return address in ac 
223:    LDA  7,-213(7) 	call output
224:    LDA  3,0(2) 	Save the result in ac 
* BEGIN compound statement
* 72
225:     ST  1,-8(1) 	Store old fp in ghost frame 
226:     LD  3,-5(1) 	Load variable a
227:     ST  3,-10(1) 	Store parameter 
228:    LDA  1,-8(1) 	Load address of new frame 
229:    LDA  3,1(7) 	Return address in ac 
230:    LDA  7,-220(7) 	call output
231:    LDA  3,0(2) 	Save the result in ac 
* 73
232:     ST  1,-8(1) 	Store old fp in ghost frame 
233:     LD  3,-6(1) 	Load variable b
234:     ST  3,-10(1) 	Store parameter 
235:    LDA  1,-8(1) 	Load address of new frame 
236:    LDA  3,1(7) 	Return address in ac 
237:    LDA  7,-227(7) 	call output
238:    LDA  3,0(2) 	Save the result in ac 
* 74
239:     ST  1,-8(1) 	Store old fp in ghost frame 
240:     LD  3,0(0) 	Load variable x
241:     ST  3,-10(1) 	Store parameter 
242:    LDA  1,-8(1) 	Load address of new frame 
243:    LDA  3,1(7) 	Return address in ac 
244:    LDA  7,-234(7) 	call output
245:    LDA  3,0(2) 	Save the result in ac 
* 75
246:     ST  1,-8(1) 	Store old fp in ghost frame 
247:     LD  3,-1(0) 	Load variable y
248:     ST  3,-10(1) 	Store parameter 
249:    LDA  1,-8(1) 	Load address of new frame 
250:    LDA  3,1(7) 	Return address in ac 
251:    LDA  7,-241(7) 	call output
252:    LDA  3,0(2) 	Save the result in ac 
* 76
253:     ST  1,-8(1) 	Store old fp in ghost frame 
254:     LD  3,-7(1) 	Load variable z
255:     ST  3,-10(1) 	Store parameter 
256:    LDA  1,-8(1) 	Load address of new frame 
257:    LDA  3,1(7) 	Return address in ac 
258:    LDA  7,-248(7) 	call output
259:    LDA  3,0(2) 	Save the result in ac 
* 78
260:    LDC  3,16(6) 	Load constant 
261:     ST  3,-5(1) 	Store variable a
* 79
262:    LDC  3,17(6) 	Load constant 
263:     ST  3,-6(1) 	Store variable b
* 80
264:    LDC  3,18(6) 	Load constant 
265:     ST  3,0(0) 	Store variable x
* 81
266:    LDC  3,19(6) 	Load constant 
267:     ST  3,-1(0) 	Store variable y
* 82
268:    LDC  3,20(6) 	Load constant 
269:     ST  3,-7(1) 	Store variable z
* 83
270:     ST  1,-8(1) 	Store old fp in ghost frame 
271:     LD  3,-5(1) 	Load variable a
272:     ST  3,-10(1) 	Store parameter 
273:    LDA  1,-8(1) 	Load address of new frame 
274:    LDA  3,1(7) 	Return address in ac 
275:    LDA  7,-265(7) 	call output
276:    LDA  3,0(2) 	Save the result in ac 
* 84
277:     ST  1,-8(1) 	Store old fp in ghost frame 
278:     LD  3,-6(1) 	Load variable b
279:     ST  3,-10(1) 	Store parameter 
280:    LDA  1,-8(1) 	Load address of new frame 
281:    LDA  3,1(7) 	Return address in ac 
282:    LDA  7,-272(7) 	call output
283:    LDA  3,0(2) 	Save the result in ac 
* 85
284:     ST  1,-8(1) 	Store old fp in ghost frame 
285:     LD  3,0(0) 	Load variable x
286:     ST  3,-10(1) 	Store parameter 
287:    LDA  1,-8(1) 	Load address of new frame 
288:    LDA  3,1(7) 	Return address in ac 
289:    LDA  7,-279(7) 	call output
290:    LDA  3,0(2) 	Save the result in ac 
* 86
291:     ST  1,-8(1) 	Store old fp in ghost frame 
292:     LD  3,-1(0) 	Load variable y
293:     ST  3,-10(1) 	Store parameter 
294:    LDA  1,-8(1) 	Load address of new frame 
295:    LDA  3,1(7) 	Return address in ac 
296:    LDA  7,-286(7) 	call output
297:    LDA  3,0(2) 	Save the result in ac 
* 87
298:     ST  1,-8(1) 	Store old fp in ghost frame 
299:     LD  3,-7(1) 	Load variable z
300:     ST  3,-10(1) 	Store parameter 
301:    LDA  1,-8(1) 	Load address of new frame 
302:    LDA  3,1(7) 	Return address in ac 
303:    LDA  7,-293(7) 	call output
304:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* 89
305:     ST  1,-8(1) 	Store old fp in ghost frame 
306:     LD  3,-5(1) 	Load variable a
307:     ST  3,-10(1) 	Store parameter 
308:    LDA  1,-8(1) 	Load address of new frame 
309:    LDA  3,1(7) 	Return address in ac 
310:    LDA  7,-300(7) 	call output
311:    LDA  3,0(2) 	Save the result in ac 
* 90
312:     ST  1,-8(1) 	Store old fp in ghost frame 
313:     LD  3,-6(1) 	Load variable b
314:     ST  3,-10(1) 	Store parameter 
315:    LDA  1,-8(1) 	Load address of new frame 
316:    LDA  3,1(7) 	Return address in ac 
317:    LDA  7,-307(7) 	call output
318:    LDA  3,0(2) 	Save the result in ac 
* 91
319:     ST  1,-8(1) 	Store old fp in ghost frame 
320:     LD  3,0(0) 	Load variable x
321:     ST  3,-10(1) 	Store parameter 
322:    LDA  1,-8(1) 	Load address of new frame 
323:    LDA  3,1(7) 	Return address in ac 
324:    LDA  7,-314(7) 	call output
325:    LDA  3,0(2) 	Save the result in ac 
* 92
326:     ST  1,-8(1) 	Store old fp in ghost frame 
327:     LD  3,-1(0) 	Load variable y
328:     ST  3,-10(1) 	Store parameter 
329:    LDA  1,-8(1) 	Load address of new frame 
330:    LDA  3,1(7) 	Return address in ac 
331:    LDA  7,-321(7) 	call output
332:    LDA  3,0(2) 	Save the result in ac 
* 93
333:     ST  1,-8(1) 	Store old fp in ghost frame 
334:     LD  3,-7(1) 	Load variable z
335:     ST  3,-10(1) 	Store parameter 
336:    LDA  1,-8(1) 	Load address of new frame 
337:    LDA  3,1(7) 	Return address in ac 
338:    LDA  7,-328(7) 	call output
339:    LDA  3,0(2) 	Save the result in ac 
* 95
340:     ST  1,-8(1) 	Store old fp in ghost frame 
341:    LDA  1,-8(1) 	Load address of new frame 
342:    LDA  3,1(7) 	Return address in ac 
343:    LDA  7,-309(7) 	call agamemnon
344:    LDA  3,0(2) 	Save the result in ac 
* 97
345:     ST  1,-8(1) 	Store old fp in ghost frame 
346:     LD  3,-5(1) 	Load variable a
347:     ST  3,-10(1) 	Store parameter 
348:    LDA  1,-8(1) 	Load address of new frame 
349:    LDA  3,1(7) 	Return address in ac 
350:    LDA  7,-340(7) 	call output
351:    LDA  3,0(2) 	Save the result in ac 
* 98
352:     ST  1,-8(1) 	Store old fp in ghost frame 
353:     LD  3,-6(1) 	Load variable b
354:     ST  3,-10(1) 	Store parameter 
355:    LDA  1,-8(1) 	Load address of new frame 
356:    LDA  3,1(7) 	Return address in ac 
357:    LDA  7,-347(7) 	call output
358:    LDA  3,0(2) 	Save the result in ac 
* 99
359:     ST  1,-8(1) 	Store old fp in ghost frame 
360:     LD  3,0(0) 	Load variable x
361:     ST  3,-10(1) 	Store parameter 
362:    LDA  1,-8(1) 	Load address of new frame 
363:    LDA  3,1(7) 	Return address in ac 
364:    LDA  7,-354(7) 	call output
365:    LDA  3,0(2) 	Save the result in ac 
* 100
366:     ST  1,-8(1) 	Store old fp in ghost frame 
367:     LD  3,-1(0) 	Load variable y
368:     ST  3,-10(1) 	Store parameter 
369:    LDA  1,-8(1) 	Load address of new frame 
370:    LDA  3,1(7) 	Return address in ac 
371:    LDA  7,-361(7) 	call output
372:    LDA  3,0(2) 	Save the result in ac 
* 101
373:     ST  1,-8(1) 	Store old fp in ghost frame 
374:     LD  3,-7(1) 	Load variable z
375:     ST  3,-10(1) 	Store parameter 
376:    LDA  1,-8(1) 	Load address of new frame 
377:    LDA  3,1(7) 	Return address in ac 
378:    LDA  7,-368(7) 	call output
379:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* END compound statement
* Add standard closing in case there is no return statement
380:    LDC  2,0(6) 	Set return value to 0 
381:     LD  3,-1(1) 	Load return address 
382:     LD  1,0(1) 	Adjust fp 
383:    LDA  7,0(3) 	Return 
* END of function main
