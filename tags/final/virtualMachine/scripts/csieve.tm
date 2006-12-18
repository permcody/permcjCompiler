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
* Function main returns int
* BEGIN
 31:     ST  1,-505(1) 	Store old fp in ghost frame
 32:    LDA  1,-505(1) 	Load address of new frame
 33:    LDA  3,1(7) 	Put return address in current accumulator
 34:    LDA  7,-29(7) 	Call input
 35:    LDA  3,0(2) 	Save the result in ac
 36:     ST  3,-2(1) 	store variable max
* 
 37:    LDC  3,2(0) 	load constant
 38:     ST  3,-503(1) 	store variable k
* 
* WHILE
 39:     LD  3,-503(1) 	load variable k
* Left side will remain in register
 40:     LD  4,-2(1) 	load variable max
 41:    SUB  3,3,4 	prepare for comparison op
 42:    JLE  3,2(7) 	op <=
 43:    LDC  3,0(0) 	load false into ac
 44:    LDA  7,1(7) 	jump past true case
 45:    LDC  3,1(0) 	load true into ac
 46:    LDC  2,1(0) 	load constant 1
 47:    SUB  3,3,2 	while condition check
* WHILE BODY
* BEGIN
 49:    LDC  3,1(0) 	load constant
 50:     ST  3,-505(1) 	Store RHS of assignment
 51:     LD  3,-503(1) 	load variable k
 52:    LDA  2,-3(1) 	array base
 53:    SUB  3,2,3 	index off of the base
 54:     LD  2,-505(1) 	Load RHS value
 55:     ST  2,0(3) 	store indexed variable n
 56:    LDA  3,0(2) 	adjust current accumulator
* 
 57:     LD  3,-503(1) 	load variable k
* Left side will remain in register
 58:    LDC  4,1(0) 	load constant
 59:    ADD  3,3,4 	op +
 60:     ST  3,-503(1) 	store variable k
* END
 61:    LDA  7,-23(7) 	go to beginning of loop
 48:    JLT  3,13(7) 	break out of loop if false
* END WHILE
* 
 62:    LDC  3,2(0) 	load constant
 63:     ST  3,-503(1) 	store variable k
* 
* WHILE
 64:     LD  3,-503(1) 	load variable k
* Left side will remain in register
 65:     LD  4,-503(1) 	load variable k
 66:    MUL  3,3,4 	op *
* Left side will remain in register
 67:     LD  4,-2(1) 	load variable max
 68:    SUB  3,3,4 	prepare for comparison op
 69:    JLE  3,2(7) 	op <=
 70:    LDC  3,0(0) 	load false into ac
 71:    LDA  7,1(7) 	jump past true case
 72:    LDC  3,1(0) 	load true into ac
 73:    LDC  2,1(0) 	load constant 1
 74:    SUB  3,3,2 	while condition check
* WHILE BODY
* BEGIN
 76:     LD  3,-503(1) 	load variable k
* Left side will remain in register
 77:     LD  4,-503(1) 	load variable k
 78:    MUL  3,3,4 	op *
 79:     ST  3,-504(1) 	store variable j
* 
* WHILE
 80:     LD  3,-504(1) 	load variable j
* Left side will remain in register
 81:     LD  4,-2(1) 	load variable max
 82:    SUB  3,3,4 	prepare for comparison op
 83:    JLE  3,2(7) 	op <=
 84:    LDC  3,0(0) 	load false into ac
 85:    LDA  7,1(7) 	jump past true case
 86:    LDC  3,1(0) 	load true into ac
 87:    LDC  2,1(0) 	load constant 1
 88:    SUB  3,3,2 	while condition check
* WHILE BODY
* BEGIN
 90:    LDC  3,0(0) 	load constant
 91:     ST  3,-505(1) 	Store RHS of assignment
 92:     LD  3,-504(1) 	load variable j
 93:    LDA  2,-3(1) 	array base
 94:    SUB  3,2,3 	index off of the base
 95:     LD  2,-505(1) 	Load RHS value
 96:     ST  2,0(3) 	store indexed variable n
 97:    LDA  3,0(2) 	adjust current accumulator
* 
 98:     LD  3,-504(1) 	load variable j
* Left side will remain in register
 99:     LD  4,-503(1) 	load variable k
100:    ADD  3,3,4 	op +
101:     ST  3,-504(1) 	store variable j
* END
102:    LDA  7,-23(7) 	go to beginning of loop
 89:    JLT  3,13(7) 	break out of loop if false
