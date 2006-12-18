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
* 13
 36:    LDC  3,1(6) 	Load constant 
 37:     ST  3,-2(1) 	Store variable a
* 14
 38:    LDC  3,1(6) 	Load constant 
 39:     ST  3,-4(1) 	Store variable aa
* 15
 40:    LDC  3,0(6) 	Load constant 
 41:     ST  3,-6(1) 	Store variable c
* WHILE
 42:     LD  3,-6(1) 	Load variable c
 43:     ST  3,-8(1) 	Save left side in temp 
 44:    LDC  3,50(6) 	Load constant 
 45:     LD  4,-8(1) 	Load left from temp into ac1 
 46:    SUB  4,4,3 	Op < 
 47:    LDC  3,1(6) 	True case 
 48:    JLT  4,1(7) 	Jump if true 
 49:    LDC  3,0(6) 	False case 
 50:    LDC  4,1(6) 	Load constant 1 
 51:    SUB  3,3,4 	While cond check 
 52:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 17
 54:    LDC  3,1(6) 	Load constant 
 55:     ST  3,-7(1) 	Store variable cc
 56:     ST  3,-6(1) 	Store variable c
* 18
 57:    LDC  3,1(6) 	Load constant 
 58:     ST  3,-3(1) 	Store variable b
* 19
 59:    LDC  3,1(6) 	Load constant 
 60:     ST  3,-5(1) 	Store variable bb
* WHILE
 61:     LD  3,-3(1) 	Load variable b
 62:     ST  3,-8(1) 	Save left side in temp 
 63:     LD  3,-2(1) 	Load variable a
 64:     LD  4,-8(1) 	Load left from temp into ac1 
 65:    SUB  4,4,3 	Op <= 
 66:    LDC  3,1(6) 	True case 
 67:    JLE  4,1(7) 	Jump if true 
 68:    LDC  3,0(6) 	False case 
 69:    LDC  4,1(6) 	Load constant 1 
 70:    SUB  3,3,4 	While cond check 
 71:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* IF
 73:     LD  3,-4(1) 	Load variable aa
 74:     ST  3,-8(1) 	Save left side in temp 
 75:     LD  3,-5(1) 	Load variable bb
 76:     LD  4,-8(1) 	Load left from temp into ac1 
 77:    ADD  3,4,3 	Op + 
 78:     ST  3,-8(1) 	Save left side in temp 
 79:    LDC  3,2(6) 	Load constant 
 80:     LD  4,-8(1) 	Load left from temp into ac1 
 81:    DIV  3,4,3 	Op / 
 82:     ST  3,-8(1) 	Save left side in temp 
 83:    LDC  3,2(6) 	Load constant 
 84:     LD  4,-8(1) 	Load left from temp into ac1 
 85:    DIV  5,4,3 	Op % 
 86:    MUL  5,5,3 	 
 87:    SUB  3,4,5 	 
 88:     ST  3,-8(1) 	Save left side in temp 
 89:    LDC  3,0(6) 	Load constant 
 90:     LD  4,-8(1) 	Load left from temp into ac1 
 91:    SUB  4,4,3 	Op == 
 92:    LDC  3,1(6) 	True case 
 93:    JEQ  4,1(7) 	Jump if true 
 94:    LDC  3,0(6) 	False case 
 95:    LDC  4,1(6) 	Load constant 1 
 96:    SUB  3,3,4 	If cond check 
 97:    JGE  3,1(7) 	Jump to then part 
* THEN
* BEGIN compound statement
* WHILE
 99:     LD  3,-7(1) 	Load variable cc
