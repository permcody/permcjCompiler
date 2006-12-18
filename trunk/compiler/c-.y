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
%token <number> NUM INT VOID BOOL NEQ LEQ EQ GEQ AND OR

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
				unary_expression
				factor
				call
				constant
				args
				arg_list

%type <number>	type_specifier
				op
				unaryop
				
%left '<' '>' LEQ GEQ EQ NEQ
%left '+' '-' OR
%left '*' '/' '%' AND

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
					
var_declaration		: type_specifier ID { savedName = copyString($2); }  ';' 
						{	DeclarationNode *dNode = new DeclarationNode(TreeNode::VarK);
							dNode->type = (TreeNode::Types)$1;					// save the type
							dNode->name = savedName;			// save the ID
							$$ = (TreeNode *)dNode;
						}
					| type_specifier ID { savedName = copyString($2); } '[' NUM { savedNumber = $5; } ']' ';' 
						{	DeclarationNode *dNode = new DeclarationNode(TreeNode::VarK);
							dNode->type = (TreeNode::Types)$1;				// save the type
							dNode->name = savedName;		// save the ID
							dNode->isArray = true;
							dNode->size = savedNumber;		// save the array size
							$$ = (TreeNode *)dNode;
						}							
					;
					
type_specifier		: INT	{ $$ = TreeNode::Int; }	
					| VOID	{ $$ = TreeNode::Void; }
					| BOOL	{ $$ = TreeNode::Bool; }
					;
					
fun_declaration		: type_specifier ID { savedName = copyString($2); } '(' params ')' compound_stmt 
						{	DeclarationNode *dNode = new DeclarationNode(TreeNode::FuncK);
							dNode->type = (TreeNode::Types)$1;					// save the type
							dNode->name = savedName;			// save the ID
							dNode->child[0] = $5;				// params are the first child of the function declaration
							dNode->child[1] = $7;				// statements are the second child of the function declaration							
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
							dNode->name = copyString($2);
							$$ = (TreeNode *)dNode;
						}
					| type_specifier ID { savedName = copyString($2); } '[' ']' 
						{	DeclarationNode *dNode = new DeclarationNode(TreeNode::ParamK);
							dNode->type = (TreeNode::Types)$1;
							dNode->name = savedName;
							dNode->isArray = true;
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
					| simple_expression
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::SimpK);		
							eNode->child[0] = $1;				// check this out later
							$$ = (TreeNode *)eNode;
						}		
					;
					
var					: ID
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::IdK);
							eNode->name = $1;
							$$ = (TreeNode *)eNode;
						}
					| ID { savedName = copyString($1); } '[' expression ']'
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::IdK);
							eNode->name = savedName;
							eNode->child[0] = $4;
							$$ = (TreeNode *)eNode;
						}
					;

simple_expression	: simple_expression op unary_expression
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::OpK);
							eNode->child[0] = $1;
							eNode->child[1] = $3;
							eNode->op = (TreeNode::Ops)$2;
							$$ = (TreeNode *)eNode;
						}
					| unary_expression						// default action
					;
					
op					: LEQ { $$ = TreeNode::Leq; }
					| '<' { $$ = TreeNode::Lt; }
					| '>' { $$ = TreeNode::Gt; }
					| GEQ { $$ = TreeNode::Geq; }
					| EQ  { $$ = TreeNode::Eq; }
					| NEQ { $$ = TreeNode::Neq; }
					| '+' { $$ = TreeNode::Plus; }	
					| '-' { $$ = TreeNode::Minus; }
					| OR  { $$ = TreeNode::Or; }
					| '*' { $$ = TreeNode::Multiply; }
					| '/' { $$ = TreeNode::Divide; }
					| '%' { $$ = TreeNode::Mod; }
					| AND { $$ = TreeNode::And; }
					;					
					
unary_expression	: unaryop unary_expression
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::OpK);
							eNode->child[0] = $2;
							eNode->op = (TreeNode::Ops)$1;
							$$ = (TreeNode *)eNode;
						}
					| factor
					;
					
unaryop				: '!' { $$ = TreeNode::Not; }						
					| '-' { $$ = TreeNode::Minus; }
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
					
call				: ID { savedName = copyString($1); } '(' args ')'
						{	ExpressionNode *eNode = new ExpressionNode(TreeNode::CallK);
							eNode->name = savedName;
                            eNode->child[0] = $4;
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
	if (argc > 1) {
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
