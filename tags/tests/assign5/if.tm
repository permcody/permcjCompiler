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
 36:    LDC  3,3331(6) 	Load constant 
 37:     ST  3,-2(1) 	Store variable i
* 7
 38:    LDC  3,641(6) 	Load constant 
 39:     ST  3,-3(1) 	Store variable j
* IF
 40:     LD  3,-2(1) 	Load variable i
 41:     ST  3,-4(1) 	Save left side in temp 
 42:     LD  3,-3(1) 	Load variable j
 43:     LD  4,-4(1) 	Load left from temp into ac1 
 44:    SUB  4,4,3 	Op > 
 45:    LDC  3,1(6) 	True case 
 46:    JGT  4,1(7) 	Jump if true 
 47:    LDC  3,0(6) 	False case 
 48:    LDC  4,1(6) 	Load constant 1 
 49:    SUB  3,3,4 	If cond check 
 50:    JGE  3,1(7) 	Jump to then part 
* THEN
* 8
 52:    LDC  3,666(6) 	Load constant 
 53:     ST  3,-2(1) 	Store variable i
 51:    LDA  7,2(7) 	Jump around the THEN 
* ENDIF
* IF
 54:     LD  3,-3(1) 	Load variable j
 55:     ST  3,-4(1) 	Save left side in temp 
 56:     LD  3,-2(1) 	Load variable i
 57:     LD  4,-4(1) 	Load left from temp into ac1 
 58:    SUB  4,4,3 	Op == 
 59:    LDC  3,1(6) 	True case 
 60:    JEQ  4,1(7) 	Jump if true 
 61:    LDC  3,0(6) 	False case 
 62:    LDC  4,1(6) 	Load constant 1 
 63:    SUB  3,3,4 	If cond check 
 64:    JGE  3,1(7) 	Jump to then part 
* THEN
* 9
 66:    LDC  3,666(6) 	Load constant 
 67:     ST  3,-2(1) 	Store variable i
* ELSE
 65:    LDA  7,3(7) 	Jump around the THEN 
* 10
 69:    LDC  3,777(6) 	Load constant 
 70:     ST  3,-3(1) 	Store variable j
 68:    LDA  7,2(7) 	Jump around the ELSE 
* ENDIF
* 12
 71:     ST  1,-4(1) 	Store old fp in ghost frame 
 72:     LD  3,-2(1) 	Load variable i
 73:     ST  3,-6(1) 	Store parameter 
 74:    LDA  1,-4(1) 	Load address of new frame 
 75:    LDA  3,1(7) 	Return address in ac 
 76:    LDA  7,-66(7) 	call output
 77:    LDA  3,0(2) 	Save the result in ac 
* 13
 78:     ST  1,-4(1) 	Store old fp in ghost frame 
 79:     LD  3,-3(1) 	Load variable j
 80:     ST  3,-6(1) 	Store parameter 
 81:    LDA  1,-4(1) 	Load address of new frame 
 82:    LDA  3,1(7) 	Return address in ac 
 83:    LDA  7,-73(7) 	call output
 84:    LDA  3,0(2) 	Save the result in ac 
* 14
 85:     ST  1,-4(1) 	Store old fp in ghost frame 
 86:    LDA  1,-4(1) 	Load address of new frame 
 87:    LDA  3,1(7) 	Return address in ac 
 88:    LDA  7,-59(7) 	call outnl
 89:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
 90:    LDC  2,0(6) 	Set return value to 0 
 91:     LD  3,-1(1) 	Load return address 
 92:     LD  1,0(1) 	Adjust fp 
 93:    LDA  7,0(3) 	Return 
* END of function main
