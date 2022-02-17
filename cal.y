
%{
#include<stdio.h>
#include<ctype.h>
#define YYSTYPE double
%}
%token NUMBER
%left '+' '-'
%left '*' '/'
%right UMINUS
%%
lines:expr '\n' {printf("%d\n",$2);}
    |lines '\n'
    ;
expr:expr '+' expr {$$ =$1 + $3;}
    |expr '-' expr {$$ = $1 - $3;}
    |expr '*' expr {$$ = $1 * $3;}
    |expr '/' expr {$$ = $1 / $3;}
    |'(' expr ')' {$$ = $2;}
    |'-'expr %prec UMINUS {$$ =-$2;}
    |NUMBER
    ;
%%
Yylex()
{
int c;
while((c=getchar())=='');
if ((c=='')||(isdigit(c)))
{
ungetc(c,stdin);
scanf("%lf",&yylval);
return NUMBER;    
}    
return c;
}
%%
main()
{
yyparse();    
}