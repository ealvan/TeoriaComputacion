%{
#include "parser.tab.h"
%}
%%
"El"|"La" {return ARTICULO; };
\n {return *yytext; };
%%
int yywrap(){}



