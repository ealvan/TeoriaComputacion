%{
#include <stdio.h>
int yylex();
int yyerror (char *s);
%}
%token ARTICULO
%token SUJETO
%token VERBO
%%
cadena: ARTICULO SUJETO VERBO '\n' { printf("Imprime articulo, sujeto y verbo \n");};
%%
int yyerror (char *s){
 printf("%s \n",s);
 return 1;
}
int main(int argc ,char ** argv) {
 yyparse();
 return 0;
}