* C- compiler version 1.0
* Author: Robert B. Heckendorn
* Apr 13, 2004
* BEGIN Prolog
  0:     LD  0,0(0) 	set the global pointer 
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
* BEGIN function polgara
 30:     ST  3,-1(1) 	Store return address to caller 
* BEGIN
* 
 31:     LD  3,-2(1) 	Load variable a
 32:     ST  3,-4(1) 	Store variable x
* RETURN
 33:     LD  3,-4(1) 	Load variable x
 34:    LDA  2,0(3) 	Copy result to rt register 
 35:     LD  3,-1(1) 	Load return address 
 36:     LD  1,0(1) 	Adjust fp 
 37:    LDA  7,0(3) 	Return 
* END
* Add standard closing in case there is no return statement
 38:    LDC  2,0(6) 	Set return value to 0 
 39:     LD  3,-1(1) 	Load return address 
 40:     LD  1,0(1) 	Adjust fp 
 41:    LDA  7,0(3) 	Return 
* END of function polgara
* BEGIN function main
  4:    LDA  7,37(7) 	Jump to main 
 42:     ST  3,-1(1) 	Store return address to caller 
* BEGIN
* 
 43:     ST  1,-10(1) 	Store old fp in ghost frame 
 44:     LD  3,-2(1) 	Load variable i
 45:     ST  3,-12(1) 	Save left side 
 46:    LDC  3,43(6) 	Load constant 
 47:     LD  4,-12(1) 	Load left into ac1 
 48:    ADD  3,4,3 	op + 
 49:     ST  3,-12(1) 	Store parameter 
 50:     LD  3,-3(1) 	Load variable b
 51:     ST  3,-13(1) 	Store parameter 
 52:    LDA  1,-10(1) 	Load address of new frame 
 53:    LDA  3,1(7) 	Return address in ac 
 54:    LDA  7,-25(7) 	call polgara
 55:    LDA  3,0(2) 	Save the result in ac 
 56:     ST  3,-9(1) 	Store variable z
* 
 57:    LDC  3,666(6) 	Load constant 
 58:     ST  3,0(0) 	Store variable u
* 
 59:    LDC  3,1(6) 	Load constant 
 60:     ST  3,-10(1) 	Save assign value 
 61:    LDC  3,3(6) 	Load constant 
 62:     ST  3,-11(1) 	Save index 
 63:     LD  5,-11(1) 	Load index 
 64:     LD  4,-10(1) 	Load value 
 65:    LDA  3,-1(0) 	Load address of base of array v
 66:    SUB  3,3,5 	Compute offset of value 
 67:     ST  4,0(3) 	Store the value 
 68:    LDA  3,0(4) 	Adjust ac 
* END
* Add standard closing in case there is no return statement
 69:    LDC  2,0(6) 	Set return value to 0 
 70:     LD  3,-1(1) 	Load return address 
 71:     LD  1,0(1) 	Adjust fp 
 72:    LDA  7,0(3) 	Return 
* END of function main
