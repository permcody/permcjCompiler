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
 31:    LDC  3,88(6) 	Load constant 
 32:     ST  3,-2(1) 	Store variable x
* 
 33:     LD  3,-2(1) 	Load variable x
 34:     ST  3,-6(1) 	Save left side 
 35:    LDC  3,9(6) 	Load constant 
 36:     LD  4,-6(1) 	Load left into ac1 
 37:    SUB  3,4,3 	op - 
 38:     ST  3,-3(1) 	Store variable y
* 
 39:     LD  3,-2(1) 	Load variable x
 40:    LDC  4,0(6) 	Load 0 
 41:    SUB  3,4,3 	op - 
 42:     ST  3,-3(1) 	Store variable y
* 
 43:     ST  1,-6(1) 	Store old fp in ghost frame 
 44:     LD  3,-2(1) 	Load variable x
 45:    LDC  4,0(6) 	Load 0 
 46:    SUB  3,4,3 	op - 
 47:     ST  3,-8(1) 	Store parameter 
 48:    LDA  1,-6(1) 	Load address of new frame 
 49:    LDA  3,1(7) 	Return address in ac 
 50:    LDA  7,-40(7) 	call output
 51:    LDA  3,0(2) 	Save the result in ac 
* 
 52:     ST  1,-6(1) 	Store old fp in ghost frame 
 53:     LD  3,-3(1) 	Load variable y
 54:     ST  3,-8(1) 	Store parameter 
 55:    LDA  1,-6(1) 	Load address of new frame 
 56:    LDA  3,1(7) 	Return address in ac 
 57:    LDA  7,-47(7) 	call output
 58:    LDA  3,0(2) 	Save the result in ac 
* 
 59:     ST  1,-6(1) 	Store old fp in ghost frame 
 60:    LDC  3,3(6) 	Load constant 
 61:    LDC  4,0(6) 	Load 0 
 62:    SUB  3,4,3 	op - 
 63:    LDC  4,0(6) 	Load 0 
 64:    SUB  3,4,3 	op - 
 65:     ST  3,-8(1) 	Save left side 
 66:    LDC  3,5(6) 	Load constant 
 67:    LDC  4,0(6) 	Load 0 
 68:    SUB  3,4,3 	op - 
 69:     LD  4,-8(1) 	Load left into ac1 
 70:    MUL  3,4,3 	op * 
 71:     ST  3,-8(1) 	Store parameter 
 72:    LDA  1,-6(1) 	Load address of new frame 
 73:    LDA  3,1(7) 	Return address in ac 
 74:    LDA  7,-64(7) 	call output
 75:    LDA  3,0(2) 	Save the result in ac 
* 
 76:     ST  1,-6(1) 	Store old fp in ghost frame 
 77:    LDC  3,3(6) 	Load constant 
 78:    LDC  4,0(6) 	Load 0 
 79:    SUB  3,4,3 	op - 
 80:    LDC  4,0(6) 	Load 0 
 81:    SUB  3,4,3 	op - 
 82:     ST  3,-8(1) 	Store parameter 
 83:    LDA  1,-6(1) 	Load address of new frame 
 84:    LDA  3,1(7) 	Return address in ac 
 85:    LDA  7,-75(7) 	call output
 86:    LDA  3,0(2) 	Save the result in ac 
* BEGIN
* 
 87:    LDC  3,1(6) 	Load constant 
 88:     ST  3,-4(1) 	Store variable x
* 
 89:     LD  3,-4(1) 	Load variable x
 90:    LDC  4,1(6) 	Load 1 
 91:    SUB  3,4,3 	op - 
 92:     ST  3,-5(1) 	Store variable y
* 
 93:     ST  1,-6(1) 	Store old fp in ghost frame 
 94:     LD  3,-4(1) 	Load variable x
 95:    LDC  4,1(6) 	Load 1 
 96:    SUB  3,4,3 	op - 
 97:     ST  3,-8(1) 	Store parameter 
 98:    LDA  1,-6(1) 	Load address of new frame 
 99:    LDA  3,1(7) 	Return address in ac 
