/*	$Author$
	$Date$
	$Rev$
*/

#include "expression.h"

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

void AssignExpNode::GenCode_x86(CodeEmitter &e, bool travSib) {
	DeclarationNode *dPtr;
	ExpressionNode *argPtr;
	int localToff, boolSkipLoc, currentLoc;
	bool isUnary = true;
		
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
		else {
			if (dPtr->theScope == TreeNode::Global)
				e.emit_x86LR("lea", dPtr->name, cx, "load base address of global variable");
			else
				e.emit_x86MR("lea", dPtr->offset, bp, cx, "load base address of array " + dPtr->name);
		}
		// array base will be in ac1
		e.emit_x86RM2("mov", dx, cx, ax, "index off of the base and store the value");
		//toff = localToff;
	}
	else {
		// retrieve variable offset and scope to emit instruction
		if (dPtr->theScope == TreeNode::Global) 
			e.emit_x86RL("mov", ax, dPtr->name, "store global variable " + dPtr->name);
		else				
			e.emit_x86RM("mov", ax, dPtr->offset, bp, "store variable " + dPtr->name); 
	}		
	
	if (sibling != NULL && travSib) {			
		sibling->GenCode_x86(e, true);
	}
}

void AssignExpNode::PrintTree(ostream &out, int spaces, int siblingNum) const {
	PrintSpaces(out, spaces);
	out << "Assign" << " [line: " << lineNumber << "]\n";
	TreeNode::PrintTree(out, spaces, siblingNum);
}

void AssignExpNode::ScopeAndType(ostream &out, int &numErrors) {
	op = "=";	// populate the op for assignments with "=" to make Op logic work properly
		// intentionally drop through to OpK case...
	DeclarationNode *dPtr, *paramPtr, *tempdPtr;
	ExpressionNode *argPtr;
	int argCounter;	
	Types lhs_type, rhs_type, lhs_decl, rhs_decl, returnType;
	bool isUnary, lhs_isArray, rhs_isArray, foundError;
	
	lhs_type = rhs_type = lhs_decl = rhs_decl = returnType = Undefined;	// initialize types to undefined
	lhs_isArray = rhs_isArray = foundError = false;						// initialize booleans to false
	isUnary = true;

	string nameToLookup;
			
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

	// now traverse any sibling nodes
	if (sibling != NULL)
		sibling->ScopeAndType(out, numErrors);
	return;
}

void OpExpNode::ScopeAndType(ostream &out, int &numErrors) {	
	DeclarationNode *dPtr, *paramPtr, *tempdPtr;
	ExpressionNode *argPtr;
	int argCounter;	
	Types lhs_type, rhs_type, lhs_decl, rhs_decl, returnType;
	bool isUnary, lhs_isArray, rhs_isArray, foundError;
	
	lhs_type = rhs_type = lhs_decl = rhs_decl = returnType = Undefined;	// initialize types to undefined
	lhs_isArray = rhs_isArray = foundError = false;						// initialize booleans to false
	isUnary = true;

	string nameToLookup;
			
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

	// now traverse any sibling nodes
	if (sibling != NULL)
		sibling->ScopeAndType(out, numErrors);
	return;
}

void OpExpNode::PrintTree(ostream &out, int spaces, int siblingNum) const {
	PrintSpaces(out, spaces);
	out << "Op: " << op << " [line: " << lineNumber << "]\n";
	TreeNode::PrintTree(out, spaces, siblingNum);
}

void OpExpNode::GenCode_x86(CodeEmitter &e, bool travSib) {
	DeclarationNode *dPtr;
	ExpressionNode *argPtr;
	int localToff, boolSkipLoc, currentLoc;
	bool isUnary = true;
	
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
	} else if (op == "-" && isUnary)
		e.emit_x86R1("neg", ax, "unary - (negation)");				
	else { // comparison operators
		if (op == "!") {
			// clear dx for comparison
			e.emit_x86R2("xor", dx, dx, "clear dx for comparison");
		}
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
		else if (op == "!")
			e.emit_x86J("jz", "CMP_" + oss.str() + "_T", "op !");
			
		
		e.emit_x86R2("xor", ax, ax, "false case for comparison");
		e.emit_x86J("jmp", "CMP_" + oss.str() + "_F", "jump past true case");
		e.emit_x86Label("CMP_" + oss.str() + "_T"); 
		e.emit_x86CR("mov", 1, ax, "load true into ac");
		e.emit_x86Label("CMP_" + oss.str() + "_F");
						
	}
	
	if (sibling != NULL && travSib) {			
		sibling->GenCode_x86(e, true);
	}
}

