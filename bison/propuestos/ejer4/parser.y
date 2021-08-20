%{
#include <stdio.h>
/*
Declaramos las funciones en la parte de definiciones
*/
int yylex();
int yyerror(const char *s);
%}
/*Declarando tokens*/
%token VAR
%token FIN
%token TYPE
%token PUNTO_COMA
/*
tenermos nuestro simbolo no termina
str, el cual tiene dos reglas
la segunda acepta : str TYPE VAR PUNTO_COMA FIN
donde
TYPE : es el tipo de variable
VAR : es el nombre de la variable
PUNTO_COMA: ";"
FIN : el break line \n
y su accion es impirmir es correcto
*/
%%

str: | str TYPE VAR PUNTO_COMA FIN {printf("Es correcto!\n");}
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
