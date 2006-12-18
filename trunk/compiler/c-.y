%{ 
#include "globals.h"

#ifdef CPLUSPLUS
extern int yylex();
#endif

#define YYERROR_VERBOSE 1

extern unsigned int currentLineNo;
extern char currentToken[255];

string savedName;
long savedNumber;
TreeNode *savedTree;

// flex requires that you supply this function
void yyerror(const char *msg)
{
      cerr << "ERROR lineno(" << currentLineNo << "):" << msg << "  I got: " << currentToken << endl;
}

string & copyString(char *source) 
{
	string *dest = new string(source);
	return *dest;
}

%}

%union {
	long number;
	char *identifier;
	TreeNode *tree;
}

%token ELSE IF RETURN WHILE TRUE FALSE ERROR
%token <identifier> ID
%token <number> NUM INT VOID BOOL

%left <number> '<' '>' LEQ GEQ EQ NEQ
%left <number> '+' '-' OR
%left <number> '*' '/' '%' AND
%left <number> '!' UMINUS

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
				matched_stmt
				unmatched_stmt
				expression_stmt
				m_selection_stmt
				u_selection_stmt
				m_iteration_stmt
				u_iteration_stmt
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
							dNode->type = (TreeNode::Types)$1;					// save the type
							dNode->name = $2;			// save the ID
							$$ = (TreeNode *)dNode;
						}
					| type_specifier ID '[' NUM ']' ';' 
						{	DeclarationNode *dNode = new DeclarationNode(TreeNode::VarK);
							dNode->type = (TreeNode::Types)$1;				// save the type
							dNode->name = $2;		// save the ID
							dNode->isArray = true;
							dNode->size = $4;		// save the array size
							$$ = (TreeNode *)dNode;
						}							
					;
					
type_specifier		: INT	{ $$ = TreeNode::Int; }	
					| VOID	{ $$ = TreeNode::Void; }
					| BOOL	{ $$ = TreeNode::Bool; }
					;
					
fun_declaration		: type_specifier ID '(' params ')' compound_stmt 
						{	DeclarationNode *dNode = new DeclarationNode(TreeNode::FuncK);
							dNode->type = (TreeNode::Types)$1;					// save the type
							dNode->name = $2;			// save the ID
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
							dNode->name = $2;
							$$ = (TreeNode *)dNode;
						}
					| type_specifier ID '[' ']' 
						{	DeclarationNode *dNode = new DeclarationNode(TreeNode::ParamK);
							dNode->type = (TreeNode::Types)$1;
							dNode->name = $2;
							dNode->isArray = true;
							dNode->size = -1;				// no size was specified
							$$ = (TreeNode *)dNode;
						}
					;
					
compound_stmt		: '{' local_declarations statement_list '}' 
						{	StatementNode *sNode = new StatementNode(TreeNode::CompK);
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

statement			: matched_stmt { $$ = $1; }
					| unmatched_stmt { $$ = $1; }
					;
					
matched_stmt		: expression_stmt { $$ = $1; }
					| compound_stmt { $$ = $1; }
					| m_selection_stmt { $$ = $1; }
					| m_iteration_stmt { $$ = $1; }
					| return_stmt { $$ = $1; }
					;
					
unmatched_stmt		: u_selection_stmt { $$ = $1; }
					| u_iteration_stmt { $$ = $1; }
					;

expression_stmt		: expression ';' { $$ = $1; }
					| ';' { $$ = NULL; }
					;
					
m_selection_stmt	: IF '(' expression ')' matched_stmt ELSE matched_stmt 
						{	StatementNode *sNode = new StatementNode(TreeNode::IfK);
							sNode->child[0] = $3;
							sNode->child[1] = $5;
							sNode->child[2] = $7;
							$$ = (TreeNode *)sNode;
						}
					;
					
u_selection_stmt	: IF '(' expression ')' statement 
						{	StatementNode *sNode = new StatementNode(TreeNode::IfK);
							sNode->child[0] = $3;
							sNode->child[1] = $5;
							$$ = (TreeNode *)sNode;
						}
					| IF '(' expression ')' matched_stmt ELSE unmatched_stmt
						{	StatementNode *sNode = new StatementNode(TreeNode::IfK);
							sNode->child[0] = $3;
							sNode->child[1] = $5;
							sNode->child[2] = $7;
							$$ = (TreeNode *)sNode;
						}
					;  
					
m_iteration_stmt	: WHILE '(' expression ')' matched_stmt
						{	StatementNode *sNode = new StatementNode(TreeNode::WhileK);
							sNode->child[0] = $3;
							sNode->child[1] = $5;
							$$ = (TreeNode *)sNode;
						}
					;
					
u_iteration_stmt	: WHILE '(' expression ')' unmatched_stmt
						{	StatementNode *sNode = new StatementNode(TreeNode::WhileK);
							$$->child[0] = $3;
							$$->child[1] = $5;
							$$ = (TreeNode *)sNode;
						}
					;
					
return_stmt			: RETURN ';' {	$$ = (TreeNode *)new StatementNode(TreeNode::ReturnK); }						
					| RETURN expression ';'
						{	StatementNode *sNode = new StatementNode(TreeNode::ReturnK);
							sNode->child[0] = $2;
							$$ = (TreeNode *)sNode;
						}
					;
					
expression			: var '=' expression
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::AssignK);
							eNode->child[0] = $1;
							eNode->child[1] = $3;
							$$ = (TreeNode *)eNode;
						}
					| simple_expression		// default							
					;
					
