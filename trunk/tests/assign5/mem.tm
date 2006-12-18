* C- compiler version C-06
* Author: Robert B. Heckendorn
* Backend coauthor: Jorge Williams
* Apr 1, 2006
* BEGIN Prolog
  0:     LD  0,0(0) 	Set the global pointer 
  1:    LDA  1,-5(0) 	set first frame at end of globals 
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
* BEGIN function polgara
 35:     ST  3,-1(1) 	Store return address. BEGIN FUNC: polgara
* BEGIN compound statement
* 10
 36:     LD  3,-2(1) 	Load variable a
 37:     ST  3,-4(1) 	Store variable x
* RETURN
 38:     LD  3,-4(1) 	Load variable x
 39:    LDA  2,0(3) 	Copy result to rt register 
 40:     LD  3,-1(1) 	Load return address 
 41:     LD  1,0(1) 	Adjust fp 
 42:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
 43:    LDC  2,0(6) 	Set return value to 0 
 44:     LD  3,-1(1) 	Load return address 
 45:     LD  1,0(1) 	Adjust fp 
 46:    LDA  7,0(3) 	Return 
* END of function polgara
* BEGIN function main
  4:    LDA  7,42(7) 	Jump to main 
 47:     ST  3,-1(1) 	Store return address. BEGIN FUNC: main
* BEGIN compound statement
* 22
 48:     ST  1,-10(1) 	Store old fp in ghost frame 
 49:     LD  3,-2(1) 	Load variable i
 50:     ST  3,-12(1) 	Save left side in temp 
 51:    LDC  3,43(6) 	Load constant 
 52:     LD  4,-12(1) 	Load left from temp into ac1 
 53:    ADD  3,4,3 	Op + 
 54:     ST  3,-12(1) 	Store parameter 
 55:     LD  3,-3(1) 	Load variable b
 56:     ST  3,-13(1) 	Store parameter 
 57:    LDA  1,-10(1) 	Load address of new frame 
 58:    LDA  3,1(7) 	Return address in ac 
 59:    LDA  7,-25(7) 	call polgara
 60:    LDA  3,0(2) 	Save the result in ac 
 61:     ST  3,-9(1) 	Store variable z
* 24
 62:    LDC  3,666(6) 	Load constant 
 63:     ST  3,0(0) 	Store variable u
* 25
 64:    LDC  3,3(6) 	Load constant 
 65:     ST  3,-10(1) 	Save index in temp 
 66:    LDC  3,1(6) 	Load constant 
 67:     LD  4,-10(1) 	load index from temp to ac1 
 68:    LDA  5,-1(0) 	Load address of base of array v
 69:    SUB  5,5,4 	Compute offset of value 
 70:     ST  3,0(5) 	Store variable v
* END compound statement
* Add standard closing in case there is no return statement
 71:    LDC  2,0(6) 	Set return value to 0 
 72:     LD  3,-1(1) 	Load return address 
 73:     LD  1,0(1) 	Adjust fp 
 74:    LDA  7,0(3) 	Return 
* END of function main
