/*	$Author$
	$Date$
	$Rev$
*/

#include "globals.h"
#include "expression.h"
#include "statement.h"
#include "declaration.h"
#include "emitcode.h"
#include "compiler.h"

// ********************** static initialization ********************************
TreeNode::Types TreeNode::funcReturnType = TreeNode::Undefined; // global for function return type checking
bool TreeNode::newScope = false;
SymTab *TreeNode::symtab = NULL;
int TreeNode::goff = 0;
int TreeNode::foff = IFRAMEOFFSET;
int TreeNode::poff = PARAMOFFSET; // used by X86 only (parameters are up from the frame pointer (bp)
int TreeNode::toff = 0;
int TreeNode::jumpMain = -1;
int TreeNode::labelnum = 0;
vector<TreeNode *> TreeNode::globals_emitvec;
// ********************** static initialization ********************************

TreeNode::TreeNode(NodeKind sKind) : sibling(NULL), lineNumber(0), kind(sKind) {
	for (short i=0; i<MAXCHILDREN; i++)
		child[i] = NULL;
}

void TreeNode::GenCode_x86(CodeEmitter &e, bool travSib) {
	for (short i=0; i<MAXCHILDREN; i++)
		if (child[i] != NULL)
			child[i]->GenCode_x86(e, true);
	if (sibling != NULL)
		sibling->GenCode_x86(e, true);
}

void TreeNode::CodeGeneration_x86(CodeEmitter &e) {
	// Generate a basic GNU Assembler file

	e.emit_x86Directive(".text");
	e.emit_x86Directive(".globl main");
	e.emitEndFunction();

	GenCode_x86(e, true);

	// Setup a format string for the output function (printf) 
	e.emit_x86Directive(".data");
	e.emit_x86Label("printfInt");
	e.emit_x86Directive("\t.string \"\%d\\n\"\n");
	
	// Setup a format string for the outnl function (printf)
	e.emit_x86Label("printfnl");
	e.emit_x86Directive("\t.string \"\\n\"\n");
	
	// Setup a format string for the input function (scanf)
	e.emit_x86Label("scanfInt");
	e.emit_x86Directive("\t.string \"\%d\"\n");

	// Uninitialized data section (setup a buffer area for scanf input)
	e.emit_x86Directive(".bss");
	//e.emit_x86Label("bufInt");
	
	ostringstream oss1;
	oss1 << ".lcomm bufInt, " << WORDSIZE << "\n";
	e.emit_x86Directive(oss1.str());
	
	// Generate the labels for the global variables
	e.emit_x86Comment("Globals");
	
	vector<TreeNode *>::iterator iter;
	DeclarationNode *dPtr;
	
	
	for (iter = globals_emitvec.begin(); iter != globals_emitvec.end(); iter++) {
		dPtr = (DeclarationNode *)*iter;
		ostringstream oss;
		
		oss << ".lcomm " << dPtr->name << ", " <<  dPtr->size*WORDSIZE << "\n";
		e.emit_x86Directive(oss.str());
		//e.emit_x86Label(dPtr->name);
		//e.emit_x86Directive("\t.long");			
	}	
	e.emitEndFunction();	
}

void TreeNode::GenProlog(int &jumpMain, CodeEmitter &e) const {
	
	e.emitComment("Begin Prolog code");
	e.emitRM("LD", 0, 0, 0, "load global poiniter with end of memory");
	e.emitRM("LDA", 1, goff, 0, "load fp");
	e.emitRM("ST", 1, 0, 1, "store old fp");
	e.emitRM("LDA", 3, 1, 7, "return address in ac");
	jumpMain = e.emitSkip(1);	// save this address into the static variable for later
	e.emitRO("HALT", 0, 0, 0, "DONE!");
	e.emitComment("End Prolog code");
}

