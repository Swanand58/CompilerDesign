%option noyywrap
%{ 
    int ch=0,ln=0,w=0,sp = 0;
%}
%%
[a-zA-Z0-9] {ch++;}
["\t"|" "] {sp++;}
["\n"] {ln++;}

[.]+ {printf("ch = %d sp = %d ln = %d w = %d",ch,sp,ln,sp+1);}
%%
int main()
{
    yyin = fopen("abc.txt","r");
    yylex();
    return 0;
}