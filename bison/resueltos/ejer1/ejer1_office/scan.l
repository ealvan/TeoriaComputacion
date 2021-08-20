%{
#include "parser.tab.h"
int yyparse();
%}
%%
El {return ARTICULO;}
\n {return EOL;}
[ \t] ;
%%
int yywrap(void){
yyparse();
return 0;
}