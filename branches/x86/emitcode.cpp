//
//  TM Code emitting utilities
//  implementation for the TINY compiler
//  Compiler Construction: Principles and Practice
//  Kenneth C. Louden
//  Modified slightly by Jorge L. Williams
//  Modified Apr 11, 2004 Robert Heckendorn
//
//  The two comment string forms of the calls allow you to easily
//  compose a comment from text and a symbol name for example.  This
//  code is compilable in plain C.  C++ people may want to change the
//  interface but this code will work for both users.
//

#include "emitcode.h"
#include <iostream>
#include <iomanip>

using namespace std;

//extern ostream *code;


//  TM location number for current instruction emission
//static int emitLoc = 0;


//  Highest TM location emitted so far
//   For use in conjunction with emitSkip,
//   emitBackup, and emitRestore
//static int highEmitLoc = 0;


//  Procedure emitComment prints a comment line 
// with a comment that is the concatenation of c and d
// 
/*void emitComment2(const char *c, const char *cc)
{
	if (TraceCode) *code << "* " << c << ' ' << cc << '\n';
}*/

//  Procedure emitComment prints a comment line 
// with comment c in the code file
// 
void CodeEmitter::emitComment(const string c)
{
    if (traceCode) *code << "* " << c << '\n';
}



// emitRO emits a register-only TM instruction
// op = the opcode
// r = target register
// s = 1st source register
// t = 2nd source register
// c = a comment to be printed if TraceCode is TRUE
// 
void CodeEmitter::emitRO(const string &op, int r, int s, int t, const string c) // , const char *cc
{
	*code << setw(3) << emitLoc++ << ":  " << setw(5) << op << "  " << r << ',' << s << ',' << t << ' ';
	//fprintf(code, "%3d:  %5s  %d,%d,%d ", emitLoc++, op, r, s, t);
    if (traceCode) *code << '\t' << c;  //fprintf(code, "\t%s %s", c, cc);
    *code << '\n';
	//fprintf(code, "\n");
    if (highEmitLoc<emitLoc) highEmitLoc = emitLoc;
}

/*void emitRO(char *op, int r, int s, int t, const char *c)
{
    emitRO2(op, r, s, t, c, "");
}*/



// emitRM emits a register-to-memory TM instruction
// op = the opcode
// r = target register
// d = the offset
// s = the base register
// c = a comment to be printed if TraceCode is TRUE
// 
void CodeEmitter::emitRM(const string &op, int r, int d, int s, const string c) //, const char *cc
{
	*code << setw(3) << emitLoc++ << ":  " << setw(5) << op << "  " << r << ',' << d << '(' << s << ") ";
	//fprintf(code, "%3d:  %5s  %d,%d(%d) ", emitLoc++, op, r, d, s);
    if (traceCode) *code << '\t' << c; //fprintf(code, "\t%s %s", c, cc);
    *code << '\n';
	//fprintf(code, "\n");
    if (highEmitLoc<emitLoc) highEmitLoc = emitLoc;
}

/*void emitRM(char *op, int r, int d, int s, const char *c)
{
    emitRM2(op, r, d, s, c, "");
}*/


// allow concatenation of two strings


// emitRMAbs converts an absolute reference to local relative
// to a pc-relative reference when emitting a
// register-to-memory TM instruction
// op = the opcode
// r = target register
// a = the absolute location in memory
// c = a comment to be printed if TraceCode is TRUE
// 
void CodeEmitter::emitRMAbs(const string &op, int r, int a, const string c) //,  const char *cc
{
	*code << setw(3) << emitLoc << ":  " << setw(5) << op << "  " << r << ',' << a - (emitLoc + 1) << '(' << pc << ") ";
    //fprintf(code, "%3d:  %5s  %d,%d(%d) ", emitLoc, op, r, a - (emitLoc + 1),
	//    pc);
    emitLoc++;
    if (traceCode) *code << '\t' << c; // fprintf(code, "\t%s %s", c, cc);
    *code << '\n';
	//fprintf(code, "\n");
    if (highEmitLoc<emitLoc) highEmitLoc = emitLoc;
}


/*void emitRMAbs(char *op, int r, int a, const char *c)
{
    emitRMAbs2(op, r, a, c, "");
}*/


// 
//  Backpatching Functions
// 

// emitSkip skips "howMany" code
// locations for later backpatch. It also
// returns the current code position
// 
int CodeEmitter::emitSkip(int howMany)
{
    int i = emitLoc;
    emitLoc += howMany;
    if (highEmitLoc<emitLoc) highEmitLoc = emitLoc;

    return i;
}


// emitBackup backs up to 
// loc = a previously skipped location
// 
void CodeEmitter::emitBackup(int loc)
{
    if (loc>highEmitLoc) emitComment("BUG in emitBackup");
    emitLoc = loc;
}

// emitRestore restores the current 
// code position to the highest previously
// unemitted position
// 
void CodeEmitter::emitRestore(void)
{
    emitLoc = highEmitLoc;
}

void CodeEmitter::emitEndFunction()
{
	vector<string>::iterator iter;
	
	for (iter = codeContainer.begin( ); iter != codeContainer.end( ); iter++)
		*code << *iter;
	codeContainer.clear();	
}

