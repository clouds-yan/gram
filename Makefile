cal: y.tab.c lex.yy.c
	gcc y.tab.c lex.yy.c -o $@

y.tab.c: yacc.y
	yacc -d $<

lex.yy.c: ll.lex
	flex $<

ll.c: y.tab.h



