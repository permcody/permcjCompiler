* C- compiler version C-06
* Author: Robert B. Heckendorn
* Backend coauthor: Jorge Williams
* Apr 1, 2006
* BEGIN Prolog
  0:     LD  0,0(0) 	Set the global pointer 
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
* BEGIN function outnl
 30:     ST  3,-1(1) 	Store return address 
 31:  OUTNL  3,3,3 	Output a newline 
 32:     LD  3,-1(1) 	Load return address 
 33:     LD  1,0(1) 	Adjust fp 
 34:    LDA  7,0(3) 	Return 
* END of function outnl
* BEGIN function get
 35:     ST  3,-1(1) 	Store return address. BEGIN FUNC: get
* BEGIN compound statement
* 6
 36:     ST  1,-4(1) 	Store old fp in ghost frame 
 37:    LDC  3,0(6) 	Load constant 
 38:     LD  4,-2(1) 	Load address of base of array x
 39:    SUB  3,4,3 	Compute offset of value 
 40:     LD  3,0(3) 	Load the value 
 41:     ST  3,-6(1) 	Store parameter 
 42:    LDA  1,-4(1) 	Load address of new frame 
 43:    LDA  3,1(7) 	Return address in ac 
 44:    LDA  7,-34(7) 	call output
 45:    LDA  3,0(2) 	Save the result in ac 
* 7
 46:     ST  1,-4(1) 	Store old fp in ghost frame 
 47:    LDA  1,-4(1) 	Load address of new frame 
 48:    LDA  3,1(7) 	Return address in ac 
 49:    LDA  7,-20(7) 	call outnl
 50:    LDA  3,0(2) 	Save the result in ac 
* 8
 51:    LDC  3,1(6) 	Load constant 
 52:     ST  3,-4(1) 	Save index in temp 
 53:    LDC  3,666(6) 	Load constant 
 54:     LD  4,-4(1) 	load index from temp to ac1 
 55:     LD  5,-2(1) 	Load address of base of array x
 56:    SUB  5,5,4 	Compute offset of value 
 57:     ST  3,0(5) 	Store variable x
* RETURN
 58:     LD  3,-3(1) 	Load variable i
 59:     LD  4,-2(1) 	Load address of base of array x
 60:    SUB  3,4,3 	Compute offset of value 
 61:     LD  3,0(3) 	Load the value 
 62:    LDA  2,0(3) 	Copy result to rt register 
 63:     LD  3,-1(1) 	Load return address 
 64:     LD  1,0(1) 	Adjust fp 
 65:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
 66:    LDC  2,0(6) 	Set return value to 0 
 67:     LD  3,-1(1) 	Load return address 
 68:     LD  1,0(1) 	Adjust fp 
 69:    LDA  7,0(3) 	Return 
* END of function get
* BEGIN function main
  4:    LDA  7,65(7) 	Jump to main 
 70:     ST  3,-1(1) 	Store return address. BEGIN FUNC: main
* BEGIN compound statement
* 17
 71:    LDC  3,2(6) 	Load constant 
 72:     ST  3,-7(1) 	Store variable dog
* 18
 73:    LDC  3,0(6) 	Load constant 
 74:     ST  3,-8(1) 	Save index in temp 
 75:    LDC  3,3(6) 	Load constant 
 76:     LD  4,-8(1) 	load index from temp to ac1 
 77:    LDA  5,-2(1) 	Load address of base of array x
 78:    SUB  5,5,4 	Compute offset of value 
 79:     ST  3,0(5) 	Store variable x
* 19
 80:     ST  1,-8(1) 	Store old fp in ghost frame 
 81:    LDC  3,0(6) 	Load constant 
 82:    LDA  4,-2(1) 	Load address of base of array x
 83:    SUB  3,4,3 	Compute offset of value 
 84:     LD  3,0(3) 	Load the value 
 85:     ST  3,-10(1) 	Store parameter 
 86:    LDA  1,-8(1) 	Load address of new frame 
 87:    LDA  3,1(7) 	Return address in ac 
 88:    LDA  7,-78(7) 	call output
 89:    LDA  3,0(2) 	Save the result in ac 
