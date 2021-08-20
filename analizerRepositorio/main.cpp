#include <iostream>
#include <FlexLexer.h>
#include <fstream>
int main(int argc, char** argv)
{
    //std::ifstream in("entrada.txt");
    yyFlexLexer* lexer = new yyFlexLexer(/*&in*/);
    while(lexer->yylex() != 0);
    return 0;
}
