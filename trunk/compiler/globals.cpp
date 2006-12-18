#include "globals.h"

// static initialization
TreeNode::Types TreeNode::funcReturnType = TreeNode::Undefined; // global for function return type checking
bool TreeNode::newScope = false;
SymTab *TreeNode::symtab = NULL;

TreeNode::TreeNode(NodeKind sKind) : sibling(NULL), lineNumber(0), kind(sKind) {
	for (short i=0; i<MAXCHILDREN; i++)
		child[i] = NULL;
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

void DeclarationNode::PrintTree(ostream &out, int spaces, int siblingNum) const {
	PrintSpaces(out, spaces);
    PrintNode(out, this);		
	TreeNode::PrintTree(out, spaces, siblingNum);
}

void DeclarationNode::PrintNode(ostream &out, const DeclarationNode *dPtr) {
	switch (dPtr->subKind) {
		case FuncK:
			cout << "Function " << dPtr->name << " returns " << dPtr->PrintType(dPtr->type) 
				<< " [line: " << dPtr->lineNumber << "]\n";
			break;
		case VarK:
			cout << "Var " << dPtr->name << " of type " << dPtr->PrintType(dPtr->type);
			if (dPtr->isArray) {
				cout << " is array";
				if (dPtr->size >= 0)
					cout << " of size " << dPtr->size;
				cout << " [line: " << dPtr->lineNumber << "]\n";
			}
			else
				cout << " [line: " << dPtr->lineNumber << "]\n";
			break;
		case ParamK:
			cout << "Param " << dPtr->name << " of type " << dPtr->PrintType(dPtr->type);
			if (dPtr->isArray) {
				cout << " is array";
				if (dPtr->size >= 0)
					cout << " of size " << dPtr->size;
				cout << " [line: " << dPtr->lineNumber << "]\n";
			}
			else
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
		if (child[0] != NULL)
			child[0]->ScopeAndType(out, numErrors);
		if (child[1] != NULL)
			child[1]->ScopeAndType(out, numErrors);
		symtab->leave();
	}	

	// now traverse any sibling nodes
	if (sibling != NULL)
		sibling->ScopeAndType(out, numErrors);
	return;
}

