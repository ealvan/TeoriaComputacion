%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <iostream>
%}

%option c++
%option outfile="Analizador.cpp"
%option case-insensitive
%option noyywrap

/**/
/*COMENTARIOS*/
COMENTARIOS "//"(.*)|("/\*"(.*)"\*/")

/*TIPOS DE DATOS*/
INTEGER [0-9]+
STRING (\")(.*)(\")
BOOLEANO "true"|"false"
CHAR (\')(.){1}(\')
/*PALABRAS RESERVADAS DE TIPOS DE DATOS */
TIPO_PRIMI "int"|"double"|"float"|"bool"|"char"|"void"|"wchart_t"
T_MODIF "signed"|"unsigned"|"short"|"long"
T_CONST "const"|"extern"|"static"|"typedef"|"typeid"|"typename"|"auto"

/*PALABRAS RESERVADAS DE LOGICA*/
LOGICA "if"|"else"|"switch"|"case"|"default"

/*VARIABLES permitimos int __ = 12; int _=12; int _1=12;*/
IDENT [a-zA-Z_][0-9a-zA-Z_]*


/*OPERADORES MATEMATICOS - LOGICOS - Y PUNTEROS*/
OP_MATH "+"|"-"|"*"|"/"|"%"|"++"|"--"|"~"
OP_COND "?"|":"
OP_LOG "&&"|"||"|"!"|"|"    
OP_ASIG "<<"|"="|">>"|"+="|"-="|"*="|"/="|"%="|"&="|"|="|"<<="|">>="|"^="
OP_PTR ("&"|"*"){IDENT}
OP_COMP ">"|"<"|">="|"<="|"=="|"!="
OP_KEY "sizeof"|"new"|"delete"
/*YA hecho pero no clasificado ...*/
WHITESPACE [ |\t]
DELIMITADORES "("|")"|"{"|"}"|"["|"]"

/* BUCLES EN C++ */
B_FOR "for"
B_WHILE "while"|"do"
B_CONTROLES "break"|"continue"|"goto"
/*MANEJO DE ERRORES */
EXCEPCIONES "try"|"catch"|"throw"|"catch"
ERRORES "std::exception"|"std::bad_alloc"|"std::bad_cast"|"std::bad_exception"|"std::bad_typeid"|"std::logic_error"|"std::domain_error"|"std::invalid_argument"|"std::length_error" 
/*KEYWORDS de clases*/
CLASES_K "struct"|"class"|"public"|"private"|"protected"|"this"|"virtual"|"friend"

/*LIBRERIAS*/
LIBRERIAS "#include"|"#define"|"explicit"|"export"
IN_OUT "cout"|"cin"
/*Mutables*/
KEYWORD "mutable"|"namespace"|"operator"|"register"|"union"|"volatile"|"inline"|"extern"|"enum"|"asm"
BREAK "\n"|"endl"

COMA ","
PUNTOCOMA ";"

NUEVALINEA [\n|"endl"]

%%

{COMENTARIOS} {std::cout<<"COMENTARIOS: "<<yytext<<std::endl;}
{STRING} {std::cout<<"String: "<<yytext<<std::endl;}
{IN_OUT} {std::cout<<"IN_OUT: "<<yytext<<std::endl;}

{INTEGER}	{std::cout<<"INTEGER "<<yytext<<std::endl;}

{BOOLEANO} {std::cout<<"BOOLEANO: "<<yytext<<std::endl;}
{CHAR} {std::cout<<"CHAR: "<<yytext<<std::endl;}
{TIPO_PRIMI} {std::cout<<"TIPO_PRIMI: "<<yytext<<std::endl;}
{T_MODIF} {std::cout<<"T_MODIF: "<<yytext<<std::endl;}
{T_CONST} {std::cout<<"T_CONST: "<<yytext<<std::endl;}
{LOGICA} {std::cout<<"LOGICA: "<<yytext<<std::endl;}
{OP_MATH} {std::cout<<"OP_MATH: "<<yytext<<std::endl;}
{OP_COND} {std::cout<<"OP_COND: "<<yytext<<std::endl;}
{OP_LOG} {std::cout<<"OP_LOG: "<<yytext<<std::endl;}
{OP_PTR} {std::cout<<"OP_PTR: "<<yytext<<std::endl;}
{OP_ASIG} {std::cout<<"OP_ASIG: "<<yytext<<std::endl;}
{OP_COMP} {std::cout<<"OP_COMP: "<<yytext<<std::endl;}
{WHITESPACE} {std::cout<<"WHITESPACE: "<<yytext<<std::endl;}
{DELIMITADORES} {std::cout<<"DELIMITADORES: "<<yytext<<std::endl;}
{B_FOR} {std::cout<<"B_FOR: "<<yytext<<std::endl;}
{B_WHILE} {std::cout<<"B_WHILE: "<<yytext<<std::endl;}
{B_CONTROLES} {std::cout<<"B_CONTROLES: "<<yytext<<std::endl;}
{EXCEPCIONES} {std::cout<<"EXCEPCIONES: "<<yytext<<std::endl;}
{ERRORES} {std::cout<<"ERRORES: "<<yytext<<std::endl;}
{CLASES_K} {std::cout<<"CLASES_K: "<<yytext<<std::endl;}
{OP_KEY} {std::cout<<"OP_KEY: "<<yytext<<std::endl;}
{LIBRERIAS} {std::cout<<"LIBRERIAS: "<<yytext<<std::endl;}
{KEYWORD} {std::cout<<"KEYWORD: "<<yytext<<std::endl;}
{BREAK} {std::cout<<"BREAK: "<<yytext<<std::endl;}
{COMA} {std::cout<<"COMA: "<<yytext<<std::endl;}
{PUNTOCOMA} {std::cout<<"PUNTOCOMA: "<<yytext<<std::endl;}
{NUEVALINEA} {std::cout<<"NUEVALINEA: "<<yytext<<std::endl;}


{IDENT} {std::cout<<"IDENT: "<<yytext<<std::endl;}
.		{std::cout<<"ERROR LÉXICO "<<std::endl;}

%%