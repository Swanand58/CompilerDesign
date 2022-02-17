%option noyywrap
%{
	int function_started = 0;
	int function_definition = 0;
	int curly_open = 0;
	int argument_open = 0;
	int print_started = 0;
	int quotes_open = 0;
	int main_declared = 0;
	int main_started = 0;
	int argument_started = 0;
	int id = 0;
%}
%%
"#include<"[a-zA-z]+">" |
"#include<"[a-zA-z]+"."[a-z]">" {printf("%s: Header tag added\n", yytext);}
"printf" {
		if(function_definition == 0) {printf("Trying to print outside any function block\n"); return 0;}
		else {
			printf("Printf called\n");
			print_started = 1;
		}
	}
";"	{	if(function_started == 1 && function_definition == 0) {printf("Invalid syntax for ';'\n"); return 0;}
		else if(print_started == 1) {
			print_started = 0;
			printf("Printf terminated\n");
		}
	}
"void main()"	{printf("Main function decalred\n"); main_started = 1;}
int" "[a-zA-Z][a-zA-Z0-9]*"()" |
char" "[a-zA-Z][a-zA-Z0-9]*"()" |
float" "[a-zA-Z][a-zA-Z0-9]*"()" |
void" "[a-zA-Z][a-zA-Z0-9]*"()" {printf("%s: User Defined function declared\n", yytext); function_started = 1;}
\{	{
		if(function_started == 1 || main_started == 1) printf("Function definition started\n");
		else {printf("invalid syntax for '{'\n"); return 0;}
		curly_open = 1;
		function_definition = 1;
		if(main_started == 1) main_declared = 1;
	}
\}	{
		if(curly_open) printf("Function definition ended\n");
		else {printf("invalid syntax for '}'\n"); return 0;}
		curly_open = 0;
		if(function_started == 1)function_started = 0;
		if(main_started == 1) main_started = 0;
	}
int |
float |
char	{printf("%s: Keyword identified\n",yytext); id = 1;}
[a-zA-Z][a-zA-Z0-9]*	{
				if(id == 1){printf("%s: variable declared\n", yytext);id = 0;}
				else if(quotes_open == 1) printf("%s: To be displayed string\n", yytext);
				else {printf("invalid syntax for %s\n",yytext);return 0;}
			}
\"			{
				if(quotes_open == 1) {printf("String ended\n");quotes_open = 0;}
				else if(quotes_open == 0) {printf("String started\n"); quotes_open = 1;}
			}
,			{
				if(id == 0 && print_started == 1) id = 1;
			}
\(			{	printf("Function expanded\n"); argument_started += 1;}
\)			{	if(argument_started != 0) {printf("Function explanation terminated\n"); argument_started = 1;}
				else {printf("invalid syntax for ')'\n"); return 0; }}
"\n"			{}
"\t"			{}
" "			{}
%%
int main() {
	yyin = fopen("file.txt","r");
	yylex();
	return 0;
}
