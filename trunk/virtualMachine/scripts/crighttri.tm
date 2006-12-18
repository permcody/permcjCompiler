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
 31:    LDC  3,1(0) 	load constant
 32:     ST  3,-2(1) 	store variable a
* 
 33:    LDC  3,1(0) 	load constant
 34:     ST  3,-4(1) 	store variable aa
* 
 35:    LDC  3,0(0) 	load constant
 36:     ST  3,-6(1) 	store variable c
* 
* WHILE
 37:     LD  3,-6(1) 	load variable c
* Left side will remain in register
 38:    LDC  4,50(0) 	load constant
 39:    SUB  3,3,4 	prepare for comparison op
 40:    JLT  3,2(7) 	op <
 41:    LDC  3,0(0) 	load false into ac
 42:    LDA  7,1(7) 	jump past true case
 43:    LDC  3,1(0) 	load true into ac
 44:    LDC  2,1(0) 	load constant 1
 45:    SUB  3,3,2 	while condition check
* WHILE BODY
* BEGIN
 47:    LDC  3,1(0) 	load constant
 48:     ST  3,-7(1) 	store variable cc
 49:     ST  3,-6(1) 	store variable c
* 
 50:    LDC  3,1(0) 	load constant
 51:     ST  3,-3(1) 	store variable b
* 
 52:    LDC  3,1(0) 	load constant
 53:     ST  3,-5(1) 	store variable bb
* 
* WHILE
 54:     LD  3,-3(1) 	load variable b
* Left side will remain in register
 55:     LD  4,-2(1) 	load variable a
 56:    SUB  3,3,4 	prepare for comparison op
 57:    JLE  3,2(7) 	op <=
 58:    LDC  3,0(0) 	load false into ac
 59:    LDA  7,1(7) 	jump past true case
 60:    LDC  3,1(0) 	load true into ac
 61:    LDC  2,1(0) 	load constant 1
 62:    SUB  3,3,2 	while condition check
* WHILE BODY
* BEGIN
* IF
 64:     LD  3,-4(1) 	load variable aa
* Left side will remain in register
 65:     LD  4,-5(1) 	load variable bb
 66:    ADD  3,3,4 	op +
* Left side will remain in register
 67:    LDC  4,2(0) 	load constant
 68:    DIV  3,3,4 	op /
* Left side will remain in register
 69:    LDC  4,2(0) 	load constant
 70:    DIV  2,3,4 	begin op %
 71:    MUL  3,2,3 	
 72:    SUB  3,4,3 	end op %
* Left side will remain in register
 73:    LDC  4,0(0) 	load constant
 74:    SUB  3,3,4 	prepare for comparison op
 75:    JEQ  3,2(7) 	op ==
 76:    LDC  3,0(0) 	load false into ac
 77:    LDA  7,1(7) 	jump past true case
 78:    LDC  3,1(0) 	load true into ac
 79:    LDC  2,1(0) 	load constant 1
 80:    SUB  3,3,2 	if condition check
* THEN
* BEGIN
* WHILE
 82:     LD  3,-7(1) 	load variable cc
* Left side will remain in register
 83:     LD  4,-4(1) 	load variable aa
* Left side will remain in register
 84:     LD  5,-5(1) 	load variable bb
 85:    ADD  4,4,5 	op +
 86:    SUB  3,3,4 	prepare for comparison op
 87:    JLT  3,2(7) 	op <
 88:    LDC  3,0(0) 	load false into ac
 89:    LDA  7,1(7) 	jump past true case
 90:    LDC  3,1(0) 	load true into ac
 91:    LDC  2,1(0) 	load constant 1
 92:    SUB  3,3,2 	while condition check
* WHILE BODY
* BEGIN
 94:     LD  3,-6(1) 	load variable c
* Left side will remain in register
 95:    LDC  4,1(0) 	load constant
 96:    ADD  3,3,4 	op +
 97:     ST  3,-6(1) 	store variable c
* 
 98:     LD  3,-7(1) 	load variable cc
* Left side will remain in register
 99:    LDC  4,2(0) 	load constant
* Left side will remain in register
100:     LD  5,-6(1) 	load variable c
101:    MUL  4,4,5 	op *
102:    ADD  3,3,4 	op +
* Left side will remain in register
103:    LDC  4,1(0) 	load constant
104:    SUB  3,3,4 	op -
105:     ST  3,-7(1) 	store variable cc
* END
106:    LDA  7,-25(7) 	go to beginning of loop
 93:    JLT  3,13(7) 	break out of loop if false
