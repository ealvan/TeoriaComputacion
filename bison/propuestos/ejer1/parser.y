%{
#include <stdio.h>
/*
Declaramos las funciones en la parte de definiciones
*/
int yylex();
int yyerror (char *s);
%}
/*Declarando tokens*/
%token NOTA
%token FIN
/*nota : | nota NOTA FIN {printf("CORRECTO\n");} es mi regla de produccion 
donde nota es mi simbolo no terminal,tambien hay dos reglas
la primera no hacemos nada, y aceptamos cadena vacia
en la segunda aceptamos el toke NOTA y FIN , 
y la accion a llevar a cabo es:
{printf("CORRECTO\n");}
*/
%%
nota : | nota NOTA FIN {printf("ES NOTA MUSICAL\n"); }
;  
%%

/*
Implementamos las funciones que declaramos en la 1ra parte
*/

int yyerror (char *s){
 printf("%s \n",s);
 return 1;
}
int main(int argc ,char ** argv) {
 yyparse();
 return 0;
}