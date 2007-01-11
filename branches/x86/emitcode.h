#ifndef EMIT_CODE_H__
#define EMIT_CODE_H__

#include <iostream>
#include <string>
#include <sstream>
#include <vector>

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
// X86 Constants
//

//#define BITS64 1

#ifdef BITS64 
#define WORDSIZE 8
#define ax "rax"
#define bx "rbx"
#define cx "rcx"
#define dx "rdx"
#define bp "rbp"
#define sp "rsp"
#define si "rsi"
#define di "rdi"
#else
#define WORDSIZE 4
#define ax "eax"
#define bx "ebx"
#define cx "ecx"
#define dx "edx"
#define bp "ebp"
#define sp "esp"
#define si "esi"
#define di "edi"
#endif


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
		
	void emitEndFunction();
	void emit_x86Comment(const string &c);
	void emit_x86(const string &op);
	void emit_x86R1(const string &op, const string &reg, const string &c);
	void emit_x86R2(const string &op, const string &reg1, const string &reg2, const string &c);
	void emit_x86CR(const string &op, int im, const string &reg, const string &c);
	void emit_x86RC(const string &op, const string &reg, int im, const string &c);
	void emit_x86LR(const string &op, const string &label, const string &reg, const string &c);
	void emit_x86C(const string &op, const string &im, const string &c);
	void emit_x86J(const string &op, const string &label, const string &c);
	void emit_x86MR(const string &op, int offset, const string &regMem, const string &reg, const string &c);
	void emit_x86RM(const string &op, const string &reg, int offset, const string &regMem, const string &c);
	void emit_x86M2R(const string &op, const string &regBase, const string &regIndex, const string &reg, const string &c);
	void emit_x86RM2(const string &op, const string &reg, const string &regBase, const string &regIndex, const string &c);
	void emit_x86Label(const string &label);
	void emit_x86Directive(const string &directive);
	void emit_x86Call(const string &functionName, const string &c);  

private:
	ostream *code; // The stream to output to
	vector<string> codeContainer;	// The string stream used for backpatch operations
	int emitLoc; //  TM location number for current instruction emission
	int highEmitLoc; 
	bool traceCode;
	//  Highest TM location emitted so far
	//   For use in conjunction with emitSkip,
	//   emitBackup, and emitRestore
};

#endif
