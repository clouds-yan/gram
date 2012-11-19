%{
	#include <stdio.h>
	#include <assert.h>
	int yylex(void);
	void yyerror(char *);
%}
%token NUM
%token OP
%token LEFT RIGHT
%%
start: elm LEFT {printf ("--- %d\n", $1);};
expr: elm OP elm 
	{
		int res ;
		switch ($2) {
		case '+': $$ = $1 + $3;break;
		case '-': $$ = $1 - $3;break;
		case '*': $$ = $1 * $3;break;
		case '/': $$ = $1 / $3;break;
		default: assert(1);
		}

	}
;
elm:		NUM
		{
			$$ = $1;
		}
	|	expr
%%
void yyerror(char *s) {
	printf ("Error: %s\n", s);
}

int main (void) {
	yyparse();
	return 0;
}
test
