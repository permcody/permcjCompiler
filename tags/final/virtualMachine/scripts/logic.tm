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
* BEGIN function main
  4:    LDA  7,25(7) 	Jump to main 
 30:     ST  3,-1(1) 	Store return address to caller 
* BEGIN
* 
 31:    LDC  3,1(6) 	Load constant 
 32:     ST  3,-2(1) 	Store variable a
* 
 33:    LDC  3,0(6) 	Load constant 
 34:     ST  3,-3(1) 	Store variable b
* 
 35:     LD  3,-2(1) 	Load variable a
 36:     ST  3,-6(1) 	Save left side 
 37:     LD  3,-3(1) 	Load variable b
 38:     LD  4,-6(1) 	Load left into ac1 
 39:    LDC  5,1(6) 	op && 
 40:    SUB  6,4,5 	 
 41:    JLT  6,4(7) 	jump if false 
 42:    SUB  6,3,5 	 
 43:    JLT  6,2(7) 	jump if false 
 44:    LDC  3,1(6) 	true case 
 45:    LDA  7,1(7) 	unconditional jmp 
 46:    LDC  3,0(6) 	false case 
* 
 47:     LD  3,-2(1) 	Load variable a
 48:     ST  3,-6(1) 	Save left side 
 49:     LD  3,-3(1) 	Load variable b
 50:     LD  4,-6(1) 	Load left into ac1 
 51:    LDC  5,1(6) 	op && 
 52:    SUB  6,4,5 	 
 53:    JGE  6,4(7) 	jump if false 
 54:    SUB  6,3,5 	 
 55:    JGE  6,2(7) 	jump if false 
 56:    LDC  3,0(6) 	false case 
 57:    LDA  7,1(7) 	unconditional jmp 
 58:    LDC  3,1(6) 	true case 
* 
 59:     LD  3,-2(1) 	Load variable a
 60:    LDC  4,1(6) 	Load 1 
 61:    SUB  3,4,3 	op - 
* 
 62:    LDC  3,0(6) 	Load constant 
 63:     ST  3,-5(1) 	Store variable x
* 
 64:     LD  3,-5(1) 	Load variable x
 65:     ST  3,-6(1) 	Save left side 
 66:    LDC  3,0(6) 	Load constant 
 67:     LD  4,-6(1) 	Load left into ac1 
 68:    SUB  3,4,3 	op != 
 69:    JEQ  3,1(7) 	br if true 
 70:    LDC  3,1(6) 	true case 
 71:     ST  3,-6(1) 	Save left side 
 72:    LDC  3,77(6) 	Load constant 
 73:     ST  3,-7(1) 	Save left side 
 74:     LD  3,-5(1) 	Load variable x
 75:     LD  4,-7(1) 	Load left into ac1 
 76:    DIV  3,4,3 	op / 
 77:     ST  3,-7(1) 	Save left side 
 78:    LDC  3,4(6) 	Load constant 
 79:     LD  4,-7(1) 	Load left into ac1 
 80:    SUB  3,4,3 	op < 
 81:    JLT  3,2(7) 	br if true 
 82:    LDC  3,0(6) 	false case 
 83:    LDA  7,1(7) 	unconditional jmp 
 84:    LDC  3,1(6) 	true case 
 85:     LD  4,-6(1) 	Load left into ac1 
 86:    LDC  5,1(6) 	op && 
 87:    SUB  6,4,5 	 
 88:    JLT  6,4(7) 	jump if false 
 89:    SUB  6,3,5 	 
 90:    JLT  6,2(7) 	jump if false 
 91:    LDC  3,1(6) 	true case 
 92:    LDA  7,1(7) 	unconditional jmp 
 93:    LDC  3,0(6) 	false case 
* END
* Add standard closing in case there is no return statement
 94:    LDC  2,0(6) 	Set return value to 0 
 95:     LD  3,-1(1) 	Load return address 
 96:     LD  1,0(1) 	Adjust fp 
 97:    LDA  7,0(3) 	Return 
* END of function main
