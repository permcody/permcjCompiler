* C- compiler version 1.0
* Author: Cody Permann
* May 13, 2004
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
* Function sqrt returns int
 30:     ST  3,-1(1) 	store return address
* BEGIN
* IF
 31:     LD  3,-2(1) 	load variable x
* Left side will remain in register
 32:    LDC  4,1(0) 	load constant
 33:    SUB  3,3,4 	prepare for comparison op
 34:    JEQ  3,2(7) 	op ==
 35:    LDC  3,0(0) 	load false into ac
 36:    LDA  7,1(7) 	jump past true case
 37:    LDC  3,1(0) 	load true into ac
 38:    LDC  2,1(0) 	load constant 1
 39:    SUB  3,3,2 	if condition check
* THEN
* RETURN
 41:    LDC  3,1(0) 	load constant
 42:    LDA  2,0(3) 	copy result to rt register
 43:     LD  3,-1(1) 	load return address
 44:     LD  1,0(1) 	adjust fp
 45:    LDA  7,0(3) 	Return
 40:    JLT  3,5(7) 	jump past then if false
* END IF
* 
 46:     LD  3,-2(1) 	load variable x
* Left side will remain in register
 47:    LDC  4,2(0) 	load constant
 48:    DIV  3,3,4 	op /
 49:     ST  3,-3(1) 	store variable guess
* 
 50:     LD  3,-2(1) 	load variable x
* Left side will remain in register
 51:     LD  4,-3(1) 	load variable guess
 52:    DIV  3,3,4 	op /
* Left side will remain in register
 53:     LD  4,-3(1) 	load variable guess
 54:    ADD  3,3,4 	op +
* Left side will remain in register
 55:    LDC  4,2(0) 	load constant
 56:    DIV  3,3,4 	op /
 57:     ST  3,-4(1) 	store variable newguess
* 
* WHILE
 58:     LD  3,-3(1) 	load variable guess
* Left side will remain in register
 59:     LD  4,-4(1) 	load variable newguess
 60:    SUB  3,3,4 	op -
* Left side will remain in register
 61:    LDC  4,1(0) 	load constant
 62:    SUB  3,3,4 	prepare for comparison op
 63:    JGT  3,2(7) 	op >
 64:    LDC  3,0(0) 	load false into ac
 65:    LDA  7,1(7) 	jump past true case
 66:    LDC  3,1(0) 	load true into ac
 67:    LDC  2,1(0) 	load constant 1
 68:    SUB  3,3,2 	while condition check
* WHILE BODY
* BEGIN
 70:     LD  3,-4(1) 	load variable newguess
 71:     ST  3,-3(1) 	store variable guess
* 
 72:     LD  3,-2(1) 	load variable x
* Left side will remain in register
 73:     LD  4,-3(1) 	load variable guess
 74:    DIV  3,3,4 	op /
* Left side will remain in register
 75:     LD  4,-3(1) 	load variable guess
 76:    ADD  3,3,4 	op +
* Left side will remain in register
 77:    LDC  4,2(0) 	load constant
 78:    DIV  3,3,4 	op /
 79:     ST  3,-4(1) 	store variable newguess
* END
 80:    LDA  7,-23(7) 	go to beginning of loop
 69:    JLT  3,11(7) 	break out of loop if false
* END WHILE
* 
* IF
 81:     LD  3,-4(1) 	load variable newguess
* Left side will remain in register
 82:     LD  4,-4(1) 	load variable newguess
 83:    MUL  3,3,4 	op *
* Left side will remain in register
 84:     LD  4,-2(1) 	load variable x
 85:    SUB  3,3,4 	prepare for comparison op
 86:    JGT  3,2(7) 	op >
 87:    LDC  3,0(0) 	load false into ac
 88:    LDA  7,1(7) 	jump past true case
 89:    LDC  3,1(0) 	load true into ac
 90:    LDC  2,1(0) 	load constant 1
 91:    SUB  3,3,2 	if condition check
* THEN
 93:     LD  3,-4(1) 	load variable newguess
