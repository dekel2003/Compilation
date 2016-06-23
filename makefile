hw5: hw5.tab.cpp lex.yy.c hw5.hpp output.cpp output.hpp
	g++ -o ex5.exe --std=c++0x hw5.tab.cpp output.cpp lex.yy.c bp.cpp
	chmod +x ex5.exe
lex.yy.c: hw5.lex
	lex hw5.lex

hw5.tab.cpp: hw5.ypp
	bison -d hw5.ypp

clean:
	rm -f lex.yy.c hw5.tab.hpp hw5.tab.cpp ex4.exe
