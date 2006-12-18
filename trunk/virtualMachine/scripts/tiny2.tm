* C- compiler version 1.0
* Author: Robert B. Heckendorn
* Apr 13, 2004
* BEGIN Prolog
  0:     LD  0,0(0) 	set the global pointer 
  1:    LDA  1,-1(0) 	set first frame at end of globals 
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
* BEGIN function wolf
 30:     ST  3,-1(1) 	Store return address to caller 
* BEGIN
* RETURN
 31:    LDC  3,42(6) 	Load constant 
 32:    LDA  2,0(3) 	Copy result to rt register 
 33:     LD  3,-1(1) 	Load return address 
 34:     LD  1,0(1) 	Adjust fp 
 35:    LDA  7,0(3) 	Return 
* END
* Add standard closing in case there is no return statement
 36:    LDC  2,0(6) 	Set return value to 0 
 37:     LD  3,-1(1) 	Load return address 
 38:     LD  1,0(1) 	Adjust fp 
 39:    LDA  7,0(3) 	Return 
* END of function wolf
* BEGIN function main
  4:    LDA  7,35(7) 	Jump to main 
 40:     ST  3,-1(1) 	Store return address to caller 
* BEGIN
* 
 41:    LDC  3,666(6) 	Load constant 
 42:     ST  3,-2(1) 	Store variable x
* 
 43:    LDC  3,42(6) 	Load constant 
 44:     ST  3,0(0) 	Store variable y
* 
 45:     ST  1,-3(1) 	Store old fp in ghost frame 
 46:     LD  3,-2(1) 	Load variable x
 47:     ST  3,-5(1) 	Store parameter 
 48:    LDA  1,-3(1) 	Load address of new frame 
 49:    LDA  3,1(7) 	Return address in ac 
 50:    LDA  7,-21(7) 	call wolf
 51:    LDA  3,0(2) 	Save the result in ac 
 52:     ST  3,-2(1) 	Store variable x
* END
* Add standard closing in case there is no return statement
 53:    LDC  2,0(6) 	Set return value to 0 
 54:     LD  3,-1(1) 	Load return address 
 55:     LD  1,0(1) 	Adjust fp 
 56:    LDA  7,0(3) 	Return 
* END of function main
