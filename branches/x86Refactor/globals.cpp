/*	$Author$
	$Date$
	$Rev$
*/

#include "globals.h"
#include "expression.h"
#include "statement.h"
#include "emitcode.h"
#include "compiler.h"

#ifdef X86
#define IFRAMEOFFSET -4 // 0 = EBP, -1 = EBX, -2 = ESI, -3 = EDI
#else
#define IFRAMEOFFSET -2 // 0 and -1 are for the previous frame address and return address respectively
#endif

#define PARAMOFFSET 2 // 0 = EBP, 1 = EIP
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
	dNode = new DeclarationNode(TreeNode::FuncK);
	dNode->type = Void;
	dNode->name = "output";
	dNode->lineNumber = -1;  //unused
	dNode->offset = -1;  //unused
	dNode->sibling = this;
	tPtr = dNode;
	// integer parameter
	dNode = new DeclarationNode(TreeNode::ParamK);
	dNode->type = Int;
	dNode->name = "*dummy*";
    dNode->lineNumber = -1;
	dNode->size = 1;
	tPtr->child[0] = (TreeNode *)dNode;
		
	// Add Declaration for int input()
	dNode = new DeclarationNode(TreeNode::FuncK);
	dNode->type = Int;
	dNode->name = "input";
	dNode->lineNumber = -1;  //unused
	dNode->offset = -1;  //unused
	dNode->sibling = (TreeNode *)tPtr;
	tPtr = dNode;
	
	// Add Declaration for void outputb(bool)
	dNode = new DeclarationNode(TreeNode::FuncK);
	dNode->type = Void;
	dNode->name = "outputb";
	dNode->lineNumber = -1;  //unused
	dNode->offset = -1;  //unused
	dNode->sibling = (TreeNode *)tPtr;
	tPtr = dNode;
	// integer parameter
	dNode = new DeclarationNode(TreeNode::ParamK);
	dNode->type = Bool;
	dNode->name = "*dummy*";
    dNode->lineNumber = -1;
	dNode->size = 1;
	tPtr->child[0] = (TreeNode *)dNode;
	
	// Add Declaration for void bool inputb()
	dNode = new DeclarationNode(TreeNode::FuncK);
	dNode->type = Bool;
	dNode->name = "inputb";
	dNode->lineNumber = -1;  //unused
	dNode->offset = -1;  //unused
	dNode->sibling = (TreeNode *)tPtr;
	tPtr = dNode;	
	
	// Add Declaration for void outnl()
	dNode = new DeclarationNode(TreeNode::FuncK);
	dNode->type = Void;
	dNode->name = "outnl";
	dNode->lineNumber = -1;  //unused
	dNode->offset = -1;  //unused
	dNode->sibling = (TreeNode *)tPtr;
	tPtr = dNode;

#else

	// Add Declaration for "void outputb(bool)"
	dNode = new DeclarationNode(TreeNode::FuncK);
	dNode->type = Void;		
	dNode->name = "outputb";
	dNode->lineNumber = -1;
	dNode->offset = 23;
	dNode->sibling = this;
	tPtr = dNode;
	// boolean parameter
	dNode = new DeclarationNode(TreeNode::ParamK);
	dNode->type = Bool;
	dNode->name = "*dummy*";
    dNode->lineNumber = -1;
	dNode->size = 1;
	tPtr->child[0] = (TreeNode *)dNode;

	// Add Declaration for "bool inputb(void)"
	dNode = new DeclarationNode(TreeNode::FuncK);
	dNode->type = Bool;		
	dNode->name = "inputb";
	dNode->lineNumber = -1;
	dNode->offset = 18;
	dNode->sibling = (TreeNode *)tPtr;
	tPtr = dNode;

	// Add Declaration for "void output(int)"
	dNode = new DeclarationNode(TreeNode::FuncK);
	dNode->type = Void;		
	dNode->name = "output";
	dNode->lineNumber = -1;
	dNode->offset = 11;
	dNode->sibling = (TreeNode *)tPtr;
	tPtr = dNode;
	// integer parameter
	dNode = new DeclarationNode(TreeNode::ParamK);
	dNode->type = Int;
	dNode->name = "*dummy*";
    dNode->lineNumber = -1;
	dNode->size = 1;
	tPtr->child[0] = (TreeNode *)dNode;

	// Add Declaration for "int input(void)"
	dNode = new DeclarationNode(TreeNode::FuncK);
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

