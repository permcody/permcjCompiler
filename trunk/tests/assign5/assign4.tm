* C- compiler version C-06
* Author: Robert B. Heckendorn
* Backend coauthor: Jorge Williams
* Apr 1, 2006
* BEGIN Prolog
  0:     LD  0,0(0) 	Set the global pointer 
  1:    LDA  1,-2(0) 	set first frame at end of globals 
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
* 8
 36:     LD  3,-2(1) 	Load variable x
 37:     ST  3,-4(1) 	Save left side in temp 
 38:    LDC  3,111(6) 	Load constant 
 39:     LD  4,-4(1) 	Load left from temp into ac1 
 40:    ADD  3,4,3 	Op + 
 41:     ST  3,-2(1) 	Store variable x
* 9
 42:     ST  1,-4(1) 	Store old fp in ghost frame 
 43:     LD  3,-2(1) 	Load variable x
 44:     ST  3,-6(1) 	Store parameter 
 45:    LDA  1,-4(1) 	Load address of new frame 
 46:    LDA  3,1(7) 	Return address in ac 
 47:    LDA  7,-37(7) 	call output
 48:    LDA  3,0(2) 	Save the result in ac 
* 10
 49:     LD  3,-3(1) 	Load variable y
 50:     ST  3,-4(1) 	Save left side in temp 
 51:    LDC  3,222(6) 	Load constant 
 52:     LD  4,-4(1) 	Load left from temp into ac1 
 53:    ADD  3,4,3 	Op + 
 54:     ST  3,-3(1) 	Store variable y
* 11
 55:     ST  1,-4(1) 	Store old fp in ghost frame 
 56:     LD  3,-3(1) 	Load variable y
 57:     ST  3,-6(1) 	Store parameter 
 58:    LDA  1,-4(1) 	Load address of new frame 
 59:    LDA  3,1(7) 	Return address in ac 
 60:    LDA  7,-50(7) 	call output
 61:    LDA  3,0(2) 	Save the result in ac 
* 12
 62:     ST  1,-4(1) 	Store old fp in ghost frame 
 63:    LDA  1,-4(1) 	Load address of new frame 
 64:    LDA  3,1(7) 	Return address in ac 
 65:    LDA  7,-36(7) 	call outnl
 66:    LDA  3,0(2) 	Save the result in ac 
* 14
 67:     LD  3,0(0) 	Load variable gx
 68:     ST  3,-4(1) 	Save left side in temp 
 69:    LDC  3,333(6) 	Load constant 
 70:     LD  4,-4(1) 	Load left from temp into ac1 
 71:    ADD  3,4,3 	Op + 
 72:     ST  3,0(0) 	Store variable gx
* 15
 73:     ST  1,-4(1) 	Store old fp in ghost frame 
 74:     LD  3,0(0) 	Load variable gx
 75:     ST  3,-6(1) 	Store parameter 
 76:    LDA  1,-4(1) 	Load address of new frame 
 77:    LDA  3,1(7) 	Return address in ac 
 78:    LDA  7,-68(7) 	call output
 79:    LDA  3,0(2) 	Save the result in ac 
* 16
 80:     LD  3,-1(0) 	Load variable gy
 81:     ST  3,-4(1) 	Save left side in temp 
 82:    LDC  3,444(6) 	Load constant 
 83:     LD  4,-4(1) 	Load left from temp into ac1 
 84:    ADD  3,4,3 	Op + 
 85:     ST  3,-1(0) 	Store variable gy
* 17
 86:     ST  1,-4(1) 	Store old fp in ghost frame 
 87:     LD  3,-1(0) 	Load variable gy
 88:     ST  3,-6(1) 	Store parameter 
 89:    LDA  1,-4(1) 	Load address of new frame 
 90:    LDA  3,1(7) 	Return address in ac 
 91:    LDA  7,-81(7) 	call output
 92:    LDA  3,0(2) 	Save the result in ac 
* 18
 93:     ST  1,-4(1) 	Store old fp in ghost frame 
 94:    LDA  1,-4(1) 	Load address of new frame 
 95:    LDA  3,1(7) 	Return address in ac 
 96:    LDA  7,-67(7) 	call outnl
 97:    LDA  3,0(2) 	Save the result in ac 
