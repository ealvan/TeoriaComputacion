%{
#include "parser.tab.h"
%}

%%
"a" {return A;}
"b" {return B;}
\n  {return FIN;}
[ \t\f] {/*Ignorar*/}
%%

int yywrap(){
    return 1;
}