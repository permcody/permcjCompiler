%{
#include <stdlib.h>
#include <string.h>
#include "c-.tab.h"

uint lineNo = 1;
%}

ID	[A-Za-z]+
NUM	[0-9]+

%%		
		
"!="				{ return NEQ; }
"<="				{ return LEQ; } 
"=="				{ return EQ; }
">="				{ return GEQ; }
"&&"				{ return AND; }
"||"				{ return OR; }

bool				{ return BOOL; }
else				{ return ELSE; }
if					{ return IF; }
int					{ return INT; }
void				{ return VOID; }
while				{ return WHILE; }
return				{ return RETURN; }
true				{ yylval.cvalue = 'T';
					  return TRUE; 
					}
false				{ yylval.cvalue = 'F';
					  return FALSE; 
					}
{NUM}+				{ yylval.lvalue = atol((char *)yytext);
					  return NUM; 
					}
{ID}+				{ yylval.svalue = new char[strlen(yytext)];
					  strcpy(yylval.svalue, yytext);
					  return ID; 
					}
\n					{ lineNo++; }					
[ \t]+		 		;
\/\/.*				;
[-\]<>;=[,{}()+*/!]	{ return yytext[0]; }
.					{ yylval.cvalue = yytext[0];				  
					  return ERROR; 
					}
%%

