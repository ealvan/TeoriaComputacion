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
%token INT
%token EQUAL
%token FIN
/*Declaramos str como simbolo no terminal
  El cual se llama recursivamente, su regla nro2
  admite VAR EQUAL INT FIN
VAR:  es la variable
INT ; es el entero
EQUAL es "="
FIN es el break line \n
y su accion es imprimir "Es correcto. "
*/
%%

str: | str VAR EQUAL INT FIN {printf("Es correcto!\n");}
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
