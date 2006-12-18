* C- compiler version 1.0
* Author: Cody Permann
* May 13, 2004
* Begin Prolog code
  0:     LD  0,0(0) 	load global poiniter with end of memory
  1:    LDA  1,-76(0) 	load fp
  2:     ST  1,0(1) 	store old fp
  3:    LDA  3,1(7) 	return address in ac
  5:   HALT  0,0,0 	DONE!
* End Prolog code
* Being Generating IO Functions
* Begin function input
  6:     ST  3,-1(1) 	store return address
  7:     IN  2,2,2 	input integer
  8:     LD  3,-1(1) 	load return address
  9:     LD  1,0(1) 	adjust fp
 10:    LDA  7,0(3) 	jump to return address
* End function input
* Begin function output
 11:     ST  3,-1(1) 	store return address
 12:     LD  3,-2(1) 	load parameter
 13:    OUT  3,3,3 	output integer
 14:    LDC  2,0(2) 	set return to 0
 15:     LD  3,-1(1) 	load return address
 16:     LD  1,0(1) 	adjust fp
 17:    LDA  7,0(3) 	jump to return address
* End function output
* Begin function inputb
 18:     ST  3,-1(1) 	store return address
 19:    INB  2,2,2 	input boolean
 20:     LD  3,-1(1) 	load return address
 21:     LD  1,0(1) 	adjust fp
 22:    LDA  7,0(3) 	jump to return address
* End function inputb
* Begin function outputb
 23:     ST  3,-1(1) 	store return address
 24:     LD  3,-2(1) 	load parameter
 25:   OUTB  3,3,3 	output boolean
 26:    LDC  2,0(2) 	set return to 0
 27:     LD  3,-1(1) 	load return address
 28:     LD  1,0(1) 	adjust fp
 29:    LDA  7,0(3) 	jump to return address
* End function outputb
* End Generating IO Functions
* Function printboard returns void
 30:     ST  3,-1(1) 	store return address
* BEGIN
 31:    LDC  3,0(0) 	load constant
 32:     ST  3,-3(1) 	store variable i
* 
* WHILE
 33:     LD  3,-3(1) 	load variable i
* Left side will remain in register
 34:     LD  4,-74(0) 	load variable n
 35:    SUB  3,3,4 	prepare for comparison op
 36:    JLT  3,2(7) 	op <
 37:    LDC  3,0(0) 	load false into ac
 38:    LDA  7,1(7) 	jump past true case
 39:    LDC  3,1(0) 	load true into ac
 40:    LDC  2,1(0) 	load constant 1
 41:    SUB  3,3,2 	while condition check
* WHILE BODY
* BEGIN
 43:     ST  1,-4(1) 	Store old fp in ghost frame
 44:     LD  3,-3(1) 	load variable i
 45:     LD  2,-2(1) 	Load address of base of array col
 46:    SUB  3,2,3 	index off of the base
 47:     LD  3,0(3) 	load the value
 48:     ST  3,-6(1) 	Save parameter
 49:    LDA  1,-4(1) 	Load address of new frame
 50:    LDA  3,1(7) 	Put return address in ac
 51:    LDA  7,-41(7) 	Call output
 52:    LDA  3,0(2) 	Save the result in current accumulator
* 
 53:     LD  3,-3(1) 	load variable i
* Left side will remain in register
 54:    LDC  4,1(0) 	load constant
 55:    ADD  3,3,4 	op +
 56:     ST  3,-3(1) 	store variable i
* END
 57:    LDA  7,-25(7) 	go to beginning of loop
 42:    JLT  3,15(7) 	break out of loop if false
* END WHILE
* 
 58:     ST  1,-4(1) 	Store old fp in ghost frame
 59:    LDC  3,11111111(0) 	load constant
 60:     ST  3,-6(1) 	Save parameter
 61:    LDA  1,-4(1) 	Load address of new frame
 62:    LDA  3,1(7) 	Put return address in ac
 63:    LDA  7,-53(7) 	Call output
 64:    LDA  3,0(2) 	Save the result in current accumulator
* 
 65:     LD  3,-75(0) 	load variable count
* Left side will remain in register
 66:    LDC  4,1(0) 	load constant
 67:    ADD  3,3,4 	op +
 68:     ST  3,-75(0) 	store variable count
* END
* This function requires a catch all return
 69:    LDC  2,0(0) 	Set return value to 0
 70:     LD  3,-1(1) 	Load return address
 71:     LD  1,0(1) 	Adjust fp
 72:    LDA  7,0(3) 	Return
