#ifndef __HW_H
#define __HW_H

#include <string>
using namespace std;

typedef enum {DECIMAL_T, BINARY_T, HEXA_T, BOOL_T, ID_T} _TYPE;
typedef enum {EQ, GE, LE, G, L, NE} relOpTypes; 

typedef struct
{
	string id;
	_TYPE type;
	long long int value;
	bool isBase;

} STYPE;

#define YYSTYPE STYPE

#endif

