%{
    #include <math.h>
    void evaluate();
    int flag_operador1=0,flag_operador2=0;
    float operador1=0, operador2=0, respuesta=0;
    // char *op;
    // int l;
    char op;
%}
DIGIT [0-9]
NUM {DIGIT}+(\.{DIGIT}+)?
%%
{NUM} {
    if (flag_operador1 == 0){
        operador1 = atof(yytext);
        flag_operador1 = 1;
        printf("operador 1: %0.2f\n", operador1);
    }
    else if(flag_operador2 == -1){
        operador2 = atof(yytext);
        flag_operador2 = 1;
        printf("operador 2: %0.2f\n", operador2);
    }
    
}
[-|+|*|/|%|^] { 
        //op =  strdup( yytext );
        // l = atoi(op);
        // printf("char %s",op);
        // printf("char %d",l);
        if (*yytext == '+'){
            printf("Quieres +\n");
            op='+';
        }else if(*yytext == '-'){
            printf("Quieres -\n");
            op='-';
        }else if(*yytext == '*'){
            printf("Quieres *\n");
            op='*';
        }else if(*yytext == '/'){
            printf("Quieres /\n");
            op='/';
        }else if(*yytext == '%'){
            printf("Quieres el modulo!\n");
            op='%';
        }else if(*yytext == '^'){
            printf("Quieres ^\n");
            op='^';
        }else{
            printf("No se que Quieres \n");
            op='_';
        }

        flag_operador2 = -1;
    }
[\n] { 
    if((flag_operador1 == 1) && (flag_operador2 == 0 || flag_operador2 == -1 )) {
        flag_operador2=0;
        flag_operador1=0;
        printf("Lo sentimos no se reconoce al operacion\n");
    }
    if((flag_operador1 == 1) && (flag_operador2 == 1)) {
        flag_operador2=0;
        flag_operador1=0;
        evaluate(); 
    }
}

%%
int yywrap(){}
int main(){
    yylex();
    return 0;
}
void evaluate(){
    if (op == '+'){
        respuesta = operador1 + operador2;
             
    }else if(op == '-'){
        respuesta = operador1 - operador2; 

    }else if(op == '*'){
        respuesta = operador1 * operador2;
            
    }else if(op == '/'){
        respuesta = operador1 / operador2;
             
    }else if(op == '%'){
        int op1 = (int) operador1;
        int op2 = (int) operador2;
        respuesta = (float)(op1 % op2);
             
    }else if(op == '^'){
        float result = 1;
        int exp = (int)operador2;
        while ( exp != 0) {
            result *= operador1;
            --exp;
        }
        //respuesta = pow(operador1,operador2);
        respuesta = result;
    }else{
        respuesta = 0;
    }
    printf("respuesta es: %0.2f\n", respuesta);
    printf("nada que evaluar\n");

}