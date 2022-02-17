%option noyywrap
%%
[0-9]+[.][0-9]+[.][0-9] {printf("chukicha");}
[0-9]+ {printf("Int ahe ha");}
[0-9.0-9]+ {printf("Float ahe ha");}

%%

int main()
{
    yylex();
    return 0;
}