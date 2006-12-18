* C- compiler version 1.0
* Author: Robert B. Heckendorn
* Apr 13, 2004
* BEGIN Prolog
  0:     LD  0,0(0) 	set the global pointer 
  1:    LDA  1,-5(0) 	set first frame at end of globals 
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
* BEGIN function get
 30:     ST  3,-1(1) 	Store return address to caller 
* BEGIN
* 
 31:     ST  1,-4(1) 	Store old fp in ghost frame 
 32:    LDC  3,0(6) 	Load constant 
 33:     ST  3,-6(1) 	Save index 
 34:     LD  3,-2(1) 	Load address of base of array x
 35:     LD  4,-6(1) 	Load index 
 36:    SUB  3,3,4 	Compute offset of value 
 37:     LD  3,0(3) 	Load the value 
 38:     ST  3,-6(1) 	Store parameter 
 39:    LDA  1,-4(1) 	Load address of new frame 
 40:    LDA  3,1(7) 	Return address in ac 
 41:    LDA  7,-31(7) 	call output
 42:    LDA  3,0(2) 	Save the result in ac 
* 
 43:    LDC  3,666(6) 	Load constant 
 44:     ST  3,-4(1) 	Save assign value 
 45:    LDC  3,1(6) 	Load constant 
 46:     ST  3,-5(1) 	Save index 
 47:     LD  5,-5(1) 	Load index 
 48:     LD  4,-4(1) 	Load value 
 49:     LD  3,-2(1) 	Load address of base of array x
 50:    SUB  3,3,5 	Compute offset of value 
 51:     ST  4,0(3) 	Store the value 
 52:    LDA  3,0(4) 	Adjust ac 
* RETURN
 53:     LD  3,-3(1) 	Load variable i
 54:     ST  3,-4(1) 	Save index 
 55:     LD  3,-2(1) 	Load address of base of array x
 56:     LD  4,-4(1) 	Load index 
 57:    SUB  3,3,4 	Compute offset of value 
 58:     LD  3,0(3) 	Load the value 
 59:    LDA  2,0(3) 	Copy result to rt register 
 60:     LD  3,-1(1) 	Load return address 
 61:     LD  1,0(1) 	Adjust fp 
 62:    LDA  7,0(3) 	Return 
* END
* Add standard closing in case there is no return statement
 63:    LDC  2,0(6) 	Set return value to 0 
 64:     LD  3,-1(1) 	Load return address 
 65:     LD  1,0(1) 	Adjust fp 
 66:    LDA  7,0(3) 	Return 
* END of function get
* BEGIN function main
  4:    LDA  7,62(7) 	Jump to main 
 67:     ST  3,-1(1) 	Store return address to caller 
* BEGIN
* 
 68:    LDC  3,2(6) 	Load constant 
 69:     ST  3,-7(1) 	Store variable dog
* 
 70:    LDC  3,3(6) 	Load constant 
 71:     ST  3,-8(1) 	Save assign value 
 72:    LDC  3,0(6) 	Load constant 
 73:     ST  3,-9(1) 	Save index 
 74:     LD  5,-9(1) 	Load index 
 75:     LD  4,-8(1) 	Load value 
 76:    LDA  3,-2(1) 	Load address of base of array x
 77:    SUB  3,3,5 	Compute offset of value 
 78:     ST  4,0(3) 	Store the value 
 79:    LDA  3,0(4) 	Adjust ac 
* 
 80:     ST  1,-8(1) 	Store old fp in ghost frame 
 81:    LDC  3,0(6) 	Load constant 
 82:     ST  3,-10(1) 	Save index 
 83:    LDA  3,-2(1) 	Load address of base of array x
 84:     LD  4,-10(1) 	Load index 
 85:    SUB  3,3,4 	Compute offset of value 
 86:     LD  3,0(3) 	Load the value 
 87:     ST  3,-10(1) 	Store parameter 
 88:    LDA  1,-8(1) 	Load address of new frame 
 89:    LDA  3,1(7) 	Return address in ac 
 90:    LDA  7,-80(7) 	call output
 91:    LDA  3,0(2) 	Save the result in ac 
* 
 92:    LDC  3,0(6) 	Load constant 
 93:     ST  3,-8(1) 	Save index 
 94:    LDA  3,-2(1) 	Load address of base of array x
 95:     LD  4,-8(1) 	Load index 
 96:    SUB  3,3,4 	Compute offset of value 
 97:     LD  3,0(3) 	Load the value 
 98:     ST  3,-8(1) 	Save assign value 
 99:    LDC  3,1(6) 	Load constant 
