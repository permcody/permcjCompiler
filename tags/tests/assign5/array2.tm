* C- compiler version C-06
* Author: Robert B. Heckendorn
* Backend coauthor: Jorge Williams
* Apr 1, 2006
* BEGIN Prolog
  0:     LD  0,0(0) 	Set the global pointer 
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
* BEGIN function outnl
 30:     ST  3,-1(1) 	Store return address 
 31:  OUTNL  3,3,3 	Output a newline 
 32:     LD  3,-1(1) 	Load return address 
 33:     LD  1,0(1) 	Adjust fp 
 34:    LDA  7,0(3) 	Return 
* END of function outnl
* BEGIN function ford
 35:     ST  3,-1(1) 	Store return address. BEGIN FUNC: ford
* BEGIN compound statement
* 5
 36:    LDC  3,3(6) 	Load constant 
 37:     LD  4,-2(1) 	Load address of base of array x
 38:    SUB  3,4,3 	Compute offset of value 
 39:     LD  3,0(3) 	Load the value 
 40:     ST  3,-3(1) 	Store variable y
* 6
 41:     ST  1,-4(1) 	Store old fp in ghost frame 
 42:     LD  3,-3(1) 	Load variable y
 43:     ST  3,-6(1) 	Store parameter 
 44:    LDA  1,-4(1) 	Load address of new frame 
 45:    LDA  3,1(7) 	Return address in ac 
 46:    LDA  7,-36(7) 	call output
 47:    LDA  3,0(2) 	Save the result in ac 
* 7
 48:    LDC  3,3(6) 	Load constant 
 49:     ST  3,-4(1) 	Save index in temp 
 50:    LDC  3,777(6) 	Load constant 
 51:     LD  4,-4(1) 	load index from temp to ac1 
 52:     LD  5,-2(1) 	Load address of base of array x
 53:    SUB  5,5,4 	Compute offset of value 
 54:     ST  3,0(5) 	Store variable x
* END compound statement
* Add standard closing in case there is no return statement
 55:    LDC  2,0(6) 	Set return value to 0 
 56:     LD  3,-1(1) 	Load return address 
 57:     LD  1,0(1) 	Adjust fp 
 58:    LDA  7,0(3) 	Return 
* END of function ford
* BEGIN function main
  4:    LDA  7,54(7) 	Jump to main 
 59:     ST  3,-1(1) 	Store return address. BEGIN FUNC: main
* BEGIN compound statement
* 14
 60:    LDC  3,3(6) 	Load constant 
 61:     ST  3,-7(1) 	Save index in temp 
 62:    LDC  3,666(6) 	Load constant 
 63:     LD  4,-7(1) 	load index from temp to ac1 
 64:    LDA  5,-2(1) 	Load address of base of array y
 65:    SUB  5,5,4 	Compute offset of value 
 66:     ST  3,0(5) 	Store variable y
* 15
 67:     ST  1,-7(1) 	Store old fp in ghost frame 
 68:    LDA  3,-2(1) 	Load address of base of array y
 69:     ST  3,-9(1) 	Store parameter 
 70:    LDA  1,-7(1) 	Load address of new frame 
 71:    LDA  3,1(7) 	Return address in ac 
 72:    LDA  7,-38(7) 	call ford
 73:    LDA  3,0(2) 	Save the result in ac 
* 16
 74:    LDC  3,3(6) 	Load constant 
 75:    LDA  4,-2(1) 	Load address of base of array y
 76:    SUB  3,4,3 	Compute offset of value 
 77:     LD  3,0(3) 	Load the value 
* 17
 78:     ST  1,-7(1) 	Store old fp in ghost frame 
 79:    LDC  3,3(6) 	Load constant 
 80:    LDA  4,-2(1) 	Load address of base of array y
 81:    SUB  3,4,3 	Compute offset of value 
 82:     LD  3,0(3) 	Load the value 
 83:     ST  3,-9(1) 	Store parameter 
 84:    LDA  1,-7(1) 	Load address of new frame 
 85:    LDA  3,1(7) 	Return address in ac 
 86:    LDA  7,-76(7) 	call output
 87:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
 88:    LDC  2,0(6) 	Set return value to 0 
 89:     LD  3,-1(1) 	Load return address 
 90:     LD  1,0(1) 	Adjust fp 
 91:    LDA  7,0(3) 	Return 
* END of function main
