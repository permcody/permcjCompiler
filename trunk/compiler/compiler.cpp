#include "compiler.h"

/*void Compiler::SetCompileOptions(bool printSyntaxTree, bool printMemoryLayout,
								 bool traceSymbolTable, bool printParserDebug, string objectFile) {
	pSynTree = printSyntaxTree;
	pMem = printMemoryLayout;
	tSymTab = traceSymbolTable;
    pParseDebug = printParserDebug;
	objFile = objectFile;
}*/

void Compiler::Compile() {
	
	// ********************* LEXER (Flex) AND PARSER (Bison) **************
	// run the parser (parser calls the lexer internally)
	/*Compiler compiler;
	compiler.Parse();
	compiler.syntaxTree = savedTree;*/
	yyparse();
	syntaxTree = savedTree;
	// ********************* LEXER (Flex) AND PARSER (Bison) **************
	
	// ********************* Lack of Linker Section ***********************
	// need to "Frankenstein" the input/output functions into the tree here
	//savedTree = savedTree->AddIOFunctions();
	syntaxTree = syntaxTree->AddIOFunctions();
	// ********************* Lack of Linker Section ***********************

	// print the Syntax tree if command line option '-p' is set	
	if (pSynTree) syntaxTree->PrintTree(*out); 
	
	// ********************* SEMANTIC ANALYZER ****************************
	if (!numErrors) {		
		// create the symbol table
		TreeNode::symtab = new SymTab(PrintNode);
		// turn on the debug for the symbol table if option '-s' is set
		if (tSymTab) TreeNode::symtab->debug(DEBUG_TABLE);
		// run the semantic analyzer
		syntaxTree->ScopeAndType(*out, numErrors);		
	
	// ********************* SEMANTIC ANALYZER ****************************

		// print the Memory layout if command line option '-m' is set
		if (pMem) syntaxTree->PrintMem(cout);
	
	// ********************** CODE GENERATION *****************************
		syntaxTree->CodeGeneration(*emitter);
	}
	// ********************** CODE GENERATION *****************************

}

void Compiler::ParserLexerError(const char *msg) {
	if (strcmp(msg, "Flex Error") == 0) {
		// This error is called explicitly from the flex part (yylex)
		++numWarnings;
		cout << "WARNING lineno(" << currentLineNo << "): Invalid input character: " << currentToken << ".  Character ignored." << endl;
	}
	else if (strstr(msg, "expecting")) {
		// Expecting Error
		++numErrors;
		cout << "ERROR lineno(" << currentLineNo << "): " << msg << " but got: " << currentToken << endl;
	}
	else {
		// Parse Error
		++numErrors;
		cout << "ERROR lineno(" << currentLineNo << "): Unexpected token: " << currentToken << endl;
	}
}
