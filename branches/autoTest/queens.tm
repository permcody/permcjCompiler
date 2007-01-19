* C- compiler version C-06
* Author: Robert B. Heckendorn
* Backend coauthor: Jorge Williams
* Apr 1, 2006
* BEGIN Prolog
  0:     LD  0,0(0) 	Set the global pointer 
  1:    LDA  1,-76(0) 	set first frame at end of globals 
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
* BEGIN function printboard
 35:     ST  3,-1(1) 	Store return address. BEGIN FUNC: printboard
* BEGIN compound statement
* 18
 36:    LDC  3,0(6) 	Load constant 
 37:     ST  3,-3(1) 	Store variable i
* WHILE
 38:     LD  3,-3(1) 	Load variable i
 39:     ST  3,-4(1) 	Save left side in temp 
 40:     LD  3,-74(0) 	Load variable n
 41:     LD  4,-4(1) 	Load left from temp into ac1 
 42:    SUB  4,4,3 	Op < 
 43:    LDC  3,1(6) 	True case 
 44:    JLT  4,1(7) 	Jump if true 
 45:    LDC  3,0(6) 	False case 
 46:    LDC  4,1(6) 	Load constant 1 
 47:    SUB  3,3,4 	While cond check 
 48:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 20
 50:     ST  1,-4(1) 	Store old fp in ghost frame 
 51:     LD  3,-3(1) 	Load variable i
 52:     LD  4,-2(1) 	Load address of base of array col
 53:    SUB  3,4,3 	Compute offset of value 
 54:     LD  3,0(3) 	Load the value 
 55:     ST  3,-6(1) 	Store parameter 
 56:    LDA  1,-4(1) 	Load address of new frame 
 57:    LDA  3,1(7) 	Return address in ac 
 58:    LDA  7,-48(7) 	call output
 59:    LDA  3,0(2) 	Save the result in ac 
* 21
 60:     LD  3,-3(1) 	Load variable i
 61:     ST  3,-4(1) 	Save left side in temp 
 62:    LDC  3,1(6) 	Load constant 
 63:     LD  4,-4(1) 	Load left from temp into ac1 
 64:    ADD  3,4,3 	Op + 
 65:     ST  3,-3(1) 	Store variable i
* END compound statement
 66:    LDA  7,-29(7) 	go to beginning of loop 
 49:    LDA  7,17(7) 	No more loop 
* ENDWHILE
* 23
 67:     ST  1,-4(1) 	Store old fp in ghost frame 
 68:    LDA  1,-4(1) 	Load address of new frame 
 69:    LDA  3,1(7) 	Return address in ac 
 70:    LDA  7,-41(7) 	call outnl
 71:    LDA  3,0(2) 	Save the result in ac 
* 24
 72:     LD  3,-75(0) 	Load variable count
 73:     ST  3,-4(1) 	Save left side in temp 
 74:    LDC  3,1(6) 	Load constant 
 75:     LD  4,-4(1) 	Load left from temp into ac1 
 76:    ADD  3,4,3 	Op + 
 77:     ST  3,-75(0) 	Store variable count
* END compound statement
* Add standard closing in case there is no return statement
 78:    LDC  2,0(6) 	Set return value to 0 
 79:     LD  3,-1(1) 	Load return address 
 80:     LD  1,0(1) 	Adjust fp 
 81:    LDA  7,0(3) 	Return 
* END of function printboard
* BEGIN function try
 82:     ST  3,-1(1) 	Store return address. BEGIN FUNC: try
* BEGIN compound statement
* IF
 83:     LD  3,-2(1) 	Load variable c
 84:     ST  3,-4(1) 	Save left side in temp 
 85:     LD  3,-74(0) 	Load variable n
 86:     LD  4,-4(1) 	Load left from temp into ac1 
 87:    SUB  4,4,3 	Op == 
 88:    LDC  3,1(6) 	True case 
 89:    JEQ  4,1(7) 	Jump if true 
 90:    LDC  3,0(6) 	False case 
 91:    LDC  4,1(6) 	Load constant 1 
 92:    SUB  3,3,4 	If cond check 
 93:    JGE  3,1(7) 	Jump to then part 
* THEN
* 32
 95:     ST  1,-4(1) 	Store old fp in ghost frame 
 96:    LDA  3,-12(0) 	Load address of base of array col
 97:     ST  3,-6(1) 	Store parameter 
 98:    LDA  1,-4(1) 	Load address of new frame 
 99:    LDA  3,1(7) 	Return address in ac 
100:    LDA  7,-66(7) 	call printboard
101:    LDA  3,0(2) 	Save the result in ac 
* ELSE
 94:    LDA  7,8(7) 	Jump around the THEN 
