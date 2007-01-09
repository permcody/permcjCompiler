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
 36:     ST  1,-4(1) 	Store old fp in ghost frame 
 37:    LDC  3,777(6) 	Load constant 
 38:     ST  3,-6(1) 	Store parameter 
 39:    LDA  1,-4(1) 	Load address of new frame 
 40:    LDA  3,1(7) 	Return address in ac 
 41:    LDA  7,-31(7) 	call output
 42:    LDA  3,0(2) 	Save the result in ac 
* 11
 43:     ST  1,-4(1) 	Store old fp in ghost frame 
 44:    LDC  3,0(6) 	Load constant 
 45:     ST  3,-6(1) 	Store parameter 
 46:    LDA  1,-4(1) 	Load address of new frame 
 47:    LDA  3,1(7) 	Return address in ac 
 48:    LDA  7,-26(7) 	call outputb
 49:    LDA  3,0(2) 	Save the result in ac 
* 12
 50:     ST  1,-4(1) 	Store old fp in ghost frame 
 51:    LDA  1,-4(1) 	Load address of new frame 
 52:    LDA  3,1(7) 	Return address in ac 
 53:    LDA  7,-24(7) 	call outnl
 54:    LDA  3,0(2) 	Save the result in ac 
* 14
 55:    LDC  3,666(6) 	Load constant 
 56:     ST  3,-2(1) 	Store variable x
* 15
 57:     ST  1,-4(1) 	Store old fp in ghost frame 
 58:     LD  3,-2(1) 	Load variable x
 59:     ST  3,-6(1) 	Store parameter 
 60:    LDA  1,-4(1) 	Load address of new frame 
 61:    LDA  3,1(7) 	Return address in ac 
 62:    LDA  7,-52(7) 	call output
 63:    LDA  3,0(2) 	Save the result in ac 
* 16
 64:     ST  1,-4(1) 	Store old fp in ghost frame 
 65:    LDA  1,-4(1) 	Load address of new frame 
 66:    LDA  3,1(7) 	Return address in ac 
 67:    LDA  7,-38(7) 	call outnl
 68:    LDA  3,0(2) 	Save the result in ac 
* 18
 69:     ST  1,-4(1) 	Store old fp in ghost frame 
 70:     LD  3,-2(1) 	Load variable x
 71:    LDC  4,0(6) 	Load 0 
 72:    SUB  3,4,3 	Op unary - 
 73:     ST  3,-6(1) 	Store parameter 
 74:    LDA  1,-4(1) 	Load address of new frame 
 75:    LDA  3,1(7) 	Return address in ac 
 76:    LDA  7,-66(7) 	call output
 77:    LDA  3,0(2) 	Save the result in ac 
* 19
 78:     ST  1,-4(1) 	Store old fp in ghost frame 
 79:    LDC  3,1(6) 	Load constant 
 80:    LDC  4,0(6) 	Load 0 
 81:    SUB  3,4,3 	Op unary - 
 82:     ST  3,-6(1) 	Save left side in temp 
 83:     LD  3,-2(1) 	Load variable x
 84:     LD  4,-6(1) 	Load left from temp into ac1 
 85:    MUL  3,4,3 	Op * 
 86:     ST  3,-6(1) 	Store parameter 
 87:    LDA  1,-4(1) 	Load address of new frame 
 88:    LDA  3,1(7) 	Return address in ac 
 89:    LDA  7,-79(7) 	call output
 90:    LDA  3,0(2) 	Save the result in ac 
* 20
 91:     ST  1,-4(1) 	Store old fp in ghost frame 
 92:    LDA  1,-4(1) 	Load address of new frame 
 93:    LDA  3,1(7) 	Return address in ac 
 94:    LDA  7,-65(7) 	call outnl
 95:    LDA  3,0(2) 	Save the result in ac 
* 22
 96:     ST  1,-4(1) 	Store old fp in ghost frame 
 97:    LDC  3,111(6) 	Load constant 
 98:     ST  3,-6(1) 	Save left side in temp 
 99:    LDC  3,222(6) 	Load constant 
