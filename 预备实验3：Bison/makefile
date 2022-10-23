.PHONY: expr, operator, clean
expr:
	bison -d expr.y
	gcc -o expr.out expr.tab.c

expr_plus:
	bison -d expr_plus.y
	gcc -o expr_plus.out expr_plus.tab.c
	
operator:
	bison -d operator.y
	gcc -o operator.out operator.tab.c
clean:
	rm -fr *.out
