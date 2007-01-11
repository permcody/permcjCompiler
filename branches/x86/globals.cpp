#include "globals.h"
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
// ********************** static initialization ********************************

TreeNode::TreeNode(NodeKind sKind) : sibling(NULL), lineNumber(0), kind(sKind) {
	for (short i=0; i<MAXCHILDREN; i++)
		child[i] = NULL;
}

void TreeNode::GenCode(CodeEmitter &e, bool travSib) {
	for (short i=0; i<MAXCHILDREN; i++)
		if (child[i] != NULL)
			child[i]->GenCode(e, true);
	if (sibling != NULL)
		sibling->GenCode(e, true);
}

void TreeNode::GenCode_x86(CodeEmitter &e, bool travSib) {
	for (short i=0; i<MAXCHILDREN; i++)
		if (child[i] != NULL)
			child[i]->GenCode_x86(e, true);
	if (sibling != NULL)
		sibling->GenCode_x86(e, true);
}

void TreeNode::CodeGeneration(CodeEmitter &e) {
	
	GenProlog(jumpMain, e);
	GenIOFunctions(e);

	// Traverse the tree
	GenCode(e, true);
}

void TreeNode::CodeGeneration_x86(CodeEmitter &e) {
	// Generate a basic GNU Assembler file

	// Uninitialized data section (setup a buffer area for scanf input)
	e.emit_x86Directive(".bss");
	e.emit_x86Label("bufInt");
	e.emit_x86Directive("\t.long\n");	

	// Setup a format string for the output function (printf) 
	e.emit_x86Directive(".data");
	e.emit_x86Label("printfInt");
	e.emit_x86Directive("\t.string \"\%d\\n\"\n");
	
	// Setup a format string for the input function (scanf)
	e.emit_x86Label("scanfInt");
	e.emit_x86Directive("\t.string \"\%d\"\n");
	
	e.emit_x86Directive(".text");
	e.emit_x86Directive(".globl main");
	
	GenCode_x86(e, true);
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
	// Add Declaration for int print(int c)
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
	dNode->sibling = this;
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

void ExpressionNode::GenCode_x86(CodeEmitter &e, bool travSib) {
	DeclarationNode *dPtr;
	ExpressionNode *argPtr;
	int localToff, boolSkipLoc, currentLoc;
	bool isUnary = true;
	
	switch (subKind) {
		case OpK:
			// process left child
			if (child[0] != NULL)
				child[0]->GenCode_x86(e, true);

			if (child[1] != NULL) {
				isUnary = false;
			
				// save left side
				localToff = toff--;
				e.emit_x86R1("push", ax, "save left side");
								
				// process right child
				child[1]->GenCode_x86(e, true);

				// load left back into the accumulator
				toff = localToff;
				
				e.emit_x86R2("mov", ax, dx, "mov the right side operand into the dx register");
				e.emit_x86R1("pop", ax, "load left side into our main accumulator");				
			}
				
			// process operators
			// arithmetic operators
			if (op == "+") 
				e.emit_x86R2("add", dx, ax, "op +");								
			else if (op == "-" && !isUnary) 
				e.emit_x86R2("sub", dx, ax, "op -");				
			else if (op == "*") 
				e.emit_x86R1("imul", dx, "op *");				
			else if (op == "/") {
				e.emit_x86R2("mov", dx, cx, "setup for op /");
				e.emit_x86R2("xor", dx, dx, "");
				e.emit_x86R1("idiv", cx, "complete op /");				
			} else if (op == "%") {
				e.emit_x86R2("mov", dx, cx, "setup for op %");
				e.emit_x86R2("xor", dx, dx, "");
				e.emit_x86R1("idiv", cx, "");
				e.emit_x86R2("mov", dx, ax, "complete op %");			
			} else if (op == "&&") {
				e.emit_x86R2("and", dx, ax, "logical AND");
				//e.emit_x86R1("JE", "<some label>", "Jump if AND was true"); 
			} else if (op == "||") {
				e.emit_x86R2("or", dx, ax, "logical OR");
				//e.emit_x86R1("JE", "<some label>", "Jump if OR was true");
			} else if (op == "!") 
				e.emit_x86R1("not", ax, "logical NOT");				
			else if (op == "-" and isUnary)
				e.emit_x86R1("neg", ax, "unary - (negation)");				
			else { // comparison operators
				e.emit_x86R2("cmp", dx, ax, "prepare for comparison op");
				
				ostringstream oss;
				oss << labelnum++;
				if (op == "==") 
					e.emit_x86J("je", "CMP_" + oss.str() + "_T", "op ==");
				else if (op == "!=")
					e.emit_x86J("jne", "CMP_" + oss.str() + "_T", "op !=");
				else if (op == "<")
					e.emit_x86J("jl", "CMP_" + oss.str() + "_T", "op <");					
				else if (op == "<=")
					e.emit_x86J("jle", "CMP_" + oss.str() + "_T", "op <=");				
				else if (op == ">")
					e.emit_x86J("jg", "CMP_" + oss.str() + "_T", "op >");
				else if (op == ">=")
					e.emit_x86J("jge", "CMP_" + oss.str() + "_T", "op >=");
				
				e.emit_x86R2("xor", ax, ax, "false case for comparison");
				e.emit_x86J("jmp", "CMP_" + oss.str() + "_F", "jump past true case");
				e.emit_x86Label("CMP_" + oss.str() + "_T"); 
				e.emit_x86CR("mov", 1, ax, "load true into ac");
				e.emit_x86Label("CMP_" + oss.str() + "_F");
								
			}
			break;	
		case AssignK:
			// process RHS of assignment
			if (child[1] != NULL)
				child[1]->GenCode_x86(e, true);

			// variable will be in the left child
			dPtr = ((ExpressionNode *)this->child[0])->dPtr;

			// find out if this is an array or not
			if (dPtr->isArray) {
				// save RHS side
				//localToff = toff;
				e.emit_x86R1("push", ax, "Store RHS of assignment");			

				if (this->child[0]->child[0] != NULL)
					this->child[0]->child[0]->GenCode_x86(e, true); 
					// array index will be in ac
				e.emit_x86R1("pop", dx, "Load RHS value into dx");
				// value will be in ac2 
				if (dPtr->theScope == Parameter)
					e.emit_x86MR("mov", dPtr->offset, (dPtr->theScope == TreeNode::Global)?cx:bp, cx, "load array base address");
				else
					e.emit_x86MR("lea", dPtr->offset, (dPtr->theScope == TreeNode::Global)?cx:bp, cx, "load array base address");
				// array base will be in ac1
				e.emit_x86RM2("mov", dx, cx, ax, "index off of the base and store the value");
				//toff = localToff;
			}
			else {
				// retrieve variable offset and scope to emit instruction
				e.emit_x86RM("mov", ax, dPtr->offset, (dPtr->theScope == TreeNode::Global)?cx:bp, "store variable " + dPtr->name); 
			}	
			break;
		case ConstK:
			e.emit_x86CR("mov", val, ax, "load constant");
			break;
		case IdK:
			if (this->dPtr->isArray) {
				// is this array indexed?
				if (child[0] == NULL) {  // must be a parameter
					if (this->dPtr->theScope == TreeNode::Parameter)
						e.emit_x86MR("mov", this->dPtr->offset, (this->dPtr->theScope == TreeNode::Global)?cx:bp, ax, "load base address of array " + this->name);
					else
						e.emit_x86MR("lea", this->dPtr->offset, (this->dPtr->theScope == TreeNode::Global)?cx:bp, ax, "load base address of array " + this->name);
				}
				else { 
					child[0]->GenCode_x86(e, true);
					// index will be in ac
					if (this->dPtr->theScope == TreeNode::Parameter)
						e.emit_x86MR("mov", this->dPtr->offset, (this->dPtr->theScope == TreeNode::Global)?cx:bp, cx, "load base address of array " + this->name);
					else
						e.emit_x86MR("lea", this->dPtr->offset, (this->dPtr->theScope == TreeNode::Global)?cx:bp, cx, "load base address of array " + this->name);
					
					e.emit_x86M2R("mov", cx, ax, ax, "index off of the base and load the value");					
				}
			}
			else {
				e.emit_x86MR("mov", this->dPtr->offset, (this->dPtr->theScope == TreeNode::Global)?cx:bp, ax, "load variable " + name);
			}
			break;
		case CallK:
			// C calling convetions (slightly simplified)
			// parameters are pushed on the stack in reverse order
			// parameters are removed from the stack after the call is complete
			// return values are returned in (eax)
			
			vector<ExpressionNode *> args;  // used to "reverse" the current sibling pointer scheme
				
			dPtr = (DeclarationNode *)symtab->lookup(name.c_str());
			int paramCount = 0;
						
			// process function parameters
			argPtr = (ExpressionNode *)this->child[0];	// set the parameter pointer to the function declaration parameters
			//localToff = toff;
			while (argPtr != NULL) {
				args.push_back(argPtr);
				argPtr = (ExpressionNode *)argPtr->sibling;
			}
			
			// Now iterate through the vector backwards to get the reverse order
			vector<ExpressionNode *>::reverse_iterator revIter;
			for (revIter = args.rbegin(); revIter != args.rend(); revIter++) {				
				//localToff--;
				//toff--;
				(*revIter)->GenCode_x86(e, false);
				// store expression result
				e.emit_x86R1("push", ax, "Save parameter");				
				paramCount++;
			}

			// restore toff
			toff = localToff;

			// Hack to print integers using the standard C printf function
			if (dPtr->name == "output") {
				e.emit_x86C("push", "printfInt", "Save integer format string for printf");
				e.emit_x86Call("printf", "execute function");
				paramCount++;
			}
			else if (dPtr->name == "input") {		
				e.emit_x86C("push", "bufInt", "Save the buffer address for scanf");		
				e.emit_x86C("push", "scanfInt", "Save integer format string for scanf");
				e.emit_x86Call("scanf", "execute function");
				// move the contents of the buffer back into the accumulator
				e.emit_x86LR("mov", "bufInt", ax, "move the contents of the buffer to the accumulator");
				paramCount+=2;
			}
			else
				e.emit_x86Call(dPtr->name, "execute function");
							
			// clean up the stack
			e.emit_x86CR("add", WORDSIZE*paramCount, sp, "clean up the stack frame");
			break;		
			
	}
	
	if (sibling != NULL && travSib) {			
		sibling->GenCode_x86(e, true);
	}
	
}

void ExpressionNode::GenCode(CodeEmitter &e, bool travSib) {
	DeclarationNode *dPtr;
	ExpressionNode *argPtr;
	int localToff, boolSkipLoc, currentLoc;
	bool isUnary = true;
	
	switch (subKind) {
		case OpK:
			// process left child
			if (child[0] != NULL)
				child[0]->GenCode(e, true);

			/*if (op == "&&" || op == "||")
                boolSkipLoc = e.emitSkip(1);
			*/

			if (child[1] != NULL) {
				isUnary = false;
				
				// save left side
				localToff = toff--;
				e.emitRM("ST", ac, localToff, fp, "save left side");
				
				// process right child
				child[1]->GenCode(e, true);

				// load left back into the accumulator
				toff = localToff;
				e.emitRM("LD", ac1, localToff, fp, "load left into ac1");
			}
			
			// process operators
			// arithmetic operators
			if (op == "+")
				e.emitRO("ADD", ac, ac1, ac, "op +");
			else if (op == "-" && !isUnary) 
                e.emitRO("SUB", ac, ac1, ac, "op -");
			else if (op == "*")
				e.emitRO("MUL", ac, ac1, ac, "op *");
			else if (op == "/")
				e.emitRO("DIV", ac, ac1, ac, "op /");
			else if (op == "%") {
				e.emitRO("DIV", rt, ac1, ac, "begin op %");
				e.emitRO("MUL", ac, rt, ac, "");
				e.emitRO("SUB", ac, ac1, ac, "end op %");
			}
			else if (op == "&&") {
				e.emitRO("ADD", ac, ac1, ac, "prepare for && op");
				e.emitRM("LDC", ac1, 2, ac3, "load constant for &&");
				e.emitRO("SUB", ac, ac1, ac, "compute value in ac");
				e.emitRM("JEQ", ac, 2, pc, "op &&");

				e.emitRM("LDC", ac, 0, ac3, "load false into ac");
				e.emitRM("LDA", pc, 1, pc, "jump past true case");
				e.emitRM("LDC", ac, 1, ac3, "load true into ac");
				
				/*e.emitRM("JGT", ac, 2, pc, "op && (right side)");
                
				// special case: If left side of && is false then whole expression is false
				currentLoc = e.emitSkip(0);
				e.emitBackup(boolSkipLoc);
				e.emitRMAbs("JEQ", ac, currentLoc, "Skip right child of && if left is false");
				e.emitRestore();

				e.emitRM("LDC", ac, 0, ac3, "load false into ac");
				e.emitRM("LDA", pc, 1, pc, "jump past true case");
				e.emitRM("LDC", ac, 1, ac3, "load true into ac");
				*/
			}
			else if (op == "||") {
				e.emitRO("ADD", ac, ac1, ac, "prepare for || op");
				e.emitRM("JGT", ac, 2, pc, "op ||");

				e.emitRM("LDC", ac, 0, ac3, "load false into ac");
				e.emitRM("LDA", pc, 1, pc, "jump past true case");
				e.emitRM("LDC", ac, 1, ac3, "load true into ac");
				
				/*e.emitRM("JGT", ac, 2, pc, "op || (right side)");
				e.emitRM("LDC", ac, 0, ac3, "load false into ac");
				e.emitRM("LDA", pc, 1, pc, "jump past true case");

				// special case: If left side of || is true then whole expression is true
				currentLoc = e.emitSkip(0);
				e.emitBackup(boolSkipLoc);
				e.emitRMAbs("JGT", ac, boolSkipLoc, "Skip right child of || if left is true");
				e.emitRestore();

				e.emitRM("LDC", ac, 1, ac3, "load true into ac");
				*/
			}
			else if (op == "!") {
				e.emitRM("JEQ", ac, 2, pc, "op !");
				e.emitRM("LDC", ac, 0, ac3, "load false into ac");
				e.emitRM("LDA", pc, 1, pc, "jump past true case");
				e.emitRM("LDC", ac, 1, ac3, "load true into ac");
			}
			else if (op == "-" and isUnary) {
				e.emitRM("LDC", ac1, 0, ac3, "Load zero in ac1 for unary -");
				e.emitRO("SUB", ac, ac1, ac, "op unary -");
			}
			else { // comparison operators
				e.emitRO("SUB", ac, ac1, ac, "prepare for comparison op");
				
				if (op == "==") 
					e.emitRM("JEQ", ac, 2, pc, "op ==");
				else if (op == "!=")
					e.emitRM("JNE", ac, 2, pc, "op !=");
				else if (op == "<")
					e.emitRM("JLT", ac, 2, pc, "op <");					
				else if (op == "<=")
					e.emitRM("JLE", ac, 2, pc, "op <=");				
				else if (op == ">")
					e.emitRM("JGT", ac, 2, pc, "op >");
				else if (op == ">=")
					e.emitRM("JGE", ac, 2, pc, "op >=");

				e.emitRM("LDC", ac, 0, ac3, "load false into ac");
				e.emitRM("LDA", pc, 1, pc, "jump past true case");
				e.emitRM("LDC", ac, 1, ac3, "load true into ac");
			}
			break;
		case AssignK:
			// process RHS of assignment
			if (child[1] != NULL)
				child[1]->GenCode(e, true);

			// variable will be in the left child
			dPtr = ((ExpressionNode *)this->child[0])->dPtr;

			// find out if this is an array or not
			if (dPtr->isArray) {
				// save RHS side
				localToff = toff;
				e.emitRM("ST", ac, toff--, fp, "Store RHS of assignment");

				if (this->child[0]->child[0] != NULL)
					this->child[0]->child[0]->GenCode(e, true); 
					// array index will be in ac
				e.emitRM("LD", ac2, localToff, fp, "Load RHS value");
				// value will be in ac2 
				if (dPtr->theScope == Parameter)
					e.emitRM("LD", ac1, dPtr->offset, (dPtr->theScope == TreeNode::Global)?gp:fp, "array base");
				else
					e.emitRM("LDA", ac1, dPtr->offset, (dPtr->theScope == TreeNode::Global)?gp:fp, "array base");
				// array base will be in ac1
				e.emitRO("SUB", ac, ac1, ac, "index off of the base");
				e.emitRM("ST", ac2, 0, ac, "store indexed variable " + dPtr->name);
				e.emitRM("LDA", ac, 0, ac2, "adjust ac");
				toff = localToff;
			}
			else {
				// retrieve variable offset and scope to emit instruction
				e.emitRM("ST", ac, dPtr->offset, (dPtr->theScope == TreeNode::Global)?gp:fp, "store variable " + dPtr->name); 
			}	
			break;
		case ConstK:
			e.emitRM("LDC", ac, val, 6, "load constant");
			break;
		case IdK:
			if (this->dPtr->isArray) {
				// is this array indexed?
				if (child[0] == NULL) {  // must be a parameter
					if (this->dPtr->theScope == TreeNode::Parameter)
						e.emitRM("LD", ac, this->dPtr->offset, (this->dPtr->theScope == TreeNode::Global)?gp:fp, "Load address of base of array " + this->name);
					else
						e.emitRM("LDA", ac, this->dPtr->offset, (this->dPtr->theScope == TreeNode::Global)?gp:fp, "Load address of base of array " + this->name);
				}
				else { 
					child[0]->GenCode_x86(e, true);
					// index will be in ac
					if (this->dPtr->theScope == TreeNode::Parameter)
						e.emitRM("LD", ac1, this->dPtr->offset, (this->dPtr->theScope == TreeNode::Global)?gp:fp, "Load address of base of array " + this->name);
					else
						e.emitRM("LDA", ac1, this->dPtr->offset, (this->dPtr->theScope == TreeNode::Global)?gp:fp, "Load address of base of array " + this->name);

					e.emitRO("SUB", ac, ac1, ac, "index off of the base");
					e.emitRM("LD", ac, 0, ac, "load the value");
				}
			}
			else {
				e.emitRM("LD", ac, this->dPtr->offset, (this->dPtr->theScope == TreeNode::Global)?gp:fp, "load variable " + name);
			}
			break;
		case CallK:
			dPtr = (DeclarationNode *)symtab->lookup(name.c_str());
			localToff = toff;
			e.emitRM("ST", fp, toff--, fp, "Store old fp in ghost frame");

			// leave room for return param
			--toff;

			// process function parameters
			argPtr = (ExpressionNode *)this->child[0];	// set the parameter pointer to the function declaration parameters
			//localToff = toff;
			while (argPtr != NULL) {
				//localToff--;
				//toff--;
				argPtr->GenCode(e, false);
				// store expression result
				e.emitRM("ST", ac, toff-- /*localToff*/, fp, "Save parameter");
				argPtr = (ExpressionNode *)argPtr->sibling;
			}

			// restore toff
			toff = localToff;

			// prepare for jump
			e.emitRM("LDA", fp, localToff--, fp, "Load address of new frame");
			e.emitRM("LDA", ac, 1, pc, "Put return address in ac");
			e.emitRMAbs("LDA", pc, dPtr->offset, "Call " + dPtr->name);
			
			// save return value
			e.emitRM("LDA", ac, 0, rt, "Save the result in ac");
			break;
	}

	if (sibling != NULL && travSib) {
		e.emitComment(NO_COMMENT);	
		sibling->GenCode(e, true);
	}
}

void ExpressionNode::PrintTree(ostream &out, int spaces, int siblingNum) const {
	PrintSpaces(out, spaces);

	switch (subKind) {
		case OpK:
			out << "Op: " << op << " [line: " << lineNumber << "]\n";
			break;
		case AssignK:
			out << "Assign" << " [line: " << lineNumber << "]\n";
			break;
		case ConstK:
			if (type == TreeNode::Bool)
				out << "Const: " << boolalpha << (bool)val << noboolalpha << " [line: " << lineNumber << "]\n";
			else
				out << "Const: " << val << " [line: " << lineNumber << "]\n";
			break;
		case IdK:
			out << "Id: " << name << " [line: " << lineNumber << "]\n";
			break;
		case CallK:
			out << "Call: " << name << " [line: " << lineNumber << "]\n";
			break;
	}    
	TreeNode::PrintTree(out, spaces, siblingNum);
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

void ExpressionNode::ScopeAndType(ostream &out, int &numErrors) {
	DeclarationNode *dPtr, *paramPtr, *tempdPtr;
	ExpressionNode *argPtr;
	int argCounter;	
	Types lhs_type, rhs_type, lhs_decl, rhs_decl, returnType;
	bool isUnary, lhs_isArray, rhs_isArray, foundError;
	
	lhs_type = rhs_type = lhs_decl = rhs_decl = returnType = Undefined;	// initialize types to undefined
	lhs_isArray = rhs_isArray = foundError = false;						// initialize booleans to false
	isUnary = true;

	string nameToLookup;

	switch (subKind) {
		case AssignK:
			op = "=";	// populate the op for assignments with "=" to make Op logic work properly
			// intentionally drop through to OpK case...
		case OpK:			
			if (child[0] != NULL) {				
				child[0]->ScopeAndType(out, numErrors);
				lhs_type = ((ExpressionNode *)child[0])->type;			// grab lhs type
				lhs_isArray = child[0]->getIsArray();					
			}
			if (child[1] != NULL) {
				isUnary = false;
				child[1]->ScopeAndType(out, numErrors);
				rhs_type = ((ExpressionNode *)child[1])->type;			// grab lhs type
				rhs_isArray = child[1]->getIsArray();								
			}
		
			lookupTypes(op, lhs_decl, rhs_decl, returnType);	// populate the last three variable from the function

			//DEBUG 
			/*if (lineNumber == 25) {
				cerr << "op: " << op << "\nlhs_decl: " << PrintType(lhs_decl) << " lhs_type: " 
					<< PrintType(lhs_type) << "\nrhs_decl: " << PrintType(rhs_decl)
					<< " rhs_type: " << PrintType(rhs_type) << "\nlhs_isArray: " 
					<< boolalpha << lhs_isArray << "\nrhs_isArray: " << rhs_isArray 
					<< noboolalpha <<  endl;					
			}*/
			//DEBUG 

			// unary ops
			if (isUnary && lhs_type != Error) {
				//check for arrays
				if (lhs_isArray) {
					++numErrors;
					foundError = true;
					// Unary operator array check error
					PrintError(out, 16, lineNumber, op, "", "", 0, 0);
				}
				else if (lhs_type != lhs_decl) {	// do type check on unary op
					++numErrors;
					foundError = true;
					// Unary operator type check error
					PrintError(out, 17, lineNumber, op, PrintType(lhs_decl), PrintType(lhs_type), 0, 0);					
				}
			}
			// binary ops
			else if (!isUnary) {
				// check for arrays
				if (lhs_type != Error && rhs_type != Error && (lhs_isArray || rhs_isArray)) {					
					++numErrors;
					foundError = true;
					// binary operator array check error
					PrintError(out, 16, lineNumber, op, "", "", 0, 0);					
				}
				// check for binary ops that can process different types as long as they are the same
				else if (lhs_type != Error && rhs_type != Error && lhs_decl == Undefined && rhs_decl == Undefined && lhs_type != rhs_type) {
					++numErrors;
					foundError = true;
					// same type required check error
					PrintError(out, 1, lineNumber, op, PrintType(lhs_type), PrintType(rhs_type), 0, 0);										
				}					
				// do type check for strict binary operators
				/*else {
					if (lhs_type != Error && lhs_decl != Undefined && lhs_decl != lhs_type) {
						++numErrors;
						foundError = true;
						// binary lhs type check error
						PrintError(out, 2, lineNumber, op, PrintType(lhs_decl), PrintType(lhs_type), 0, 0);
					}
					if (rhs_type != Error && rhs_decl != Undefined && rhs_decl != rhs_type) {
						++numErrors;
						foundError = true;
						// binary rhs type check error
						PrintError(out, 3, lineNumber, op, PrintType(rhs_decl), PrintType(rhs_type), 0, 0);						
					}
				}*/
				else if (lhs_type != Error && rhs_type != Error) {
					if (lhs_decl != Undefined && lhs_decl != lhs_type) {
						++numErrors;
						foundError = true;
						// binary lhs type check error
						PrintError(out, 2, lineNumber, op, PrintType(lhs_decl), PrintType(lhs_type), 0, 0);
					}
					if (rhs_decl != Undefined && rhs_decl != rhs_type) {
						++numErrors;
						foundError = true;
						// binary rhs type check error
						PrintError(out, 3, lineNumber, op, PrintType(rhs_decl), PrintType(rhs_type), 0, 0);						
					}
				}
			}
			// set the type for this node
			if (foundError || lhs_type == Error || rhs_type == Error)  // propagate the error type to avoid cascading errors
				this->type = Error;
			else {
				if (returnType == Undefined)
					this->type = lhs_type;	
					// if returnType is undefined return the lhs (used for ops that can process multiple types)
				else	
					this->type = returnType;
			}
			break;				
		case IdK:				
			// make sure symbol exists
			dPtr = (DeclarationNode *)symtab->lookup(name.c_str());
			if (dPtr != NULL) {
				// populate this ID node with the type from the symbol table				
				if (dPtr->subKind == FuncK) {
					++numErrors;
					// Cannot use functions like simple variables
					PrintError(out, 21, lineNumber, name, "", "", 0, 0);
					this->type = Error; // don't bother trying to check type if expression
				}
				else
					this->type = dPtr->type;

				this->dPtr = dPtr; // save this link for later in Code Generation
			} 
			else if (dPtr == NULL) {
				++numErrors;
				// this symbol has not been declared error
				PrintError(out, 15, lineNumber, name, "", "", 0, 0);				
				this->type = Error;	// set the type to error to avoid cascading errors
			}
			if (child[0] != NULL) {	// this ID has an indexer
				child[0]->ScopeAndType(out, numErrors);
				if (!(dPtr->isArray)) {	// if the symbol table record does show this ID as an array ...
					++numErrors;
					// can't index nonarray error
					PrintError(out, 4, lineNumber, name, "", "", 0, 0);					
				}
				else if (((ExpressionNode *)child[0])->type != Error &&
						((ExpressionNode *)child[0])->type != Int) {	// index need to be type int
					++numErrors;
					// array index type check error
					PrintError(out, 10, lineNumber, PrintType(((ExpressionNode *)child[0])->type), "", "", 0, 0);					
				}
				
			}
			break;		
		case CallK:
			// make sure symbol exists			
			dPtr = (DeclarationNode *)symtab->lookup(name.c_str());
			this->dPtr = dPtr; // save this link for later in Code Generation
			if (dPtr == NULL) {
				++numErrors;
				// this symbol has not been declared
				PrintError(out, 15, lineNumber, name, "", "", 0, 0);				
				this->type = Error;	// set the type to error to avoid cascading errors
			}
			else if (dPtr->subKind != FuncK) {
				++numErrors;
				// variables cannot be called like functions
				PrintError(out, 20, lineNumber, name, "", "", 0, 0);
			}
			else {	// Process the properly declared functions
				this->type = dPtr->type; // the type of this node is the return type of the function
				paramPtr = (DeclarationNode *)dPtr->child[0];	// set the parameter pointer to the function declaration parameters
				argPtr = (ExpressionNode *)this->child[0];	// set the argument pointer to the call arguments
				argCounter = 1;
				// step through the param and argument lists together
				while (paramPtr != NULL && argPtr != NULL) {
					argPtr->ScopeAndType(out, numErrors);	// process expression in call					
					// do type checks first
					if (paramPtr->type != Error && argPtr->type != Error && paramPtr->type != argPtr->type) {
						++numErrors;
						// type in param list differs from type in argument list error
						PrintError(out, 7, lineNumber, PrintType(paramPtr->type), dPtr->name, "", argCounter, dPtr->lineNumber);						
					}	
					// now check to see if array params are handled correctly
					if (paramPtr->isArray && !(argPtr->getIsArray())) {	// expecting an array type in call						
						++numErrors;
						// Expecting array in current parameter error
						PrintError(out, 9, lineNumber, dPtr->name, "", "", argCounter, dPtr->lineNumber);														
					}
					else if (!paramPtr->isArray && argPtr->getIsArray()) { // not expecting an array type						
						++numErrors;
						// Not Expecting array in current parameter error
						PrintError(out, 13, lineNumber, dPtr->name, "", "", argCounter, dPtr->lineNumber);								
					}
							
					// advanced both pointers to next item in list
					paramPtr = (DeclarationNode *)paramPtr->sibling;
					argPtr = (ExpressionNode *)argPtr->sibling;
					++argCounter;	// increment argument counter
				}
				// check to make sure that both lists are finished - no more params to process
				if (paramPtr != NULL || argPtr != NULL) {
					++numErrors; // one list was shorter then the other
					// Wrong number of params error
					PrintError(out, 18, lineNumber, dPtr->name, "", "", dPtr->lineNumber);					
				}
			}
			break;
		// we already know the type of a constant - handled in Bison code - no need to process here	
	}
	
	// now traverse any sibling nodes
	if (sibling != NULL)
		sibling->ScopeAndType(out, numErrors);
	return;
}

void ExpressionNode::lookupTypes(const string &op, Types &lhs, Types &rhs, Types &returnType) {
	// This function is essentially the lookup table for types for the various operators
	if (op == "+" || op == "-" || op == "*" || op == "/" || op == "%") {	// ignore rhs for Unary op "-"
		lhs = Int;	
		rhs = Int; 
		returnType = Int; 	
	}
	else if (op == "<" || op == ">" || op == "<=" || op == ">=") {
		lhs = Int;
		rhs = Int;
		returnType = Bool;
	}
	else if (op == "!=" || op == "==") {
		lhs = Undefined;
		rhs = Undefined; // lhs and rhs can be anything as long as they match
		returnType = Bool;
	}
	else if (op == "||" || op == "&&" || op == "!=" || op == "!") {	// ignore rhs for Unary op "!"
		lhs = Bool;
		rhs = Bool;
		returnType = Bool;
	}
	else if (op == "=") { // Assignments
		lhs = Undefined;
		rhs = Undefined;
		returnType = Undefined;
	}
	else {
		lhs = Error;
		rhs = Error;
		returnType = Error;	
	}	
}

void StatementNode::GenCode_x86(CodeEmitter &e, bool travSib) {
	ostringstream oss;
	int currLabel = labelnum;
	int skipLoc, currLoc;
	
	switch (subKind) {
		case IfK:
			e.emit_x86Comment("IF");
			
			oss << labelnum++;
			// Test Condition
			if (child[0] != NULL)
				child[0]->GenCode_x86(e, true);
						
			e.emit_x86CR("cmp", 0, ax, "if condition check");
			e.emit_x86J("je", "IF_" + oss.str() + "_E", "jump past the then part");
			//skipLoc = e.emitSkip(1);

			//e.emitComment("THEN");
			// Then part
			if (child[1] != NULL) {
				child[1]->GenCode_x86(e, true);
				e.emit_x86J("jmp", "IF_" + oss.str() + "_D", "jump to the end of the if statement (done)");
			}			
			// Else part
			e.emit_x86Label("IF_" + oss.str() + "_E");
			if (child[2] != NULL) {
				
				//currLoc = e.emitSkip(1);
				//e.emitBackup(skipLoc);
				//e.emitRMAbs("JLT", ac, currLoc+1, "jump to else if false");
				//e.emitRestore();
				//skipLoc = currLoc;

				child[2]->GenCode_x86(e, true);
				//currLoc = e.emitSkip(0);
				//e.emitBackup(skipLoc);
				//e.emitRMAbs("LDA", pc, currLoc, "jump past else part");
				//e.emitRestore();				
			}
			//else {
			//	currLoc = e.emitSkip(0);
			//	e.emitBackup(skipLoc);
			//	e.emitRMAbs("JLT", ac, currLoc, "jump past then if false");
			//	e.emitRestore();			
			//}
			e.emit_x86Label("IF_" + oss.str() + "_D");
			break;

		case CompK:
			e.emit_x86Comment("BEGIN SCOPE");
			if (child[1] != NULL)
				child[1]->GenCode_x86(e, true);
			e.emit_x86Comment("END SCOPE");
			break;
		case WhileK:
			oss << labelnum++;
			e.emit_x86Label("WHILE_" + oss.str() + "_B");
			//currLoc = e.emitSkip(0);
			
			// Test Condition
			if (child[0] != NULL)
				child[0]->GenCode_x86(e, true);
			e.emit_x86CR("cmp", 0, ax, "while condition check");
			e.emit_x86J("je", "WHILE_" + oss.str() + "_E", "break out of loop if false");
			
			//skipLoc = e.emitSkip(1);

			e.emit_x86Comment("WHILE BODY");
			// While Body
			if (child[1] != NULL)
				child[1]->GenCode_x86(e, true);
			e.emit_x86J("jmp", "WHILE_" + oss.str() + "_B", "return to the top of the while loop");
						
			// Save current location to jump when While cond. is false
			//currLoc = e.emitSkip(0);
			//e.emitBackup(skipLoc);
			//e.emitRMAbs("JLT", ac, currLoc, "break out of loop if false");
			//e.emitRestore();
			e.emit_x86Label("WHILE_" + oss.str() + "_E");
			break;

		case ReturnK:
			e.emit_x86Comment("RETURN");
			if (child[0] != NULL)
				child[0]->GenCode_x86(e, true);

			//e.emitRM("LDA", rt, 0, ac, "copy result to rt register");
			//e.emitRM("LD", ac, -1, fp, "load return address"); // Return address is one off from frame pointer
			//e.emitRM("LD", fp, 0, fp, "adjust fp");
			//e.emitRM("LDA", pc, 0, ac, "Return");
			break;
	}

	if (sibling != NULL) {
		e.emit_x86Comment(NO_COMMENT);
		sibling->GenCode_x86(e, true);
	}
}

void StatementNode::GenCode(CodeEmitter &e, bool travSib) {
	int currLoc, skipLoc;
	
	switch (subKind) {
		case IfK:
			e.emitComment("IF");
			
			// Test Condition
			if (child[0] != NULL)
				child[0]->GenCode(e, true);
			e.emitRM("LDC", ac1, 1, 6, "load constant 1");
			e.emitRO("SUB", ac, ac, ac1, "if condition check");
			skipLoc = e.emitSkip(1);

			e.emitComment("THEN");
			// Then part
			if (child[1] != NULL)
				child[1]->GenCode(e, true);

			// Else part
			if (child[2] != NULL) {
				currLoc = e.emitSkip(1);
				e.emitBackup(skipLoc);
				e.emitRMAbs("JLT", ac, currLoc+1, "jump to else if false");
				e.emitRestore();
				skipLoc = currLoc;

				child[2]->GenCode(e, true);
				currLoc = e.emitSkip(0);
				e.emitBackup(skipLoc);
				e.emitRMAbs("LDA", pc, currLoc, "jump past else part");
				e.emitRestore();
			}
			else {
				currLoc = e.emitSkip(0);
				e.emitBackup(skipLoc);
				e.emitRMAbs("JLT", ac, currLoc, "jump past then if false");
				e.emitRestore();			
			}
			e.emitComment("END IF");
			break;

		case CompK:
			e.emitComment("BEGIN");
			if (child[1] != NULL)
				child[1]->GenCode(e, true);
			e.emitComment("END");
			break;
		case WhileK:
			e.emitComment("WHILE");
			currLoc = e.emitSkip(0);
			
			// Test Condition
			if (child[0] != NULL)
				child[0]->GenCode(e, true);
			e.emitRM("LDC", ac1, 1, 6, "load constant 1");
			e.emitRO("SUB", ac, ac, ac1, "while condition check");
			skipLoc = e.emitSkip(1);

			e.emitComment("WHILE BODY");
			// While Body
			if (child[1] != NULL)
				child[1]->GenCode(e, true);
			e.emitRMAbs("LDA", pc, currLoc, "go to beginning of loop");
			
			// Save current location to jump when While cond. is false
			currLoc = e.emitSkip(0);
			e.emitBackup(skipLoc);
			e.emitRMAbs("JLT", ac, currLoc, "break out of loop if false");
			e.emitRestore();
			e.emitComment("END WHILE");
			break;

		case ReturnK:
			e.emitComment("RETURN");
			if (child[0] != NULL)
				child[0]->GenCode(e, true);

			e.emitRM("LDA", rt, 0, ac, "copy result to rt register");
			e.emitRM("LD", ac, -1, fp, "load return address"); // Return address is one off from frame pointer
			e.emitRM("LD", fp, 0, fp, "adjust fp");
			e.emitRM("LDA", pc, 0, ac, "Return");
			break;
	}

	if (sibling != NULL) {
		e.emitComment(NO_COMMENT);
		sibling->GenCode(e, true);
	}
}

void StatementNode::PrintTree(ostream &out, int spaces, int siblingNum) const {
	PrintSpaces(out, spaces);
    
	switch (subKind) {
		case IfK:
			out << "If" << " [line: " << lineNumber << "]\n";
			break;
		case CompK:
			out << "Compound" << " [line: " << lineNumber << "]\n";
			break;
		case WhileK:
			out << "While" << " [line: " << lineNumber << "]\n";
			break;
		case ReturnK:
			out << "Return" << " [line: " << lineNumber << "]\n";
			break;
	}
	TreeNode::PrintTree(out, spaces, siblingNum);
}

void StatementNode::ScopeAndType(ostream &out, int &numErrors) {
	Types tempType;
	string tempName;
	DeclarationNode *dPtr;
	bool tempNewScope;

	switch (subKind) {
		case IfK:
		case WhileK:
			// check Expression Type
			if (child[0] != NULL) {
				child[0]->ScopeAndType(out, numErrors);
				if (((ExpressionNode *)child[0])->type != Error) {
					if (((ExpressionNode *)child[0])->type != Bool) {	// statements need boolean test
						++numErrors;
						// Boolean test error
						PrintError(out, 11, lineNumber, "", "", "", 0, 0);						
					}
					if (((ExpressionNode *)child[0])->subKind == IdK) {		// only ID kinds can be arrays
						dPtr = (DeclarationNode *)symtab->lookup(((ExpressionNode *)child[0])->name.c_str());
						if (dPtr != NULL && dPtr->isArray && ((ExpressionNode *)child[0])->child[0] == NULL) { 
							// if the array is indexed then it is really not a type array 
							// test expressions cannot be an array
							++numErrors;
							// Test expression array error
							PrintError(out, 6, lineNumber, "", "", "", 0, 0);							
						}
					}					
				}			
			}
			// Do Scope and Type Checking on the remainder
			if (child[1] != NULL)
				child[1]->ScopeAndType(out, numErrors);
			if (child[2] != NULL)
				child[2]->ScopeAndType(out, numErrors);
			break;		
		case ReturnK:
			if (child[0] != NULL) {
				child[0]->ScopeAndType(out, numErrors);	
				if (((ExpressionNode *)child[0])->type != Error && 
						((ExpressionNode *)child[0])->type != funcReturnType) {
					++numErrors;
					// Return type mismatch error
					PrintError(out, 12, lineNumber, PrintType(funcReturnType), PrintType(((ExpressionNode *)child[0])->type), "", 0, 0);					
				}
				if (((ExpressionNode *)child[0])->subKind == IdK) { 
					// cast this node to DeclarationNode and lookup
					tempName = ((ExpressionNode *)child[0])->name;
					dPtr = (DeclarationNode *)symtab->lookup(tempName.c_str());
					if (dPtr != NULL && dPtr->isArray && ((ExpressionNode *)child[0])->child[0] == NULL) {	// can't return an array
						++numErrors;
						// Illegal return type of array error
						PrintError(out, 5, lineNumber, "", "", "", 0, 0);						
					}
				}
			}
			else if (funcReturnType != Void) {	// no return value when there should have been
				++numErrors;
				// Missing return expression error
				PrintError(out, 8, lineNumber, PrintType(funcReturnType), "", "", 0, 0);				
			}
			break;
		case CompK:
			tempNewScope = newScope;
			if (tempNewScope)
				symtab->enter("CompK");
			else
				newScope = true;	// reset the new scope for the next nesting
			if (child[0] != NULL)
				child[0]->ScopeAndType(out, numErrors);
			if (child[1] != NULL)
				child[1]->ScopeAndType(out, numErrors);
			if (tempNewScope)		// don't test the global variable here...
				symtab->leave();
			break;			
	}

	// now traverse any sibling nodes
	if (sibling != NULL)
		sibling->ScopeAndType(out, numErrors);
	return;
}

void DeclarationNode::GenCode_x86(CodeEmitter &e, bool travSib) {
	DeclarationNode *dPtr;
	string tempComment;

	// Don't generate code for IO functions
	if (subKind == FuncK && name != "input" && name != "output") {
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

void DeclarationNode::GenCode(CodeEmitter &e, bool travSib) {
	DeclarationNode *dPtr;
	string tempComment;

	// Don't generate code for IO functions
	if (subKind == FuncK && name != "input" && name != "output" && name != "inputb" && name != "outputb") {
		// Lookup in symbol table - we'll need to set the "offset" variable
		dPtr = (DeclarationNode *)this;
		dPtr->offset = e.emitSkip(0); // save the current location for calls later
		e.emitRM("ST", ac, -1, fp, "store return address"); // return address is always -1 away from current frame
	
		// If this function is main, we need to backpatch in the jump from the prolog
		if (name == "main") {
			e.emitBackup(jumpMain);
			e.emitRMAbs("LDA", pc, dPtr->offset, "jump to main");
			e.emitRestore();
		}

		tempComment = "Function " + name + " returns " + PrintType(type);
		e.emitComment(tempComment.c_str());

		// Load up the foff variable with the function size
		foff = size;
		// Reset temporary stack pointer
		toff = foff;

		// Function Body
		if (child[1] != NULL) {
			child[1]->GenCode(e, true);
		}

		// Standard Closing
		e.emitComment("Add standard closing in case there is no return statement");
		e.emitRM("LDC", rt, 0, ac3, "Set return value to 0");
		e.emitRM("LD", ac, -1, fp, "Load return address");
		e.emitRM("LD", fp, 0, fp, "Adjust fp");
		e.emitRM("LDA", pc, 0, ac, "Return");		
		e.emitComment(("End Function " + name).c_str());
	}

	if (sibling != NULL)
		sibling->GenCode(e, true);
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

