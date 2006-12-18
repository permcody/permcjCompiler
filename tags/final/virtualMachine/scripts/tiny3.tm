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
 31:     LD  3,-2(1) 	Load variable garion
 32:     ST  3,-4(1) 	Save left side 
 33:     LD  3,0(0) 	Load variable g
 34:     LD  4,-4(1) 	Load left into ac1 
 35:    ADD  3,4,3 	op + 
 36:    LDA  2,0(3) 	Copy result to rt register 
 37:     LD  3,-1(1) 	Load return address 
 38:     LD  1,0(1) 	Adjust fp 
 39:    LDA  7,0(3) 	Return 
* END
* Add standard closing in case there is no return statement
 40:    LDC  2,0(6) 	Set return value to 0 
 41:     LD  3,-1(1) 	Load return address 
 42:     LD  1,0(1) 	Adjust fp 
 43:    LDA  7,0(3) 	Return 
* END of function wolf
* BEGIN function polgara
 44:     ST  3,-1(1) 	Store return address to caller 
* BEGIN
* RETURN
 45:     LD  3,-2(1) 	Load variable silk
 46:     ST  3,-4(1) 	Save left side 
 47:    LDC  3,1(6) 	Load constant 
 48:     LD  4,-4(1) 	Load left into ac1 
 49:    ADD  3,4,3 	op + 
 50:    LDA  2,0(3) 	Copy result to rt register 
 51:     LD  3,-1(1) 	Load return address 
 52:     LD  1,0(1) 	Adjust fp 
 53:    LDA  7,0(3) 	Return 
* END
* Add standard closing in case there is no return statement
 54:    LDC  2,0(6) 	Set return value to 0 
 55:     LD  3,-1(1) 	Load return address 
 56:     LD  1,0(1) 	Adjust fp 
 57:    LDA  7,0(3) 	Return 
* END of function polgara
* BEGIN function main
  4:    LDA  7,53(7) 	Jump to main 
 58:     ST  3,-1(1) 	Store return address to caller 
* BEGIN
* 
 59:    LDC  3,33(6) 	Load constant 
 60:     ST  3,0(0) 	Store variable g
* 
 61:    LDC  3,666(6) 	Load constant 
 62:     ST  3,-2(1) 	Store variable x
* 
 63:     ST  1,-3(1) 	Store old fp in ghost frame 
 64:     ST  1,-5(1) 	Store old fp in ghost frame 
 65:     LD  3,-2(1) 	Load variable x
 66:     ST  3,-7(1) 	Store parameter 
 67:    LDA  1,-5(1) 	Load address of new frame 
 68:    LDA  3,1(7) 	Return address in ac 
 69:    LDA  7,-26(7) 	call polgara
 70:    LDA  3,0(2) 	Save the result in ac 
 71:     ST  3,-5(1) 	Store parameter 
 72:    LDA  1,-3(1) 	Load address of new frame 
 73:    LDA  3,1(7) 	Return address in ac 
 74:    LDA  7,-45(7) 	call wolf
 75:    LDA  3,0(2) 	Save the result in ac 
 76:     ST  3,-2(1) 	Store variable x
* 
 77:     ST  1,-3(1) 	Store old fp in ghost frame 
 78:     LD  3,-2(1) 	Load variable x
 79:     ST  3,-5(1) 	Store parameter 
 80:    LDA  1,-3(1) 	Load address of new frame 
 81:    LDA  3,1(7) 	Return address in ac 
 82:    LDA  7,-72(7) 	call output
 83:    LDA  3,0(2) 	Save the result in ac 
* END
* Add standard closing in case there is no return statement
 84:    LDC  2,0(6) 	Set return value to 0 
 85:     LD  3,-1(1) 	Load return address 
 86:     LD  1,0(1) 	Adjust fp 
 87:    LDA  7,0(3) 	Return 
* END of function main
