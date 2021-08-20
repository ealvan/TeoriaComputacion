%{
#include <stdio.h>
int yylex();
int yyerror(const char *s);
%}
/* decalrando TOKENS*/
%token ARTICULO
//cadena es simbolo y solo tiene una regla
//la cual es un ARTICULO que termien en newline
//rule's action unique is print message "se imprime el tect0"
%%
cadena: 
    ARTICULO ',' ARTICULO '\n' {printf("Imprime dos articulos,sep por comas.\n");};
%%
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