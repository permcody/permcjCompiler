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
 37:    LDC  3,1(6) 	Load constant 
 38:     ST  3,-4(1) 	Save left side in temp 
 39:    LDC  3,2(6) 	Load constant 
 40:     LD  4,-4(1) 	Load left from temp into ac1 
 41:    SUB  4,4,3 	Op < 
 42:    LDC  3,1(6) 	True case 
 43:    JLT  4,1(7) 	Jump if true 
 44:    LDC  3,0(6) 	False case 
 45:     ST  3,-4(1) 	Store parameter 
 46:    LDA  1,-2(1) 	Load address of new frame 
 47:    LDA  3,1(7) 	Return address in ac 
 48:    LDA  7,-26(7) 	call outputb
 49:    LDA  3,0(2) 	Save the result in ac 
* 5
 50:     ST  1,-2(1) 	Store old fp in ghost frame 
 51:    LDC  3,2(6) 	Load constant 
 52:     ST  3,-4(1) 	Save left side in temp 
 53:    LDC  3,2(6) 	Load constant 
 54:     LD  4,-4(1) 	Load left from temp into ac1 
 55:    SUB  4,4,3 	Op < 
 56:    LDC  3,1(6) 	True case 
 57:    JLT  4,1(7) 	Jump if true 
 58:    LDC  3,0(6) 	False case 
 59:     ST  3,-4(1) 	Store parameter 
 60:    LDA  1,-2(1) 	Load address of new frame 
 61:    LDA  3,1(7) 	Return address in ac 
 62:    LDA  7,-40(7) 	call outputb
 63:    LDA  3,0(2) 	Save the result in ac 
* 6
 64:     ST  1,-2(1) 	Store old fp in ghost frame 
 65:    LDC  3,3(6) 	Load constant 
 66:     ST  3,-4(1) 	Save left side in temp 
 67:    LDC  3,2(6) 	Load constant 
 68:     LD  4,-4(1) 	Load left from temp into ac1 
 69:    SUB  4,4,3 	Op < 
 70:    LDC  3,1(6) 	True case 
 71:    JLT  4,1(7) 	Jump if true 
 72:    LDC  3,0(6) 	False case 
 73:     ST  3,-4(1) 	Store parameter 
 74:    LDA  1,-2(1) 	Load address of new frame 
 75:    LDA  3,1(7) 	Return address in ac 
 76:    LDA  7,-54(7) 	call outputb
 77:    LDA  3,0(2) 	Save the result in ac 
* 8
 78:     ST  1,-2(1) 	Store old fp in ghost frame 
 79:    LDC  3,1(6) 	Load constant 
 80:     ST  3,-4(1) 	Save left side in temp 
 81:    LDC  3,2(6) 	Load constant 
 82:     LD  4,-4(1) 	Load left from temp into ac1 
 83:    SUB  4,4,3 	Op == 
 84:    LDC  3,1(6) 	True case 
 85:    JEQ  4,1(7) 	Jump if true 
 86:    LDC  3,0(6) 	False case 
 87:     ST  3,-4(1) 	Store parameter 
 88:    LDA  1,-2(1) 	Load address of new frame 
 89:    LDA  3,1(7) 	Return address in ac 
 90:    LDA  7,-68(7) 	call outputb
 91:    LDA  3,0(2) 	Save the result in ac 
* 9
 92:     ST  1,-2(1) 	Store old fp in ghost frame 
 93:    LDC  3,2(6) 	Load constant 
 94:     ST  3,-4(1) 	Save left side in temp 
 95:    LDC  3,2(6) 	Load constant 
 96:     LD  4,-4(1) 	Load left from temp into ac1 
 97:    SUB  4,4,3 	Op == 
 98:    LDC  3,1(6) 	True case 
 99:    JEQ  4,1(7) 	Jump if true 
