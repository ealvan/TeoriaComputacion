%{

#include "parser.tab.h"
int yywrap();
/*

como usamos el %union
ahora tenemos que especificar los tipos de
datos que almacenara, por cada operador dado
si es % debemos retornar MOD, para definir
que es "%" la operacion y asi sucesivamente
el yyval.var = yytext[0], recupera el primer caracter
del valor aceptado en esa expresion regular
y lo asigna al tipo de de dato <var>

"%" { yylval.var = yytext[0]; return MOD; }
"^" { yylval.var = yytext[0]; return POW; }

//aqui aceptamos tambien nuemros negativos, por eso
es opcional el "-"?
tambien recuperamos todo lo aceptado por esta expresio n regular
y lo convertimos con la funcion atof, a cual convierte
string a double y retornamos la definicion del token NUMBER
("-")?{NUMERO} { yylval.myval = atof(yytext); return NUMBER; }

"exit" { return EXIT; }//exit para salir si todo antes va bien
\n { return FIN; }//breka line
[ \t] {ignoramos esto}
. { printf("No se reconoce %c\n", *yytext); }

Cuando devolvemos un token, en realidad devolvemos un numero
el cual esta definido en "parser.tab.h", ese numero nos dice 
que tipo de token estamos hablando, es decir
si escribimos "%\n"
significa que retornara return MOD y FIN 
y MOD es el numero 264 y FIN es el numero 259
por decir algun numero, y cada vez que estamos en una regla
se guia parser.y para especificar que token estamos pulsando.
*/
%}
DIGITO [0-9]
NUMERO {DIGITO}+(\.{DIGITO}+)?
%%

"+" { yylval.var = yytext[0]; return ADD; }
"-" { yylval.var = yytext[0]; return SUB; }
"*" { yylval.var = yytext[0]; return MUL; }
"/" { yylval.var = yytext[0]; return DIV; }
"%" { yylval.var = yytext[0]; return MOD; }
"^" { yylval.var = yytext[0]; return POW; }
("-")?{NUMERO} { yylval.myval = atof(yytext); return NUMBER; }
"exit" { return EXIT; }
\n { return FIN; }
[ \t] {/*Ignorar*/ }
. { printf("No se reconoce %c\n", *yytext); }

%%

int yywrap(){
    return 1;
}