all:
	flex lexer.l
	gcc -lfl lex.yy.c
