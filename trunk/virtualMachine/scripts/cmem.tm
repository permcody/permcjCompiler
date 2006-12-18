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
* Function polgara returns int
* BEGIN
 31:     LD  3,-2(1) 	load variable a
 32:     ST  3,-4(1) 	store variable x
* 
* RETURN
 33:     LD  3,-4(1) 	load variable x
 34:    LDA  2,0(3) 	copy result to rt register
 35:     LD  3,-1(1) 	load return address
 36:     LD  1,0(1) 	adjust fp
 37:    LDA  7,0(3) 	Return
* END
* Add standard closing in case there is no return statement
 38:    LDC  2,0(6) 	Set return value to 0
 39:     LD  3,-1(1) 	Load return address
 40:     LD  1,0(1) 	Adjust fp
 41:    LDA  7,0(3) 	Return
* End Function polgara
 42:     ST  3,-1(1) 	store return address
  4:    LDA  7,37(7) 	jump to main
* Function main returns void
* BEGIN
 43:     ST  1,-10(1) 	Store old fp in ghost frame
 44:     LD  3,-2(1) 	load variable i
 45:     ST  3,-11(1) 	save left side
 46:    LDC  3,43(6) 	load constant
 47:     LD  4,-11(1) 	load left into ac1
 48:    ADD  3,4,3 	op +
 49:     ST  3,-12(1) 	Save parameter
 50:     LD  3,-3(1) 	load variable b
 51:     ST  3,-13(1) 	Save parameter
 52:    LDA  1,-10(1) 	Load address of new frame
 53:    LDA  3,1(7) 	Put return address in ac
 54:    LDA  7,-25(7) 	Call polgara
 55:    LDA  3,0(2) 	Save the result in ac
 56:     ST  3,-9(1) 	store variable z
* 
 57:    LDC  3,666(6) 	load constant
 58:     ST  3,0(0) 	store variable u
* 
 59:    LDC  3,1(6) 	load constant
 60:     ST  3,-1(0) 	store variable v
* END
* Add standard closing in case there is no return statement
 61:    LDC  2,0(6) 	Set return value to 0
 62:     LD  3,-1(1) 	Load return address
 63:     LD  1,0(1) 	Adjust fp
 64:    LDA  7,0(3) 	Return
* End Function main
