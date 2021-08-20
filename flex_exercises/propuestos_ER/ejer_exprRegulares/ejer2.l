%option main
/*  */
%{  

%}

PUNTO (\.)
PART_1 (25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)
%% 

({PART_1}{PUNTO}){3}{PART_1} printf("Es direccion IP\n");

%%
