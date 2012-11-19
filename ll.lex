%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}
number ([0-9])+
op	[+\-*/]
delim	[" "\t\n]
skip	{delim}+
left	\(
right	\)
%%
{number} {
	printf ("Type: NUM, VAL:%d\n", atoi(yytext));
	yylval = atoi(yytext);
	return NUM;
}
{op}	{
	printf ("TYPE: OP, VAL:%c\n", *yytext);
	yylval = *yytext;
	return OP;
}
{left} {
	printf ("LEFT\n");
	return LEFT;
}
{right} {
	printf ("RIGHT\n");
	return RIGHT;
}
{skip} {}
%% 
int yywrap () {
	return 1;
}
