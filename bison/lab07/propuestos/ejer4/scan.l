%{
#include "parser.tab.h"
%}
DIGITO [0-9]
NUMERO {DIGITO}+(\.{DIGITO}+)?
%%
{NUMERO} {return NUM;}
"+" {return OP;}
\n {return FIN;}
[ \t] {/*ignorar*/;}
%%
int yywrap(){}