#include <iostream>
#include "output.hpp"
using namespace std;

void output::endScope(){
    cout << "-- end scope --" << endl;
}

void output::printVar(const char* id, int offset, const char* type  ){
    cout << "var:" << id << ":" << offset <<  ":" << type <<  endl;
}

void output::errorLex(int lineno){
    cout << "line " << lineno << ":" << " lexical error" << endl;
}

void output::errorSyn(int lineno){
    cout << "line " << lineno << ":" << " syntax error" << endl;
}

void output::errorUndef(int lineno, const char* id){
    cout << "line " << lineno << ":" << " variable " << id << " is not defined" << endl;
}

void output::errorDef(int lineno, const char* id){
    cout << "line " << lineno << ":" << " variable " << id << " is already defined" << endl;
}

void output::errorMismatch(int lineno){
    cout << "line " << lineno << ":" << " type mismatch" << endl;
}
	
void output::errorUnexpectedBreak(int lineno) {
	cout << "line " << lineno << ":" << " unexpected break statement" << endl;	
}
