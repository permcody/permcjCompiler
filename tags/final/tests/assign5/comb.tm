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
* BEGIN function comb
 35:     ST  3,-1(1) 	Store return address. BEGIN FUNC: comb
* BEGIN compound statement
* IF
 36:     LD  3,-2(1) 	Load variable a
 37:     ST  3,-4(1) 	Save left side in temp 
 38:     LD  3,-3(1) 	Load variable b
 39:     LD  4,-4(1) 	Load left from temp into ac1 
 40:    SUB  4,4,3 	Op == 
 41:    LDC  3,1(6) 	True case 
 42:    JEQ  4,1(7) 	Jump if true 
 43:    LDC  3,0(6) 	False case 
 44:    LDC  4,1(6) 	Load constant 1 
 45:    SUB  3,3,4 	If cond check 
 46:    JGE  3,1(7) 	Jump to then part 
* THEN
* RETURN
 48:    LDC  3,1(6) 	Load constant 
 49:    LDA  2,0(3) 	Copy result to rt register 
 50:     LD  3,-1(1) 	Load return address 
 51:     LD  1,0(1) 	Adjust fp 
 52:    LDA  7,0(3) 	Return 
 47:    LDA  7,5(7) 	Jump around the THEN 
* ENDIF
* IF
 53:     LD  3,-3(1) 	Load variable b
 54:     ST  3,-4(1) 	Save left side in temp 
 55:    LDC  3,0(6) 	Load constant 
 56:     LD  4,-4(1) 	Load left from temp into ac1 
 57:    SUB  4,4,3 	Op == 
 58:    LDC  3,1(6) 	True case 
 59:    JEQ  4,1(7) 	Jump if true 
 60:    LDC  3,0(6) 	False case 
 61:    LDC  4,1(6) 	Load constant 1 
 62:    SUB  3,3,4 	If cond check 
 63:    JGE  3,1(7) 	Jump to then part 
* THEN
* RETURN
 65:    LDC  3,1(6) 	Load constant 
 66:    LDA  2,0(3) 	Copy result to rt register 
 67:     LD  3,-1(1) 	Load return address 
 68:     LD  1,0(1) 	Adjust fp 
 69:    LDA  7,0(3) 	Return 
 64:    LDA  7,5(7) 	Jump around the THEN 
* ENDIF
* IF
 70:     LD  3,-3(1) 	Load variable b
 71:     ST  3,-4(1) 	Save left side in temp 
 72:    LDC  3,1(6) 	Load constant 
 73:     LD  4,-4(1) 	Load left from temp into ac1 
 74:    SUB  4,4,3 	Op == 
 75:    LDC  3,1(6) 	True case 
 76:    JEQ  4,1(7) 	Jump if true 
 77:    LDC  3,0(6) 	False case 
 78:    LDC  4,1(6) 	Load constant 1 
 79:    SUB  3,3,4 	If cond check 
 80:    JGE  3,1(7) 	Jump to then part 
* THEN
* RETURN
 82:     LD  3,-2(1) 	Load variable a
 83:    LDA  2,0(3) 	Copy result to rt register 
 84:     LD  3,-1(1) 	Load return address 
 85:     LD  1,0(1) 	Adjust fp 
 86:    LDA  7,0(3) 	Return 
 81:    LDA  7,5(7) 	Jump around the THEN 
* ENDIF
* RETURN
 87:     ST  1,-4(1) 	Store old fp in ghost frame 
 88:     LD  3,-2(1) 	Load variable a
 89:     ST  3,-6(1) 	Save left side in temp 
 90:    LDC  3,1(6) 	Load constant 
 91:     LD  4,-6(1) 	Load left from temp into ac1 
 92:    SUB  3,4,3 	Op - 
 93:     ST  3,-6(1) 	Store parameter 
 94:     LD  3,-3(1) 	Load variable b
 95:     ST  3,-7(1) 	Save left side in temp 
 96:    LDC  3,1(6) 	Load constant 
 97:     LD  4,-7(1) 	Load left from temp into ac1 
 98:    SUB  3,4,3 	Op - 
 99:     ST  3,-7(1) 	Store parameter 
100:    LDA  1,-4(1) 	Load address of new frame 
101:    LDA  3,1(7) 	Return address in ac 
102:    LDA  7,-68(7) 	call comb
103:    LDA  3,0(2) 	Save the result in ac 
104:     ST  3,-4(1) 	Save left side in temp 
105:     ST  1,-5(1) 	Store old fp in ghost frame 
106:     LD  3,-2(1) 	Load variable a
107:     ST  3,-7(1) 	Save left side in temp 
108:    LDC  3,1(6) 	Load constant 
109:     LD  4,-7(1) 	Load left from temp into ac1 
110:    SUB  3,4,3 	Op - 
111:     ST  3,-7(1) 	Store parameter 
112:     LD  3,-3(1) 	Load variable b
113:     ST  3,-8(1) 	Store parameter 
114:    LDA  1,-5(1) 	Load address of new frame 
115:    LDA  3,1(7) 	Return address in ac 
116:    LDA  7,-82(7) 	call comb
117:    LDA  3,0(2) 	Save the result in ac 
118:     LD  4,-4(1) 	Load left from temp into ac1 
119:    ADD  3,4,3 	Op + 
120:    LDA  2,0(3) 	Copy result to rt register 
121:     LD  3,-1(1) 	Load return address 
122:     LD  1,0(1) 	Adjust fp 
123:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
124:    LDC  2,0(6) 	Set return value to 0 
125:     LD  3,-1(1) 	Load return address 
126:     LD  1,0(1) 	Adjust fp 
127:    LDA  7,0(3) 	Return 
* END of function comb
* BEGIN function main
  4:    LDA  7,123(7) 	Jump to main 
