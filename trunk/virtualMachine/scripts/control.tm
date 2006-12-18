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
 31:    LDC  3,2(6) 	Load constant 
 32:     ST  3,-2(1) 	Store variable x
* 
 33:    LDC  3,3(6) 	Load constant 
 34:     ST  3,-3(1) 	Store variable y
* IF
 35:     LD  3,-2(1) 	Load variable x
 36:     ST  3,-4(1) 	Save left side 
 37:     LD  3,-3(1) 	Load variable y
 38:     LD  4,-4(1) 	Load left into ac1 
 39:    SUB  3,4,3 	op != 
 40:    JEQ  3,1(7) 	br if true 
 41:    LDC  3,1(6) 	true case 
 42:    LDC  4,1(6) 	Load constant 1 
 43:    SUB  3,3,4 	If cond check 
 44:    JGE  3,1(7) 	Jump to then part 
* THEN
 45:    LDA  7,0(7) 	 
* ENDIF
* IF
 46:     LD  3,-2(1) 	Load variable x
 47:     ST  3,-4(1) 	Save left side 
 48:     LD  3,-3(1) 	Load variable y
 49:     LD  4,-4(1) 	Load left into ac1 
 50:    SUB  3,4,3 	op < 
 51:    JLT  3,2(7) 	br if true 
 52:    LDC  3,0(6) 	false case 
 53:    LDA  7,1(7) 	unconditional jmp 
 54:    LDC  3,1(6) 	true case 
 55:    LDC  4,1(6) 	Load constant 1 
 56:    SUB  3,3,4 	If cond check 
 57:    JGE  3,1(7) 	Jump to then part 
* THEN
* 
 59:     ST  1,-4(1) 	Store old fp in ghost frame 
 60:    LDC  3,11(6) 	Load constant 
 61:     ST  3,-6(1) 	Store parameter 
 62:    LDA  1,-4(1) 	Load address of new frame 
 63:    LDA  3,1(7) 	Return address in ac 
 64:    LDA  7,-54(7) 	call output
 65:    LDA  3,0(2) 	Save the result in ac 
 58:    LDA  7,7(7) 	 
* ENDIF
* IF
 66:     LD  3,-2(1) 	Load variable x
 67:     ST  3,-4(1) 	Save left side 
 68:     LD  3,-3(1) 	Load variable y
 69:     LD  4,-4(1) 	Load left into ac1 
 70:    SUB  3,4,3 	op == 
 71:    JEQ  3,2(7) 	br if true 
 72:    LDC  3,0(6) 	false case 
 73:    LDA  7,1(7) 	unconditional jmp 
 74:    LDC  3,1(6) 	true case 
 75:    LDC  4,1(6) 	Load constant 1 
 76:    SUB  3,3,4 	If cond check 
 77:    JGE  3,1(7) 	Jump to then part 
* THEN
* 
 79:     ST  1,-4(1) 	Store old fp in ghost frame 
 80:    LDC  3,22(6) 	Load constant 
 81:     ST  3,-6(1) 	Store parameter 
 82:    LDA  1,-4(1) 	Load address of new frame 
 83:    LDA  3,1(7) 	Return address in ac 
 84:    LDA  7,-74(7) 	call output
 85:    LDA  3,0(2) 	Save the result in ac 
* ELSE
 78:    LDA  7,8(7) 	 
* 
 87:     ST  1,-4(1) 	Store old fp in ghost frame 
 88:    LDC  3,33(6) 	Load constant 
 89:     ST  3,-6(1) 	Store parameter 
 90:    LDA  1,-4(1) 	Load address of new frame 
 91:    LDA  3,1(7) 	Return address in ac 
 92:    LDA  7,-82(7) 	call output
 93:    LDA  3,0(2) 	Save the result in ac 
 86:    LDA  7,7(7) 	 
* ENDIF
* IF
 94:     LD  3,-2(1) 	Load variable x
 95:     ST  3,-4(1) 	Save left side 
 96:     LD  3,-3(1) 	Load variable y
 97:     LD  4,-4(1) 	Load left into ac1 
 98:    SUB  3,4,3 	op != 
 99:    JEQ  3,1(7) 	br if true 
