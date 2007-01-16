/*	$Author$
	$Date$
	$Rev$
*/

#include "globals.h"

#ifndef _EXPRESSION_H_
#define _EXPRESSION_H_

// abstract class
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
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const = 0;
	void virtual ScopeAndType(ostream &out, int &numErrors) = 0;
	void virtual GenCode_x86(CodeEmitter &e, bool travSib) = 0;
	void lookupTypes(const string &op, Types &lhs, Types &rhs, Types &returnType);	
};

/********************************************************************************************************
 ************************************** Expression Node SubTypes ****************************************
 ********************************************************************************************************/

class IdExpNode : public ExpressionNode {
public:
	IdExpNode() : ExpressionNode(IdK) {}

	void virtual GenCode_x86(CodeEmitter &e, bool travSib);
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const;
	void virtual ScopeAndType(ostream &out, int &numErrors);
};

class AssignExpNode : public ExpressionNode {
public:
	AssignExpNode() : ExpressionNode(AssignK) {}

	void virtual GenCode_x86(CodeEmitter &e, bool travSib);
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const;
	void virtual ScopeAndType(ostream &out, int &numErrors);
};

class OpExpNode : public ExpressionNode {
public:
	OpExpNode() : ExpressionNode(OpK) {}

	void virtual GenCode_x86(CodeEmitter &e, bool travSib);
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const;
	void virtual ScopeAndType(ostream &out, int &numErrors);
};

class CallExpNode : public ExpressionNode {
public:
	CallExpNode() : ExpressionNode(CallK) {}

	void virtual GenCode_x86(CodeEmitter &e, bool travSib);
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const;
	void virtual ScopeAndType(ostream &out, int &numErrors);
};

class ConstExpNode : public ExpressionNode {
public:
	ConstExpNode() : ExpressionNode(ConstK) {}

	void virtual GenCode_x86(CodeEmitter &e, bool travSib);
	void virtual PrintTree(ostream &out, int spaces, int siblingNum) const;
	void virtual ScopeAndType(ostream &out, int &numErrors);
};

#endif
