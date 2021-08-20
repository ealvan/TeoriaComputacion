%{
#include "myBison.tab.h"
int yyparse();
%}
%%
El|La|Los|Las|Un|Unos|Unas {return ARTICULO;}

Edsel {return SUJETO;}

.|\n return *yytext;
%%
int yywrap(void){
    yyparse();
    return 0;
}

