%{
#include "parser.tab.h"
int yyparse();
%}
%%
Yo {return PRON;}
\n {return NL;}
. return *yytext;
%%
int yywrap(void){
yyparse();
return 0;
}