void IdExpNode::GenCode_x86(CodeEmitter &e, bool travSib) {
	DeclarationNode *dPtr;
	ExpressionNode *argPtr;
	int localToff, boolSkipLoc, currentLoc;
	bool isUnary = true;			

	if (this->dPtr->isArray) {
		// is this array indexed?
		if (child[0] == NULL) {  // must be a parameter
			if (this->dPtr->theScope == TreeNode::Parameter)
				e.emit_x86MR("mov", this->dPtr->offset, (this->dPtr->theScope == TreeNode::Global)?cx:bp, ax, "1: load base address of array " + this->name);
			else
				e.emit_x86MR("lea", this->dPtr->offset, (this->dPtr->theScope == TreeNode::Global)?cx:bp, ax, "2: load base address of array " + this->name);
		}
		else { 
			child[0]->GenCode_x86(e, true);
			// index will be in ac
			if (this->dPtr->theScope == TreeNode::Parameter)
				e.emit_x86MR("mov", this->dPtr->offset, (this->dPtr->theScope == TreeNode::Global)?cx:bp, cx, "3: load base address of array " + this->name);
			else
				if (this->dPtr->theScope == TreeNode::Global) 
					e.emit_x86LR("lea", this->dPtr->name, cx, "load base address of global variable");
				else
					e.emit_x86MR("lea", this->dPtr->offset, bp, cx, "load base address of array " + this->name);
			
			e.emit_x86M2R("mov", cx, ax, ax, "index off of the base and load the value");					
		}
	}
	else {
		if (this->dPtr->theScope == TreeNode::Global)
			e.emit_x86LR("mov", this->dPtr->name, ax, "load global variable " + name);
		else
			e.emit_x86MR("mov", this->dPtr->offset, bp, ax, "load variable " + name);
	}
	
	if (sibling != NULL && travSib) {			
		sibling->GenCode_x86(e, true);
	}
}

void IdExpNode::PrintTree(ostream &out, int spaces, int siblingNum) const {
	PrintSpaces(out, spaces);
	out << "Id: " << name << " [line: " << lineNumber << "]\n";
	TreeNode::PrintTree(out, spaces, siblingNum);
}

void IdExpNode::ScopeAndType(ostream &out, int &numErrors) {
	DeclarationNode *dPtr, *paramPtr, *tempdPtr;
	ExpressionNode *argPtr;
	int argCounter;	
	Types lhs_type, rhs_type, lhs_decl, rhs_decl, returnType;
	bool isUnary, lhs_isArray, rhs_isArray, foundError;
	
	lhs_type = rhs_type = lhs_decl = rhs_decl = returnType = Undefined;	// initialize types to undefined
	lhs_isArray = rhs_isArray = foundError = false;						// initialize booleans to false
	isUnary = true;

	string nameToLookup;
	
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
	
	// now traverse any sibling nodes
	if (sibling != NULL)
		sibling->ScopeAndType(out, numErrors);
	return;
}

void CallExpNode::GenCode_x86(CodeEmitter &e, bool travSib) {
	DeclarationNode *dPtr;
	ExpressionNode *argPtr;
	int localToff, boolSkipLoc, currentLoc;
	bool isUnary = true;
	
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
	if (dPtr->name == "output" || dPtr->name == "outputb") {
		e.emit_x86C("push", "printfInt", "Save integer format string for printf");
		e.emit_x86Call("printf", "execute function");
		paramCount++;
	}
	else if (dPtr->name == "outnl") {
		e.emit_x86C("push", "printfnl", "Save nl format string for printf");
		e.emit_x86Call("printf", "execute function");
		paramCount++;
	}
	else if (dPtr->name == "input" || dPtr->name == "inputb") {		
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

	
	if (sibling != NULL && travSib) {			
		sibling->GenCode_x86(e, true);
	}
}

void CallExpNode::PrintTree(ostream &out, int spaces, int siblingNum) const {
	PrintSpaces(out, spaces);
	out << "Call: " << name << " [line: " << lineNumber << "]\n";
	TreeNode::PrintTree(out, spaces, siblingNum);
}

void CallExpNode::ScopeAndType(ostream &out, int &numErrors) {
	DeclarationNode *dPtr, *paramPtr, *tempdPtr;
	ExpressionNode *argPtr;
	int argCounter;	
	Types lhs_type, rhs_type, lhs_decl, rhs_decl, returnType;
	bool isUnary, lhs_isArray, rhs_isArray, foundError;
	
	lhs_type = rhs_type = lhs_decl = rhs_decl = returnType = Undefined;	// initialize types to undefined
	lhs_isArray = rhs_isArray = foundError = false;						// initialize booleans to false
	isUnary = true;

	string nameToLookup;

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
			PrintError(out, 18, lineNumber, dPtr->name, "", "", 0, dPtr->lineNumber);					
		}
	}
			
	// now traverse any sibling nodes
	if (sibling != NULL)
		sibling->ScopeAndType(out, numErrors);
	return;
}

void ConstExpNode::GenCode_x86(CodeEmitter &e, bool travSib) {

	e.emit_x86CR("mov", val, ax, "load constant");
	
	if (sibling != NULL && travSib) {			
		sibling->GenCode_x86(e, true);
	}	
}

void ConstExpNode::PrintTree(ostream &out, int spaces, int siblingNum) const {
	PrintSpaces(out, spaces);
	if (type == TreeNode::Bool)
		out << "Const: " << boolalpha << (bool)val << noboolalpha << " [line: " << lineNumber << "]\n";
	else
		out << "Const: " << val << " [line: " << lineNumber << "]\n";
	TreeNode::PrintTree(out, spaces, siblingNum);
}

void ConstExpNode::ScopeAndType(ostream &out, int &numErrors) { return; }
