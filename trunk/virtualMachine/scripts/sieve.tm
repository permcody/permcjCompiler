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
 31:     ST  1,-505(1) 	Store old fp in ghost frame 
 32:    LDA  1,-505(1) 	Load address of new frame 
 33:    LDA  3,1(7) 	Return address in ac 
 34:    LDA  7,-29(7) 	call input
 35:    LDA  3,0(2) 	Save the result in ac 
 36:     ST  3,-2(1) 	Store variable max
* 
 37:    LDC  3,2(6) 	Load constant 
 38:     ST  3,-503(1) 	Store variable k
* WHILE
 39:     LD  3,-503(1) 	Load variable k
 40:     ST  3,-505(1) 	Save left side 
 41:     LD  3,-2(1) 	Load variable max
 42:     LD  4,-505(1) 	Load left into ac1 
 43:    SUB  3,4,3 	op <= 
 44:    JLE  3,2(7) 	br if true 
 45:    LDC  3,0(6) 	false case 
 46:    LDA  7,1(7) 	unconditional jmp 
 47:    LDC  3,1(6) 	true case 
 48:    LDC  4,1(6) 	Load constant 1 
 49:    SUB  3,3,4 	While cond check 
 50:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN
* 
 52:    LDC  3,1(6) 	Load constant 
 53:     ST  3,-505(1) 	Save assign value 
 54:     LD  3,-503(1) 	Load variable k
 55:     ST  3,-506(1) 	Save index 
 56:     LD  5,-506(1) 	Load index 
 57:     LD  4,-505(1) 	Load value 
 58:    LDA  3,-3(1) 	Load address of base of array n
 59:    SUB  3,3,5 	Compute offset of value 
 60:     ST  4,0(3) 	Store the value 
 61:    LDA  3,0(4) 	Adjust ac 
* 
 62:     LD  3,-503(1) 	Load variable k
 63:     ST  3,-505(1) 	Save left side 
 64:    LDC  3,1(6) 	Load constant 
 65:     LD  4,-505(1) 	Load left into ac1 
 66:    ADD  3,4,3 	op + 
 67:     ST  3,-503(1) 	Store variable k
* END
 68:    LDA  7,-30(7) 	go to beginning of loop 
 51:    LDA  7,17(7) 	No more loop 
* ENDWHILE
* 
 69:    LDC  3,2(6) 	Load constant 
 70:     ST  3,-503(1) 	Store variable k
* WHILE
 71:     LD  3,-503(1) 	Load variable k
 72:     ST  3,-505(1) 	Save left side 
 73:     LD  3,-503(1) 	Load variable k
 74:     LD  4,-505(1) 	Load left into ac1 
 75:    MUL  3,4,3 	op * 
 76:     ST  3,-505(1) 	Save left side 
 77:     LD  3,-2(1) 	Load variable max
 78:     LD  4,-505(1) 	Load left into ac1 
 79:    SUB  3,4,3 	op <= 
 80:    JLE  3,2(7) 	br if true 
 81:    LDC  3,0(6) 	false case 
 82:    LDA  7,1(7) 	unconditional jmp 
 83:    LDC  3,1(6) 	true case 
 84:    LDC  4,1(6) 	Load constant 1 
 85:    SUB  3,3,4 	While cond check 
 86:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN
* 
 88:     LD  3,-503(1) 	Load variable k
 89:     ST  3,-505(1) 	Save left side 
 90:     LD  3,-503(1) 	Load variable k
 91:     LD  4,-505(1) 	Load left into ac1 
 92:    MUL  3,4,3 	op * 
 93:     ST  3,-504(1) 	Store variable j
* WHILE
 94:     LD  3,-504(1) 	Load variable j
 95:     ST  3,-505(1) 	Save left side 
 96:     LD  3,-2(1) 	Load variable max
 97:     LD  4,-505(1) 	Load left into ac1 
 98:    SUB  3,4,3 	op <= 
 99:    JLE  3,2(7) 	br if true 
