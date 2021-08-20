%{
 #include <string.h>
enum {INTEGER=1
    , REAL
    , IDENT
    , NEW_LINE
    , OPERATOR
    , UNKNOWN
    , WHITE_SPACE
    , COMENTARIOS
    , CHAR
    , OP_MATH
    , OP_COND
    , OP_LOG 
    , OP_ASIG
    , OP_PTR
    , OP_COMP
    , DELIMITADORES
    , TIPO_PRIMI
    , T_CONST
    , T_MODIF
    , LOGICA
    , B_FOR
    , B_WHILE
    , B_CONTROLES

};
char globalValue[0x100];
%}
%option noyywrap

/*COMENTARIOS*/
COMENTARIOS "//"(.*)|("/\*"(.*)"\*/")

/*TIPOS DE DATOS*/
INTEGER [0-9]+
REAL [0-9]+\.[0-9]*|\.[0-9]+
STRING (\").*(\")
BOOLEANO "true"|"false"
CHAR (\')(.){1}(\')
/*PALABRAS RESERVADAS DE TIPOS DE DATOS */
TIPO_PRIMI "int"|"double"|"float"|"bool"|"char"|"void"|"wchart_t"
T_MODIF "signed"|"unsigned"|"short"|"long"
T_CONST "const"
/*PALABRAS RESERVADAS DE LOGICA*/
LOGICA "if"|"else"|"switch"|"case"|"default"

/*VARIABLES permitimos int __ = 12; int _=12; int _1=12;*/
IDENT [a-zA-Z_][0-9a-zA-Z_]*


/*OPERADORES MATEMATICOS - LOGICOS - Y PUNTEROS*/
OP_MATH "+"|"-"|"*"|"/"|"%"|"++"|"--"
OP_COND "?"|":"
OP_LOG "&&"|"||"|"!"
OP_ASIG "<<"|"="|">>"|"+="|"-="|"*="|"/="
OP_PTR ("&"|"*"){IDENT}
OP_COMP ">"|"<"|">="|"<="|"=="|"!="
/*YA hecho pero no clasificado ...*/
WHITESPACE [ |\t]
DELIMITADORES "("|")"|"{"|"}"|"["|"]"

/* BUCLES EN C++ */
B_FOR "for"
B_WHILE "while"|"do"
B_CONTROLES "break"|"continue"|"goto"

/**/


/**/

%%
{REAL} { strcpy(globalValue, yytext); return(REAL); }
{INTEGER} { strcpy(globalValue, yytext); return(INTEGER); }

{OP_MATH} { strcpy(globalValue, yytext); return(OPERATOR); }
[\n] { strcpy(globalValue, yytext); return(NEW_LINE); }
{WHITESPACE} { strcpy(globalValue, yytext); return(WHITE_SPACE); }
{COMENTARIOS} { strcpy(globalValue, yytext); return(COMENTARIOS);}
{CHAR} {strcpy(globalValue, yytext); return(CHAR);}

{OP_COND} {strcpy(globalValue, yytext); return(OP_COND);}
{OP_LOG} {strcpy(globalValue, yytext); return(OP_LOG);}
{OP_ASIG} {strcpy(globalValue, yytext); return(OP_ASIG);}
{OP_PTR} {strcpy(globalValue, yytext); return(OP_PTR);}

{OP_COMP} {strcpy(globalValue, yytext); return(OP_COMP);}
{DELIMITADORES} {strcpy(globalValue, yytext); return(DELIMITADORES);}
{TIPO_PRIMI} {strcpy(globalValue, yytext); return(TIPO_PRIMI);}

{T_MODIF} {strcpy(globalValue, yytext); return(T_MODIF);}
{T_CONST} {strcpy(globalValue, yytext); return(T_CONST);}
{LOGICA} {strcpy(globalValue, yytext); return(LOGICA);}
{B_FOR} {strcpy(globalValue, yytext); return(B_FOR);}
{B_WHILE} {strcpy(globalValue, yytext); return(B_WHILE);}
{B_CONTROLES} {strcpy(globalValue, yytext); return(B_CONTROLES);}


{IDENT} { strcpy(globalValue, yytext); return(IDENT); }
. { strcpy(globalValue, yytext); return(UNKNOWN); }

%%
int main()
{
 int token;
    do{
        token=yylex();
        switch(token){
            case 0: fprintf(stderr,"END_OF_FILE\n"); break;
            case INTEGER: fprintf(stderr,"Entero [%s]\n", globalValue); break;
            case REAL: fprintf(stderr,"Decimal [%s]\n", globalValue); break;
            case IDENT: fprintf(stderr,"IDENT [%s]\n", globalValue); break;
            case NEW_LINE: fprintf(stderr,"NEW_LINE [%s]\n", globalValue); break;
            case OPERATOR: fprintf(stderr,"OPERATOR [%s]\n", globalValue); break;
            case UNKNOWN: fprintf(stderr,"UNKNOWN [%s]\n", globalValue); break;
            case WHITE_SPACE: fprintf(stderr,"WHITE_SPACE [%s]\n",globalValue); break;
            case COMENTARIOS: fprintf(stderr,"COMENTARIOS [%s]\n", globalValue); break;
            case CHAR: fprintf(stderr,"CHAR [%s]\n", globalValue); break;
            case OP_MATH: fprintf(stderr,"OP_MATH [%s]\n", globalValue); break;
            case OP_COND: fprintf(stderr,"OP_COND [%s]\n", globalValue); break;
            case OP_LOG: fprintf(stderr,"OP_LOG [%s]\n", globalValue); break;
            case OP_ASIG: fprintf(stderr,"OP_ASIG [%s]\n", globalValue); break;
            case OP_PTR: fprintf(stderr,"OP_PTR [%s]\n", globalValue); break;
            case OP_COMP: fprintf(stderr,"OP_COMP [%s]\n", globalValue); break;
            case DELIMITADORES: fprintf(stderr,"DELIMITADORES [%s]\n", globalValue); break;
            case TIPO_PRIMI: fprintf(stderr,"TIPO_PRIMI [%s]\n", globalValue); break;
            case T_MODIF: fprintf(stderr,"T_MODIF [%s]\n", globalValue); break;
            case T_CONST: fprintf(stderr,"T_CONST [%s]\n", globalValue); break;            
            case LOGICA: fprintf(stderr,"LOGICA [%s]\n", globalValue); break;            
            case B_FOR: fprintf(stderr,"B_FOR [%s]\n", globalValue); break;            
            case B_WHILE: fprintf(stderr,"B_WHILE [%s]\n", globalValue); break;            
            case B_CONTROLES: fprintf(stderr,"B_CONTROLES [%s]\n", globalValue); break;            
            
        }
    } while(token);
return(0);
}

/*
case KEYWORD: fprintf(stderr,"KEYWORD [%s]\n", globalValue); break;
*/