* 20
 98:     LD  3,-2(1) 	Load variable x
 99:     ST  3,-4(1) 	Save left side in temp 
100:     LD  3,-3(1) 	Load variable y
101:     LD  4,-4(1) 	Load left from temp into ac1 
102:    ADD  3,4,3 	Op + 
103:     ST  3,-2(1) 	Store variable x
* 21
104:     ST  1,-4(1) 	Store old fp in ghost frame 
105:     LD  3,-2(1) 	Load variable x
106:     ST  3,-6(1) 	Store parameter 
107:    LDA  1,-4(1) 	Load address of new frame 
108:    LDA  3,1(7) 	Return address in ac 
109:    LDA  7,-99(7) 	call output
110:    LDA  3,0(2) 	Save the result in ac 
* 22
111:     ST  1,-4(1) 	Store old fp in ghost frame 
112:    LDA  1,-4(1) 	Load address of new frame 
113:    LDA  3,1(7) 	Return address in ac 
114:    LDA  7,-85(7) 	call outnl
115:    LDA  3,0(2) 	Save the result in ac 
* 24
116:     LD  3,0(0) 	Load variable gx
117:     ST  3,-4(1) 	Save left side in temp 
118:     LD  3,-1(0) 	Load variable gy
119:     LD  4,-4(1) 	Load left from temp into ac1 
120:    ADD  3,4,3 	Op + 
121:     ST  3,0(0) 	Store variable gx
* 25
122:     ST  1,-4(1) 	Store old fp in ghost frame 
123:     LD  3,0(0) 	Load variable gx
124:     ST  3,-6(1) 	Store parameter 
125:    LDA  1,-4(1) 	Load address of new frame 
126:    LDA  3,1(7) 	Return address in ac 
127:    LDA  7,-117(7) 	call output
128:    LDA  3,0(2) 	Save the result in ac 
* 26
129:     ST  1,-4(1) 	Store old fp in ghost frame 
130:    LDA  1,-4(1) 	Load address of new frame 
131:    LDA  3,1(7) 	Return address in ac 
132:    LDA  7,-103(7) 	call outnl
133:    LDA  3,0(2) 	Save the result in ac 
* 30
134:     LD  3,-2(1) 	Load variable x
135:     ST  3,-4(1) 	Save left side in temp 
136:    LDC  3,111(6) 	Load constant 
137:     LD  4,-4(1) 	Load left from temp into ac1 
138:    SUB  3,4,3 	Op - 
139:     ST  3,-2(1) 	Store variable x
* 31
140:     ST  1,-4(1) 	Store old fp in ghost frame 
141:     LD  3,-2(1) 	Load variable x
142:     ST  3,-6(1) 	Store parameter 
143:    LDA  1,-4(1) 	Load address of new frame 
144:    LDA  3,1(7) 	Return address in ac 
145:    LDA  7,-135(7) 	call output
146:    LDA  3,0(2) 	Save the result in ac 
* 32
147:     LD  3,-3(1) 	Load variable y
148:     ST  3,-4(1) 	Save left side in temp 
149:    LDC  3,222(6) 	Load constant 
150:     LD  4,-4(1) 	Load left from temp into ac1 
151:    SUB  3,4,3 	Op - 
152:     ST  3,-3(1) 	Store variable y
* 33
153:     ST  1,-4(1) 	Store old fp in ghost frame 
154:     LD  3,-3(1) 	Load variable y
155:     ST  3,-6(1) 	Store parameter 
156:    LDA  1,-4(1) 	Load address of new frame 
157:    LDA  3,1(7) 	Return address in ac 
158:    LDA  7,-148(7) 	call output
159:    LDA  3,0(2) 	Save the result in ac 
* 34
160:     ST  1,-4(1) 	Store old fp in ghost frame 
161:    LDA  1,-4(1) 	Load address of new frame 
162:    LDA  3,1(7) 	Return address in ac 
163:    LDA  7,-134(7) 	call outnl
164:    LDA  3,0(2) 	Save the result in ac 
* 36
165:     LD  3,0(0) 	Load variable gx
166:     ST  3,-4(1) 	Save left side in temp 
167:    LDC  3,333(6) 	Load constant 
168:     LD  4,-4(1) 	Load left from temp into ac1 
169:    SUB  3,4,3 	Op - 
170:     ST  3,0(0) 	Store variable gx
* 37
171:     ST  1,-4(1) 	Store old fp in ghost frame 
172:     LD  3,0(0) 	Load variable gx
173:     ST  3,-6(1) 	Store parameter 
174:    LDA  1,-4(1) 	Load address of new frame 
175:    LDA  3,1(7) 	Return address in ac 
176:    LDA  7,-166(7) 	call output
177:    LDA  3,0(2) 	Save the result in ac 
* 38
178:     LD  3,-1(0) 	Load variable gy
179:     ST  3,-4(1) 	Save left side in temp 
180:    LDC  3,444(6) 	Load constant 
181:     LD  4,-4(1) 	Load left from temp into ac1 
182:    SUB  3,4,3 	Op - 
183:     ST  3,-1(0) 	Store variable gy
* 39
184:     ST  1,-4(1) 	Store old fp in ghost frame 
185:     LD  3,-1(0) 	Load variable gy
186:     ST  3,-6(1) 	Store parameter 
187:    LDA  1,-4(1) 	Load address of new frame 
188:    LDA  3,1(7) 	Return address in ac 
189:    LDA  7,-179(7) 	call output
190:    LDA  3,0(2) 	Save the result in ac 
* 40
191:     ST  1,-4(1) 	Store old fp in ghost frame 
192:    LDA  1,-4(1) 	Load address of new frame 
193:    LDA  3,1(7) 	Return address in ac 
194:    LDA  7,-165(7) 	call outnl
195:    LDA  3,0(2) 	Save the result in ac 
* 42
196:     LD  3,-2(1) 	Load variable x
197:     ST  3,-4(1) 	Save left side in temp 
198:     LD  3,-3(1) 	Load variable y
199:     LD  4,-4(1) 	Load left from temp into ac1 
200:    SUB  3,4,3 	Op - 
201:     ST  3,-2(1) 	Store variable x
* 43
202:     ST  1,-4(1) 	Store old fp in ghost frame 
203:     LD  3,-2(1) 	Load variable x
204:     ST  3,-6(1) 	Store parameter 
205:    LDA  1,-4(1) 	Load address of new frame 
206:    LDA  3,1(7) 	Return address in ac 
207:    LDA  7,-197(7) 	call output
208:    LDA  3,0(2) 	Save the result in ac 
* 44
209:     ST  1,-4(1) 	Store old fp in ghost frame 
210:    LDA  1,-4(1) 	Load address of new frame 
211:    LDA  3,1(7) 	Return address in ac 
212:    LDA  7,-183(7) 	call outnl
213:    LDA  3,0(2) 	Save the result in ac 
* 46
214:     LD  3,0(0) 	Load variable gx
215:     ST  3,-4(1) 	Save left side in temp 
216:     LD  3,-1(0) 	Load variable gy
217:     LD  4,-4(1) 	Load left from temp into ac1 
218:    SUB  3,4,3 	Op - 
219:     ST  3,0(0) 	Store variable gx
* 47
220:     ST  1,-4(1) 	Store old fp in ghost frame 
221:     LD  3,0(0) 	Load variable gx
222:     ST  3,-6(1) 	Store parameter 
223:    LDA  1,-4(1) 	Load address of new frame 
224:    LDA  3,1(7) 	Return address in ac 
225:    LDA  7,-215(7) 	call output
226:    LDA  3,0(2) 	Save the result in ac 
* 48
227:     ST  1,-4(1) 	Store old fp in ghost frame 
228:    LDA  1,-4(1) 	Load address of new frame 
229:    LDA  3,1(7) 	Return address in ac 
230:    LDA  7,-201(7) 	call outnl
231:    LDA  3,0(2) 	Save the result in ac 
* RETURN
232:    LDA  2,0(3) 	Copy result to rt register 
233:     LD  3,-1(1) 	Load return address 
234:     LD  1,0(1) 	Adjust fp 
235:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
236:    LDC  2,0(6) 	Set return value to 0 
237:     LD  3,-1(1) 	Load return address 
238:     LD  1,0(1) 	Adjust fp 
239:    LDA  7,0(3) 	Return 
* END of function main
