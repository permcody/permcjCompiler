#include "globals.h"

TreeNode::TreeNode(NodeKind sKind) : sibling(NULL), lineNumber(0), kind(sKind) {
	for (short i=0; i<MAXCHILDREN; i++)
		child[i] = NULL;
	//sibling = NULL;
	//lineNumber = 0;
	//kind = sKind;
}

void TreeNode::PrintTree(ostream &out, int spaces, int siblingNum) const {
	// print Children
	for (int i=0; i<MAXCHILDREN; ++i)
		if (this->child[i] != NULL) {
			PrintSpaces(out, spaces);
			out << "Child: " << i << '\n';		
			this->child[i]->PrintTree(out, spaces+4, 0); // reset sibling number in child calls
		}
	// print Siblings
	if (this->sibling != NULL) {
		PrintSpaces(out, spaces);
		out << "Sibling: " << ++siblingNum << '\n';
		this->sibling->PrintTree(out, spaces, siblingNum);
	}
}

void TreeNode::PrintSpaces(ostream &out, int numSpaces) const {
	for (int i=0; i<numSpaces; ++i)
		out << ' ';
}

string TreeNode::PrintType(Types t) const {
	string s;

	switch (t) {
		case Void:
			s = "void";
			break;
		case Int:
			s = "int";
			break;
		case Bool:
			s = "bool";	
			break;
	}
	return s;
}

void ExpressionNode::PrintTree(ostream &out, int spaces, int siblingNum) const {
	PrintSpaces(out, spaces);

	switch (subKind) {
		case OpK:
			out << "Op: " << op << '\n';
			break;
		case AssignK:
			out << "Assign" << '\n';
			break;
		case ConstK:
			if (isBool)
				out << "Const: " << boolalpha << (bool)val << noboolalpha << '\n';
			else
				out << "Const: " << val << '\n';
			break;
		case IdK:
			out << "Id: " << name << '\n';
			break;
		case CallK:
			out << "Call: " << name << '\n';
			break;
	}    
	TreeNode::PrintTree(out, spaces, siblingNum);
}

void StatementNode::PrintTree(ostream &out, int spaces, int siblingNum) const {
	PrintSpaces(out, spaces);
    
	switch (subKind) {
		case IfK:
			out << "If\n";
			break;
		case CompK:
			out << "Compound\n";
			break;
		case WhileK:
			out << "While\n";
			break;
		case ReturnK:
			out << "Return\n";
			break;
	}
	TreeNode::PrintTree(out, spaces, siblingNum);
}

void DeclarationNode::PrintTree(ostream &out, int spaces, int siblingNum) const {
	PrintSpaces(out, spaces);
    switch (subKind) {
		case FuncK:
			out << "Function " << name << " returns " << PrintType(type) << '\n';
			break;
		case VarK:
			out << "Var " << name << " of type " << PrintType(type);
			if (isArray) {
				out << " is array";
				if (size >= 0)
					out << " of size " << size;
				out << '\n';
			}
			else
				out << '\n';
			break;
		case ParamK:
			out << "Param " << name << " of type " << PrintType(type);
			if (isArray) {
				out << " is array";
				if (size >= 0)
					out << " of size " << size;
				out << '\n';
			}
			else
				out << '\n';
			break;
	}		
	TreeNode::PrintTree(out, spaces, siblingNum);
}