100:    LDC  3,0(6) 	false case 
101:    LDA  7,1(7) 	unconditional jmp 
102:    LDC  3,1(6) 	true case 
103:    LDC  4,1(6) 	Load constant 1 
104:    SUB  3,3,4 	While cond check 
105:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN
* 
107:    LDC  3,0(6) 	Load constant 
108:     ST  3,-505(1) 	Save assign value 
109:     LD  3,-504(1) 	Load variable j
110:     ST  3,-506(1) 	Save index 
111:     LD  5,-506(1) 	Load index 
112:     LD  4,-505(1) 	Load value 
113:    LDA  3,-3(1) 	Load address of base of array n
114:    SUB  3,3,5 	Compute offset of value 
115:     ST  4,0(3) 	Store the value 
116:    LDA  3,0(4) 	Adjust ac 
* 
117:     LD  3,-504(1) 	Load variable j
118:     ST  3,-505(1) 	Save left side 
119:     LD  3,-503(1) 	Load variable k
120:     LD  4,-505(1) 	Load left into ac1 
121:    ADD  3,4,3 	op + 
122:     ST  3,-504(1) 	Store variable j
* END
123:    LDA  7,-30(7) 	go to beginning of loop 
106:    LDA  7,17(7) 	No more loop 
* ENDWHILE
* 
124:     LD  3,-503(1) 	Load variable k
125:     ST  3,-505(1) 	Save left side 
126:    LDC  3,1(6) 	Load constant 
127:     LD  4,-505(1) 	Load left into ac1 
128:    ADD  3,4,3 	op + 
129:     ST  3,-503(1) 	Store variable k
* WHILE
130:     LD  3,-503(1) 	Load variable k
131:     ST  3,-505(1) 	Save left side 
132:     LD  3,-2(1) 	Load variable max
133:     LD  4,-505(1) 	Load left into ac1 
134:    SUB  3,4,3 	op <= 
135:    JLE  3,2(7) 	br if true 
136:    LDC  3,0(6) 	false case 
137:    LDA  7,1(7) 	unconditional jmp 
138:    LDC  3,1(6) 	true case 
139:     ST  3,-505(1) 	Save left side 
140:     LD  3,-503(1) 	Load variable k
141:     ST  3,-506(1) 	Save index 
142:    LDA  3,-3(1) 	Load address of base of array n
143:     LD  4,-506(1) 	Load index 
144:    SUB  3,3,4 	Compute offset of value 
145:     LD  3,0(3) 	Load the value 
146:    LDC  4,1(6) 	Load 1 
147:    SUB  3,4,3 	op - 
148:     LD  4,-505(1) 	Load left into ac1 
149:    LDC  5,1(6) 	op && 
150:    SUB  6,4,5 	 
151:    JLT  6,4(7) 	jump if false 
152:    SUB  6,3,5 	 
153:    JLT  6,2(7) 	jump if false 
154:    LDC  3,1(6) 	true case 
155:    LDA  7,1(7) 	unconditional jmp 
156:    LDC  3,0(6) 	false case 
157:    LDC  4,1(6) 	Load constant 1 
158:    SUB  3,3,4 	While cond check 
159:    JGE  3,1(7) 	Jump to while part 
* DO
* 
161:     LD  3,-503(1) 	Load variable k
162:     ST  3,-505(1) 	Save left side 
163:    LDC  3,1(6) 	Load constant 
164:     LD  4,-505(1) 	Load left into ac1 
165:    ADD  3,4,3 	op + 
166:     ST  3,-503(1) 	Store variable k
167:    LDA  7,-38(7) 	go to beginning of loop 
160:    LDA  7,7(7) 	No more loop 
* ENDWHILE
* END
168:    LDA  7,-98(7) 	go to beginning of loop 
 87:    LDA  7,81(7) 	No more loop 
* ENDWHILE
* 
169:    LDC  3,2(6) 	Load constant 
170:     ST  3,-503(1) 	Store variable k
* WHILE
171:     LD  3,-503(1) 	Load variable k
172:     ST  3,-505(1) 	Save left side 
173:     LD  3,-2(1) 	Load variable max
174:     LD  4,-505(1) 	Load left into ac1 
175:    SUB  3,4,3 	op <= 
176:    JLE  3,2(7) 	br if true 
177:    LDC  3,0(6) 	false case 
178:    LDA  7,1(7) 	unconditional jmp 
179:    LDC  3,1(6) 	true case 
180:    LDC  4,1(6) 	Load constant 1 
181:    SUB  3,3,4 	While cond check 
182:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN
* IF
184:     LD  3,-503(1) 	Load variable k
185:     ST  3,-505(1) 	Save index 
186:    LDA  3,-3(1) 	Load address of base of array n
187:     LD  4,-505(1) 	Load index 
188:    SUB  3,3,4 	Compute offset of value 
189:     LD  3,0(3) 	Load the value 
190:    LDC  4,1(6) 	Load constant 1 
191:    SUB  3,3,4 	If cond check 
192:    JGE  3,1(7) 	Jump to then part 
* THEN
* 
194:     ST  1,-505(1) 	Store old fp in ghost frame 
195:     LD  3,-503(1) 	Load variable k
196:     ST  3,-507(1) 	Store parameter 
197:    LDA  1,-505(1) 	Load address of new frame 
198:    LDA  3,1(7) 	Return address in ac 
199:    LDA  7,-189(7) 	call output
200:    LDA  3,0(2) 	Save the result in ac 
193:    LDA  7,7(7) 	 
* ENDIF
* 
201:     LD  3,-503(1) 	Load variable k
202:     ST  3,-505(1) 	Save left side 
203:    LDC  3,1(6) 	Load constant 
204:     LD  4,-505(1) 	Load left into ac1 
205:    ADD  3,4,3 	op + 
206:     ST  3,-503(1) 	Store variable k
* END
207:    LDA  7,-37(7) 	go to beginning of loop 
183:    LDA  7,24(7) 	No more loop 
* ENDWHILE
* RETURN
208:    LDC  3,0(6) 	Load constant 
209:    LDA  2,0(3) 	Copy result to rt register 
210:     LD  3,-1(1) 	Load return address 
211:     LD  1,0(1) 	Adjust fp 
212:    LDA  7,0(3) 	Return 
* END
* Add standard closing in case there is no return statement
213:    LDC  2,0(6) 	Set return value to 0 
214:     LD  3,-1(1) 	Load return address 
215:     LD  1,0(1) 	Adjust fp 
216:    LDA  7,0(3) 	Return 
* END of function main
