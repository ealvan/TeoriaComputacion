%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <iostream>
%}

%option c++
%option outfile="Analizador.cpp"
%option case-insensitive
%option noyywrap

DIGITO [0-9]
LETRA [a-zA-ZñÑ]

ENTERO {DIGITO}+
REAL {DIGITO}+"."{DIGITO}+
IDENTIFICADOR {LETRA}({LETRA}|{DIGITO}|"_")*

DELIMITADOR [\t\r\f" "]
/**/
/*COMENTARIOS*/
COMENTARIOS "//"(.*)|("/\*"(.*)"\*/")

/*TIPOS DE DATOS*/
INTEGER [0-9]+
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
/*MANEJO DE ERRORES */
EXCEPCIONES "try"|"catch"|"throw"
ERRORES "std::exception"|"std::bad_alloc"|"std::bad_cast"|"std::bad_exception"|"std::bad_typeid"|"std::logic_error"|"std::domain_error"|"std::invalid_argument"|"std::length_error"|"std::cout" 


/**/

%%

{ENTERO}	{std::cout<<"Numero Entero "<<yytext<<std::endl;}
{REAL}		{std::cout<<"Numero Real "<<yytext<<std::endl;}
{IDENTIFICADOR}	{std::cout<<"Identificador "<<yytext<<std::endl;}


{DELIMITADOR}	{}
.		{std::cout<<"ERROR LÉXICO "<<std::endl;}

%%
