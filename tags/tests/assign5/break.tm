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
* 6
 36:    LDC  3,0(6) 	Load constant 
 37:     ST  3,-2(1) 	Store variable i
* WHILE
 38:     LD  3,-2(1) 	Load variable i
 39:     ST  3,-4(1) 	Save left side in temp 
 40:    LDC  3,10(6) 	Load constant 
 41:     LD  4,-4(1) 	Load left from temp into ac1 
 42:    SUB  4,4,3 	Op < 
 43:    LDC  3,1(6) 	True case 
 44:    JLT  4,1(7) 	Jump if true 
 45:    LDC  3,0(6) 	False case 
 46:    LDC  4,1(6) 	Load constant 1 
 47:    SUB  3,3,4 	While cond check 
 48:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 8
 50:    LDC  3,0(6) 	Load constant 
 51:     ST  3,-3(1) 	Store variable j
* WHILE
 52:     LD  3,-3(1) 	Load variable j
 53:     ST  3,-4(1) 	Save left side in temp 
 54:    LDC  3,10(6) 	Load constant 
 55:     LD  4,-4(1) 	Load left from temp into ac1 
 56:    SUB  4,4,3 	Op < 
 57:    LDC  3,1(6) 	True case 
 58:    JLT  4,1(7) 	Jump if true 
 59:    LDC  3,0(6) 	False case 
 60:    LDC  4,1(6) 	Load constant 1 
 61:    SUB  3,3,4 	While cond check 
 62:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* IF
 64:     LD  3,-3(1) 	Load variable j
 65:     ST  3,-4(1) 	Save left side in temp 
 66:     LD  3,-2(1) 	Load variable i
 67:     LD  4,-4(1) 	Load left from temp into ac1 
 68:    SUB  4,4,3 	Op > 
 69:    LDC  3,1(6) 	True case 
 70:    JGT  4,1(7) 	Jump if true 
 71:    LDC  3,0(6) 	False case 
 72:    LDC  4,1(6) 	Load constant 1 
 73:    SUB  3,3,4 	If cond check 
 74:    JGE  3,1(7) 	Jump to then part 
* THEN
* BREAK
 76:    LDA  7,-14(7) 	break 
 75:    LDA  7,1(7) 	Jump around the THEN 
* ENDIF
* IF
 77:     LD  3,-3(1) 	Load variable j
 78:     ST  3,-4(1) 	Save left side in temp 
 79:    LDC  3,3(6) 	Load constant 
 80:     LD  4,-4(1) 	Load left from temp into ac1 
 81:    SUB  4,4,3 	Op == 
 82:    LDC  3,1(6) 	True case 
 83:    JEQ  4,1(7) 	Jump if true 
 84:    LDC  3,0(6) 	False case 
 85:    LDC  4,1(6) 	Load constant 1 
 86:    SUB  3,3,4 	If cond check 
 87:    JGE  3,1(7) 	Jump to then part 
* THEN
* BREAK
 89:    LDA  7,-27(7) 	break 
 88:    LDA  7,1(7) 	Jump around the THEN 
* ENDIF
* 12
 90:     ST  1,-4(1) 	Store old fp in ghost frame 
 91:     LD  3,-2(1) 	Load variable i
 92:     ST  3,-6(1) 	Store parameter 
 93:    LDA  1,-4(1) 	Load address of new frame 
 94:    LDA  3,1(7) 	Return address in ac 
 95:    LDA  7,-85(7) 	call output
 96:    LDA  3,0(2) 	Save the result in ac 
* 12
 97:     ST  1,-4(1) 	Store old fp in ghost frame 
 98:     LD  3,-3(1) 	Load variable j
 99:     ST  3,-6(1) 	Store parameter 
100:    LDA  1,-4(1) 	Load address of new frame 
101:    LDA  3,1(7) 	Return address in ac 
102:    LDA  7,-92(7) 	call output
103:    LDA  3,0(2) 	Save the result in ac 
* 12
104:     ST  1,-4(1) 	Store old fp in ghost frame 
105:    LDA  1,-4(1) 	Load address of new frame 
106:    LDA  3,1(7) 	Return address in ac 
107:    LDA  7,-78(7) 	call outnl
108:    LDA  3,0(2) 	Save the result in ac 
* 13
109:     LD  3,-3(1) 	Load variable j
110:     ST  3,-4(1) 	Save left side in temp 
111:    LDC  3,1(6) 	Load constant 
112:     LD  4,-4(1) 	Load left from temp into ac1 
113:    ADD  3,4,3 	Op + 
114:     ST  3,-3(1) 	Store variable j
* END compound statement
115:    LDA  7,-64(7) 	go to beginning of loop 
 63:    LDA  7,52(7) 	No more loop 
* ENDWHILE
* IF
116:     LD  3,-2(1) 	Load variable i
117:     ST  3,-4(1) 	Save left side in temp 
118:    LDC  3,5(6) 	Load constant 
119:     LD  4,-4(1) 	Load left from temp into ac1 
120:    SUB  4,4,3 	Op == 
121:    LDC  3,1(6) 	True case 
122:    JEQ  4,1(7) 	Jump if true 
123:    LDC  3,0(6) 	False case 
124:    LDC  4,1(6) 	Load constant 1 
125:    SUB  3,3,4 	If cond check 
126:    JGE  3,1(7) 	Jump to then part 
* THEN
* BREAK
128:    LDA  7,-80(7) 	break 
127:    LDA  7,1(7) 	Jump around the THEN 
* ENDIF
* 16
129:     LD  3,-2(1) 	Load variable i
130:     ST  3,-4(1) 	Save left side in temp 
131:    LDC  3,1(6) 	Load constant 
132:     LD  4,-4(1) 	Load left from temp into ac1 
133:    ADD  3,4,3 	Op + 
134:     ST  3,-2(1) 	Store variable i
* END compound statement
135:    LDA  7,-98(7) 	go to beginning of loop 
 49:    LDA  7,86(7) 	No more loop 
* ENDWHILE
* END compound statement
* Add standard closing in case there is no return statement
136:    LDC  2,0(6) 	Set return value to 0 
137:     LD  3,-1(1) 	Load return address 
138:     LD  1,0(1) 	Adjust fp 
139:    LDA  7,0(3) 	Return 
* END of function main
