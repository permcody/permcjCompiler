/*	$Author$
	$Date$
	$Rev$
*/

#include "globals.h"
#include "statement.h"
#include "expression.h"
#include "declaration.h"

void IfStateNode::GenCode_x86(CodeEmitter &e, bool travSib) {
	ostringstream oss;
	
	TreeNode::CodeGen_DebugLoc(e);
		
	e.emit_x86Comment("IF");
	
	oss << labelnum++;
	// Test Condition
	if (child[0] != NULL)
		child[0]->GenCode_x86(e, true);
				
	e.emit_x86CR("cmp", 0, ax, "if condition check");
	e.emit_x86J("je", ".IF_" + oss.str() + "_E", "jump past the then part");
	//skipLoc = e.emitSkip(1);

	//e.emitComment("THEN");
	// Then part
	if (child[1] != NULL) {
		child[1]->GenCode_x86(e, true);
		e.emit_x86J("jmp", ".IF_" + oss.str() + "_D", "jump to the end of the if statement (done)");
	}			
	// Else part
	e.emit_x86Label(".IF_" + oss.str() + "_E");
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
	e.emit_x86Label(".IF_" + oss.str() + "_D");
	
	TreeNode::GenCode_x86(e, travSib);
}

void IfStateNode::PrintTree(ostream &out, int spaces, int siblingNum) const {
	PrintSpaces(out, spaces);
    out << "If" << " [line: " << lineNumber << "]\n";		
	TreeNode::PrintTree(out, spaces, siblingNum);
}

void IfStateNode::ScopeAndType(ostream &out, int &numErrors) {
	//Types tempType;
	string tempName;
	DeclarationNode *dPtr;
	//bool tempNewScope;

	//IfK and while kind use the same code
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
			
	TreeNode::ScopeAndType(out, numErrors);	
}


void CompStateNode::GenCode_x86(CodeEmitter &e, bool travSib) {
	
	e.emit_x86Comment("BEGIN SCOPE");
	if (child[1] != NULL)
		child[1]->GenCode_x86(e, travSib);
	e.emit_x86Comment("END SCOPE");
	
	TreeNode::GenCode_x86(e, true);
}

void CompStateNode::PrintTree(ostream &out, int spaces, int siblingNum) const {
	PrintSpaces(out, spaces);
	out << "Compound" << " [line: " << lineNumber << "]\n";
	TreeNode::PrintTree(out, spaces, siblingNum);
}

void CompStateNode::ScopeAndType(ostream &out, int &numErrors) {
	//Types tempType;
	string tempName;
	//DeclarationNode *dPtr;
	bool tempNewScope;

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
	
	TreeNode::ScopeAndType(out, numErrors);	
}


void WhileStateNode::GenCode_x86(CodeEmitter &e, bool travSib) {
	ostringstream oss;
	int savedWhileNum;
	
	TreeNode::CodeGen_DebugLoc(e);
	
	savedWhileNum = whilenum;
	whilenum = labelnum++;
			
	oss << whilenum;
	e.emit_x86Label(".WHILE_" + oss.str() + "_B");
	//currLoc = e.emitSkip(0);
	
	// Test Condition
	if (child[0] != NULL)
		child[0]->GenCode_x86(e, travSib);
	e.emit_x86CR("cmp", 0, ax, "while condition check");
	e.emit_x86J("je", ".WHILE_" + oss.str() + "_E", "break out of loop if false");
	
	//skipLoc = e.emitSkip(1);

	e.emit_x86Comment("WHILE BODY");
	// While Body
	if (child[1] != NULL)
		child[1]->GenCode_x86(e, travSib);
	e.emit_x86J("jmp", ".WHILE_" + oss.str() + "_B", "return to the top of the while loop");
				
	// Save current location to jump when While cond. is false
	//currLoc = e.emitSkip(0);
	//e.emitBackup(skipLoc);
	//e.emitRMAbs("JLT", ac, currLoc, "break out of loop if false");
	//e.emitRestore();
	e.emit_x86Label(".WHILE_" + oss.str() + "_E");

	whilenum = savedWhileNum;		

	TreeNode::GenCode_x86(e, true);
}

