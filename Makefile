all:
	make lex yacc compile test
lex:
	lex marksup.l

yacc:
	yacc marksup.y

compile:
	cc lex.yy.c y.tab.c -o ./marksup
	echo "./marksup is ready"

test:
	cat ./input.txt
	echo "$ ./marksup < input.txt"
	./marksup < input.txt
	
