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
* 8
 36:    LDC  3,200(6) 	Load constant 
 37:     ST  3,-2(1) 	Store variable max
* 10
 38:    LDC  3,2(6) 	Load constant 
 39:     ST  3,-3(1) 	Store variable k
* WHILE
 40:     LD  3,-3(1) 	Load variable k
 41:     ST  3,-405(1) 	Save left side in temp 
 42:     LD  3,-2(1) 	Load variable max
 43:     LD  4,-405(1) 	Load left from temp into ac1 
 44:    SUB  4,4,3 	Op <= 
 45:    LDC  3,1(6) 	True case 
 46:    JLE  4,1(7) 	Jump if true 
 47:    LDC  3,0(6) 	False case 
 48:    LDC  4,1(6) 	Load constant 1 
 49:    SUB  3,3,4 	While cond check 
 50:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 11
 52:     LD  3,-3(1) 	Load variable k
 53:     ST  3,-405(1) 	Save index in temp 
 54:    LDC  3,1(6) 	Load constant 
 55:     LD  4,-405(1) 	load index from temp to ac1 
 56:    LDA  5,-4(1) 	Load address of base of array n
 57:    SUB  5,5,4 	Compute offset of value 
 58:     ST  3,0(5) 	Store variable n
* 11
 59:     LD  3,-3(1) 	Load variable k
 60:     ST  3,-405(1) 	Save left side in temp 
 61:    LDC  3,1(6) 	Load constant 
 62:     LD  4,-405(1) 	Load left from temp into ac1 
 63:    ADD  3,4,3 	Op + 
 64:     ST  3,-3(1) 	Store variable k
* END compound statement
 65:    LDA  7,-26(7) 	go to beginning of loop 
 51:    LDA  7,14(7) 	No more loop 
* ENDWHILE
* WHILE
 66:     LD  3,-3(1) 	Load variable k
 67:     ST  3,-405(1) 	Save left side in temp 
 68:     LD  3,-2(1) 	Load variable max
 69:     LD  4,-405(1) 	Load left from temp into ac1 
 70:    SUB  4,4,3 	Op <= 
 71:    LDC  3,1(6) 	True case 
 72:    JLE  4,1(7) 	Jump if true 
 73:    LDC  3,0(6) 	False case 
 74:    LDC  4,1(6) 	Load constant 1 
 75:    SUB  3,3,4 	While cond check 
 76:    JGE  3,1(7) 	Jump to while part 
* DO
* 12
 78:     LD  3,-3(1) 	Load variable k
 79:     ST  3,-405(1) 	Save left side in temp 
 80:    LDC  3,1(6) 	Load constant 
 81:     LD  4,-405(1) 	Load left from temp into ac1 
 82:    ADD  3,4,3 	Op + 
 83:     ST  3,-3(1) 	Store variable k
 84:    LDA  7,-19(7) 	go to beginning of loop 
 77:    LDA  7,7(7) 	No more loop 
* ENDWHILE
* WHILE
 85:     LD  3,-3(1) 	Load variable k
 86:     ST  3,-405(1) 	Save left side in temp 
 87:     LD  3,-2(1) 	Load variable max
 88:     LD  4,-405(1) 	Load left from temp into ac1 
 89:    SUB  4,4,3 	Op <= 
 90:    LDC  3,1(6) 	True case 
 91:    JLE  4,1(7) 	Jump if true 
 92:    LDC  3,0(6) 	False case 
 93:    LDC  4,1(6) 	Load constant 1 
 94:    SUB  3,3,4 	While cond check 
 95:    JGE  3,1(7) 	Jump to while part 
* DO
 97:    LDA  7,-13(7) 	go to beginning of loop 
 96:    LDA  7,1(7) 	No more loop 
* ENDWHILE
* 15
 98:    LDC  3,2(6) 	Load constant 
 99:     ST  3,-3(1) 	Store variable k
