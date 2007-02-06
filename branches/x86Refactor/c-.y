/*	$Author$
	$Date$
	$Rev$
*/

%{ 
#include "globals.h"
#include "expression.h"
#include "statement.h"
#include "declaration.h"
#include "symtab.h"
#include "compiler.h"

#ifdef CPLUSPLUS
extern int yylex();
#endif

#define YYERROR_VERBOSE 1

//extern unsigned int currentLineNo;
//extern char currentToken[255];
//int numErrors=0;	// number of errors found by the symtactic and semantic analyzers
//int numWarnings=0;	// number of warnings found by the lexer

TreeNode *savedTree;
//ostream *code;
Compiler *compiler;

TreeNode *newOpExpNode(char *op, TreeNode *child0, TreeNode *child1, long lineno);

// flex requires that you supply this function
void yyerror(const char *msg)
{
	compiler->ParserLexerError(msg);

	/*if (strcmp(msg, "Flex Error") == 0) {
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
	}	*/
}

string & copyString(char *source) 
{
	string *dest = new string(source);
	return *dest;
}

%}

%union {
	long lineno;
	long number;
	TreeNode *tree;
	FlexStruct *fPtr;
}

%token <lineno> IF RETURN BREAK WHILE FOR TRUE FALSE BOOLEAN INT VOID '{' '='
%token <fPtr> ID NUM

%left <lineno> OR
%left <lineno> AND
%left <lineno> '<' '>' LEQ GEQ EQ NEQ
%left <lineno> '+' '-'
%left <lineno> '*' '/' '%'
%left <lineno> '!' UMINUS

%nonassoc LOWER_THAN_ELSE
%nonassoc <lineno> ELSE

%type <tree>	program 
				declaration_list 
				declaration 
				var_declaration 
				fun_declaration 
				params 
				param_list
				param
				compound_stmt
				local_declarations
				statement_list
				statement
				expression_stmt
				if_stmt
				while_stmt	
				for_stmt
				return_stmt
				break_stmt
				expression
				var
				simple_expression
				factor
				call
				constant
				args
				arg_list

%type <number>	type_specifier

%%

program				: declaration_list	{ savedTree = $1; }
					;
			
declaration_list	: declaration_list declaration 
						{	TreeNode *t = $1;
							if (t != NULL) {
								while (t->sibling != NULL)
									t = t->sibling;
								t->sibling = $2;			// Add the new declaration to the end of the sibling list
								$$ = $1;					// Pass back the TreeNode pointer
							}
							else $$ = $2;					// This is the first declaration matched so far
						}						
					| declaration { $$ = $1; }
					;
					
declaration			: var_declaration { $$ = $1; }
					| fun_declaration { $$ = $1; }
					;
					
var_declaration		: type_specifier ID ';' 
						{	VarDeclNode *vNode = new VarDeclNode();
							vNode->type = (TreeNode::Types)$1;		// save the type
							vNode->name = $2->identifier;			// save the ID
							vNode->lineNumber = $2->lineno;			// save the lineNumber
							vNode->size = 1;
							$$ = (TreeNode *)vNode;
						}
					| type_specifier ID '[' NUM ']' ';' 
						{	VarDeclNode *vNode = new VarDeclNode();
							vNode->type = (TreeNode::Types)$1;		// save the type
							vNode->name = $2->identifier;			// save the ID
							vNode->lineNumber = $2->lineno;			// save the lineNumber
							vNode->isArray = true;
							vNode->size = $4->number;				// save the array size
							$$ = (TreeNode *)vNode;
						}
					| error ';'		// ERROR handling
						{	$$=NULL; 
							//cout << "**ERROR var_declaration\n"; 
							yyerrok;
						}
					;
					
type_specifier		: BOOLEAN	{ $$ = TreeNode::Bool; }
					| INT	{ $$ = TreeNode::Int; }	
					| VOID	{ $$ = TreeNode::Void; }
					;
					
fun_declaration		: type_specifier ID '(' params ')' compound_stmt 
						{	FuncDeclNode *fNode = new FuncDeclNode();
							fNode->type = (TreeNode::Types)$1;		// save the type
							fNode->name = $2->identifier;			// save the ID
							fNode->lineNumber = $2->lineno;			// save the lineNumber
							fNode->child[0] = $4;				// params are the first child of the function declaration
							fNode->child[1] = $6;				// statements are the second child of the function declaration							
							$$ = (TreeNode *)fNode;	
						}
					| error '(' params ')' compound_stmt  // ERROR handling
						{	$$=NULL; 
							//cout << "**ERROR fun_declaration 1\n"; 
							yyerrok;
						}
					| type_specifier ID '(' error ')' compound_stmt	// ERROR handling
						{	$$=NULL; 
							//cout << "**ERROR fun_declaration 2\n"; 
							yyerrok;
						}
					;
					
