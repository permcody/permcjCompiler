/*	$Author$
	$Date$
	$Rev$
*/

#include "globals.h"

#ifndef _DECLARATION_H_
#define _DECLARATION_H_

// abstract class
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
	//void virtual ScopeAndType(ostream &out, int &numErrors) = 0;
	//void virtual GenCode_x86(CodeEmitter &e, bool travSib) = 0;
};

/********************************************************************************************************
 ************************************** Declaration Node SubTypes ***************************************
 ********************************************************************************************************/
class FuncDeclNode : public DeclarationNode {
public:
	FuncDeclNode() : DeclarationNode(FuncK) {}

	void virtual GenCode_x86(CodeEmitter &e, bool travSib);	
	void virtual ScopeAndType(ostream &out, int &numErrors);
};

class VarDeclNode : public DeclarationNode {
public:
	VarDeclNode() : DeclarationNode(VarK) {}

	void virtual GenCode_x86(CodeEmitter &e, bool travSib);
	void virtual ScopeAndType(ostream &out, int &numErrors);
};

class ParamDeclNode : public DeclarationNode {
public:
	ParamDeclNode() : DeclarationNode(ParamK) {}

	void virtual GenCode_x86(CodeEmitter &e, bool travSib);
	void virtual ScopeAndType(ostream &out, int &numErrors);
};
#endif