* BEGIN compound statement
* 34
103:    LDC  3,0(6) 	Load constant 
104:     ST  3,-3(1) 	Store variable r
* WHILE
105:     LD  3,-3(1) 	Load variable r
106:     ST  3,-4(1) 	Save left side in temp 
107:     LD  3,-74(0) 	Load variable n
108:     LD  4,-4(1) 	Load left from temp into ac1 
109:    SUB  4,4,3 	Op < 
110:    LDC  3,1(6) 	True case 
111:    JLT  4,1(7) 	Jump if true 
112:    LDC  3,0(6) 	False case 
113:    LDC  4,1(6) 	Load constant 1 
114:    SUB  3,3,4 	While cond check 
115:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* IF
117:     LD  3,-3(1) 	Load variable r
118:    LDA  4,0(0) 	Load address of base of array row
119:    SUB  3,4,3 	Compute offset of value 
120:     LD  3,0(3) 	Load the value 
121:     ST  3,-4(1) 	Save left side in temp 
122:    LDC  3,0(6) 	Load constant 
123:     LD  4,-4(1) 	Load left from temp into ac1 
124:    SUB  4,4,3 	Op == 
125:    LDC  3,1(6) 	True case 
126:    JEQ  4,1(7) 	Jump if true 
127:    LDC  3,0(6) 	False case 
128:     ST  3,-4(1) 	Save left side in temp 
129:     LD  3,-3(1) 	Load variable r
130:     ST  3,-5(1) 	Save left side in temp 
131:     LD  3,-2(1) 	Load variable c
132:     LD  4,-5(1) 	Load left from temp into ac1 
133:    ADD  3,4,3 	Op + 
134:    LDA  4,-24(0) 	Load address of base of array diagone
135:    SUB  3,4,3 	Compute offset of value 
136:     LD  3,0(3) 	Load the value 
137:     ST  3,-5(1) 	Save left side in temp 
138:    LDC  3,0(6) 	Load constant 
139:     LD  4,-5(1) 	Load left from temp into ac1 
140:    SUB  4,4,3 	Op == 
141:    LDC  3,1(6) 	True case 
142:    JEQ  4,1(7) 	Jump if true 
143:    LDC  3,0(6) 	False case 
144:     LD  4,-4(1) 	Load left from temp into ac1 
145:    JEQ  3,3(7) 	Jump if false for Op && 
146:    LDC  3,0(6) 	False case 
147:    JEQ  4,1(7) 	Jump if false 
148:    LDC  3,1(6) 	True case 
149:     ST  3,-4(1) 	Save left side in temp 
150:     LD  3,-3(1) 	Load variable r
151:     ST  3,-5(1) 	Save left side in temp 
152:     LD  3,-74(0) 	Load variable n
153:     ST  3,-6(1) 	Save left side in temp 
154:    LDC  3,1(6) 	Load constant 
155:     LD  4,-6(1) 	Load left from temp into ac1 
156:    SUB  3,4,3 	Op - 
157:     LD  4,-5(1) 	Load left from temp into ac1 
158:    ADD  3,4,3 	Op + 
159:     ST  3,-5(1) 	Save left side in temp 
160:     LD  3,-2(1) 	Load variable c
161:     LD  4,-5(1) 	Load left from temp into ac1 
162:    SUB  3,4,3 	Op - 
163:    LDA  4,-49(0) 	Load address of base of array diagtwo
164:    SUB  3,4,3 	Compute offset of value 
165:     LD  3,0(3) 	Load the value 
166:     ST  3,-5(1) 	Save left side in temp 
167:    LDC  3,0(6) 	Load constant 
168:     LD  4,-5(1) 	Load left from temp into ac1 
169:    SUB  4,4,3 	Op == 
170:    LDC  3,1(6) 	True case 
171:    JEQ  4,1(7) 	Jump if true 
172:    LDC  3,0(6) 	False case 
173:     LD  4,-4(1) 	Load left from temp into ac1 
174:    JEQ  3,3(7) 	Jump if false for Op && 
175:    LDC  3,0(6) 	False case 
176:    JEQ  4,1(7) 	Jump if false 
177:    LDC  3,1(6) 	True case 
178:    LDC  4,1(6) 	Load constant 1 
179:    SUB  3,3,4 	If cond check 
180:    JGE  3,1(7) 	Jump to then part 
* THEN
* BEGIN compound statement
* 37
182:     LD  3,-3(1) 	Load variable r
183:     ST  3,-4(1) 	Save index in temp 
184:    LDC  3,1(6) 	Load constant 
185:     LD  4,-4(1) 	load index from temp to ac1 
186:    LDA  5,0(0) 	Load address of base of array row
187:    SUB  5,5,4 	Compute offset of value 
188:     ST  3,0(5) 	Store variable row
* 38
189:     LD  3,-2(1) 	Load variable c
190:     ST  3,-4(1) 	Save index in temp 
191:     LD  3,-3(1) 	Load variable r
192:     LD  4,-4(1) 	load index from temp to ac1 
193:    LDA  5,-12(0) 	Load address of base of array col
194:    SUB  5,5,4 	Compute offset of value 
195:     ST  3,0(5) 	Store variable col
* 39
196:     LD  3,-3(1) 	Load variable r
197:     ST  3,-4(1) 	Save left side in temp 
198:     LD  3,-2(1) 	Load variable c
199:     LD  4,-4(1) 	Load left from temp into ac1 
200:    ADD  3,4,3 	Op + 
201:     ST  3,-4(1) 	Save index in temp 
202:    LDC  3,1(6) 	Load constant 
203:     LD  4,-4(1) 	load index from temp to ac1 
204:    LDA  5,-24(0) 	Load address of base of array diagone
205:    SUB  5,5,4 	Compute offset of value 
206:     ST  3,0(5) 	Store variable diagone
* 40
207:     LD  3,-3(1) 	Load variable r
208:     ST  3,-4(1) 	Save left side in temp 
209:     LD  3,-74(0) 	Load variable n
210:     ST  3,-5(1) 	Save left side in temp 
211:    LDC  3,1(6) 	Load constant 
212:     LD  4,-5(1) 	Load left from temp into ac1 
213:    SUB  3,4,3 	Op - 
214:     LD  4,-4(1) 	Load left from temp into ac1 
215:    ADD  3,4,3 	Op + 
216:     ST  3,-4(1) 	Save left side in temp 
217:     LD  3,-2(1) 	Load variable c
218:     LD  4,-4(1) 	Load left from temp into ac1 
219:    SUB  3,4,3 	Op - 
220:     ST  3,-4(1) 	Save index in temp 
221:    LDC  3,1(6) 	Load constant 
222:     LD  4,-4(1) 	load index from temp to ac1 
223:    LDA  5,-49(0) 	Load address of base of array diagtwo
224:    SUB  5,5,4 	Compute offset of value 
225:     ST  3,0(5) 	Store variable diagtwo
* 41
226:     ST  1,-4(1) 	Store old fp in ghost frame 
227:     LD  3,-2(1) 	Load variable c
228:     ST  3,-6(1) 	Save left side in temp 
229:    LDC  3,1(6) 	Load constant 
230:     LD  4,-6(1) 	Load left from temp into ac1 
231:    ADD  3,4,3 	Op + 
232:     ST  3,-6(1) 	Store parameter 
233:    LDA  1,-4(1) 	Load address of new frame 
234:    LDA  3,1(7) 	Return address in ac 
235:    LDA  7,-154(7) 	call try
236:    LDA  3,0(2) 	Save the result in ac 
* 42
237:     LD  3,-3(1) 	Load variable r
238:     ST  3,-4(1) 	Save index in temp 
239:    LDC  3,0(6) 	Load constant 
240:     LD  4,-4(1) 	load index from temp to ac1 
241:    LDA  5,0(0) 	Load address of base of array row
242:    SUB  5,5,4 	Compute offset of value 
243:     ST  3,0(5) 	Store variable row
* 43
244:     LD  3,-3(1) 	Load variable r
245:     ST  3,-4(1) 	Save left side in temp 
246:     LD  3,-2(1) 	Load variable c
247:     LD  4,-4(1) 	Load left from temp into ac1 
248:    ADD  3,4,3 	Op + 
249:     ST  3,-4(1) 	Save index in temp 
250:    LDC  3,0(6) 	Load constant 
251:     LD  4,-4(1) 	load index from temp to ac1 
252:    LDA  5,-24(0) 	Load address of base of array diagone
253:    SUB  5,5,4 	Compute offset of value 
254:     ST  3,0(5) 	Store variable diagone
* 44
255:     LD  3,-3(1) 	Load variable r
256:     ST  3,-4(1) 	Save left side in temp 
257:     LD  3,-74(0) 	Load variable n
258:     ST  3,-5(1) 	Save left side in temp 
259:    LDC  3,1(6) 	Load constant 
260:     LD  4,-5(1) 	Load left from temp into ac1 
261:    SUB  3,4,3 	Op - 
262:     LD  4,-4(1) 	Load left from temp into ac1 
263:    ADD  3,4,3 	Op + 
264:     ST  3,-4(1) 	Save left side in temp 
265:     LD  3,-2(1) 	Load variable c
266:     LD  4,-4(1) 	Load left from temp into ac1 
267:    SUB  3,4,3 	Op - 
268:     ST  3,-4(1) 	Save index in temp 
269:    LDC  3,0(6) 	Load constant 
270:     LD  4,-4(1) 	load index from temp to ac1 
271:    LDA  5,-49(0) 	Load address of base of array diagtwo
272:    SUB  5,5,4 	Compute offset of value 
273:     ST  3,0(5) 	Store variable diagtwo
* END compound statement
181:    LDA  7,92(7) 	Jump around the THEN 
* ENDIF
* 46
274:     LD  3,-3(1) 	Load variable r
275:     ST  3,-4(1) 	Save left side in temp 
276:    LDC  3,1(6) 	Load constant 
277:     LD  4,-4(1) 	Load left from temp into ac1 
278:    ADD  3,4,3 	Op + 
279:     ST  3,-3(1) 	Store variable r
* END compound statement
280:    LDA  7,-176(7) 	go to beginning of loop 
116:    LDA  7,164(7) 	No more loop 
* ENDWHILE
* END compound statement
102:    LDA  7,178(7) 	Jump around the ELSE 
* ENDIF
* END compound statement
* Add standard closing in case there is no return statement
281:    LDC  2,0(6) 	Set return value to 0 
282:     LD  3,-1(1) 	Load return address 
283:     LD  1,0(1) 	Adjust fp 
284:    LDA  7,0(3) 	Return 
* END of function try
* BEGIN function solve
285:     ST  3,-1(1) 	Store return address. BEGIN FUNC: solve
* BEGIN compound statement
* 55
286:     LD  3,-2(1) 	Load variable num
287:     ST  3,-74(0) 	Store variable n
* 56
288:    LDC  3,0(6) 	Load constant 
289:     ST  3,-75(0) 	Store variable count
* 57
290:     ST  1,-3(1) 	Store old fp in ghost frame 
291:    LDC  3,0(6) 	Load constant 
292:     ST  3,-5(1) 	Store parameter 
293:    LDA  1,-3(1) 	Load address of new frame 
294:    LDA  3,1(7) 	Return address in ac 
295:    LDA  7,-214(7) 	call try
296:    LDA  3,0(2) 	Save the result in ac 
* RETURN
297:     LD  3,-75(0) 	Load variable count
298:    LDA  2,0(3) 	Copy result to rt register 
299:     LD  3,-1(1) 	Load return address 
300:     LD  1,0(1) 	Adjust fp 
301:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
302:    LDC  2,0(6) 	Set return value to 0 
303:     LD  3,-1(1) 	Load return address 
304:     LD  1,0(1) 	Adjust fp 
305:    LDA  7,0(3) 	Return 
* END of function solve
* BEGIN function main
  4:    LDA  7,301(7) 	Jump to main 
