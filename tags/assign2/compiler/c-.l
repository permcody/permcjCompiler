%{
#include <cstdlib>
#include <cstring>
using namespace std;

#include "globals.h"
#include "c-.tab.h"

unsigned int currentLineNo = 1;
char currentToken[255] = "\0";

void SaveToken();
%}

ID	[A-Za-z]+
NUM	[0-9]+

%%		
		
"!="				{ SaveToken(); return NEQ; }
"<="				{ SaveToken(); return LEQ; } 
"=="				{ SaveToken(); return EQ; }
">="				{ SaveToken(); return GEQ; }
"&&"				{ SaveToken(); return AND; }
"||"				{ SaveToken(); return OR; }

bool				{ SaveToken(); return BOOL; }
else				{ SaveToken(); return ELSE; }
if					{ SaveToken(); return IF; }
int					{ SaveToken(); return INT; }
void				{ SaveToken(); return VOID; }
while				{ SaveToken(); return WHILE; }
return				{ SaveToken(); return RETURN; }
true				{ SaveToken(); return TRUE; }
false				{ SaveToken(); return FALSE; }
{NUM}+				{ SaveToken();
					  yylval.number = atol((char *)yytext);
					  // currentNumber = yylval.number;
					  return NUM; 
					}
{ID}+				{ SaveToken();
					  yylval.identifier = new char[strlen(yytext)];
					  strcpy(yylval.identifier, yytext);					  
					  return ID; 
					}
\n					{ currentLineNo++; }					
[ \t]+		 		;
\/\/.*				;
[-%\]<>;=[,{}()+*/!] { SaveToken(); return yytext[0]; }
.					{ SaveToken(); return ERROR; }
%%

void SaveToken()
{
	strcpy(currentToken, yytext);
}

