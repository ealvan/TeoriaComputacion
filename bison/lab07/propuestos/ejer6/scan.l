%{
#include "parser.tab.h"
%}
LETRA [a-zA-Z]
DIGITO [0-9]

VARIABLE {LETRA}{1}[a-zA-Z0-9]*
NUMERO {DIGITO}+(\.{DIGITO}+)?
%%
{VARIABLE} {return VAR;}
{NUMERO} {return NUM;}
"+" {return OP;}
\n {return FIN;}
[ \t] {/*ignorar*/;}
%%
int yywrap(){}