#ifndef _COMPILER_H_
#define _COMPILER_H_

#include "syntaxtree.h"
#include "symtab.h"

extern int yyparse();
extern TreeNode *savedTree;
extern unsigned int currentLineNo;
extern char currentToken[255];

extern void PrintNode(void *dPtr);

class Compiler {
public:
	Compiler() : pSynTree(false), pMem(false), tSymTab(false), pParseDebug(false),
		numErrors(0), numWarnings(0), out(&cout)
	{	
		emitter = new CodeEmitter(&cout, true);
	}

	Compiler(bool printSyntaxTree, bool printMemoryLayout,
		bool traceSymbolTable, bool printParserDebug, ostream *outStream, ostream *objectFileStream)
		: pSynTree(printSyntaxTree), pMem(printMemoryLayout), tSymTab(traceSymbolTable), 
		pParseDebug(printParserDebug), out(outStream), numErrors(0), 
		numWarnings(0) 
	{
		emitter = new CodeEmitter(objectFileStream, true);
	}
	
	int GetErrors() { return numErrors; }
	int GetWarnings() { return numWarnings; }

	//void SetCompileOptions(bool printSyntaxTree, bool printMemoryLayout,
	//	bool traceSymbolTable, bool printParserDebug, string objectFile);
	void Compile();
	void ParserLexerError(const char *msg);	

	TreeNode *syntaxTree;

private:
	bool pSynTree;
	bool pMem;
	bool tSymTab;
	bool pParseDebug;
	ostream *out;
	CodeEmitter *emitter;
	//SymTab symtab;

	int numErrors;
	int numWarnings;
};

#endif