100:     LD  4,-6(1) 	Load left from temp into ac1 
101:    ADD  3,4,3 	Op + 
102:     ST  3,-6(1) 	Save left side in temp 
103:    LDC  3,333(6) 	Load constant 
104:     LD  4,-6(1) 	Load left from temp into ac1 
105:    ADD  3,4,3 	Op + 
106:     ST  3,-6(1) 	Store parameter 
107:    LDA  1,-4(1) 	Load address of new frame 
108:    LDA  3,1(7) 	Return address in ac 
109:    LDA  7,-99(7) 	call output
110:    LDA  3,0(2) 	Save the result in ac 
* 23
111:     ST  1,-4(1) 	Store old fp in ghost frame 
112:    LDC  3,3(6) 	Load constant 
113:     ST  3,-6(1) 	Save left side in temp 
114:    LDC  3,6(6) 	Load constant 
115:     LD  4,-6(1) 	Load left from temp into ac1 
116:    MUL  3,4,3 	Op * 
117:     ST  3,-6(1) 	Save left side in temp 
118:    LDC  3,6(6) 	Load constant 
119:     ST  3,-7(1) 	Save left side in temp 
120:    LDC  3,6(6) 	Load constant 
121:     LD  4,-7(1) 	Load left from temp into ac1 
122:    MUL  3,4,3 	Op * 
123:     ST  3,-7(1) 	Save left side in temp 
124:    LDC  3,1(6) 	Load constant 
125:     LD  4,-7(1) 	Load left from temp into ac1 
126:    ADD  3,4,3 	Op + 
127:     LD  4,-6(1) 	Load left from temp into ac1 
128:    MUL  3,4,3 	Op * 
129:     ST  3,-6(1) 	Store parameter 
130:    LDA  1,-4(1) 	Load address of new frame 
131:    LDA  3,1(7) 	Return address in ac 
132:    LDA  7,-122(7) 	call output
133:    LDA  3,0(2) 	Save the result in ac 
* 24
134:     ST  1,-4(1) 	Store old fp in ghost frame 
135:    LDA  1,-4(1) 	Load address of new frame 
136:    LDA  3,1(7) 	Return address in ac 
137:    LDA  7,-108(7) 	call outnl
138:    LDA  3,0(2) 	Save the result in ac 
* 26
139:     ST  1,-4(1) 	Store old fp in ghost frame 
140:    LDA  1,-4(1) 	Load address of new frame 
141:    LDA  3,1(7) 	Return address in ac 
142:    LDA  7,-137(7) 	call input
143:    LDA  3,0(2) 	Save the result in ac 
144:     ST  3,-2(1) 	Store variable x
* 27
145:     ST  1,-4(1) 	Store old fp in ghost frame 
146:     LD  3,-2(1) 	Load variable x
147:     ST  3,-6(1) 	Store parameter 
148:    LDA  1,-4(1) 	Load address of new frame 
149:    LDA  3,1(7) 	Return address in ac 
150:    LDA  7,-140(7) 	call output
151:    LDA  3,0(2) 	Save the result in ac 
* 28
152:     ST  1,-4(1) 	Store old fp in ghost frame 
153:    LDA  1,-4(1) 	Load address of new frame 
154:    LDA  3,1(7) 	Return address in ac 
155:    LDA  7,-126(7) 	call outnl
156:    LDA  3,0(2) 	Save the result in ac 
* 30
157:     ST  1,-4(1) 	Store old fp in ghost frame 
158:    LDA  1,-4(1) 	Load address of new frame 
159:    LDA  3,1(7) 	Return address in ac 
160:    LDA  7,-143(7) 	call inputb
161:    LDA  3,0(2) 	Save the result in ac 
162:     ST  3,-3(1) 	Store variable b
* 31
163:     ST  1,-4(1) 	Store old fp in ghost frame 
164:     LD  3,-3(1) 	Load variable b
165:     ST  3,-6(1) 	Store parameter 
166:    LDA  1,-4(1) 	Load address of new frame 
167:    LDA  3,1(7) 	Return address in ac 
168:    LDA  7,-146(7) 	call outputb
169:    LDA  3,0(2) 	Save the result in ac 
* 32
170:     ST  1,-4(1) 	Store old fp in ghost frame 
171:    LDA  1,-4(1) 	Load address of new frame 
172:    LDA  3,1(7) 	Return address in ac 
173:    LDA  7,-144(7) 	call outnl
174:    LDA  3,0(2) 	Save the result in ac 
* 34
175:     ST  1,-4(1) 	Store old fp in ghost frame 
176:     ST  1,-6(1) 	Store old fp in ghost frame 
177:    LDA  1,-6(1) 	Load address of new frame 
178:    LDA  3,1(7) 	Return address in ac 
179:    LDA  7,-174(7) 	call input
180:    LDA  3,0(2) 	Save the result in ac 
181:     ST  3,-6(1) 	Save left side in temp 
182:     ST  1,-7(1) 	Store old fp in ghost frame 
183:    LDA  1,-7(1) 	Load address of new frame 
184:    LDA  3,1(7) 	Return address in ac 
185:    LDA  7,-180(7) 	call input
186:    LDA  3,0(2) 	Save the result in ac 
187:     LD  4,-6(1) 	Load left from temp into ac1 
188:    MUL  3,4,3 	Op * 
189:     ST  3,-6(1) 	Store parameter 
190:    LDA  1,-4(1) 	Load address of new frame 
191:    LDA  3,1(7) 	Return address in ac 
192:    LDA  7,-182(7) 	call output
193:    LDA  3,0(2) 	Save the result in ac 
* 35
194:     ST  1,-4(1) 	Store old fp in ghost frame 
195:    LDA  1,-4(1) 	Load address of new frame 
196:    LDA  3,1(7) 	Return address in ac 
197:    LDA  7,-168(7) 	call outnl
198:    LDA  3,0(2) 	Save the result in ac 
* 37
199:     ST  1,-4(1) 	Store old fp in ghost frame 
200:     ST  1,-6(1) 	Store old fp in ghost frame 
201:    LDA  1,-6(1) 	Load address of new frame 
202:    LDA  3,1(7) 	Return address in ac 
203:    LDA  7,-186(7) 	call inputb
204:    LDA  3,0(2) 	Save the result in ac 
205:     ST  3,-6(1) 	Save left side in temp 
206:     ST  1,-7(1) 	Store old fp in ghost frame 
207:    LDA  1,-7(1) 	Load address of new frame 
208:    LDA  3,1(7) 	Return address in ac 
209:    LDA  7,-192(7) 	call inputb
210:    LDA  3,0(2) 	Save the result in ac 
211:     LD  4,-6(1) 	Load left from temp into ac1 
212:    JEQ  3,3(7) 	Jump if false for Op && 
213:    LDC  3,0(6) 	False case 
214:    JEQ  4,1(7) 	Jump if false 
215:    LDC  3,1(6) 	True case 
216:     ST  3,-6(1) 	Store parameter 
217:    LDA  1,-4(1) 	Load address of new frame 
218:    LDA  3,1(7) 	Return address in ac 
219:    LDA  7,-197(7) 	call outputb
220:    LDA  3,0(2) 	Save the result in ac 
* 38
221:     ST  1,-4(1) 	Store old fp in ghost frame 
222:    LDA  1,-4(1) 	Load address of new frame 
223:    LDA  3,1(7) 	Return address in ac 
224:    LDA  7,-195(7) 	call outnl
225:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
226:    LDC  2,0(6) 	Set return value to 0 
227:     LD  3,-1(1) 	Load return address 
228:     LD  1,0(1) 	Adjust fp 
229:    LDA  7,0(3) 	Return 
* END of function main
