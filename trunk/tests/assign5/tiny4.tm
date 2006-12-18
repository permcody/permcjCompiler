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
* BEGIN function wolf
 35:     ST  3,-1(1) 	Store return address. BEGIN FUNC: wolf
* BEGIN compound statement
* RETURN
 36:    LDC  3,1(6) 	Load constant 
 37:     LD  4,-2(1) 	Load address of base of array garion
 38:    SUB  3,4,3 	Compute offset of value 
 39:     LD  3,0(3) 	Load the value 
 40:    LDA  2,0(3) 	Copy result to rt register 
 41:     LD  3,-1(1) 	Load return address 
 42:     LD  1,0(1) 	Adjust fp 
 43:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
 44:    LDC  2,0(6) 	Set return value to 0 
 45:     LD  3,-1(1) 	Load return address 
 46:     LD  1,0(1) 	Adjust fp 
 47:    LDA  7,0(3) 	Return 
* END of function wolf
* BEGIN function main
  4:    LDA  7,43(7) 	Jump to main 
 48:     ST  3,-1(1) 	Store return address. BEGIN FUNC: main
* BEGIN compound statement
* 11
 49:    LDC  3,1(6) 	Load constant 
 50:     ST  3,-5(1) 	Save index in temp 
 51:    LDC  3,666(6) 	Load constant 
 52:     LD  4,-5(1) 	load index from temp to ac1 
 53:    LDA  5,-2(1) 	Load address of base of array y
 54:    SUB  5,5,4 	Compute offset of value 
 55:     ST  3,0(5) 	Store variable y
* 12
 56:     ST  1,-5(1) 	Store old fp in ghost frame 
 57:    LDA  3,-2(1) 	Load address of base of array y
 58:     ST  3,-7(1) 	Store parameter 
 59:    LDA  1,-5(1) 	Load address of new frame 
 60:    LDA  3,1(7) 	Return address in ac 
 61:    LDA  7,-27(7) 	call wolf
 62:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
 63:    LDC  2,0(6) 	Set return value to 0 
 64:     LD  3,-1(1) 	Load return address 
 65:     LD  1,0(1) 	Adjust fp 
 66:    LDA  7,0(3) 	Return 
* END of function main
