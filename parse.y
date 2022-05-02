%{
#include <stdio.h>
int yylex(void);
int yywrap();
int yyerror(char* s);
%}



%union {
    double num;
}

%token EOL
%token<num> NUMBER
%token<num> PLUS MINUS MULT DIV
%token<num> L_BRACKET R_BRACKET 

%type<num> exp

%left PLUS
%left MINUS
%left MULT
%left DIV
%left L_BRACKET
%left R_BRACKET

%%
input:
    |line input
;

line :
    exp EOL { printf("Result: %.2f\n\n", $1);
              printf("Enter the expression\n");
            }
    |EOL
;

exp :
    NUMBER { $$ = $1; }
    |exp MULT exp { $$ = $1 * $3; }
    |exp DIV exp { $$ = $1 / $3; }
    |L_BRACKET exp R_BRACKET { $$ = $2; }
    |exp PLUS exp { $$ = $1 + $3; }
    |exp MINUS exp { $$ = $1 - $3; }
    |MINUS exp { $$ = -$2; }
;
%%

int main() {
    printf("Enter the expression\n");
    int res = yyparse();

    return res;
}

int yyerror (char* s){
    printf("Entered expression is Invalid!\n");
    return 1;
}