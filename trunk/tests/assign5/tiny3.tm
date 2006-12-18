* C- compiler version C-06
* Author: Robert B. Heckendorn
* Backend coauthor: Jorge Williams
* Apr 1, 2006
* BEGIN Prolog
  0:     LD  0,0(0) 	Set the global pointer 
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
 36:     LD  3,-2(1) 	Load variable garion
 37:     ST  3,-4(1) 	Save left side in temp 
 38:     LD  3,0(0) 	Load variable g
 39:     LD  4,-4(1) 	Load left from temp into ac1 
 40:    ADD  3,4,3 	Op + 
 41:    LDA  2,0(3) 	Copy result to rt register 
 42:     LD  3,-1(1) 	Load return address 
 43:     LD  1,0(1) 	Adjust fp 
 44:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
 45:    LDC  2,0(6) 	Set return value to 0 
 46:     LD  3,-1(1) 	Load return address 
 47:     LD  1,0(1) 	Adjust fp 
 48:    LDA  7,0(3) 	Return 
* END of function wolf
* BEGIN function polgara
 49:     ST  3,-1(1) 	Store return address. BEGIN FUNC: polgara
* BEGIN compound statement
* RETURN
 50:     LD  3,-2(1) 	Load variable silk
 51:     ST  3,-4(1) 	Save left side in temp 
 52:    LDC  3,1(6) 	Load constant 
 53:     LD  4,-4(1) 	Load left from temp into ac1 
 54:    ADD  3,4,3 	Op + 
 55:    LDA  2,0(3) 	Copy result to rt register 
 56:     LD  3,-1(1) 	Load return address 
 57:     LD  1,0(1) 	Adjust fp 
 58:    LDA  7,0(3) 	Return 
* END compound statement
* Add standard closing in case there is no return statement
 59:    LDC  2,0(6) 	Set return value to 0 
 60:     LD  3,-1(1) 	Load return address 
 61:     LD  1,0(1) 	Adjust fp 
 62:    LDA  7,0(3) 	Return 
* END of function polgara
* BEGIN function main
  4:    LDA  7,58(7) 	Jump to main 
 63:     ST  3,-1(1) 	Store return address. BEGIN FUNC: main
* BEGIN compound statement
* 18
 64:    LDC  3,33(6) 	Load constant 
 65:     ST  3,0(0) 	Store variable g
* 19
 66:    LDC  3,666(6) 	Load constant 
 67:     ST  3,-2(1) 	Store variable x
* 20
 68:     ST  1,-3(1) 	Store old fp in ghost frame 
 69:     ST  1,-5(1) 	Store old fp in ghost frame 
 70:     LD  3,-2(1) 	Load variable x
 71:     ST  3,-7(1) 	Store parameter 
 72:    LDA  1,-5(1) 	Load address of new frame 
 73:    LDA  3,1(7) 	Return address in ac 
 74:    LDA  7,-26(7) 	call polgara
 75:    LDA  3,0(2) 	Save the result in ac 
 76:     ST  3,-5(1) 	Store parameter 
 77:    LDA  1,-3(1) 	Load address of new frame 
 78:    LDA  3,1(7) 	Return address in ac 
 79:    LDA  7,-45(7) 	call wolf
 80:    LDA  3,0(2) 	Save the result in ac 
 81:     ST  3,-2(1) 	Store variable x
* 21
 82:     ST  1,-3(1) 	Store old fp in ghost frame 
 83:     LD  3,-2(1) 	Load variable x
 84:     ST  3,-5(1) 	Store parameter 
 85:    LDA  1,-3(1) 	Load address of new frame 
 86:    LDA  3,1(7) 	Return address in ac 
 87:    LDA  7,-77(7) 	call output
 88:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
 89:    LDC  2,0(6) 	Set return value to 0 
 90:     LD  3,-1(1) 	Load return address 
 91:     LD  1,0(1) 	Adjust fp 
 92:    LDA  7,0(3) 	Return 
* END of function main
