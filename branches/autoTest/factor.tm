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
* BEGIN function sqrt
 35:     ST  3,-1(1) 	Store return address. BEGIN FUNC: sqrt
* BEGIN compound statement
* IF
 36:     LD  3,-2(1) 	Load variable x
 37:     ST  3,-5(1) 	Save left side in temp 
 38:    LDC  3,1(6) 	Load constant 
 39:     LD  4,-5(1) 	Load left from temp into ac1 
 40:    SUB  4,4,3 	Op == 
 41:    LDC  3,1(6) 	True case 
 42:    JEQ  4,1(7) 	Jump if true 
 43:    LDC  3,0(6) 	False case 
 44:    LDC  4,1(6) 	Load constant 1 
 45:    SUB  3,3,4 	If cond check 
 46:    JGE  3,1(7) 	Jump to then part 
* THEN
* RETURN
 48:    LDC  3,1(6) 	Load constant 
 49:    LDA  2,0(3) 	Copy result to rt register 
 50:     LD  3,-1(1) 	Load return address 
 51:     LD  1,0(1) 	Adjust fp 
 52:    LDA  7,0(3) 	Return 
 47:    LDA  7,5(7) 	Jump around the THEN 
* ENDIF
* 8
 53:     LD  3,-2(1) 	Load variable x
 54:     ST  3,-5(1) 	Save left side in temp 
 55:    LDC  3,2(6) 	Load constant 
 56:     LD  4,-5(1) 	Load left from temp into ac1 
 57:    DIV  3,4,3 	Op / 
 58:     ST  3,-3(1) 	Store variable guess
* 9
 59:     LD  3,-2(1) 	Load variable x
 60:     ST  3,-5(1) 	Save left side in temp 
 61:     LD  3,-3(1) 	Load variable guess
 62:     LD  4,-5(1) 	Load left from temp into ac1 
 63:    DIV  3,4,3 	Op / 
 64:     ST  3,-5(1) 	Save left side in temp 
 65:     LD  3,-3(1) 	Load variable guess
 66:     LD  4,-5(1) 	Load left from temp into ac1 
 67:    ADD  3,4,3 	Op + 
 68:     ST  3,-5(1) 	Save left side in temp 
 69:    LDC  3,2(6) 	Load constant 
 70:     LD  4,-5(1) 	Load left from temp into ac1 
 71:    DIV  3,4,3 	Op / 
 72:     ST  3,-4(1) 	Store variable newguess
* WHILE
 73:     LD  3,-3(1) 	Load variable guess
 74:     ST  3,-5(1) 	Save left side in temp 
 75:     LD  3,-4(1) 	Load variable newguess
 76:     LD  4,-5(1) 	Load left from temp into ac1 
 77:    SUB  3,4,3 	Op - 
 78:     ST  3,-5(1) 	Save left side in temp 
 79:    LDC  3,1(6) 	Load constant 
 80:     LD  4,-5(1) 	Load left from temp into ac1 
 81:    SUB  4,4,3 	Op > 
 82:    LDC  3,1(6) 	True case 
 83:    JGT  4,1(7) 	Jump if true 
 84:    LDC  3,0(6) 	False case 
 85:    LDC  4,1(6) 	Load constant 1 
 86:    SUB  3,3,4 	While cond check 
 87:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 11
 89:     LD  3,-4(1) 	Load variable newguess
 90:     ST  3,-3(1) 	Store variable guess
* 12
 91:     LD  3,-2(1) 	Load variable x
 92:     ST  3,-5(1) 	Save left side in temp 
 93:     LD  3,-3(1) 	Load variable guess
 94:     LD  4,-5(1) 	Load left from temp into ac1 
 95:    DIV  3,4,3 	Op / 
 96:     ST  3,-5(1) 	Save left side in temp 
 97:     LD  3,-3(1) 	Load variable guess
 98:     LD  4,-5(1) 	Load left from temp into ac1 
 99:    ADD  3,4,3 	Op + 
100:     ST  3,-5(1) 	Save left side in temp 
101:    LDC  3,2(6) 	Load constant 
102:     LD  4,-5(1) 	Load left from temp into ac1 
103:    DIV  3,4,3 	Op / 
104:     ST  3,-4(1) 	Store variable newguess
* END compound statement
105:    LDA  7,-33(7) 	go to beginning of loop 
 88:    LDA  7,17(7) 	No more loop 
