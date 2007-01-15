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
using namespace std;

struct FlexStruct {
public:
	char *identifier;
	long number;
	long lineno;
};

class TreeNode {
public:	
	enum NodeKind {StmtK, ExprK, DeclK};
	enum StmtKind {IfK, CompK, WhileK, ReturnK};
	enum ExprKind {OpK, AssignK, ConstK, IdK, SimpK, CallK};
	enum DeclKind {FuncK, VarK, ParamK};
	enum Types {Undefined, Int, Void, Bool, Error};
	enum ScopeTypes {Global, Local, Parameter};
	enum {MAXCHILDREN=3};

	TreeNode *child[MAXCHILDREN];
	TreeNode *sibling;
	long lineNumber;
	NodeKind kind;

	TreeNode *AddIOFunctions();
	void PrintTree() const { this->PrintTree(cout, 0, 0); }
	void PrintTree(ostream &out)const { this->PrintTree(out, 0, 0); }
	void PrintMem() const { this->PrintMem(cout); }	
	void PrintMem(ostream &out) const;
	void CodeGeneration(CodeEmitter &e);
	void CodeGeneration_x86(CodeEmitter &e);
	void virtual ScopeAndType(ostream &out, int &numErrors) = 0; // pure virtual function
	void virtual GenCode(CodeEmitter &e, bool travSib);
	void virtual GenCode_x86(CodeEmitter &e, bool travSib);
	bool getIsArray() const;
	TreeNode(NodeKind sKind);
	//~TreeNode();

	static SymTab *symtab;	// Our symbol Table Declaration
	static Types funcReturnType; // global for function return type checking
	static int jumpMain;	// Location of main to backpatch into prolog
	static bool newScope;	// global for determining whether or not to create a new symbol table scope
	static int goff;	// global offset
	static int foff;	// frame offset
	static int toff;	// temporary offset
	static int poff;	// param offset
	static int labelnum;  // global label numbers (x86 only)
	static vector<TreeNode *> globals_emitvec; // global variable holder (x86 only)
	
protected:
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const;
	void virtual PrintMemory(ostream &out) const;
    void PrintSpaces(ostream &out, int numSpaces) const;
	string PrintType(Types t) const;
	void PrintError(ostream &out, int errorNum, int lineno, 
		  const string &s1, const string &s2, const string &s3, int n1, int n2) const;

private:
	void GenProlog(int &jumpMain, CodeEmitter &e) const;
	void GenIOFunctions(CodeEmitter &e) const;
};

class DeclarationNode : public TreeNode {
public:
	DeclKind subKind;
	Types type;
	string name;
	bool isArray;
	int size;
	int offset;
	ScopeTypes theScope;
	//bool isGlobal;
	Types returnType;	

	DeclarationNode(DeclKind dKind) 
		: TreeNode(DeclK), subKind(dKind), type(Undefined), size(0), isArray(false), 
		  returnType(Undefined), offset(0), theScope(Global) {}
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const;
	void virtual PrintMemory(ostream &out) const;
	static void PrintNode(ostream &out, const DeclarationNode *dPtr);
	void virtual ScopeAndType(ostream &out, int &numErrors);
	void virtual GenCode(CodeEmitter &e, bool travSib);
	void virtual GenCode_x86(CodeEmitter &e, bool travSib);
};

class ExpressionNode : public TreeNode {
public:
	ExprKind subKind;
	Types type;
	string name;
	string op;
	int val;
	DeclarationNode *dPtr;

	ExpressionNode(ExprKind eKind) 
		: TreeNode(ExprK), subKind(eKind), type(Undefined), val(0), dPtr(NULL) {}
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const;
	void virtual ScopeAndType(ostream &out, int &numErrors);
	void virtual GenCode(CodeEmitter &e, bool travSib);
	void virtual GenCode_x86(CodeEmitter &e, bool travSib);
	void lookupTypes(const string &op, Types &lhs, Types &rhs, Types &returnType);	
};

class StatementNode : public TreeNode {
public:
	StmtKind subKind;
	
	StatementNode(StmtKind sKind) : TreeNode(StmtK), subKind(sKind) {}
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const;
	void virtual ScopeAndType(ostream &out, int &numErrors);
	void virtual GenCode(CodeEmitter &e, bool travSib);
	void virtual GenCode_x86(CodeEmitter &e, bool travSib);
};

class IdExpNode : public ExpressionNode {
public:
	IdExpNode() : ExpressionNode(IdK) {}

	void virtual GenCode_x86(CodeEmitter &e, bool travSib);
};


#endif
