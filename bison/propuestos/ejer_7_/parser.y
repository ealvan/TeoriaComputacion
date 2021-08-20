%{

#include <stdio.h>
/*
Declaramos las funciones en la parte de definiciones
*/
int yylex();
int yyerror(const char *s);

%}
/*Declarando tokens*/
%token EQUAL
%token IF
%token ABRIR
%token CERRAR
%token VAR_NAME
%token OPERATOR
%token NUMBER
%token THEN
%token RETURN 
%token BOOL
%token FIN

%%
str: | str result FIN {printf("Es correcto\n");}
;
result: VAR_NAME EQUAL NUMBER exp
;

exp: THEN RETURN BOOL 
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