* 20
 90:    LDC  3,1(6) 	Load constant 
 91:     ST  3,-8(1) 	Save index in temp 
 92:    LDC  3,0(6) 	Load constant 
 93:    LDA  4,-2(1) 	Load address of base of array x
 94:    SUB  3,4,3 	Compute offset of value 
 95:     LD  3,0(3) 	Load the value 
 96:     LD  4,-8(1) 	load index from temp to ac1 
 97:    LDA  5,-2(1) 	Load address of base of array x
 98:    SUB  5,5,4 	Compute offset of value 
 99:     ST  3,0(5) 	Store variable x
* 21
100:     ST  1,-8(1) 	Store old fp in ghost frame 
101:    LDC  3,1(6) 	Load constant 
102:    LDA  4,-2(1) 	Load address of base of array x
103:    SUB  3,4,3 	Compute offset of value 
104:     LD  3,0(3) 	Load the value 
105:     ST  3,-10(1) 	Store parameter 
106:    LDA  1,-8(1) 	Load address of new frame 
107:    LDA  3,1(7) 	Return address in ac 
108:    LDA  7,-98(7) 	call output
109:    LDA  3,0(2) 	Save the result in ac 
* 22
110:    LDC  3,2(6) 	Load constant 
111:     ST  3,-8(1) 	Save index in temp 
112:    LDC  3,1(6) 	Load constant 
113:    LDA  4,-2(1) 	Load address of base of array x
114:    SUB  3,4,3 	Compute offset of value 
115:     LD  3,0(3) 	Load the value 
116:     ST  3,-9(1) 	Save left side in temp 
117:    LDC  3,1(6) 	Load constant 
118:     LD  4,-9(1) 	Load left from temp into ac1 
119:    ADD  3,4,3 	Op + 
120:     LD  4,-8(1) 	load index from temp to ac1 
121:    LDA  5,-2(1) 	Load address of base of array x
122:    SUB  5,5,4 	Compute offset of value 
123:     ST  3,0(5) 	Store variable x
* 23
124:     ST  1,-8(1) 	Store old fp in ghost frame 
125:    LDC  3,2(6) 	Load constant 
126:    LDA  4,-2(1) 	Load address of base of array x
127:    SUB  3,4,3 	Compute offset of value 
128:     LD  3,0(3) 	Load the value 
129:     ST  3,-10(1) 	Store parameter 
130:    LDA  1,-8(1) 	Load address of new frame 
131:    LDA  3,1(7) 	Return address in ac 
132:    LDA  7,-122(7) 	call output
133:    LDA  3,0(2) 	Save the result in ac 
* 24
134:     LD  3,-7(1) 	Load variable dog
135:     ST  3,-8(1) 	Save left side in temp 
136:     LD  3,-7(1) 	Load variable dog
137:     LD  4,-8(1) 	Load left from temp into ac1 
138:    ADD  3,4,3 	Op + 
139:     ST  3,-8(1) 	Save index in temp 
140:    LDC  3,496(6) 	Load constant 
141:     LD  4,-8(1) 	load index from temp to ac1 
142:    LDA  5,-2(1) 	Load address of base of array x
143:    SUB  5,5,4 	Compute offset of value 
144:     ST  3,0(5) 	Store variable x
* 25
145:     ST  1,-8(1) 	Store old fp in ghost frame 
146:    LDC  3,4(6) 	Load constant 
147:    LDA  4,-2(1) 	Load address of base of array x
148:    SUB  3,4,3 	Compute offset of value 
149:     LD  3,0(3) 	Load the value 
150:     ST  3,-10(1) 	Store parameter 
151:    LDA  1,-8(1) 	Load address of new frame 
152:    LDA  3,1(7) 	Return address in ac 
153:    LDA  7,-143(7) 	call output
154:    LDA  3,0(2) 	Save the result in ac 
* 26
155:     ST  1,-8(1) 	Store old fp in ghost frame 
156:    LDA  1,-8(1) 	Load address of new frame 
157:    LDA  3,1(7) 	Return address in ac 
158:    LDA  7,-129(7) 	call outnl
159:    LDA  3,0(2) 	Save the result in ac 
* 28
160:    LDC  3,2(6) 	Load constant 
161:     ST  3,-7(1) 	Store variable dog
* 29
162:    LDC  3,0(6) 	Load constant 
163:     ST  3,-8(1) 	Save index in temp 
164:    LDC  3,3(6) 	Load constant 
165:     LD  4,-8(1) 	load index from temp to ac1 
166:    LDA  5,0(0) 	Load address of base of array y
167:    SUB  5,5,4 	Compute offset of value 
168:     ST  3,0(5) 	Store variable y
* 30
169:     ST  1,-8(1) 	Store old fp in ghost frame 
170:    LDC  3,0(6) 	Load constant 
171:    LDA  4,0(0) 	Load address of base of array y
172:    SUB  3,4,3 	Compute offset of value 
173:     LD  3,0(3) 	Load the value 
174:     ST  3,-10(1) 	Store parameter 
175:    LDA  1,-8(1) 	Load address of new frame 
176:    LDA  3,1(7) 	Return address in ac 
177:    LDA  7,-167(7) 	call output
178:    LDA  3,0(2) 	Save the result in ac 
* 31
179:    LDC  3,1(6) 	Load constant 
180:     ST  3,-8(1) 	Save index in temp 
181:    LDC  3,0(6) 	Load constant 
182:    LDA  4,0(0) 	Load address of base of array y
183:    SUB  3,4,3 	Compute offset of value 
184:     LD  3,0(3) 	Load the value 
185:     LD  4,-8(1) 	load index from temp to ac1 
186:    LDA  5,0(0) 	Load address of base of array y
187:    SUB  5,5,4 	Compute offset of value 
188:     ST  3,0(5) 	Store variable y
* 32
189:     ST  1,-8(1) 	Store old fp in ghost frame 
190:    LDC  3,1(6) 	Load constant 
191:    LDA  4,0(0) 	Load address of base of array y
192:    SUB  3,4,3 	Compute offset of value 
193:     LD  3,0(3) 	Load the value 
194:     ST  3,-10(1) 	Store parameter 
195:    LDA  1,-8(1) 	Load address of new frame 
196:    LDA  3,1(7) 	Return address in ac 
197:    LDA  7,-187(7) 	call output
198:    LDA  3,0(2) 	Save the result in ac 
* 33
199:    LDC  3,2(6) 	Load constant 
200:     ST  3,-8(1) 	Save index in temp 
201:    LDC  3,1(6) 	Load constant 
202:    LDA  4,0(0) 	Load address of base of array y
203:    SUB  3,4,3 	Compute offset of value 
204:     LD  3,0(3) 	Load the value 
205:     ST  3,-9(1) 	Save left side in temp 
206:    LDC  3,311(6) 	Load constant 
207:     LD  4,-9(1) 	Load left from temp into ac1 
208:    ADD  3,4,3 	Op + 
209:     LD  4,-8(1) 	load index from temp to ac1 
210:    LDA  5,0(0) 	Load address of base of array y
211:    SUB  5,5,4 	Compute offset of value 
212:     ST  3,0(5) 	Store variable y
* 34
213:     ST  1,-8(1) 	Store old fp in ghost frame 
214:    LDC  3,2(6) 	Load constant 
215:    LDA  4,0(0) 	Load address of base of array y
216:    SUB  3,4,3 	Compute offset of value 
217:     LD  3,0(3) 	Load the value 
218:     ST  3,-10(1) 	Store parameter 
219:    LDA  1,-8(1) 	Load address of new frame 
220:    LDA  3,1(7) 	Return address in ac 
221:    LDA  7,-211(7) 	call output
222:    LDA  3,0(2) 	Save the result in ac 
* 35
223:     LD  3,-7(1) 	Load variable dog
224:     ST  3,-8(1) 	Save left side in temp 
225:     LD  3,-7(1) 	Load variable dog
226:     LD  4,-8(1) 	Load left from temp into ac1 
227:    ADD  3,4,3 	Op + 
228:     ST  3,-8(1) 	Save index in temp 
229:    LDC  3,496(6) 	Load constant 
230:     LD  4,-8(1) 	load index from temp to ac1 
231:    LDA  5,0(0) 	Load address of base of array y
232:    SUB  5,5,4 	Compute offset of value 
233:     ST  3,0(5) 	Store variable y
* 36
234:     ST  1,-8(1) 	Store old fp in ghost frame 
235:    LDC  3,4(6) 	Load constant 
236:    LDA  4,0(0) 	Load address of base of array y
237:    SUB  3,4,3 	Compute offset of value 
238:     LD  3,0(3) 	Load the value 
239:     ST  3,-10(1) 	Store parameter 
240:    LDA  1,-8(1) 	Load address of new frame 
241:    LDA  3,1(7) 	Return address in ac 
242:    LDA  7,-232(7) 	call output
243:    LDA  3,0(2) 	Save the result in ac 
* 37
244:     ST  1,-8(1) 	Store old fp in ghost frame 
245:    LDA  1,-8(1) 	Load address of new frame 
246:    LDA  3,1(7) 	Return address in ac 
247:    LDA  7,-218(7) 	call outnl
248:    LDA  3,0(2) 	Save the result in ac 
* 39
249:     ST  1,-8(1) 	Store old fp in ghost frame 
250:    LDA  3,0(0) 	Load address of base of array y
251:     ST  3,-10(1) 	Store parameter 
252:    LDC  3,2(6) 	Load constant 
253:     ST  3,-11(1) 	Store parameter 
254:    LDA  1,-8(1) 	Load address of new frame 
255:    LDA  3,1(7) 	Return address in ac 
256:    LDA  7,-222(7) 	call get
257:    LDA  3,0(2) 	Save the result in ac 
258:     ST  3,-7(1) 	Store variable dog
* 40
259:     ST  1,-8(1) 	Store old fp in ghost frame 
260:     LD  3,-7(1) 	Load variable dog
261:     ST  3,-10(1) 	Store parameter 
262:    LDA  1,-8(1) 	Load address of new frame 
263:    LDA  3,1(7) 	Return address in ac 
264:    LDA  7,-254(7) 	call output
265:    LDA  3,0(2) 	Save the result in ac 
* 41
266:     ST  1,-8(1) 	Store old fp in ghost frame 
267:     ST  1,-10(1) 	Store old fp in ghost frame 
268:    LDA  3,0(0) 	Load address of base of array y
269:     ST  3,-12(1) 	Store parameter 
270:    LDC  3,2(6) 	Load constant 
271:     ST  3,-13(1) 	Store parameter 
272:    LDA  1,-10(1) 	Load address of new frame 
273:    LDA  3,1(7) 	Return address in ac 
274:    LDA  7,-240(7) 	call get
275:    LDA  3,0(2) 	Save the result in ac 
276:     ST  3,-10(1) 	Store parameter 
277:    LDA  1,-8(1) 	Load address of new frame 
278:    LDA  3,1(7) 	Return address in ac 
279:    LDA  7,-269(7) 	call output
280:    LDA  3,0(2) 	Save the result in ac 
* 42
281:     ST  1,-8(1) 	Store old fp in ghost frame 
282:    LDC  3,1(6) 	Load constant 
283:    LDA  4,-2(1) 	Load address of base of array x
284:    SUB  3,4,3 	Compute offset of value 
285:     LD  3,0(3) 	Load the value 
286:     ST  3,-10(1) 	Store parameter 
287:    LDA  1,-8(1) 	Load address of new frame 
288:    LDA  3,1(7) 	Return address in ac 
289:    LDA  7,-279(7) 	call output
290:    LDA  3,0(2) 	Save the result in ac 
* 43
291:     ST  1,-8(1) 	Store old fp in ghost frame 
292:    LDA  1,-8(1) 	Load address of new frame 
293:    LDA  3,1(7) 	Return address in ac 
294:    LDA  7,-265(7) 	call outnl
295:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
296:    LDC  2,0(6) 	Set return value to 0 
297:     LD  3,-1(1) 	Load return address 
298:     LD  1,0(1) 	Adjust fp 
299:    LDA  7,0(3) 	Return 
* END of function main
