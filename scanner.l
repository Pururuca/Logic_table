%{
#include <stdio.h>
#include "parser.tab.h"
	#include <string.h>
%}

%option 8bit reentrant bison-bridge
%option warn noyywrap nodefault
%option header-file="lex.yy.h"
%{
int var;
char *T[100];
int ReV[100];
bool tab = true;

int RepVar(char *str,int t){
int i;
int j;
bool repetido=true;

for( i = 0; i < var ; i++  )
	if(!strcmp(T[i],str))
		repetido=false;


if(repetido){
T[var]=(char*)malloc((t+1)*sizeof(char));
memcpy(T[var],str,(t+1)*sizeof(char));
var++;
}

int bit;
int cont;
for( i = 0; i < var ; i++  ){

	if(!strcmp(T[i],str))
		cont = i;	
}
free(str);
return ReV[cont];

}

%}
%%
"saida"|"exit"|"quit"|"sair"		{return T_QUIT;}	
([a-zA-Z]|[a-zA-Z][a-zA-Z0-9]+) {  *yylval = RepVar(strdup(yytext),yyleng);  return T_INT;}
\n					{return T_NEWLINE;}
[ \t]	; // ignore all whitespace<INITIAL>
[0-9]+ 					{ *yylval = atoi(yytext); return T_INT;}
"*"|"&&"|"&"	{return T_AND;}
"+"|"||"|"|"	{return T_OR;}
"("					{return T_LEFT;}
")"					{return T_RIGHT;}
"!"					{return T_NEG;}
. ;

%%
