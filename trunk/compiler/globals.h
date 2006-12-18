#ifndef _GLOBALS_H_
#define _GLOBALS_H_

#include <iostream>
#include <string>
#include <cstdlib>  // used for getopt
using namespace std;

class TreeNode {
public:	
	enum NodeKind {StmtK, ExprK, DeclK};
	enum StmtKind {IfK, CompK, WhileK, ReturnK};
	enum ExprKind {OpK, AssignK, ConstK, IdK, SimpK, CallK};
	enum DeclKind {FuncK, VarK, ParamK};	
	enum Types {Undefined, Int, Void, Bool};
	enum Ops {Und, Plus, Minus, Multiply, Divide, Eq, Geq, Leq, Lt, Gt, Neq, Or, And, Not, Mod};
	enum {MAXCHILDREN=3};

	TreeNode *child[MAXCHILDREN];
	TreeNode *sibling;
	unsigned short lineNumber;
	NodeKind kind;

	void PrintTree(ostream &out) const { this->PrintTree(out, 0, 0); }
	TreeNode(NodeKind sKind);
	//~TreeNode();

protected:
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const;
	void PrintSpaces(ostream &out, int numSpaces) const;
	string PrintType(Types t) const;
	string PrintOp(Ops op) const;
};

class ExpressionNode : public TreeNode {
public:
	ExprKind subKind;
	string name;
	Ops op;
	int val;
	bool isBool;

	ExpressionNode(ExprKind eKind);
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const;
};

class StatementNode : public TreeNode {
public:
	StmtKind subKind;
	
	StatementNode(StmtKind sKind);
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const;
};

class DeclarationNode : public TreeNode {
public:
	DeclKind subKind;
	Types type;
	string name;
	bool isArray;
	int size;

	DeclarationNode(DeclKind dKind);
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const;
};

#endif
