%{
#include "parser.tab.h"
/*el archivo parser.tab.h contiene nuestra tabla
de definiciones de los tokens que definimos en parser.y
es como un puente de comunicacion entre parser.y y scanner.l
(("DO"|"RE"|"MI"|"FA"|"SOL"|"LA"|"SI"|"DO")(" ")?){5}
admitimos cualquier combinacionde 5 notas musicales,
y manifestamos que puede tener un espacio o tab opcionalmente
*/
%}
/*Declaramos para minuscula y mayuscula*/
DO "DO"|"do"
RE "RE"|"re"
MI "MI"|"mi"
FA "FA"|"fa"
SOL "SOL"|"sol"
LA "LA"|"la"
SI  "SI"|"si"
/*expr Regular genera, donde admitimos cualquiera de las notas musicales*/
NOTA_MUSICAL ({DO}|{RE}|{MI}|{FA}|{SOL}|{LA}|{SI})
/*puede tener uno o mas tabs o espacion, pero es opcional ponerlos*/
ESPACIO ((" ")*|("\t")*)?
%%

({ESPACIO}{NOTA_MUSICAL}{ESPACIO}){5} { return NOTA; }
\n { return FIN; }
%%

//necesitamos implementar esta funcion, ya que el parser.y lo requiere
int yywrap(){}