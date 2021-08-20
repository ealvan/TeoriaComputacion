%{
int vowels = 0;
int consonantes =0;    
%}

%%
[aeiouAEIOU] {vowels++;}
[a-zA-Z] {consonantes++;}

\n {return 0;}
%%

int yywrap() {}

int main(){
    printf("Enter a number: ");
    yylex();
    printf("Nimber of vowels : %d, Number of consonants: %d \n ",vowels,consonantes);

}