* WHILE
100:     LD  3,-3(1) 	Load variable k
101:     ST  3,-405(1) 	Save left side in temp 
102:     LD  3,-3(1) 	Load variable k
103:     LD  4,-405(1) 	Load left from temp into ac1 
104:    MUL  3,4,3 	Op * 
105:     ST  3,-405(1) 	Save left side in temp 
106:     LD  3,-2(1) 	Load variable max
107:     LD  4,-405(1) 	Load left from temp into ac1 
108:    SUB  4,4,3 	Op <= 
109:    LDC  3,1(6) 	True case 
110:    JLE  4,1(7) 	Jump if true 
111:    LDC  3,0(6) 	False case 
112:    LDC  4,1(6) 	Load constant 1 
113:    SUB  3,3,4 	While cond check 
114:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 19
116:     LD  3,-3(1) 	Load variable k
117:     ST  3,-405(1) 	Save left side in temp 
118:     LD  3,-3(1) 	Load variable k
119:     LD  4,-405(1) 	Load left from temp into ac1 
120:    MUL  3,4,3 	Op * 
121:     ST  3,-404(1) 	Store variable j
* WHILE
122:     LD  3,-404(1) 	Load variable j
123:     ST  3,-405(1) 	Save left side in temp 
124:     LD  3,-2(1) 	Load variable max
125:     LD  4,-405(1) 	Load left from temp into ac1 
126:    SUB  4,4,3 	Op <= 
127:    LDC  3,1(6) 	True case 
128:    JLE  4,1(7) 	Jump if true 
129:    LDC  3,0(6) 	False case 
130:    LDC  4,1(6) 	Load constant 1 
131:    SUB  3,3,4 	While cond check 
132:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 21
134:     LD  3,-404(1) 	Load variable j
135:     ST  3,-405(1) 	Save index in temp 
136:    LDC  3,0(6) 	Load constant 
137:     LD  4,-405(1) 	load index from temp to ac1 
138:    LDA  5,-4(1) 	Load address of base of array n
139:    SUB  5,5,4 	Compute offset of value 
140:     ST  3,0(5) 	Store variable n
* 22
141:     LD  3,-404(1) 	Load variable j
142:     ST  3,-405(1) 	Save left side in temp 
143:     LD  3,-3(1) 	Load variable k
144:     LD  4,-405(1) 	Load left from temp into ac1 
145:    ADD  3,4,3 	Op + 
146:     ST  3,-404(1) 	Store variable j
* END compound statement
147:    LDA  7,-26(7) 	go to beginning of loop 
133:    LDA  7,14(7) 	No more loop 
* ENDWHILE
* 24
148:     LD  3,-3(1) 	Load variable k
149:     ST  3,-405(1) 	Save left side in temp 
150:    LDC  3,1(6) 	Load constant 
151:     LD  4,-405(1) 	Load left from temp into ac1 
152:    ADD  3,4,3 	Op + 
153:     ST  3,-3(1) 	Store variable k
* WHILE
154:     LD  3,-3(1) 	Load variable k
155:     ST  3,-405(1) 	Save left side in temp 
156:     LD  3,-2(1) 	Load variable max
157:     LD  4,-405(1) 	Load left from temp into ac1 
158:    SUB  4,4,3 	Op <= 
159:    LDC  3,1(6) 	True case 
160:    JLE  4,1(7) 	Jump if true 
161:    LDC  3,0(6) 	False case 
162:     ST  3,-405(1) 	Save left side in temp 
163:     LD  3,-3(1) 	Load variable k
164:    LDA  4,-4(1) 	Load address of base of array n
165:    SUB  3,4,3 	Compute offset of value 
166:     LD  3,0(3) 	Load the value 
167:    LDC  4,1(6) 	Load 1 
168:    SUB  3,4,3 	Op ! 
169:     LD  4,-405(1) 	Load left from temp into ac1 
170:    JEQ  3,3(7) 	Jump if false for Op && 
171:    LDC  3,0(6) 	False case 
172:    JEQ  4,1(7) 	Jump if false 
173:    LDC  3,1(6) 	True case 
174:    LDC  4,1(6) 	Load constant 1 
175:    SUB  3,3,4 	While cond check 
176:    JGE  3,1(7) 	Jump to while part 
* DO
* 25
178:     LD  3,-3(1) 	Load variable k
179:     ST  3,-405(1) 	Save left side in temp 
180:    LDC  3,1(6) 	Load constant 
181:     LD  4,-405(1) 	Load left from temp into ac1 
182:    ADD  3,4,3 	Op + 
183:     ST  3,-3(1) 	Store variable k
184:    LDA  7,-31(7) 	go to beginning of loop 
177:    LDA  7,7(7) 	No more loop 
* ENDWHILE
* END compound statement
185:    LDA  7,-86(7) 	go to beginning of loop 
115:    LDA  7,70(7) 	No more loop 
* ENDWHILE
* 28
186:    LDC  3,2(6) 	Load constant 
187:     ST  3,-3(1) 	Store variable k
* WHILE
188:     LD  3,-3(1) 	Load variable k
189:     ST  3,-405(1) 	Save left side in temp 
190:     LD  3,-2(1) 	Load variable max
191:     LD  4,-405(1) 	Load left from temp into ac1 
192:    SUB  4,4,3 	Op <= 
193:    LDC  3,1(6) 	True case 
194:    JLE  4,1(7) 	Jump if true 
195:    LDC  3,0(6) 	False case 
196:    LDC  4,1(6) 	Load constant 1 
197:    SUB  3,3,4 	While cond check 
198:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* IF
200:     LD  3,-3(1) 	Load variable k
201:    LDA  4,-4(1) 	Load address of base of array n
202:    SUB  3,4,3 	Compute offset of value 
203:     LD  3,0(3) 	Load the value 
204:    LDC  4,1(6) 	Load constant 1 
205:    SUB  3,3,4 	If cond check 
206:    JGE  3,1(7) 	Jump to then part 
* THEN
* BEGIN compound statement
* 31
208:     ST  1,-405(1) 	Store old fp in ghost frame 
209:     LD  3,-3(1) 	Load variable k
210:     ST  3,-407(1) 	Store parameter 
211:    LDA  1,-405(1) 	Load address of new frame 
212:    LDA  3,1(7) 	Return address in ac 
213:    LDA  7,-203(7) 	call output
214:    LDA  3,0(2) 	Save the result in ac 
* 32
215:     ST  1,-405(1) 	Store old fp in ghost frame 
216:    LDA  1,-405(1) 	Load address of new frame 
217:    LDA  3,1(7) 	Return address in ac 
218:    LDA  7,-189(7) 	call outnl
219:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
207:    LDA  7,12(7) 	Jump around the THEN 
* ENDIF
* 34
220:     LD  3,-3(1) 	Load variable k
221:     ST  3,-405(1) 	Save left side in temp 
222:    LDC  3,1(6) 	Load constant 
223:     LD  4,-405(1) 	Load left from temp into ac1 
224:    ADD  3,4,3 	Op + 
225:     ST  3,-3(1) 	Store variable k
* END compound statement
226:    LDA  7,-39(7) 	go to beginning of loop 
199:    LDA  7,27(7) 	No more loop 
* ENDWHILE
* 36
227:     ST  1,-405(1) 	Store old fp in ghost frame 
228:    LDA  1,-405(1) 	Load address of new frame 
229:    LDA  3,1(7) 	Return address in ac 
230:    LDA  7,-201(7) 	call outnl
231:    LDA  3,0(2) 	Save the result in ac 
* RETURN
232:    LDC  3,0(6) 	Load constant 
233:    LDA  2,0(3) 	Copy result to rt register 
234:     LD  3,-1(1) 	Load return address 
235:     LD  1,0(1) 	Adjust fp 
236:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
237:    LDC  2,0(6) 	Set return value to 0 
238:     LD  3,-1(1) 	Load return address 
239:     LD  1,0(1) 	Adjust fp 
240:    LDA  7,0(3) 	Return 
* END of function main
