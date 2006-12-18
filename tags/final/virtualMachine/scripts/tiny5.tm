* C- compiler version 1.0
* Author: Robert B. Heckendorn
* Apr 13, 2004
* BEGIN Prolog
  0:     LD  0,0(0) 	set the global pointer 
  1:    LDA  1,-3(0) 	set first frame at end of globals 
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
 31:    LDC  3,77(6) 	Load constant 
 32:     ST  3,-5(1) 	Save left side 
 33:    LDC  3,1(6) 	Load constant 
 34:     ST  3,-6(1) 	Save index 
 35:     LD  3,-2(1) 	Load address of base of array garion
 36:     LD  4,-6(1) 	Load index 
 37:    SUB  3,3,4 	Compute offset of value 
 38:     LD  3,0(3) 	Load the value 
 39:     LD  4,-5(1) 	Load left into ac1 
 40:    ADD  3,4,3 	op + 
 41:    LDA  2,0(3) 	Copy result to rt register 
 42:     LD  3,-1(1) 	Load return address 
 43:     LD  1,0(1) 	Adjust fp 
 44:    LDA  7,0(3) 	Return 
* END
* Add standard closing in case there is no return statement
 45:    LDC  2,0(6) 	Set return value to 0 
 46:     LD  3,-1(1) 	Load return address 
 47:     LD  1,0(1) 	Adjust fp 
 48:    LDA  7,0(3) 	Return 
* END of function wolf
* BEGIN function main
  4:    LDA  7,44(7) 	Jump to main 
 49:     ST  3,-1(1) 	Store return address to caller 
* BEGIN
* 
 50:    LDC  3,666(6) 	Load constant 
 51:     ST  3,-5(1) 	Save assign value 
 52:    LDC  3,1(6) 	Load constant 
 53:     ST  3,-6(1) 	Save index 
 54:     LD  5,-6(1) 	Load index 
 55:     LD  4,-5(1) 	Load value 
 56:    LDA  3,-2(1) 	Load address of base of array y
 57:    SUB  3,3,5 	Compute offset of value 
 58:     ST  4,0(3) 	Store the value 
 59:    LDA  3,0(4) 	Adjust ac 
* 
 60:     ST  1,-5(1) 	Store old fp in ghost frame 
 61:    LDA  3,-2(1) 	Load address of base of array y
 62:     ST  3,-7(1) 	Store parameter 
 63:    LDA  1,-5(1) 	Load address of new frame 
 64:    LDA  3,1(7) 	Return address in ac 
 65:    LDA  7,-36(7) 	call wolf
 66:    LDA  3,0(2) 	Save the result in ac 
* END
* Add standard closing in case there is no return statement
 67:    LDC  2,0(6) 	Set return value to 0 
 68:     LD  3,-1(1) 	Load return address 
 69:     LD  1,0(1) 	Adjust fp 
 70:    LDA  7,0(3) 	Return 
* END of function main
