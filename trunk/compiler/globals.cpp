#include "globals.h"
#include "emitcode.h"

// static initialization
TreeNode::Types TreeNode::funcReturnType = TreeNode::Undefined; // global for function return type checking
bool TreeNode::newScope = false;
SymTab *TreeNode::symtab = NULL;
int TreeNode::goff = 0;
int TreeNode::foff = -2; // 0 and -1 are for the previous frame address and return address respectively
int TreeNode::toff = 0;
int TreeNode::jumpMain = -1;

TreeNode::TreeNode(NodeKind sKind) : sibling(NULL), lineNumber(0), kind(sKind) {
	for (short i=0; i<MAXCHILDREN; i++)
		child[i] = NULL;
}

void TreeNode::GenCode() {
	for (short i=0; i<MAXCHILDREN; i++)
		if (child[i] != NULL)
			child[i]->GenCode();
	if (sibling != NULL)
		sibling->GenCode();
}

void TreeNode::CodeGeneration() {
	
	GenProlog(jumpMain);
	GenIOFunctions();

	// Traverse the tree
	GenCode();
}

void TreeNode::GenProlog(int &jumpMain) const {
	
	emitComment("Begin Prolog code");
	emitRM("LD", 0, 0, 0, "load global poiniter with end of memory");
	emitRM("LDA", 1, 0, 0, "load fp");
	emitRM("ST", 1, 0, 1, "store old fp");
	emitRM("LDA", 3, 1, 7, "return address in ac");
	jumpMain = emitSkip(1);	// save this address into the static variable for later
	emitRO("HALT", 0, 0, 0, "DONE!");
	emitComment("End Prolog code");
}

void TreeNode::GenIOFunctions() const {
	emitComment("Being Generating IO Functions");
	
	emitComment("Begin function input");
	emitRM("ST", 3, -1, 1, "store return address");
	emitRO("IN", 2, 2, 2, "input integer");
	emitRM("LD", 3, -1, 1, "load return address");
	emitRM("LD", 1, 0, 1, "adjust fp");
	emitRM("LDA", 7, 0, 3, "jump to return address");
	emitComment("End function input");

	emitComment("Begin function output");
	emitRM("ST", 3, -1, 1, "store return address");
	emitRM("LD", 3, -2, 1, "load parameter");
	emitRO("OUT", 3, 3, 3, "output integer");
	emitRM("LDC", 2, 0, 2, "set return to 0");
	emitRM("LD", 3, -1, 1, "load return address");
	emitRM("LD", 1, 0, 1, "adjust fp");
	emitRM("LDA", 7, 0, 3, "jump to return address");
	emitComment("End function output");

	emitComment("Begin function inputb");
	emitRM("ST", 3, -1, 1, "store return address");
	emitRO("INB", 2, 2, 2, "input boolean");
	emitRM("LD", 3, -1, 1, "load return address");
	emitRM("LD", 1, 0, 1, "adjust fp");
	emitRM("LDA", 7, 0, 3, "jump to return address");
	emitComment("End function inputb");

	emitComment("Begin function outputb");
	emitRM("ST", 3, -1, 1, "store return address");
	emitRM("LD", 3, -2, 1, "load parameter");
	emitRO("OUTB", 3, 3, 3, "output boolean");
	emitRM("LDC", 2, 0, 2, "set return to 0");
	emitRM("LD", 3, -1, 1, "load return address");
	emitRM("LD", 1, 0, 1, "adjust fp");
	emitRM("LDA", 7, 0, 3, "jump to return address");
	emitComment("End function outputb");

	emitComment("End Generating IO Functions");
}

