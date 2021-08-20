%{
#include <stdio.h>
#include <string.h>
int i = 0;    
%}

%%
[a-zA-Z0-9]* {i++;}
\n {printf("There are %d words\n",i); i=0;}
%%

int yywrap(){}

int main(){
    yylex();
    return 0;
}