%{
        #include<stdio.h>
        #include<math.h>
%}
%union
{ double p;}
%token<p>num
%token SIN COS TAN LOG SQRT 

%left '+''-'
%nonassoc uminu
%type<p>exp
%%

SS: exp {printf("Answer is =%g\n",$1);}

exp :   exp'+'exp    { $$=$1+$3; }
       |exp'-'exp    { $$=$1-$3; }
       |exp'*'exp    { $$=$1*$3; }
       |exp'/'exp    { 
                            if($3==0)
                                printf("Divide By Zero");
                            else 
				                 $$=$1/$3 ;
                      }
       |'-'exp    { $$=-$2; }
       |SIN'('exp')'   { $$=sin($3);}
       |COS'('exp')'   { $$=cos($3);}
       |TAN'('exp')'   { $$=tan($3);}
       |LOG'('exp')'   { $$=log($3);}
       |SQRT'('exp')'   { $$=sqrt($3);}
       |num;
       |'('exp')'    {$$=$2;}
%% 

main()
{
    do
    {
        printf("\n Enter the expression :");
        yyparse();
    }while(1);
}

yyerror(char *s;)
{
    printf("Syntax ERROR");
}
