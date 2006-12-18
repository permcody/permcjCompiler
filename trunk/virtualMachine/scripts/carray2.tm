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
* Function ford returns void
* BEGIN
 31:    LDC  3,3(6) 	load constant
 32:     LD  4,-2(1) 	array base
 33:    SUB  3,4,3 	index off of the base
 34:     LD  3,0(3) 	load the value
 35:     ST  3,-3(1) 	store variable y
* 
 36:     ST  1,-4(1) 	Store old fp in ghost frame
 37:     LD  3,-3(1) 	load variable y
 38:     ST  3,-6(1) 	Save parameter
 39:    LDA  1,-4(1) 	Load address of new frame
 40:    LDA  3,1(7) 	Put return address in ac
 41:    LDA  7,-31(7) 	Call output
 42:    LDA  3,0(2) 	Save the result in ac
* 
 43:    LDC  3,777(6) 	load constant
 44:     ST  3,-4(1) 	Store RHS of assignment
 45:    LDC  3,3(6) 	load constant
 46:     LD  5,-4(1) 	Load RHS value
 47:     LD  4,-2(1) 	array base
 48:    SUB  3,4,3 	index off of the base
 49:     ST  5,0(3) 	store indexed variable x
 50:    LDA  3,0(5) 	adjust ac
* END
* Add standard closing in case there is no return statement
 51:    LDC  2,0(6) 	Set return value to 0
 52:     LD  3,-1(1) 	Load return address
 53:     LD  1,0(1) 	Adjust fp
 54:    LDA  7,0(3) 	Return
* End Function ford
 55:     ST  3,-1(1) 	store return address
  4:    LDA  7,50(7) 	jump to main
* Function main returns void
* BEGIN
 56:    LDC  3,666(6) 	load constant
 57:     ST  3,-7(1) 	Store RHS of assignment
 58:    LDC  3,3(6) 	load constant
 59:     LD  5,-7(1) 	Load RHS value
 60:    LDA  4,-2(1) 	array base
 61:    SUB  3,4,3 	index off of the base
 62:     ST  5,0(3) 	store indexed variable y
 63:    LDA  3,0(5) 	adjust ac
* 
 64:     ST  1,-7(1) 	Store old fp in ghost frame
 65:    LDA  3,-2(1) 	Load address of base of array y
 66:     ST  3,-9(1) 	Save parameter
 67:    LDA  1,-7(1) 	Load address of new frame
 68:    LDA  3,1(7) 	Put return address in ac
 69:    LDA  7,-40(7) 	Call ford
 70:    LDA  3,0(2) 	Save the result in ac
* 
 71:    LDC  3,3(6) 	load constant
 72:    LDA  4,-2(1) 	array base
 73:    SUB  3,4,3 	index off of the base
 74:     LD  3,0(3) 	load the value
* 
 75:     ST  1,-7(1) 	Store old fp in ghost frame
 76:    LDC  3,3(6) 	load constant
 77:    LDA  4,-2(1) 	array base
 78:    SUB  3,4,3 	index off of the base
 79:     LD  3,0(3) 	load the value
 80:     ST  3,-9(1) 	Save parameter
 81:    LDA  1,-7(1) 	Load address of new frame
 82:    LDA  3,1(7) 	Put return address in ac
 83:    LDA  7,-73(7) 	Call output
 84:    LDA  3,0(2) 	Save the result in ac
* END
* Add standard closing in case there is no return statement
 85:    LDC  2,0(6) 	Set return value to 0
 86:     LD  3,-1(1) 	Load return address
 87:     LD  1,0(1) 	Adjust fp
 88:    LDA  7,0(3) 	Return
* End Function main
