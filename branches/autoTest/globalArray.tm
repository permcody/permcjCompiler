* C- compiler version C-06
* Author: Robert B. Heckendorn
* Backend coauthor: Jorge Williams
* Apr 1, 2006
* BEGIN Prolog
  0:     LD  0,0(0) 	Set the global pointer 
  1:    LDA  1,-7(0) 	set first frame at end of globals 
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
* 7
 36:    LDC  3,2(6) 	Load constant 
 37:     ST  3,-2(1) 	Save index in temp 
 38:    LDC  3,666(6) 	Load constant 
 39:     LD  4,-2(1) 	load index from temp to ac1 
 40:    LDA  5,0(0) 	Load address of base of array x
 41:    SUB  5,5,4 	Compute offset of value 
 42:     ST  3,0(5) 	Store variable x
* 8
 43:    LDC  3,3(6) 	Load constant 
 44:     ST  3,-2(1) 	Save index in temp 
 45:    LDC  3,1(6) 	Load constant 
 46:     LD  4,-2(1) 	load index from temp to ac1 
 47:    LDA  5,-3(0) 	Load address of base of array b
 48:    SUB  5,5,4 	Compute offset of value 
 49:     ST  3,0(5) 	Store variable b
* 10
 50:     ST  1,-2(1) 	Store old fp in ghost frame 
 51:    LDC  3,2(6) 	Load constant 
 52:    LDA  4,0(0) 	Load address of base of array x
 53:    SUB  3,4,3 	Compute offset of value 
 54:     LD  3,0(3) 	Load the value 
 55:     ST  3,-4(1) 	Store parameter 
 56:    LDA  1,-2(1) 	Load address of new frame 
 57:    LDA  3,1(7) 	Return address in ac 
 58:    LDA  7,-48(7) 	call output
 59:    LDA  3,0(2) 	Save the result in ac 
* 11
 60:     ST  1,-2(1) 	Store old fp in ghost frame 
 61:    LDC  3,3(6) 	Load constant 
 62:    LDA  4,-3(0) 	Load address of base of array b
 63:    SUB  3,4,3 	Compute offset of value 
 64:     LD  3,0(3) 	Load the value 
 65:     ST  3,-4(1) 	Store parameter 
 66:    LDA  1,-2(1) 	Load address of new frame 
 67:    LDA  3,1(7) 	Return address in ac 
 68:    LDA  7,-46(7) 	call outputb
 69:    LDA  3,0(2) 	Save the result in ac 
* RETURN
 70:    LDA  2,0(3) 	Copy result to rt register 
 71:     LD  3,-1(1) 	Load return address 
 72:     LD  1,0(1) 	Adjust fp 
 73:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
 74:    LDC  2,0(6) 	Set return value to 0 
 75:     LD  3,-1(1) 	Load return address 
 76:     LD  1,0(1) 	Adjust fp 
 77:    LDA  7,0(3) 	Return 
* END of function main
