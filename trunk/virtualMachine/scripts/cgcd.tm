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
* Function gcd returns int
* BEGIN
* IF
 31:     LD  3,-3(1) 	load variable v
* Left side will remain in register
 32:    LDC  4,0(0) 	load constant
 33:    SUB  3,3,4 	prepare for comparison op
 34:    JEQ  3,2(7) 	op ==
 35:    LDC  3,0(0) 	load false into ac
 36:    LDA  7,1(7) 	jump past true case
 37:    LDC  3,1(0) 	load true into ac
 38:    LDC  2,1(0) 	load constant 1
 39:    SUB  3,3,2 	if condition check
* THEN
* RETURN
 41:     LD  3,-2(1) 	load variable u
 42:    LDA  2,0(3) 	copy result to rt register
 43:     LD  3,-1(1) 	load return address
 44:     LD  1,0(1) 	adjust fp
 45:    LDA  7,0(3) 	Return
 40:    JLT  3,6(7) 	jump to else if false
* RETURN
 47:     ST  1,-4(1) 	Store old fp in ghost frame
 48:     LD  3,-3(1) 	load variable v
 49:     ST  3,-6(1) 	Save parameter
 50:     LD  3,-2(1) 	load variable u
* Left side will remain in register
 51:     LD  4,-2(1) 	load variable u
* Left side will remain in register
 52:     LD  5,-3(1) 	load variable v
 53:    DIV  4,4,5 	op /
* Left side will remain in register
 54:     LD  5,-3(1) 	load variable v
 55:    MUL  4,4,5 	op *
 56:    SUB  3,3,4 	op -
 57:     ST  3,-7(1) 	Save parameter
 58:    LDA  1,-4(1) 	Load address of new frame
 59:    LDA  3,1(7) 	Put return address in current accumulator
 60:    LDA  7,-31(7) 	Call gcd
 61:    LDA  3,0(2) 	Save the result in ac
 62:    LDA  2,0(3) 	copy result to rt register
 63:     LD  3,-1(1) 	load return address
 64:     LD  1,0(1) 	adjust fp
 65:    LDA  7,0(3) 	Return
 46:    LDA  7,19(7) 	jump past else part
* END IF
* END
* Add standard closing in case there is no return statement
 66:    LDC  2,0(0) 	Set return value to 0
 67:     LD  3,-1(1) 	Load return address
 68:     LD  1,0(1) 	Adjust fp
 69:    LDA  7,0(3) 	Return
* End Function gcd
 70:     ST  3,-1(1) 	store return address
  4:    LDA  7,65(7) 	jump to main
* Function main returns void
* BEGIN
 71:     ST  1,-4(1) 	Store old fp in ghost frame
 72:    LDA  1,-4(1) 	Load address of new frame
 73:    LDA  3,1(7) 	Put return address in current accumulator
 74:    LDA  7,-69(7) 	Call input
 75:    LDA  3,0(2) 	Save the result in ac
 76:     ST  3,-2(1) 	store variable x
* 
 77:     ST  1,-4(1) 	Store old fp in ghost frame
 78:    LDA  1,-4(1) 	Load address of new frame
 79:    LDA  3,1(7) 	Put return address in current accumulator
 80:    LDA  7,-75(7) 	Call input
 81:    LDA  3,0(2) 	Save the result in ac
 82:     ST  3,-3(1) 	store variable y
* 
 83:     ST  1,-4(1) 	Store old fp in ghost frame
 84:     ST  1,-6(1) 	Store old fp in ghost frame
 85:     LD  3,-2(1) 	load variable x
 86:     ST  3,-8(1) 	Save parameter
 87:     LD  3,-3(1) 	load variable y
 88:     ST  3,-9(1) 	Save parameter
 89:    LDA  1,-6(1) 	Load address of new frame
 90:    LDA  3,1(7) 	Put return address in current accumulator
 91:    LDA  7,-62(7) 	Call gcd
 92:    LDA  3,0(2) 	Save the result in ac
 93:     ST  3,-6(1) 	Save parameter
 94:    LDA  1,-4(1) 	Load address of new frame
 95:    LDA  3,1(7) 	Put return address in current accumulator
 96:    LDA  7,-86(7) 	Call output
 97:    LDA  3,0(2) 	Save the result in ac
* END
* Add standard closing in case there is no return statement
 98:    LDC  2,0(0) 	Set return value to 0
 99:     LD  3,-1(1) 	Load return address
100:     LD  1,0(1) 	Adjust fp
101:    LDA  7,0(3) 	Return
* End Function main
