%{
#include "parser.tab.h"

%}
/*Declaramos las ecpresiones regulares*/
/*luego retornamos nuestros tokens */
LETRA [a-zA-Z]
DIGITO [0-9]
VARIABLE {LETRA}({LETRA}|{DIGITO}|"_")*
TIPO "int"|"double"|"string"
%%
{TIPO}      { return TYPE; }
{VARIABLE}  { return VAR; }
";"         { return PUNTO_COMA; }
[ \t]       { /*ignorar*/ }
"\n"        { return FIN; }
%%
int yywrap(){}