void CodeEmitter::emit_x86R1(const string &op, const string &reg, const string &c)
{
	ostringstream oss;
	
	oss	 	<< "\t" 
			<< setw(8) << left << op
		 	<< setw(22) << left << "%" + reg 
		 	<< (c==""?"":"# ") << c << "\n";
	codeContainer.push_back(oss.str());    
}

void CodeEmitter::emit_x86R2(const string &op, const string &reg1, const string &reg2, const string &c) 
{
	ostringstream oss;
	
	oss	 	<< "\t" 
			<< setw(8) << left << op 
			<< setw(22) << left << "%" + reg1 + ", " + "%" + reg2 
			<< (c==""?"":"# ") << c << "\n";
	codeContainer.push_back(oss.str());   
}

void CodeEmitter::emit_x86RM(const string &op, const string &reg, int offset, const string &regMem, const string &c)
{
	ostringstream oss, oss1;
	oss1 << offset*WORDSIZE;
			
	oss	 	<< "\t" 
			<< setw(8) << left << op
			<< setw(22) << left << "%" + reg + ", " + oss1.str() + "(" + "%" + regMem + ")" 
			<< (c==""?"":"# ") << c << "\n"; 
	codeContainer.push_back(oss.str());
}

void CodeEmitter::emit_x86M2R(const string &op, const string &regBase, const string &regIndex, const string &reg, const string &c)
{
	ostringstream oss, oss1;
	oss1 << WORDSIZE;	
		
	oss		<< "\t"
			<< setw(8) << left << op
			<< setw(22) << left << "(%" + regBase + "," + "%" + regIndex + "," + oss1.str() + ")" + ", " + "%" + reg
			<< (c==""?"":"# ") << c << "\n";
	codeContainer.push_back(oss.str());
} 

void CodeEmitter::emit_x86RM2(const string &op, const string &reg, const string &regBase, const string &regIndex, const string &c)
{
	ostringstream oss, oss1;
	oss1 << WORDSIZE;	
	
	oss		<< "\t"
			<< setw(8) << left << op
			<< setw(22) << left << "%" + reg + ", " + "(" + "%" + regBase + "," + "%" + regIndex + "," + oss1.str() + ")"
			<< (c==""?"":"# ") << c << "\n";
	codeContainer.push_back(oss.str());
} 

void CodeEmitter::emit_x86MR(const string &op, int offset, const string &regMem, const string &reg, const string &c)
{
	ostringstream oss, oss1;
	oss1 << offset*WORDSIZE;
			
	oss	 	<< "\t"
			<< setw(8) << left << op 
			<< setw(22) << left << oss1.str() + "(" + "%" + regMem + ")" + ", " + "%" + reg 
			<< (c==""?"":"# ") << c << "\n"; 
	codeContainer.push_back(oss.str());
}


void CodeEmitter::emit_x86CR(const string &op, int im, const string &reg, const string &c)
{
	ostringstream oss, oss1;
	oss1 << im;
			
	oss	 	<< "\t" 
			<< setw(8) << left << op
			<< setw(22) << left << "$" + oss1.str() + ", " + "%" + reg 
			<< (c==""?"":"# ") << c << "\n";
	codeContainer.push_back(oss.str());
}

void CodeEmitter::emit_x86RC(const string &op, const string &reg, int im, const string &c)
{
	ostringstream oss, oss1;
	oss1 << im;
			
	oss	 	<< "\t" 
			<< setw(8) << left << op
			<< setw(22) << left << "%" + reg + ", " + "$" + oss1.str() 
			<< (c==""?"":"# ") << c << "\n";
	codeContainer.push_back(oss.str());	
}

void CodeEmitter::emit_x86C(const string &op, const string &im, const string &c)
{
	ostringstream oss;
	
	oss	 	<< "\t" 
			<< setw(8) << left << op
			<< setw(22) << left << "$" + im  
			<< (c==""?"":"# ") << c << "\n";
	codeContainer.push_back(oss.str());
}	

void CodeEmitter::emit_x86J(const string &op, const string &label, const string &c)
{
	ostringstream oss;
	
	oss	 	<< "\t" 
			<< setw(8) << left << op
			<< setw(22) << left << label  
			<< (c==""?"":"# ") << c << "\n";
	codeContainer.push_back(oss.str());
}	

void CodeEmitter::emit_x86Call(const string &function, const string &c)
{
	ostringstream oss;
	
	oss	 	<< "\t" 
			<< setw(8) << left << "call"
		 	<< setw(22) << left << function 
		 	<< (c==""?"":"# ") << c << "\n";
	codeContainer.push_back(oss.str());    
}

void CodeEmitter::emit_x86(const string &op)
{
	ostringstream oss;
	
	oss 	<< "\t" << op << "\n";
	codeContainer.push_back(oss.str());
}

void CodeEmitter::emit_x86Comment(const string &c)
{
	ostringstream oss;
			 	
    if (traceCode) { 
    		oss << "\t" << (c==""?"":"# ") << c << '\n';
    		codeContainer.push_back(oss.str());
    }
}

void CodeEmitter::emit_x86Label(const string &label)
{
	ostringstream oss;
	
	oss	<< label << ":\n";
	codeContainer.push_back(oss.str());
}

void CodeEmitter::emit_x86Directive(const string &directive)
{
	ostringstream oss;
	
	oss	<< directive << "\n";
	codeContainer.push_back(oss.str());
}

