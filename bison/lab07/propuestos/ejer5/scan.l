%{
#include "parser.tab.h"
%}
LETRA [a-zA-Z]
VARIABLE {LETRA}{1,}

%%
{VARIABLE} {return VAR;}
"+" {return OP;}
\n {return FIN;}
[ \t] {/*ignorar*/;}
%%
int yywrap(){}