100:    LDC  3,0(6) 	False case 
101:     ST  3,-4(1) 	Store parameter 
102:    LDA  1,-2(1) 	Load address of new frame 
103:    LDA  3,1(7) 	Return address in ac 
104:    LDA  7,-82(7) 	call outputb
105:    LDA  3,0(2) 	Save the result in ac 
* 10
106:     ST  1,-2(1) 	Store old fp in ghost frame 
107:    LDC  3,3(6) 	Load constant 
108:     ST  3,-4(1) 	Save left side in temp 
109:    LDC  3,2(6) 	Load constant 
110:     LD  4,-4(1) 	Load left from temp into ac1 
111:    SUB  4,4,3 	Op == 
112:    LDC  3,1(6) 	True case 
113:    JEQ  4,1(7) 	Jump if true 
114:    LDC  3,0(6) 	False case 
115:     ST  3,-4(1) 	Store parameter 
116:    LDA  1,-2(1) 	Load address of new frame 
117:    LDA  3,1(7) 	Return address in ac 
118:    LDA  7,-96(7) 	call outputb
119:    LDA  3,0(2) 	Save the result in ac 
* 12
120:     ST  1,-2(1) 	Store old fp in ghost frame 
121:    LDC  3,1(6) 	Load constant 
122:     ST  3,-4(1) 	Save left side in temp 
123:    LDC  3,2(6) 	Load constant 
124:     LD  4,-4(1) 	Load left from temp into ac1 
125:    SUB  4,4,3 	Op > 
126:    LDC  3,1(6) 	True case 
127:    JGT  4,1(7) 	Jump if true 
128:    LDC  3,0(6) 	False case 
129:     ST  3,-4(1) 	Store parameter 
130:    LDA  1,-2(1) 	Load address of new frame 
131:    LDA  3,1(7) 	Return address in ac 
132:    LDA  7,-110(7) 	call outputb
133:    LDA  3,0(2) 	Save the result in ac 
* 13
134:     ST  1,-2(1) 	Store old fp in ghost frame 
135:    LDC  3,2(6) 	Load constant 
136:     ST  3,-4(1) 	Save left side in temp 
137:    LDC  3,2(6) 	Load constant 
138:     LD  4,-4(1) 	Load left from temp into ac1 
139:    SUB  4,4,3 	Op > 
140:    LDC  3,1(6) 	True case 
141:    JGT  4,1(7) 	Jump if true 
142:    LDC  3,0(6) 	False case 
143:     ST  3,-4(1) 	Store parameter 
144:    LDA  1,-2(1) 	Load address of new frame 
145:    LDA  3,1(7) 	Return address in ac 
146:    LDA  7,-124(7) 	call outputb
147:    LDA  3,0(2) 	Save the result in ac 
* 14
148:     ST  1,-2(1) 	Store old fp in ghost frame 
149:    LDC  3,3(6) 	Load constant 
150:     ST  3,-4(1) 	Save left side in temp 
151:    LDC  3,2(6) 	Load constant 
152:     LD  4,-4(1) 	Load left from temp into ac1 
153:    SUB  4,4,3 	Op > 
154:    LDC  3,1(6) 	True case 
155:    JGT  4,1(7) 	Jump if true 
156:    LDC  3,0(6) 	False case 
157:     ST  3,-4(1) 	Store parameter 
158:    LDA  1,-2(1) 	Load address of new frame 
159:    LDA  3,1(7) 	Return address in ac 
160:    LDA  7,-138(7) 	call outputb
161:    LDA  3,0(2) 	Save the result in ac 
* 16
162:     ST  1,-2(1) 	Store old fp in ghost frame 
163:    LDC  3,1(6) 	Load constant 
164:     ST  3,-4(1) 	Save left side in temp 
165:    LDC  3,2(6) 	Load constant 
166:     LD  4,-4(1) 	Load left from temp into ac1 
167:    SUB  4,4,3 	Op <= 
168:    LDC  3,1(6) 	True case 
169:    JLE  4,1(7) 	Jump if true 
170:    LDC  3,0(6) 	False case 
171:     ST  3,-4(1) 	Store parameter 
172:    LDA  1,-2(1) 	Load address of new frame 
173:    LDA  3,1(7) 	Return address in ac 
174:    LDA  7,-152(7) 	call outputb
175:    LDA  3,0(2) 	Save the result in ac 
* 17
176:     ST  1,-2(1) 	Store old fp in ghost frame 
177:    LDC  3,2(6) 	Load constant 
178:     ST  3,-4(1) 	Save left side in temp 
179:    LDC  3,2(6) 	Load constant 
180:     LD  4,-4(1) 	Load left from temp into ac1 
181:    SUB  4,4,3 	Op <= 
182:    LDC  3,1(6) 	True case 
183:    JLE  4,1(7) 	Jump if true 
184:    LDC  3,0(6) 	False case 
185:     ST  3,-4(1) 	Store parameter 
186:    LDA  1,-2(1) 	Load address of new frame 
187:    LDA  3,1(7) 	Return address in ac 
188:    LDA  7,-166(7) 	call outputb
189:    LDA  3,0(2) 	Save the result in ac 
* 18
190:     ST  1,-2(1) 	Store old fp in ghost frame 
191:    LDC  3,3(6) 	Load constant 
192:     ST  3,-4(1) 	Save left side in temp 
193:    LDC  3,2(6) 	Load constant 
194:     LD  4,-4(1) 	Load left from temp into ac1 
195:    SUB  4,4,3 	Op <= 
196:    LDC  3,1(6) 	True case 
197:    JLE  4,1(7) 	Jump if true 
198:    LDC  3,0(6) 	False case 
199:     ST  3,-4(1) 	Store parameter 
200:    LDA  1,-2(1) 	Load address of new frame 
201:    LDA  3,1(7) 	Return address in ac 
202:    LDA  7,-180(7) 	call outputb
203:    LDA  3,0(2) 	Save the result in ac 
* 20
204:     ST  1,-2(1) 	Store old fp in ghost frame 
205:    LDC  3,1(6) 	Load constant 
206:     ST  3,-4(1) 	Save left side in temp 
207:    LDC  3,2(6) 	Load constant 
208:     LD  4,-4(1) 	Load left from temp into ac1 
209:    SUB  4,4,3 	Op >= 
210:    LDC  3,1(6) 	True case 
211:    JGE  4,1(7) 	Jump if true 
212:    LDC  3,0(6) 	False case 
213:     ST  3,-4(1) 	Store parameter 
214:    LDA  1,-2(1) 	Load address of new frame 
215:    LDA  3,1(7) 	Return address in ac 
216:    LDA  7,-194(7) 	call outputb
217:    LDA  3,0(2) 	Save the result in ac 
* 21
218:     ST  1,-2(1) 	Store old fp in ghost frame 
219:    LDC  3,2(6) 	Load constant 
220:     ST  3,-4(1) 	Save left side in temp 
221:    LDC  3,2(6) 	Load constant 
222:     LD  4,-4(1) 	Load left from temp into ac1 
223:    SUB  4,4,3 	Op >= 
224:    LDC  3,1(6) 	True case 
225:    JGE  4,1(7) 	Jump if true 
226:    LDC  3,0(6) 	False case 
227:     ST  3,-4(1) 	Store parameter 
228:    LDA  1,-2(1) 	Load address of new frame 
229:    LDA  3,1(7) 	Return address in ac 
230:    LDA  7,-208(7) 	call outputb
231:    LDA  3,0(2) 	Save the result in ac 
* 22
232:     ST  1,-2(1) 	Store old fp in ghost frame 
233:    LDC  3,3(6) 	Load constant 
234:     ST  3,-4(1) 	Save left side in temp 
235:    LDC  3,2(6) 	Load constant 
236:     LD  4,-4(1) 	Load left from temp into ac1 
237:    SUB  4,4,3 	Op >= 
238:    LDC  3,1(6) 	True case 
239:    JGE  4,1(7) 	Jump if true 
240:    LDC  3,0(6) 	False case 
241:     ST  3,-4(1) 	Store parameter 
242:    LDA  1,-2(1) 	Load address of new frame 
243:    LDA  3,1(7) 	Return address in ac 
244:    LDA  7,-222(7) 	call outputb
245:    LDA  3,0(2) 	Save the result in ac 
* 24
246:     ST  1,-2(1) 	Store old fp in ghost frame 
247:    LDC  3,1(6) 	Load constant 
248:     ST  3,-4(1) 	Save left side in temp 
249:    LDC  3,2(6) 	Load constant 
250:     LD  4,-4(1) 	Load left from temp into ac1 
251:    SUB  3,4,3 	Op != 
252:    JEQ  3,1(7) 	Jump if true 
253:    LDC  3,1(6) 	True case 
254:     ST  3,-4(1) 	Store parameter 
255:    LDA  1,-2(1) 	Load address of new frame 
256:    LDA  3,1(7) 	Return address in ac 
257:    LDA  7,-235(7) 	call outputb
258:    LDA  3,0(2) 	Save the result in ac 
* 25
259:     ST  1,-2(1) 	Store old fp in ghost frame 
260:    LDC  3,2(6) 	Load constant 
261:     ST  3,-4(1) 	Save left side in temp 
262:    LDC  3,2(6) 	Load constant 
263:     LD  4,-4(1) 	Load left from temp into ac1 
264:    SUB  3,4,3 	Op != 
265:    JEQ  3,1(7) 	Jump if true 
266:    LDC  3,1(6) 	True case 
267:     ST  3,-4(1) 	Store parameter 
268:    LDA  1,-2(1) 	Load address of new frame 
269:    LDA  3,1(7) 	Return address in ac 
270:    LDA  7,-248(7) 	call outputb
271:    LDA  3,0(2) 	Save the result in ac 
* 26
272:     ST  1,-2(1) 	Store old fp in ghost frame 
273:    LDC  3,3(6) 	Load constant 
274:     ST  3,-4(1) 	Save left side in temp 
275:    LDC  3,2(6) 	Load constant 
276:     LD  4,-4(1) 	Load left from temp into ac1 
277:    SUB  3,4,3 	Op != 
278:    JEQ  3,1(7) 	Jump if true 
279:    LDC  3,1(6) 	True case 
280:     ST  3,-4(1) 	Store parameter 
281:    LDA  1,-2(1) 	Load address of new frame 
282:    LDA  3,1(7) 	Return address in ac 
283:    LDA  7,-261(7) 	call outputb
284:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
285:    LDC  2,0(6) 	Set return value to 0 
286:     LD  3,-1(1) 	Load return address 
287:     LD  1,0(1) 	Adjust fp 
288:    LDA  7,0(3) 	Return 
* END of function main