params				: param_list { $$ = $1; }
					| VOID { $$ = NULL; }
					;
					
param_list			: param_list ',' param 
						{	TreeNode *t = $1;
							if (t != NULL) {
								while (t->sibling != NULL)
									t = t->sibling;
								t->sibling = $3;			// Add the new param to the end of the sibling list
								$$ = $1;					// Pass back the TreeNode pointer
							}
							else $$ = $3;					// This is the first param matched so far
						}
					| param { $$ = $1; }					
					;

param				: type_specifier ID 
						{	ParamDeclNode *pNode = new ParamDeclNode();
							pNode->type = (TreeNode::Types)$1;
							pNode->name = $2->identifier;
							pNode->lineNumber = $2->lineno;			// save the lineNumber
							pNode->size = 1;
							$$ = (TreeNode *)pNode;
						}
					| type_specifier ID '[' ']' 
						{	ParamDeclNode *pNode = new ParamDeclNode();
							pNode->type = (TreeNode::Types)$1;
							pNode->name = $2->identifier;
							pNode->lineNumber = $2->lineno;			// save the lineNumber
							pNode->isArray = true;
							pNode->size = 1;				// params are always size 1 - passed by address in c-
							$$ = (TreeNode *)pNode;
						}
					;
					
compound_stmt		: '{' local_declarations statement_list '}' 
						{	CompStateNode *cNode = new CompStateNode();
							cNode->lineNumber = $1;				// save the lineNumber from '{'
							cNode->child[0] = $2;				// local_declarations go into the first child of compound_stmt
							cNode->child[1] = $3;				// statment_list goes into the second child of compound_stmt
							$$ = (TreeNode *)cNode;
						}
					| '{' error '}'						// ERROR handling
						{	$$=NULL;
							//cout << "**ERROR compound\n";
							yyerrok;
						}
					;
					
local_declarations	: local_declarations var_declaration 
						{	TreeNode *t = $1;
							if (t != NULL) {
								while (t->sibling != NULL)
									t = t->sibling;
								t->sibling = $2;			// Add the new var_declaration to the end of the sibling list
								$$ = $1;					// Pass back the TreeNode pointer
							}
							else $$ = $2;					// This is the first var_declaration matched so far
						}
					|	{ $$ = NULL; }
					;

statement_list		: statement_list statement 
						{	TreeNode *t = $1;
							if (t != NULL) {
								while (t->sibling != NULL)
									t = t->sibling;
								t->sibling = $2;			// Add the new statement to the end of the sibling list
								$$ = $1;					// Pass back the TreeNode pointer
							}
							else $$ = $2;					// This is the first statement matched so far
						}
					|	{ $$ = NULL; }
					;

statement			: expression_stmt { $$ = $1; }
					| if_stmt { $$ = $1; }
					| while_stmt { $$ = $1; }
					| compound_stmt { $$ = $1; }					
					| return_stmt { $$ = $1; }
					| break_stmt { $$ = $1; }
					| for_stmt { $$ = $1; }
					;
					
expression_stmt		: expression ';' { $$ = $1; }
					| ';' { $$ = NULL; }
					| error ';'			// ERROR handling
						{	$$=NULL;
							//cout << "**ERROR expression_stmt\n";
							yyerrok;
						}
					;
					
if_stmt				: IF '(' expression ')' statement ELSE statement
						{	IfStateNode *iNode = new IfStateNode();
							iNode->lineNumber = $1;			// save the linenumber from 'IF'
							iNode->child[0] = $3;
							iNode->child[1] = $5;
							iNode->child[2] = $7;
							$$ = (TreeNode *)iNode;
						}
					| IF '(' error ')' statement ELSE statement	// ERROR handling
						{	$$=NULL;
							//cout << "**ERROR matched IF 1\n";							
							yyerrok;
						}
					| IF '(' expression ')' error ELSE statement	// ERROR handling
						{	$$=NULL;
							//cout << "**ERROR matched IF 2\n";							
							yyerrok;
						}
					| IF '(' expression ')' statement
						{	IfStateNode *iNode = new IfStateNode();
							iNode->lineNumber = $1;			// save the linenumber from 'IF'
							iNode->child[0] = $3;
							iNode->child[1] = $5;						
							$$ = (TreeNode *)iNode;
						}
					| IF '(' error ')' statement					// ERROR handling
						{	$$=NULL;
							//cout << "**ERROR unmatched IF 1\n"; 
							yyerrok;
						}
					;


while_stmt			: WHILE '(' expression ')' statement
						{	WhileStateNode *wNode = new WhileStateNode();
							wNode->lineNumber = $1;			// save the linenumber from 'WHILE'
							wNode->child[0] = $3;
							wNode->child[1] = $5;
							$$ = (TreeNode *)wNode;
						}
					| WHILE '(' error ')' statement			// ERROR handling
                        {	$$=NULL;
							//StatementNode *sNode = (StatementNode *)$5;
							//cout << "**ERROR matched WHILE 1\n";
							yyerrok;
						}						
					;

