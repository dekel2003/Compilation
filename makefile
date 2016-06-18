hw5: hw5.tab.cpp lex.yy.c hw5.hpp output.cpp output.hpp
	g++ -o ex4.exe hw5.tab.cpp output.cpp lex.yy.c

lex.yy.c: hw5.lex
	lex hw5.lex

hw5.tab.cpp: hw5.ypp
	bison -d hw5.ypp

clean:
	rm lex.yy.c hw5.tab.hpp hw5.tab.cpp ex4.exe
