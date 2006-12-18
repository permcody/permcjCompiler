%{ 
#include "globals.h"
#include "symtab.h"

#ifdef CPLUSPLUS
extern int yylex();
#endif

#define YYERROR_VERBOSE 1

extern unsigned int currentLineNo;
extern char currentToken[255];
int numErrors=0;	// number of errors found by the symtactic and semantic analyzers
int numWarnings=0;	// number of warnings found by the lexer

TreeNode *savedTree;

TreeNode *newOpExpNode(char *op, TreeNode *child0, TreeNode *child1, long lineno);

// flex requires that you supply this function
void yyerror(const char *msg)
{
	if (strcmp(msg, "Flex Error") == 0) {
		++numWarnings;
		cerr << "WARNING lineno(" << currentLineNo << "): Invalid input character: " << currentToken << ".  Character ignored. " << endl;
	}
	else {
		++numErrors;
		cerr << "ERROR lineno(" << currentLineNo << "): " << msg << " Current Token is " << currentToken << endl;
	}
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

%token <lineno> IF RETURN WHILE TRUE FALSE ERROR INT VOID BOOL '{' '='
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
				selection_stmt
				iteration_stmt
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
					;
					
type_specifier		: INT	{ $$ = TreeNode::Int; }	
					| VOID	{ $$ = TreeNode::Void; }
					| BOOL	{ $$ = TreeNode::Bool; }
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
							$$ = (TreeNode *)dNode;
						}
					| type_specifier ID '[' ']' 
						{	DeclarationNode *dNode = new DeclarationNode(TreeNode::ParamK);
							dNode->type = (TreeNode::Types)$1;
							dNode->name = $2->identifier;
							dNode->lineNumber = $2->lineno;			// save the lineNumber
							dNode->isArray = true;
							dNode->size = -1;				// no size was specified
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
					| compound_stmt { $$ = $1; }
					| selection_stmt { $$ = $1; }
					| iteration_stmt { $$ = $1; }
					| return_stmt { $$ = $1; }
					;
					
expression_stmt		: expression ';' { $$ = $1; }
					| ';' { $$ = NULL; }
					;
					
selection_stmt		: IF '(' expression ')' statement %prec LOWER_THAN_ELSE
						{	StatementNode *sNode = new StatementNode(TreeNode::IfK);
							sNode->lineNumber = $1;			// save the linenumber from 'IF'
							sNode->child[0] = $3;
							sNode->child[1] = $5;
							$$ = (TreeNode *)sNode;
						}
					| IF '(' expression ')' statement ELSE statement
						{	StatementNode *sNode = new StatementNode(TreeNode::IfK);
							sNode->lineNumber = $1;			// save the linenumber from 'IF'
							sNode->child[0] = $3;
							sNode->child[1] = $5;
							sNode->child[2] = $7;
							$$ = (TreeNode *)sNode;
						}
					;  
					
iteration_stmt		: WHILE '(' expression ')' statement
						{	StatementNode *sNode = new StatementNode(TreeNode::WhileK);
							sNode->lineNumber = $1;			// save the linenumber from 'WHILE'
							sNode->child[0] = $3;
							sNode->child[1] = $5;
							$$ = (TreeNode *)sNode;
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
					;
					
expression			: var '=' expression
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::AssignK);
							eNode->lineNumber = $2;			// save the linenumber from '='
							eNode->child[0] = $1;
							eNode->child[1] = $3;
							$$ = (TreeNode *)eNode;
						}
					| simple_expression		// default							
					;
					
var					: ID
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::IdK);
							eNode->name = $1->identifier;
							eNode->lineNumber = $1->lineno;	// save the linenumber from 'ID'
							$$ = (TreeNode *)eNode;
						}
					| ID '[' expression ']'
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::IdK);
							eNode->name = $1->identifier;
							eNode->lineNumber = $1->lineno;	// save the linenumber from 'ID'
							eNode->child[0] = $3;
							$$ = (TreeNode *)eNode;
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
					;
					