void WhileStateNode::PrintTree(ostream &out, int spaces, int siblingNum) const {
	PrintSpaces(out, spaces);
    out << "While" << " [line: " << lineNumber << "]\n";
	TreeNode::PrintTree(out, spaces, siblingNum);
}

void WhileStateNode::ScopeAndType(ostream &out, int &numErrors) {
	//	Types tempType;
	string tempName;
	DeclarationNode *dPtr;
	//bool tempNewScope;

	//IfK and while kind use the same code
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

	TreeNode::ScopeAndType(out, numErrors);
}

void ForStateNode::GenCode_x86(CodeEmitter &e, bool travSib) {
	ostringstream oss;
	int savedForNum;
	
	TreeNode::CodeGen_DebugLoc(e);
	
	savedForNum = fornum;
	fornum = labelnum++;
			
	oss << fornum;
	e.emit_x86Comment("FOR STATEMENT START");
	// The first child is executed only once before the loop
	if (child[0] != NULL)
		child[0]->GenCode_x86(e, travSib);

	// Now we start the loop (with the test condition)
	e.emit_x86Label(".FOR_" + oss.str() + "_B");
		
	// Test Condition
	if (child[1] != NULL)
		child[1]->GenCode_x86(e, travSib);
	e.emit_x86CR("cmp", 0, ax, "for condition check");
	e.emit_x86J("je", ".FOR_" + oss.str() + "_E", "break out of loop if false");
		
	e.emit_x86Comment("FOR BODY");
	// For Body
	if (child[3] != NULL)
		child[3]->GenCode_x86(e, travSib);

	// execute the last expression before looping
	if (child[2] != NULL)
		child[2]->GenCode_x86(e, travSib);
	e.emit_x86J("jmp", ".FOR_" + oss.str() + "_B", "return to the top of the for loop");
				
	e.emit_x86Label(".FOR_" + oss.str() + "_E");

	fornum = savedForNum;		

	TreeNode::GenCode_x86(e, true);
}

void ForStateNode::PrintTree(ostream &out, int spaces, int siblingNum) const {
	PrintSpaces(out, spaces);
    out << "For" << " [line: " << lineNumber << "]\n";
	TreeNode::PrintTree(out, spaces, siblingNum);
}

void ForStateNode::ScopeAndType(ostream &out, int &numErrors) {
	for (int i=0; i<MAXCHILDREN; i++)
		if (child[i] != NULL)
			child[i]->ScopeAndType(out, numErrors);		
}

void ReturnStateNode::GenCode_x86(CodeEmitter &e, bool travSib) {
	ostringstream oss;
	
	TreeNode::CodeGen_DebugLoc(e);	
	
	e.emit_x86Comment("RETURN");
	if (child[0] != NULL)
		child[0]->GenCode_x86(e, travSib);
	// Fix up stack and return
	e.emit_x86R2("mov", bp, sp, "");
	e.emit_x86R1("pop", bp, "");
	e.emit_x86("ret");

	TreeNode::GenCode_x86(e, true);
}

void ReturnStateNode::PrintTree(ostream &out, int spaces, int siblingNum) const {
	PrintSpaces(out, spaces);
	out << "Return" << " [line: " << lineNumber << "]\n";
	TreeNode::PrintTree(out, spaces, siblingNum);
}

void ReturnStateNode::ScopeAndType(ostream &out, int &numErrors) {
	//Types tempType;
	string tempName;
	DeclarationNode *dPtr;
	//bool tempNewScope;

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
		
	
	TreeNode::ScopeAndType(out, numErrors);	
}

void BreakStateNode::GenCode_x86(CodeEmitter &e, bool travSib) {
	ostringstream oss;
	
	oss << whilenum;

	TreeNode::CodeGen_DebugLoc(e);
	
	// simply jump to the end of the enclosing loop
	e.emit_x86J("jmp", ".WHILE_" + oss.str() + "_E", "break statement; break out of inner loop");		
}

void BreakStateNode::PrintTree(ostream &out, int spaces, int siblingNum) const {
	PrintSpaces(out, spaces);
	out << "Break" << " [line: " << lineNumber << "]\n";
	TreeNode::PrintTree(out, spaces, siblingNum);
}

void BreakStateNode::ScopeAndType(ostream &out, int &numErrors) {
}
