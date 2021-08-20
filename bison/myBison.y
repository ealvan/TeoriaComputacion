%{
#include <stdio.h>
#define YYERROR_VERBOSE
int yylex();
int yyerror (const char *s);
%}
%token ARTICULO
%token SUJETO
%%
cadena: ARTICULO ',' ARTICULO '\n' { printf("Imprime dos articulos separados por comas \n");};

%%

int main(int argc ,char ** argv) {
    yyparse();
    return 0;
}
int yyerror (const char *s){
    printf("%s \n",s);
    return 1;
}