128:     ST  3,-1(1) 	Store return address. BEGIN FUNC: main
* BEGIN compound statement
* WHILE
129:    LDC  3,1(6) 	Load constant 
130:    LDC  4,1(6) 	Load constant 1 
131:    SUB  3,3,4 	While cond check 
132:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* IF
134:     ST  1,-5(1) 	Store old fp in ghost frame 
135:    LDA  1,-5(1) 	Load address of new frame 
136:    LDA  3,1(7) 	Return address in ac 
137:    LDA  7,-132(7) 	call input
138:    LDA  3,0(2) 	Save the result in ac 
139:     ST  3,-4(1) 	Store variable n
140:     ST  3,-5(1) 	Save left side in temp 
141:    LDC  3,0(6) 	Load constant 
142:     LD  4,-5(1) 	Load left from temp into ac1 
143:    SUB  4,4,3 	Op == 
144:    LDC  3,1(6) 	True case 
145:    JEQ  4,1(7) 	Jump if true 
146:    LDC  3,0(6) 	False case 
147:    LDC  4,1(6) 	Load constant 1 
148:    SUB  3,3,4 	If cond check 
149:    JGE  3,1(7) 	Jump to then part 
* THEN
* BREAK
151:    LDA  7,-19(7) 	break 
150:    LDA  7,1(7) 	Jump around the THEN 
* ENDIF
* 25
152:    LDC  3,0(6) 	Load constant 
153:     ST  3,-2(1) 	Store variable a
* WHILE
154:     LD  3,-2(1) 	Load variable a
155:     ST  3,-5(1) 	Save left side in temp 
156:     LD  3,-4(1) 	Load variable n
157:     LD  4,-5(1) 	Load left from temp into ac1 
158:    SUB  4,4,3 	Op <= 
159:    LDC  3,1(6) 	True case 
160:    JLE  4,1(7) 	Jump if true 
161:    LDC  3,0(6) 	False case 
162:    LDC  4,1(6) 	Load constant 1 
163:    SUB  3,3,4 	While cond check 
164:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 27
166:    LDC  3,0(6) 	Load constant 
167:     ST  3,-3(1) 	Store variable b
* WHILE
168:     LD  3,-3(1) 	Load variable b
169:     ST  3,-5(1) 	Save left side in temp 
170:     LD  3,-2(1) 	Load variable a
171:     LD  4,-5(1) 	Load left from temp into ac1 
172:    SUB  4,4,3 	Op <= 
173:    LDC  3,1(6) 	True case 
174:    JLE  4,1(7) 	Jump if true 
175:    LDC  3,0(6) 	False case 
176:    LDC  4,1(6) 	Load constant 1 
177:    SUB  3,3,4 	While cond check 
178:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 29
180:     ST  1,-5(1) 	Store old fp in ghost frame 
181:     ST  1,-7(1) 	Store old fp in ghost frame 
182:     LD  3,-2(1) 	Load variable a
183:     ST  3,-9(1) 	Store parameter 
184:     LD  3,-3(1) 	Load variable b
185:     ST  3,-10(1) 	Store parameter 
186:    LDA  1,-7(1) 	Load address of new frame 
187:    LDA  3,1(7) 	Return address in ac 
188:    LDA  7,-154(7) 	call comb
189:    LDA  3,0(2) 	Save the result in ac 
190:     ST  3,-7(1) 	Store parameter 
191:    LDA  1,-5(1) 	Load address of new frame 
192:    LDA  3,1(7) 	Return address in ac 
193:    LDA  7,-183(7) 	call output
194:    LDA  3,0(2) 	Save the result in ac 
* 30
195:     LD  3,-3(1) 	Load variable b
196:     ST  3,-5(1) 	Save left side in temp 
197:    LDC  3,1(6) 	Load constant 
198:     LD  4,-5(1) 	Load left from temp into ac1 
199:    ADD  3,4,3 	Op + 
200:     ST  3,-3(1) 	Store variable b
* END compound statement
201:    LDA  7,-34(7) 	go to beginning of loop 
179:    LDA  7,22(7) 	No more loop 
* ENDWHILE
* 32
202:     ST  1,-5(1) 	Store old fp in ghost frame 
203:    LDA  1,-5(1) 	Load address of new frame 
204:    LDA  3,1(7) 	Return address in ac 
205:    LDA  7,-176(7) 	call outnl
206:    LDA  3,0(2) 	Save the result in ac 
* 33
207:     LD  3,-2(1) 	Load variable a
208:     ST  3,-5(1) 	Save left side in temp 
209:    LDC  3,1(6) 	Load constant 
210:     LD  4,-5(1) 	Load left from temp into ac1 
211:    ADD  3,4,3 	Op + 
212:     ST  3,-2(1) 	Store variable a
* END compound statement
213:    LDA  7,-60(7) 	go to beginning of loop 
165:    LDA  7,48(7) 	No more loop 
* ENDWHILE
* END compound statement
214:    LDA  7,-86(7) 	go to beginning of loop 
133:    LDA  7,81(7) 	No more loop 
* ENDWHILE
* END compound statement
* Add standard closing in case there is no return statement
215:    LDC  2,0(6) 	Set return value to 0 
216:     LD  3,-1(1) 	Load return address 
217:     LD  1,0(1) 	Adjust fp 
218:    LDA  7,0(3) 	Return 
* END of function main
