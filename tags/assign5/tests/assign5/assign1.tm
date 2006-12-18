* C- compiler version C-06
* Author: Robert B. Heckendorn
* Backend coauthor: Jorge Williams
* Apr 1, 2006
* BEGIN Prolog
  0:     LD  0,0(0) 	Set the global pointer 
  1:    LDA  1,-4(0) 	set first frame at end of globals 
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
* 10
 36:    LDC  3,111(6) 	Load constant 
 37:     ST  3,-2(1) 	Store variable x
* 11
 38:     ST  1,-6(1) 	Store old fp in ghost frame 
 39:     LD  3,-2(1) 	Load variable x
 40:     ST  3,-8(1) 	Store parameter 
 41:    LDA  1,-6(1) 	Load address of new frame 
 42:    LDA  3,1(7) 	Return address in ac 
 43:    LDA  7,-33(7) 	call output
 44:    LDA  3,0(2) 	Save the result in ac 
* 12
 45:    LDC  3,222(6) 	Load constant 
 46:     ST  3,-3(1) 	Store variable y
* 13
 47:     ST  1,-6(1) 	Store old fp in ghost frame 
 48:     LD  3,-3(1) 	Load variable y
 49:     ST  3,-8(1) 	Store parameter 
 50:    LDA  1,-6(1) 	Load address of new frame 
 51:    LDA  3,1(7) 	Return address in ac 
 52:    LDA  7,-42(7) 	call output
 53:    LDA  3,0(2) 	Save the result in ac 
* 14
 54:    LDC  3,1(6) 	Load constant 
 55:     ST  3,-4(1) 	Store variable a
* 15
 56:     ST  1,-6(1) 	Store old fp in ghost frame 
 57:     LD  3,-4(1) 	Load variable a
 58:     ST  3,-8(1) 	Store parameter 
 59:    LDA  1,-6(1) 	Load address of new frame 
 60:    LDA  3,1(7) 	Return address in ac 
 61:    LDA  7,-39(7) 	call outputb
 62:    LDA  3,0(2) 	Save the result in ac 
* 16
 63:    LDC  3,0(6) 	Load constant 
 64:     ST  3,-5(1) 	Store variable b
* 17
 65:     ST  1,-6(1) 	Store old fp in ghost frame 
 66:     LD  3,-5(1) 	Load variable b
 67:     ST  3,-8(1) 	Store parameter 
 68:    LDA  1,-6(1) 	Load address of new frame 
 69:    LDA  3,1(7) 	Return address in ac 
 70:    LDA  7,-48(7) 	call outputb
 71:    LDA  3,0(2) 	Save the result in ac 
* 18
 72:     ST  1,-6(1) 	Store old fp in ghost frame 
 73:    LDA  1,-6(1) 	Load address of new frame 
 74:    LDA  3,1(7) 	Return address in ac 
 75:    LDA  7,-46(7) 	call outnl
 76:    LDA  3,0(2) 	Save the result in ac 
* 20
 77:    LDC  3,333(6) 	Load constant 
 78:     ST  3,0(0) 	Store variable gx
* 21
 79:     ST  1,-6(1) 	Store old fp in ghost frame 
 80:     LD  3,0(0) 	Load variable gx
 81:     ST  3,-8(1) 	Store parameter 
 82:    LDA  1,-6(1) 	Load address of new frame 
 83:    LDA  3,1(7) 	Return address in ac 
 84:    LDA  7,-74(7) 	call output
 85:    LDA  3,0(2) 	Save the result in ac 
* 22
 86:    LDC  3,444(6) 	Load constant 
 87:     ST  3,-1(0) 	Store variable gy
* 23
 88:     ST  1,-6(1) 	Store old fp in ghost frame 
 89:     LD  3,-1(0) 	Load variable gy
 90:     ST  3,-8(1) 	Store parameter 
 91:    LDA  1,-6(1) 	Load address of new frame 
 92:    LDA  3,1(7) 	Return address in ac 
 93:    LDA  7,-83(7) 	call output
 94:    LDA  3,0(2) 	Save the result in ac 
* 24
 95:    LDC  3,0(6) 	Load constant 
 96:     ST  3,-2(0) 	Store variable ga
* 25
 97:     ST  1,-6(1) 	Store old fp in ghost frame 
 98:     LD  3,-2(0) 	Load variable ga
 99:     ST  3,-8(1) 	Store parameter 
