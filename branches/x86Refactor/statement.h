/*	$Author$
	$Date$
	$Rev$
*/

#include "globals.h"

#ifndef _STATEMENT_H_
#define _STATEMENT_H_

//abstract class
class StatementNode : public TreeNode {
public:
	StmtKind subKind;
	
	StatementNode(StmtKind sKind) : TreeNode(StmtK), subKind(sKind) {}
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const = 0;
	//void virtual ScopeAndType(ostream &out, int &numErrors) = 0;
	//void virtual GenCode_x86(CodeEmitter &e, bool travSib);
};

/********************************************************************************************************
 ************************************** Statment Node SubTypes ******************************************
 ********************************************************************************************************/

class IfStateNode : public StatementNode {
public:
	IfStateNode() : StatementNode(IfK) {}

	void virtual GenCode_x86(CodeEmitter &e, bool travSib);
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const;
	void virtual ScopeAndType(ostream &out, int &numErrors);
};

class CompStateNode : public StatementNode {
public:
	CompStateNode() : StatementNode(CompK) {}

	void virtual GenCode_x86(CodeEmitter &e, bool travSib);
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const;
	void virtual ScopeAndType(ostream &out, int &numErrors);
};

class WhileStateNode : public StatementNode {
public:
	WhileStateNode() : StatementNode(WhileK) {}

	void virtual GenCode_x86(CodeEmitter &e, bool travSib);
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const;
	void virtual ScopeAndType(ostream &out, int &numErrors);
};

class ForStateNode : public StatementNode {
public:
	ForStateNode() : StatementNode(ForK) {}

	void virtual GenCode_x86(CodeEmitter &e, bool travSib);
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const;
	void virtual ScopeAndType(ostream &out, int &numErrors);
};

class ReturnStateNode : public StatementNode {
public:
	ReturnStateNode() : StatementNode(ReturnK) {}

	void virtual GenCode_x86(CodeEmitter &e, bool travSib);
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const;
	void virtual ScopeAndType(ostream &out, int &numErrors);
};

class BreakStateNode : public StatementNode {
public:
	BreakStateNode() : StatementNode(BreakK) {}

	void virtual GenCode_x86(CodeEmitter &e, bool travSib);
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const;
	void virtual ScopeAndType(ostream &out, int &numErrors);
};

#endif
