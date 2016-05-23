hw4: hw4.tab.cpp lex.yy.c hw4.hpp output.cpp output.hpp
	g++ -o ex4.exe hw4.tab.cpp output.cpp lex.yy.c

lex.yy.c: hw4.lex
	lex hw4.lex

hw4.tab.cpp: hw4.ypp
	bison -d hw4.ypp

clean:
	rm lex.yy.c hw4.tab.hpp hw4.tab.cpp ex4.exe
