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
 36:    LDC  3,1(6) 	Load constant 
 37:     ST  3,-2(1) 	Store variable x
* WHILE
 38:     LD  3,-2(1) 	Load variable x
 39:    LDC  4,1(6) 	Load constant 1 
 40:    SUB  3,3,4 	While cond check 
 41:    JGE  3,1(7) 	Jump to while part 
* DO
* BEGIN compound statement
* 8
 43:     LD  3,-2(1) 	Load variable x
 44:    LDC  4,1(6) 	Load 1 
 45:    SUB  3,4,3 	Op ! 
 46:     ST  3,-2(1) 	Store variable x
* END compound statement
 47:    LDA  7,-10(7) 	go to beginning of loop 
 42:    LDA  7,5(7) 	No more loop 
* ENDWHILE
* END compound statement
* Add standard closing in case there is no return statement
 48:    LDC  2,0(6) 	Set return value to 0 
 49:     LD  3,-1(1) 	Load return address 
 50:     LD  1,0(1) 	Adjust fp 
 51:    LDA  7,0(3) 	Return 
* END of function main
