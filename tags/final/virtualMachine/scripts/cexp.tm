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
* Function main returns void
* BEGIN
 31:    LDC  3,99(0) 	load constant
 32:     ST  3,-3(1) 	store variable bilbo
* 
 33:     LD  3,-3(1) 	load variable bilbo
 34:     ST  3,-3(1) 	store variable bilbo
* 
 35:     ST  1,-7(1) 	Store old fp in ghost frame
 36:     LD  3,-3(1) 	load variable bilbo
 37:     ST  3,-9(1) 	Save parameter
 38:    LDA  1,-7(1) 	Load address of new frame
 39:    LDA  3,1(7) 	Put return address in current accumulator
 40:    LDA  7,-30(7) 	Call output
 41:    LDA  3,0(2) 	Save the result in ac
* 
 42:     LD  3,-3(1) 	load variable bilbo
* Left side will remain in register
 43:    LDC  4,1(0) 	load constant
 44:    ADD  3,3,4 	op +
 45:     ST  3,-3(1) 	store variable bilbo
* 
 46:     ST  1,-7(1) 	Store old fp in ghost frame
 47:     LD  3,-3(1) 	load variable bilbo
 48:     ST  3,-9(1) 	Save parameter
 49:    LDA  1,-7(1) 	Load address of new frame
 50:    LDA  3,1(7) 	Put return address in current accumulator
 51:    LDA  7,-41(7) 	Call output
 52:    LDA  3,0(2) 	Save the result in ac
* 
 53:    LDC  3,1(0) 	load constant
 54:     ST  3,-4(1) 	store variable sam
* 
 55:    LDC  3,2(0) 	load constant
 56:     ST  3,-5(1) 	store variable merry
* 
 57:    LDC  3,3(0) 	load constant
 58:     ST  3,-6(1) 	store variable pippin
* 
 59:     LD  3,-2(1) 	load variable frodo
* Left side will remain in register
 60:     LD  4,-3(1) 	load variable bilbo
* Left side will remain in register
 61:     LD  5,-4(1) 	load variable sam
* Left side will remain in register
 62:     LD  6,-5(1) 	load variable merry
 63:     ST  3,-7(1) 	dump register
 64:     LD  3,-6(1) 	load variable pippin
 65:    MUL  6,6,3 	op *
 66:     LD  3,-7(1) 	restore register
 67:    ADD  5,5,6 	op +
 68:    MUL  4,4,5 	op *
 69:    ADD  3,3,4 	op +
 70:     ST  3,-3(1) 	store variable bilbo
* 
 71:     ST  1,-7(1) 	Store old fp in ghost frame
 72:     LD  3,-3(1) 	load variable bilbo
 73:     ST  3,-9(1) 	Save parameter
 74:    LDA  1,-7(1) 	Load address of new frame
 75:    LDA  3,1(7) 	Put return address in current accumulator
 76:    LDA  7,-66(7) 	Call output
 77:    LDA  3,0(2) 	Save the result in ac
* 
 78:     LD  3,-5(1) 	load variable merry
* Left side will remain in register
 79:     LD  4,-6(1) 	load variable pippin
 80:    MUL  3,3,4 	op *
* Left side will remain in register
 81:     LD  4,-4(1) 	load variable sam
 82:    ADD  3,3,4 	op +
* Left side will remain in register
 83:     LD  4,-3(1) 	load variable bilbo
 84:    MUL  3,3,4 	op *
* Left side will remain in register
 85:     LD  4,-2(1) 	load variable frodo
 86:    ADD  3,3,4 	op +
 87:     ST  3,-3(1) 	store variable bilbo
* 
 88:     ST  1,-7(1) 	Store old fp in ghost frame
 89:     LD  3,-3(1) 	load variable bilbo
 90:     ST  3,-9(1) 	Save parameter
 91:    LDA  1,-7(1) 	Load address of new frame
 92:    LDA  3,1(7) 	Put return address in current accumulator
 93:    LDA  7,-83(7) 	Call output
 94:    LDA  3,0(2) 	Save the result in ac
* END
* Add standard closing in case there is no return statement
 95:    LDC  2,0(0) 	Set return value to 0
 96:     LD  3,-1(1) 	Load return address
 97:     LD  1,0(1) 	Adjust fp
 98:    LDA  7,0(3) 	Return
* End Function main