TreeNode *TreeNode::AddIOFunctions() {
	DeclarationNode *tPtr, *dNode;

	// Add Declaration for "void outputb(bool)"
	dNode = new DeclarationNode(TreeNode::FuncK);
	dNode->type = Void;		
	dNode->name = "outputb";
	dNode->lineNumber = -1;
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
	dNode->sibling = (TreeNode *)tPtr;
	tPtr = dNode;

	// Add Declaration for "void output(int)"
	dNode = new DeclarationNode(TreeNode::FuncK);
	dNode->type = Void;		
	dNode->name = "output";
	dNode->lineNumber = -1;
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
	dNode->sibling = (TreeNode *)tPtr;
	tPtr = dNode;
		
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

void ExpressionNode::GenCode() {
	DeclarationNode *dPtr;
	
	switch (subKind) {
		case OpK:
			// process left child
			if (child[0] != NULL)
				child[0]->GenCode();
			
			// save left side
			emitRM("ST", ac, 666, fp, "save left side");
			
			// process right child
			if (child[1] != NULL)
				child[1]->GenCode();

			// load left back into the accumulator
			emitRM("LD", ac1, 666, fp, "load left into ac1");
			
			// process operator
			if (op == "+")
				emitRO("ADD", ac, ac1, ac, "op +");
			else if (op == "-")
                emitRO("SUB", ac, ac1, ac, "op -");
			else if (op == "*")
				emitRO("MUL", ac, ac1, ac, "op *");
			else if (op == "/")
				emitRO("DIV", ac, ac1, ac, "op /");
			break;
		case AssignK:
			// process RHS of assignment
			if (child[1] != NULL)
				child[1]->GenCode();

			// variable will be in the left child
			dPtr = (DeclarationNode *)this->child[0];

			/* DEBUG
			dPtr->PrintTree(cout, 0, 0);
			cout << "offset: " << dPtr->offset << '\n';
			cout << "isGlobal: " << dPtr->isGlobal << '\n';
			*/

			// retrieve variable offset and scope to emit instruction
			emitRM("ST", ac, dPtr->offset, dPtr->isGlobal?gp:fp, ("store variable " + dPtr->name).c_str()); 
			break;
		case ConstK:
			emitRM("LDC", ac, val, 6, "load constant");
			break;
		case IdK:
			dPtr = (DeclarationNode *)this;
			emitRM("LD", ac, dPtr->offset, dPtr->isGlobal?gp:fp, ("load variable " + name).c_str());
			break;
		case CallK:
			emitComment("Call Here");
			break;
	}

	if (sibling != NULL) {
		emitComment(NO_COMMENT);	
		sibling->GenCode();
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
			/*if (lineNumber == 26) {
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

void StatementNode::GenCode() {
	int currLoc, skipLoc;
	
	switch (subKind) {
		case IfK:
			emitComment("IF");
			
			// Test Condition
			if (child[0] != NULL)
				child[0]->GenCode();
			emitRM("LDC", ac1, 1, 6, "load constant 1");
			emitRO("SUB", ac, ac, ac1, "if condition check");
			skipLoc = emitSkip(1);

			emitComment("THEN");
			// Then part
			if (child[1] != NULL)
				child[1]->GenCode();

			// Else part
			if (child[2] != NULL) {
				currLoc = emitSkip(1);
				emitBackup(skipLoc);
				emitRMAbs("JLT", ac, currLoc+1, "jump to else if false");
				emitRestore();
				skipLoc = currLoc;

				child[2]->GenCode();
				currLoc = emitSkip(0);
				emitBackup(skipLoc);
				emitRMAbs("LDA", pc, currLoc, "jump past else part");
				emitRestore();
			}
			else {
				currLoc = emitSkip(0);
				emitBackup(skipLoc);
				emitRMAbs("JLT", ac, currLoc, "jump past then if false");
				emitRestore();			
			}
			emitComment("END IF");
			break;

		case CompK:
			emitComment("BEGIN");
			if (child[1] != NULL)
				child[1]->GenCode();
			emitComment("END");
			break;
		case WhileK:
			emitComment("WHILE");
			currLoc = emitSkip(0);
			
			// Test Condition
			if (child[0] != NULL)
				child[0]->GenCode();
			emitRM("LDC", ac1, 1, 6, "load constant 1");
			emitRO("SUB", ac, ac, ac1, "while condition check");
			skipLoc = emitSkip(1);

			emitComment("WHILE BODY");
			// While Body
			if (child[1] != NULL)
				child[1]->GenCode();
			emitRMAbs("LDA", pc, currLoc, "go to beginning of loop");
			
			// Save current location to jump when While cond. is false
			currLoc = emitSkip(0);
			emitBackup(skipLoc);
			emitRMAbs("JLT", ac, currLoc, "break out of loop if false");
			emitRestore();
			emitComment("END WHILE");
			break;

		case ReturnK:
			emitComment("RETURN");
			if (child[0] != NULL)
				child[0]->GenCode();

			emitRM("LDA", rt, 0, ac, "copy result to rt register");
			emitRM("LD", ac, 666, fp, "load return address");
			emitRM("LD", fp, 666, fp, "adjust fp");
			emitRM("LDA", pc, 0, ac, "Return");
			break;
	}

	if (sibling != NULL) {
		emitComment(NO_COMMENT);
		sibling->GenCode();
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
					if (dPtr != NULL && dPtr->isArray) {	// can't return an array
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

void DeclarationNode::GenCode() {
	DeclarationNode *dPtr;
	string tempComment;

	// Don't generate code for IO functions
	if (subKind == FuncK && name != "input" && name != "output" && name != "inputb" && name != "outputb") {
		// Lookup in symbol table - we'll need to set the "offset" variable
		dPtr = (DeclarationNode *)this;
		dPtr->offset = emitSkip(0); // save the current location for calls later
		emitRM("ST", ac, -1, fp, "store return address"); // return address is always -1 away from current frame
	
		// If this function is main, we need to backpatch in the jump from the prolog
		if (name == "main") {
			emitBackup(jumpMain);
			emitRMAbs("LDA", pc, dPtr->offset, "jump to main");
			emitRestore();
		}

		tempComment = "Function " + name + " returns " + PrintType(type);
		emitComment(tempComment.c_str());

		// Function Body
		if (child[1] != NULL) {
			child[1]->GenCode();
		}
		
		emitComment(("End Function " + name).c_str());
	}

	if (sibling != NULL)
		sibling->GenCode();
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
			out << (isGlobal?"\n":"") << name << ' ' << PrintType(type) << " Var ";
			if (isArray)
				out << "is array of size " << size << ' ';
			out << "[offset: " << offset << " type: " << (isGlobal?"global":"local") << "]\n";
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
		foff = -2;	// reset the frame offset for this new function
		if (child[0] != NULL)
			child[0]->ScopeAndType(out, numErrors);
		if (child[1] != NULL)
			child[1]->ScopeAndType(out, numErrors);
		size = foff;	// save the size of the frame pointer
		symtab->leave();
	}	
	else { // params and variables
		if (symtab->depth() == 1) { // global scope
			offset = goff;
			goff -= size;
			isGlobal = true;
		}
		else {
			offset = foff;
			foff -= size;
			isGlobal = false;
		}
	}

	// now traverse any sibling nodes
	if (sibling != NULL)
		sibling->ScopeAndType(out, numErrors);
	return;
}

