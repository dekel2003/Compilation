#ifndef _236360_4_
#define _236360_4_

namespace output{
    void endScope();
	void printVar(const char* id, int offset, const char* type);
    void errorLex(int lineno);
    void errorSyn(int lineno);
    void errorUndef(int lineno, const char* id);
    void errorDef(int lineno, const char* id);
    void errorMismatch(int lineno);
	void errorUnexpectedBreak(int lineno); 
}

#endif
