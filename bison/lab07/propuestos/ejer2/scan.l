%{

#include "parser.tab.h"

%}

%%

"a" {return A;}
"b" {return B;}
\n {return FIN;}
%%

int yywrap(){}