306:     ST  3,-1(1) 	Store return address. BEGIN FUNC: main
* BEGIN compound statement
* WHILE
307:     ST  1,-3(1) 	Store old fp in ghost frame 
308:    LDA  1,-3(1) 	Load address of new frame 
309:    LDA  3,1(7) 	Return address in ac 
310:    LDA  7,-305(7) 	call input
311:    LDA  3,0(2) 	Save the result in ac 
312:     ST  3,-2(1) 	Store variable num
313:     ST  3,-3(1) 	Save left side in temp 
314:    LDC  3,0(6) 	Load constant 
315:     LD  4,-3(1) 	Load left from temp into ac1 
316:    SUB  4,4,3 	Op > 
317:    LDC  3,1(6) 	True case 
318:    JGT  4,1(7) 	Jump if true 
319:    LDC  3,0(6) 	False case 
320:    LDC  4,1(6) 	Load constant 1 
321:    SUB  3,3,4 	While cond check 
322:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 68
324:     ST  1,-3(1) 	Store old fp in ghost frame 
325:     ST  1,-5(1) 	Store old fp in ghost frame 
326:     LD  3,-2(1) 	Load variable num
327:     ST  3,-7(1) 	Store parameter 
328:    LDA  1,-5(1) 	Load address of new frame 
329:    LDA  3,1(7) 	Return address in ac 
330:    LDA  7,-46(7) 	call solve
331:    LDA  3,0(2) 	Save the result in ac 
332:     ST  3,-5(1) 	Store parameter 
333:    LDA  1,-3(1) 	Load address of new frame 
334:    LDA  3,1(7) 	Return address in ac 
335:    LDA  7,-325(7) 	call output
336:    LDA  3,0(2) 	Save the result in ac 
* 69
337:     ST  1,-3(1) 	Store old fp in ghost frame 
338:    LDA  1,-3(1) 	Load address of new frame 
339:    LDA  3,1(7) 	Return address in ac 
340:    LDA  7,-311(7) 	call outnl
341:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
342:    LDA  7,-36(7) 	go to beginning of loop 
323:    LDA  7,19(7) 	No more loop 
* ENDWHILE
* END compound statement
* Add standard closing in case there is no return statement
343:    LDC  2,0(6) 	Set return value to 0 
344:     LD  3,-1(1) 	Load return address 
345:     LD  1,0(1) 	Adjust fp 
346:    LDA  7,0(3) 	Return 
* END of function main
