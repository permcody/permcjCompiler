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
* BEGIN function kate
 35:     ST  3,-1(1) 	Store return address. BEGIN FUNC: kate
* BEGIN compound statement
* RETURN
 36:    LDC  3,666(6) 	Load constant 
 37:    LDA  2,0(3) 	Copy result to rt register 
 38:     LD  3,-1(1) 	Load return address 
 39:     LD  1,0(1) 	Adjust fp 
 40:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
 41:    LDC  2,0(6) 	Set return value to 0 
 42:     LD  3,-1(1) 	Load return address 
 43:     LD  1,0(1) 	Adjust fp 
 44:    LDA  7,0(3) 	Return 
* END of function kate
* BEGIN function main
  4:    LDA  7,40(7) 	Jump to main 
 45:     ST  3,-1(1) 	Store return address. BEGIN FUNC: main
* BEGIN compound statement
* 12
 46:     ST  1,-7(1) 	Store old fp in ghost frame 
 47:    LDC  3,103(6) 	Load constant 
 48:     ST  3,-9(1) 	Save left side in temp 
 49:    LDC  3,101(6) 	Load constant 
 50:     LD  4,-9(1) 	Load left from temp into ac1 
 51:    ADD  3,4,3 	Op + 
 52:     ST  3,-9(1) 	Store parameter 
 53:    LDC  3,1(6) 	Load constant 
 54:     ST  3,-10(1) 	Store parameter 
 55:    LDA  3,-2(1) 	Load address of base of array inta
 56:     ST  3,-11(1) 	Store parameter 
 57:    LDA  3,-4(1) 	Load address of base of array boola
 58:     ST  3,-12(1) 	Store parameter 
 59:    LDA  1,-7(1) 	Load address of new frame 
 60:    LDA  3,1(7) 	Return address in ac 
 61:    LDA  7,-27(7) 	call kate
 62:    LDA  3,0(2) 	Save the result in ac 
* RETURN
 63:    LDC  3,42(6) 	Load constant 
 64:    LDA  2,0(3) 	Copy result to rt register 
 65:     LD  3,-1(1) 	Load return address 
 66:     LD  1,0(1) 	Adjust fp 
 67:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
 68:    LDC  2,0(6) 	Set return value to 0 
 69:     LD  3,-1(1) 	Load return address 
 70:     LD  1,0(1) 	Adjust fp 
 71:    LDA  7,0(3) 	Return 
* END of function main