void TreeNode::GenIOFunctions(CodeEmitter &e) const {
	e.emitComment("Being Generating IO Functions");
	
	e.emitComment("Begin function input");
	e.emitRM("ST", 3, -1, 1, "store return address");
	e.emitRO("IN", 2, 2, 2, "input integer");
	e.emitRM("LD", 3, -1, 1, "load return address");
	e.emitRM("LD", 1, 0, 1, "adjust fp");
	e.emitRM("LDA", 7, 0, 3, "jump to return address");
	e.emitComment("End function input");

	e.emitComment("Begin function output");
	e.emitRM("ST", 3, -1, 1, "store return address");
	e.emitRM("LD", 3, -2, 1, "load parameter");
	e.emitRO("OUT", 3, 3, 3, "output integer");
	e.emitRM("LDC", 2, 0, 2, "set return to 0");
	e.emitRM("LD", 3, -1, 1, "load return address");
	e.emitRM("LD", 1, 0, 1, "adjust fp");
	e.emitRM("LDA", 7, 0, 3, "jump to return address");
	e.emitComment("End function output");

	e.emitComment("Begin function inputb");
	e.emitRM("ST", 3, -1, 1, "store return address");
	e.emitRO("INB", 2, 2, 2, "input boolean");
	e.emitRM("LD", 3, -1, 1, "load return address");
	e.emitRM("LD", 1, 0, 1, "adjust fp");
	e.emitRM("LDA", 7, 0, 3, "jump to return address");
	e.emitComment("End function inputb");

	e.emitComment("Begin function outputb");
	e.emitRM("ST", 3, -1, 1, "store return address");
	e.emitRM("LD", 3, -2, 1, "load parameter");
	e.emitRO("OUTB", 3, 3, 3, "output boolean");
	e.emitRM("LDC", 2, 0, 2, "set return to 0");
	e.emitRM("LD", 3, -1, 1, "load return address");
	e.emitRM("LD", 1, 0, 1, "adjust fp");
	e.emitRM("LDA", 7, 0, 3, "jump to return address");
	e.emitComment("End function outputb");

	e.emitComment("End Generating IO Functions");
}

TreeNode *TreeNode::AddIOFunctions() {
	DeclarationNode *tPtr, *dNode;

#ifdef X86
	// Add Declaration for void output(int)
	dNode = new FuncDeclNode();
	dNode->type = Void;
	dNode->name = "output";
	dNode->lineNumber = -1;  //unused
	dNode->offset = -1;  //unused
	dNode->sibling = this;
	tPtr = dNode;
	// integer parameter
	dNode = new ParamDeclNode();
	dNode->type = Int;
	dNode->name = "*dummy*";
    dNode->lineNumber = -1;
	dNode->size = 1;
	tPtr->child[0] = (TreeNode *)dNode;
		
	// Add Declaration for int input()
	dNode = new FuncDeclNode();
	dNode->type = Int;
	dNode->name = "input";
	dNode->lineNumber = -1;  //unused
	dNode->offset = -1;  //unused
	dNode->sibling = (TreeNode *)tPtr;
	tPtr = dNode;
	
	// Add Declaration for void outputb(bool)
	dNode = new FuncDeclNode();
	dNode->type = Void;
	dNode->name = "outputb";
	dNode->lineNumber = -1;  //unused
	dNode->offset = -1;  //unused
	dNode->sibling = (TreeNode *)tPtr;
	tPtr = dNode;
	// integer parameter
	dNode = new ParamDeclNode();
	dNode->type = Bool;
	dNode->name = "*dummy*";
    dNode->lineNumber = -1;
	dNode->size = 1;
	tPtr->child[0] = (TreeNode *)dNode;
	
	// Add Declaration for void bool inputb()
	dNode = new FuncDeclNode();
	dNode->type = Bool;
	dNode->name = "inputb";
	dNode->lineNumber = -1;  //unused
	dNode->offset = -1;  //unused
	dNode->sibling = (TreeNode *)tPtr;
	tPtr = dNode;	
	
	// Add Declaration for void outnl()
	dNode = new FuncDeclNode();
	dNode->type = Void;
	dNode->name = "outnl";
	dNode->lineNumber = -1;  //unused
	dNode->offset = -1;  //unused
	dNode->sibling = (TreeNode *)tPtr;
	tPtr = dNode;

#else

	// Add Declaration for "void outputb(bool)"
	dNode = new FuncDeclNode();
	dNode->type = Void;		
	dNode->name = "outputb";
	dNode->lineNumber = -1;
	dNode->offset = 23;
	dNode->sibling = this;
	tPtr = dNode;
	// boolean parameter
	dNode = new ParamDeclNode();
	dNode->type = Bool;
	dNode->name = "*dummy*";
    dNode->lineNumber = -1;
	dNode->size = 1;
	tPtr->child[0] = (TreeNode *)dNode;

	// Add Declaration for "bool inputb(void)"
	dNode = new FuncDeclNode();
	dNode->type = Bool;		
	dNode->name = "inputb";
	dNode->lineNumber = -1;
	dNode->offset = 18;
	dNode->sibling = (TreeNode *)tPtr;
	tPtr = dNode;

	// Add Declaration for "void output(int)"
	dNode = new FuncDeclNode();
	dNode->type = Void;		
	dNode->name = "output";
	dNode->lineNumber = -1;
	dNode->offset = 11;
	dNode->sibling = (TreeNode *)tPtr;
	tPtr = dNode;
	// integer parameter
	dNode = new ParamDeclNode();
	dNode->type = Int;
	dNode->name = "*dummy*";
    dNode->lineNumber = -1;
	dNode->size = 1;
	tPtr->child[0] = (TreeNode *)dNode;

	// Add Declaration for "int input(void)"
	dNode = new FuncDeclNode();
	dNode->type = Int;		
	dNode->name = "input";
	dNode->lineNumber = -1;
	dNode->offset = 6;
	dNode->sibling = (TreeNode *)tPtr;
	tPtr = dNode;
	
#endif
		
	return (TreeNode *)tPtr;	
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

void TreeNode::PrintMem(ostream &out) const {
	out << "Memory Layout\nglobalOffset: " << goff << "\n";
	this->PrintMemory(out);
}

void TreeNode::PrintMemory(ostream &out) const {
	// print Children
	for (int i=0; i<MAXCHILDREN; ++i)
		if (child[i] != NULL) 
			child[i]->PrintMemory(out);
	if (sibling != NULL)
		sibling->PrintMemory(out);
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
		case Undefined:
			s = "undefined";
			break;
		default:
			s = "error";
			break;
	}
	return s;
}