constant			: NUM 
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::ConstK);
							eNode->lineNumber = $1->lineno;	// save the linenumber from 'NUM'
							eNode->val = $1->number;
							eNode->type = TreeNode::Int;	// Numbers are type int no need to process in semantics
							$$ = (TreeNode *)eNode;
						}
					| TRUE
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::ConstK);
							eNode->lineNumber = $1;			// save the linenumber from 'TRUE'
							eNode->val = 1;					// value of true
							eNode->type = TreeNode::Bool;
							//eNode->isBool = true;			// MAY NOT NEED THIS LINE
							$$ = (TreeNode *)eNode;
						}
					| FALSE 
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::ConstK);
							eNode->lineNumber = $1;			// save the linenumber from 'FALSE'
							eNode->val = 0;					// value of false
							eNode->type = TreeNode::Bool;			
							//eNode->isBool = true;			// MAY NOT NEED THIS LINE
							$$ = (TreeNode *)eNode;	
						}
					;
					
call				: ID '(' args ')'
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::CallK);
							eNode->name = $1->identifier;
                            eNode->lineNumber = $1->lineno;	// save the linenumber from 'ID'
							eNode->child[0] = $3;
							$$ = (TreeNode *)eNode;
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
					;

%%

TreeNode *newOpExpNode(char *op, TreeNode *child0, TreeNode *child1, long lineno) {
	ExpressionNode *eNode = new ExpressionNode(TreeNode::OpK);
	eNode->lineNumber = lineno;
	eNode->child[0] = child0;
	eNode->child[1] = child1;
	eNode->op = copyString(op);
	return (TreeNode *)eNode;
}

// Static function declaration passed to symtab constructor for printing declarations
void PrintNode(void *dPtr) { DeclarationNode::PrintNode(cout, (DeclarationNode *)dPtr); }

int main(int argc, char *argv[]) {
		
	char *progname;
	extern FILE *yyin;
	bool fileOpen = false;
	bool printSyntaxTree = false;
	bool symbolTableTracing = false;
	char c;
	
	progname = argv[0];
	
	yydebug = 0;
	while ((c = getopt(argc, argv, "dps"))!= EOF)
		switch (c) {
		case 'd':
			yydebug = 1;
			break;
		case 'p':
			printSyntaxTree = true;
			break;
		case 's':
			symbolTableTracing = true;
			break;		
		}
	
	// check for a correct command line usage
	if (argc-1 > optind) {
		cerr << "usage: " << progname << " [-d] [infile]\n";
		exit(1);
	}
	
	// check for a filename on the command line
	if (argc-1 == optind) {
		/* open infile for reading */
		yyin = fopen(argv[optind], "r");
		if (yyin == NULL) /* open failed */
		{
			cerr << progname << ": cannot open " << argv[optind] << endl;
			exit(1);
		} 
		else 
		{
			fileOpen = true;
		}			
	}

	// ********************* PARSER (Bison) *******************************
	// run the parser (parser calls the lexer internally)
	yyparse();
	// print the Syntax tree if command line option '-p' is set	
	if (printSyntaxTree) savedTree->PrintTree(cout); 
	// ********************* PARSER (Bison) *******************************
		
	// ********************* SEMANTIC ANALYZER ****************************
	// create the symbol table
	TreeNode::symtab = new SymTab(PrintNode);
	// turn on the debug for the symbol table if option '-s' is set
	if (symbolTableTracing) TreeNode::symtab->debug(DEBUG_TABLE);
	// run the semantic analyzer
	savedTree->ScopeAndType(cout, numErrors);
	cout << "Number of errors: " << numErrors << "\nNumber of warnings: " << numWarnings << endl;
	// ********************* SEMANTIC ANALYZER ****************************

	// close the open input file if necessary
	if (fileOpen) fclose(yyin);
}
