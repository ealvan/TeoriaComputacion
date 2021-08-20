%{

#include <stdio.h>

/*
Declaramos las funciones en la parte de definiciones
*/
int yylex();
int yyerror(const char *s);

%}
/*Declarando tokens*/
%token IF
%token ABRIR
%token CERRAR
%token VAR_NAME
%token OPERATOR
%token NUMBER
%token FIN
/*
str es el simbolo no terminal
y aceptamos IF ABRIR VAR_NAME OPERATOR NUMBER  CERRAR FIN
ABRIR "("
IF es el if de condicional
VAR_NAME es ek nombre de la variable
OPERATOR es el nombre del oprador < > <= != >=
NUMBER es el numero
CERRAR es el ")"
FIN que es el break line
*/
%%

str : | str IF ABRIR VAR_NAME OPERATOR NUMBER  CERRAR FIN {printf("Es correcto!!\n");}
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

