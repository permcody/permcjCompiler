#ifndef EMIT_CODE_H__
#define EMIT_CODE_H__

#include <iostream>
#include <string>

using namespace std;

//
//  Special register defines for optional use in calling the 
//  routines below.
//

#define gp   0	//  The global pointer
#define fp   1	//  The local frame pointer
#define rt   2	//  Return value
#define pc   7	//  The program counter

//
//  Accumulator registers
//

#define ac   3
#define ac1  4
#define ac2  5
#define ac3  6


//
//  No comment please...
//

#define NO_COMMENT ""


//
//  We always trace the code
//
// #define TraceCode   1

//
//  The following functions were borrowed from Tiny compiler code generator
//

class CodeEmitter {
public:
	//enum {gp=0, fp, rt, ac, ac1, ac2, ac3, pc};

	CodeEmitter() : code(&cout), emitLoc(0), highEmitLoc(0), traceCode(1) {}
	CodeEmitter(ostream *codeStream, bool traceFlag) : code(codeStream),
		emitLoc(0), highEmitLoc(0), traceCode(traceFlag) {}

	void emitComment(const string c);
	void emitRO(const string &op, int r, int s, int t, const string c);
	void emitRM(const string &op, int r, int d, int s, const string c);
	void emitRMAbs(const string &op, int r, int a, const string c);
	int emitSkip(int howMany);
	void emitBackup(int loc);
	void emitRestore(void);

private:
	ostream *code; // The stream to output to
	int emitLoc; //  TM location number for current instruction emission
	int highEmitLoc; 
	bool traceCode;
	//  Highest TM location emitted so far
	//   For use in conjunction with emitSkip,
	//   emitBackup, and emitRestore
};

#endif
