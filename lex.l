%{
#include <stdio.h>
#include <string.h>
#include "parse.tab.h"
void yyerror(char* s); //To stop the warning 
%}

%%
[0-9]+(\.[0-9]+)? {yylval.num = atof(yytext); return NUMBER;}
"+" {return PLUS;}
"-" {return MINUS;}
"*" {return MULT;}
"/" {return DIV;}
"(" {return L_BRACKET;}
")" {return R_BRACKET;}
[\n] {return EOL;}
[ \t] {}
. { yyerror(""); exit(1); }

%%

int yywrap(void) {}