100:     ST  3,-9(1) 	Save index 
101:     LD  5,-9(1) 	Load index 
102:     LD  4,-8(1) 	Load value 
103:    LDA  3,-2(1) 	Load address of base of array x
104:    SUB  3,3,5 	Compute offset of value 
105:     ST  4,0(3) 	Store the value 
106:    LDA  3,0(4) 	Adjust ac 
* 
107:     ST  1,-8(1) 	Store old fp in ghost frame 
108:    LDC  3,1(6) 	Load constant 
109:     ST  3,-10(1) 	Save index 
110:    LDA  3,-2(1) 	Load address of base of array x
111:     LD  4,-10(1) 	Load index 
112:    SUB  3,3,4 	Compute offset of value 
113:     LD  3,0(3) 	Load the value 
114:     ST  3,-10(1) 	Store parameter 
115:    LDA  1,-8(1) 	Load address of new frame 
116:    LDA  3,1(7) 	Return address in ac 
117:    LDA  7,-107(7) 	call output
118:    LDA  3,0(2) 	Save the result in ac 
* 
119:    LDC  3,1(6) 	Load constant 
120:     ST  3,-8(1) 	Save index 
121:    LDA  3,-2(1) 	Load address of base of array x
122:     LD  4,-8(1) 	Load index 
123:    SUB  3,3,4 	Compute offset of value 
124:     LD  3,0(3) 	Load the value 
125:     ST  3,-8(1) 	Save left side 
126:    LDC  3,1(6) 	Load constant 
127:     LD  4,-8(1) 	Load left into ac1 
128:    ADD  3,4,3 	op + 
129:     ST  3,-8(1) 	Save assign value 
130:    LDC  3,2(6) 	Load constant 
131:     ST  3,-9(1) 	Save index 
132:     LD  5,-9(1) 	Load index 
133:     LD  4,-8(1) 	Load value 
134:    LDA  3,-2(1) 	Load address of base of array x
135:    SUB  3,3,5 	Compute offset of value 
136:     ST  4,0(3) 	Store the value 
137:    LDA  3,0(4) 	Adjust ac 
* 
138:     ST  1,-8(1) 	Store old fp in ghost frame 
139:    LDC  3,2(6) 	Load constant 
140:     ST  3,-10(1) 	Save index 
141:    LDA  3,-2(1) 	Load address of base of array x
142:     LD  4,-10(1) 	Load index 
143:    SUB  3,3,4 	Compute offset of value 
144:     LD  3,0(3) 	Load the value 
145:     ST  3,-10(1) 	Store parameter 
146:    LDA  1,-8(1) 	Load address of new frame 
147:    LDA  3,1(7) 	Return address in ac 
148:    LDA  7,-138(7) 	call output
149:    LDA  3,0(2) 	Save the result in ac 
* 
150:    LDC  3,496(6) 	Load constant 
151:     ST  3,-8(1) 	Save assign value 
152:     LD  3,-7(1) 	Load variable dog
153:     ST  3,-9(1) 	Save left side 
154:     LD  3,-7(1) 	Load variable dog
155:     LD  4,-9(1) 	Load left into ac1 
156:    ADD  3,4,3 	op + 
157:     ST  3,-9(1) 	Save index 
158:     LD  5,-9(1) 	Load index 
159:     LD  4,-8(1) 	Load value 
160:    LDA  3,-2(1) 	Load address of base of array x
161:    SUB  3,3,5 	Compute offset of value 
162:     ST  4,0(3) 	Store the value 
163:    LDA  3,0(4) 	Adjust ac 
* 
164:     ST  1,-8(1) 	Store old fp in ghost frame 
165:    LDC  3,4(6) 	Load constant 
166:     ST  3,-10(1) 	Save index 
167:    LDA  3,-2(1) 	Load address of base of array x
168:     LD  4,-10(1) 	Load index 
169:    SUB  3,3,4 	Compute offset of value 
170:     LD  3,0(3) 	Load the value 
171:     ST  3,-10(1) 	Store parameter 
172:    LDA  1,-8(1) 	Load address of new frame 
173:    LDA  3,1(7) 	Return address in ac 
174:    LDA  7,-164(7) 	call output
175:    LDA  3,0(2) 	Save the result in ac 
* 
176:    LDC  3,2(6) 	Load constant 
177:     ST  3,-7(1) 	Store variable dog
* 
178:    LDC  3,3(6) 	Load constant 
179:     ST  3,-8(1) 	Save assign value 
180:    LDC  3,0(6) 	Load constant 
181:     ST  3,-9(1) 	Save index 
182:     LD  5,-9(1) 	Load index 
183:     LD  4,-8(1) 	Load value 
184:    LDA  3,0(0) 	Load address of base of array y
185:    SUB  3,3,5 	Compute offset of value 
186:     ST  4,0(3) 	Store the value 
187:    LDA  3,0(4) 	Adjust ac 
* 
188:     ST  1,-8(1) 	Store old fp in ghost frame 
189:    LDC  3,0(6) 	Load constant 
190:     ST  3,-10(1) 	Save index 
191:    LDA  3,0(0) 	Load address of base of array y
192:     LD  4,-10(1) 	Load index 
193:    SUB  3,3,4 	Compute offset of value 
194:     LD  3,0(3) 	Load the value 
195:     ST  3,-10(1) 	Store parameter 
196:    LDA  1,-8(1) 	Load address of new frame 
197:    LDA  3,1(7) 	Return address in ac 
198:    LDA  7,-188(7) 	call output
199:    LDA  3,0(2) 	Save the result in ac 
* 
200:    LDC  3,0(6) 	Load constant 
201:     ST  3,-8(1) 	Save index 
202:    LDA  3,0(0) 	Load address of base of array y
203:     LD  4,-8(1) 	Load index 
204:    SUB  3,3,4 	Compute offset of value 
205:     LD  3,0(3) 	Load the value 
206:     ST  3,-8(1) 	Save assign value 
207:    LDC  3,1(6) 	Load constant 
208:     ST  3,-9(1) 	Save index 
209:     LD  5,-9(1) 	Load index 
210:     LD  4,-8(1) 	Load value 
211:    LDA  3,0(0) 	Load address of base of array y
212:    SUB  3,3,5 	Compute offset of value 
213:     ST  4,0(3) 	Store the value 
214:    LDA  3,0(4) 	Adjust ac 
* 
215:     ST  1,-8(1) 	Store old fp in ghost frame 
216:    LDC  3,1(6) 	Load constant 
217:     ST  3,-10(1) 	Save index 
218:    LDA  3,0(0) 	Load address of base of array y
219:     LD  4,-10(1) 	Load index 
220:    SUB  3,3,4 	Compute offset of value 
221:     LD  3,0(3) 	Load the value 
222:     ST  3,-10(1) 	Store parameter 
223:    LDA  1,-8(1) 	Load address of new frame 
224:    LDA  3,1(7) 	Return address in ac 
225:    LDA  7,-215(7) 	call output
226:    LDA  3,0(2) 	Save the result in ac 
* 
227:    LDC  3,1(6) 	Load constant 
228:     ST  3,-8(1) 	Save index 
229:    LDA  3,0(0) 	Load address of base of array y
230:     LD  4,-8(1) 	Load index 
231:    SUB  3,3,4 	Compute offset of value 
232:     LD  3,0(3) 	Load the value 
233:     ST  3,-8(1) 	Save left side 
234:    LDC  3,311(6) 	Load constant 
235:     LD  4,-8(1) 	Load left into ac1 
236:    ADD  3,4,3 	op + 
237:     ST  3,-8(1) 	Save assign value 
238:    LDC  3,2(6) 	Load constant 
239:     ST  3,-9(1) 	Save index 
240:     LD  5,-9(1) 	Load index 
241:     LD  4,-8(1) 	Load value 
242:    LDA  3,0(0) 	Load address of base of array y
243:    SUB  3,3,5 	Compute offset of value 
244:     ST  4,0(3) 	Store the value 
245:    LDA  3,0(4) 	Adjust ac 
* 
246:     ST  1,-8(1) 	Store old fp in ghost frame 
247:    LDC  3,2(6) 	Load constant 
248:     ST  3,-10(1) 	Save index 
249:    LDA  3,0(0) 	Load address of base of array y
250:     LD  4,-10(1) 	Load index 
251:    SUB  3,3,4 	Compute offset of value 
252:     LD  3,0(3) 	Load the value 
253:     ST  3,-10(1) 	Store parameter 
254:    LDA  1,-8(1) 	Load address of new frame 
255:    LDA  3,1(7) 	Return address in ac 
256:    LDA  7,-246(7) 	call output
257:    LDA  3,0(2) 	Save the result in ac 
* 
258:    LDC  3,496(6) 	Load constant 
259:     ST  3,-8(1) 	Save assign value 
260:     LD  3,-7(1) 	Load variable dog
261:     ST  3,-9(1) 	Save left side 
262:     LD  3,-7(1) 	Load variable dog
263:     LD  4,-9(1) 	Load left into ac1 
264:    ADD  3,4,3 	op + 
265:     ST  3,-9(1) 	Save index 
266:     LD  5,-9(1) 	Load index 
267:     LD  4,-8(1) 	Load value 
268:    LDA  3,0(0) 	Load address of base of array y
269:    SUB  3,3,5 	Compute offset of value 
270:     ST  4,0(3) 	Store the value 
271:    LDA  3,0(4) 	Adjust ac 
* 
272:     ST  1,-8(1) 	Store old fp in ghost frame 
273:    LDC  3,4(6) 	Load constant 
274:     ST  3,-10(1) 	Save index 
275:    LDA  3,0(0) 	Load address of base of array y
276:     LD  4,-10(1) 	Load index 
277:    SUB  3,3,4 	Compute offset of value 
278:     LD  3,0(3) 	Load the value 
279:     ST  3,-10(1) 	Store parameter 
280:    LDA  1,-8(1) 	Load address of new frame 
281:    LDA  3,1(7) 	Return address in ac 
282:    LDA  7,-272(7) 	call output
283:    LDA  3,0(2) 	Save the result in ac 
* 
284:     ST  1,-8(1) 	Store old fp in ghost frame 
285:    LDA  3,0(0) 	Load address of base of array y
286:     ST  3,-10(1) 	Store parameter 
287:    LDC  3,2(6) 	Load constant 
288:     ST  3,-11(1) 	Store parameter 
289:    LDA  1,-8(1) 	Load address of new frame 
290:    LDA  3,1(7) 	Return address in ac 
291:    LDA  7,-262(7) 	call get
292:    LDA  3,0(2) 	Save the result in ac 
293:     ST  3,-7(1) 	Store variable dog
* 
294:     ST  1,-8(1) 	Store old fp in ghost frame 
295:     LD  3,-7(1) 	Load variable dog
296:     ST  3,-10(1) 	Store parameter 
297:    LDA  1,-8(1) 	Load address of new frame 
298:    LDA  3,1(7) 	Return address in ac 
299:    LDA  7,-289(7) 	call output
300:    LDA  3,0(2) 	Save the result in ac 
* 
301:     ST  1,-8(1) 	Store old fp in ghost frame 
302:     ST  1,-10(1) 	Store old fp in ghost frame 
303:    LDA  3,0(0) 	Load address of base of array y
304:     ST  3,-12(1) 	Store parameter 
305:    LDC  3,2(6) 	Load constant 
306:     ST  3,-13(1) 	Store parameter 
307:    LDA  1,-10(1) 	Load address of new frame 
308:    LDA  3,1(7) 	Return address in ac 
309:    LDA  7,-280(7) 	call get
310:    LDA  3,0(2) 	Save the result in ac 
311:     ST  3,-10(1) 	Store parameter 
312:    LDA  1,-8(1) 	Load address of new frame 
313:    LDA  3,1(7) 	Return address in ac 
314:    LDA  7,-304(7) 	call output
315:    LDA  3,0(2) 	Save the result in ac 
* 
316:     ST  1,-8(1) 	Store old fp in ghost frame 
317:    LDC  3,1(6) 	Load constant 
318:     ST  3,-10(1) 	Save index 
319:    LDA  3,-2(1) 	Load address of base of array x
320:     LD  4,-10(1) 	Load index 
321:    SUB  3,3,4 	Compute offset of value 
322:     LD  3,0(3) 	Load the value 
323:     ST  3,-10(1) 	Store parameter 
324:    LDA  1,-8(1) 	Load address of new frame 
325:    LDA  3,1(7) 	Return address in ac 
326:    LDA  7,-316(7) 	call output
327:    LDA  3,0(2) 	Save the result in ac 
* END
* Add standard closing in case there is no return statement
328:    LDC  2,0(6) 	Set return value to 0 
329:     LD  3,-1(1) 	Load return address 
330:     LD  1,0(1) 	Adjust fp 
331:    LDA  7,0(3) 	Return 
* END of function main
