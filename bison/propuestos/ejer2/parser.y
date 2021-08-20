%{

#include <stdio.h>
/*
Declaramos las funciones en la parte de definiciones
*/
int yylex();
int yyerror(const char *s);

%}
/*Declarando tokens*/
%token NUMERO_LETRA
%token ABRIR
%token CERRAR
/*str es nuestro simbolo son terminal y su regla numero 1
 es no hacer nada y aceptar la cadena vacia 
 La regla nro 2: Es aceptar ABRIR luego NUMER_LETRA luego CERRAR
  y sua accion sera decirnos "Es correcto."
toda produccion termina en ;
 */
%%
str: {;}| str ABRIR NUMERO_LETRA CERRAR {printf("Es correcto \n");}
;
%%

/*
Implementamos las funciones que declaramos en la 1ra parte
*/
int main(int argc, char **argv)
{
  yyparse();
  return 0;
}

int yyerror(const char *s)
{
  fprintf(stderr, "error: %s\n", s);
  return 1;
}
