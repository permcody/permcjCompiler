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
* BEGIN function show
 35:     ST  3,-1(1) 	Store return address. BEGIN FUNC: show
* BEGIN compound statement
* 5
 36:     ST  1,-4(1) 	Store old fp in ghost frame 
 37:     LD  3,-3(1) 	Load variable n
 38:     LD  4,-2(1) 	Load address of base of array z
 39:    SUB  3,4,3 	Compute offset of value 
 40:     LD  3,0(3) 	Load the value 
 41:     ST  3,-6(1) 	Store parameter 
 42:    LDA  1,-4(1) 	Load address of new frame 
 43:    LDA  3,1(7) 	Return address in ac 
 44:    LDA  7,-34(7) 	call output
 45:    LDA  3,0(2) 	Save the result in ac 
* RETURN
 46:     LD  3,-3(1) 	Load variable n
 47:     LD  4,-2(1) 	Load address of base of array z
 48:    SUB  3,4,3 	Compute offset of value 
 49:     LD  3,0(3) 	Load the value 
 50:    LDA  2,0(3) 	Copy result to rt register 
 51:     LD  3,-1(1) 	Load return address 
 52:     LD  1,0(1) 	Adjust fp 
 53:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
 54:    LDC  2,0(6) 	Set return value to 0 
 55:     LD  3,-1(1) 	Load return address 
 56:     LD  1,0(1) 	Adjust fp 
 57:    LDA  7,0(3) 	Return 
* END of function show
* BEGIN function main
  4:    LDA  7,53(7) 	Jump to main 
 58:     ST  3,-1(1) 	Store return address. BEGIN FUNC: main
* BEGIN compound statement
* 13
 59:    LDC  3,1(6) 	Load constant 
 60:     ST  3,-6(1) 	Save index in temp 
 61:    LDC  3,666(6) 	Load constant 
 62:     LD  4,-6(1) 	load index from temp to ac1 
 63:    LDA  5,0(0) 	Load address of base of array g
 64:    SUB  5,5,4 	Compute offset of value 
 65:     ST  3,0(5) 	Store variable g
* 14
 66:    LDC  3,1(6) 	Load constant 
 67:     ST  3,-6(1) 	Save index in temp 
 68:    LDC  3,777(6) 	Load constant 
 69:     LD  4,-6(1) 	load index from temp to ac1 
 70:    LDA  5,-2(1) 	Load address of base of array a
 71:    SUB  5,5,4 	Compute offset of value 
 72:     ST  3,0(5) 	Store variable a
* 16
 73:     ST  1,-6(1) 	Store old fp in ghost frame 
 74:    LDC  3,1(6) 	Load constant 
 75:    LDA  4,-2(1) 	Load address of base of array a
 76:    SUB  3,4,3 	Compute offset of value 
 77:     LD  3,0(3) 	Load the value 
 78:     ST  3,-8(1) 	Store parameter 
 79:    LDA  1,-6(1) 	Load address of new frame 
 80:    LDA  3,1(7) 	Return address in ac 
 81:    LDA  7,-71(7) 	call output
 82:    LDA  3,0(2) 	Save the result in ac 
* 17
 83:     ST  1,-6(1) 	Store old fp in ghost frame 
 84:    LDC  3,1(6) 	Load constant 
 85:    LDA  4,0(0) 	Load address of base of array g
 86:    SUB  3,4,3 	Compute offset of value 
 87:     LD  3,0(3) 	Load the value 
 88:     ST  3,-8(1) 	Store parameter 
 89:    LDA  1,-6(1) 	Load address of new frame 
 90:    LDA  3,1(7) 	Return address in ac 
 91:    LDA  7,-81(7) 	call output
 92:    LDA  3,0(2) 	Save the result in ac 
* 18
 93:     ST  1,-6(1) 	Store old fp in ghost frame 
 94:    LDA  1,-6(1) 	Load address of new frame 
 95:    LDA  3,1(7) 	Return address in ac 
 96:    LDA  7,-67(7) 	call outnl
 97:    LDA  3,0(2) 	Save the result in ac 
* 20
 98:     ST  1,-6(1) 	Store old fp in ghost frame 
 99:    LDA  3,-2(1) 	Load address of base of array a
