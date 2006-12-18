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
* BEGIN function comb
 30:     ST  3,-1(1) 	Store return address to caller 
* BEGIN
* IF
 31:     LD  3,-2(1) 	Load variable a
 32:     ST  3,-4(1) 	Save left side 
 33:     LD  3,-3(1) 	Load variable b
 34:     LD  4,-4(1) 	Load left into ac1 
 35:    SUB  3,4,3 	op == 
 36:    JEQ  3,2(7) 	br if true 
 37:    LDC  3,0(6) 	false case 
 38:    LDA  7,1(7) 	unconditional jmp 
 39:    LDC  3,1(6) 	true case 
 40:    LDC  4,1(6) 	Load constant 1 
 41:    SUB  3,3,4 	If cond check 
 42:    JGE  3,1(7) 	Jump to then part 
* THEN
* RETURN
 44:    LDC  3,1(6) 	Load constant 
 45:    LDA  2,0(3) 	Copy result to rt register 
 46:     LD  3,-1(1) 	Load return address 
 47:     LD  1,0(1) 	Adjust fp 
 48:    LDA  7,0(3) 	Return 
 43:    LDA  7,5(7) 	 
* ENDIF
* IF
 49:     LD  3,-3(1) 	Load variable b
 50:     ST  3,-4(1) 	Save left side 
 51:    LDC  3,0(6) 	Load constant 
 52:     LD  4,-4(1) 	Load left into ac1 
 53:    SUB  3,4,3 	op == 
 54:    JEQ  3,2(7) 	br if true 
 55:    LDC  3,0(6) 	false case 
 56:    LDA  7,1(7) 	unconditional jmp 
 57:    LDC  3,1(6) 	true case 
 58:    LDC  4,1(6) 	Load constant 1 
 59:    SUB  3,3,4 	If cond check 
 60:    JGE  3,1(7) 	Jump to then part 
* THEN
* RETURN
 62:    LDC  3,0(6) 	Load constant 
 63:    LDA  2,0(3) 	Copy result to rt register 
 64:     LD  3,-1(1) 	Load return address 
 65:     LD  1,0(1) 	Adjust fp 
 66:    LDA  7,0(3) 	Return 
 61:    LDA  7,5(7) 	 
* ENDIF
* IF
 67:     LD  3,-3(1) 	Load variable b
 68:     ST  3,-4(1) 	Save left side 
 69:    LDC  3,1(6) 	Load constant 
 70:     LD  4,-4(1) 	Load left into ac1 
 71:    SUB  3,4,3 	op == 
 72:    JEQ  3,2(7) 	br if true 
 73:    LDC  3,0(6) 	false case 
 74:    LDA  7,1(7) 	unconditional jmp 
 75:    LDC  3,1(6) 	true case 
 76:    LDC  4,1(6) 	Load constant 1 
 77:    SUB  3,3,4 	If cond check 
 78:    JGE  3,1(7) 	Jump to then part 
* THEN
* RETURN
 80:     LD  3,-2(1) 	Load variable a
 81:    LDA  2,0(3) 	Copy result to rt register 
 82:     LD  3,-1(1) 	Load return address 
 83:     LD  1,0(1) 	Adjust fp 
 84:    LDA  7,0(3) 	Return 
 79:    LDA  7,5(7) 	 
* ENDIF
* RETURN
 85:     ST  1,-4(1) 	Store old fp in ghost frame 
 86:     LD  3,-2(1) 	Load variable a
 87:     ST  3,-6(1) 	Save left side 
 88:    LDC  3,1(6) 	Load constant 
 89:     LD  4,-6(1) 	Load left into ac1 
 90:    SUB  3,4,3 	op - 
 91:     ST  3,-6(1) 	Store parameter 
 92:     LD  3,-3(1) 	Load variable b
 93:     ST  3,-7(1) 	Save left side 
 94:    LDC  3,1(6) 	Load constant 
 95:     LD  4,-7(1) 	Load left into ac1 
 96:    SUB  3,4,3 	op - 
 97:     ST  3,-7(1) 	Store parameter 
 98:    LDA  1,-4(1) 	Load address of new frame 
 99:    LDA  3,1(7) 	Return address in ac 
