%{

#include <stdio.h>
#include <stdlib.h>
#include "parser.tab.h"

%}
%%
  
[ab]+   {yylval.f = yytext; return DATA;}
[ \t\n]      {;}
  
%%
  
 int yywrap()
 { 
  return -1; 
 }  