
%{
#include "parser.tab.h"
%}
LETRA [a-zA-Z]
DIGITO [0-9]
/*El pr0blema nos dice que debe empezar por una letra*/
/*pero puede tener numero o guion bajo luego*/
VARIABLE {LETRA}({LETRA}|{DIGITO}|"_")*
%%

{VARIABLE} { return VAR; }
{DIGITO}+  { return INT; }
"="        { return EQUAL; }
[ \t]       {/*nada*/}
"\n"       { return FIN; }
%%
int yywrap(){}