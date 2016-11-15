%{
#include <stdio.h>
#include "parser.tab.h"
#include "lex.yy.h"
void yyerror(yyscan_t scanner, char const *msg);
int RES;
%}

%define api.value.type {int}
%define parse.error verbose
%define api.pure 
%lex-param {void *scanner}
%parse-param {void *scanner}
%token T_INT
%token T_AND T_OR T_LEFT T_RIGHT T_NEG
%token T_NEWLINE T_QUIT
%left T_OR
%left T_AND
%left T_NEG
%start calculation

%%

calculation: 
	   | calculation line
;

line: T_NEWLINE
    | expression T_NEWLINE { RES =  $1;return 0; } 
    | T_QUIT T_NEWLINE { printf("fim da transmissão!\n"); exit(0); }
;


expression: T_INT				{ $$ = $1; }
	  | expression T_AND expression		{ $$ = !!($1 * $3); }
	  | expression T_OR	 expression	{ $$ = !!($1 + $3); }
	  | T_LEFT expression T_RIGHT		{ $$ = $2; }
	  | T_NEG expression			{ $$ = !$2; }
;

%%

void yyerror(yyscan_t scanner, char const *msg) {
    fprintf(stderr, "Error: %s\n", msg);
}
