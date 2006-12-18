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
 31:    LDC  3,1(6) 	Load constant 
 32:     ST  3,-2(1) 	Store variable a
* 
 33:    LDC  3,1(6) 	Load constant 
 34:     ST  3,-4(1) 	Store variable aa
* 
 35:    LDC  3,0(6) 	Load constant 
 36:     ST  3,-6(1) 	Store variable c
* WHILE
 37:     LD  3,-6(1) 	Load variable c
 38:     ST  3,-8(1) 	Save left side 
 39:    LDC  3,50(6) 	Load constant 
 40:     LD  4,-8(1) 	Load left into ac1 
 41:    SUB  3,4,3 	op < 
 42:    JLT  3,2(7) 	br if true 
 43:    LDC  3,0(6) 	false case 
 44:    LDA  7,1(7) 	unconditional jmp 
 45:    LDC  3,1(6) 	true case 
 46:    LDC  4,1(6) 	Load constant 1 
 47:    SUB  3,3,4 	While cond check 
 48:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN
* 
 50:    LDC  3,1(6) 	Load constant 
 51:     ST  3,-7(1) 	Store variable cc
 52:     ST  3,-6(1) 	Store variable c
* 
 53:    LDC  3,1(6) 	Load constant 
 54:     ST  3,-3(1) 	Store variable b
* 
 55:    LDC  3,1(6) 	Load constant 
 56:     ST  3,-5(1) 	Store variable bb
* WHILE
 57:     LD  3,-3(1) 	Load variable b
 58:     ST  3,-8(1) 	Save left side 
 59:     LD  3,-2(1) 	Load variable a
 60:     LD  4,-8(1) 	Load left into ac1 
 61:    SUB  3,4,3 	op <= 
 62:    JLE  3,2(7) 	br if true 
 63:    LDC  3,0(6) 	false case 
 64:    LDA  7,1(7) 	unconditional jmp 
 65:    LDC  3,1(6) 	true case 
 66:    LDC  4,1(6) 	Load constant 1 
 67:    SUB  3,3,4 	While cond check 
 68:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN
* IF
 70:     LD  3,-4(1) 	Load variable aa
 71:     ST  3,-8(1) 	Save left side 
 72:     LD  3,-5(1) 	Load variable bb
 73:     LD  4,-8(1) 	Load left into ac1 
 74:    ADD  3,4,3 	op + 
 75:     ST  3,-8(1) 	Save left side 
 76:    LDC  3,2(6) 	Load constant 
 77:     LD  4,-8(1) 	Load left into ac1 
 78:    DIV  3,4,3 	op / 
 79:     ST  3,-8(1) 	Save left side 
 80:    LDC  3,2(6) 	Load constant 
 81:     LD  4,-8(1) 	Load left into ac1 
 82:    DIV  5,4,3 	op % 
 83:    MUL  5,5,3 	 
 84:    SUB  3,4,5 	 
 85:     ST  3,-8(1) 	Save left side 
 86:    LDC  3,0(6) 	Load constant 
 87:     LD  4,-8(1) 	Load left into ac1 
 88:    SUB  3,4,3 	op == 
 89:    JEQ  3,2(7) 	br if true 
 90:    LDC  3,0(6) 	false case 
 91:    LDA  7,1(7) 	unconditional jmp 
 92:    LDC  3,1(6) 	true case 
 93:    LDC  4,1(6) 	Load constant 1 
 94:    SUB  3,3,4 	If cond check 
 95:    JGE  3,1(7) 	Jump to then part 
* THEN
* BEGIN
* WHILE
 97:     LD  3,-7(1) 	Load variable cc
 98:     ST  3,-8(1) 	Save left side 
 99:     LD  3,-4(1) 	Load variable aa
