%{

int count = 0;    
    
%}

%%
[A-Z] {printf("%s a capital letter\n", yytext);
        count++;}
.       {printf("%s not a capital letter\n",yytext);}
\n      {return 0;}
%%

int yywrap(){}
// Explanation:
// yywrap() - wraps the above rule section
/* yyin - takes the file pointer 
          which contains the input*/
/* yylex() - this is the main flex function
          which runs the Rule Section*/
// yytext is the text in the buffer

// Uncomment the lines below 
// to take input from file
/*** Code Section prints the number of
capital letter present in the given input***/
int main(){
    // FILE *fp;
    // char filename[50];
    // printf("Enter a file name: \n");
    // scanf("%s",filename);
    // fp = fopen(filename,"r");
    // yyin = fp;

    yylex(); //run de rule section
    printf("\nNumber of capital letters int the given input - %d\n",count);
    return 0;
}