* END WHILE
* 
103:     LD  3,-503(1) 	load variable k
* Left side will remain in register
104:    LDC  4,1(0) 	load constant
105:    ADD  3,3,4 	op +
106:     ST  3,-503(1) 	store variable k
* 
* WHILE
107:     LD  3,-503(1) 	load variable k
* Left side will remain in register
108:     LD  4,-2(1) 	load variable max
109:    SUB  3,3,4 	prepare for comparison op
110:    JLE  3,2(7) 	op <=
111:    LDC  3,0(0) 	load false into ac
112:    LDA  7,1(7) 	jump past true case
113:    LDC  3,1(0) 	load true into ac
* Left side will remain in register
114:     LD  4,-503(1) 	load variable k
115:    LDA  2,-3(1) 	Load address of base of array n
116:    SUB  4,2,4 	index off of the base
117:     LD  4,0(4) 	load the value
118:    JEQ  4,2(7) 	op !
119:    LDC  4,0(0) 	load false into ac
120:    LDA  7,1(7) 	jump past true case
121:    LDC  4,1(0) 	load true into ac
122:    ADD  3,3,4 	prepare for && op
123:    LDC  4,2(0) 	load constant for &&
124:    SUB  3,4,3 	compute value
125:    JEQ  3,2(7) 	op &&
126:    LDC  3,0(0) 	load false into ac
127:    LDA  7,1(7) 	jump past true case
128:    LDC  3,1(0) 	load true into ac
129:    LDC  2,1(0) 	load constant 1
130:    SUB  3,3,2 	while condition check
* WHILE BODY
132:     LD  3,-503(1) 	load variable k
* Left side will remain in register
133:    LDC  4,1(0) 	load constant
134:    ADD  3,3,4 	op +
135:     ST  3,-503(1) 	store variable k
136:    LDA  7,-30(7) 	go to beginning of loop
131:    JLT  3,5(7) 	break out of loop if false
* END WHILE
* END
137:    LDA  7,-74(7) 	go to beginning of loop
 75:    JLT  3,62(7) 	break out of loop if false
* END WHILE
* 
138:    LDC  3,2(0) 	load constant
139:     ST  3,-503(1) 	store variable k
* 
* WHILE
140:     LD  3,-503(1) 	load variable k
* Left side will remain in register
141:     LD  4,-2(1) 	load variable max
142:    SUB  3,3,4 	prepare for comparison op
143:    JLE  3,2(7) 	op <=
144:    LDC  3,0(0) 	load false into ac
145:    LDA  7,1(7) 	jump past true case
146:    LDC  3,1(0) 	load true into ac
147:    LDC  2,1(0) 	load constant 1
148:    SUB  3,3,2 	while condition check
* WHILE BODY
* BEGIN
* IF
150:     LD  3,-503(1) 	load variable k
151:    LDA  2,-3(1) 	Load address of base of array n
152:    SUB  3,2,3 	index off of the base
153:     LD  3,0(3) 	load the value
154:    LDC  2,1(0) 	load constant 1
155:    SUB  3,3,2 	if condition check
* THEN
157:     ST  1,-505(1) 	Store old fp in ghost frame
158:     LD  3,-503(1) 	load variable k
159:     ST  3,-507(1) 	Save parameter
160:    LDA  1,-505(1) 	Load address of new frame
161:    LDA  3,1(7) 	Put return address in current accumulator
162:    LDA  7,-152(7) 	Call output
163:    LDA  3,0(2) 	Save the result in ac
156:    JLT  3,7(7) 	jump past then if false
* END IF
* 
164:     LD  3,-503(1) 	load variable k
* Left side will remain in register
165:    LDC  4,1(0) 	load constant
166:    ADD  3,3,4 	op +
167:     ST  3,-503(1) 	store variable k
* END
168:    LDA  7,-29(7) 	go to beginning of loop
149:    JLT  3,19(7) 	break out of loop if false
* END WHILE
* 
* RETURN
169:    LDC  3,0(0) 	load constant
170:    LDA  2,0(3) 	copy result to rt register
171:     LD  3,-1(1) 	load return address
172:     LD  1,0(1) 	adjust fp
173:    LDA  7,0(3) 	Return
* END
* Add standard closing in case there is no return statement
174:    LDC  2,0(0) 	Set return value to 0
175:     LD  3,-1(1) 	Load return address
176:     LD  1,0(1) 	Adjust fp
177:    LDA  7,0(3) 	Return
* End Function main
