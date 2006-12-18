* C- compiler version C-06
* Author: Robert B. Heckendorn
* Backend coauthor: Jorge Williams
* Apr 1, 2006
* BEGIN Prolog
  0:     LD  0,0(0) 	Set the global pointer 
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
* BEGIN function outnl
 30:     ST  3,-1(1) 	Store return address 
 31:  OUTNL  3,3,3 	Output a newline 
 32:     LD  3,-1(1) 	Load return address 
 33:     LD  1,0(1) 	Adjust fp 
 34:    LDA  7,0(3) 	Return 
* END of function outnl
* BEGIN function main
  4:    LDA  7,30(7) 	Jump to main 
 35:     ST  3,-1(1) 	Store return address. BEGIN FUNC: main
* BEGIN compound statement
* 4
 36:     ST  1,-2(1) 	Store old fp in ghost frame 
 37:    LDC  3,0(6) 	Load constant 
 38:     ST  3,-4(1) 	Save left side in temp 
 39:    LDC  3,0(6) 	Load constant 
 40:     LD  4,-4(1) 	Load left from temp into ac1 
 41:    JEQ  3,3(7) 	Jump if false for Op && 
 42:    LDC  3,0(6) 	False case 
 43:    JEQ  4,1(7) 	Jump if false 
 44:    LDC  3,1(6) 	True case 
 45:     ST  3,-4(1) 	Store parameter 
 46:    LDA  1,-2(1) 	Load address of new frame 
 47:    LDA  3,1(7) 	Return address in ac 
 48:    LDA  7,-26(7) 	call outputb
 49:    LDA  3,0(2) 	Save the result in ac 
* 5
 50:     ST  1,-2(1) 	Store old fp in ghost frame 
 51:    LDC  3,0(6) 	Load constant 
 52:     ST  3,-4(1) 	Save left side in temp 
 53:    LDC  3,1(6) 	Load constant 
 54:     LD  4,-4(1) 	Load left from temp into ac1 
 55:    JEQ  3,3(7) 	Jump if false for Op && 
 56:    LDC  3,0(6) 	False case 
 57:    JEQ  4,1(7) 	Jump if false 
 58:    LDC  3,1(6) 	True case 
 59:     ST  3,-4(1) 	Store parameter 
 60:    LDA  1,-2(1) 	Load address of new frame 
 61:    LDA  3,1(7) 	Return address in ac 
 62:    LDA  7,-40(7) 	call outputb
 63:    LDA  3,0(2) 	Save the result in ac 
* 6
 64:     ST  1,-2(1) 	Store old fp in ghost frame 
 65:    LDC  3,1(6) 	Load constant 
 66:     ST  3,-4(1) 	Save left side in temp 
 67:    LDC  3,0(6) 	Load constant 
 68:     LD  4,-4(1) 	Load left from temp into ac1 
 69:    JEQ  3,3(7) 	Jump if false for Op && 
 70:    LDC  3,0(6) 	False case 
 71:    JEQ  4,1(7) 	Jump if false 
 72:    LDC  3,1(6) 	True case 
 73:     ST  3,-4(1) 	Store parameter 
 74:    LDA  1,-2(1) 	Load address of new frame 
 75:    LDA  3,1(7) 	Return address in ac 
 76:    LDA  7,-54(7) 	call outputb
 77:    LDA  3,0(2) 	Save the result in ac 
* 7
 78:     ST  1,-2(1) 	Store old fp in ghost frame 
 79:    LDC  3,1(6) 	Load constant 
 80:     ST  3,-4(1) 	Save left side in temp 
 81:    LDC  3,1(6) 	Load constant 
 82:     LD  4,-4(1) 	Load left from temp into ac1 
 83:    JEQ  3,3(7) 	Jump if false for Op && 
 84:    LDC  3,0(6) 	False case 
 85:    JEQ  4,1(7) 	Jump if false 
 86:    LDC  3,1(6) 	True case 
 87:     ST  3,-4(1) 	Store parameter 
 88:    LDA  1,-2(1) 	Load address of new frame 
 89:    LDA  3,1(7) 	Return address in ac 
 90:    LDA  7,-68(7) 	call outputb
 91:    LDA  3,0(2) 	Save the result in ac 
