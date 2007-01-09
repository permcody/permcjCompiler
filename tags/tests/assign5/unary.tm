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
* 10
 36:    LDC  3,88(6) 	Load constant 
 37:     ST  3,-2(1) 	Store variable x
* 11
 38:     LD  3,-2(1) 	Load variable x
 39:     ST  3,-6(1) 	Save left side in temp 
 40:    LDC  3,9(6) 	Load constant 
 41:     LD  4,-6(1) 	Load left from temp into ac1 
 42:    SUB  3,4,3 	Op - 
 43:     ST  3,-3(1) 	Store variable y
* 12
 44:     LD  3,-2(1) 	Load variable x
 45:    LDC  4,0(6) 	Load 0 
 46:    SUB  3,4,3 	Op unary - 
 47:     ST  3,-3(1) 	Store variable y
* 13
 48:     ST  1,-6(1) 	Store old fp in ghost frame 
 49:     LD  3,-2(1) 	Load variable x
 50:    LDC  4,0(6) 	Load 0 
 51:    SUB  3,4,3 	Op unary - 
 52:     ST  3,-8(1) 	Store parameter 
 53:    LDA  1,-6(1) 	Load address of new frame 
 54:    LDA  3,1(7) 	Return address in ac 
 55:    LDA  7,-45(7) 	call output
 56:    LDA  3,0(2) 	Save the result in ac 
* 14
 57:     ST  1,-6(1) 	Store old fp in ghost frame 
 58:     LD  3,-3(1) 	Load variable y
 59:     ST  3,-8(1) 	Store parameter 
 60:    LDA  1,-6(1) 	Load address of new frame 
 61:    LDA  3,1(7) 	Return address in ac 
 62:    LDA  7,-52(7) 	call output
 63:    LDA  3,0(2) 	Save the result in ac 
* 15
 64:     ST  1,-6(1) 	Store old fp in ghost frame 
 65:    LDA  1,-6(1) 	Load address of new frame 
 66:    LDA  3,1(7) 	Return address in ac 
 67:    LDA  7,-38(7) 	call outnl
 68:    LDA  3,0(2) 	Save the result in ac 
* 17
 69:     ST  1,-6(1) 	Store old fp in ghost frame 
 70:    LDC  3,3(6) 	Load constant 
 71:    LDC  4,0(6) 	Load 0 
 72:    SUB  3,4,3 	Op unary - 
 73:    LDC  4,0(6) 	Load 0 
 74:    SUB  3,4,3 	Op unary - 
 75:     ST  3,-8(1) 	Save left side in temp 
 76:    LDC  3,5(6) 	Load constant 
 77:    LDC  4,0(6) 	Load 0 
 78:    SUB  3,4,3 	Op unary - 
 79:     LD  4,-8(1) 	Load left from temp into ac1 
 80:    MUL  3,4,3 	Op * 
 81:     ST  3,-8(1) 	Store parameter 
 82:    LDA  1,-6(1) 	Load address of new frame 
 83:    LDA  3,1(7) 	Return address in ac 
 84:    LDA  7,-74(7) 	call output
 85:    LDA  3,0(2) 	Save the result in ac 
* 18
 86:     ST  1,-6(1) 	Store old fp in ghost frame 
 87:    LDC  3,3(6) 	Load constant 
 88:    LDC  4,0(6) 	Load 0 
 89:    SUB  3,4,3 	Op unary - 
 90:    LDC  4,0(6) 	Load 0 
 91:    SUB  3,4,3 	Op unary - 
 92:     ST  3,-8(1) 	Store parameter 
 93:    LDA  1,-6(1) 	Load address of new frame 
 94:    LDA  3,1(7) 	Return address in ac 
 95:    LDA  7,-85(7) 	call output
 96:    LDA  3,0(2) 	Save the result in ac 
* 19
 97:     ST  1,-6(1) 	Store old fp in ghost frame 
 98:    LDA  1,-6(1) 	Load address of new frame 
 99:    LDA  3,1(7) 	Return address in ac 
