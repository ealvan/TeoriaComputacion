%{
#include "parser.tab.h"
int yyparse();
%}
ART El|La|Los|Las|Un|Unos|Unas
%%
{ART} {return ARTICULO;}
[a-z]{3} {return SUJETO;}
come {return VERBO;}
\n return *yytext;
[ \t] ;
%%
int yywrap(void){
yyparse();
return 0;
}


