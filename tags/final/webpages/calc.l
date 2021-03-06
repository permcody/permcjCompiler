%{
#include <stdlib.h>
#include "calc.tab.h"
%}

%%
[0-9]+|[0-9]*\.[0-9]+   { yylval.dvalue = atof((char *)yytext); 
                          return NUMBER; 
                        }

[a-z]                   { yylval.varindex = yytext[0] - 'a'; 
                          return NAME; 
                        }

[ \t]                   ;

\n|.                    { return yytext[0]; 
                        }
%%

