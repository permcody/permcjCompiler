#ifndef _GLOBALS_H_
#define _GLOBALS_H_

#include <iostream>
#include <string>
#include <cstdlib>  // used for getopt
#include "symtab.h"
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
	enum {MAXCHILDREN=3};

	TreeNode *child[MAXCHILDREN];
	TreeNode *sibling;
	long lineNumber;
	NodeKind kind;

	void PrintTree() const { this->PrintTree(cout, 0, 0); }
	void PrintTree(ostream &out) const { this->PrintTree(out, 0, 0); }
	void virtual ScopeAndType(ostream &out, int &numErrors) = 0; // pure virtual function
	bool getIsArray() const;
	TreeNode(NodeKind sKind);
	//~TreeNode();

	static SymTab *symtab;	// Our symbol Table Declaration
	static Types funcReturnType; // global for function return type checking
	static bool newScope;	// global for determining whether or not to create a new symbol table scope
	
protected:
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const;
    void PrintSpaces(ostream &out, int numSpaces) const;
	string PrintType(Types t) const;
	void PrintError(ostream &out, int errorNum, int lineno, 
		  const string &s1, const string &s2, const string &s3, int n1, int n2) const;
};

class ExpressionNode : public TreeNode {
public:
	ExprKind subKind;
	Types type;
	string name;
	string op;
	int val;
	//bool isBool; // MAY NOT NEED THIS

	ExpressionNode(ExprKind eKind) 
		: TreeNode(ExprK), subKind(eKind), type(Undefined), val(0) {}
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const;
	void virtual ScopeAndType(ostream &out, int &numErrors);
	void lookupTypes(const string &op, Types &lhs, Types &rhs, Types &returnType);	
};

class StatementNode : public TreeNode {
public:
	StmtKind subKind;
	
	StatementNode(StmtKind sKind) : TreeNode(StmtK), subKind(sKind) {}
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const;
	void virtual ScopeAndType(ostream &out, int &numErrors);
};

class DeclarationNode : public TreeNode {
public:
	DeclKind subKind;
	Types type;
	string name;
	bool isArray;
	int size;
	Types returnType;

	DeclarationNode(DeclKind dKind) 
		: TreeNode(DeclK), subKind(dKind), type(Undefined), size(0), isArray(false), returnType(Undefined) {}
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const;
	static void PrintNode(ostream &out, const DeclarationNode *dPtr);
	void virtual ScopeAndType(ostream &out, int &numErrors);
	//bool getIsArray() const;
};

#endif
