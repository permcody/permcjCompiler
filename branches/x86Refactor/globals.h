/*	$Author$
	$Date$
	$Rev$
*/

#ifndef _GLOBALS_H_
#define _GLOBALS_H_

#include <iostream>
#include <iomanip>
#include <fstream>
#include <string>
#include <cstdlib>  // used for getopt
#include <vector>
#include "symtab.h"
#include "emitcode.h"

#define IFRAMEOFFSET -3 // 0 = EBP, -1 = EBX, -2 = ESI, -3 = EDI (Offsets are adjusted prior to assignment)
#define PARAMOFFSET 2 // 0 = EBP, 1 = EIP

using namespace std;

struct FlexStruct {
public:
	char *identifier;
	long number;
	long lineno;
};

class ExpressionNode;
class StatementNode;
class DeclarationNode;

class TreeNode {
public:	
	enum NodeKind {StmtK, ExprK, DeclK};
	enum StmtKind {IfK, CompK, WhileK, ForK, ReturnK, BreakK};
	enum ExprKind {OpK, AssignK, ConstK, IdK, SimpK, CallK};
	enum DeclKind {FuncK, VarK, ParamK};
	enum Types {Undefined, Int, Void, Bool, Error};
	enum ScopeTypes {Global, Local, Parameter};
	enum {MAXCHILDREN=4};

	TreeNode *child[MAXCHILDREN];
	TreeNode *sibling;
	long lineNumber;
	NodeKind kind;

	TreeNode *AddIOFunctions();
	void PrintTree() const { this->PrintTree(cout, 0, 0); }
	void PrintTree(ostream &out)const { this->PrintTree(out, 0, 0); }
	void PrintMem() const { this->PrintMem(cout); }	
	void PrintMem(ostream &out) const;
	void CodeGeneration_x86(char *sourceFileName, CodeEmitter &e);
	void CodeGen_DebugLoc(CodeEmitter &e);
	void virtual ScopeAndType(ostream &out, int &numErrors);
	void virtual GenCode_x86(CodeEmitter &e, bool travSib);
	bool getIsArray() const;
	TreeNode(NodeKind sKind);
	void PrintError(ostream &out, int errorNum, int lineno, 
		  const string &s1, const string &s2, const string &s3, int n1, int n2) const;
	virtual ~TreeNode();

	static SymTab *symtab;	// Our symbol Table Declaration
	static Types funcReturnType; // global for function return type checking
	static int jumpMain;	// Location of main to backpatch into prolog
	static bool newScope;	// global for determining whether or not to create a new symbol table scope
	static int goff;	// global offset
	static int foff;	// frame offset
	static int toff;	// temporary offset
	static int poff;	// param offset
	static int labelnum;  // global label numbers (x86 only)
	static int whilenum;  // current while label number (x86 only)
	static int fornum;	  // current for label number (x86 only)
	static vector<TreeNode *> globals_emitvec; // global variable holder (x86 only)
	static int lastDebugLoc;
	
protected:
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const = 0;
	void virtual PrintMemory(ostream &out) const;
    void PrintSpaces(ostream &out, int numSpaces) const;
	string PrintType(Types t) const;	
};

#endif
