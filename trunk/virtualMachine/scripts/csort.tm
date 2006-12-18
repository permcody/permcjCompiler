* C- compiler version 1.0
* Author: Cody Permann
* May 13, 2004
* Begin Prolog code
  0:     LD  0,0(0) 	load global poiniter with end of memory
  1:    LDA  1,-11(0) 	load fp
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
* Function minloc returns int
 30:     ST  3,-1(1) 	store return address
* BEGIN
 31:     LD  3,-3(1) 	load variable low
 32:     ST  3,-7(1) 	store variable k
* 
 33:     LD  3,-3(1) 	load variable low
 34:     LD  2,-2(1) 	Load address of base of array a
 35:    SUB  3,2,3 	index off of the base
 36:     LD  3,0(3) 	load the value
 37:     ST  3,-6(1) 	store variable x
* 
 38:     LD  3,-3(1) 	load variable low
* Left side will remain in register
 39:    LDC  4,1(0) 	load constant
 40:    ADD  3,3,4 	op +
 41:     ST  3,-5(1) 	store variable i
* 
* WHILE
 42:     LD  3,-5(1) 	load variable i
* Left side will remain in register
 43:     LD  4,-4(1) 	load variable high
 44:    SUB  3,3,4 	prepare for comparison op
 45:    JLT  3,2(7) 	op <
 46:    LDC  3,0(0) 	load false into ac
 47:    LDA  7,1(7) 	jump past true case
 48:    LDC  3,1(0) 	load true into ac
 49:    LDC  2,1(0) 	load constant 1
 50:    SUB  3,3,2 	while condition check
* WHILE BODY
* BEGIN
* IF
 52:     LD  3,-5(1) 	load variable i
 53:     LD  2,-2(1) 	Load address of base of array a
 54:    SUB  3,2,3 	index off of the base
 55:     LD  3,0(3) 	load the value
* Left side will remain in register
 56:     LD  4,-6(1) 	load variable x
 57:    SUB  3,3,4 	prepare for comparison op
 58:    JLT  3,2(7) 	op <
 59:    LDC  3,0(0) 	load false into ac
 60:    LDA  7,1(7) 	jump past true case
 61:    LDC  3,1(0) 	load true into ac
 62:    LDC  2,1(0) 	load constant 1
 63:    SUB  3,3,2 	if condition check
* THEN
* BEGIN
 65:     LD  3,-5(1) 	load variable i
 66:     LD  2,-2(1) 	Load address of base of array a
 67:    SUB  3,2,3 	index off of the base
 68:     LD  3,0(3) 	load the value
 69:     ST  3,-6(1) 	store variable x
* 
 70:     LD  3,-5(1) 	load variable i
 71:     ST  3,-7(1) 	store variable k
* END
 64:    JLT  3,7(7) 	jump past then if false
* END IF
* 
 72:     LD  3,-5(1) 	load variable i
* Left side will remain in register
 73:    LDC  4,1(0) 	load constant
 74:    ADD  3,3,4 	op +
 75:     ST  3,-5(1) 	store variable i
* END
 76:    LDA  7,-35(7) 	go to beginning of loop
 51:    JLT  3,25(7) 	break out of loop if false
* END WHILE
* 
* RETURN
 77:     LD  3,-7(1) 	load variable k
 78:    LDA  2,0(3) 	copy result to rt register
 79:     LD  3,-1(1) 	load return address
 80:     LD  1,0(1) 	adjust fp
 81:    LDA  7,0(3) 	Return
* END
* This function returns from all paths, no catch all return required
* End Function minloc
* Function sort returns void
 82:     ST  3,-1(1) 	store return address
* BEGIN
 83:     LD  3,-3(1) 	load variable low
 84:     ST  3,-5(1) 	store variable i
* 
* WHILE
 85:     LD  3,-5(1) 	load variable i
* Left side will remain in register
 86:     LD  4,-4(1) 	load variable high
