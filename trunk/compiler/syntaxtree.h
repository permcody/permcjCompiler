#ifndef _SYNTAXTREE_H_
#define _SYNTAXTREE_H_

#define MAX_EXP_REGISTERS 4
#define FIRST_REG_OFFSET 3

#include <iostream>
#include <iomanip>
#include <fstream>
#include <string>
#include <cstdlib>  // used for getopt
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
	void virtual ScopeAndType(ostream &out, int &numErrors) = 0; // pure virtual function
	void virtual GenCode(CodeEmitter &e, bool travSib, int virtualRegister, int toff);
	bool getIsArray() const;
	TreeNode(NodeKind sKind);
	//~TreeNode();

	static SymTab *symtab;	// Our symbol Table Declaration
	static Types funcReturnType; // global for function return type checking
	static int jumpMain;	// Location of main to backpatch into prolog
	static bool newScope;	// global for determining whether or not to create a new symbol table scope
	static int goff;	// global offset
	static int foff;	// frame offset
	//static int toff;	// temporary offset
	
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
	void virtual GenCode(CodeEmitter &e, bool travSib, int virtualRegister, int toff);
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
    void virtual GenCode(CodeEmitter &e, bool travSib, int virtualRegister, int toff);
	void GenAssignLHS(CodeEmitter &e, int virtualRegister, int toff);
	void lookupTypes(const string &op, Types &lhs, Types &rhs, Types &returnType);	
};

class StatementNode : public TreeNode {
public:
	StmtKind subKind;
	
	StatementNode(StmtKind sKind) : TreeNode(StmtK), subKind(sKind) {}
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const;
	void virtual ScopeAndType(ostream &out, int &numErrors);
	void virtual GenCode(CodeEmitter &e, bool travSib, int virtualRegister, int toff);
};



#endif
