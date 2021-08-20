%{

#include "parser.tab.h"
/*
[a-zA-Z0-9 ]+
aceptamos el espacio tambien para
que podamos escribir texto no unido con "_"
y comillas para permitir en fasis en el texto
*/
%}
%%
"(" {return ABRIR;}
")" {return CERRAR;}
[a-zA-Z0-9 \"]+ {return NUMERO_LETRA;}
%%

int yywrap(){}