* END WHILE
* 
* IF
107:     LD  3,-4(1) 	load variable aa
* Left side will remain in register
108:     LD  4,-5(1) 	load variable bb
109:    ADD  3,3,4 	op +
* Left side will remain in register
110:     LD  4,-7(1) 	load variable cc
111:    SUB  3,3,4 	prepare for comparison op
112:    JEQ  3,2(7) 	op ==
113:    LDC  3,0(0) 	load false into ac
114:    LDA  7,1(7) 	jump past true case
115:    LDC  3,1(0) 	load true into ac
116:    LDC  2,1(0) 	load constant 1
117:    SUB  3,3,2 	if condition check
* THEN
* BEGIN
119:     ST  1,-8(1) 	Store old fp in ghost frame
120:     LD  3,-2(1) 	load variable a
121:     ST  3,-10(1) 	Save parameter
122:    LDA  1,-8(1) 	Load address of new frame
123:    LDA  3,1(7) 	Put return address in current accumulator
124:    LDA  7,-114(7) 	Call output
125:    LDA  3,0(2) 	Save the result in ac
* 
126:     ST  1,-8(1) 	Store old fp in ghost frame
127:     LD  3,-3(1) 	load variable b
128:     ST  3,-10(1) 	Save parameter
129:    LDA  1,-8(1) 	Load address of new frame
130:    LDA  3,1(7) 	Put return address in current accumulator
131:    LDA  7,-121(7) 	Call output
132:    LDA  3,0(2) 	Save the result in ac
* 
133:     ST  1,-8(1) 	Store old fp in ghost frame
134:     LD  3,-6(1) 	load variable c
135:     ST  3,-10(1) 	Save parameter
136:    LDA  1,-8(1) 	Load address of new frame
137:    LDA  3,1(7) 	Put return address in current accumulator
138:    LDA  7,-128(7) 	Call output
139:    LDA  3,0(2) 	Save the result in ac
* 
140:     ST  1,-8(1) 	Store old fp in ghost frame
141:    LDC  3,1010101010(0) 	load constant
142:     ST  3,-10(1) 	Save parameter
143:    LDA  1,-8(1) 	Load address of new frame
144:    LDA  3,1(7) 	Put return address in current accumulator
145:    LDA  7,-135(7) 	Call output
146:    LDA  3,0(2) 	Save the result in ac
* END
118:    JLT  3,28(7) 	jump past then if false
* END IF
* END
 81:    JLT  3,65(7) 	jump past then if false
* END IF
* 
147:     LD  3,-3(1) 	load variable b
* Left side will remain in register
148:    LDC  4,1(0) 	load constant
149:    ADD  3,3,4 	op +
150:     ST  3,-3(1) 	store variable b
* 
151:     LD  3,-5(1) 	load variable bb
* Left side will remain in register
152:    LDC  4,2(0) 	load constant
* Left side will remain in register
153:     LD  5,-3(1) 	load variable b
154:    MUL  4,4,5 	op *
155:    ADD  3,3,4 	op +
* Left side will remain in register
156:    LDC  4,1(0) 	load constant
157:    SUB  3,3,4 	op -
158:     ST  3,-5(1) 	store variable bb
* END
159:    LDA  7,-106(7) 	go to beginning of loop
 63:    JLT  3,96(7) 	break out of loop if false
* END WHILE
* 
160:     LD  3,-2(1) 	load variable a
* Left side will remain in register
161:    LDC  4,1(0) 	load constant
162:    ADD  3,3,4 	op +
163:     ST  3,-2(1) 	store variable a
* 
164:     LD  3,-4(1) 	load variable aa
* Left side will remain in register
165:    LDC  4,2(0) 	load constant
* Left side will remain in register
166:     LD  5,-2(1) 	load variable a
167:    MUL  4,4,5 	op *
168:    ADD  3,3,4 	op +
* Left side will remain in register
169:    LDC  4,1(0) 	load constant
170:    SUB  3,3,4 	op -
171:     ST  3,-4(1) 	store variable aa
* END
172:    LDA  7,-136(7) 	go to beginning of loop
 46:    JLT  3,126(7) 	break out of loop if false
* END WHILE
* END
* Add standard closing in case there is no return statement
173:    LDC  2,0(0) 	Set return value to 0
174:     LD  3,-1(1) 	Load return address
175:     LD  1,0(1) 	Adjust fp
176:    LDA  7,0(3) 	Return
* End Function main
