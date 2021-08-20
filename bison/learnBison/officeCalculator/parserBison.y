/* simplest version of calculator */
%{
#include <stdio.h>
int yylex();
int yyerror(const char *s);
%}

/* declare tokens */
%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL
%token OP CP
//openParenthesis and CloseParenthesis
/*calclist, exp, factor, term, are SIMBOLS 
ademas las RULES,reglas que se manejan son
las que aprecen asi:
calclist: RULE1 | RULE2 { ACTION IN RULE2 }

ACTION IN RULE2 : prints the value of the "exp" in $2
calclist: / RULE_1/  | calclist exp EOL { printf("= %d\n", $2);
                                          ACTION IN RULE_2 }
;
lOS VALORES DE los TOKENS son lo que fuera que este en "yylval"
cuando el escaner retorna el TOKEN NUMBER y los demas tokens estan
guardados sus significados y valores en parserBison.tab.h.


Cada SIMBOL en una reglaRULE tiene su propio valor
El valor de un simbolo embedido en si mismo es
"$$" in ACTION code
*/
%%

calclist: /* nothing */                        
 | calclist exp EOL { printf("= %d\n", $2); } 
 ;

exp: factor      
 | exp ADD factor { $$ = $1 + $3; }
 | exp SUB factor { $$ = $1 - $3; }
 ;

factor: term        
 | factor MUL term { $$ = $1 * $3; }
 | factor DIV term { $$ = $1 / $3; }
 ;

term: NUMBER   
 | ABS term   { $$ = $2 >= 0? $2 : - $2; }
 | OP exp CP  {$$ = $2;}
;
/*
OP exp CP  {$$ = $2;}
Aqui asignamos el $2(es decir la "exp") a $$
*/
%%


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

