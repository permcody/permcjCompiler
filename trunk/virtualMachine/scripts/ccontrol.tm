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
  4:    LDA  7,25(7) 	jump to main
* Function main returns void
* BEGIN
 31:    LDC  3,2(6) 	load constant
 32:     ST  3,-2(1) 	store variable x
* 
 33:    LDC  3,3(6) 	load constant
 34:     ST  3,-3(1) 	store variable y
* 
* IF
 35:     LD  3,-2(1) 	load variable x
 36:     ST  3,-4(1) 	save left side
 37:     LD  3,-3(1) 	load variable y
 38:     LD  4,-4(1) 	load left into ac1
 39:    SUB  3,4,3 	prepare for comparison op
 40:    JNE  3,2(7) 	op !=
 41:    LDC  3,0(6) 	load false into ac
 42:    LDA  7,1(7) 	jump past true case
 43:    LDC  3,1(6) 	load true into ac
 44:    LDC  4,1(6) 	load constant 1
 45:    SUB  3,3,4 	if condition check
* THEN
 46:    JLT  3,0(7) 	jump past then if false
* END IF
* 
* IF
 47:     LD  3,-2(1) 	load variable x
 48:     ST  3,-4(1) 	save left side
 49:     LD  3,-3(1) 	load variable y
 50:     LD  4,-4(1) 	load left into ac1
 51:    SUB  3,4,3 	prepare for comparison op
 52:    JLT  3,2(7) 	op <
 53:    LDC  3,0(6) 	load false into ac
 54:    LDA  7,1(7) 	jump past true case
 55:    LDC  3,1(6) 	load true into ac
 56:    LDC  4,1(6) 	load constant 1
 57:    SUB  3,3,4 	if condition check
* THEN
 59:     ST  1,-4(1) 	Store old fp in ghost frame
 60:    LDC  3,11(6) 	load constant
 61:     ST  3,-6(1) 	Save parameter
 62:    LDA  1,-4(1) 	Load address of new frame
 63:    LDA  3,1(7) 	Put return address in ac
 64:    LDA  7,-54(7) 	Call output
 65:    LDA  3,0(2) 	Save the result in ac
 58:    JLT  3,7(7) 	jump past then if false
* END IF
* 
* IF
 66:     LD  3,-2(1) 	load variable x
 67:     ST  3,-5(1) 	save left side
 68:     LD  3,-3(1) 	load variable y
 69:     LD  4,-5(1) 	load left into ac1
 70:    SUB  3,4,3 	prepare for comparison op
 71:    JEQ  3,2(7) 	op ==
 72:    LDC  3,0(6) 	load false into ac
 73:    LDA  7,1(7) 	jump past true case
 74:    LDC  3,1(6) 	load true into ac
 75:    LDC  4,1(6) 	load constant 1
 76:    SUB  3,3,4 	if condition check
* THEN
 78:     ST  1,-5(1) 	Store old fp in ghost frame
 79:    LDC  3,22(6) 	load constant
 80:     ST  3,-7(1) 	Save parameter
 81:    LDA  1,-5(1) 	Load address of new frame
 82:    LDA  3,1(7) 	Put return address in ac
 83:    LDA  7,-73(7) 	Call output
 84:    LDA  3,0(2) 	Save the result in ac
 77:    JLT  3,8(7) 	jump to else if false
 86:     ST  1,-6(1) 	Store old fp in ghost frame
 87:    LDC  3,33(6) 	load constant
 88:     ST  3,-8(1) 	Save parameter
 89:    LDA  1,-6(1) 	Load address of new frame
 90:    LDA  3,1(7) 	Put return address in ac
 91:    LDA  7,-81(7) 	Call output
 92:    LDA  3,0(2) 	Save the result in ac
 85:    LDA  7,7(7) 	jump past else part
* END IF
* 
* IF
 93:     LD  3,-2(1) 	load variable x
 94:     ST  3,-7(1) 	save left side
 95:     LD  3,-3(1) 	load variable y
 96:     LD  4,-7(1) 	load left into ac1
 97:    SUB  3,4,3 	prepare for comparison op
 98:    JNE  3,2(7) 	op !=
 99:    LDC  3,0(6) 	load false into ac