100:     ST  3,-9(1) 	Save left side 
101:     LD  3,-5(1) 	Load variable bb
102:     LD  4,-9(1) 	Load left into ac1 
103:    ADD  3,4,3 	op + 
104:     LD  4,-8(1) 	Load left into ac1 
105:    SUB  3,4,3 	op < 
106:    JLT  3,2(7) 	br if true 
107:    LDC  3,0(6) 	false case 
108:    LDA  7,1(7) 	unconditional jmp 
109:    LDC  3,1(6) 	true case 
110:    LDC  4,1(6) 	Load constant 1 
111:    SUB  3,3,4 	While cond check 
112:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN
* 
114:     LD  3,-6(1) 	Load variable c
115:     ST  3,-8(1) 	Save left side 
116:    LDC  3,1(6) 	Load constant 
117:     LD  4,-8(1) 	Load left into ac1 
118:    ADD  3,4,3 	op + 
119:     ST  3,-6(1) 	Store variable c
* 
120:     LD  3,-7(1) 	Load variable cc
121:     ST  3,-8(1) 	Save left side 
122:    LDC  3,2(6) 	Load constant 
123:     ST  3,-9(1) 	Save left side 
124:     LD  3,-6(1) 	Load variable c
125:     LD  4,-9(1) 	Load left into ac1 
126:    MUL  3,4,3 	op * 
127:     LD  4,-8(1) 	Load left into ac1 
128:    ADD  3,4,3 	op + 
129:     ST  3,-8(1) 	Save left side 
130:    LDC  3,1(6) 	Load constant 
131:     LD  4,-8(1) 	Load left into ac1 
132:    SUB  3,4,3 	op - 
133:     ST  3,-7(1) 	Store variable cc
* END
134:    LDA  7,-38(7) 	go to beginning of loop 
113:    LDA  7,21(7) 	No more loop 
* ENDWHILE
* IF
135:     LD  3,-4(1) 	Load variable aa
136:     ST  3,-8(1) 	Save left side 
137:     LD  3,-5(1) 	Load variable bb
138:     LD  4,-8(1) 	Load left into ac1 
139:    ADD  3,4,3 	op + 
140:     ST  3,-8(1) 	Save left side 
141:     LD  3,-7(1) 	Load variable cc
142:     LD  4,-8(1) 	Load left into ac1 
143:    SUB  3,4,3 	op == 
144:    JEQ  3,2(7) 	br if true 
145:    LDC  3,0(6) 	false case 
146:    LDA  7,1(7) 	unconditional jmp 
147:    LDC  3,1(6) 	true case 
148:    LDC  4,1(6) 	Load constant 1 
149:    SUB  3,3,4 	If cond check 
150:    JGE  3,1(7) 	Jump to then part 
* THEN
* BEGIN
* 
152:     ST  1,-8(1) 	Store old fp in ghost frame 
153:     LD  3,-2(1) 	Load variable a
154:     ST  3,-10(1) 	Store parameter 
155:    LDA  1,-8(1) 	Load address of new frame 
156:    LDA  3,1(7) 	Return address in ac 
157:    LDA  7,-147(7) 	call output
158:    LDA  3,0(2) 	Save the result in ac 
* 
159:     ST  1,-8(1) 	Store old fp in ghost frame 
160:     LD  3,-3(1) 	Load variable b
161:     ST  3,-10(1) 	Store parameter 
162:    LDA  1,-8(1) 	Load address of new frame 
163:    LDA  3,1(7) 	Return address in ac 
164:    LDA  7,-154(7) 	call output
165:    LDA  3,0(2) 	Save the result in ac 
* 
166:     ST  1,-8(1) 	Store old fp in ghost frame 
167:     LD  3,-6(1) 	Load variable c
168:     ST  3,-10(1) 	Store parameter 
169:    LDA  1,-8(1) 	Load address of new frame 
170:    LDA  3,1(7) 	Return address in ac 
171:    LDA  7,-161(7) 	call output
172:    LDA  3,0(2) 	Save the result in ac 
* 
173:     ST  1,-8(1) 	Store old fp in ghost frame 
174:    LDC  3,1010101010(6) 	Load constant 
175:     ST  3,-10(1) 	Store parameter 
176:    LDA  1,-8(1) 	Load address of new frame 
177:    LDA  3,1(7) 	Return address in ac 
178:    LDA  7,-168(7) 	call output
179:    LDA  3,0(2) 	Save the result in ac 
* END
151:    LDA  7,28(7) 	 
* ENDIF
* END
 96:    LDA  7,83(7) 	 
* ENDIF
* 
180:     LD  3,-3(1) 	Load variable b
181:     ST  3,-8(1) 	Save left side 
182:    LDC  3,1(6) 	Load constant 
183:     LD  4,-8(1) 	Load left into ac1 
184:    ADD  3,4,3 	op + 
185:     ST  3,-3(1) 	Store variable b
* 
186:     LD  3,-5(1) 	Load variable bb
187:     ST  3,-8(1) 	Save left side 
188:    LDC  3,2(6) 	Load constant 
189:     ST  3,-9(1) 	Save left side 
190:     LD  3,-3(1) 	Load variable b
191:     LD  4,-9(1) 	Load left into ac1 
192:    MUL  3,4,3 	op * 
193:     LD  4,-8(1) 	Load left into ac1 
194:    ADD  3,4,3 	op + 
195:     ST  3,-8(1) 	Save left side 
196:    LDC  3,1(6) 	Load constant 
197:     LD  4,-8(1) 	Load left into ac1 
198:    SUB  3,4,3 	op - 
199:     ST  3,-5(1) 	Store variable bb
* END
200:    LDA  7,-144(7) 	go to beginning of loop 
 69:    LDA  7,131(7) 	No more loop 
* ENDWHILE
* 
201:     LD  3,-2(1) 	Load variable a
202:     ST  3,-8(1) 	Save left side 
203:    LDC  3,1(6) 	Load constant 
204:     LD  4,-8(1) 	Load left into ac1 
205:    ADD  3,4,3 	op + 
206:     ST  3,-2(1) 	Store variable a
* 
207:     LD  3,-4(1) 	Load variable aa
208:     ST  3,-8(1) 	Save left side 
209:    LDC  3,2(6) 	Load constant 
210:     ST  3,-9(1) 	Save left side 
211:     LD  3,-2(1) 	Load variable a
212:     LD  4,-9(1) 	Load left into ac1 
213:    MUL  3,4,3 	op * 
214:     LD  4,-8(1) 	Load left into ac1 
215:    ADD  3,4,3 	op + 
216:     ST  3,-8(1) 	Save left side 
217:    LDC  3,1(6) 	Load constant 
218:     LD  4,-8(1) 	Load left into ac1 
219:    SUB  3,4,3 	op - 
220:     ST  3,-4(1) 	Store variable aa
* END
221:    LDA  7,-185(7) 	go to beginning of loop 
 49:    LDA  7,172(7) 	No more loop 
* ENDWHILE
* END
* Add standard closing in case there is no return statement
222:    LDC  2,0(6) 	Set return value to 0 
223:     LD  3,-1(1) 	Load return address 
224:     LD  1,0(1) 	Adjust fp 
225:    LDA  7,0(3) 	Return 
* END of function main
