%{
#include "parser.tab.h"
int yyparse();
%}
ART El|La|Los|Las|Un|Unos|Unas
%%
{ART} {return ARTICULO;}
[a-z]+ {return SUJETO;}
\n return *yytext;
%%
int yywrap(void){
yyparse();
return 0;
}


