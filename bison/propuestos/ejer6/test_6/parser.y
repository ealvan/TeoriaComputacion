%{

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <ctype.h>
/*
Declaramos las funciones en la parte de definiciones
*/
int yylex();
int yyerror(const char *s);

%}
/*Declarando tokens*/

/*El tag union, nos sirve
para especificar los tipos de datos que almacenaran
nuestros tokens, ademas los tipos de datos
son "myval" y "var"
*/
%union { double myval; char var; }
//aqui estamos diciendo
//el token NUMBER peude almacenar doubles
//en su interior, y su tipo de dato 
//definido en union es myval
%token <myval> NUMBER
//aqui declaramos en una linea
//varios tokens
%token ADD SUB MUL DIV 
//aqui definimos el tipo de datos
//de kos tokens
%type <var> ADD SUB MUL DIV
//aqui los nuevos tokens
// de % y ^ para el modulo y potencia
%token MOD POW
//definiendo su tipo de dato
// el cual es var
%type <var> MOD POW
//FIN tambien es var
//si es var signidica que es un caracter
//que nos sirve para reconocer 
//simpobolos especificos
%token <var> FIN 
//este es un token
//que cuando se acepte y no ocurra
//antes un syntax error, nos saque del ejecutable
%token EXIT
//definiendo los siguientes SIMBOLOS NO TERMINALES su tipo de dato
%type <myval> calclist exp factor term newfactor
//se hace esto, pues estos simbolos no terminales
//almacenan en su interior un valor, el cual se actualiza, conforme 
//a las reglas de cada produccion
// si es que no es definido el %union 
//no es necesario definir los simbolos
// no terminales sus tipos de datos
// pues por defecto, el yylval no se ha divido
// en yylval.myval y yylval.var
/*
factor: term        
  // en las acciones de cada regla
  //estamos diciendo que el valor
  //que almacenara "factor" , el cual es
  //nombrado $$ en su misma produccion
  // $1 es factor 
  // $2 es MUL 
  // $3 es term
  // decimos $$ = $1 + $3
  //"factor" = "factor" + "term"
  //es decir sumar 3 al valor actual de "factor"
  //que es nuestro simbolo no terminal


 | factor MUL term { $$ = $1 * $3; } 
 | factor DIV term { $$ = $1 / $3; }
 | factor MOD term { $$ = fmod($1, $3); }
 | factor POW term { $$ = pow($1, $3); }
;
//fmod es una funcion de <cmath.h> 
//la cual nos permite usar el %
//pero para variables de double
//ya que a % b , sale un error,si a y b son enteros
//pow la exponencial que viene de <cmath.h> 
//y nos devuelve un double tambien
$$ = fmod($1, $3);
$1 , $2 y $3 son los valores de los tokens o simbolos no terminales
correspondientes, es importante mantener los tipos de dato
en simbolos no terminales y tokens, pues nos saldra un
error si hay ambiguedad
factor es de tipo <myval>
term es de tipo <myval>

calclist exp FIN { printf("= %0.4f\n", $2); } 
en esta linea imprimimos con 4 decimales de precison
el resultado proveniente de "exp"

calclist EXIT FIN { exit(EXIT_SUCCESS); }
salimos con el valor de EXIT_SUCCESS
el cual esta definido en la libreria <stdlib.h>
*/
%%
calclist:  {;}                       
 | calclist exp FIN { printf("= %0.4f\n", $2); } 
 | calclist EXIT FIN { exit(EXIT_SUCCESS); }
 ;

exp: factor      
 | exp ADD factor { $$ = $1 + $3; printf("con op=%c --> result ",$2);}
 | exp SUB factor { $$ = $1 - $3; printf("con op=%c --> result ",$2);}
 ;

factor: newfactor        
 | factor MUL newfactor { $$ = $1 * $3;printf("con op=%c --> result ",$2); }
 | factor DIV newfactor { $$ = $1 / $3; printf("con op=%c --> result ",$2);}

;
newfactor: term
 | newfactor MOD term { $$ = fmod($1, $3);printf("con op=%c --> result ",$2); }
 | newfactor POW term  { $$ = pow($1, $3); printf("con op=%c --> result ",$2); }
;
term: NUMBER  
;
%%
/*
Implementamos las funciones que declaramos en la 1ra parte
*/
int main(int argc, char **argv)
{
  yyparse();
  return 0;
}

int yyerror(const char *s)
{
  fprintf(stderr, "error: %s\n", s);
  return 1;
}