100:    LDA  1,-6(1) 	Load address of new frame 
101:    LDA  3,1(7) 	Return address in ac 
102:    LDA  7,-80(7) 	call outputb
103:    LDA  3,0(2) 	Save the result in ac 
* 26
104:    LDC  3,1(6) 	Load constant 
105:     ST  3,-3(0) 	Store variable gb
* 27
106:     ST  1,-6(1) 	Store old fp in ghost frame 
107:     LD  3,-3(0) 	Load variable gb
108:     ST  3,-8(1) 	Store parameter 
109:    LDA  1,-6(1) 	Load address of new frame 
110:    LDA  3,1(7) 	Return address in ac 
111:    LDA  7,-89(7) 	call outputb
112:    LDA  3,0(2) 	Save the result in ac 
* 28
113:     ST  1,-6(1) 	Store old fp in ghost frame 
114:    LDA  1,-6(1) 	Load address of new frame 
115:    LDA  3,1(7) 	Return address in ac 
116:    LDA  7,-87(7) 	call outnl
117:    LDA  3,0(2) 	Save the result in ac 
* 30
118:     LD  3,-3(1) 	Load variable y
119:     ST  3,-2(1) 	Store variable x
* 31
120:     ST  1,-6(1) 	Store old fp in ghost frame 
121:     LD  3,-2(1) 	Load variable x
122:     ST  3,-8(1) 	Store parameter 
123:    LDA  1,-6(1) 	Load address of new frame 
124:    LDA  3,1(7) 	Return address in ac 
125:    LDA  7,-115(7) 	call output
126:    LDA  3,0(2) 	Save the result in ac 
* 32
127:     LD  3,-5(1) 	Load variable b
128:     ST  3,-4(1) 	Store variable a
* 33
129:     ST  1,-6(1) 	Store old fp in ghost frame 
130:     LD  3,-4(1) 	Load variable a
131:     ST  3,-8(1) 	Store parameter 
132:    LDA  1,-6(1) 	Load address of new frame 
133:    LDA  3,1(7) 	Return address in ac 
134:    LDA  7,-112(7) 	call outputb
135:    LDA  3,0(2) 	Save the result in ac 
* 34
136:     ST  1,-6(1) 	Store old fp in ghost frame 
137:    LDA  1,-6(1) 	Load address of new frame 
138:    LDA  3,1(7) 	Return address in ac 
139:    LDA  7,-110(7) 	call outnl
140:    LDA  3,0(2) 	Save the result in ac 
* 36
141:     LD  3,-1(0) 	Load variable gy
142:     ST  3,0(0) 	Store variable gx
* 37
143:     ST  1,-6(1) 	Store old fp in ghost frame 
144:     LD  3,0(0) 	Load variable gx
145:     ST  3,-8(1) 	Store parameter 
146:    LDA  1,-6(1) 	Load address of new frame 
147:    LDA  3,1(7) 	Return address in ac 
148:    LDA  7,-138(7) 	call output
149:    LDA  3,0(2) 	Save the result in ac 
* 38
150:     LD  3,-3(0) 	Load variable gb
151:     ST  3,-2(0) 	Store variable ga
* 39
152:     ST  1,-6(1) 	Store old fp in ghost frame 
153:     LD  3,-2(0) 	Load variable ga
154:     ST  3,-8(1) 	Store parameter 
155:    LDA  1,-6(1) 	Load address of new frame 
156:    LDA  3,1(7) 	Return address in ac 
157:    LDA  7,-135(7) 	call outputb
158:    LDA  3,0(2) 	Save the result in ac 
* 40
159:     ST  1,-6(1) 	Store old fp in ghost frame 
160:    LDA  1,-6(1) 	Load address of new frame 
161:    LDA  3,1(7) 	Return address in ac 
162:    LDA  7,-133(7) 	call outnl
163:    LDA  3,0(2) 	Save the result in ac 
* RETURN
164:    LDA  2,0(3) 	Copy result to rt register 
165:     LD  3,-1(1) 	Load return address 
166:     LD  1,0(1) 	Adjust fp 
167:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
168:    LDC  2,0(6) 	Set return value to 0 
169:     LD  3,-1(1) 	Load return address 
170:     LD  1,0(1) 	Adjust fp 
171:    LDA  7,0(3) 	Return 
* END of function main
