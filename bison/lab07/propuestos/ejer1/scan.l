%{

#include "parser.tab.h"

%}

%%

"bb"      {return BB;}
\n        {return FIN;}
%%

int yywrap(){}

