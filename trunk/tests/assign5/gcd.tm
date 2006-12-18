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
* BEGIN function gcd
 35:     ST  3,-1(1) 	Store return address. BEGIN FUNC: gcd
* BEGIN compound statement
* IF
 36:     LD  3,-3(1) 	Load variable v
 37:     ST  3,-4(1) 	Save left side in temp 
 38:    LDC  3,0(6) 	Load constant 
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
 48:     LD  3,-2(1) 	Load variable u
 49:    LDA  2,0(3) 	Copy result to rt register 
 50:     LD  3,-1(1) 	Load return address 
 51:     LD  1,0(1) 	Adjust fp 
 52:    LDA  7,0(3) 	Return 
* ELSE
 47:    LDA  7,6(7) 	Jump around the THEN 
* RETURN
 54:     ST  1,-4(1) 	Store old fp in ghost frame 
 55:     LD  3,-3(1) 	Load variable v
 56:     ST  3,-6(1) 	Store parameter 
 57:     LD  3,-2(1) 	Load variable u
 58:     ST  3,-7(1) 	Save left side in temp 
 59:     LD  3,-2(1) 	Load variable u
 60:     ST  3,-8(1) 	Save left side in temp 
 61:     LD  3,-3(1) 	Load variable v
 62:     LD  4,-8(1) 	Load left from temp into ac1 
 63:    DIV  3,4,3 	Op / 
 64:     ST  3,-8(1) 	Save left side in temp 
 65:     LD  3,-3(1) 	Load variable v
 66:     LD  4,-8(1) 	Load left from temp into ac1 
 67:    MUL  3,4,3 	Op * 
 68:     LD  4,-7(1) 	Load left from temp into ac1 
 69:    SUB  3,4,3 	Op - 
 70:     ST  3,-7(1) 	Store parameter 
 71:    LDA  1,-4(1) 	Load address of new frame 
 72:    LDA  3,1(7) 	Return address in ac 
 73:    LDA  7,-39(7) 	call gcd
 74:    LDA  3,0(2) 	Save the result in ac 
 75:    LDA  2,0(3) 	Copy result to rt register 
 76:     LD  3,-1(1) 	Load return address 
 77:     LD  1,0(1) 	Adjust fp 
 78:    LDA  7,0(3) 	Return 
 53:    LDA  7,25(7) 	Jump around the ELSE 
* ENDIF
* END compound statement
* Add standard closing in case there is no return statement
 79:    LDC  2,0(6) 	Set return value to 0 
 80:     LD  3,-1(1) 	Load return address 
 81:     LD  1,0(1) 	Adjust fp 
 82:    LDA  7,0(3) 	Return 
* END of function gcd
* BEGIN function main
  4:    LDA  7,78(7) 	Jump to main 
 83:     ST  3,-1(1) 	Store return address. BEGIN FUNC: main
* BEGIN compound statement
* 16
 84:     ST  1,-5(1) 	Store old fp in ghost frame 
 85:    LDA  1,-5(1) 	Load address of new frame 
 86:    LDA  3,1(7) 	Return address in ac 
 87:    LDA  7,-82(7) 	call input
 88:    LDA  3,0(2) 	Save the result in ac 
 89:     ST  3,-2(1) 	Store variable x
* 17
 90:     ST  1,-5(1) 	Store old fp in ghost frame 
 91:    LDA  1,-5(1) 	Load address of new frame 
 92:    LDA  3,1(7) 	Return address in ac 
 93:    LDA  7,-88(7) 	call input
 94:    LDA  3,0(2) 	Save the result in ac 
 95:     ST  3,-3(1) 	Store variable y
* 18
 96:     ST  1,-5(1) 	Store old fp in ghost frame 
 97:     LD  3,-2(1) 	Load variable x
 98:     ST  3,-7(1) 	Store parameter 
 99:     LD  3,-3(1) 	Load variable y
100:     ST  3,-8(1) 	Store parameter 
101:    LDA  1,-5(1) 	Load address of new frame 
102:    LDA  3,1(7) 	Return address in ac 
103:    LDA  7,-69(7) 	call gcd
104:    LDA  3,0(2) 	Save the result in ac 
105:     ST  3,-4(1) 	Store variable z
* 19
106:     ST  1,-5(1) 	Store old fp in ghost frame 
107:     LD  3,-4(1) 	Load variable z
108:     ST  3,-7(1) 	Store parameter 
109:    LDA  1,-5(1) 	Load address of new frame 
110:    LDA  3,1(7) 	Return address in ac 
111:    LDA  7,-101(7) 	call output
112:    LDA  3,0(2) 	Save the result in ac 
* 20
113:     ST  1,-5(1) 	Store old fp in ghost frame 
114:    LDA  1,-5(1) 	Load address of new frame 
115:    LDA  3,1(7) 	Return address in ac 
116:    LDA  7,-87(7) 	call outnl
117:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
118:    LDC  2,0(6) 	Set return value to 0 
119:     LD  3,-1(1) 	Load return address 
120:     LD  1,0(1) 	Adjust fp 
121:    LDA  7,0(3) 	Return 
* END of function main
