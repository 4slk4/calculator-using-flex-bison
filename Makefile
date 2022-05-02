calculator: lex.yy.c parse.tab.c
	gcc lex.yy.c parse.tab.c -o calculator

parse.tab.c: parse.y
	bison -d parse.y

lex.yy.c: lex.l
	flex lex.l

clean:
	rm -f *.c *.h calculator 
