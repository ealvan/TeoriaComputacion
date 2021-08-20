%{
#include <stdio.h>
int yylex();
int yyerror (char *s);
%}
%token A
%token B
%token FIN
%%
exp: s FIN {printf("Es correcto !!\n");}
;
s: t | A s B B 
;
t: | A B B
;

%%
int yyerror (char *s){
 printf("%s \n",s);
 return 1;
}
int main(int argc, char ** argv) {
 yyparse();
 return 0;
}