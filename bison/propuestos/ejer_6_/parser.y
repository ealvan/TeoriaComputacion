%{

#include <stdio.h>
/*
Declaramos las funciones en la parte de definiciones
*/
int yylex();
int yyerror(const char *s);

%}
/*Declarando tokens*/
%token PARCIAL
%token OP
%token FIN
%%
str: | str result FIN {printf("Es correcto\n");}
;
result: PARCIAL OP PARCIAL OP PARCIAL {
    if($1 <= 20 && $2 <= 20 && $3 <= 20 && $1>=0 && $2>=0 && $3>=0){
        $$ = ($1 + $2 + $3)/3; 
        printf("= %d\n", $$);
    }else{
        printf("Alguna de las notas no es valida\n");
    }
        
    } 
;
%%

/*
Implementamos las funciones que declaramos en la 1ra parte
*/
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
