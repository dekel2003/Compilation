#ifndef EX5_CODE_GEN
#define EX5_CODE_GEN

#include <list>
#include <string>
using namespace std;

int next();

/*
    add the command s to the buffer.
*/
void emit(string s);

/*
    l is a list of addresses need to be backpatchde.
    address is the address to jump to.
    e.g.
    
    before bp
    
    .
    .
    100: goto
    .
    .
    
    after bp([100], 500)
    
    .
    .
    100: goto 500
    .
    .
*/
void bp(list<int>& l, int address);

/*
    print the content of the buffer
*/
void printBuffer();

/*
	 New temp
*/
string newTemp();

list<int> makelist(int litem);

list<int> merge(list<int> l1,list<int> l2);


#endif

