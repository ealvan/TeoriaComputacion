%{
#include <stdio.h>
int yylex();
int yyerror(const char *s);
int as = 0;
int bs = 0;
%}

%token A 
%token B 
%token FIN
%%

cad: exp FIN { if(as == bs) printf("Es correcto!\n");} 
;
exp: t | exp  A {as++;}| exp B {bs++;} 
;

t: A  {as++;}| B {bs++;} 
;

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