100:    LDA  7,1(7) 	jump past true case
101:    LDC  3,1(6) 	load true into ac
102:    LDC  4,1(6) 	load constant 1
103:    SUB  3,3,4 	if condition check
* THEN
* IF
105:    LDC  3,1(6) 	load constant
106:    LDC  4,1(6) 	load constant 1
107:    SUB  3,3,4 	if condition check
* THEN
109:     ST  1,-7(1) 	Store old fp in ghost frame
110:    LDC  3,22(6) 	load constant
111:     ST  3,-9(1) 	Save parameter
112:    LDA  1,-7(1) 	Load address of new frame
113:    LDA  3,1(7) 	Put return address in ac
114:    LDA  7,-104(7) 	Call output
115:    LDA  3,0(2) 	Save the result in ac
108:    JLT  3,8(7) 	jump to else if false
117:     ST  1,-8(1) 	Store old fp in ghost frame
118:    LDC  3,33(6) 	load constant
119:     ST  3,-10(1) 	Save parameter
120:    LDA  1,-8(1) 	Load address of new frame
121:    LDA  3,1(7) 	Put return address in ac
122:    LDA  7,-112(7) 	Call output
123:    LDA  3,0(2) 	Save the result in ac
116:    LDA  7,7(7) 	jump past else part
* END IF
104:    JLT  3,19(7) 	jump past then if false
* END IF
* 
* IF
124:     LD  3,-2(1) 	load variable x
125:     ST  3,-9(1) 	save left side
126:     LD  3,-3(1) 	load variable y
127:     LD  4,-9(1) 	load left into ac1
128:    SUB  3,4,3 	prepare for comparison op
129:    JNE  3,2(7) 	op !=
130:    LDC  3,0(6) 	load false into ac
131:    LDA  7,1(7) 	jump past true case
132:    LDC  3,1(6) 	load true into ac
133:    LDC  4,1(6) 	load constant 1
134:    SUB  3,3,4 	if condition check
* THEN
* IF
136:    LDC  3,0(6) 	load constant
137:    LDC  4,1(6) 	load constant 1
138:    SUB  3,3,4 	if condition check
* THEN
140:     ST  1,-9(1) 	Store old fp in ghost frame
141:    LDC  3,22(6) 	load constant
142:     ST  3,-11(1) 	Save parameter
143:    LDA  1,-9(1) 	Load address of new frame
144:    LDA  3,1(7) 	Put return address in ac
145:    LDA  7,-135(7) 	Call output
146:    LDA  3,0(2) 	Save the result in ac
139:    JLT  3,8(7) 	jump to else if false
148:     ST  1,-10(1) 	Store old fp in ghost frame
149:    LDC  3,33(6) 	load constant
150:     ST  3,-12(1) 	Save parameter
151:    LDA  1,-10(1) 	Load address of new frame
152:    LDA  3,1(7) 	Put return address in ac
153:    LDA  7,-143(7) 	Call output
154:    LDA  3,0(2) 	Save the result in ac
147:    LDA  7,7(7) 	jump past else part
* END IF
135:    JLT  3,19(7) 	jump past then if false
* END IF
* 
* WHILE
155:     LD  3,-2(1) 	load variable x
156:     ST  3,-11(1) 	save left side
157:     LD  3,-3(1) 	load variable y
158:     LD  4,-11(1) 	load left into ac1
159:    SUB  3,4,3 	prepare for comparison op
160:    JGE  3,2(7) 	op >=
161:    LDC  3,0(6) 	load false into ac
162:    LDA  7,1(7) 	jump past true case
163:    LDC  3,1(6) 	load true into ac
164:    LDC  4,1(6) 	load constant 1
165:    SUB  3,3,4 	while condition check
* WHILE BODY
167:    LDA  7,-13(7) 	go to beginning of loop
166:    JLT  3,1(7) 	break out of loop if false
* END WHILE
* 
* WHILE
168:     LD  3,-2(1) 	load variable x
169:     ST  3,-11(1) 	save left side
170:     LD  3,-3(1) 	load variable y
171:     LD  4,-11(1) 	load left into ac1
172:    SUB  3,4,3 	prepare for comparison op
173:    JLT  3,2(7) 	op <
174:    LDC  3,0(6) 	load false into ac
175:    LDA  7,1(7) 	jump past true case
176:    LDC  3,1(6) 	load true into ac
177:    LDC  4,1(6) 	load constant 1
178:    SUB  3,3,4 	while condition check
* WHILE BODY
* BEGIN
180:     ST  1,-11(1) 	Store old fp in ghost frame
181:    LDC  3,44(6) 	load constant
182:     ST  3,-13(1) 	Save parameter
183:    LDA  1,-11(1) 	Load address of new frame
184:    LDA  3,1(7) 	Put return address in ac
185:    LDA  7,-175(7) 	Call output
186:    LDA  3,0(2) 	Save the result in ac
* 
187:    LDC  3,500(6) 	load constant
188:     ST  3,-2(1) 	store variable x
* END
189:    LDA  7,-22(7) 	go to beginning of loop
179:    JLT  3,10(7) 	break out of loop if false
* END WHILE
* 
* RETURN
190:    LDA  2,0(3) 	copy result to rt register
191:     LD  3,-1(1) 	load return address
192:     LD  1,0(1) 	adjust fp
193:    LDA  7,0(3) 	Return
* END
* Add standard closing in case there is no return statement
194:    LDC  2,0(6) 	Set return value to 0
195:     LD  3,-1(1) 	Load return address
196:     LD  1,0(1) 	Adjust fp
197:    LDA  7,0(3) 	Return
* End Function main
