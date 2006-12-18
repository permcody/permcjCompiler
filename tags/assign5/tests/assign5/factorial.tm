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
* BEGIN function factorial
 35:     ST  3,-1(1) 	Store return address. BEGIN FUNC: factorial
* BEGIN compound statement
* 6
 36:    LDC  3,1(6) 	Load constant 
 37:     ST  3,-3(1) 	Store variable i
 38:     ST  3,-4(1) 	Store variable f
* WHILE
 39:     LD  3,-3(1) 	Load variable i
 40:     ST  3,-5(1) 	Save left side in temp 
 41:     LD  3,-2(1) 	Load variable n
 42:     LD  4,-5(1) 	Load left from temp into ac1 
 43:    SUB  4,4,3 	Op <= 
 44:    LDC  3,1(6) 	True case 
 45:    JLE  4,1(7) 	Jump if true 
 46:    LDC  3,0(6) 	False case 
 47:    LDC  4,1(6) 	Load constant 1 
 48:    SUB  3,3,4 	While cond check 
 49:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 8
 51:     ST  1,-5(1) 	Store old fp in ghost frame 
 52:     LD  3,-3(1) 	Load variable i
 53:     ST  3,-7(1) 	Store parameter 
 54:    LDA  1,-5(1) 	Load address of new frame 
 55:    LDA  3,1(7) 	Return address in ac 
 56:    LDA  7,-46(7) 	call output
 57:    LDA  3,0(2) 	Save the result in ac 
* 9
 58:     LD  3,-4(1) 	Load variable f
 59:     ST  3,-5(1) 	Save left side in temp 
 60:     LD  3,-3(1) 	Load variable i
 61:     LD  4,-5(1) 	Load left from temp into ac1 
 62:    MUL  3,4,3 	Op * 
 63:     ST  3,-4(1) 	Store variable f
* 10
 64:     LD  3,-3(1) 	Load variable i
 65:     ST  3,-5(1) 	Save left side in temp 
 66:    LDC  3,1(6) 	Load constant 
 67:     LD  4,-5(1) 	Load left from temp into ac1 
 68:    ADD  3,4,3 	Op + 
 69:     ST  3,-3(1) 	Store variable i
* END compound statement
 70:    LDA  7,-32(7) 	go to beginning of loop 
 50:    LDA  7,20(7) 	No more loop 
* ENDWHILE
* RETURN
 71:     LD  3,-4(1) 	Load variable f
 72:    LDA  2,0(3) 	Copy result to rt register 
 73:     LD  3,-1(1) 	Load return address 
 74:     LD  1,0(1) 	Adjust fp 
 75:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
 76:    LDC  2,0(6) 	Set return value to 0 
 77:     LD  3,-1(1) 	Load return address 
 78:     LD  1,0(1) 	Adjust fp 
 79:    LDA  7,0(3) 	Return 
* END of function factorial
* BEGIN function main
  4:    LDA  7,75(7) 	Jump to main 
 80:     ST  3,-1(1) 	Store return address. BEGIN FUNC: main
* BEGIN compound statement
* 18
 81:     ST  1,-3(1) 	Store old fp in ghost frame 
 82:    LDA  1,-3(1) 	Load address of new frame 
 83:    LDA  3,1(7) 	Return address in ac 
 84:    LDA  7,-79(7) 	call input
 85:    LDA  3,0(2) 	Save the result in ac 
 86:     ST  3,-2(1) 	Store variable n
* 19
 87:     ST  1,-3(1) 	Store old fp in ghost frame 
 88:     LD  3,-2(1) 	Load variable n
 89:     ST  3,-5(1) 	Store parameter 
 90:    LDA  1,-3(1) 	Load address of new frame 
 91:    LDA  3,1(7) 	Return address in ac 
 92:    LDA  7,-58(7) 	call factorial
 93:    LDA  3,0(2) 	Save the result in ac 
 94:     ST  3,-2(1) 	Store variable n
* 20
 95:     ST  1,-3(1) 	Store old fp in ghost frame 
 96:     LD  3,-2(1) 	Load variable n
 97:     ST  3,-5(1) 	Store parameter 
 98:    LDA  1,-3(1) 	Load address of new frame 
 99:    LDA  3,1(7) 	Return address in ac 
100:    LDA  7,-90(7) 	call output
101:    LDA  3,0(2) 	Save the result in ac 
* 21
102:     ST  1,-3(1) 	Store old fp in ghost frame 
103:    LDA  1,-3(1) 	Load address of new frame 
104:    LDA  3,1(7) 	Return address in ac 
105:    LDA  7,-76(7) 	call outnl
106:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
107:    LDC  2,0(6) 	Set return value to 0 
108:     LD  3,-1(1) 	Load return address 
109:     LD  1,0(1) 	Adjust fp 
110:    LDA  7,0(3) 	Return 
* END of function main
