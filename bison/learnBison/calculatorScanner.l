/* recognize tokens for the calculator and print them out */
/*Cuando el scanner un stream of tokens, each toeken has two parts*/
/*The TOKEN and TOKEN'S VALUE*/
%{
/*TOKEN IA A ARBITRARY NUMBER*/
/*except token 0, always mean EOF(End of File)
ademas a parser Bison, crea dos archivos cuando es compilado
UNO : file.h -> aqui se define las definiciones de los numero de TOKEEns, 
y su significado
Pero ahora estamos definiedo algunos TOKENS a mano
BISON toma el primer token y le asigna un numero, luego alos demas
les da numeros sucesivos a este(el numero de inicio es 258)
NUMBER = 258, -> empieaz bison a asignar a este token el nro 258
     ADD = 259,->luego el 259
     SUB = 260,-> y asi sucesivamente
     MUL = 261,
     DIV = 262,
     ABS = 263,
     EOL = 264
Esto lo hace BISON automaticamente, es a modo explicacion  esto
empieza con el numero 258, porque
Evita colisiones con tokens de caracteres literales
*/
   enum yytokentype {
     NUMBER = 258,
     ADD = 259,
     SUB = 260,
     MUL = 261,
     DIV = 262,
     ABS = 263,
     EOL = 264
   };

   int yylval;
%}

%%
"+"    { return ADD; }
"-"    { return SUB; }
"*"    { return MUL; }
"/"    { return DIV; }
"|"    { return ABS; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
\n     { return EOL; }
[ \t]  { /* ignore whitespace */ }
.      { printf("Mystery character %c\n", *yytext); }
%%
int yywrap(){}
int main(int argc, char **argv)
{
  int tok;

  while(tok = yylex()) {
    printf("%d", tok);
    if(tok == NUMBER) 
        printf(" = %d\n", yylval);
    else printf("\n");
  }
}