for_stmt			: FOR '(' expression ';' expression ';' expression ')' statement
						{	ForStateNode *fNode = new ForStateNode();
							fNode->lineNumber = $1;			// save the linenumber from 'FOR'
							fNode->child[0] = $3;
							fNode->child[1] = $5;
							fNode->child[2] = $7;
							fNode->child[3] = $9;
							$$ = (TreeNode *)fNode;
						}
					;
					
return_stmt			: RETURN ';' 
						{	ReturnStateNode *rNode = new ReturnStateNode();
							rNode->lineNumber = $1;
							$$ = (TreeNode *)rNode; 
						}						
					| RETURN expression ';'
						{	ReturnStateNode *rNode = new ReturnStateNode();
							rNode->lineNumber = $1;			// save the linenumber from 'RETURN'
							rNode->child[0] = $2;
							$$ = (TreeNode *)rNode;
						}
					| RETURN error ';'		// ERROR handling
						{	$$=NULL;
							//cout << "**ERROR return\n"; 
							yyerrok;
						}
					;

break_stmt			: BREAK ';'
						{	BreakStateNode *bNode = new BreakStateNode();
							bNode->lineNumber = $1;
							$$ = (TreeNode *)bNode;
						}
					;					

expression			: var '=' expression
						{	AssignExpNode *aNode = new AssignExpNode();
							aNode->lineNumber = $2;			// save the linenumber from '='
							aNode->child[0] = $1;
							aNode->child[1] = $3;
							$$ = (TreeNode *)aNode;
						}
					| simple_expression		// default							
					;
					
var					: ID
						{	
							IdExpNode *iNode = new IdExpNode();
							iNode->name = $1->identifier;
							iNode->lineNumber = $1->lineno;	// save the linenumber from 'ID'
							$$ = (TreeNode *)iNode;
						}
					| ID '[' expression ']'
						{	
							IdExpNode *iNode = new IdExpNode();
							iNode->name = $1->identifier;
							iNode->lineNumber = $1->lineno;	// save the linenumber from 'ID'
							iNode->child[0] = $3;
							$$ = (TreeNode *)iNode;
						}
					;

simple_expression	: simple_expression '+' simple_expression	{ $$ = newOpExpNode("+", $1, $3, $2); }
					| simple_expression '-' simple_expression	{ $$ = newOpExpNode("-", $1, $3, $2); }
					| simple_expression '*' simple_expression	{ $$ = newOpExpNode("*", $1, $3, $2); }
					| simple_expression '/' simple_expression	{ $$ = newOpExpNode("/", $1, $3, $2); }
					| simple_expression '%' simple_expression	{ $$ = newOpExpNode("%", $1, $3, $2); }
					| simple_expression '<' simple_expression	{ $$ = newOpExpNode("<", $1, $3, $2); }
					| simple_expression '>' simple_expression	{ $$ = newOpExpNode(">", $1, $3, $2); }
					| simple_expression LEQ simple_expression	{ $$ = newOpExpNode("<=", $1, $3, $2); }
					| simple_expression GEQ simple_expression	{ $$ = newOpExpNode(">=", $1, $3, $2); }
					| simple_expression EQ simple_expression	{ $$ = newOpExpNode("==", $1, $3, $2); }
					| simple_expression NEQ simple_expression	{ $$ = newOpExpNode("!=", $1, $3, $2); }
					| simple_expression OR simple_expression	{ $$ = newOpExpNode("||", $1, $3, $2); }
					| simple_expression AND simple_expression	{ $$ = newOpExpNode("&&", $1, $3, $2); }
					| '-' simple_expression %prec UMINUS		{ $$ = newOpExpNode("-", $2, NULL, $1); }
					| '!' simple_expression						{ $$ = newOpExpNode("!", $2, NULL, $1); }
					| factor									{ $$ = $1; }
					;				
					
factor				: '(' expression ')'	{ $$ = $2; }
					| var
					| call
					| constant
					| '(' error ')'							// ERROR handling
						{	$$=NULL;
							//cout << "**ERROR paren exp\n";
							yyerrok;
						}
					;
					
constant			: NUM 
						{	ConstExpNode *cNode = new ConstExpNode();
							cNode->lineNumber = $1->lineno;	// save the linenumber from 'NUM'
							cNode->val = $1->number;
							cNode->type = TreeNode::Int;	// Numbers are type int no need to process in semantics
							$$ = (TreeNode *)cNode;
						}
					| TRUE
						{	ConstExpNode *cNode = new ConstExpNode();
							cNode->lineNumber = $1;			// save the linenumber from 'TRUE'
							cNode->val = 1;					// value of true
							cNode->type = TreeNode::Bool;							
							$$ = (TreeNode *)cNode;
						}
					| FALSE 
						{	ConstExpNode *cNode = new ConstExpNode();
							cNode->lineNumber = $1;			// save the linenumber from 'FALSE'
							cNode->val = 0;					// value of false
							cNode->type = TreeNode::Bool;							
							$$ = (TreeNode *)cNode;	
						}
					;
					