* ENDWHILE
* IF
106:     LD  3,-4(1) 	Load variable newguess
107:     ST  3,-5(1) 	Save left side in temp 
108:     LD  3,-4(1) 	Load variable newguess
109:     LD  4,-5(1) 	Load left from temp into ac1 
110:    MUL  3,4,3 	Op * 
111:     ST  3,-5(1) 	Save left side in temp 
112:     LD  3,-2(1) 	Load variable x
113:     LD  4,-5(1) 	Load left from temp into ac1 
114:    SUB  4,4,3 	Op > 
115:    LDC  3,1(6) 	True case 
116:    JGT  4,1(7) 	Jump if true 
117:    LDC  3,0(6) 	False case 
118:    LDC  4,1(6) 	Load constant 1 
119:    SUB  3,3,4 	If cond check 
120:    JGE  3,1(7) 	Jump to then part 
* THEN
* 14
122:     LD  3,-4(1) 	Load variable newguess
123:     ST  3,-5(1) 	Save left side in temp 
124:    LDC  3,1(6) 	Load constant 
125:     LD  4,-5(1) 	Load left from temp into ac1 
126:    SUB  3,4,3 	Op - 
127:     ST  3,-4(1) 	Store variable newguess
121:    LDA  7,6(7) 	Jump around the THEN 
* ENDIF
* RETURN
128:     LD  3,-4(1) 	Load variable newguess
129:    LDA  2,0(3) 	Copy result to rt register 
130:     LD  3,-1(1) 	Load return address 
131:     LD  1,0(1) 	Adjust fp 
132:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
133:    LDC  2,0(6) 	Set return value to 0 
134:     LD  3,-1(1) 	Load return address 
135:     LD  1,0(1) 	Adjust fp 
136:    LDA  7,0(3) 	Return 
* END of function sqrt
* BEGIN function main
  4:    LDA  7,132(7) 	Jump to main 