* End Function printboard
* Function try returns int
 73:     ST  3,-1(1) 	store return address
* BEGIN
* IF
 74:     LD  3,-2(1) 	load variable c
* Left side will remain in register
 75:     LD  4,-74(0) 	load variable n
 76:    SUB  3,3,4 	prepare for comparison op
 77:    JEQ  3,2(7) 	op ==
 78:    LDC  3,0(0) 	load false into ac
 79:    LDA  7,1(7) 	jump past true case
 80:    LDC  3,1(0) 	load true into ac
 81:    LDC  2,1(0) 	load constant 1
 82:    SUB  3,3,2 	if condition check
* THEN
 84:     ST  1,-4(1) 	Store old fp in ghost frame
 85:    LDA  3,-12(0) 	Load address of base of array col
 86:     ST  3,-6(1) 	Save parameter
 87:    LDA  1,-4(1) 	Load address of new frame
 88:    LDA  3,1(7) 	Put return address in ac
 89:    LDA  7,-60(7) 	Call printboard
 90:    LDA  3,0(2) 	Save the result in current accumulator
 83:    JLT  3,8(7) 	jump to else if false
* BEGIN
 92:    LDC  3,0(0) 	load constant
 93:     ST  3,-3(1) 	store variable r
* 
* WHILE
 94:     LD  3,-3(1) 	load variable r
* Left side will remain in register
 95:     LD  4,-74(0) 	load variable n
 96:    SUB  3,3,4 	prepare for comparison op
 97:    JLT  3,2(7) 	op <
 98:    LDC  3,0(0) 	load false into ac
 99:    LDA  7,1(7) 	jump past true case