var					: ID
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::IdK);
							eNode->name = $1;
							$$ = (TreeNode *)eNode;
						}
					| ID '[' expression ']'
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::IdK);
							eNode->name = $1;
							eNode->child[0] = $3;
							$$ = (TreeNode *)eNode;
						}
					;

simple_expression	:  simple_expression '+' simple_expression
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::OpK);
							eNode->child[0] = $1;
							eNode->child[1] = $3;
							eNode->op = TreeNode::Plus;
							$$ = (TreeNode *)eNode;
						}
					|	simple_expression '-' simple_expression
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::OpK);
							eNode->child[0] = $1;
							eNode->child[1] = $3;
							eNode->op = TreeNode::Minus;
							$$ = (TreeNode *)eNode;
						}
					|	simple_expression '*' simple_expression
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::OpK);
							eNode->child[0] = $1;
							eNode->child[1] = $3;
							eNode->op = TreeNode::Multiply;
							$$ = (TreeNode *)eNode;
						}
					|	simple_expression '/' simple_expression
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::OpK);
							eNode->child[0] = $1;
							eNode->child[1] = $3;
							eNode->op = TreeNode::Divide;
							$$ = (TreeNode *)eNode;
						}
					|	simple_expression '%' simple_expression
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::OpK);
							eNode->child[0] = $1;
							eNode->child[1] = $3;
							eNode->op = TreeNode::Mod;
							$$ = (TreeNode *)eNode;
						}
					|	simple_expression '<' simple_expression
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::OpK);
							eNode->child[0] = $1;
							eNode->child[1] = $3;
							eNode->op = TreeNode::Lt;
							$$ = (TreeNode *)eNode;
						}
					|	simple_expression '>' simple_expression
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::OpK);
							eNode->child[0] = $1;
							eNode->child[1] = $3;
							eNode->op = TreeNode::Gt;
							$$ = (TreeNode *)eNode;
						}
					|	simple_expression LEQ simple_expression
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::OpK);
							eNode->child[0] = $1;
							eNode->child[1] = $3;
							eNode->op = TreeNode::Leq;
							$$ = (TreeNode *)eNode;
						}
					|	simple_expression GEQ simple_expression
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::OpK);
							eNode->child[0] = $1;
							eNode->child[1] = $3;
							eNode->op = TreeNode::Geq;
							$$ = (TreeNode *)eNode;
						}
					|	simple_expression EQ simple_expression
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::OpK);
							eNode->child[0] = $1;
							eNode->child[1] = $3;
							eNode->op = TreeNode::Eq;
							$$ = (TreeNode *)eNode;
						}
					|	simple_expression NEQ simple_expression
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::OpK);
							eNode->child[0] = $1;
							eNode->child[1] = $3;
							eNode->op = TreeNode::Neq;
							$$ = (TreeNode *)eNode;
						}
					|	simple_expression OR simple_expression
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::OpK);
							eNode->child[0] = $1;
							eNode->child[1] = $3;
							eNode->op = TreeNode::Or;
							$$ = (TreeNode *)eNode;
						}
					|	simple_expression AND simple_expression
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::OpK);
							eNode->child[0] = $1;
							eNode->child[1] = $3;
							eNode->op = TreeNode::And;
							$$ = (TreeNode *)eNode;
						}
					| '-' simple_expression %prec UMINUS
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::OpK);
							eNode->child[0] = $2;
							eNode->op = TreeNode::Minus;
							$$ = (TreeNode *)eNode;
						}
					| '!' simple_expression
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::OpK);
							eNode->child[0] = $2;
							eNode->op = TreeNode::Not;
							$$ = (TreeNode *)eNode;
						}				
					| factor
					;				
					
factor				: '(' expression ')'
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::OpK);
							eNode->child[0] = $2;
							$$ = (TreeNode *)eNode;
						}
					| var
					| call
					| constant
					;
					
constant			: NUM 
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::ConstK);
							eNode->val = $1;
							$$ = (TreeNode *)eNode;
						}
					| TRUE
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::ConstK);
							eNode->val = 1;		// value of true
							eNode->isBool = true;
							$$ = (TreeNode *)eNode;
						}
					| FALSE 
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::ConstK);
							eNode->val = 0;		// value of false
							eNode->isBool = true;
							$$ = (TreeNode *)eNode;
						}
					;
					
call				: ID '(' args ')'
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::CallK);
							eNode->name = $1;
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

int main(int argc, char *argv[]) {
		
	char *progname, *infile;
	extern FILE *yyin;
	bool fileOpen=false;
	char c;
	
	progname = argv[0];
	
	yydebug = 0;
	while ((c = getopt(argc, argv, "d"))!= EOF)
	   switch (c) {
	   case	'd':
	      yydebug = 1;
	      break;
	   }
	
	if (argc > 2 && !yydebug || argc > 3) {
		cerr << "usage: " << progname << " [-d] [infile]\n";
		exit(1);
	}
	if (argc == 2 && !yydebug || argc == 3 && yydebug) {
		if (argc == 2 && !yydebug)
			infile = argv[1];
		else
			infile = argv[2];
			
		/* open infile for reading */
		yyin = fopen(infile, "r");
		if (yyin == NULL) /* open failed */
		{
			cerr << progname << ": cannot open " << infile << endl;
			exit(1);
		} 
		else 
		{
			fileOpen = true;
		}			
	}
		
	yyparse();
	
	savedTree->PrintTree(cout);
		
	//if (fileOpen) close(infile);
}
