%{
int len =0;
int count = 0;    
%}
%%
([a-zA-Z0-9])+ {len = strlen(yytext); 
        if(len > 5 && len < 10){
            count++;
        }
}

\n {printf("Numbers of words: %d\n", count);count =0;}
%%

int yywrap(){ return 1;}

int main(){
    printf("Enter a string: ");
    yylex();
    printf("%d \n",count);

    return 0;
}



