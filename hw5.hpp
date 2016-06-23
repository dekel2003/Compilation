#ifndef __HW_H
#define __HW_H

#include <string>
#include <list>
#include <sstream>

using namespace std;

typedef enum {DECIMAL_T, BINARY_T, HEXA_T, BOOL_T, ID_T, UNDEF_T} _TYPE;
typedef enum {EQ, GE, LE, G, L, NE} relOpTypes; 

class Var{
public:
	string id;
	_TYPE type;
	bool isBase;
	unsigned long value;
	
	int offset;
	
	Var():id(""),type(UNDEF_T),offset(-1),isBase(false){}
	
	Var(string id, _TYPE type, int offset, int value = -1) : id(id),type(type),offset(offset),value(value){
		isBase = false;
		if (type == DECIMAL_T || type == BINARY_T || type == HEXA_T)
			isBase = true;
	}
	
	void makeTemp(int _offset, int _value, _TYPE _type){
		offset = _offset;
		value = _value;
		type = _type;
	}
	
	string address(){
		stringstream ss;
		ss << "s[" << offset << "]";
		return ss.str();
	}
	
};
	
typedef struct
{
	string id;
	_TYPE type;
	unsigned long value;
	bool isBase;
	
	list<int> nextList;
	list<int> trueList;
	list<int> falseList;
	list<int> breakList;
	
	list<Var> caseList;
	
	Var tempVar;
	
	struct _additional {
		string place;
		int cmd_address;
		char* value;

		int quad;

		list<char*> case_typeList;
		list<int> case_quadList;
		list<char*> case_valList;
	} ad;

} STYPE;

#define YYSTYPE STYPE

#endif

