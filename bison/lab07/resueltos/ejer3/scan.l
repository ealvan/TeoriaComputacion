%{
#include "parser.tab.h"
int yyparse();
%}
%%
[aA] {return A;}
[Bb] {return B;}
\n {return NL;}
. return *yytext;
%%
int yywrap(void){
yyparse();
return 0;
}
