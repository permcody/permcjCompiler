* C- compiler version 1.0
* Author: Cody Permann
* May 13, 2004
* Begin Prolog code
  0:     LD  0,0(0) 	load global poiniter with end of memory
  1:    LDA  1,-1(0) 	load fp
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
* Function put returns void
 30:     ST  3,-1(1) 	store return address
* BEGIN
 31:    LDC  3,1(0) 	load constant
 32:     LD  2,-2(1) 	Load address of base of array p
 33:    SUB  3,2,3 	index off of the base
 34:     LD  3,0(3) 	load the value
 35:     ST  3,-4(1) 	store variable sum
* 
 36:    LDC  3,2(0) 	load constant
 37:     ST  3,-3(1) 	store variable j
* 
* WHILE
 38:     LD  3,-3(1) 	load variable j
* Left side will remain in register
 39:     LD  4,0(0) 	load variable n
 40:    SUB  3,3,4 	prepare for comparison op
 41:    JLE  3,2(7) 	op <=
 42:    LDC  3,0(0) 	load false into ac
 43:    LDA  7,1(7) 	jump past true case
 44:    LDC  3,1(0) 	load true into ac
 45:    LDC  2,1(0) 	load constant 1
 46:    SUB  3,3,2 	while condition check
* WHILE BODY
* BEGIN
 48:     LD  3,-4(1) 	load variable sum
* Left side will remain in register
 49:    LDC  4,10(0) 	load constant
 50:    MUL  3,3,4 	op *
* Left side will remain in register
 51:     LD  4,-3(1) 	load variable j
 52:     LD  2,-2(1) 	Load address of base of array p
 53:    SUB  4,2,4 	index off of the base
 54:     LD  4,0(4) 	load the value
 55:    ADD  3,3,4 	op +
 56:     ST  3,-4(1) 	store variable sum
* 
 57:     LD  3,-3(1) 	load variable j
* Left side will remain in register
 58:    LDC  4,1(0) 	load constant
 59:    ADD  3,3,4 	op +
 60:     ST  3,-3(1) 	store variable j
* END
 61:    LDA  7,-24(7) 	go to beginning of loop
 47:    JLT  3,14(7) 	break out of loop if false
* END WHILE
* 
 62:     ST  1,-5(1) 	Store old fp in ghost frame
 63:     LD  3,-4(1) 	load variable sum
 64:     ST  3,-7(1) 	Save parameter
 65:    LDA  1,-5(1) 	Load address of new frame
 66:    LDA  3,1(7) 	Put return address in ac
 67:    LDA  7,-57(7) 	Call output
 68:    LDA  3,0(2) 	Save the result in current accumulator
* END
* This function requires a catch all return
 69:    LDC  2,0(0) 	Set return value to 0
 70:     LD  3,-1(1) 	Load return address
 71:     LD  1,0(1) 	Adjust fp
 72:    LDA  7,0(3) 	Return
* End Function put
  4:    LDA  7,68(7) 	jump to main
* Function main returns int
 73:     ST  3,-1(1) 	store return address
* BEGIN
 74:    LDC  3,5(0) 	load constant
 75:     ST  3,0(0) 	store variable n
* 
 76:    LDC  3,0(0) 	load constant
 77:     ST  3,-23(1) 	store variable j
* 
* WHILE
 78:     LD  3,-23(1) 	load variable j
* Left side will remain in register
 79:     LD  4,0(0) 	load variable n
 80:    SUB  3,3,4 	prepare for comparison op
 81:    JLE  3,2(7) 	op <=
 82:    LDC  3,0(0) 	load false into ac
 83:    LDA  7,1(7) 	jump past true case
 84:    LDC  3,1(0) 	load true into ac
 85:    LDC  2,1(0) 	load constant 1
 86:    SUB  3,3,2 	while condition check
* WHILE BODY
* BEGIN
 88:     LD  3,-23(1) 	load variable j
 89:     ST  3,-27(1) 	Store RHS of assignment
 90:     LD  3,-23(1) 	load variable j
 91:    LDA  2,-2(1) 	array base
 92:    SUB  3,2,3 	index off of the base
 93:     LD  2,-27(1) 	Load RHS value
 94:     ST  2,0(3) 	store indexed variable p
 95:    LDA  3,0(2) 	adjust current accumulator
* 
 96:     LD  3,-23(1) 	load variable j
