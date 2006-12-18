* Begin Prolog code
  0:     LD  0,0(0) 	load global poiniter with end of memory
  1:    LDA  1,0(0) 	load fp
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
 30:     ST  3,-1(1) 	store return address
* Function get returns int
* BEGIN
 31:     ST  1,-4(1) 	Store old fp in ghost frame
 32:    LDC  3,0(6) 	load constant
 33:     LD  4,-2(1) 	array base
 34:    SUB  3,4,3 	index off of the base
 35:     LD  3,0(3) 	load the value
 36:     ST  3,-6(1) 	Save parameter
 37:    LDA  1,-4(1) 	Load address of new frame
 38:    LDA  3,1(7) 	Put return address in ac
 39:    LDA  7,-29(7) 	Call output
 40:    LDA  3,0(2) 	Save the result in ac
* 
 41:    LDC  3,666(6) 	load constant
 42:     ST  3,-4(1) 	Store RHS of assignment
 43:    LDC  3,1(6) 	load constant
 44:     LD  5,-4(1) 	Load RHS value
 45:     LD  4,-2(1) 	array base
 46:    SUB  3,4,3 	index off of the base
 47:     ST  5,0(3) 	store indexed variable x
 48:    LDA  3,0(5) 	adjust ac
* 
* RETURN
 49:     LD  3,-3(1) 	load variable i
 50:     LD  4,-2(1) 	array base
 51:    SUB  3,4,3 	index off of the base
 52:     LD  3,0(3) 	load the value
 53:    LDA  2,0(3) 	copy result to rt register
 54:     LD  3,-1(1) 	load return address
 55:     LD  1,0(1) 	adjust fp
 56:    LDA  7,0(3) 	Return
* END
* Add standard closing in case there is no return statement
 57:    LDC  2,0(6) 	Set return value to 0
 58:     LD  3,-1(1) 	Load return address
 59:     LD  1,0(1) 	Adjust fp
 60:    LDA  7,0(3) 	Return
* End Function get
 61:     ST  3,-1(1) 	store return address
  4:    LDA  7,56(7) 	jump to main
* Function main returns void
* BEGIN
 62:    LDC  3,2(6) 	load constant
 63:     ST  3,-7(1) 	store variable dog
* 
 64:    LDC  3,3(6) 	load constant
 65:     ST  3,-8(1) 	Store RHS of assignment
 66:    LDC  3,0(6) 	load constant
 67:     LD  5,-8(1) 	Load RHS value
 68:    LDA  4,-2(1) 	array base
 69:    SUB  3,4,3 	index off of the base
 70:     ST  5,0(3) 	store indexed variable x
 71:    LDA  3,0(5) 	adjust ac
* 
 72:     ST  1,-8(1) 	Store old fp in ghost frame
 73:    LDC  3,0(6) 	load constant
 74:    LDA  4,-2(1) 	array base
 75:    SUB  3,4,3 	index off of the base
 76:     LD  3,0(3) 	load the value
 77:     ST  3,-10(1) 	Save parameter
 78:    LDA  1,-8(1) 	Load address of new frame
 79:    LDA  3,1(7) 	Put return address in ac
 80:    LDA  7,-70(7) 	Call output
 81:    LDA  3,0(2) 	Save the result in ac
* 
 82:    LDC  3,0(6) 	load constant
 83:    LDA  4,-2(1) 	array base
 84:    SUB  3,4,3 	index off of the base
 85:     LD  3,0(3) 	load the value
 86:     ST  3,-8(1) 	Store RHS of assignment
 87:    LDC  3,1(6) 	load constant
 88:     LD  5,-8(1) 	Load RHS value
 89:    LDA  4,-2(1) 	array base
 90:    SUB  3,4,3 	index off of the base
 91:     ST  5,0(3) 	store indexed variable x
 92:    LDA  3,0(5) 	adjust ac
* 
 93:     ST  1,-8(1) 	Store old fp in ghost frame
 94:    LDC  3,1(6) 	load constant
 95:    LDA  4,-2(1) 	array base
 96:    SUB  3,4,3 	index off of the base
 97:     LD  3,0(3) 	load the value
 98:     ST  3,-10(1) 	Save parameter
 99:    LDA  1,-8(1) 	Load address of new frame
