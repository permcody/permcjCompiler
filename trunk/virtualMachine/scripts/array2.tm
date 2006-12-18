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
* BEGIN function ford
 30:     ST  3,-1(1) 	Store return address to caller 
* BEGIN
* 
 31:    LDC  3,3(6) 	Load constant 
 32:     ST  3,-4(1) 	Save index 
 33:     LD  3,-2(1) 	Load address of base of array x
 34:     LD  4,-4(1) 	Load index 
 35:    SUB  3,3,4 	Compute offset of value 
 36:     LD  3,0(3) 	Load the value 
 37:     ST  3,-3(1) 	Store variable y
* 
 38:     ST  1,-4(1) 	Store old fp in ghost frame 
 39:     LD  3,-3(1) 	Load variable y
 40:     ST  3,-6(1) 	Store parameter 
 41:    LDA  1,-4(1) 	Load address of new frame 
 42:    LDA  3,1(7) 	Return address in ac 
 43:    LDA  7,-33(7) 	call output
 44:    LDA  3,0(2) 	Save the result in ac 
* 
 45:    LDC  3,777(6) 	Load constant 
 46:     ST  3,-4(1) 	Save assign value 
 47:    LDC  3,3(6) 	Load constant 
 48:     ST  3,-5(1) 	Save index 
 49:     LD  5,-5(1) 	Load index 
 50:     LD  4,-4(1) 	Load value 
 51:     LD  3,-2(1) 	Load address of base of array x
 52:    SUB  3,3,5 	Compute offset of value 
 53:     ST  4,0(3) 	Store the value 
 54:    LDA  3,0(4) 	Adjust ac 
* END
* Add standard closing in case there is no return statement
 55:    LDC  2,0(6) 	Set return value to 0 
 56:     LD  3,-1(1) 	Load return address 
 57:     LD  1,0(1) 	Adjust fp 
 58:    LDA  7,0(3) 	Return 
* END of function ford
* BEGIN function main
  4:    LDA  7,54(7) 	Jump to main 
 59:     ST  3,-1(1) 	Store return address to caller 
* BEGIN
* 
 60:    LDC  3,666(6) 	Load constant 
 61:     ST  3,-7(1) 	Save assign value 
 62:    LDC  3,3(6) 	Load constant 
 63:     ST  3,-8(1) 	Save index 
 64:     LD  5,-8(1) 	Load index 
 65:     LD  4,-7(1) 	Load value 
 66:    LDA  3,-2(1) 	Load address of base of array y
 67:    SUB  3,3,5 	Compute offset of value 
 68:     ST  4,0(3) 	Store the value 
 69:    LDA  3,0(4) 	Adjust ac 
* 
 70:     ST  1,-7(1) 	Store old fp in ghost frame 
 71:    LDA  3,-2(1) 	Load address of base of array y
 72:     ST  3,-9(1) 	Store parameter 
 73:    LDA  1,-7(1) 	Load address of new frame 
 74:    LDA  3,1(7) 	Return address in ac 
 75:    LDA  7,-46(7) 	call ford
 76:    LDA  3,0(2) 	Save the result in ac 
* 
 77:    LDC  3,3(6) 	Load constant 
 78:     ST  3,-7(1) 	Save index 
 79:    LDA  3,-2(1) 	Load address of base of array y
 80:     LD  4,-7(1) 	Load index 
 81:    SUB  3,3,4 	Compute offset of value 
 82:     LD  3,0(3) 	Load the value 
* 
 83:     ST  1,-7(1) 	Store old fp in ghost frame 
 84:    LDC  3,3(6) 	Load constant 
 85:     ST  3,-9(1) 	Save index 
 86:    LDA  3,-2(1) 	Load address of base of array y
 87:     LD  4,-9(1) 	Load index 
 88:    SUB  3,3,4 	Compute offset of value 
 89:     LD  3,0(3) 	Load the value 
 90:     ST  3,-9(1) 	Store parameter 
 91:    LDA  1,-7(1) 	Load address of new frame 
 92:    LDA  3,1(7) 	Return address in ac 
 93:    LDA  7,-83(7) 	call output
 94:    LDA  3,0(2) 	Save the result in ac 
* END
* Add standard closing in case there is no return statement
 95:    LDC  2,0(6) 	Set return value to 0 
 96:     LD  3,-1(1) 	Load return address 
 97:     LD  1,0(1) 	Adjust fp 
 98:    LDA  7,0(3) 	Return 
* END of function main
