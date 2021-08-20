%option main
%{
    
%}
/*Ponemos limite de 0 a 9
por que si le damos *, entonces
nos acepta las cadenas:
aba,
acb,
etc...
supongo que LEX entiende que son todas las 
iteraciones posibles entre estas 
expresiones Regulares
*/
%% 
[(abc*)|(abc*bb*ca(bbb*ca)*)|(aca*)]{0,9} printf("ExprRegular Original\n");
%%