100:    LDA  3,1(7) 	Put return address in ac
101:    LDA  7,-91(7) 	Call output
102:    LDA  3,0(2) 	Save the result in ac
* 
103:    LDC  3,1(6) 	load constant
104:    LDA  4,-2(1) 	array base
105:    SUB  3,4,3 	index off of the base
106:     LD  3,0(3) 	load the value
107:     ST  3,-8(1) 	save left side
108:    LDC  3,1(6) 	load constant
109:     LD  4,-8(1) 	load left into ac1
110:    ADD  3,4,3 	op +
111:     ST  3,-8(1) 	Store RHS of assignment
112:    LDC  3,2(6) 	load constant
113:     LD  5,-8(1) 	Load RHS value
114:    LDA  4,-2(1) 	array base
115:    SUB  3,4,3 	index off of the base
116:     ST  5,0(3) 	store indexed variable x
117:    LDA  3,0(5) 	adjust ac
* 
118:     ST  1,-8(1) 	Store old fp in ghost frame
119:    LDC  3,2(6) 	load constant
120:    LDA  4,-2(1) 	array base
121:    SUB  3,4,3 	index off of the base
122:     LD  3,0(3) 	load the value
123:     ST  3,-10(1) 	Save parameter
124:    LDA  1,-8(1) 	Load address of new frame
125:    LDA  3,1(7) 	Put return address in ac
126:    LDA  7,-116(7) 	Call output
127:    LDA  3,0(2) 	Save the result in ac
* 
128:    LDC  3,496(6) 	load constant
129:     ST  3,-8(1) 	Store RHS of assignment
130:     LD  3,-7(1) 	load variable dog
131:     ST  3,-9(1) 	save left side
132:     LD  3,-7(1) 	load variable dog
133:     LD  4,-9(1) 	load left into ac1
134:    ADD  3,4,3 	op +
135:     LD  5,-8(1) 	Load RHS value
136:    LDA  4,-2(1) 	array base
137:    SUB  3,4,3 	index off of the base
138:     ST  5,0(3) 	store indexed variable x
139:    LDA  3,0(5) 	adjust ac
* 
140:     ST  1,-8(1) 	Store old fp in ghost frame
141:    LDC  3,4(6) 	load constant
142:    LDA  4,-2(1) 	array base
143:    SUB  3,4,3 	index off of the base
144:     LD  3,0(3) 	load the value
145:     ST  3,-10(1) 	Save parameter
146:    LDA  1,-8(1) 	Load address of new frame
147:    LDA  3,1(7) 	Put return address in ac
148:    LDA  7,-138(7) 	Call output
149:    LDA  3,0(2) 	Save the result in ac
* 
150:    LDC  3,2(6) 	load constant
151:     ST  3,-7(1) 	store variable dog
* 
152:    LDC  3,3(6) 	load constant
153:     ST  3,-8(1) 	Store RHS of assignment
154:    LDC  3,0(6) 	load constant
155:     LD  5,-8(1) 	Load RHS value
156:    LDA  4,0(0) 	array base
157:    SUB  3,4,3 	index off of the base
158:     ST  5,0(3) 	store indexed variable y
159:    LDA  3,0(5) 	adjust ac
* 
160:     ST  1,-8(1) 	Store old fp in ghost frame
161:    LDC  3,0(6) 	load constant
162:    LDA  4,0(0) 	array base
163:    SUB  3,4,3 	index off of the base
164:     LD  3,0(3) 	load the value
165:     ST  3,-10(1) 	Save parameter
166:    LDA  1,-8(1) 	Load address of new frame
167:    LDA  3,1(7) 	Put return address in ac
168:    LDA  7,-158(7) 	Call output
169:    LDA  3,0(2) 	Save the result in ac
* 
170:    LDC  3,0(6) 	load constant
171:    LDA  4,0(0) 	array base
172:    SUB  3,4,3 	index off of the base
173:     LD  3,0(3) 	load the value
174:     ST  3,-8(1) 	Store RHS of assignment
175:    LDC  3,1(6) 	load constant
176:     LD  5,-8(1) 	Load RHS value
177:    LDA  4,0(0) 	array base
178:    SUB  3,4,3 	index off of the base
179:     ST  5,0(3) 	store indexed variable y
180:    LDA  3,0(5) 	adjust ac
* 
181:     ST  1,-8(1) 	Store old fp in ghost frame
182:    LDC  3,1(6) 	load constant
183:    LDA  4,0(0) 	array base
184:    SUB  3,4,3 	index off of the base
185:     LD  3,0(3) 	load the value
186:     ST  3,-10(1) 	Save parameter
187:    LDA  1,-8(1) 	Load address of new frame
188:    LDA  3,1(7) 	Put return address in ac
189:    LDA  7,-179(7) 	Call output
190:    LDA  3,0(2) 	Save the result in ac
* 
191:    LDC  3,1(6) 	load constant
192:    LDA  4,0(0) 	array base
193:    SUB  3,4,3 	index off of the base
194:     LD  3,0(3) 	load the value
195:     ST  3,-8(1) 	save left side
196:    LDC  3,311(6) 	load constant
197:     LD  4,-8(1) 	load left into ac1
198:    ADD  3,4,3 	op +
199:     ST  3,-8(1) 	Store RHS of assignment
200:    LDC  3,2(6) 	load constant
201:     LD  5,-8(1) 	Load RHS value
202:    LDA  4,0(0) 	array base
203:    SUB  3,4,3 	index off of the base
204:     ST  5,0(3) 	store indexed variable y
205:    LDA  3,0(5) 	adjust ac
* 
206:     ST  1,-8(1) 	Store old fp in ghost frame
207:    LDC  3,2(6) 	load constant
208:    LDA  4,0(0) 	array base
209:    SUB  3,4,3 	index off of the base
210:     LD  3,0(3) 	load the value
211:     ST  3,-10(1) 	Save parameter
212:    LDA  1,-8(1) 	Load address of new frame
213:    LDA  3,1(7) 	Put return address in ac
214:    LDA  7,-204(7) 	Call output
215:    LDA  3,0(2) 	Save the result in ac
* 
216:    LDC  3,496(6) 	load constant
217:     ST  3,-8(1) 	Store RHS of assignment
218:     LD  3,-7(1) 	load variable dog
219:     ST  3,-9(1) 	save left side
220:     LD  3,-7(1) 	load variable dog
221:     LD  4,-9(1) 	load left into ac1
222:    ADD  3,4,3 	op +
223:     LD  5,-8(1) 	Load RHS value
224:    LDA  4,0(0) 	array base
225:    SUB  3,4,3 	index off of the base
226:     ST  5,0(3) 	store indexed variable y
227:    LDA  3,0(5) 	adjust ac
* 
228:     ST  1,-8(1) 	Store old fp in ghost frame
229:    LDC  3,4(6) 	load constant
230:    LDA  4,0(0) 	array base
231:    SUB  3,4,3 	index off of the base
232:     LD  3,0(3) 	load the value
233:     ST  3,-10(1) 	Save parameter
234:    LDA  1,-8(1) 	Load address of new frame
235:    LDA  3,1(7) 	Put return address in ac
236:    LDA  7,-226(7) 	Call output
237:    LDA  3,0(2) 	Save the result in ac
* 
238:     ST  1,-8(1) 	Store old fp in ghost frame
239:    LDA  3,0(0) 	Load address of base of array y
240:     ST  3,-10(1) 	Save parameter
241:    LDC  3,2(6) 	load constant
242:     ST  3,-11(1) 	Save parameter
243:    LDA  1,-8(1) 	Load address of new frame
244:    LDA  3,1(7) 	Put return address in ac
245:    LDA  7,-216(7) 	Call get
246:    LDA  3,0(2) 	Save the result in ac
247:     ST  3,-7(1) 	store variable dog
* 
248:     ST  1,-8(1) 	Store old fp in ghost frame
249:     LD  3,-7(1) 	load variable dog
250:     ST  3,-10(1) 	Save parameter
251:    LDA  1,-8(1) 	Load address of new frame
252:    LDA  3,1(7) 	Put return address in ac
253:    LDA  7,-243(7) 	Call output
254:    LDA  3,0(2) 	Save the result in ac
* 
255:     ST  1,-8(1) 	Store old fp in ghost frame
256:     ST  1,-10(1) 	Store old fp in ghost frame
257:    LDA  3,0(0) 	Load address of base of array y
258:     ST  3,-12(1) 	Save parameter
259:    LDC  3,2(6) 	load constant
260:     ST  3,-13(1) 	Save parameter
261:    LDA  1,-10(1) 	Load address of new frame
262:    LDA  3,1(7) 	Put return address in ac
263:    LDA  7,-234(7) 	Call get
264:    LDA  3,0(2) 	Save the result in ac
265:     ST  3,-10(1) 	Save parameter
266:    LDA  1,-8(1) 	Load address of new frame
267:    LDA  3,1(7) 	Put return address in ac
268:    LDA  7,-258(7) 	Call output
269:    LDA  3,0(2) 	Save the result in ac
* 
270:     ST  1,-8(1) 	Store old fp in ghost frame
271:    LDC  3,1(6) 	load constant
272:    LDA  4,-2(1) 	array base
273:    SUB  3,4,3 	index off of the base
274:     LD  3,0(3) 	load the value
275:     ST  3,-10(1) 	Save parameter
276:    LDA  1,-8(1) 	Load address of new frame
277:    LDA  3,1(7) 	Put return address in ac
278:    LDA  7,-268(7) 	Call output
279:    LDA  3,0(2) 	Save the result in ac
* END
* Add standard closing in case there is no return statement
280:    LDC  2,0(6) 	Set return value to 0
281:     LD  3,-1(1) 	Load return address
282:     LD  1,0(1) 	Adjust fp
283:    LDA  7,0(3) 	Return
* End Function main
