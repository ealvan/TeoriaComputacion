%{
#include <stdio.h>
int yylex();
int yyerror(const char *s);
%}

/* declarando tokens */
%token BB
%token FIN
%%
cadena: BB FIN {printf("Es correcto\n");} 
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
