* C- compiler version 1.0
* Author: Robert B. Heckendorn
* Apr 13, 2004
* BEGIN Prolog
  0:     LD  0,0(0) 	set the global pointer 
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
* BEGIN function wolf
 30:     ST  3,-1(1) 	Store return address to caller 
* BEGIN
* RETURN
 31:    LDC  3,1(6) 	Load constant 
 32:     ST  3,-5(1) 	Save index 
 33:     LD  3,-2(1) 	Load address of base of array garion
 34:     LD  4,-5(1) 	Load index 
 35:    SUB  3,3,4 	Compute offset of value 
 36:     LD  3,0(3) 	Load the value 
 37:    LDA  2,0(3) 	Copy result to rt register 
 38:     LD  3,-1(1) 	Load return address 
 39:     LD  1,0(1) 	Adjust fp 
 40:    LDA  7,0(3) 	Return 
* END
* Add standard closing in case there is no return statement
 41:    LDC  2,0(6) 	Set return value to 0 
 42:     LD  3,-1(1) 	Load return address 
 43:     LD  1,0(1) 	Adjust fp 
 44:    LDA  7,0(3) 	Return 
* END of function wolf
* BEGIN function main
  4:    LDA  7,40(7) 	Jump to main 
 45:     ST  3,-1(1) 	Store return address to caller 
* BEGIN
* 
 46:    LDC  3,666(6) 	Load constant 
 47:     ST  3,-5(1) 	Save assign value 
 48:    LDC  3,1(6) 	Load constant 
 49:     ST  3,-6(1) 	Save index 
 50:     LD  5,-6(1) 	Load index 
 51:     LD  4,-5(1) 	Load value 
 52:    LDA  3,-2(1) 	Load address of base of array y
 53:    SUB  3,3,5 	Compute offset of value 
 54:     ST  4,0(3) 	Store the value 
 55:    LDA  3,0(4) 	Adjust ac 
* 
 56:     ST  1,-5(1) 	Store old fp in ghost frame 
 57:    LDA  3,-2(1) 	Load address of base of array y
 58:     ST  3,-7(1) 	Store parameter 
 59:    LDA  1,-5(1) 	Load address of new frame 
 60:    LDA  3,1(7) 	Return address in ac 
 61:    LDA  7,-32(7) 	call wolf
 62:    LDA  3,0(2) 	Save the result in ac 
* END
* Add standard closing in case there is no return statement
 63:    LDC  2,0(6) 	Set return value to 0 
 64:     LD  3,-1(1) 	Load return address 
 65:     LD  1,0(1) 	Adjust fp 
 66:    LDA  7,0(3) 	Return 
* END of function main
