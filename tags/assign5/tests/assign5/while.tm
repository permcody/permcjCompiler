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
* BEGIN function main
  4:    LDA  7,30(7) 	Jump to main 
 35:     ST  3,-1(1) 	Store return address. BEGIN FUNC: main
* BEGIN compound statement
* 6
 36:    LDC  3,10(6) 	Load constant 
 37:     ST  3,-2(1) 	Store variable i
* WHILE
 38:     LD  3,-2(1) 	Load variable i
 39:     ST  3,-3(1) 	Save left side in temp 
 40:    LDC  3,0(6) 	Load constant 
 41:     LD  4,-3(1) 	Load left from temp into ac1 
 42:    SUB  4,4,3 	Op > 
 43:    LDC  3,1(6) 	True case 
 44:    JGT  4,1(7) 	Jump if true 
 45:    LDC  3,0(6) 	False case 
 46:    LDC  4,1(6) 	Load constant 1 
 47:    SUB  3,3,4 	While cond check 
 48:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 8
 50:     ST  1,-3(1) 	Store old fp in ghost frame 
 51:     LD  3,-2(1) 	Load variable i
 52:     ST  3,-5(1) 	Store parameter 
 53:    LDA  1,-3(1) 	Load address of new frame 
 54:    LDA  3,1(7) 	Return address in ac 
 55:    LDA  7,-45(7) 	call output
 56:    LDA  3,0(2) 	Save the result in ac 
* 9
 57:     LD  3,-2(1) 	Load variable i
 58:     ST  3,-3(1) 	Save left side in temp 
 59:    LDC  3,1(6) 	Load constant 
 60:     LD  4,-3(1) 	Load left from temp into ac1 
 61:    SUB  3,4,3 	Op - 
 62:     ST  3,-2(1) 	Store variable i
* END compound statement
 63:    LDA  7,-26(7) 	go to beginning of loop 
 49:    LDA  7,14(7) 	No more loop 
* ENDWHILE
* 11
 64:     ST  1,-3(1) 	Store old fp in ghost frame 
 65:    LDA  1,-3(1) 	Load address of new frame 
 66:    LDA  3,1(7) 	Return address in ac 
 67:    LDA  7,-38(7) 	call outnl
 68:    LDA  3,0(2) 	Save the result in ac 
* WHILE
 69:     LD  3,-2(1) 	Load variable i
 70:     ST  3,-3(1) 	Save left side in temp 
 71:    LDC  3,10(6) 	Load constant 
 72:     LD  4,-3(1) 	Load left from temp into ac1 
 73:    SUB  4,4,3 	Op < 
 74:    LDC  3,1(6) 	True case 
 75:    JLT  4,1(7) 	Jump if true 
 76:    LDC  3,0(6) 	False case 
 77:    LDC  4,1(6) 	Load constant 1 
 78:    SUB  3,3,4 	While cond check 
 79:    JGE  3,1(7) 	Jump to while part 
* DO
* 13
 81:     LD  3,-2(1) 	Load variable i
 82:     ST  3,-3(1) 	Save left side in temp 
 83:    LDC  3,1(6) 	Load constant 
 84:     LD  4,-3(1) 	Load left from temp into ac1 
 85:    ADD  3,4,3 	Op + 
 86:     ST  3,-2(1) 	Store variable i
 87:    LDA  7,-19(7) 	go to beginning of loop 
 80:    LDA  7,7(7) 	No more loop 
* ENDWHILE
* 14
 88:     ST  1,-3(1) 	Store old fp in ghost frame 
 89:     LD  3,-2(1) 	Load variable i
 90:     ST  3,-5(1) 	Store parameter 
 91:    LDA  1,-3(1) 	Load address of new frame 
 92:    LDA  3,1(7) 	Return address in ac 
 93:    LDA  7,-83(7) 	call output
 94:    LDA  3,0(2) 	Save the result in ac 
* END compound statement
* Add standard closing in case there is no return statement
 95:    LDC  2,0(6) 	Set return value to 0 
 96:     LD  3,-1(1) 	Load return address 
 97:     LD  1,0(1) 	Adjust fp 
 98:    LDA  7,0(3) 	Return 
* END of function main