100:     ST  3,-8(1) 	Store parameter 
101:    LDC  3,1(6) 	Load constant 
102:     ST  3,-9(1) 	Store parameter 
103:    LDA  1,-6(1) 	Load address of new frame 
104:    LDA  3,1(7) 	Return address in ac 
105:    LDA  7,-71(7) 	call show
106:    LDA  3,0(2) 	Save the result in ac 
* 21
107:     ST  1,-6(1) 	Store old fp in ghost frame 
108:    LDA  3,0(0) 	Load address of base of array g
109:     ST  3,-8(1) 	Store parameter 
110:    LDC  3,1(6) 	Load constant 
111:     ST  3,-9(1) 	Store parameter 
112:    LDA  1,-6(1) 	Load address of new frame 
113:    LDA  3,1(7) 	Return address in ac 
114:    LDA  7,-80(7) 	call show
115:    LDA  3,0(2) 	Save the result in ac 
* 22
116:     ST  1,-6(1) 	Store old fp in ghost frame 
117:    LDA  1,-6(1) 	Load address of new frame 
118:    LDA  3,1(7) 	Return address in ac 
119:    LDA  7,-90(7) 	call outnl
120:    LDA  3,0(2) 	Save the result in ac 
* 24
121:     ST  1,-6(1) 	Store old fp in ghost frame 
122:     ST  1,-8(1) 	Store old fp in ghost frame 
123:    LDA  3,-2(1) 	Load address of base of array a
124:     ST  3,-10(1) 	Store parameter 
125:    LDC  3,1(6) 	Load constant 
126:     ST  3,-11(1) 	Store parameter 
127:    LDA  1,-8(1) 	Load address of new frame 
128:    LDA  3,1(7) 	Return address in ac 
129:    LDA  7,-95(7) 	call show
130:    LDA  3,0(2) 	Save the result in ac 
131:     ST  3,-8(1) 	Store parameter 
132:    LDA  1,-6(1) 	Load address of new frame 
133:    LDA  3,1(7) 	Return address in ac 
134:    LDA  7,-124(7) 	call output
135:    LDA  3,0(2) 	Save the result in ac 
* 25
136:     ST  1,-6(1) 	Store old fp in ghost frame 
137:     ST  1,-8(1) 	Store old fp in ghost frame 
138:    LDA  3,0(0) 	Load address of base of array g
139:     ST  3,-10(1) 	Store parameter 
140:    LDC  3,1(6) 	Load constant 
141:     ST  3,-11(1) 	Store parameter 
142:    LDA  1,-8(1) 	Load address of new frame 
143:    LDA  3,1(7) 	Return address in ac 
144:    LDA  7,-110(7) 	call show
145:    LDA  3,0(2) 	Save the result in ac 
146:     ST  3,-8(1) 	Store parameter 
147:    LDA  1,-6(1) 	Load address of new frame 
148:    LDA  3,1(7) 	Return address in ac 
149:    LDA  7,-139(7) 	call output
150:    LDA  3,0(2) 	Save the result in ac 
* 26
151:     ST  1,-6(1) 	Store old fp in ghost frame 
152:    LDA  1,-6(1) 	Load address of new frame 
153:    LDA  3,1(7) 	Return address in ac 
154:    LDA  7,-125(7) 	call outnl
155:    LDA  3,0(2) 	Save the result in ac 
* 28
156:    LDC  3,1(6) 	Load constant 
157:     ST  3,-6(1) 	Save index in temp 
158:    LDC  3,1(6) 	Load constant 
159:    LDA  4,0(0) 	Load address of base of array g
160:    SUB  3,4,3 	Compute offset of value 
161:     LD  3,0(3) 	Load the value 
162:     ST  3,-7(1) 	Save left side in temp 
163:    LDC  3,4(6) 	Load constant 
164:     LD  4,-7(1) 	Load left from temp into ac1 
165:    ADD  3,4,3 	Op + 
166:     LD  4,-6(1) 	load index from temp to ac1 
167:    LDA  5,0(0) 	Load address of base of array g
168:    SUB  5,5,4 	Compute offset of value 
169:     ST  3,0(5) 	Store variable g
* 29
170:    LDC  3,1(6) 	Load constant 
171:     ST  3,-6(1) 	Save index in temp 
172:    LDC  3,1(6) 	Load constant 
173:    LDA  4,-2(1) 	Load address of base of array a
174:    SUB  3,4,3 	Compute offset of value 
175:     LD  3,0(3) 	Load the value 
176:     ST  3,-7(1) 	Save left side in temp 
177:    LDC  3,3(6) 	Load constant 
178:     LD  4,-7(1) 	Load left from temp into ac1 
179:    ADD  3,4,3 	Op + 
180:     LD  4,-6(1) 	load index from temp to ac1 
181:    LDA  5,-2(1) 	Load address of base of array a
182:    SUB  5,5,4 	Compute offset of value 
183:     ST  3,0(5) 	Store variable a
* 31
184:     ST  1,-6(1) 	Store old fp in ghost frame 
185:    LDC  3,1(6) 	Load constant 
186:    LDA  4,-2(1) 	Load address of base of array a
187:    SUB  3,4,3 	Compute offset of value 
188:     LD  3,0(3) 	Load the value 
189:     ST  3,-8(1) 	Store parameter 
190:    LDA  1,-6(1) 	Load address of new frame 
191:    LDA  3,1(7) 	Return address in ac 
192:    LDA  7,-182(7) 	call output
193:    LDA  3,0(2) 	Save the result in ac 
* 32
194:     ST  1,-6(1) 	Store old fp in ghost frame 
195:    LDC  3,1(6) 	Load constant 
196:    LDA  4,0(0) 	Load address of base of array g
197:    SUB  3,4,3 	Compute offset of value 
198:     LD  3,0(3) 	Load the value 
199:     ST  3,-8(1) 	Store parameter 
200:    LDA  1,-6(1) 	Load address of new frame 
201:    LDA  3,1(7) 	Return address in ac 
202:    LDA  7,-192(7) 	call output
203:    LDA  3,0(2) 	Save the result in ac 
* 33
204:     ST  1,-6(1) 	Store old fp in ghost frame 
205:    LDA  1,-6(1) 	Load address of new frame 
206:    LDA  3,1(7) 	Return address in ac 
207:    LDA  7,-178(7) 	call outnl
208:    LDA  3,0(2) 	Save the result in ac 
* 35
209:     ST  1,-6(1) 	Store old fp in ghost frame 
210:    LDC  3,1(6) 	Load constant 
211:     ST  3,-8(1) 	Save index in temp 
212:    LDC  3,1(6) 	Load constant 
213:    LDA  4,-2(1) 	Load address of base of array a
214:    SUB  3,4,3 	Compute offset of value 
215:     LD  3,0(3) 	Load the value 
216:     ST  3,-9(1) 	Save left side in temp 
217:    LDC  3,100(6) 	Load constant 
218:     LD  4,-9(1) 	Load left from temp into ac1 
219:    ADD  3,4,3 	Op + 
220:     LD  4,-8(1) 	load index from temp to ac1 
221:    LDA  5,-2(1) 	Load address of base of array a
222:    SUB  5,5,4 	Compute offset of value 
223:     ST  3,0(5) 	Store variable a
224:     ST  3,-8(1) 	Store parameter 
225:    LDA  1,-6(1) 	Load address of new frame 
226:    LDA  3,1(7) 	Return address in ac 
227:    LDA  7,-217(7) 	call output
228:    LDA  3,0(2) 	Save the result in ac 
* 36
229:     ST  1,-6(1) 	Store old fp in ghost frame 
230:    LDC  3,1(6) 	Load constant 
231:     ST  3,-8(1) 	Save index in temp 
232:    LDC  3,1(6) 	Load constant 
233:    LDA  4,0(0) 	Load address of base of array g
234:    SUB  3,4,3 	Compute offset of value 
235:     LD  3,0(3) 	Load the value 
236:     ST  3,-9(1) 	Save left side in temp 
237:    LDC  3,100(6) 	Load constant 
238:     LD  4,-9(1) 	Load left from temp into ac1 
239:    ADD  3,4,3 	Op + 
240:     LD  4,-8(1) 	load index from temp to ac1 
241:    LDA  5,0(0) 	Load address of base of array g
242:    SUB  5,5,4 	Compute offset of value 
243:     ST  3,0(5) 	Store variable g
244:     ST  3,-8(1) 	Store parameter 
245:    LDA  1,-6(1) 	Load address of new frame 
246:    LDA  3,1(7) 	Return address in ac 
247:    LDA  7,-237(7) 	call output
248:    LDA  3,0(2) 	Save the result in ac 
* 37
249:     ST  1,-6(1) 	Store old fp in ghost frame 
250:    LDA  1,-6(1) 	Load address of new frame 
251:    LDA  3,1(7) 	Return address in ac 
252:    LDA  7,-223(7) 	call outnl
253:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
254:    LDC  2,0(6) 	Set return value to 0 
255:     LD  3,-1(1) 	Load return address 
256:     LD  1,0(1) 	Adjust fp 
257:    LDA  7,0(3) 	Return 
* END of function main
