%option noyywrap
%%
[a-zA-Z0-9]+ {printf("identifier");}
%%

int main()
{
    yylex();
    return 0;
}