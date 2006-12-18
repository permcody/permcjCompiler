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
* BEGIN function gcd
 30:     ST  3,-1(1) 	Store return address to caller 
* BEGIN
* IF
 31:     LD  3,-3(1) 	Load variable v
 32:     ST  3,-4(1) 	Save left side 
 33:    LDC  3,0(6) 	Load constant 
 34:     LD  4,-4(1) 	Load left into ac1 
 35:    SUB  3,4,3 	op == 
 36:    JEQ  3,2(7) 	br if true 
 37:    LDC  3,0(6) 	false case 
 38:    LDA  7,1(7) 	unconditional jmp 
 39:    LDC  3,1(6) 	true case 
 40:    LDC  4,1(6) 	Load constant 1 
 41:    SUB  3,3,4 	If cond check 
 42:    JGE  3,1(7) 	Jump to then part 
* THEN
* RETURN
 44:     LD  3,-2(1) 	Load variable u
 45:    LDA  2,0(3) 	Copy result to rt register 
 46:     LD  3,-1(1) 	Load return address 
 47:     LD  1,0(1) 	Adjust fp 
 48:    LDA  7,0(3) 	Return 
* ELSE
 43:    LDA  7,6(7) 	 
* RETURN
 50:     ST  1,-4(1) 	Store old fp in ghost frame 
 51:     LD  3,-3(1) 	Load variable v
 52:     ST  3,-6(1) 	Store parameter 
 53:     LD  3,-2(1) 	Load variable u
 54:     ST  3,-7(1) 	Save left side 
 55:     LD  3,-2(1) 	Load variable u
 56:     ST  3,-8(1) 	Save left side 
 57:     LD  3,-3(1) 	Load variable v
 58:     LD  4,-8(1) 	Load left into ac1 
 59:    DIV  3,4,3 	op / 
 60:     ST  3,-8(1) 	Save left side 
 61:     LD  3,-3(1) 	Load variable v
 62:     LD  4,-8(1) 	Load left into ac1 
 63:    MUL  3,4,3 	op * 
 64:     LD  4,-7(1) 	Load left into ac1 
 65:    SUB  3,4,3 	op - 
 66:     ST  3,-7(1) 	Store parameter 
 67:    LDA  1,-4(1) 	Load address of new frame 
 68:    LDA  3,1(7) 	Return address in ac 
 69:    LDA  7,-40(7) 	call gcd
 70:    LDA  3,0(2) 	Save the result in ac 
 71:    LDA  2,0(3) 	Copy result to rt register 
 72:     LD  3,-1(1) 	Load return address 
 73:     LD  1,0(1) 	Adjust fp 
 74:    LDA  7,0(3) 	Return 
 49:    LDA  7,25(7) 	 
* ENDIF
* END
* Add standard closing in case there is no return statement
 75:    LDC  2,0(6) 	Set return value to 0 
 76:     LD  3,-1(1) 	Load return address 
 77:     LD  1,0(1) 	Adjust fp 
 78:    LDA  7,0(3) 	Return 
* END of function gcd
* BEGIN function main
  4:    LDA  7,74(7) 	Jump to main 
 79:     ST  3,-1(1) 	Store return address to caller 
* BEGIN
* 
 80:     ST  1,-4(1) 	Store old fp in ghost frame 
 81:    LDA  1,-4(1) 	Load address of new frame 
 82:    LDA  3,1(7) 	Return address in ac 
 83:    LDA  7,-78(7) 	call input
 84:    LDA  3,0(2) 	Save the result in ac 
 85:     ST  3,-2(1) 	Store variable x
* 
 86:     ST  1,-4(1) 	Store old fp in ghost frame 
 87:    LDA  1,-4(1) 	Load address of new frame 
 88:    LDA  3,1(7) 	Return address in ac 
 89:    LDA  7,-84(7) 	call input
 90:    LDA  3,0(2) 	Save the result in ac 
 91:     ST  3,-3(1) 	Store variable y
* 
 92:     ST  1,-4(1) 	Store old fp in ghost frame 
 93:     ST  1,-6(1) 	Store old fp in ghost frame 
 94:     LD  3,-2(1) 	Load variable x
 95:     ST  3,-8(1) 	Store parameter 
 96:     LD  3,-3(1) 	Load variable y
 97:     ST  3,-9(1) 	Store parameter 
 98:    LDA  1,-6(1) 	Load address of new frame 
 99:    LDA  3,1(7) 	Return address in ac 
100:    LDA  7,-71(7) 	call gcd
101:    LDA  3,0(2) 	Save the result in ac 
102:     ST  3,-6(1) 	Store parameter 
103:    LDA  1,-4(1) 	Load address of new frame 
104:    LDA  3,1(7) 	Return address in ac 
105:    LDA  7,-95(7) 	call output
106:    LDA  3,0(2) 	Save the result in ac 
* END
* Add standard closing in case there is no return statement
107:    LDC  2,0(6) 	Set return value to 0 
108:     LD  3,-1(1) 	Load return address 
109:     LD  1,0(1) 	Adjust fp 
110:    LDA  7,0(3) 	Return 
* END of function main