100:    LDC  3,1(0) 	load true into ac
101:    LDC  2,1(0) 	load constant 1
102:    SUB  3,3,2 	while condition check
* WHILE BODY
* BEGIN
* IF
104:     LD  3,-3(1) 	load variable r
105:    LDA  2,0(0) 	Load address of base of array row
106:    SUB  3,2,3 	index off of the base
107:     LD  3,0(3) 	load the value
* Left side will remain in register
108:    LDC  4,0(0) 	load constant
109:    SUB  3,3,4 	prepare for comparison op
110:    JEQ  3,2(7) 	op ==
111:    LDC  3,0(0) 	load false into ac
112:    LDA  7,1(7) 	jump past true case
113:    LDC  3,1(0) 	load true into ac
* Left side will remain in register
115:     LD  4,-3(1) 	load variable r
* Left side will remain in register
116:     LD  5,-2(1) 	load variable c
117:    ADD  4,4,5 	op +
118:    LDA  2,-24(0) 	Load address of base of array diagone
119:    SUB  4,2,4 	index off of the base
120:     LD  4,0(4) 	load the value
* Left side will remain in register
121:    LDC  5,0(0) 	load constant
122:    SUB  4,4,5 	prepare for comparison op
123:    JEQ  4,2(7) 	op ==
124:    LDC  4,0(0) 	load false into ac
125:    LDA  7,1(7) 	jump past true case
126:    LDC  4,1(0) 	load true into ac
127:    JGT  4,2(7) 	op && (right side)
114:    JEQ  3,13(7) 	Skip right child of && if left is false
128:    LDC  3,0(0) 	load false into ac
129:    LDA  7,1(7) 	jump past true case
130:    LDC  3,1(0) 	load true into ac
* Left side will remain in register
132:     LD  4,-3(1) 	load variable r
* Left side will remain in register
133:     LD  5,-74(0) 	load variable n
* Left side will remain in register
134:    LDC  6,1(0) 	load constant
135:    SUB  5,5,6 	op -
136:    ADD  4,4,5 	op +
* Left side will remain in register
137:     LD  5,-2(1) 	load variable c
138:    SUB  4,4,5 	op -
139:    LDA  2,-49(0) 	Load address of base of array diagtwo
140:    SUB  4,2,4 	index off of the base
141:     LD  4,0(4) 	load the value
* Left side will remain in register
142:    LDC  5,0(0) 	load constant
143:    SUB  4,4,5 	prepare for comparison op
144:    JEQ  4,2(7) 	op ==
145:    LDC  4,0(0) 	load false into ac
146:    LDA  7,1(7) 	jump past true case
147:    LDC  4,1(0) 	load true into ac
148:    JGT  4,2(7) 	op && (right side)
131:    JEQ  3,17(7) 	Skip right child of && if left is false
149:    LDC  3,0(0) 	load false into ac
150:    LDA  7,1(7) 	jump past true case
151:    LDC  3,1(0) 	load true into ac
152:    LDC  2,1(0) 	load constant 1
153:    SUB  3,3,2 	if condition check
* THEN
* BEGIN
155:    LDC  3,1(0) 	load constant
156:     ST  3,-4(1) 	Store RHS of assignment
157:     LD  3,-3(1) 	load variable r
158:    LDA  2,0(0) 	array base
159:    SUB  3,2,3 	index off of the base
160:     LD  2,-4(1) 	Load RHS value
161:     ST  2,0(3) 	store indexed variable row
162:    LDA  3,0(2) 	adjust current accumulator
* 
163:     LD  3,-3(1) 	load variable r
164:     ST  3,-4(1) 	Store RHS of assignment
165:     LD  3,-2(1) 	load variable c
166:    LDA  2,-12(0) 	array base
167:    SUB  3,2,3 	index off of the base
168:     LD  2,-4(1) 	Load RHS value
169:     ST  2,0(3) 	store indexed variable col
170:    LDA  3,0(2) 	adjust current accumulator
* 
171:    LDC  3,1(0) 	load constant
172:     ST  3,-4(1) 	Store RHS of assignment
173:     LD  3,-3(1) 	load variable r
* Left side will remain in register
174:     LD  4,-2(1) 	load variable c
175:    ADD  3,3,4 	op +
176:    LDA  2,-24(0) 	array base
177:    SUB  3,2,3 	index off of the base
178:     LD  2,-4(1) 	Load RHS value
179:     ST  2,0(3) 	store indexed variable diagone
180:    LDA  3,0(2) 	adjust current accumulator
* 
181:    LDC  3,1(0) 	load constant
182:     ST  3,-4(1) 	Store RHS of assignment
183:     LD  3,-3(1) 	load variable r
* Left side will remain in register
184:     LD  4,-74(0) 	load variable n
* Left side will remain in register
185:    LDC  5,1(0) 	load constant
186:    SUB  4,4,5 	op -
187:    ADD  3,3,4 	op +
* Left side will remain in register
188:     LD  4,-2(1) 	load variable c
189:    SUB  3,3,4 	op -
190:    LDA  2,-49(0) 	array base
191:    SUB  3,2,3 	index off of the base
192:     LD  2,-4(1) 	Load RHS value
193:     ST  2,0(3) 	store indexed variable diagtwo
194:    LDA  3,0(2) 	adjust current accumulator
* 
195:     ST  1,-4(1) 	Store old fp in ghost frame
196:     LD  3,-2(1) 	load variable c
* Left side will remain in register
197:    LDC  4,1(0) 	load constant
198:    ADD  3,3,4 	op +
199:     ST  3,-6(1) 	Save parameter
200:    LDA  1,-4(1) 	Load address of new frame
201:    LDA  3,1(7) 	Put return address in ac
202:    LDA  7,-130(7) 	Call try
203:    LDA  3,0(2) 	Save the result in current accumulator
* 
204:    LDC  3,0(0) 	load constant
205:     ST  3,-4(1) 	Store RHS of assignment
206:     LD  3,-3(1) 	load variable r
207:    LDA  2,0(0) 	array base
208:    SUB  3,2,3 	index off of the base
209:     LD  2,-4(1) 	Load RHS value
210:     ST  2,0(3) 	store indexed variable row
211:    LDA  3,0(2) 	adjust current accumulator
* 
212:    LDC  3,0(0) 	load constant
213:     ST  3,-4(1) 	Store RHS of assignment
214:     LD  3,-3(1) 	load variable r
* Left side will remain in register
215:     LD  4,-2(1) 	load variable c
216:    ADD  3,3,4 	op +
217:    LDA  2,-24(0) 	array base
218:    SUB  3,2,3 	index off of the base
219:     LD  2,-4(1) 	Load RHS value
220:     ST  2,0(3) 	store indexed variable diagone
221:    LDA  3,0(2) 	adjust current accumulator
* 
222:    LDC  3,0(0) 	load constant
223:     ST  3,-4(1) 	Store RHS of assignment
224:     LD  3,-3(1) 	load variable r
* Left side will remain in register
225:     LD  4,-74(0) 	load variable n
* Left side will remain in register
226:    LDC  5,1(0) 	load constant
227:    SUB  4,4,5 	op -
228:    ADD  3,3,4 	op +
* Left side will remain in register
229:     LD  4,-2(1) 	load variable c
230:    SUB  3,3,4 	op -
231:    LDA  2,-49(0) 	array base
232:    SUB  3,2,3 	index off of the base
233:     LD  2,-4(1) 	Load RHS value
234:     ST  2,0(3) 	store indexed variable diagtwo
235:    LDA  3,0(2) 	adjust current accumulator
* END
154:    JLT  3,81(7) 	jump past then if false
* END IF
* 
236:     LD  3,-3(1) 	load variable r
* Left side will remain in register
237:    LDC  4,1(0) 	load constant
238:    ADD  3,3,4 	op +
239:     ST  3,-3(1) 	store variable r
* END
240:    LDA  7,-147(7) 	go to beginning of loop
103:    JLT  3,137(7) 	break out of loop if false
* END WHILE
* END
 91:    LDA  7,149(7) 	jump past else part
