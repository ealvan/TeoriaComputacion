/* recognize tokens for the calculator and print them out */
/*Cuando el scanner un stream of tokens, each toeken has two parts*/
/*The TOKEN and TOKEN'S VALUE*/
%{
#include "parserBison.tab.h"
//int yylval; also make this work BISON
/*BISON ALSO MAKE THIS WORK
   enum yytokentype {
     NUMBER = 258,
     ADD = 259,
     SUB = 260,
     MUL = 261,
     DIV = 262,
     ABS = 263,
     EOL = 264
   };
*/
%}

%%
"("    { return OP; }
")"    { return CP; }
"//".* {/*Ignore Comments*/}
"+"    { return ADD; }
"-"    { return SUB; }
"*"    { return MUL; }
"/"    { return DIV; }
"|"    { return ABS; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
\n     { return EOL; }
[ \t]  { /* ignore whitespace */ }
.      { printf("Mystery character %c\n", *yytext); }
%%
// NO required testing in LEX
int yywrap(){}
// int main(int argc, char **argv)
// {
//   int tok;

//   while(tok = yylex()) {
//     printf("%d", tok);
//     if(tok == NUMBER) 
//         printf(" = %d\n", yylval);
//     else printf("\n");
//   }
// }