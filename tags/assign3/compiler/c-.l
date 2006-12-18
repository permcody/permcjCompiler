%{
#include <cstdlib>
#include <cstring>
using namespace std;

#include "globals.h"
#include "c-.tab.h"

unsigned int currentLineNo = 1;
char currentToken[255] = "\0";

void SaveToken(bool saveLineno);
%}

ID	[A-Za-z]+
NUM	[0-9]+

%%		
		
"!="				{ SaveToken(true); return NEQ; }
"<="				{ SaveToken(true); return LEQ; } 
"=="				{ SaveToken(true); return EQ; }
">="				{ SaveToken(true); return GEQ; }
"&&"				{ SaveToken(true); return AND; }
"||"				{ SaveToken(true); return OR; }

if					{ SaveToken(true); return IF; }
else				{ SaveToken(true); return ELSE; }
while				{ SaveToken(true); return WHILE; }
return				{ SaveToken(true); return RETURN; }
true				{ SaveToken(true); return TRUE; }
false				{ SaveToken(true); return FALSE; }
bool				{ SaveToken(true); return BOOL;	}
void				{ SaveToken(true); return VOID;	}					  
int					{ SaveToken(true); return INT; }
					  
{NUM}+				{ SaveToken(false);
					  yylval.fPtr = new FlexStruct();
					  yylval.fPtr->number = atol((char *)yytext);
					  yylval.fPtr->lineno = currentLineNo;	
					  return NUM; 
					}
{ID}+				{ SaveToken(false);
					  yylval.fPtr = new FlexStruct();
					  yylval.fPtr->identifier = new char[strlen(yytext)];
					  strcpy(yylval.fPtr->identifier, yytext);
					  yylval.fPtr->lineno = currentLineNo;					  					  
					  return ID; 
					}
\n					{ currentLineNo++; }					
[ \t]+		 		;
\/\/.*				;
[-%\]<>;=[,{}()+*/!] { SaveToken(true); return yytext[0]; }
.					 { SaveToken(true); return ERROR; }
%%

void SaveToken(bool saveLineno)
{
	strcpy(currentToken, yytext);
	if (saveLineno)
		yylval.lineno = currentLineNo;
}

