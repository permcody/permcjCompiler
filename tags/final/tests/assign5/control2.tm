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
 36:    LDC  3,10(6) 	Load constant 
 37:     ST  3,-2(1) 	Store variable x
* 9
 38:    LDC  3,7(6) 	Load constant 
 39:     ST  3,-3(1) 	Store variable y
* WHILE
 40:     LD  3,-2(1) 	Load variable x
 41:     ST  3,-4(1) 	Save left side in temp 
 42:    LDC  3,0(6) 	Load constant 
 43:     LD  4,-4(1) 	Load left from temp into ac1 
 44:    SUB  4,4,3 	Op > 
 45:    LDC  3,1(6) 	True case 
 46:    JGT  4,1(7) 	Jump if true 
 47:    LDC  3,0(6) 	False case 
 48:    LDC  4,1(6) 	Load constant 1 
 49:    SUB  3,3,4 	While cond check 
 50:    JGE  3,1(7) 	Jump to while part 
* DO
* IF
 52:     LD  3,-2(1) 	Load variable x
 53:     ST  3,-4(1) 	Save left side in temp 
 54:     LD  3,-3(1) 	Load variable y
 55:     LD  4,-4(1) 	Load left from temp into ac1 
 56:    SUB  4,4,3 	Op == 
 57:    LDC  3,1(6) 	True case 
 58:    JEQ  4,1(7) 	Jump if true 
 59:    LDC  3,0(6) 	False case 
 60:    LDC  4,1(6) 	Load constant 1 
 61:    SUB  3,3,4 	If cond check 
 62:    JGE  3,1(7) 	Jump to then part 
* THEN
* 10
 64:    LDC  3,666(6) 	Load constant 
 65:     ST  3,-3(1) 	Store variable y
* ELSE
 63:    LDA  7,3(7) 	Jump around the THEN 
* 10
 67:     LD  3,-2(1) 	Load variable x
 68:     ST  3,-4(1) 	Save left side in temp 
 69:    LDC  3,1(6) 	Load constant 
 70:     LD  4,-4(1) 	Load left from temp into ac1 
 71:    SUB  3,4,3 	Op - 
 72:     ST  3,-2(1) 	Store variable x
 66:    LDA  7,6(7) 	Jump around the ELSE 
* ENDIF
 73:    LDA  7,-34(7) 	go to beginning of loop 
 51:    LDA  7,22(7) 	No more loop 
* ENDWHILE
* 11
 74:     ST  1,-4(1) 	Store old fp in ghost frame 
 75:     LD  3,-3(1) 	Load variable y
 76:     ST  3,-6(1) 	Store parameter 
 77:    LDA  1,-4(1) 	Load address of new frame 
 78:    LDA  3,1(7) 	Return address in ac 
 79:    LDA  7,-69(7) 	call output
 80:    LDA  3,0(2) 	Save the result in ac 
* 12
 81:     ST  1,-4(1) 	Store old fp in ghost frame 
 82:    LDA  1,-4(1) 	Load address of new frame 
 83:    LDA  3,1(7) 	Return address in ac 
 84:    LDA  7,-55(7) 	call outnl
 85:    LDA  3,0(2) 	Save the result in ac 
* 14
 86:    LDC  3,1(6) 	Load constant 
 87:     ST  3,-2(1) 	Store variable x
* 15
 88:    LDC  3,1(6) 	Load constant 
 89:     ST  3,-3(1) 	Store variable y
* WHILE
 90:     LD  3,-2(1) 	Load variable x
 91:     ST  3,-4(1) 	Save left side in temp 
 92:    LDC  3,5(6) 	Load constant 
 93:     LD  4,-4(1) 	Load left from temp into ac1 
 94:    SUB  4,4,3 	Op < 
 95:    LDC  3,1(6) 	True case 
 96:    JLT  4,1(7) 	Jump if true 
 97:    LDC  3,0(6) 	False case 
 98:    LDC  4,1(6) 	Load constant 1 
 99:    SUB  3,3,4 	While cond check 
