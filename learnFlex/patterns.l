/*** Definition Section has one variable
which can be accessed inside yylex()
and main() 
funcionan :
[^A-Zñ] {printf("%s capital letter\n", yytext);}
.     {printf("%s not a capital letter\n", yytext);}
a* {printf("Hello matias!");}
r? {printf("es opcinal la r ");}
p(a|e|i|o|u)pi printf("%s _**",yytext);
"<<"[ a-zA-Z0-9] {printf("Display en pantalla : ");
(?:foo) -> machea solo la "foo" nada mas fo, f, no match
(?i:man) -> insensitive "man" no match with -> mAn
(?-i:man) -> sensitive "man" no reconoce MAN 
(?-s:.) match ALL chars except newline
(?s:.) -> Machea todo incluso el newline
(?x:a (bc|de)) -> concatena a.(bc+de)->"abc","ade" 
                en el pattern puedes poner con espacios
                pa leer mejor y no los contara 
                como parte del patron
(?x: a b c) -> "abc"
para machear los espacios
(?x:a\ b) -> "a b"
(?x:a" "b) -> "a b"
(?x:a[ ]b) -> "a b"
r/s "Cuando hay una r seguida de una s, caso contrario F
<s>r match con "r", solo si se cumple la condicion <s>.
‘<s1,s2,s3>r’ match con "r", solo si se cumple la condicion s1,s2 o s3.
<*>r "Cuando hay una r , precedida por cualquier estado,incluso e
bat(wo)?man printf("match batman batwoman");
<*>r printf("match solo si hay una s seguida de un r");
(?x:a (bc|de)) printf("-> %s ",yytext);

PRECEDENCE:
* > concatenation > |
COMO SE HACE EL match
se ahce mediante algoritmo voraz
el pattern que agarra mas cantidad de texto es que se realiza la accion
El sobrante para las demas acciones
Es por eso que si haces don patrones que uno influye en el otro
puedes no ver los dos resultados, sino el patron mas global
esxite una forma de yytext->nos da el texto match
yyleng->longitud del match
[[:alpha:]]{-}[[:lower:]]{+}[q] printf("Uppercase + q");
-> hace que los espacios en exceso sean de solo uno " "
[ \t]+ putchar( ' ' );
[ \t]+$   ignore this token 
//matchea todo pero si pones "frob" te dara el numero de palabras
frob printf("%d",word_count); REJECT;
[^ \t\n]+ ++word_count;

***/
%option main
%{
int word_count = 0;

%}
%%
%%