* Left side will remain in register
 94:    LDC  4,1(0) 	load constant
 95:    SUB  3,3,4 	op -
 96:     ST  3,-4(1) 	store variable newguess
 92:    JLT  3,4(7) 	jump past then if false
* END IF
* 
* RETURN
 97:     LD  3,-4(1) 	load variable newguess
 98:    LDA  2,0(3) 	copy result to rt register
 99:     LD  3,-1(1) 	load return address
100:     LD  1,0(1) 	adjust fp
101:    LDA  7,0(3) 	Return
* END
* This function returns from all paths, no catch all return required
* End Function sqrt
  4:    LDA  7,97(7) 	jump to main
* Function main returns int
102:     ST  3,-1(1) 	store return address
* BEGIN
* WHILE
103:     ST  1,-5(1) 	Store old fp in ghost frame
104:    LDA  1,-5(1) 	Load address of new frame
105:    LDA  3,1(7) 	Put return address in ac
106:    LDA  7,-101(7) 	Call input
107:    LDA  3,0(2) 	Save the result in current accumulator
108:     ST  3,-2(1) 	store variable n
* Left side will remain in register
109:    LDC  4,1(0) 	load constant
110:    SUB  3,3,4 	prepare for comparison op
111:    JGT  3,2(7) 	op >
112:    LDC  3,0(0) 	load false into ac
113:    LDA  7,1(7) 	jump past true case
114:    LDC  3,1(0) 	load true into ac
115:    LDC  2,1(0) 	load constant 1
116:    SUB  3,3,2 	while condition check
* WHILE BODY
* BEGIN
118:     ST  1,-5(1) 	Store old fp in ghost frame
119:     LD  3,-2(1) 	load variable n
120:     ST  3,-7(1) 	Save parameter
121:    LDA  1,-5(1) 	Load address of new frame
122:    LDA  3,1(7) 	Put return address in ac
123:    LDA  7,-94(7) 	Call sqrt
124:    LDA  3,0(2) 	Save the result in current accumulator
125:     ST  3,-4(1) 	store variable limit
* 
* WHILE
126:     LD  3,-2(1) 	load variable n
* Left side will remain in register
127:    LDC  4,2(0) 	load constant
128:    DIV  2,3,4 	begin op %
129:    MUL  4,2,4 	
130:    SUB  3,3,4 	end op %
* Left side will remain in register
131:    LDC  4,0(0) 	load constant
132:    SUB  3,3,4 	prepare for comparison op
133:    JEQ  3,2(7) 	op ==
134:    LDC  3,0(0) 	load false into ac
135:    LDA  7,1(7) 	jump past true case
136:    LDC  3,1(0) 	load true into ac
137:    LDC  2,1(0) 	load constant 1
138:    SUB  3,3,2 	while condition check
* WHILE BODY
* BEGIN
140:     ST  1,-5(1) 	Store old fp in ghost frame
141:    LDC  3,2(0) 	load constant
142:     ST  3,-7(1) 	Save parameter
143:    LDA  1,-5(1) 	Load address of new frame
144:    LDA  3,1(7) 	Put return address in ac
145:    LDA  7,-135(7) 	Call output
146:    LDA  3,0(2) 	Save the result in current accumulator
* 
147:     LD  3,-2(1) 	load variable n
* Left side will remain in register
148:    LDC  4,2(0) 	load constant
149:    DIV  3,3,4 	op /
150:     ST  3,-2(1) 	store variable n
* END
151:    LDA  7,-26(7) 	go to beginning of loop
139:    JLT  3,12(7) 	break out of loop if false
* END WHILE
* 
152:    LDC  3,3(0) 	load constant
153:     ST  3,-3(1) 	store variable i
* 
* WHILE
154:     LD  3,-3(1) 	load variable i
* Left side will remain in register
155:     LD  4,-4(1) 	load variable limit
156:    SUB  3,3,4 	prepare for comparison op
157:    JLE  3,2(7) 	op <=
158:    LDC  3,0(0) 	load false into ac
159:    LDA  7,1(7) 	jump past true case
160:    LDC  3,1(0) 	load true into ac
161:    LDC  2,1(0) 	load constant 1
162:    SUB  3,3,2 	while condition check
* WHILE BODY
* BEGIN
* WHILE
164:     LD  3,-2(1) 	load variable n
* Left side will remain in register
165:     LD  4,-3(1) 	load variable i
166:    DIV  2,3,4 	begin op %
167:    MUL  4,2,4 	
168:    SUB  3,3,4 	end op %
* Left side will remain in register
169:    LDC  4,0(0) 	load constant
170:    SUB  3,3,4 	prepare for comparison op
171:    JEQ  3,2(7) 	op ==
172:    LDC  3,0(0) 	load false into ac
173:    LDA  7,1(7) 	jump past true case
174:    LDC  3,1(0) 	load true into ac
175:    LDC  2,1(0) 	load constant 1
176:    SUB  3,3,2 	while condition check
* WHILE BODY
* BEGIN
178:     ST  1,-5(1) 	Store old fp in ghost frame
179:     LD  3,-3(1) 	load variable i
180:     ST  3,-7(1) 	Save parameter
181:    LDA  1,-5(1) 	Load address of new frame
182:    LDA  3,1(7) 	Put return address in ac
183:    LDA  7,-173(7) 	Call output
184:    LDA  3,0(2) 	Save the result in current accumulator
* 
185:     LD  3,-2(1) 	load variable n
* Left side will remain in register
186:     LD  4,-3(1) 	load variable i
187:    DIV  3,3,4 	op /
188:     ST  3,-2(1) 	store variable n
* 
189:     ST  1,-5(1) 	Store old fp in ghost frame
190:     LD  3,-2(1) 	load variable n
191:     ST  3,-7(1) 	Save parameter
192:    LDA  1,-5(1) 	Load address of new frame
193:    LDA  3,1(7) 	Put return address in ac
194:    LDA  7,-165(7) 	Call sqrt
195:    LDA  3,0(2) 	Save the result in current accumulator
196:     ST  3,-4(1) 	store variable limit
* END
197:    LDA  7,-34(7) 	go to beginning of loop
177:    JLT  3,20(7) 	break out of loop if false
* END WHILE
* 
198:     LD  3,-3(1) 	load variable i
* Left side will remain in register
199:    LDC  4,2(0) 	load constant
200:    ADD  3,3,4 	op +
201:     ST  3,-3(1) 	store variable i
* END
202:    LDA  7,-49(7) 	go to beginning of loop
163:    JLT  3,39(7) 	break out of loop if false
* END WHILE
* 
* IF
203:     LD  3,-2(1) 	load variable n
* Left side will remain in register
204:    LDC  4,1(0) 	load constant
205:    SUB  3,3,4 	prepare for comparison op
206:    JGT  3,2(7) 	op >
207:    LDC  3,0(0) 	load false into ac
208:    LDA  7,1(7) 	jump past true case
209:    LDC  3,1(0) 	load true into ac
210:    LDC  2,1(0) 	load constant 1
211:    SUB  3,3,2 	if condition check
* THEN
213:     ST  1,-5(1) 	Store old fp in ghost frame
214:     LD  3,-2(1) 	load variable n
215:     ST  3,-7(1) 	Save parameter
216:    LDA  1,-5(1) 	Load address of new frame
217:    LDA  3,1(7) 	Put return address in ac
218:    LDA  7,-208(7) 	Call output
219:    LDA  3,0(2) 	Save the result in current accumulator
212:    JLT  3,7(7) 	jump past then if false
* END IF
* END
220:    LDA  7,-118(7) 	go to beginning of loop
117:    JLT  3,103(7) 	break out of loop if false
* END WHILE
* END
* This function requires a catch all return
221:    LDC  2,0(0) 	Set return value to 0
222:     LD  3,-1(1) 	Load return address
223:     LD  1,0(1) 	Adjust fp
224:    LDA  7,0(3) 	Return
* End Function main
