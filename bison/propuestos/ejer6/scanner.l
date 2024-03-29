%{

#include "parserCalculator.tab.h"
int yylval;
int yywrap();

%}

%%

"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }
"|" { return ABS; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
\n { return EOL; }
[ ] { }
. { printf("No se reconoce %c\n", *yytext); }

%%

int yywrap(){
    return 1;
}