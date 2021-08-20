%option main
%{
    //definitions
%}
%%
    //rules
([A-Z]{1})([a-z]{1,}) {printf("correcto\n");}
%%