137:     ST  3,-1(1) 	Store return address. BEGIN FUNC: main
* BEGIN compound statement
* WHILE
138:     ST  1,-5(1) 	Store old fp in ghost frame 
139:    LDA  1,-5(1) 	Load address of new frame 
140:    LDA  3,1(7) 	Return address in ac 
141:    LDA  7,-136(7) 	call input
142:    LDA  3,0(2) 	Save the result in ac 
143:     ST  3,-2(1) 	Store variable n
144:     ST  3,-5(1) 	Save left side in temp 
145:    LDC  3,1(6) 	Load constant 
146:     LD  4,-5(1) 	Load left from temp into ac1 
147:    SUB  4,4,3 	Op > 
148:    LDC  3,1(6) 	True case 
149:    JGT  4,1(7) 	Jump if true 
150:    LDC  3,0(6) 	False case 
151:    LDC  4,1(6) 	Load constant 1 
152:    SUB  3,3,4 	While cond check 
153:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 28
155:     ST  1,-5(1) 	Store old fp in ghost frame 
156:     LD  3,-2(1) 	Load variable n
157:     ST  3,-7(1) 	Store parameter 
158:    LDA  1,-5(1) 	Load address of new frame 
159:    LDA  3,1(7) 	Return address in ac 
160:    LDA  7,-126(7) 	call sqrt
161:    LDA  3,0(2) 	Save the result in ac 
162:     ST  3,-4(1) 	Store variable limit
* WHILE
163:     LD  3,-2(1) 	Load variable n
164:     ST  3,-5(1) 	Save left side in temp 
165:    LDC  3,2(6) 	Load constant 
166:     LD  4,-5(1) 	Load left from temp into ac1 
167:    DIV  5,4,3 	Op % 
168:    MUL  5,5,3 	 
169:    SUB  3,4,5 	 
170:     ST  3,-5(1) 	Save left side in temp 
171:    LDC  3,0(6) 	Load constant 
172:     LD  4,-5(1) 	Load left from temp into ac1 
173:    SUB  4,4,3 	Op == 
174:    LDC  3,1(6) 	True case 
175:    JEQ  4,1(7) 	Jump if true 
176:    LDC  3,0(6) 	False case 
177:    LDC  4,1(6) 	Load constant 1 
178:    SUB  3,3,4 	While cond check 
179:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 32
181:     ST  1,-5(1) 	Store old fp in ghost frame 
182:    LDC  3,2(6) 	Load constant 
183:     ST  3,-7(1) 	Store parameter 
184:    LDA  1,-5(1) 	Load address of new frame 
185:    LDA  3,1(7) 	Return address in ac 
186:    LDA  7,-176(7) 	call output
187:    LDA  3,0(2) 	Save the result in ac 
* 33
188:     LD  3,-2(1) 	Load variable n
189:     ST  3,-5(1) 	Save left side in temp 
190:    LDC  3,2(6) 	Load constant 
191:     LD  4,-5(1) 	Load left from temp into ac1 
192:    DIV  3,4,3 	Op / 
193:     ST  3,-2(1) 	Store variable n
* END compound statement
194:    LDA  7,-32(7) 	go to beginning of loop 
180:    LDA  7,14(7) 	No more loop 
* ENDWHILE
* 37
195:    LDC  3,3(6) 	Load constant 
196:     ST  3,-3(1) 	Store variable i
* WHILE
197:     LD  3,-3(1) 	Load variable i
198:     ST  3,-5(1) 	Save left side in temp 
199:     LD  3,-4(1) 	Load variable limit
200:     LD  4,-5(1) 	Load left from temp into ac1 
201:    SUB  4,4,3 	Op <= 
202:    LDC  3,1(6) 	True case 
203:    JLE  4,1(7) 	Jump if true 
204:    LDC  3,0(6) 	False case 
205:    LDC  4,1(6) 	Load constant 1 
206:    SUB  3,3,4 	While cond check 
207:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* WHILE
209:     LD  3,-2(1) 	Load variable n
210:     ST  3,-5(1) 	Save left side in temp 
211:     LD  3,-3(1) 	Load variable i
212:     LD  4,-5(1) 	Load left from temp into ac1 
213:    DIV  5,4,3 	Op % 
214:    MUL  5,5,3 	 
215:    SUB  3,4,5 	 
216:     ST  3,-5(1) 	Save left side in temp 
217:    LDC  3,0(6) 	Load constant 
218:     LD  4,-5(1) 	Load left from temp into ac1 
219:    SUB  4,4,3 	Op == 
220:    LDC  3,1(6) 	True case 
221:    JEQ  4,1(7) 	Jump if true 
222:    LDC  3,0(6) 	False case 
223:    LDC  4,1(6) 	Load constant 1 
224:    SUB  3,3,4 	While cond check 
225:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 40
227:     ST  1,-5(1) 	Store old fp in ghost frame 
228:     LD  3,-3(1) 	Load variable i
229:     ST  3,-7(1) 	Store parameter 
230:    LDA  1,-5(1) 	Load address of new frame 
231:    LDA  3,1(7) 	Return address in ac 
232:    LDA  7,-222(7) 	call output
233:    LDA  3,0(2) 	Save the result in ac 
* 41
234:     LD  3,-2(1) 	Load variable n
235:     ST  3,-5(1) 	Save left side in temp 
236:     LD  3,-3(1) 	Load variable i
237:     LD  4,-5(1) 	Load left from temp into ac1 
238:    DIV  3,4,3 	Op / 
239:     ST  3,-2(1) 	Store variable n
* 42
240:     ST  1,-5(1) 	Store old fp in ghost frame 
241:     LD  3,-2(1) 	Load variable n
242:     ST  3,-7(1) 	Store parameter 
243:    LDA  1,-5(1) 	Load address of new frame 
244:    LDA  3,1(7) 	Return address in ac 
245:    LDA  7,-211(7) 	call sqrt
246:    LDA  3,0(2) 	Save the result in ac 
247:     ST  3,-4(1) 	Store variable limit
* END compound statement
248:    LDA  7,-40(7) 	go to beginning of loop 
226:    LDA  7,22(7) 	No more loop 
* ENDWHILE
* 44
249:     LD  3,-3(1) 	Load variable i
250:     ST  3,-5(1) 	Save left side in temp 
251:    LDC  3,2(6) 	Load constant 
252:     LD  4,-5(1) 	Load left from temp into ac1 
253:    ADD  3,4,3 	Op + 
254:     ST  3,-3(1) 	Store variable i
* END compound statement
255:    LDA  7,-59(7) 	go to beginning of loop 
208:    LDA  7,47(7) 	No more loop 
* ENDWHILE
* IF
256:     LD  3,-2(1) 	Load variable n
257:     ST  3,-5(1) 	Save left side in temp 
258:    LDC  3,1(6) 	Load constant 
259:     LD  4,-5(1) 	Load left from temp into ac1 
260:    SUB  4,4,3 	Op > 
261:    LDC  3,1(6) 	True case 
262:    JGT  4,1(7) 	Jump if true 
263:    LDC  3,0(6) 	False case 
264:    LDC  4,1(6) 	Load constant 1 
265:    SUB  3,3,4 	If cond check 
266:    JGE  3,1(7) 	Jump to then part 
* THEN
* 47
268:     ST  1,-5(1) 	Store old fp in ghost frame 
269:     LD  3,-2(1) 	Load variable n
270:     ST  3,-7(1) 	Store parameter 
271:    LDA  1,-5(1) 	Load address of new frame 
272:    LDA  3,1(7) 	Return address in ac 
273:    LDA  7,-263(7) 	call output
274:    LDA  3,0(2) 	Save the result in ac 
267:    LDA  7,7(7) 	Jump around the THEN 
* ENDIF
* 48
275:     ST  1,-5(1) 	Store old fp in ghost frame 
276:    LDA  1,-5(1) 	Load address of new frame 
277:    LDA  3,1(7) 	Return address in ac 
278:    LDA  7,-249(7) 	call outnl
279:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
280:    LDA  7,-143(7) 	go to beginning of loop 
154:    LDA  7,126(7) 	No more loop 
* ENDWHILE
* END compound statement
* Add standard closing in case there is no return statement
281:    LDC  2,0(6) 	Set return value to 0 
282:     LD  3,-1(1) 	Load return address 
283:     LD  1,0(1) 	Adjust fp 
284:    LDA  7,0(3) 	Return 
* END of function main
