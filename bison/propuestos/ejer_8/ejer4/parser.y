%{
#include <stdio.h>
#include <string.h>   
#include <stdlib.h>
extern int yylex();
void yyerror(char *msg);
int flag;  
int i;
int k =0;  
char o[12];    
%}
  
%union {
    char* f;
}
  
%token <f> DATA
%type <f> P 

%%
  
S: P    {
            flag = 0;
            k = strlen($1) - 1;
            
            for(int m = k; m >= 0; m--){
                o[k-m]= $1[m];
            }
            int f = 0;
            for(int n = 0; n <= k; n++){
                if(o[n] == $1[n]){
                    f = 1;
                }else{
                    f = 0;
                }
            }
            if(f == 0){
                printf("NO es palindromo!!\n");
            }else{
                printf("SI es palindromo!!\n");
            }
        }
;
  
P:  DATA    {$$ = $1;}
;
  
%%
  
void yyerror(char *msg)
 {
    fprintf(stderr, "%s\n", msg);
    exit(1);
 }
  
//driver code 
int main()
 {
    yyparse();
    return 0;
 }