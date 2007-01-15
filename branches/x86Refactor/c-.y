/*	$Author$
	$Date$
	$Rev$
*/

%{ 
#include "globals.h"
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

%token <lineno> IF RETURN WHILE TRUE FALSE BOOLEAN INT VOID '{' '='
%token <fPtr> ID NUM

%left <lineno> '<' '>' LEQ GEQ EQ NEQ
%left <lineno> '+' '-' OR
%left <lineno> '*' '/' '%' AND
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
				matched
				unmatched
				others
				return_stmt
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
						{	DeclarationNode *dNode = new DeclarationNode(TreeNode::VarK);
							dNode->type = (TreeNode::Types)$1;		// save the type
							dNode->name = $2->identifier;			// save the ID
							dNode->lineNumber = $2->lineno;			// save the lineNumber
							dNode->size = 1;
							$$ = (TreeNode *)dNode;
						}
					| type_specifier ID '[' NUM ']' ';' 
						{	DeclarationNode *dNode = new DeclarationNode(TreeNode::VarK);
							dNode->type = (TreeNode::Types)$1;		// save the type
							dNode->name = $2->identifier;			// save the ID
							dNode->lineNumber = $2->lineno;			// save the lineNumber
							dNode->isArray = true;
							dNode->size = $4->number;				// save the array size
							$$ = (TreeNode *)dNode;
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
						{	DeclarationNode *dNode = new DeclarationNode(TreeNode::FuncK);
							dNode->type = (TreeNode::Types)$1;		// save the type
							dNode->name = $2->identifier;			// save the ID
							dNode->lineNumber = $2->lineno;			// save the lineNumber
							dNode->child[0] = $4;				// params are the first child of the function declaration
							dNode->child[1] = $6;				// statements are the second child of the function declaration							
							$$ = (TreeNode *)dNode;	
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
						{	DeclarationNode *dNode = new DeclarationNode(TreeNode::ParamK);
							dNode->type = (TreeNode::Types)$1;
							dNode->name = $2->identifier;
							dNode->lineNumber = $2->lineno;			// save the lineNumber
							dNode->size = 1;
							$$ = (TreeNode *)dNode;
						}
					| type_specifier ID '[' ']' 
						{	DeclarationNode *dNode = new DeclarationNode(TreeNode::ParamK);
							dNode->type = (TreeNode::Types)$1;
							dNode->name = $2->identifier;
							dNode->lineNumber = $2->lineno;			// save the lineNumber
							dNode->isArray = true;
							dNode->size = 1;				// params are always size 1 - passed by address in c-
							$$ = (TreeNode *)dNode;
						}
					;
					
compound_stmt		: '{' local_declarations statement_list '}' 
						{	StatementNode *sNode = new StatementNode(TreeNode::CompK);
							sNode->lineNumber = $1;				// save the lineNumber from '{'
							sNode->child[0] = $2;				// local_declarations go into the first child of compound_stmt
							sNode->child[1] = $3;				// statment_list goes into the second child of compound_stmt
							$$ = (TreeNode *)sNode;
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

statement			: matched { $$ = $1; }
					| unmatched { $$ = $1; }
					;

others				: expression_stmt { $$ = $1; }
					| compound_stmt { $$ = $1; }					
					| return_stmt { $$ = $1; }
					;
					
expression_stmt		: expression ';' { $$ = $1; }
					| ';' { $$ = NULL; }
					| error ';'			// ERROR handling
						{	$$=NULL;
							//cout << "**ERROR expression_stmt\n";
							yyerrok;
						}
					;
					
matched				: IF '(' expression ')' matched ELSE matched
						{	StatementNode *sNode = new StatementNode(TreeNode::IfK);
							sNode->lineNumber = $1;			// save the linenumber from 'IF'
							sNode->child[0] = $3;
							sNode->child[1] = $5;
							sNode->child[2] = $7;
							$$ = (TreeNode *)sNode;
						}
					| IF '(' error ')' matched ELSE matched	// ERROR handling
						{	$$=NULL;
							//cout << "**ERROR matched IF 1\n";							
							yyerrok;
						}
					| IF '(' expression ')' error ELSE matched	// ERROR handling
						{	$$=NULL;
							//cout << "**ERROR matched IF 2\n";							
							yyerrok;
						}
					| WHILE '(' expression ')' matched
						{	StatementNode *sNode = new StatementNode(TreeNode::WhileK);
							sNode->lineNumber = $1;			// save the linenumber from 'WHILE'
							sNode->child[0] = $3;
							sNode->child[1] = $5;
							$$ = (TreeNode *)sNode;
						}
					| WHILE '(' error ')' matched			// ERROR handling
                        {	$$=NULL;
							StatementNode *sNode = (StatementNode *)$5;
							//cout << "**ERROR matched WHILE 1\n";
							yyerrok;
						}	
					| others					
					;
					
unmatched			: IF '(' expression ')' statement
						{	StatementNode *sNode = new StatementNode(TreeNode::IfK);
							sNode->lineNumber = $1;			// save the linenumber from 'IF'
							sNode->child[0] = $3;
							sNode->child[1] = $5;						
							$$ = (TreeNode *)sNode;
						}
					| IF '(' expression ')' matched ELSE unmatched
						{	StatementNode *sNode = new StatementNode(TreeNode::IfK);
							sNode->lineNumber = $1;			// save the linenumber from 'IF'
							sNode->child[0] = $3;
							sNode->child[1] = $5;
							sNode->child[2] = $7;
							$$ = (TreeNode *)sNode;
						}
					| IF '(' error ')' statement					// ERROR handling
						{	$$=NULL;
							//cout << "**ERROR unmatched IF 1\n"; 
							yyerrok;
						}
					| IF '(' error ')' matched ELSE unmatched		// ERROR handling
						{	$$=NULL;
							//cout << "**ERROR unmatched IF 2\n";						
							yyerrok;
						}
					| IF '(' expression ')' error ELSE unmatched	// ERROR handling
						{	$$=NULL;
							//cout << "**ERROR unmatched IF 3\n";							
							yyerrok;
						}
					| WHILE '(' expression ')' unmatched
						{	StatementNode *sNode = new StatementNode(TreeNode::WhileK);
							sNode->lineNumber = $1;			// save the linenumber from 'WHILE'
							sNode->child[0] = $3;
							sNode->child[1] = $5;
							$$ = (TreeNode *)sNode;
						}
					| WHILE '(' error ')' unmatched					// ERROR handling
                        {	$$=NULL;
							//cout << "**ERROR unmatched WHILE 1\n";
							yyerrok;
						}
					;  
					
return_stmt			: RETURN ';' 
						{	StatementNode *sNode = new StatementNode(TreeNode::ReturnK);
							sNode->lineNumber = $1;
							$$ = (TreeNode *)sNode; 
						}						
					| RETURN expression ';'
						{	StatementNode *sNode = new StatementNode(TreeNode::ReturnK);
							sNode->lineNumber = $1;			// save the linenumber from 'RETURN'
							sNode->child[0] = $2;
							$$ = (TreeNode *)sNode;
						}
					| RETURN error ';'		// ERROR handling
						{	$$=NULL;
							//cout << "**ERROR return\n"; 
							yyerrok;
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
			yyin = fopen(argv[optind], "r");
			if (yyin == NULL) /* open failed */
			{
				cerr << progname << ": cannot open " << argv[optind] << endl;
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
	compiler = new Compiler(printSyntaxTree, printMemoryLayout,
		symbolTableTracing, true, &cout, objFileStream);
	compiler->Compile();

	cout << "Number of errors: " << compiler->GetErrors() << "\nNumber of warnings: " << compiler->GetWarnings() << endl;
	
	// close the open input file if necessary
	if (inFileOpen) fclose(yyin);
	// close the open output file if necessary
	if (outFileOpen) {
		((ofstream *)objFileStream)->close();
		delete objFileStream;
	}
}
