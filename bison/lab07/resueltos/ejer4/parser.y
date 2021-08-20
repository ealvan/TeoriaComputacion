%{
#include <stdio.h>
int yylex();
int yyerror (char *s);
%}
%token A
%token B
%token NL
%%
cadena: | cadena S B NL {printf("Se imprimio una cadena \n");}
;
S: A S | 
;
%%
int yyerror (char *s){
 printf("%s \n",s);
 return 1;
}
int main(int argc ,char ** argv) {
 yyparse();
 return 0;
}