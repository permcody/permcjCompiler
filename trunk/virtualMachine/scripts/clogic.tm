* Begin Prolog code
  0:     LD  0,0(0) 	load global poiniter with end of memory
  1:    LDA  1,0(0) 	load fp
  2:     ST  1,0(1) 	store old fp
  3:    LDA  3,1(7) 	return address in ac
  5:   HALT  0,0,0 	DONE!
* End Prolog code
* Being Generating IO Functions
* Begin function input
  6:     ST  3,-1(1) 	store return address
  7:     IN  2,2,2 	input integer
  8:     LD  3,-1(1) 	load return address
  9:     LD  1,0(1) 	adjust fp
 10:    LDA  7,0(3) 	jump to return address
* End function input
* Begin function output
 11:     ST  3,-1(1) 	store return address
 12:     LD  3,-2(1) 	load parameter
 13:    OUT  3,3,3 	output integer
 14:    LDC  2,0(2) 	set return to 0
 15:     LD  3,-1(1) 	load return address
 16:     LD  1,0(1) 	adjust fp
 17:    LDA  7,0(3) 	jump to return address
* End function output
* Begin function inputb
 18:     ST  3,-1(1) 	store return address
 19:    INB  2,2,2 	input boolean
 20:     LD  3,-1(1) 	load return address
 21:     LD  1,0(1) 	adjust fp
 22:    LDA  7,0(3) 	jump to return address
* End function inputb
* Begin function outputb
 23:     ST  3,-1(1) 	store return address
 24:     LD  3,-2(1) 	load parameter
 25:   OUTB  3,3,3 	output boolean
 26:    LDC  2,0(2) 	set return to 0
 27:     LD  3,-1(1) 	load return address
 28:     LD  1,0(1) 	adjust fp
 29:    LDA  7,0(3) 	jump to return address
* End function outputb
* End Generating IO Functions
 30:     ST  3,-1(1) 	store return address
  4:    LDA  7,25(7) 	jump to main
* Function main returns int
* BEGIN
 31:    LDC  3,1(6) 	load constant
 32:     ST  3,-2(1) 	store variable a
* 
 33:    LDC  3,0(6) 	load constant
 34:     ST  3,-3(1) 	store variable b
* 
 35:     LD  3,-2(1) 	load variable a
 36:     ST  3,-6(1) 	save left side
 37:     LD  3,-3(1) 	load variable b
 38:     LD  4,-6(1) 	load left into ac1
 39:    ADD  3,4,3 	prepare for && op
 40:    LDC  4,2(6) 	load constant for &&
 41:    SUB  3,4,3 	compute value in ac
 42:    JEQ  3,2(7) 	op &&
 43:    LDC  3,0(6) 	load false into ac
 44:    LDA  7,1(7) 	jump past true case
 45:    LDC  3,1(6) 	load true into ac
* 
 46:     LD  3,-2(1) 	load variable a
 47:     ST  3,-6(1) 	save left side
 48:     LD  3,-3(1) 	load variable b
 49:     LD  4,-6(1) 	load left into ac1
 50:    ADD  3,4,3 	prepare for || op
 51:    JGT  3,2(7) 	op ||
 52:    LDC  3,0(6) 	load false into ac
 53:    LDA  7,1(7) 	jump past true case
 54:    LDC  3,1(6) 	load true into ac
* 
 55:     LD  3,-2(1) 	load variable a
 56:    JEQ  3,2(7) 	op !
 57:    LDC  3,0(6) 	load false into ac
 58:    LDA  7,1(7) 	jump past true case
 59:    LDC  3,1(6) 	load true into ac
* 
 60:    LDC  3,0(6) 	load constant
 61:     ST  3,-5(1) 	store variable x
* 
 62:     LD  3,-5(1) 	load variable x
 63:     ST  3,-6(1) 	save left side
 64:    LDC  3,0(6) 	load constant
 65:     LD  4,-6(1) 	load left into ac1
 66:    SUB  3,4,3 	prepare for comparison op
 67:    JNE  3,2(7) 	op !=
 68:    LDC  3,0(6) 	load false into ac
 69:    LDA  7,1(7) 	jump past true case
 70:    LDC  3,1(6) 	load true into ac
 71:     ST  3,-6(1) 	save left side
 72:    LDC  3,77(6) 	load constant
 73:     ST  3,-7(1) 	save left side
 74:     LD  3,-5(1) 	load variable x
 75:     LD  4,-7(1) 	load left into ac1
 76:    DIV  3,4,3 	op /
 77:     ST  3,-7(1) 	save left side
 78:    LDC  3,4(6) 	load constant
 79:     LD  4,-7(1) 	load left into ac1
 80:    SUB  3,4,3 	prepare for comparison op
 81:    JLT  3,2(7) 	op <
 82:    LDC  3,0(6) 	load false into ac
 83:    LDA  7,1(7) 	jump past true case
 84:    LDC  3,1(6) 	load true into ac
 85:     LD  4,-6(1) 	load left into ac1
 86:    ADD  3,4,3 	prepare for && op
 87:    LDC  4,2(6) 	load constant for &&
 88:    SUB  3,4,3 	compute value in ac
 89:    JEQ  3,2(7) 	op &&
 90:    LDC  3,0(6) 	load false into ac
 91:    LDA  7,1(7) 	jump past true case
 92:    LDC  3,1(6) 	load true into ac
* END
* Add standard closing in case there is no return statement
 93:    LDC  2,0(6) 	Set return value to 0
 94:     LD  3,-1(1) 	Load return address
 95:     LD  1,0(1) 	Adjust fp
 96:    LDA  7,0(3) 	Return
* End Function main