100:     ST  3,-8(1) 	Save left side in temp 
101:     LD  3,-4(1) 	Load variable aa
102:     ST  3,-9(1) 	Save left side in temp 
103:     LD  3,-5(1) 	Load variable bb
104:     LD  4,-9(1) 	Load left from temp into ac1 
105:    ADD  3,4,3 	Op + 
106:     LD  4,-8(1) 	Load left from temp into ac1 
107:    SUB  4,4,3 	Op < 
108:    LDC  3,1(6) 	True case 
109:    JLT  4,1(7) 	Jump if true 
110:    LDC  3,0(6) 	False case 
111:    LDC  4,1(6) 	Load constant 1 
112:    SUB  3,3,4 	While cond check 
113:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 23
115:     LD  3,-6(1) 	Load variable c
116:     ST  3,-8(1) 	Save left side in temp 
117:    LDC  3,1(6) 	Load constant 
118:     LD  4,-8(1) 	Load left from temp into ac1 
119:    ADD  3,4,3 	Op + 
120:     ST  3,-6(1) 	Store variable c
* 24
121:     LD  3,-7(1) 	Load variable cc
122:     ST  3,-8(1) 	Save left side in temp 
123:    LDC  3,2(6) 	Load constant 
124:     ST  3,-9(1) 	Save left side in temp 
125:     LD  3,-6(1) 	Load variable c
126:     LD  4,-9(1) 	Load left from temp into ac1 
127:    MUL  3,4,3 	Op * 
128:     LD  4,-8(1) 	Load left from temp into ac1 
129:    ADD  3,4,3 	Op + 
130:     ST  3,-8(1) 	Save left side in temp 
131:    LDC  3,1(6) 	Load constant 
132:     LD  4,-8(1) 	Load left from temp into ac1 
133:    SUB  3,4,3 	Op - 
134:     ST  3,-7(1) 	Store variable cc
* END compound statement
135:    LDA  7,-37(7) 	go to beginning of loop 
114:    LDA  7,21(7) 	No more loop 
* ENDWHILE
* IF
136:     LD  3,-4(1) 	Load variable aa
137:     ST  3,-8(1) 	Save left side in temp 
138:     LD  3,-5(1) 	Load variable bb
139:     LD  4,-8(1) 	Load left from temp into ac1 
140:    ADD  3,4,3 	Op + 
141:     ST  3,-8(1) 	Save left side in temp 
142:     LD  3,-7(1) 	Load variable cc
143:     LD  4,-8(1) 	Load left from temp into ac1 
144:    SUB  4,4,3 	Op == 
145:    LDC  3,1(6) 	True case 
146:    JEQ  4,1(7) 	Jump if true 
147:    LDC  3,0(6) 	False case 
148:    LDC  4,1(6) 	Load constant 1 
149:    SUB  3,3,4 	If cond check 
150:    JGE  3,1(7) 	Jump to then part 
* THEN
* BEGIN compound statement
* 27
152:     ST  1,-8(1) 	Store old fp in ghost frame 
153:     LD  3,-2(1) 	Load variable a
154:     ST  3,-10(1) 	Store parameter 
155:    LDA  1,-8(1) 	Load address of new frame 
156:    LDA  3,1(7) 	Return address in ac 
157:    LDA  7,-147(7) 	call output
158:    LDA  3,0(2) 	Save the result in ac 
* 28
159:     ST  1,-8(1) 	Store old fp in ghost frame 
160:     LD  3,-3(1) 	Load variable b
161:     ST  3,-10(1) 	Store parameter 
162:    LDA  1,-8(1) 	Load address of new frame 
163:    LDA  3,1(7) 	Return address in ac 
164:    LDA  7,-154(7) 	call output
165:    LDA  3,0(2) 	Save the result in ac 
* 29
166:     ST  1,-8(1) 	Store old fp in ghost frame 
167:     LD  3,-6(1) 	Load variable c
168:     ST  3,-10(1) 	Store parameter 
169:    LDA  1,-8(1) 	Load address of new frame 
170:    LDA  3,1(7) 	Return address in ac 
171:    LDA  7,-161(7) 	call output
172:    LDA  3,0(2) 	Save the result in ac 
* 30
173:     ST  1,-8(1) 	Store old fp in ghost frame 
174:    LDA  1,-8(1) 	Load address of new frame 
175:    LDA  3,1(7) 	Return address in ac 
176:    LDA  7,-147(7) 	call outnl
177:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
151:    LDA  7,26(7) 	Jump around the THEN 
* ENDIF
* END compound statement
 98:    LDA  7,79(7) 	Jump around the THEN 
* ENDIF
* 33
178:     LD  3,-3(1) 	Load variable b
179:     ST  3,-8(1) 	Save left side in temp 
180:    LDC  3,1(6) 	Load constant 
181:     LD  4,-8(1) 	Load left from temp into ac1 
182:    ADD  3,4,3 	Op + 
183:     ST  3,-3(1) 	Store variable b
* 34
184:     LD  3,-5(1) 	Load variable bb
185:     ST  3,-8(1) 	Save left side in temp 
186:    LDC  3,2(6) 	Load constant 
187:     ST  3,-9(1) 	Save left side in temp 
188:     LD  3,-3(1) 	Load variable b
189:     LD  4,-9(1) 	Load left from temp into ac1 
190:    MUL  3,4,3 	Op * 
191:     LD  4,-8(1) 	Load left from temp into ac1 
192:    ADD  3,4,3 	Op + 
193:     ST  3,-8(1) 	Save left side in temp 
194:    LDC  3,1(6) 	Load constant 
195:     LD  4,-8(1) 	Load left from temp into ac1 
196:    SUB  3,4,3 	Op - 
197:     ST  3,-5(1) 	Store variable bb
* END compound statement
198:    LDA  7,-138(7) 	go to beginning of loop 
 72:    LDA  7,126(7) 	No more loop 
* ENDWHILE
* 36
199:     LD  3,-2(1) 	Load variable a
200:     ST  3,-8(1) 	Save left side in temp 
201:    LDC  3,1(6) 	Load constant 
202:     LD  4,-8(1) 	Load left from temp into ac1 
203:    ADD  3,4,3 	Op + 
204:     ST  3,-2(1) 	Store variable a
* 37
205:     LD  3,-4(1) 	Load variable aa
206:     ST  3,-8(1) 	Save left side in temp 
207:    LDC  3,2(6) 	Load constant 
208:     ST  3,-9(1) 	Save left side in temp 
209:     LD  3,-2(1) 	Load variable a
210:     LD  4,-9(1) 	Load left from temp into ac1 
211:    MUL  3,4,3 	Op * 
212:     LD  4,-8(1) 	Load left from temp into ac1 
213:    ADD  3,4,3 	Op + 
214:     ST  3,-8(1) 	Save left side in temp 
215:    LDC  3,1(6) 	Load constant 
216:     LD  4,-8(1) 	Load left from temp into ac1 
217:    SUB  3,4,3 	Op - 
218:     ST  3,-4(1) 	Store variable aa
* END compound statement
219:    LDA  7,-178(7) 	go to beginning of loop 
 53:    LDA  7,166(7) 	No more loop 
* ENDWHILE
* END compound statement
* Add standard closing in case there is no return statement
220:    LDC  2,0(6) 	Set return value to 0 
221:     LD  3,-1(1) 	Load return address 
222:     LD  1,0(1) 	Adjust fp 
223:    LDA  7,0(3) 	Return 
* END of function main