100:    LDA  7,-71(7) 	call outnl
101:    LDA  3,0(2) 	Save the result in ac 
* BEGIN compound statement
* 24
102:    LDC  3,1(6) 	Load constant 
103:     ST  3,-4(1) 	Store variable x
* 25
104:     LD  3,-4(1) 	Load variable x
105:    LDC  4,1(6) 	Load 1 
106:    SUB  3,4,3 	Op ! 
107:     ST  3,-5(1) 	Store variable y
* 26
108:     ST  1,-6(1) 	Store old fp in ghost frame 
109:     LD  3,-4(1) 	Load variable x
110:    LDC  4,1(6) 	Load 1 
111:    SUB  3,4,3 	Op ! 
112:     ST  3,-8(1) 	Store parameter 
113:    LDA  1,-6(1) 	Load address of new frame 
114:    LDA  3,1(7) 	Return address in ac 
115:    LDA  7,-93(7) 	call outputb
116:    LDA  3,0(2) 	Save the result in ac 
* 27
117:     ST  1,-6(1) 	Store old fp in ghost frame 
118:     LD  3,-5(1) 	Load variable y
119:     ST  3,-8(1) 	Store parameter 
120:    LDA  1,-6(1) 	Load address of new frame 
121:    LDA  3,1(7) 	Return address in ac 
122:    LDA  7,-100(7) 	call outputb
123:    LDA  3,0(2) 	Save the result in ac 
* 28
124:     ST  1,-6(1) 	Store old fp in ghost frame 
125:     LD  3,-4(1) 	Load variable x
126:    LDC  4,1(6) 	Load 1 
127:    SUB  3,4,3 	Op ! 
128:    LDC  4,1(6) 	Load 1 
129:    SUB  3,4,3 	Op ! 
130:     ST  3,-8(1) 	Save left side in temp 
131:     LD  3,-5(1) 	Load variable y
132:    LDC  4,1(6) 	Load 1 
133:    SUB  3,4,3 	Op ! 
134:     LD  4,-8(1) 	Load left from temp into ac1 
135:    JEQ  3,3(7) 	Jump if false for Op && 
136:    LDC  3,0(6) 	False case 
137:    JEQ  4,1(7) 	Jump if false 
138:    LDC  3,1(6) 	True case 
139:     ST  3,-8(1) 	Store parameter 
140:    LDA  1,-6(1) 	Load address of new frame 
141:    LDA  3,1(7) 	Return address in ac 
142:    LDA  7,-120(7) 	call outputb
143:    LDA  3,0(2) 	Save the result in ac 
* 29
144:     ST  1,-6(1) 	Store old fp in ghost frame 
145:     LD  3,-4(1) 	Load variable x
146:    LDC  4,1(6) 	Load 1 
147:    SUB  3,4,3 	Op ! 
148:    LDC  4,1(6) 	Load 1 
149:    SUB  3,4,3 	Op ! 
150:     ST  3,-8(1) 	Save left side in temp 
151:     LD  3,-5(1) 	Load variable y
152:    LDC  4,1(6) 	Load 1 
153:    SUB  3,4,3 	Op ! 
154:     LD  4,-8(1) 	Load left from temp into ac1 
155:    ADD  3,4,3 	Op || 
156:    JEQ  3,1(7) 	Jump if false 
157:    LDC  3,1(6) 	True case 
158:     ST  3,-8(1) 	Store parameter 
159:    LDA  1,-6(1) 	Load address of new frame 
160:    LDA  3,1(7) 	Return address in ac 
161:    LDA  7,-139(7) 	call outputb
162:    LDA  3,0(2) 	Save the result in ac 
* 30
163:     ST  1,-6(1) 	Store old fp in ghost frame 
164:     LD  3,-5(1) 	Load variable y
165:    LDC  4,1(6) 	Load 1 
166:    SUB  3,4,3 	Op ! 
167:    LDC  4,1(6) 	Load 1 
168:    SUB  3,4,3 	Op ! 
169:     ST  3,-8(1) 	Save left side in temp 
170:     LD  3,-4(1) 	Load variable x
171:    LDC  4,1(6) 	Load 1 
172:    SUB  3,4,3 	Op ! 
173:     LD  4,-8(1) 	Load left from temp into ac1 
174:    ADD  3,4,3 	Op || 
175:    JEQ  3,1(7) 	Jump if false 
176:    LDC  3,1(6) 	True case 
177:     ST  3,-8(1) 	Store parameter 
178:    LDA  1,-6(1) 	Load address of new frame 
179:    LDA  3,1(7) 	Return address in ac 
180:    LDA  7,-158(7) 	call outputb
181:    LDA  3,0(2) 	Save the result in ac 
* 31
182:     ST  1,-6(1) 	Store old fp in ghost frame 
183:     LD  3,-4(1) 	Load variable x
184:    LDC  4,1(6) 	Load 1 
185:    SUB  3,4,3 	Op ! 
186:    LDC  4,1(6) 	Load 1 
187:    SUB  3,4,3 	Op ! 
188:     ST  3,-8(1) 	Store parameter 
189:    LDA  1,-6(1) 	Load address of new frame 
190:    LDA  3,1(7) 	Return address in ac 
191:    LDA  7,-169(7) 	call outputb
192:    LDA  3,0(2) 	Save the result in ac 
* 32
193:     ST  1,-6(1) 	Store old fp in ghost frame 
194:    LDA  1,-6(1) 	Load address of new frame 
195:    LDA  3,1(7) 	Return address in ac 
196:    LDA  7,-167(7) 	call outnl
197:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* END compound statement
* Add standard closing in case there is no return statement
198:    LDC  2,0(6) 	Set return value to 0 
199:     LD  3,-1(1) 	Load return address 
200:     LD  1,0(1) 	Adjust fp 
201:    LDA  7,0(3) 	Return 
* END of function main
