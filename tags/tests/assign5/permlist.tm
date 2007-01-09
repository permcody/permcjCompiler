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
* BEGIN function put
 35:     ST  3,-1(1) 	Store return address. BEGIN FUNC: put
* BEGIN compound statement
* 9
 36:    LDC  3,1(6) 	Load constant 
 37:     LD  4,-2(1) 	Load address of base of array p
 38:    SUB  3,4,3 	Compute offset of value 
 39:     LD  3,0(3) 	Load the value 
 40:     ST  3,-4(1) 	Store variable sum
* 10
 41:    LDC  3,2(6) 	Load constant 
 42:     ST  3,-3(1) 	Store variable j
* WHILE
 43:     LD  3,-3(1) 	Load variable j
 44:     ST  3,-5(1) 	Save left side in temp 
 45:     LD  3,0(0) 	Load variable n
 46:     LD  4,-5(1) 	Load left from temp into ac1 
 47:    SUB  4,4,3 	Op <= 
 48:    LDC  3,1(6) 	True case 
 49:    JLE  4,1(7) 	Jump if true 
 50:    LDC  3,0(6) 	False case 
 51:    LDC  4,1(6) 	Load constant 1 
 52:    SUB  3,3,4 	While cond check 
 53:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 12
 55:     LD  3,-4(1) 	Load variable sum
 56:     ST  3,-5(1) 	Save left side in temp 
 57:    LDC  3,10(6) 	Load constant 
 58:     LD  4,-5(1) 	Load left from temp into ac1 
 59:    MUL  3,4,3 	Op * 
 60:     ST  3,-5(1) 	Save left side in temp 
 61:     LD  3,-3(1) 	Load variable j
 62:     LD  4,-2(1) 	Load address of base of array p
 63:    SUB  3,4,3 	Compute offset of value 
 64:     LD  3,0(3) 	Load the value 
 65:     LD  4,-5(1) 	Load left from temp into ac1 
 66:    ADD  3,4,3 	Op + 
 67:     ST  3,-4(1) 	Store variable sum
* 13
 68:     LD  3,-3(1) 	Load variable j
 69:     ST  3,-5(1) 	Save left side in temp 
 70:    LDC  3,1(6) 	Load constant 
 71:     LD  4,-5(1) 	Load left from temp into ac1 
 72:    ADD  3,4,3 	Op + 
 73:     ST  3,-3(1) 	Store variable j
* END compound statement
 74:    LDA  7,-32(7) 	go to beginning of loop 
 54:    LDA  7,20(7) 	No more loop 
* ENDWHILE
* 15
 75:     ST  1,-5(1) 	Store old fp in ghost frame 
 76:     LD  3,-4(1) 	Load variable sum
 77:     ST  3,-7(1) 	Store parameter 
 78:    LDA  1,-5(1) 	Load address of new frame 
 79:    LDA  3,1(7) 	Return address in ac 
 80:    LDA  7,-70(7) 	call output
 81:    LDA  3,0(2) 	Save the result in ac 
* 16
 82:     ST  1,-5(1) 	Store old fp in ghost frame 
 83:    LDA  1,-5(1) 	Load address of new frame 
 84:    LDA  3,1(7) 	Return address in ac 
 85:    LDA  7,-56(7) 	call outnl
 86:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
 87:    LDC  2,0(6) 	Set return value to 0 
 88:     LD  3,-1(1) 	Load return address 
 89:     LD  1,0(1) 	Adjust fp 
 90:    LDA  7,0(3) 	Return 
* END of function put
* BEGIN function main
  4:    LDA  7,86(7) 	Jump to main 
 91:     ST  3,-1(1) 	Store return address. BEGIN FUNC: main
* BEGIN compound statement
* 25
 92:     ST  1,-27(1) 	Store old fp in ghost frame 
 93:    LDA  1,-27(1) 	Load address of new frame 
 94:    LDA  3,1(7) 	Return address in ac 
 95:    LDA  7,-90(7) 	call input
 96:    LDA  3,0(2) 	Save the result in ac 
 97:     ST  3,0(0) 	Store variable n
* 27
 98:    LDC  3,0(6) 	Load constant 
 99:     ST  3,-23(1) 	Store variable j
