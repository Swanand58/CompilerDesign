%option noyywrap

%%
[#include<a-z.h>]+ {printf("Header File\n");}
[a-z()]+ {printf("Function\n");}
[{|}] {printf("Curly brackets\n");}
[return0-9]+ {printf("return statement\n");}
%%
int main()
{
    yyin = fopen("abc.txt","r");
    yylex();
    return 0;
}