* Left side will remain in register
 97:    LDC  4,1(0) 	load constant
 98:    ADD  3,3,4 	op +
 99:     ST  3,-23(1) 	store variable j
* END
100:    LDA  7,-23(7) 	go to beginning of loop
 87:    JLT  3,13(7) 	break out of loop if false
* END WHILE
* 
101:    LDC  3,1(0) 	load constant
102:     ST  3,-22(1) 	store variable i
* 
* WHILE
103:     LD  3,-22(1) 	load variable i
* Left side will remain in register
104:    LDC  4,0(0) 	load constant
105:    SUB  3,3,4 	prepare for comparison op
106:    JGT  3,2(7) 	op >
107:    LDC  3,0(0) 	load false into ac
108:    LDA  7,1(7) 	jump past true case
109:    LDC  3,1(0) 	load true into ac
110:    LDC  2,1(0) 	load constant 1
111:    SUB  3,3,2 	while condition check
* WHILE BODY
* BEGIN
113:     ST  1,-27(1) 	Store old fp in ghost frame
114:    LDA  3,-2(1) 	Load address of base of array p
115:     ST  3,-29(1) 	Save parameter
116:    LDA  1,-27(1) 	Load address of new frame
117:    LDA  3,1(7) 	Put return address in ac
118:    LDA  7,-89(7) 	Call put
119:    LDA  3,0(2) 	Save the result in current accumulator
* 
120:     LD  3,0(0) 	load variable n
* Left side will remain in register
121:    LDC  4,1(0) 	load constant
122:    SUB  3,3,4 	op -
123:     ST  3,-22(1) 	store variable i
* 
* WHILE
124:     LD  3,-22(1) 	load variable i
125:    LDA  2,-2(1) 	Load address of base of array p
126:    SUB  3,2,3 	index off of the base
127:     LD  3,0(3) 	load the value
* Left side will remain in register
128:     LD  4,-22(1) 	load variable i
* Left side will remain in register
129:    LDC  5,1(0) 	load constant
130:    ADD  4,4,5 	op +
131:    LDA  2,-2(1) 	Load address of base of array p
132:    SUB  4,2,4 	index off of the base
133:     LD  4,0(4) 	load the value
134:    SUB  3,3,4 	prepare for comparison op
135:    JGT  3,2(7) 	op >
136:    LDC  3,0(0) 	load false into ac
137:    LDA  7,1(7) 	jump past true case
138:    LDC  3,1(0) 	load true into ac
139:    LDC  2,1(0) 	load constant 1
140:    SUB  3,3,2 	while condition check
* WHILE BODY
142:     LD  3,-22(1) 	load variable i
* Left side will remain in register
143:    LDC  4,1(0) 	load constant
144:    SUB  3,3,4 	op -
145:     ST  3,-22(1) 	store variable i
146:    LDA  7,-23(7) 	go to beginning of loop
141:    JLT  3,5(7) 	break out of loop if false
* END WHILE
* 
147:     LD  3,0(0) 	load variable n
148:     ST  3,-23(1) 	store variable j
* 
* WHILE
149:     LD  3,-22(1) 	load variable i
150:    LDA  2,-2(1) 	Load address of base of array p
151:    SUB  3,2,3 	index off of the base
152:     LD  3,0(3) 	load the value
* Left side will remain in register
153:     LD  4,-23(1) 	load variable j
154:    LDA  2,-2(1) 	Load address of base of array p
155:    SUB  4,2,4 	index off of the base
156:     LD  4,0(4) 	load the value
157:    SUB  3,3,4 	prepare for comparison op
158:    JGT  3,2(7) 	op >
159:    LDC  3,0(0) 	load false into ac
160:    LDA  7,1(7) 	jump past true case
161:    LDC  3,1(0) 	load true into ac
162:    LDC  2,1(0) 	load constant 1
163:    SUB  3,3,2 	while condition check
* WHILE BODY
165:     LD  3,-23(1) 	load variable j
* Left side will remain in register
166:    LDC  4,1(0) 	load constant
167:    SUB  3,3,4 	op -
168:     ST  3,-23(1) 	store variable j
169:    LDA  7,-21(7) 	go to beginning of loop
164:    JLT  3,5(7) 	break out of loop if false
* END WHILE
* 
170:     LD  3,-22(1) 	load variable i
171:    LDA  2,-2(1) 	Load address of base of array p
172:    SUB  3,2,3 	index off of the base
173:     LD  3,0(3) 	load the value
174:     ST  3,-26(1) 	store variable tmp
* 
175:     LD  3,-23(1) 	load variable j
176:    LDA  2,-2(1) 	Load address of base of array p
177:    SUB  3,2,3 	index off of the base
178:     LD  3,0(3) 	load the value
179:     ST  3,-27(1) 	Store RHS of assignment
180:     LD  3,-22(1) 	load variable i
181:    LDA  2,-2(1) 	array base
182:    SUB  3,2,3 	index off of the base
183:     LD  2,-27(1) 	Load RHS value
184:     ST  2,0(3) 	store indexed variable p
185:    LDA  3,0(2) 	adjust current accumulator
* 
186:     LD  3,-26(1) 	load variable tmp
187:     ST  3,-27(1) 	Store RHS of assignment
188:     LD  3,-23(1) 	load variable j
189:    LDA  2,-2(1) 	array base
190:    SUB  3,2,3 	index off of the base
191:     LD  2,-27(1) 	Load RHS value
192:     ST  2,0(3) 	store indexed variable p
193:    LDA  3,0(2) 	adjust current accumulator
* 
194:     LD  3,0(0) 	load variable n
195:     ST  3,-24(1) 	store variable r
* 
196:     LD  3,-22(1) 	load variable i
* Left side will remain in register
197:    LDC  4,1(0) 	load constant
198:    ADD  3,3,4 	op +
199:     ST  3,-25(1) 	store variable s
* 
* WHILE
200:     LD  3,-24(1) 	load variable r
* Left side will remain in register
201:     LD  4,-25(1) 	load variable s
202:    SUB  3,3,4 	prepare for comparison op
203:    JGT  3,2(7) 	op >
204:    LDC  3,0(0) 	load false into ac
205:    LDA  7,1(7) 	jump past true case
206:    LDC  3,1(0) 	load true into ac
207:    LDC  2,1(0) 	load constant 1
208:    SUB  3,3,2 	while condition check
* WHILE BODY
* BEGIN
210:     LD  3,-24(1) 	load variable r
211:    LDA  2,-2(1) 	Load address of base of array p
212:    SUB  3,2,3 	index off of the base
213:     LD  3,0(3) 	load the value
214:     ST  3,-26(1) 	store variable tmp
* 
215:     LD  3,-25(1) 	load variable s
216:    LDA  2,-2(1) 	Load address of base of array p
217:    SUB  3,2,3 	index off of the base
218:     LD  3,0(3) 	load the value
219:     ST  3,-27(1) 	Store RHS of assignment
220:     LD  3,-24(1) 	load variable r
221:    LDA  2,-2(1) 	array base
222:    SUB  3,2,3 	index off of the base
223:     LD  2,-27(1) 	Load RHS value
224:     ST  2,0(3) 	store indexed variable p
225:    LDA  3,0(2) 	adjust current accumulator
* 
226:     LD  3,-26(1) 	load variable tmp
227:     ST  3,-27(1) 	Store RHS of assignment
228:     LD  3,-25(1) 	load variable s
229:    LDA  2,-2(1) 	array base
230:    SUB  3,2,3 	index off of the base
231:     LD  2,-27(1) 	Load RHS value
232:     ST  2,0(3) 	store indexed variable p
233:    LDA  3,0(2) 	adjust current accumulator
* 
234:     LD  3,-24(1) 	load variable r
* Left side will remain in register
235:    LDC  4,1(0) 	load constant
236:    SUB  3,3,4 	op -
237:     ST  3,-24(1) 	store variable r
* 
238:     LD  3,-25(1) 	load variable s
* Left side will remain in register
239:    LDC  4,1(0) 	load constant
240:    ADD  3,3,4 	op +
241:     ST  3,-25(1) 	store variable s
* END
242:    LDA  7,-43(7) 	go to beginning of loop
209:    JLT  3,33(7) 	break out of loop if false
* END WHILE
* END
243:    LDA  7,-141(7) 	go to beginning of loop
112:    JLT  3,131(7) 	break out of loop if false
* END WHILE
* END
* This function requires a catch all return
244:    LDC  2,0(0) 	Set return value to 0
245:     LD  3,-1(1) 	Load return address
246:     LD  1,0(1) 	Adjust fp
247:    LDA  7,0(3) 	Return
* End Function main