* WHILE
100:     LD  3,-23(1) 	Load variable j
101:     ST  3,-27(1) 	Save left side in temp 
102:     LD  3,0(0) 	Load variable n
103:     LD  4,-27(1) 	Load left from temp into ac1 
104:    SUB  4,4,3 	Op <= 
105:    LDC  3,1(6) 	True case 
106:    JLE  4,1(7) 	Jump if true 
107:    LDC  3,0(6) 	False case 
108:    LDC  4,1(6) 	Load constant 1 
109:    SUB  3,3,4 	While cond check 
110:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 29
112:     LD  3,-23(1) 	Load variable j
113:     ST  3,-27(1) 	Save index in temp 
114:     LD  3,-23(1) 	Load variable j
115:     LD  4,-27(1) 	load index from temp to ac1 
116:    LDA  5,-2(1) 	Load address of base of array p
117:    SUB  5,5,4 	Compute offset of value 
118:     ST  3,0(5) 	Store variable p
* 30
119:     LD  3,-23(1) 	Load variable j
120:     ST  3,-27(1) 	Save left side in temp 
121:    LDC  3,1(6) 	Load constant 
122:     LD  4,-27(1) 	Load left from temp into ac1 
123:    ADD  3,4,3 	Op + 
124:     ST  3,-23(1) 	Store variable j
* END compound statement
125:    LDA  7,-26(7) 	go to beginning of loop 
111:    LDA  7,14(7) 	No more loop 
* ENDWHILE
* 33
126:    LDC  3,1(6) 	Load constant 
127:     ST  3,-22(1) 	Store variable i
* WHILE
128:     LD  3,-22(1) 	Load variable i
129:     ST  3,-27(1) 	Save left side in temp 
130:    LDC  3,0(6) 	Load constant 
131:     LD  4,-27(1) 	Load left from temp into ac1 
132:    SUB  4,4,3 	Op > 
133:    LDC  3,1(6) 	True case 
134:    JGT  4,1(7) 	Jump if true 
135:    LDC  3,0(6) 	False case 
136:    LDC  4,1(6) 	Load constant 1 
137:    SUB  3,3,4 	While cond check 
138:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 39
140:     ST  1,-27(1) 	Store old fp in ghost frame 
141:    LDA  3,-2(1) 	Load address of base of array p
142:     ST  3,-29(1) 	Store parameter 
143:    LDA  1,-27(1) 	Load address of new frame 
144:    LDA  3,1(7) 	Return address in ac 
145:    LDA  7,-111(7) 	call put
146:    LDA  3,0(2) 	Save the result in ac 
* 42
147:     LD  3,0(0) 	Load variable n
148:     ST  3,-27(1) 	Save left side in temp 
149:    LDC  3,1(6) 	Load constant 
150:     LD  4,-27(1) 	Load left from temp into ac1 
151:    SUB  3,4,3 	Op - 
152:     ST  3,-22(1) 	Store variable i
* WHILE
153:     LD  3,-22(1) 	Load variable i
154:    LDA  4,-2(1) 	Load address of base of array p
155:    SUB  3,4,3 	Compute offset of value 
156:     LD  3,0(3) 	Load the value 
157:     ST  3,-27(1) 	Save left side in temp 
158:     LD  3,-22(1) 	Load variable i
159:     ST  3,-28(1) 	Save left side in temp 
160:    LDC  3,1(6) 	Load constant 
161:     LD  4,-28(1) 	Load left from temp into ac1 
162:    ADD  3,4,3 	Op + 
163:    LDA  4,-2(1) 	Load address of base of array p
164:    SUB  3,4,3 	Compute offset of value 
165:     LD  3,0(3) 	Load the value 
166:     LD  4,-27(1) 	Load left from temp into ac1 
167:    SUB  4,4,3 	Op > 
168:    LDC  3,1(6) 	True case 
169:    JGT  4,1(7) 	Jump if true 
170:    LDC  3,0(6) 	False case 
171:    LDC  4,1(6) 	Load constant 1 
172:    SUB  3,3,4 	While cond check 
173:    JGE  3,1(7) 	Jump to while part 
* DO
* 43
175:     LD  3,-22(1) 	Load variable i
176:     ST  3,-27(1) 	Save left side in temp 
177:    LDC  3,1(6) 	Load constant 
178:     LD  4,-27(1) 	Load left from temp into ac1 
179:    SUB  3,4,3 	Op - 
180:     ST  3,-22(1) 	Store variable i
181:    LDA  7,-29(7) 	go to beginning of loop 
174:    LDA  7,7(7) 	No more loop 
* ENDWHILE
* 45
182:     LD  3,0(0) 	Load variable n
183:     ST  3,-23(1) 	Store variable j
* WHILE
184:     LD  3,-22(1) 	Load variable i
185:    LDA  4,-2(1) 	Load address of base of array p
186:    SUB  3,4,3 	Compute offset of value 
187:     LD  3,0(3) 	Load the value 
188:     ST  3,-27(1) 	Save left side in temp 
189:     LD  3,-23(1) 	Load variable j
190:    LDA  4,-2(1) 	Load address of base of array p
191:    SUB  3,4,3 	Compute offset of value 
192:     LD  3,0(3) 	Load the value 
193:     LD  4,-27(1) 	Load left from temp into ac1 
194:    SUB  4,4,3 	Op > 
195:    LDC  3,1(6) 	True case 
196:    JGT  4,1(7) 	Jump if true 
197:    LDC  3,0(6) 	False case 
198:    LDC  4,1(6) 	Load constant 1 
199:    SUB  3,3,4 	While cond check 
200:    JGE  3,1(7) 	Jump to while part 
* DO
* 46
202:     LD  3,-23(1) 	Load variable j
203:     ST  3,-27(1) 	Save left side in temp 
204:    LDC  3,1(6) 	Load constant 
205:     LD  4,-27(1) 	Load left from temp into ac1 
206:    SUB  3,4,3 	Op - 
207:     ST  3,-23(1) 	Store variable j
208:    LDA  7,-25(7) 	go to beginning of loop 
201:    LDA  7,7(7) 	No more loop 
* ENDWHILE
* 48
209:     LD  3,-22(1) 	Load variable i
210:    LDA  4,-2(1) 	Load address of base of array p
211:    SUB  3,4,3 	Compute offset of value 
212:     LD  3,0(3) 	Load the value 
213:     ST  3,-26(1) 	Store variable tmp
* 48
214:     LD  3,-22(1) 	Load variable i
215:     ST  3,-27(1) 	Save index in temp 
216:     LD  3,-23(1) 	Load variable j
217:    LDA  4,-2(1) 	Load address of base of array p
218:    SUB  3,4,3 	Compute offset of value 
219:     LD  3,0(3) 	Load the value 
220:     LD  4,-27(1) 	load index from temp to ac1 
221:    LDA  5,-2(1) 	Load address of base of array p
222:    SUB  5,5,4 	Compute offset of value 
223:     ST  3,0(5) 	Store variable p
* 48
224:     LD  3,-23(1) 	Load variable j
225:     ST  3,-27(1) 	Save index in temp 
226:     LD  3,-26(1) 	Load variable tmp
227:     LD  4,-27(1) 	load index from temp to ac1 
228:    LDA  5,-2(1) 	Load address of base of array p
229:    SUB  5,5,4 	Compute offset of value 
230:     ST  3,0(5) 	Store variable p
* 50
231:     LD  3,0(0) 	Load variable n
232:     ST  3,-24(1) 	Store variable r
* 51
233:     LD  3,-22(1) 	Load variable i
234:     ST  3,-27(1) 	Save left side in temp 
235:    LDC  3,1(6) 	Load constant 
236:     LD  4,-27(1) 	Load left from temp into ac1 
237:    ADD  3,4,3 	Op + 
238:     ST  3,-25(1) 	Store variable s
* WHILE
239:     LD  3,-24(1) 	Load variable r
240:     ST  3,-27(1) 	Save left side in temp 
241:     LD  3,-25(1) 	Load variable s
242:     LD  4,-27(1) 	Load left from temp into ac1 
243:    SUB  4,4,3 	Op > 
244:    LDC  3,1(6) 	True case 
245:    JGT  4,1(7) 	Jump if true 
246:    LDC  3,0(6) 	False case 
247:    LDC  4,1(6) 	Load constant 1 
248:    SUB  3,3,4 	While cond check 
249:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 53
251:     LD  3,-24(1) 	Load variable r
252:    LDA  4,-2(1) 	Load address of base of array p
253:    SUB  3,4,3 	Compute offset of value 
254:     LD  3,0(3) 	Load the value 
255:     ST  3,-26(1) 	Store variable tmp
* 53
256:     LD  3,-24(1) 	Load variable r
257:     ST  3,-27(1) 	Save index in temp 
258:     LD  3,-25(1) 	Load variable s
259:    LDA  4,-2(1) 	Load address of base of array p
260:    SUB  3,4,3 	Compute offset of value 
261:     LD  3,0(3) 	Load the value 
262:     LD  4,-27(1) 	load index from temp to ac1 
263:    LDA  5,-2(1) 	Load address of base of array p
264:    SUB  5,5,4 	Compute offset of value 
265:     ST  3,0(5) 	Store variable p
* 53
266:     LD  3,-25(1) 	Load variable s
267:     ST  3,-27(1) 	Save index in temp 
268:     LD  3,-26(1) 	Load variable tmp
269:     LD  4,-27(1) 	load index from temp to ac1 
270:    LDA  5,-2(1) 	Load address of base of array p
271:    SUB  5,5,4 	Compute offset of value 
272:     ST  3,0(5) 	Store variable p
* 54
273:     LD  3,-24(1) 	Load variable r
274:     ST  3,-27(1) 	Save left side in temp 
275:    LDC  3,1(6) 	Load constant 
276:     LD  4,-27(1) 	Load left from temp into ac1 
277:    SUB  3,4,3 	Op - 
278:     ST  3,-24(1) 	Store variable r
* 55
279:     LD  3,-25(1) 	Load variable s
280:     ST  3,-27(1) 	Save left side in temp 
281:    LDC  3,1(6) 	Load constant 
282:     LD  4,-27(1) 	Load left from temp into ac1 
283:    ADD  3,4,3 	Op + 
284:     ST  3,-25(1) 	Store variable s
* END compound statement
285:    LDA  7,-47(7) 	go to beginning of loop 
250:    LDA  7,35(7) 	No more loop 
* ENDWHILE
* END compound statement
286:    LDA  7,-159(7) 	go to beginning of loop 
139:    LDA  7,147(7) 	No more loop 
* ENDWHILE
* END compound statement
* Add standard closing in case there is no return statement
287:    LDC  2,0(6) 	Set return value to 0 
288:     LD  3,-1(1) 	Load return address 
289:     LD  1,0(1) 	Adjust fp 
290:    LDA  7,0(3) 	Return 
* END of function main
