%{
#include <stdio.h>
int yylex();
int yyerror (char *s);
%}
%token ARTICULO
%token EOL
%%
cadena: ARTICULO EOL | cadena  ARTICULO EOL {printf("Se imprime un texto \n");};
%%
int yyerror (char *s){
 printf("%s \n",s);
 return 1;
}
int main(int argc ,char ** argv) {
 yyparse();
 return 0;
}