100:    JGE  3,1(7) 	Jump to while part 
* DO
* IF
102:     LD  3,-3(1) 	Load variable y
103:     ST  3,-4(1) 	Save left side in temp 
104:    LDC  3,5(6) 	Load constant 
105:     LD  4,-4(1) 	Load left from temp into ac1 
106:    SUB  4,4,3 	Op < 
107:    LDC  3,1(6) 	True case 
108:    JLT  4,1(7) 	Jump if true 
109:    LDC  3,0(6) 	False case 
110:    LDC  4,1(6) 	Load constant 1 
111:    SUB  3,3,4 	If cond check 
112:    JGE  3,1(7) 	Jump to then part 
* THEN
* WHILE
114:     LD  3,-3(1) 	Load variable y
115:     ST  3,-4(1) 	Save left side in temp 
116:    LDC  3,5(6) 	Load constant 
117:     LD  4,-4(1) 	Load left from temp into ac1 
118:    SUB  4,4,3 	Op < 
119:    LDC  3,1(6) 	True case 
120:    JLT  4,1(7) 	Jump if true 
121:    LDC  3,0(6) 	False case 
122:    LDC  4,1(6) 	Load constant 1 
123:    SUB  3,3,4 	While cond check 
124:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 17
126:     ST  1,-4(1) 	Store old fp in ghost frame 
127:     LD  3,-2(1) 	Load variable x
128:     ST  3,-6(1) 	Store parameter 
129:    LDA  1,-4(1) 	Load address of new frame 
130:    LDA  3,1(7) 	Return address in ac 
131:    LDA  7,-121(7) 	call output
132:    LDA  3,0(2) 	Save the result in ac 
* 17
133:     ST  1,-4(1) 	Store old fp in ghost frame 
134:     LD  3,-3(1) 	Load variable y
135:     ST  3,-6(1) 	Store parameter 
136:    LDA  1,-4(1) 	Load address of new frame 
137:    LDA  3,1(7) 	Return address in ac 
138:    LDA  7,-128(7) 	call output
139:    LDA  3,0(2) 	Save the result in ac 
* 17
140:     ST  1,-4(1) 	Store old fp in ghost frame 
141:    LDA  1,-4(1) 	Load address of new frame 
142:    LDA  3,1(7) 	Return address in ac 
143:    LDA  7,-114(7) 	call outnl
144:    LDA  3,0(2) 	Save the result in ac 
* 18
145:     LD  3,-3(1) 	Load variable y
146:     ST  3,-4(1) 	Save left side in temp 
147:    LDC  3,1(6) 	Load constant 
148:     LD  4,-4(1) 	Load left from temp into ac1 
149:    ADD  3,4,3 	Op + 
150:     ST  3,-3(1) 	Store variable y
* END compound statement
151:    LDA  7,-38(7) 	go to beginning of loop 
125:    LDA  7,26(7) 	No more loop 
* ENDWHILE
* ELSE
113:    LDA  7,39(7) 	Jump around the THEN 
* BEGIN compound statement
* 19
153:    LDC  3,1(6) 	Load constant 
154:     ST  3,-3(1) 	Store variable y
* 19
155:     LD  3,-2(1) 	Load variable x
156:     ST  3,-4(1) 	Save left side in temp 
157:    LDC  3,1(6) 	Load constant 
158:     LD  4,-4(1) 	Load left from temp into ac1 
159:    ADD  3,4,3 	Op + 
160:     ST  3,-2(1) 	Store variable x
* END compound statement
152:    LDA  7,8(7) 	Jump around the ELSE 
* ENDIF
161:    LDA  7,-72(7) 	go to beginning of loop 
101:    LDA  7,60(7) 	No more loop 
* ENDWHILE
* 20
162:     ST  1,-4(1) 	Store old fp in ghost frame 
163:     LD  3,-2(1) 	Load variable x
164:     ST  3,-6(1) 	Store parameter 
165:    LDA  1,-4(1) 	Load address of new frame 
166:    LDA  3,1(7) 	Return address in ac 
167:    LDA  7,-157(7) 	call output
168:    LDA  3,0(2) 	Save the result in ac 
* RETURN
169:    LDA  2,0(3) 	Copy result to rt register 
170:     LD  3,-1(1) 	Load return address 
171:     LD  1,0(1) 	Adjust fp 
172:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
173:    LDC  2,0(6) 	Set return value to 0 
174:     LD  3,-1(1) 	Load return address 
175:     LD  1,0(1) 	Adjust fp 
176:    LDA  7,0(3) 	Return 
* END of function main
