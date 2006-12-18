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
* 12
 36:    LDC  3,1(6) 	Load constant 
 37:     ST  3,-3(1) 	Store variable bilbo
* 13
 38:    LDC  3,10(6) 	Load constant 
 39:     ST  3,-2(1) 	Store variable frodo
* 14
 40:    LDC  3,100(6) 	Load constant 
 41:     ST  3,-4(1) 	Store variable sam
* 15
 42:    LDC  3,1000(6) 	Load constant 
 43:     ST  3,-5(1) 	Store variable merry
* 16
 44:    LDC  3,10000(6) 	Load constant 
 45:     ST  3,-6(1) 	Store variable pippin
* 18
 46:     LD  3,-3(1) 	Load variable bilbo
 47:     ST  3,-3(1) 	Store variable bilbo
* 19
 48:     ST  1,-7(1) 	Store old fp in ghost frame 
 49:     LD  3,-3(1) 	Load variable bilbo
 50:     ST  3,-9(1) 	Store parameter 
 51:    LDA  1,-7(1) 	Load address of new frame 
 52:    LDA  3,1(7) 	Return address in ac 
 53:    LDA  7,-43(7) 	call output
 54:    LDA  3,0(2) 	Save the result in ac 
* 20
 55:     ST  1,-7(1) 	Store old fp in ghost frame 
 56:    LDA  1,-7(1) 	Load address of new frame 
 57:    LDA  3,1(7) 	Return address in ac 
 58:    LDA  7,-29(7) 	call outnl
 59:    LDA  3,0(2) 	Save the result in ac 
* 22
 60:     LD  3,-3(1) 	Load variable bilbo
 61:     ST  3,-7(1) 	Save left side in temp 
 62:    LDC  3,1(6) 	Load constant 
 63:     LD  4,-7(1) 	Load left from temp into ac1 
 64:    ADD  3,4,3 	Op + 
 65:     ST  3,-3(1) 	Store variable bilbo
* 23
 66:     ST  1,-7(1) 	Store old fp in ghost frame 
 67:     LD  3,-3(1) 	Load variable bilbo
 68:     ST  3,-9(1) 	Store parameter 
 69:    LDA  1,-7(1) 	Load address of new frame 
 70:    LDA  3,1(7) 	Return address in ac 
 71:    LDA  7,-61(7) 	call output
 72:    LDA  3,0(2) 	Save the result in ac 
* 24
 73:     ST  1,-7(1) 	Store old fp in ghost frame 
 74:    LDA  1,-7(1) 	Load address of new frame 
 75:    LDA  3,1(7) 	Return address in ac 
 76:    LDA  7,-47(7) 	call outnl
 77:    LDA  3,0(2) 	Save the result in ac 
* 26
 78:     LD  3,-2(1) 	Load variable frodo
 79:     ST  3,-7(1) 	Save left side in temp 
 80:     LD  3,-3(1) 	Load variable bilbo
 81:     ST  3,-8(1) 	Save left side in temp 
 82:     LD  3,-4(1) 	Load variable sam
 83:     ST  3,-9(1) 	Save left side in temp 
 84:     LD  3,-5(1) 	Load variable merry
 85:     ST  3,-10(1) 	Save left side in temp 
 86:     LD  3,-6(1) 	Load variable pippin
 87:     LD  4,-10(1) 	Load left from temp into ac1 
 88:    MUL  3,4,3 	Op * 
 89:     LD  4,-9(1) 	Load left from temp into ac1 
 90:    ADD  3,4,3 	Op + 
 91:     LD  4,-8(1) 	Load left from temp into ac1 
 92:    MUL  3,4,3 	Op * 
 93:     LD  4,-7(1) 	Load left from temp into ac1 
 94:    ADD  3,4,3 	Op + 
 95:     ST  3,-3(1) 	Store variable bilbo
* 27
 96:     ST  1,-7(1) 	Store old fp in ghost frame 
 97:     LD  3,-3(1) 	Load variable bilbo
 98:     ST  3,-9(1) 	Store parameter 
 99:    LDA  1,-7(1) 	Load address of new frame 
100:    LDA  3,1(7) 	Return address in ac 
101:    LDA  7,-91(7) 	call output
102:    LDA  3,0(2) 	Save the result in ac 
* 28
103:     ST  1,-7(1) 	Store old fp in ghost frame 
104:    LDA  1,-7(1) 	Load address of new frame 
105:    LDA  3,1(7) 	Return address in ac 
106:    LDA  7,-77(7) 	call outnl
107:    LDA  3,0(2) 	Save the result in ac 
* 30
108:     LD  3,-5(1) 	Load variable merry
109:     ST  3,-7(1) 	Save left side in temp 
110:     LD  3,-6(1) 	Load variable pippin
111:     LD  4,-7(1) 	Load left from temp into ac1 
112:    MUL  3,4,3 	Op * 
113:     ST  3,-7(1) 	Save left side in temp 
114:     LD  3,-4(1) 	Load variable sam
115:     LD  4,-7(1) 	Load left from temp into ac1 
116:    ADD  3,4,3 	Op + 
117:     ST  3,-7(1) 	Save left side in temp 
118:     LD  3,-3(1) 	Load variable bilbo
119:     LD  4,-7(1) 	Load left from temp into ac1 
120:    MUL  3,4,3 	Op * 
121:     ST  3,-7(1) 	Save left side in temp 
122:     LD  3,-2(1) 	Load variable frodo
123:     LD  4,-7(1) 	Load left from temp into ac1 
124:    ADD  3,4,3 	Op + 
125:     ST  3,-3(1) 	Store variable bilbo
* 31
126:     ST  1,-7(1) 	Store old fp in ghost frame 
127:     LD  3,-3(1) 	Load variable bilbo
128:     ST  3,-9(1) 	Store parameter 
129:    LDA  1,-7(1) 	Load address of new frame 
130:    LDA  3,1(7) 	Return address in ac 
131:    LDA  7,-121(7) 	call output
132:    LDA  3,0(2) 	Save the result in ac 
* 32
133:     ST  1,-7(1) 	Store old fp in ghost frame 
134:    LDA  1,-7(1) 	Load address of new frame 
135:    LDA  3,1(7) 	Return address in ac 
136:    LDA  7,-107(7) 	call outnl
137:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
138:    LDC  2,0(6) 	Set return value to 0 
139:     LD  3,-1(1) 	Load return address 
140:     LD  1,0(1) 	Adjust fp 
141:    LDA  7,0(3) 	Return 
* END of function main
