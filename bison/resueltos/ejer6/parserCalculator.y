%{
#include <stdio.h>
int yylex();
int yyerror (char *s);
%}
%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL
%%
calclist: | calclist exp EOL { printf("\n"); } ;

exp: factor
| exp ADD factor { $$ = $1 + $3; ;printf("= %d ", $$);}
| exp SUB factor { $$ = $1 - $3; ;printf("= %d ", $$);}
;

factor: term
| factor MUL term { $$ = $1 * $3; ;printf("= %d ",$$);}
| factor DIV term { $$ = $1 / $3; ;printf("= %d ",$$);} 
;
term: NUMBER;

%%
int yyerror (char *s){
 printf("%s \n",s);
 return 1;
}
int main(int argc, char ** argv) {
 yyparse();
 return 0;
}