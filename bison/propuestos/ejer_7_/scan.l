%{

#include "parser.tab.h"

%}
/*declarando las expresiones regulares*/

LETRA [a-zA-Z]

DIGITO [0-9]



OPERADOR (("="|">"|"<"|"!")("="))|(">"|"<")

NUMERO {DIGITO}+

%%
"if"          {return IF;}
"("         {return ABRIR;}
")"         {return CERRAR;}
{OPERADOR} {return OPERATOR;}
"then"      {return THEN;}
"true"|"false" {return BOOL;}
"return"    {return RETURN;}
{LETRA}+ { return VAR_NAME;}

{NUMERO}    { return NUMBER;}
[ \t]       {/*ignorar*/}
"\n"        { return FIN; }

%%

int yywrap(){}