call				: ID '(' args ')'
						{	CallExpNode *cNode = new CallExpNode();
							cNode->name = $1->identifier;
                            cNode->lineNumber = $1->lineno;	// save the linenumber from 'ID'
							cNode->child[0] = $3;
							$$ = (TreeNode *)cNode;
						}
					| ID '(' error ')'			// ERROR handling
						{	$$=NULL;
							//cout << "**ERROR call\n";
							yyerrok;
						}
					;
					
args				: arg_list { $$ = $1; }
					| { $$ = NULL; }
					;
					
arg_list			: arg_list ',' expression
						{	TreeNode *t = $1;
							if (t != NULL) {
								while (t->sibling != NULL)
									t = t->sibling;
								t->sibling = $3;			// Add the new expression to the end of the sibling list
								$$ = $1;					// Pass back the TreeNode pointer
							}
							else $$ = $3;					// This is the first expression matched so far
						}
					| expression { $$ = $1; }
					| error						// ERROR handling
						{	$$=NULL; 
							//cout << "**ERROR arglist 1\n";
						}
					| arg_list error			// ERROR handling
						{	$$=NULL; 
							//cout << "**ERROR arglist 2\n";
						}
					| arg_list error expression	// ERROR handling
						{	$$=NULL; 
							//cout << "**ERROR arglist 3\n"; 
							yyerrok;
						}
					| arg_list ',' error		// ERROR handling
						{	$$=NULL;
							//cout << "**ERROR arglist 4\n";
						}
					;

%%

TreeNode *newOpExpNode(char *op, TreeNode *child0, TreeNode *child1, long lineno) {
	OpExpNode *oNode = new OpExpNode();
	oNode->lineNumber = lineno;
	oNode->child[0] = child0;
	oNode->child[1] = child1;
	oNode->op = copyString(op);
	return (TreeNode *)oNode;
}

// Static function declaration passed to symtab constructor for printing declarations
void PrintNode(void *dPtr) { DeclarationNode::PrintNode(cout, (DeclarationNode *)dPtr); }

int main(int argc, char *argv[]) {
		
	char *progname;
	char *sourceFile;
	extern FILE *yyin;
	bool inFileOpen = false;
	bool outFileOpen = false;
	bool printSyntaxTree = false;
	bool symbolTableTracing = false;
	bool printMemoryLayout = false;
	char c;
	ostream *objFileStream;
	
	progname = argv[0];
	
	yydebug = 0;
	while (optind < argc) { // keep processing until end of argument list
		while ((c = getopt(argc, argv, "dpsmo:"))!= EOF)
			switch (c) {
			case 'd':
				// turn on Bison Debugging
				yydebug = 1;
				break;
			case 'p':
				printSyntaxTree = true;
				break;
			case 's':
				symbolTableTracing = true;
			case 'm':
				printMemoryLayout = true;
				break;
			case 'o':
				if (!(objFileStream = new ofstream(optarg))) /* open failed */
				{
					cerr << progname << ": cannot open " << optarg << endl;
					exit(1);
				}
				else
					outFileOpen = true;
				break;
			}

		// check for a filename on the command line
		if (optind < argc) {
			// there's another non-option arguement on the arg vector
			if (inFileOpen) {
				cerr << "usage: " << progname << " [-d] [-p] [-s] [-m] [-o outfile] [infile]\n";
				exit(1);
			}

			/* open infile for reading */
			sourceFile = argv[optind];
			yyin = fopen(sourceFile, "r");
			if (yyin == NULL) /* open failed */
			{
				cerr << progname << ": cannot open " << sourceFile << endl;
				exit(1);
			} 
			
			inFileOpen = true;
			optind++; // skip past this argument for the next call to getopt
		}
	}

	// check to see if output file is open
	if (!outFileOpen)
		objFileStream = &cout;

	// Create the C- Compiler and compile
	compiler = new Compiler(sourceFile, printSyntaxTree, printMemoryLayout,
		symbolTableTracing, true, &cout, objFileStream);
	compiler->Compile();

	cout << "Number of warnings: " << compiler->GetWarnings() 
		<< "\nNumber of errors: " << compiler->GetErrors() << endl;
	
	// close the open input file if necessary
	if (inFileOpen) fclose(yyin);
	// close the open output file if necessary
	if (outFileOpen) {
		((ofstream *)objFileStream)->close();
		delete objFileStream;
	}

	return compiler->GetErrors();
}
