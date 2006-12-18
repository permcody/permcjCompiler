* C- compiler version 1.0
* Author: Robert B. Heckendorn
* Apr 13, 2004
* BEGIN Prolog
  0:     LD  0,0(0) 	set the global pointer 
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
* BEGIN function main
  4:    LDA  7,25(7) 	Jump to main 
 30:     ST  3,-1(1) 	Store return address to caller 
* BEGIN
* 
 31:     ST  1,-4(1) 	Store old fp in ghost frame 
 32:    LDC  3,777(6) 	Load constant 
 33:     ST  3,-6(1) 	Store parameter 
 34:    LDA  1,-4(1) 	Load address of new frame 
 35:    LDA  3,1(7) 	Return address in ac 
 36:    LDA  7,-26(7) 	call output
 37:    LDA  3,0(2) 	Save the result in ac 
* 
 38:     ST  1,-4(1) 	Store old fp in ghost frame 
 39:    LDC  3,0(6) 	Load constant 
 40:     ST  3,-6(1) 	Store parameter 
 41:    LDA  1,-4(1) 	Load address of new frame 
 42:    LDA  3,1(7) 	Return address in ac 
 43:    LDA  7,-21(7) 	call outputb
 44:    LDA  3,0(2) 	Save the result in ac 
* 
 45:    LDC  3,666(6) 	Load constant 
 46:     ST  3,-2(1) 	Store variable x
* 
 47:     ST  1,-4(1) 	Store old fp in ghost frame 
 48:     LD  3,-2(1) 	Load variable x
 49:     ST  3,-6(1) 	Store parameter 
 50:    LDA  1,-4(1) 	Load address of new frame 
 51:    LDA  3,1(7) 	Return address in ac 
 52:    LDA  7,-42(7) 	call output
 53:    LDA  3,0(2) 	Save the result in ac 
* 
 54:     ST  1,-4(1) 	Store old fp in ghost frame 
 55:     LD  3,-2(1) 	Load variable x
 56:    LDC  4,0(6) 	Load 0 
 57:    SUB  3,4,3 	op - 
 58:     ST  3,-6(1) 	Store parameter 
 59:    LDA  1,-4(1) 	Load address of new frame 
 60:    LDA  3,1(7) 	Return address in ac 
 61:    LDA  7,-51(7) 	call output
 62:    LDA  3,0(2) 	Save the result in ac 
* 
 63:     ST  1,-4(1) 	Store old fp in ghost frame 
 64:    LDC  3,1(6) 	Load constant 
 65:    LDC  4,0(6) 	Load 0 
 66:    SUB  3,4,3 	op - 
 67:     ST  3,-6(1) 	Save left side 
 68:     LD  3,-2(1) 	Load variable x
 69:     LD  4,-6(1) 	Load left into ac1 
 70:    MUL  3,4,3 	op * 
 71:     ST  3,-6(1) 	Store parameter 
 72:    LDA  1,-4(1) 	Load address of new frame 
 73:    LDA  3,1(7) 	Return address in ac 
 74:    LDA  7,-64(7) 	call output
 75:    LDA  3,0(2) 	Save the result in ac 
* 
 76:     ST  1,-4(1) 	Store old fp in ghost frame 
 77:    LDC  3,111(6) 	Load constant 
 78:     ST  3,-6(1) 	Save left side 
 79:    LDC  3,222(6) 	Load constant 
 80:     LD  4,-6(1) 	Load left into ac1 
 81:    ADD  3,4,3 	op + 
 82:     ST  3,-6(1) 	Save left side 
 83:    LDC  3,333(6) 	Load constant 
 84:     LD  4,-6(1) 	Load left into ac1 
 85:    ADD  3,4,3 	op + 
 86:     ST  3,-6(1) 	Store parameter 
 87:    LDA  1,-4(1) 	Load address of new frame 
 88:    LDA  3,1(7) 	Return address in ac 
 89:    LDA  7,-79(7) 	call output
 90:    LDA  3,0(2) 	Save the result in ac 
* 
 91:     ST  1,-4(1) 	Store old fp in ghost frame 
 92:    LDC  3,3(6) 	Load constant 
 93:     ST  3,-6(1) 	Save left side 
 94:    LDC  3,6(6) 	Load constant 
 95:     LD  4,-6(1) 	Load left into ac1 
 96:    MUL  3,4,3 	op * 
 97:     ST  3,-6(1) 	Save left side 
 98:    LDC  3,6(6) 	Load constant 
 99:     ST  3,-7(1) 	Save left side 
100:    LDC  3,6(6) 	Load constant 
101:     LD  4,-7(1) 	Load left into ac1 
102:    MUL  3,4,3 	op * 
103:     ST  3,-7(1) 	Save left side 
104:    LDC  3,1(6) 	Load constant 
105:     LD  4,-7(1) 	Load left into ac1 
106:    ADD  3,4,3 	op + 
107:     LD  4,-6(1) 	Load left into ac1 
108:    MUL  3,4,3 	op * 
109:     ST  3,-6(1) 	Store parameter 
110:    LDA  1,-4(1) 	Load address of new frame 
111:    LDA  3,1(7) 	Return address in ac 
112:    LDA  7,-102(7) 	call output
113:    LDA  3,0(2) 	Save the result in ac 
* 
114:     ST  1,-4(1) 	Store old fp in ghost frame 
115:    LDA  1,-4(1) 	Load address of new frame 
116:    LDA  3,1(7) 	Return address in ac 
117:    LDA  7,-112(7) 	call input
118:    LDA  3,0(2) 	Save the result in ac 
119:     ST  3,-2(1) 	Store variable x
* 
120:     ST  1,-4(1) 	Store old fp in ghost frame 
121:     LD  3,-2(1) 	Load variable x
122:     ST  3,-6(1) 	Store parameter 
123:    LDA  1,-4(1) 	Load address of new frame 
124:    LDA  3,1(7) 	Return address in ac 
125:    LDA  7,-115(7) 	call output
126:    LDA  3,0(2) 	Save the result in ac 
* 
127:     ST  1,-4(1) 	Store old fp in ghost frame 
128:    LDA  1,-4(1) 	Load address of new frame 
129:    LDA  3,1(7) 	Return address in ac 
130:    LDA  7,-113(7) 	call inputb
131:    LDA  3,0(2) 	Save the result in ac 
132:     ST  3,-3(1) 	Store variable b
* 
133:     ST  1,-4(1) 	Store old fp in ghost frame 
134:     LD  3,-3(1) 	Load variable b
135:     ST  3,-6(1) 	Store parameter 
136:    LDA  1,-4(1) 	Load address of new frame 
137:    LDA  3,1(7) 	Return address in ac 
138:    LDA  7,-116(7) 	call outputb
139:    LDA  3,0(2) 	Save the result in ac 
* END
* Add standard closing in case there is no return statement
140:    LDC  2,0(6) 	Set return value to 0 
141:     LD  3,-1(1) 	Load return address 
142:     LD  1,0(1) 	Adjust fp 
143:    LDA  7,0(3) 	Return 
* END of function main
