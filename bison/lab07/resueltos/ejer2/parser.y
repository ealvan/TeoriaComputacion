%{
#include <stdio.h>
int yylex();
int yyerror (char *s);
%}
%token A
%token NL
%%
cadena: S NL {printf("Se imprimio una cadena \n");}
;
S: S A | A
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