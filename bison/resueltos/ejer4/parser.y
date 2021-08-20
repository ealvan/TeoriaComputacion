%{
#include <stdio.h>
int yylex();
int yyerror (char *s);
%}
%token ARTICULO
%token SUJETO
%%
cadena: ARTICULO SUJETO '\n' { printf("Imprime articulo y sujeto \n");};
%%
int yyerror (char *s){
 printf("%s \n",s);
 return 1;
}
int main(int argc ,char ** argv) {
 yyparse();
 return 0;
}