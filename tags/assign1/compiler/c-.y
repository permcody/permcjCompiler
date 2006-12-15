%{ 
#include <iostream>
using namespace std;


#ifdef CPLUSPLUS
extern int yylex();
#endif

extern uint lineNo;

// flex requires that you supply this function
void yyerror(const char *msg)
{
      cout << "ERROR(PARSER): " << msg << '\n';
}

%}

%union {
	long lvalue;
	char cvalue;
	char *svalue;
}

%token NEQ LEQ EQ GEQ AND OR BOOL ELSE IF INT RETURN VOID WHILE 
%token <svalue> ID
%token <lvalue> NUM
%token <cvalue> TRUE FALSE ERROR

%%

inTheGrammar : validToken inTheGrammar
			 | validToken
             ;
             
validToken : NEQ			{ cout << "Line " << lineNo << " Token: NEQ\n"; }
		   | LEQ			{ cout << "Line " << lineNo << " Token: LEQ\n"; }
		   | EQ				{ cout << "Line " << lineNo << " Token: EQ\n"; }
		   | GEQ			{ cout << "Line " << lineNo << " Token: GEQ\n"; }
		   | AND			{ cout << "Line " << lineNo << " Token: AND\n"; }
		   | OR				{ cout << "Line " << lineNo << " Token: OR\n"; }
		   | BOOL			{ cout << "Line " << lineNo << " Token: BOOL\n"; }
		   | ELSE			{ cout << "Line " << lineNo << " Token: ELSE\n"; }		   
		   | IF				{ cout << "Line " << lineNo << " Token: IF\n"; }
		   | INT			{ cout << "Line " << lineNo << " Token: INT\n"; }
		   | RETURN			{ cout << "Line " << lineNo << " Token: RETURN\n"; }		   
		   | VOID			{ cout << "Line " << lineNo << " Token: VOID\n"; }
		   | WHILE			{ cout << "Line " << lineNo << " Token: WHILE\n"; }
		   | TRUE			{ cout << "Line " << lineNo << " Token: TRUE Value: " << $1 << '\n'; }
		   | FALSE			{ cout << "Line " << lineNo << " Token: FALSE Value: " << $1 << '\n'; }
		   | ID				{ cout << "Line " << 
lineNo << " Token: ID Value: " << $1 << '\n'; delete [] $1; }
		   | NUM			{ cout << "Line " << lineNo << " Token: NUM Value: " << $1 << '\n'; }
		   | '<'			{ cout << "Line " << lineNo << " Token: <" << '\n'; }
		   | '>'			{ cout << "Line " << lineNo << " Token: >" << '\n'; }
		   | ';'			{ cout << "Line " << lineNo << " Token: ;" << '\n'; }
		   | '='			{ cout << "Line " << lineNo << " Token: =" << '\n'; }
		   | '['			{ cout << "Line " << lineNo << " Token: [" << '\n'; }
		   | ']'			{ cout << "Line " << lineNo << " Token: ]" << '\n'; }
		   | ','			{ cout << "Line " << lineNo << " Token: ," << '\n'; }
		   | '{'			{ cout << "Line " << lineNo << " Token: {" << '\n'; }
		   | '}'			{ cout << "Line " << lineNo << " Token: }" << '\n'; }
		   | '('			{ cout << "Line " << lineNo << " Token: (" << '\n'; }
		   | ')'			{ cout << "Line " << lineNo << " Token: )" << '\n'; }
		   | '+'			{ cout << "Line " << lineNo << " Token: +" << '\n'; }
		   | '-'			{ cout << "Line " << lineNo << " Token: -" << '\n'; }
		   | '*'			{ cout << "Line " << lineNo << " Token: *" << '\n'; }
		   | '/'			{ cout << "Line " << lineNo << " Token: /" << '\n'; }
		   | '!'			{ cout << "Line " << lineNo << " Token: !" << '\n'; }	
		   | ERROR			{ cout << "Line " << lineNo << " Error Value: " << $1 << "'\n"; }	   
		   ;

%%

int main(int argc, char *argv[]) {
		
	char *progname, *infile;
	extern FILE *yyin;
	
	progname = argv[0];
	
	if (argc > 2) {
		cerr << "usage: " << progname << " [infile]\n";
		exit(1);
	}
	if (argc > 1) {
		infile = argv[1];
		/* open infile for reading */
		yyin = fopen(infile, "r");
		if (yyin == NULL) /* open failed */
		{
			cerr << progname << ": cannot open " << infile << endl;
			exit(1);
		}
	}	
		
	return yyparse();	
}
