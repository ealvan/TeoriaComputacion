%{
    #include <string.h>

    enum {
        INTEGER = 1, REAL, STRING, BOOLEANO,
        COMENTARIO, VARIABLE,
        COMA, PUNTOCOMA, ESPACIO, NUEVALINEA,
        OPERADORES_MAT, OPERADORES_COND, OPERADORES_LOG, OPERADORES_ASIG, OPERADORES_RELA, OPERADORES_PALA,
        AGRUPADORES,
        PALABRA_RESERVADA, DESCONOCIDO, VALORES
    }; 
    
    char globalValue[0x100];
%}

%option noyywrap

/*Definimos las expresiones que se usarán para representar los datos*/
INTEGER [0-9]+
REAL [0-9]+\.[0-9]*|\.[0-9]+
STRING (\"|\').*(\"|\')
BOOLEANO "true"|"false"

/*Definimos las expresiones que se usarán para reconocer comentarios y variables*/
COMENTARIO "//"|"/\*"|"\*/"
VARIABLE [a-zA-Z_][0-9a-zA-Z_]*

/*AUN NO HICE*/
/*Definimos las expresiones que se usarán para representar signos pertenecientes a la sintaxis dentro del propio lenguaje*/
COMA ","
PUNTOCOMA ";"
ESPACIO [ |\t]
NUEVALINEA [\n]

/*SI HICE */
/* Expresiones usadas para determinar los operadores existentes los cuales son con los que se realizan las diversas operaciones */
OPERADORES_MAT "+"|"-"|"*"|"/"|"%"|"++"|"--"|"~/"
OPERADORES_COND "?"|":"|"??"
OPERADORES_LOG "&&"|"||"|"!"
OPERADORES_ASIG "="|"+="|"-="|"*="|"/="|"??="
OPERADORES_RELA ">"|"<"|">="|"<="|"=="|"!="
/*no hice*/
OPERADORES_PALA "as"|"is"|"!is"

AGRUPADORES "("|")"|"{"|"}"|"["|"]"
/*SI HICE */
/* Palabras reservadas  https://dart.dev/guides/language/language-tour */

/* Expresiones usadas para determinar las palabras reservadas que nos sirven para los tipos de datos, así como los modificadores, y si usamos constantes*/
/*SI HICE */
TIPO_PRIMITIVO "int"|"double"|"String"|"bool"|"List"|"Set"|"Map"|"Symbol"
TIPO_MODIFICADOR "var"|"dynamic"|"Object"|"typedef"
TIPO_MODIFICADOR_CONSTANTE "final"|"const"
/*SI HICE */
/* Expresiones usadas para determinar las palabras reservadas en los bucles*/
DECISION "if"|"else"|"switch"|"case"|"default"|"assert"

/* Expresiones usadas para determinar los bucles */
BUCLE_FOR "for"|"in"
BUCLE_WHILE "while"|"do"
BUCLE_CONTROLES "break"|"continue"

/* Expresiones usadas para determinar las execiones */
EXCEPCION "try"|"catch"|"finally"|"covariant"|"rethrow"|"on"|"throw"

/* Expresiones usadas para determinar los Generadores, donde se encuentra lo asincrono y sincrono */
GENERADOR_FUNCION "sync"|"yield"|"async"|"await"
GENERADOR_OBJETO "Iterable"|"Stream"|"Future"

/* Expresiones usadas para determinar los Generadores las librerías y la visibilidad para crear tener un codigo mas estructurado  */
LIBRERIA "library"|"deferred"|"import"|"export"|"part"|"show"|"hide"

/* Expresiones usadas para determinar las Clases, y la POO ademas lo necesario para los metodos que se declaran dentro de estas  */
CLASES "class"|"super"|"extends"|"implements"|"interface"|"mixin"|"with"
CLASE_METODO "abstract"|"static"
METODOS "set"|"get"|"operator"|"Extension" 

/* Expresiones usadas para determinar los Enumeradores que son un tipo especial de clase para representar un numero fijo de valores constantes  */
ENUMERADORES "enum"

/* Expresiones usadas para determinar los Constructores para poder trabajar clases, tambien las expresiones para poder trabajar con funciones  */
CONSTRUCTORES "new"|"factory"|"this"
FUNCIONES "Function"|"external"|"return"

/* Expresiones usadas para representar los valores null y void cuando son necesarios */
VALORES "Null"|"void"


%%
{INTEGER} { strcpy(globalValue, yytext); return(INTEGER);}
{REAL} { strcpy(globalValue, yytext); return(REAL);}
{STRING} { strcpy(globalValue, yytext); return(STRING);}
{BOOLEANO} { strcpy(globalValue, yytext); return(BOOLEANO);}

{COMENTARIO} { strcpy(globalValue, yytext); return(COMENTARIO);}

{COMA} { strcpy(globalValue, yytext); return(COMA);}
{PUNTOCOMA} { strcpy(globalValue, yytext); return(PUNTOCOMA);}
{ESPACIO} { strcpy(globalValue, yytext); return(ESPACIO);}
{NUEVALINEA} { strcpy(globalValue, yytext); return(NUEVALINEA);}

{OPERADORES_MAT} { strcpy(globalValue, yytext); return(OPERADORES_MAT);}
{OPERADORES_COND} { strcpy(globalValue, yytext); return(OPERADORES_COND);}
{OPERADORES_LOG} { strcpy(globalValue, yytext); return(OPERADORES_LOG);}
{OPERADORES_ASIG} { strcpy(globalValue, yytext); return(OPERADORES_ASIG);}
{OPERADORES_RELA} { strcpy(globalValue, yytext); return(OPERADORES_RELA);}
{OPERADORES_PALA} { strcpy(globalValue, yytext); return(OPERADORES_PALA);}

{AGRUPADORES} { strcpy(globalValue, yytext); return(AGRUPADORES);}

{TIPO_PRIMITIVO} { strcpy(globalValue, yytext); return(PALABRA_RESERVADA);}
{TIPO_MODIFICADOR} { strcpy(globalValue, yytext); return(PALABRA_RESERVADA);}
{TIPO_MODIFICADOR_CONSTANTE} { strcpy(globalValue, yytext); return(PALABRA_RESERVADA);}
{DECISION} { strcpy(globalValue, yytext); return(PALABRA_RESERVADA);}
{BUCLE_FOR} { strcpy(globalValue, yytext); return(PALABRA_RESERVADA);}
{BUCLE_WHILE} { strcpy(globalValue, yytext); return(PALABRA_RESERVADA);}
{BUCLE_CONTROLES} { strcpy(globalValue, yytext); return(PALABRA_RESERVADA);}
{EXCEPCION} { strcpy(globalValue, yytext); return(PALABRA_RESERVADA);}
{GENERADOR_FUNCION} { strcpy(globalValue, yytext); return(PALABRA_RESERVADA);}
{GENERADOR_OBJETO} { strcpy(globalValue, yytext); return(PALABRA_RESERVADA);}
{LIBRERIA} { strcpy(globalValue, yytext); return(PALABRA_RESERVADA);}
{CLASES} { strcpy(globalValue, yytext); return(PALABRA_RESERVADA);}
{CLASE_METODO} { strcpy(globalValue, yytext); return(PALABRA_RESERVADA);}
{METODOS} { strcpy(globalValue, yytext); return(PALABRA_RESERVADA);}
{ENUMERADORES} { strcpy(globalValue, yytext); return(PALABRA_RESERVADA);}
{CONSTRUCTORES} { strcpy(globalValue, yytext); return(PALABRA_RESERVADA);}
{FUNCIONES} { strcpy(globalValue, yytext); return(PALABRA_RESERVADA);}

{VALORES} { strcpy(globalValue, yytext); return(VALORES);}

{VARIABLE} { strcpy(globalValue, yytext); return(VARIABLE);}

. { strcpy(globalValue, yytext); return(DESCONOCIDO); }


%%

//VARIABLE va al final porque luego de haber detectado los posibles valores, entonces recien es posible que sea una variable

int main() {
    int token;
    do {
        token=yylex();
        switch(token) {
            case 0: fprintf(stderr,"END_OF_FILE\n"); break;
            
            case INTEGER: fprintf(stderr,"INTEGER [%s]\n",
            globalValue); break;

            case REAL: fprintf(stderr,"REAL [%s]\n",
            globalValue); break;

            case STRING: fprintf(stderr,"STRING [%s]\n",
            globalValue); break;

            case BOOLEANO: fprintf(stderr,"BOOLEANO [%s]\n",
            globalValue); break;

            case COMENTARIO: fprintf(stderr,"COMENTARIO [%s]\n",
            globalValue); break;

            case VARIABLE: fprintf(stderr,"VARIABLE [%s]\n",
            globalValue); break;
            
            case COMA: fprintf(stderr,"COMA [%s]\n",
            globalValue); break;

            case PUNTOCOMA: fprintf(stderr,"PUNTOCOMA [%s]\n",
            globalValue); break;

            case ESPACIO: fprintf(stderr,"ESPACIO [%s]\n",
            globalValue); break;

            case NUEVALINEA: fprintf(stderr,"NUEVALINEA [%s]\n",
            globalValue); break;

            case OPERADORES_MAT: fprintf(stderr,"OPERADORES_MAT [%s]\n",
            globalValue); break;

            case OPERADORES_COND: fprintf(stderr,"OPERADORES_COND [%s]\n",
            globalValue); break;

            case OPERADORES_LOG: fprintf(stderr,"OPERADORES_LOG [%s]\n",
            globalValue); break;

            case OPERADORES_ASIG: fprintf(stderr,"OPERADORES_ASIG [%s]\n",
            globalValue); break;

            case OPERADORES_RELA: fprintf(stderr,"OPERADORES_RELA [%s]\n",
            globalValue); break;

            case OPERADORES_PALA: fprintf(stderr,"OPERADORES_PALA [%s]\n",
            globalValue); break;

            case AGRUPADORES: fprintf(stderr,"AGRUPADORES [%s]\n",
            globalValue); break;

            case PALABRA_RESERVADA: fprintf(stderr,"PALABRA_RESERVADA [%s]\n",
            globalValue); break;

            case DESCONOCIDO: fprintf(stderr,"DESCONOCIDO [%s]\n",
            globalValue); break;

            case VALORES: fprintf(stderr,"VALORES [%s]\n",
            globalValue); break;
        }
    } while(token);
    return(0);
}