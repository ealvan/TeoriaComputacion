%option main
%{
    
%}

PROTOCOLO (http(s)?):
WWW \/\/(www\.)?
DOMINIO [a-zA-Z0-9]{2,256}
COM \."com"

%% 
{PROTOCOLO}{WWW}{DOMINIO}{COM} printf("Es url de la pagina web\n");
%%