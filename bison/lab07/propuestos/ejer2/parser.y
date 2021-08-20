%{
#include <stdio.h>
int yylex();
int yyerror(const char *s);
int as = 0;
int bs = 0;
%}
//tokens
%token A 
%token B 
%token FIN
//el probleam dice
/*
cadenas pares de letras “a” JUNTO con cadenas pares de letras “b’
por lo tanto no existe abab, abbaaababa, babab
*/
%%

cad: t p FIN {printf("Es correcto!\n");} 
;
t: |A A t
;
p: |B B p
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