100:    LDC  3,1(6) 	true case 
101:    LDC  4,1(6) 	Load constant 1 
102:    SUB  3,3,4 	If cond check 
103:    JGE  3,1(7) 	Jump to then part 
* THEN
* IF
105:    LDC  3,1(6) 	Load constant 
106:    LDC  4,1(6) 	Load constant 1 
107:    SUB  3,3,4 	If cond check 
108:    JGE  3,1(7) 	Jump to then part 
* THEN
* 
110:     ST  1,-4(1) 	Store old fp in ghost frame 
111:    LDC  3,22(6) 	Load constant 
112:     ST  3,-6(1) 	Store parameter 
113:    LDA  1,-4(1) 	Load address of new frame 
114:    LDA  3,1(7) 	Return address in ac 
115:    LDA  7,-105(7) 	call output
116:    LDA  3,0(2) 	Save the result in ac 
* ELSE
109:    LDA  7,8(7) 	 
* 
118:     ST  1,-4(1) 	Store old fp in ghost frame 
119:    LDC  3,33(6) 	Load constant 
120:     ST  3,-6(1) 	Store parameter 
121:    LDA  1,-4(1) 	Load address of new frame 
122:    LDA  3,1(7) 	Return address in ac 
123:    LDA  7,-113(7) 	call output
124:    LDA  3,0(2) 	Save the result in ac 
117:    LDA  7,7(7) 	 
* ENDIF
104:    LDA  7,20(7) 	 
* ENDIF
* IF
125:     LD  3,-2(1) 	Load variable x
126:     ST  3,-4(1) 	Save left side 
127:     LD  3,-3(1) 	Load variable y
128:     LD  4,-4(1) 	Load left into ac1 
129:    SUB  3,4,3 	op != 
130:    JEQ  3,1(7) 	br if true 
131:    LDC  3,1(6) 	true case 
132:    LDC  4,1(6) 	Load constant 1 
133:    SUB  3,3,4 	If cond check 
134:    JGE  3,1(7) 	Jump to then part 
* THEN
* IF
136:    LDC  3,0(6) 	Load constant 
137:    LDC  4,1(6) 	Load constant 1 
138:    SUB  3,3,4 	If cond check 
139:    JGE  3,1(7) 	Jump to then part 
* THEN
* 
141:     ST  1,-4(1) 	Store old fp in ghost frame 
142:    LDC  3,22(6) 	Load constant 
143:     ST  3,-6(1) 	Store parameter 
144:    LDA  1,-4(1) 	Load address of new frame 
145:    LDA  3,1(7) 	Return address in ac 
146:    LDA  7,-136(7) 	call output
147:    LDA  3,0(2) 	Save the result in ac 
* ELSE
140:    LDA  7,8(7) 	 
* 
149:     ST  1,-4(1) 	Store old fp in ghost frame 
150:    LDC  3,33(6) 	Load constant 
151:     ST  3,-6(1) 	Store parameter 
152:    LDA  1,-4(1) 	Load address of new frame 
153:    LDA  3,1(7) 	Return address in ac 
154:    LDA  7,-144(7) 	call output
155:    LDA  3,0(2) 	Save the result in ac 
148:    LDA  7,7(7) 	 
* ENDIF
135:    LDA  7,20(7) 	 
* ENDIF
* WHILE
156:     LD  3,-2(1) 	Load variable x
157:     ST  3,-4(1) 	Save left side 
158:     LD  3,-3(1) 	Load variable y
159:     LD  4,-4(1) 	Load left into ac1 
160:    SUB  3,4,3 	op >= 
161:    JGE  3,2(7) 	br if true 
162:    LDC  3,0(6) 	false case 
163:    LDA  7,1(7) 	unconditional jmp 
164:    LDC  3,1(6) 	true case 
165:    LDC  4,1(6) 	Load constant 1 
166:    SUB  3,3,4 	While cond check 
167:    JGE  3,1(7) 	Jump to while part 
* DO
169:    LDA  7,-14(7) 	go to beginning of loop 
168:    LDA  7,1(7) 	No more loop 
* ENDWHILE
* WHILE
170:     LD  3,-2(1) 	Load variable x
171:     ST  3,-4(1) 	Save left side 
172:     LD  3,-3(1) 	Load variable y
173:     LD  4,-4(1) 	Load left into ac1 
174:    SUB  3,4,3 	op < 
175:    JLT  3,2(7) 	br if true 
176:    LDC  3,0(6) 	false case 
177:    LDA  7,1(7) 	unconditional jmp 
178:    LDC  3,1(6) 	true case 
179:    LDC  4,1(6) 	Load constant 1 
180:    SUB  3,3,4 	While cond check 
181:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN
* 
183:     ST  1,-4(1) 	Store old fp in ghost frame 
184:    LDC  3,44(6) 	Load constant 
185:     ST  3,-6(1) 	Store parameter 
186:    LDA  1,-4(1) 	Load address of new frame 
187:    LDA  3,1(7) 	Return address in ac 
188:    LDA  7,-178(7) 	call output
189:    LDA  3,0(2) 	Save the result in ac 
* 
190:    LDC  3,500(6) 	Load constant 
191:     ST  3,-2(1) 	Store variable x
* END
192:    LDA  7,-23(7) 	go to beginning of loop 
182:    LDA  7,10(7) 	No more loop 
* ENDWHILE
* RETURN
193:    LDA  2,0(3) 	Copy result to rt register 
194:     LD  3,-1(1) 	Load return address 
195:     LD  1,0(1) 	Adjust fp 
196:    LDA  7,0(3) 	Return 
* END
* Add standard closing in case there is no return statement
197:    LDC  2,0(6) 	Set return value to 0 
198:     LD  3,-1(1) 	Load return address 
199:     LD  1,0(1) 	Adjust fp 
200:    LDA  7,0(3) 	Return 
* END of function main
