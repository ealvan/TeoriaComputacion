%{
#include "parser.tab.h"
int yyparse();
%}
%%
[aA] {return A;}
\n {return NL;}
. return *yytext;
%%
int yywrap(void){
yyparse();
return 0;
}