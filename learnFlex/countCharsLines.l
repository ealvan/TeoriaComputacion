%{
int nro_chars = 0;
int nro_lines = 0;    
%}
%%
\n      ++nro_lines;
.       ++nro_chars;
end     return 0;
%%

int yywrap(){}

int main(){
    yylex();
    printf("Number of lines = %d, number of chars = %d",nro_lines, nro_chars);
    return 0;
}