* Left side will remain in register
 87:    LDC  5,1(0) 	load constant
 88:    SUB  4,4,5 	op -
 89:    SUB  3,3,4 	prepare for comparison op
 90:    JLT  3,2(7) 	op <
 91:    LDC  3,0(0) 	load false into ac
 92:    LDA  7,1(7) 	jump past true case
 93:    LDC  3,1(0) 	load true into ac
 94:    LDC  2,1(0) 	load constant 1
 95:    SUB  3,3,2 	while condition check
* WHILE BODY
* BEGIN
 97:     ST  1,-8(1) 	Store old fp in ghost frame
 98:     LD  3,-2(1) 	Load address of base of array a
 99:     ST  3,-10(1) 	Save parameter
100:     LD  3,-5(1) 	load variable i
101:     ST  3,-11(1) 	Save parameter
102:     LD  3,-4(1) 	load variable high
103:     ST  3,-12(1) 	Save parameter
104:    LDA  1,-8(1) 	Load address of new frame
105:    LDA  3,1(7) 	Put return address in ac
106:    LDA  7,-77(7) 	Call minloc
107:    LDA  3,0(2) 	Save the result in current accumulator
108:     ST  3,-6(1) 	store variable k
* 
109:     LD  3,-6(1) 	load variable k
110:     LD  2,-2(1) 	Load address of base of array a
111:    SUB  3,2,3 	index off of the base
112:     LD  3,0(3) 	load the value
113:     ST  3,-7(1) 	store variable t
* 
114:     LD  3,-5(1) 	load variable i
115:     LD  2,-2(1) 	Load address of base of array a
116:    SUB  3,2,3 	index off of the base
117:     LD  3,0(3) 	load the value
118:     ST  3,-8(1) 	Store RHS of assignment
119:     LD  3,-6(1) 	load variable k
120:     LD  2,-2(1) 	array base
121:    SUB  3,2,3 	index off of the base
122:     LD  2,-8(1) 	Load RHS value
123:     ST  2,0(3) 	store indexed variable a
124:    LDA  3,0(2) 	adjust current accumulator
* 
125:     LD  3,-7(1) 	load variable t
126:     ST  3,-8(1) 	Store RHS of assignment
127:     LD  3,-5(1) 	load variable i
128:     LD  2,-2(1) 	array base
129:    SUB  3,2,3 	index off of the base
130:     LD  2,-8(1) 	Load RHS value
131:     ST  2,0(3) 	store indexed variable a
132:    LDA  3,0(2) 	adjust current accumulator
* 
133:     LD  3,-5(1) 	load variable i
* Left side will remain in register
134:    LDC  4,1(0) 	load constant
135:    ADD  3,3,4 	op +
136:     ST  3,-5(1) 	store variable i
* END
137:    LDA  7,-53(7) 	go to beginning of loop
 96:    JLT  3,41(7) 	break out of loop if false
* END WHILE
* END
* This function requires a catch all return
138:    LDC  2,0(0) 	Set return value to 0
139:     LD  3,-1(1) 	Load return address
140:     LD  1,0(1) 	Adjust fp
141:    LDA  7,0(3) 	Return
* End Function sort
  4:    LDA  7,137(7) 	jump to main