100:    LDA  7,-71(7) 	call comb
101:    LDA  3,0(2) 	Save the result in ac 
102:     ST  3,-4(1) 	Save left side 
103:     ST  1,-5(1) 	Store old fp in ghost frame 
104:     LD  3,-2(1) 	Load variable a
105:     ST  3,-7(1) 	Save left side 
106:    LDC  3,1(6) 	Load constant 
107:     LD  4,-7(1) 	Load left into ac1 
108:    SUB  3,4,3 	op - 
109:     ST  3,-7(1) 	Store parameter 
110:     LD  3,-3(1) 	Load variable b
111:     ST  3,-8(1) 	Store parameter 
112:    LDA  1,-5(1) 	Load address of new frame 
113:    LDA  3,1(7) 	Return address in ac 
114:    LDA  7,-85(7) 	call comb
115:    LDA  3,0(2) 	Save the result in ac 
116:     LD  4,-4(1) 	Load left into ac1 
117:    ADD  3,4,3 	op + 
118:    LDA  2,0(3) 	Copy result to rt register 
119:     LD  3,-1(1) 	Load return address 
120:     LD  1,0(1) 	Adjust fp 
121:    LDA  7,0(3) 	Return 
* END
* Add standard closing in case there is no return statement
122:    LDC  2,0(6) 	Set return value to 0 
123:     LD  3,-1(1) 	Load return address 
124:     LD  1,0(1) 	Adjust fp 
125:    LDA  7,0(3) 	Return 
* END of function comb
* BEGIN function main
  4:    LDA  7,121(7) 	Jump to main 
126:     ST  3,-1(1) 	Store return address to caller 
* BEGIN
* WHILE
127:    LDC  3,1(6) 	Load constant 
128:    LDC  4,1(6) 	Load constant 1 
129:    SUB  3,3,4 	While cond check 
130:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN
* 
132:     ST  1,-4(1) 	Store old fp in ghost frame 
133:    LDA  1,-4(1) 	Load address of new frame 
134:    LDA  3,1(7) 	Return address in ac 
135:    LDA  7,-130(7) 	call input
136:    LDA  3,0(2) 	Save the result in ac 
137:     ST  3,-2(1) 	Store variable a
* IF
138:     LD  3,-2(1) 	Load variable a
139:     ST  3,-4(1) 	Save left side 
140:    LDC  3,0(6) 	Load constant 
141:     LD  4,-4(1) 	Load left into ac1 
142:    SUB  3,4,3 	op == 
143:    JEQ  3,2(7) 	br if true 
144:    LDC  3,0(6) 	false case 
145:    LDA  7,1(7) 	unconditional jmp 
146:    LDC  3,1(6) 	true case 
147:    LDC  4,1(6) 	Load constant 1 
148:    SUB  3,3,4 	If cond check 
149:    JGE  3,1(7) 	Jump to then part 
* THEN
* RETURN
151:    LDA  2,0(3) 	Copy result to rt register 
152:     LD  3,-1(1) 	Load return address 
153:     LD  1,0(1) 	Adjust fp 
154:    LDA  7,0(3) 	Return 
150:    LDA  7,4(7) 	 
* ENDIF
* 
155:     ST  1,-4(1) 	Store old fp in ghost frame 
156:    LDA  1,-4(1) 	Load address of new frame 
157:    LDA  3,1(7) 	Return address in ac 
158:    LDA  7,-153(7) 	call input
159:    LDA  3,0(2) 	Save the result in ac 
160:     ST  3,-3(1) 	Store variable b
* 
161:     ST  1,-4(1) 	Store old fp in ghost frame 
162:     ST  1,-6(1) 	Store old fp in ghost frame 
163:     LD  3,-2(1) 	Load variable a
164:     ST  3,-8(1) 	Store parameter 
165:     LD  3,-3(1) 	Load variable b
166:     ST  3,-9(1) 	Store parameter 
167:    LDA  1,-6(1) 	Load address of new frame 
168:    LDA  3,1(7) 	Return address in ac 
169:    LDA  7,-140(7) 	call comb
170:    LDA  3,0(2) 	Save the result in ac 
171:     ST  3,-6(1) 	Store parameter 
172:    LDA  1,-4(1) 	Load address of new frame 
173:    LDA  3,1(7) 	Return address in ac 
174:    LDA  7,-164(7) 	call output
175:    LDA  3,0(2) 	Save the result in ac 
* END
176:    LDA  7,-50(7) 	go to beginning of loop 
131:    LDA  7,45(7) 	No more loop 
* ENDWHILE
* END
* Add standard closing in case there is no return statement
177:    LDC  2,0(6) 	Set return value to 0 
178:     LD  3,-1(1) 	Load return address 
179:     LD  1,0(1) 	Adjust fp 
180:    LDA  7,0(3) 	Return 
* END of function main
