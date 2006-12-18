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
 31:    LDC  3,99(6) 	Load constant 
 32:     ST  3,-3(1) 	Store variable bilbo
* 
 33:     LD  3,-3(1) 	Load variable bilbo
 34:     ST  3,-3(1) 	Store variable bilbo
* 
 35:     LD  3,-3(1) 	Load variable bilbo
 36:     ST  3,-7(1) 	Save left side 
 37:    LDC  3,1(6) 	Load constant 
 38:     LD  4,-7(1) 	Load left into ac1 
 39:    ADD  3,4,3 	op + 
 40:     ST  3,-3(1) 	Store variable bilbo
* 
 41:     LD  3,-2(1) 	Load variable frodo
 42:     ST  3,-7(1) 	Save left side 
 43:     LD  3,-3(1) 	Load variable bilbo
 44:     ST  3,-8(1) 	Save left side 
 45:     LD  3,-4(1) 	Load variable sam
 46:     ST  3,-9(1) 	Save left side 
 47:     LD  3,-5(1) 	Load variable merry
 48:     ST  3,-10(1) 	Save left side 
 49:     LD  3,-6(1) 	Load variable pippin
 50:     LD  4,-10(1) 	Load left into ac1 
 51:    MUL  3,4,3 	op * 
 52:     LD  4,-9(1) 	Load left into ac1 
 53:    ADD  3,4,3 	op + 
 54:     LD  4,-8(1) 	Load left into ac1 
 55:    MUL  3,4,3 	op * 
 56:     LD  4,-7(1) 	Load left into ac1 
 57:    ADD  3,4,3 	op + 
 58:     ST  3,-3(1) 	Store variable bilbo
* 
 59:     LD  3,-5(1) 	Load variable merry
 60:     ST  3,-7(1) 	Save left side 
 61:     LD  3,-6(1) 	Load variable pippin
 62:     LD  4,-7(1) 	Load left into ac1 
 63:    MUL  3,4,3 	op * 
 64:     ST  3,-7(1) 	Save left side 
 65:     LD  3,-4(1) 	Load variable sam
 66:     LD  4,-7(1) 	Load left into ac1 
 67:    ADD  3,4,3 	op + 
 68:     ST  3,-7(1) 	Save left side 
 69:     LD  3,-3(1) 	Load variable bilbo
 70:     LD  4,-7(1) 	Load left into ac1 
 71:    MUL  3,4,3 	op * 
 72:     ST  3,-7(1) 	Save left side 
 73:     LD  3,-2(1) 	Load variable frodo
 74:     LD  4,-7(1) 	Load left into ac1 
 75:    ADD  3,4,3 	op + 
 76:     ST  3,-3(1) 	Store variable bilbo
* END
* Add standard closing in case there is no return statement
 77:    LDC  2,0(6) 	Set return value to 0 
 78:     LD  3,-1(1) 	Load return address 
 79:     LD  1,0(1) 	Adjust fp 
 80:    LDA  7,0(3) 	Return 
* END of function main
