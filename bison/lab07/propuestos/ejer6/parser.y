%{
#include <stdio.h>
int yylex();
int yyerror(const char *s);
%}

%token VAR
%token OP
%token NUM
%token FIN

%%

cadena: NUM OP VAR FIN {printf("Es correcto\n");} 
;

%%


int main(int argc, char **argv){
  yyparse();
  return 0;
}

int yyerror(const char *s){
  fprintf(stderr, "error: %s\n", s);
  return 1;
}