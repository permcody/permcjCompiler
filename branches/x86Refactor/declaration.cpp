/*	$Author$
	$Date$
	$Rev$
*/

#include "globals.h"
#include "declaration.h"

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


void FuncDeclNode::GenCode_x86(CodeEmitter &e, bool travSib) {
	DeclarationNode *dPtr;
	string tempComment;
		
	if (name != "input" && name != "output" && name != "inputb" && name != "outputb" && name != "outnl") {
		// Lookup in symbol table - we'll need to set the "offset" variable
		dPtr = (DeclarationNode *)this;
		//dPtr->offset = e.emitSkip(0); // save the current location for calls later
		//e.emitRM("ST", ac, -1, fp, "store return address"); // return address is always -1 away from current frame
			
		tempComment = "Function " + name + " returns " + PrintType(type);
		e.emit_x86Comment(tempComment.c_str());
		tempComment = ".globl " + name;
		e.emit_x86Directive(tempComment.c_str());
		tempComment = "\t.type	" + name + " @function";
		e.emit_x86Directive(tempComment.c_str());
		e.emit_x86Label(name);
		
		TreeNode::CodeGen_DebugLoc(e);
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
			child[1]->GenCode_x86(e, travSib);
		}
		
		//e.emit_x86CR("sub", size*WORDSIZE, sp, "Adjust top of stack to destroy local variables");

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
		e.emit_x86Directive("\t.size " + name + ", .-" + name);
		e.emit_x86Comment(("End Function " + name).c_str());		
		
		// Signal the code emitter that we are at the end of the funtion
		e.emitEndFunction();
	}

	TreeNode::GenCode_x86(e, true);	
}

void FuncDeclNode::ScopeAndType(ostream &out, int &numErrors) {
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
	
	funcReturnType = type;	// store the function return type in a global		
	symtab->enter(name.c_str());
	newScope = false;	// don't start a new scope for the function body (Compound stmt)
	foff = IFRAMEOFFSET;	 // reset the frame offset for this new function
	poff = PARAMOFFSET; // reset the param offset for this new function
	if (child[0] != NULL)
		child[0]->ScopeAndType(out, numErrors);
	if (child[1] != NULL)
		child[1]->ScopeAndType(out, numErrors);
	size = foff;	// save the size of the frame pointer
	symtab->leave();
	
	TreeNode::ScopeAndType(out, numErrors);	
}


void VarDeclNode::GenCode_x86(CodeEmitter &e, bool travSib) {
	DeclarationNode *dPtr;

	// Keep track of all of the global variables and deal with them later
	dPtr = (DeclarationNode *)this;
	if (dPtr->theScope == TreeNode::Global)		
		globals_emitvec.push_back(dPtr);		
	
	TreeNode::GenCode_x86(e, true);
}

void VarDeclNode::ScopeAndType(ostream &out, int &numErrors){
	DeclarationNode *dPtr;
	
	// for declaration nodes we need to insert them into the symbol table
	// we only care about conflicts of symbols at a local level
	dPtr = (DeclarationNode *)symtab->lookupLocal(name.c_str());
	if (dPtr != NULL) { // this symbol already exists in the symbol table
		++numErrors;
		// symbol already defined error
		PrintError(out, 14, lineNumber, dPtr->name, "", "", dPtr->lineNumber, 0);		
	}
	else
		symtab->insert(name.c_str(), this);	// insert the declartation if no errors
	
	
	if (symtab->depth() == 1) { // global scope
		offset = goff;
		goff -= size;
		theScope = TreeNode::Global;
	}
	else {
		foff -= size;
		offset = foff;
		theScope = TreeNode::Local;
	}

	TreeNode::ScopeAndType(out, numErrors);
}


void ParamDeclNode::GenCode_x86(CodeEmitter &e, bool travSib) {
	DeclarationNode *dPtr;

	// Keep track of all of the global variables and deal with them later
	dPtr = (DeclarationNode *)this;
	if (dPtr->theScope == TreeNode::Global)		
		globals_emitvec.push_back(dPtr);		

	TreeNode::GenCode_x86(e, true);
}

void ParamDeclNode::ScopeAndType(ostream &out, int &numErrors) {
	DeclarationNode *dPtr;
	
	// for declaration nodes we need to insert them into the symbol table
	// we only care about conflicts of symbols at a local level
	dPtr = (DeclarationNode *)symtab->lookupLocal(name.c_str());
	if (dPtr != NULL) { // this symbol already exists in the symbol table
		++numErrors;
		// symbol already defined error
		PrintError(out, 14, lineNumber, dPtr->name, "", "", dPtr->lineNumber, 0);		
	} else {
		symtab->insert(name.c_str(), this);	// insert the declartation if no errors
	}
	
	if (symtab->depth() == 1) { // global scope
		offset = goff;
		goff -= 1; //goff -= size; all parameters are fixed in size (1 unit)
		theScope = TreeNode::Global;
	}
	else {
		offset = poff;
		poff += 1; //poff += size; all parameters are fixed in size (1 unit)
		theScope = TreeNode::Parameter;
	}

	TreeNode::ScopeAndType(out, numErrors);
}