* 8
 92:     ST  1,-2(1) 	Store old fp in ghost frame 
 93:    LDA  1,-2(1) 	Load address of new frame 
 94:    LDA  3,1(7) 	Return address in ac 
 95:    LDA  7,-66(7) 	call outnl
 96:    LDA  3,0(2) 	Save the result in ac 
* 10
 97:     ST  1,-2(1) 	Store old fp in ghost frame 
 98:    LDC  3,0(6) 	Load constant 
 99:     ST  3,-4(1) 	Save left side in temp 
100:    LDC  3,0(6) 	Load constant 
101:     LD  4,-4(1) 	Load left from temp into ac1 
102:    ADD  3,4,3 	Op || 
103:    JEQ  3,1(7) 	Jump if false 
104:    LDC  3,1(6) 	True case 
105:     ST  3,-4(1) 	Store parameter 
106:    LDA  1,-2(1) 	Load address of new frame 
107:    LDA  3,1(7) 	Return address in ac 
108:    LDA  7,-86(7) 	call outputb
109:    LDA  3,0(2) 	Save the result in ac 
* 11
110:     ST  1,-2(1) 	Store old fp in ghost frame 
111:    LDC  3,0(6) 	Load constant 
112:     ST  3,-4(1) 	Save left side in temp 
113:    LDC  3,1(6) 	Load constant 
114:     LD  4,-4(1) 	Load left from temp into ac1 
115:    ADD  3,4,3 	Op || 
116:    JEQ  3,1(7) 	Jump if false 
117:    LDC  3,1(6) 	True case 
118:     ST  3,-4(1) 	Store parameter 
119:    LDA  1,-2(1) 	Load address of new frame 
120:    LDA  3,1(7) 	Return address in ac 
121:    LDA  7,-99(7) 	call outputb
122:    LDA  3,0(2) 	Save the result in ac 
* 12
123:     ST  1,-2(1) 	Store old fp in ghost frame 
124:    LDC  3,1(6) 	Load constant 
125:     ST  3,-4(1) 	Save left side in temp 
126:    LDC  3,0(6) 	Load constant 
127:     LD  4,-4(1) 	Load left from temp into ac1 
128:    ADD  3,4,3 	Op || 
129:    JEQ  3,1(7) 	Jump if false 
130:    LDC  3,1(6) 	True case 
131:     ST  3,-4(1) 	Store parameter 
132:    LDA  1,-2(1) 	Load address of new frame 
133:    LDA  3,1(7) 	Return address in ac 
134:    LDA  7,-112(7) 	call outputb
135:    LDA  3,0(2) 	Save the result in ac 
* 13
136:     ST  1,-2(1) 	Store old fp in ghost frame 
137:    LDC  3,1(6) 	Load constant 
138:     ST  3,-4(1) 	Save left side in temp 
139:    LDC  3,1(6) 	Load constant 
140:     LD  4,-4(1) 	Load left from temp into ac1 
141:    ADD  3,4,3 	Op || 
142:    JEQ  3,1(7) 	Jump if false 
143:    LDC  3,1(6) 	True case 
144:     ST  3,-4(1) 	Store parameter 
145:    LDA  1,-2(1) 	Load address of new frame 
146:    LDA  3,1(7) 	Return address in ac 
147:    LDA  7,-125(7) 	call outputb
148:    LDA  3,0(2) 	Save the result in ac 
* 14
149:     ST  1,-2(1) 	Store old fp in ghost frame 
150:    LDA  1,-2(1) 	Load address of new frame 
151:    LDA  3,1(7) 	Return address in ac 
152:    LDA  7,-123(7) 	call outnl
153:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
154:    LDC  2,0(6) 	Set return value to 0 
155:     LD  3,-1(1) 	Load return address 
156:     LD  1,0(1) 	Adjust fp 
157:    LDA  7,0(3) 	Return 
* END of function main
