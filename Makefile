all: plogica

parser.tab.c parser.tab.h:	parser.y
	bison -d parser.y

lex.yy.c lex.yy.h: scanner.l parser.tab.h
	flex scanner.l

plogica: lex.yy.c lex.yy.h main.cpp parser.tab.c parser.tab.h
	g++ -g main.cpp parser.tab.c lex.yy.c -static -o plogica

clean:
	rm plogica parser.tab.c lex.yy.c lex.yy.h parser.tab.h