* Function main returns void
142:     ST  3,-1(1) 	store return address
* BEGIN
143:     ST  1,-3(1) 	Store old fp in ghost frame
144:    LDA  1,-3(1) 	Load address of new frame
145:    LDA  3,1(7) 	Put return address in ac
146:    LDA  7,-141(7) 	Call input
147:    LDA  3,0(2) 	Save the result in current accumulator
148:     ST  3,0(0) 	store variable size
* 
149:    LDC  3,0(0) 	load constant
150:     ST  3,-2(1) 	store variable i
* 
* WHILE
151:     LD  3,-2(1) 	load variable i
* Left side will remain in register
152:     LD  4,0(0) 	load variable size
153:    SUB  3,3,4 	prepare for comparison op
154:    JLT  3,2(7) 	op <
155:    LDC  3,0(0) 	load false into ac
156:    LDA  7,1(7) 	jump past true case
157:    LDC  3,1(0) 	load true into ac
158:    LDC  2,1(0) 	load constant 1
159:    SUB  3,3,2 	while condition check
* WHILE BODY
* BEGIN
161:     ST  1,-3(1) 	Store old fp in ghost frame
162:    LDA  1,-3(1) 	Load address of new frame
163:    LDA  3,1(7) 	Put return address in ac
164:    LDA  7,-159(7) 	Call input
165:    LDA  3,0(2) 	Save the result in current accumulator
166:     ST  3,-3(1) 	Store RHS of assignment
167:     LD  3,-2(1) 	load variable i
168:    LDA  2,-1(0) 	array base
169:    SUB  3,2,3 	index off of the base
170:     LD  2,-3(1) 	Load RHS value
171:     ST  2,0(3) 	store indexed variable x
172:    LDA  3,0(2) 	adjust current accumulator
* 
173:     LD  3,-2(1) 	load variable i
* Left side will remain in register
174:    LDC  4,1(0) 	load constant
175:    ADD  3,3,4 	op +
176:     ST  3,-2(1) 	store variable i
* END
177:    LDA  7,-27(7) 	go to beginning of loop
160:    JLT  3,17(7) 	break out of loop if false
* END WHILE
* 
178:     ST  1,-3(1) 	Store old fp in ghost frame
179:    LDA  3,-1(0) 	Load address of base of array x
180:     ST  3,-5(1) 	Save parameter
181:    LDC  3,0(0) 	load constant
182:     ST  3,-6(1) 	Save parameter
183:     LD  3,0(0) 	load variable size
184:     ST  3,-7(1) 	Save parameter
185:    LDA  1,-3(1) 	Load address of new frame
186:    LDA  3,1(7) 	Put return address in ac
187:    LDA  7,-106(7) 	Call sort
188:    LDA  3,0(2) 	Save the result in current accumulator
* 
189:    LDC  3,0(0) 	load constant
190:     ST  3,-2(1) 	store variable i
* 
* WHILE
191:     LD  3,-2(1) 	load variable i
* Left side will remain in register
192:     LD  4,0(0) 	load variable size
193:    SUB  3,3,4 	prepare for comparison op
194:    JLT  3,2(7) 	op <
195:    LDC  3,0(0) 	load false into ac
196:    LDA  7,1(7) 	jump past true case
197:    LDC  3,1(0) 	load true into ac
198:    LDC  2,1(0) 	load constant 1
199:    SUB  3,3,2 	while condition check
* WHILE BODY
* BEGIN
201:     ST  1,-3(1) 	Store old fp in ghost frame
202:     LD  3,-2(1) 	load variable i
203:    LDA  2,-1(0) 	Load address of base of array x
204:    SUB  3,2,3 	index off of the base
205:     LD  3,0(3) 	load the value
206:     ST  3,-5(1) 	Save parameter
207:    LDA  1,-3(1) 	Load address of new frame
208:    LDA  3,1(7) 	Put return address in ac
209:    LDA  7,-199(7) 	Call output
210:    LDA  3,0(2) 	Save the result in current accumulator
* 
211:     LD  3,-2(1) 	load variable i
* Left side will remain in register
212:    LDC  4,1(0) 	load constant
213:    ADD  3,3,4 	op +
214:     ST  3,-2(1) 	store variable i
* END
215:    LDA  7,-25(7) 	go to beginning of loop
200:    JLT  3,15(7) 	break out of loop if false
* END WHILE
* END
* This function requires a catch all return
216:    LDC  2,0(0) 	Set return value to 0
217:     LD  3,-1(1) 	Load return address
218:     LD  1,0(1) 	Adjust fp
219:    LDA  7,0(3) 	Return
* End Function main