void TreeNode::PrintError(ostream &out, int errorNum, int lineno, 
		const string &s1=NULL, const string &s2=NULL, const string &s3=NULL, int n1=0, int n2=0) const
{
	out << "ERROR lineno(" << lineno << "): ";
	switch (errorNum) {
		case 1:
			out << s1 << " requires things of the same type but lhs is " << s2 << " and rhs is " << s3;
			break;
		case 2:
			out << s1 << " requires things of type " << s2 << " but lhs is of type " << s3;
			break;
		case 3:
			out << s1 << " requires things of type " << s2 << " but rhs is of type " << s3;
			break;
		case 4:
			out << "Cannot index nonarray " << s1;
			break;
		case 5:
			out << "Cannot return an array";
			break;
		case 6:
			out << "Cannot use array as test condition";
			break;
		case 7:
			out << "Expecting " << s1 << " in parameter " << n1 << " of call " << s2 << " defined on line " << n2;
			break;
		case 8:
			out << "Expecting a return type of " << s1 << " but got none";
			break;
		case 9:
			out << "Expecting array in parameter " << n1 << " of call " << s1 << " defined on line " << n2;
			break;
		case 10:
			out << "Expecting array index to be of type int but got type " << s1;
			break;
		case 11:
			out << "Expecting boolean test condition";
			break;
		case 12:
			out << "Expecting return type of " << s1 << " but got type " << s2;
			break;
		case 13:
			out << "Not expecting array in parameter " << n1 << " of call " << s1 << " defined on line " << n2;
			break;
		case 14:
			out << "Symbol " << s1 << " is already defined at line " << n1;
			break;
		case 15:
			out << "Symbol " << s1 << " is not defined";
			break;
		case 16:
			out << "The operation " << s1 << " does not work with arrays";
			break;
		case 17:
			out << "Unary " << s1 << " requires things of type " << s2 << " but was given type " << s3;
			break;
		case 18:
			out << "Wrong number of parameters for function " << s1 << " defined on line " << n1;
			break;
		case 19:
			out << s1 << " cannot be of type void";
			break;
		case 20:
			out << s1 << " is a simple variable and cannot be called";
			break;
		case 21:
			out << "Cannot use function " << s1 << " as a simple variable";
			break;
	}
	out << '.' << endl;
}

bool TreeNode::getIsArray() const {
	DeclarationNode *dPtr;
	bool locIsArray = false;
	bool locIsIndexed = false;

	// Used to check if a variable expression is properly declared and indexed
	if (this->child[0] != NULL)
		locIsIndexed = true;
	if (((ExpressionNode *)this)->subKind == IdK) {
		dPtr = (DeclarationNode *)symtab->lookup(((ExpressionNode *)this)->name.c_str());
		if (dPtr != NULL && dPtr->isArray && !locIsIndexed) {						
			// check for decl - if declaration says the variable is an array 
			// and it's not indexed then return true
			locIsArray = true;
		}
	}	
	return locIsArray;
}

