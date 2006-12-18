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
* Function comb returns int
 30:     ST  3,-1(1) 	store return address
* BEGIN
* IF
 31:     LD  3,-2(1) 	load variable a
* Left side will remain in register
 32:     LD  4,-3(1) 	load variable b
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
* IF
 46:     LD  3,-3(1) 	load variable b
* Left side will remain in register
 47:    LDC  4,0(0) 	load constant
 48:    SUB  3,3,4 	prepare for comparison op
 49:    JEQ  3,2(7) 	op ==
 50:    LDC  3,0(0) 	load false into ac
 51:    LDA  7,1(7) 	jump past true case
 52:    LDC  3,1(0) 	load true into ac
 53:    LDC  2,1(0) 	load constant 1
 54:    SUB  3,3,2 	if condition check
* THEN
* RETURN
 56:    LDC  3,0(0) 	load constant
 57:    LDA  2,0(3) 	copy result to rt register
 58:     LD  3,-1(1) 	load return address
 59:     LD  1,0(1) 	adjust fp
 60:    LDA  7,0(3) 	Return
 55:    JLT  3,5(7) 	jump past then if false
* END IF
* 
* IF
 61:     LD  3,-3(1) 	load variable b
* Left side will remain in register
 62:    LDC  4,1(0) 	load constant
 63:    SUB  3,3,4 	prepare for comparison op
 64:    JEQ  3,2(7) 	op ==
 65:    LDC  3,0(0) 	load false into ac
 66:    LDA  7,1(7) 	jump past true case
 67:    LDC  3,1(0) 	load true into ac
 68:    LDC  2,1(0) 	load constant 1
 69:    SUB  3,3,2 	if condition check
* THEN
* RETURN
 71:     LD  3,-2(1) 	load variable a
 72:    LDA  2,0(3) 	copy result to rt register
 73:     LD  3,-1(1) 	load return address
 74:     LD  1,0(1) 	adjust fp
 75:    LDA  7,0(3) 	Return
 70:    JLT  3,5(7) 	jump past then if false
* END IF
* 
* RETURN
 76:     ST  1,-4(1) 	Store old fp in ghost frame
 77:     LD  3,-2(1) 	load variable a
* Left side will remain in register
 78:    LDC  4,1(0) 	load constant
 79:    SUB  3,3,4 	op -
 80:     ST  3,-6(1) 	Save parameter
 81:     LD  3,-3(1) 	load variable b
* Left side will remain in register
 82:    LDC  4,1(0) 	load constant
 83:    SUB  3,3,4 	op -
 84:     ST  3,-7(1) 	Save parameter
 85:    LDA  1,-4(1) 	Load address of new frame
 86:    LDA  3,1(7) 	Put return address in ac
 87:    LDA  7,-58(7) 	Call comb
 88:    LDA  3,0(2) 	Save the result in current accumulator
* Left side will remain in register
* Need to dump Registers before call
 89:     ST  3,-4(1) 	Save register to temporaries
 90:     ST  1,-5(1) 	Store old fp in ghost frame
 91:     LD  3,-2(1) 	load variable a
* Left side will remain in register
 92:    LDC  4,1(0) 	load constant
 93:    SUB  3,3,4 	op -
 94:     ST  3,-7(1) 	Save parameter
 95:     LD  3,-3(1) 	load variable b
 96:     ST  3,-8(1) 	Save parameter
 97:    LDA  1,-5(1) 	Load address of new frame
 98:    LDA  3,1(7) 	Put return address in ac
 99:    LDA  7,-70(7) 	Call comb
100:    LDA  4,0(2) 	Save the result in current accumulator
* Need to restore registers after call
101:     LD  3,-4(1) 	Load Register from Temporaries
102:    ADD  3,3,4 	op +
103:    LDA  2,0(3) 	copy result to rt register
104:     LD  3,-1(1) 	load return address
105:     LD  1,0(1) 	adjust fp
106:    LDA  7,0(3) 	Return
* END
* This function returns from all paths, no catch all return required
* End Function comb
  4:    LDA  7,102(7) 	jump to main
* Function main returns void
107:     ST  3,-1(1) 	store return address
* BEGIN
* WHILE
108:    LDC  3,1(0) 	load constant
109:    LDC  2,1(0) 	load constant 1
110:    SUB  3,3,2 	while condition check
* WHILE BODY
* BEGIN
112:     ST  1,-4(1) 	Store old fp in ghost frame
113:    LDA  1,-4(1) 	Load address of new frame
114:    LDA  3,1(7) 	Put return address in ac
115:    LDA  7,-110(7) 	Call input
116:    LDA  3,0(2) 	Save the result in current accumulator
117:     ST  3,-2(1) 	store variable a
* 
* IF
118:     LD  3,-2(1) 	load variable a
* Left side will remain in register
119:    LDC  4,0(0) 	load constant
120:    SUB  3,3,4 	prepare for comparison op
121:    JEQ  3,2(7) 	op ==
122:    LDC  3,0(0) 	load false into ac
123:    LDA  7,1(7) 	jump past true case
124:    LDC  3,1(0) 	load true into ac
125:    LDC  2,1(0) 	load constant 1
126:    SUB  3,3,2 	if condition check
* THEN
* RETURN
128:    LDA  2,0(3) 	copy result to rt register
129:     LD  3,-1(1) 	load return address
130:     LD  1,0(1) 	adjust fp
131:    LDA  7,0(3) 	Return
127:    JLT  3,4(7) 	jump past then if false
* END IF
* 
132:     ST  1,-4(1) 	Store old fp in ghost frame
133:    LDA  1,-4(1) 	Load address of new frame
134:    LDA  3,1(7) 	Put return address in ac
135:    LDA  7,-130(7) 	Call input
136:    LDA  3,0(2) 	Save the result in current accumulator
137:     ST  3,-3(1) 	store variable b
* 
138:     ST  1,-4(1) 	Store old fp in ghost frame
139:     ST  1,-6(1) 	Store old fp in ghost frame
140:     LD  3,-2(1) 	load variable a
141:     ST  3,-8(1) 	Save parameter
142:     LD  3,-3(1) 	load variable b
143:     ST  3,-9(1) 	Save parameter
144:    LDA  1,-6(1) 	Load address of new frame
145:    LDA  3,1(7) 	Put return address in ac
146:    LDA  7,-117(7) 	Call comb
147:    LDA  3,0(2) 	Save the result in current accumulator
148:     ST  3,-6(1) 	Save parameter
149:    LDA  1,-4(1) 	Load address of new frame
150:    LDA  3,1(7) 	Put return address in ac
151:    LDA  7,-141(7) 	Call output
152:    LDA  3,0(2) 	Save the result in current accumulator
* END
153:    LDA  7,-46(7) 	go to beginning of loop
111:    JLT  3,42(7) 	break out of loop if false
* END WHILE
* END
* This function requires a catch all return
154:    LDC  2,0(0) 	Set return value to 0
155:     LD  3,-1(1) 	Load return address
156:     LD  1,0(1) 	Adjust fp
157:    LDA  7,0(3) 	Return
* End Function main
