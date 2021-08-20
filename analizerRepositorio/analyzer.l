%{ 
int n = 0 ;  
%}

%% 
"while"|"if"|"else"|"goto"|"endl"|"cin"|"cout" {n++;printf("PalabraReservada : %s\n", yytext);}  

"int"|"float"|"short"|"long" {n++;printf("TipoDato : %s\n", yytext);}   

\"[ _a-z0-9A-Z]*\" {n++;printf("String : %s\n",yytext);}

[a-zA-Z_][a-zA-Z0-9_]* {n++;printf("ID: %s\n", yytext);} 

"<="|"=="|"="|"++"|"-"|"*"|"+" {n++;printf("OPERADOR : %s\n", yytext);}

&[a-zA-Z_][a-zA-Z0-9_]* {n++; printf("ADDRESS: %s\n",yytext);}

\*[a-zA-Z_][a-zA-Z0-9_]* {n++; printf("POINTER: %s\n",yytext);}

"<<"|">>"|"->" {n++;printf("Operador de asignacion: %s\n",yytext);}

[(){}|, ;]    {n++;printf("SIMBOLO: %s\n", yytext);} 

[0-9]*"."[0-9]+ {n++;printf("\t float : %s\n", yytext);}  

[0-9]+ {n++;printf("Entero : %s\n", yytext);}                        

.    ;

%% 

int yywrap(){}

int main(){ 
    yylex();
    printf("\n total no. of token = %d\n", n);   
} 