* END IF
* END
* This function requires a catch all return
241:    LDC  2,0(0) 	Set return value to 0
242:     LD  3,-1(1) 	Load return address
243:     LD  1,0(1) 	Adjust fp
244:    LDA  7,0(3) 	Return
* End Function try
* Function solve returns int
245:     ST  3,-1(1) 	store return address
* BEGIN
246:     LD  3,-2(1) 	load variable num
247:     ST  3,-74(0) 	store variable n
* 
248:    LDC  3,0(0) 	load constant
249:     ST  3,-75(0) 	store variable count
* 
250:     ST  1,-3(1) 	Store old fp in ghost frame
251:    LDC  3,0(0) 	load constant
252:     ST  3,-5(1) 	Save parameter
253:    LDA  1,-3(1) 	Load address of new frame
254:    LDA  3,1(7) 	Put return address in ac
255:    LDA  7,-183(7) 	Call try
256:    LDA  3,0(2) 	Save the result in current accumulator
* 
* RETURN
257:     LD  3,-75(0) 	load variable count
258:    LDA  2,0(3) 	copy result to rt register
259:     LD  3,-1(1) 	load return address
260:     LD  1,0(1) 	adjust fp
261:    LDA  7,0(3) 	Return
* END
* This function returns from all paths, no catch all return required
* End Function solve
  4:    LDA  7,257(7) 	jump to main
* Function main returns void
262:     ST  3,-1(1) 	store return address
* BEGIN
* WHILE
263:     ST  1,-3(1) 	Store old fp in ghost frame
264:    LDA  1,-3(1) 	Load address of new frame
265:    LDA  3,1(7) 	Put return address in ac
266:    LDA  7,-261(7) 	Call input
267:    LDA  3,0(2) 	Save the result in current accumulator
268:     ST  3,-2(1) 	store variable num
* Left side will remain in register
269:    LDC  4,0(0) 	load constant
270:    SUB  3,3,4 	prepare for comparison op
271:    JGT  3,2(7) 	op >
272:    LDC  3,0(0) 	load false into ac
273:    LDA  7,1(7) 	jump past true case
274:    LDC  3,1(0) 	load true into ac
275:    LDC  2,1(0) 	load constant 1
276:    SUB  3,3,2 	while condition check
* WHILE BODY
* BEGIN
278:     ST  1,-3(1) 	Store old fp in ghost frame
279:     ST  1,-5(1) 	Store old fp in ghost frame
280:     LD  3,-2(1) 	load variable num
281:     ST  3,-7(1) 	Save parameter
282:    LDA  1,-5(1) 	Load address of new frame
283:    LDA  3,1(7) 	Put return address in ac
284:    LDA  7,-40(7) 	Call solve
285:    LDA  3,0(2) 	Save the result in current accumulator
286:     ST  3,-5(1) 	Save parameter
287:    LDA  1,-3(1) 	Load address of new frame
288:    LDA  3,1(7) 	Put return address in ac
289:    LDA  7,-279(7) 	Call output
290:    LDA  3,0(2) 	Save the result in current accumulator
* END
291:    LDA  7,-29(7) 	go to beginning of loop
277:    JLT  3,14(7) 	break out of loop if false
* END WHILE
* END
* This function requires a catch all return
292:    LDC  2,0(0) 	Set return value to 0
293:     LD  3,-1(1) 	Load return address
294:     LD  1,0(1) 	Adjust fp
295:    LDA  7,0(3) 	Return
* End Function main