100:    LDA  7,-78(7) 	call outputb
101:    LDA  3,0(2) 	Save the result in ac 
* 
102:     ST  1,-6(1) 	Store old fp in ghost frame 
103:     LD  3,-5(1) 	Load variable y
104:     ST  3,-8(1) 	Store parameter 
105:    LDA  1,-6(1) 	Load address of new frame 
106:    LDA  3,1(7) 	Return address in ac 
107:    LDA  7,-85(7) 	call outputb
108:    LDA  3,0(2) 	Save the result in ac 
* 
109:     ST  1,-6(1) 	Store old fp in ghost frame 
110:     LD  3,-4(1) 	Load variable x
111:    LDC  4,1(6) 	Load 1 
112:    SUB  3,4,3 	op - 
113:    LDC  4,1(6) 	Load 1 
114:    SUB  3,4,3 	op - 
115:     ST  3,-8(1) 	Save left side 
116:     LD  3,-5(1) 	Load variable y
117:    LDC  4,1(6) 	Load 1 
118:    SUB  3,4,3 	op - 
119:     LD  4,-8(1) 	Load left into ac1 
120:    LDC  5,1(6) 	op && 
121:    SUB  6,4,5 	 
122:    JLT  6,4(7) 	jump if false 
123:    SUB  6,3,5 	 
124:    JLT  6,2(7) 	jump if false 
125:    LDC  3,1(6) 	true case 
126:    LDA  7,1(7) 	unconditional jmp 
127:    LDC  3,0(6) 	false case 
128:     ST  3,-8(1) 	Store parameter 
129:    LDA  1,-6(1) 	Load address of new frame 
130:    LDA  3,1(7) 	Return address in ac 
131:    LDA  7,-109(7) 	call outputb
132:    LDA  3,0(2) 	Save the result in ac 
* 
133:     ST  1,-6(1) 	Store old fp in ghost frame 
134:     LD  3,-4(1) 	Load variable x
135:    LDC  4,1(6) 	Load 1 
136:    SUB  3,4,3 	op - 
137:    LDC  4,1(6) 	Load 1 
138:    SUB  3,4,3 	op - 
139:     ST  3,-8(1) 	Save left side 
140:     LD  3,-5(1) 	Load variable y
141:    LDC  4,1(6) 	Load 1 
142:    SUB  3,4,3 	op - 
143:     LD  4,-8(1) 	Load left into ac1 
144:    LDC  5,1(6) 	op && 
145:    SUB  6,4,5 	 
146:    JGE  6,4(7) 	jump if false 
147:    SUB  6,3,5 	 
148:    JGE  6,2(7) 	jump if false 
149:    LDC  3,0(6) 	false case 
150:    LDA  7,1(7) 	unconditional jmp 
151:    LDC  3,1(6) 	true case 
152:     ST  3,-8(1) 	Store parameter 
153:    LDA  1,-6(1) 	Load address of new frame 
154:    LDA  3,1(7) 	Return address in ac 
155:    LDA  7,-133(7) 	call outputb
156:    LDA  3,0(2) 	Save the result in ac 
* 
157:     ST  1,-6(1) 	Store old fp in ghost frame 
158:     LD  3,-5(1) 	Load variable y
159:    LDC  4,1(6) 	Load 1 
160:    SUB  3,4,3 	op - 
161:    LDC  4,1(6) 	Load 1 
162:    SUB  3,4,3 	op - 
163:     ST  3,-8(1) 	Save left side 
164:     LD  3,-4(1) 	Load variable x
165:    LDC  4,1(6) 	Load 1 
166:    SUB  3,4,3 	op - 
167:     LD  4,-8(1) 	Load left into ac1 
168:    LDC  5,1(6) 	op && 
169:    SUB  6,4,5 	 
170:    JGE  6,4(7) 	jump if false 
171:    SUB  6,3,5 	 
172:    JGE  6,2(7) 	jump if false 
173:    LDC  3,0(6) 	false case 
174:    LDA  7,1(7) 	unconditional jmp 
175:    LDC  3,1(6) 	true case 
176:     ST  3,-8(1) 	Store parameter 
177:    LDA  1,-6(1) 	Load address of new frame 
178:    LDA  3,1(7) 	Return address in ac 
179:    LDA  7,-157(7) 	call outputb
180:    LDA  3,0(2) 	Save the result in ac 
* 
181:     ST  1,-6(1) 	Store old fp in ghost frame 
182:     LD  3,-4(1) 	Load variable x
183:    LDC  4,1(6) 	Load 1 
184:    SUB  3,4,3 	op - 
185:    LDC  4,1(6) 	Load 1 
186:    SUB  3,4,3 	op - 
187:     ST  3,-8(1) 	Store parameter 
188:    LDA  1,-6(1) 	Load address of new frame 
189:    LDA  3,1(7) 	Return address in ac 
190:    LDA  7,-168(7) 	call outputb
191:    LDA  3,0(2) 	Save the result in ac 
* END
* END
* Add standard closing in case there is no return statement
192:    LDC  2,0(6) 	Set return value to 0 
193:     LD  3,-1(1) 	Load return address 
194:     LD  1,0(1) 	Adjust fp 
195:    LDA  7,0(3) 	Return 
* END of function main