void DeclarationNode::GenCode_x86(CodeEmitter &e, bool travSib) {
	DeclarationNode *dPtr;
	string tempComment;

	if (subKind == ParamK || subKind == VarK) {
		// Keep track of all of the global variables and deal with them later
		dPtr = (DeclarationNode *)this;
		if (dPtr->theScope == TreeNode::Global)		
			globals_emitvec.push_back(dPtr);		
	} 
	// Don't generate code for IO functions
	else if (subKind == FuncK && name != "input" && name != "output" && name != "inputb" && name != "outputb" && name != "outnl") {
		// Lookup in symbol table - we'll need to set the "offset" variable
		dPtr = (DeclarationNode *)this;
		//dPtr->offset = e.emitSkip(0); // save the current location for calls later
		//e.emitRM("ST", ac, -1, fp, "store return address"); // return address is always -1 away from current frame
			
		tempComment = "Function " + name + " returns " + PrintType(type);
		e.emit_x86Comment(tempComment.c_str());
		e.emit_x86Label(name);
		
		// Standard C Opening
		e.emit_x86Comment("Standard C Opening");
		e.emit_x86R1("push", bp, "");
		e.emit_x86R2("mov", sp, bp, "");
		/* The following registers are unused for now - we will leave space on the stack and save them on demand 
		e.emit_x86R1("pushl", "ebx", "");
		e.emit_x86R1("pushl", "esi", "");
		e.emit_x86R1("pushl", "edi", "");
		*/

		// Local variables are stored on the stack frame just below the saved registers.  We need to make room for them
		// by adjusting the stack pointer accordingly

		// Load up the foff variable with the function size
		foff = size;
		// Reset temporary stack pointer
		toff = foff;

		e.emit_x86CR("add", size*WORDSIZE, sp, "Adjust top of stack for local variables"); 

		// Function Body
		if (child[1] != NULL) {
			child[1]->GenCode_x86(e, true);
		}
		
		e.emit_x86CR("sub", size*WORDSIZE, sp, "Adjust top of stack to destroy local variables");

		// Standard C Closing
		e.emit_x86Comment("Add standard C closing in case there is no return statement");
		/* The following registers are unused for now - we will leave space on the stack and save them on demand 
		e.emit_x86R1("popl", "edi", "");
		e.emit_x86R1("popl", "esi", "");
		e.emit_x86R1("popl", "ebx", "");
		*/
		e.emit_x86R2("mov", bp, sp, "");
		e.emit_x86R1("pop", bp, "");
		e.emit_x86("ret");
		e.emit_x86Comment(("End Function " + name).c_str());		
		
		// Signal the code emitter that we are at the end of the funtion
		e.emitEndFunction();
	}

	if (sibling != NULL)
		sibling->GenCode_x86(e, true);
}

void DeclarationNode::PrintTree(ostream &out, int spaces, int siblingNum) const {
	PrintSpaces(out, spaces);
    PrintNode(out, this);		
	TreeNode::PrintTree(out, spaces, siblingNum);
}

void DeclarationNode::PrintMemory(ostream &out) const {
	switch (subKind) {
		case FuncK:
			out << '\n' << name << " Func returns " << PrintType(type) << "[size: " << size << "]\n";
			break;
		case VarK:
			out << ((theScope == TreeNode::Global)?"\n":"") << name << ' ' << PrintType(type) << " Var ";
			if (isArray)
				out << "is array of size " << size << ' ';
			out << "[offset: " << offset << " type: " << ((theScope == TreeNode::Global)?"global":"local") << "]\n";
			break;
		case ParamK:
			out << name << ' ' << PrintType(type) << " Param ";
			if (isArray)
				out << "is array ";
			out << "[offset: " << offset << " type: parameter]\n";
			
			break;
	}
	TreeNode::PrintMemory(out);
}

void DeclarationNode::PrintNode(ostream &out, const DeclarationNode *dPtr) {
	switch (dPtr->subKind) {
		case FuncK:
			cout << "Function " << dPtr->name << " returns " << dPtr->PrintType(dPtr->type) 
				<< " [line: " << dPtr->lineNumber << "]\n";
			break;
		case VarK:
			cout << "Var " << dPtr->name << " of type " << dPtr->PrintType(dPtr->type);
			if (dPtr->isArray)
				cout << " is array of size " << dPtr->size;
			cout << " [line: " << dPtr->lineNumber << "]\n";
			break;
		case ParamK:
			cout << "Param " << dPtr->name << " of type " << dPtr->PrintType(dPtr->type);
			if (dPtr->isArray)
				cout << " is array";
			cout << " [line: " << dPtr->lineNumber << "]\n";
			break;
	}	
}

void DeclarationNode::ScopeAndType(ostream &out, int &numErrors) {
	DeclarationNode *dPtr;
	
	// for declaration nodes we need to insert them into the symbol table
	// we only care about conflicts of symbols at a local level
	dPtr = (DeclarationNode *)symtab->lookupLocal(name.c_str());
	if (dPtr != NULL) { // this symbol already exists in the symbol table
		++numErrors;
		// symbol already defined error
		PrintError(out, 14, lineNumber, dPtr->name, "", "", dPtr->lineNumber, 0);		
	}
	else if (subKind != FuncK && type == Void) {
		++numErrors;
		// Params and Variables cannot be type void
		PrintError(out, 19, lineNumber, name, "", "", 0, 0);
	}
	else
		symtab->insert(name.c_str(), this);	// insert the declartation if no errors
	
	if (subKind == FuncK) {	// Function Declarations
		funcReturnType = type;	// store the function return type in a global		
		symtab->enter(name.c_str());
		newScope = false;	// don't start a new scope for the function body (Compound stmt)
		foff = IFRAMEOFFSET;	 // reset the frame offset for this new function
		poff = PARAMOFFSET; // reset the param offset for this new function
		if (child[0] != NULL)
			child[0]->ScopeAndType(out, numErrors);
		if (child[1] != NULL)
			child[1]->ScopeAndType(out, numErrors);
		size = foff+1;	// save the size of the frame pointer
		symtab->leave();
	}	
	else { // params and variables
		if (symtab->depth() == 1) { // global scope
			offset = goff;
			goff -= size;
			theScope = TreeNode::Global;
		}
#ifdef X86
		else if (subKind == ParamK) {
			offset = poff;
			poff += size;
			theScope = TreeNode::Parameter;
		}
		else { // variable
			offset = foff;
			foff -= size;
			theScope = TreeNode::Local;
		}
#else
		else {
			offset = foff;
			foff -= size;
			if (subKind == ParamK)
				theScope = TreeNode::Parameter;
			else
				theScope = TreeNode::Local;
		}
#endif
	}

	// now traverse any sibling nodes
	if (sibling != NULL)
		sibling->ScopeAndType(out, numErrors);
	return;
}

