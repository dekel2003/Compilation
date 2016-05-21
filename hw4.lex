%{

#include <stdio.h>
#include "source.hpp"
#include "source.tab.hpp"
#include "output.hpp"

using namespace output;

/*  "/*"([^*]|\*+[^*/])*\*+"/"	{}   is the c- style multi line comment */

%}

%option yylineno
%option noyywrap

digit	([0-9])
letter	([a-zA-Z])
name	[a-zA-Z][a-zA-Z0-9]*
exp		(e[-+]?{digit}+)
frac	({digit}*[/.]{digit}+)

%%

[ \n\t\r]					{}; //disregard tabs and white spaces!



switch						{return SWITCH;}

case						{return CASE;}

print						{return PRINT;}

input						{return INPUT;}

if							{return IF;}

else						{return ELSE;}

while						{return WHILE;}

break						{return BREAK;}

not							{return NOT;}

true						{
								yylval.type = BOOL_T;
								yylval.value = 1;
								yylval.isTemp = false;
								return TRUE;
							}
false						{
								yylval.type = BOOL_T;
								yylval.value = 0;
								yylval.isTemp = false;
								return FALSE;
							}

D							{
								yylval.type = DECIMAL_T;
								yylval.isTemp = true;
								return DECIMAL;
							}

B							{
								yylval.type = BINARY_T;
								yylval.isTemp = true;
								return BINARY;
							}

H							{
								yylval.type = HEXA_T;
								yylval.isTemp = true;
								return HEXA;
							}

int							{
								yylval.type = INT_T;
								yylval.isTemp = false;
								return INT;
							}
							
bool						{
								yylval.type = BOOL_T;
								yylval.isTemp = false;
								return BOOL;
							}
									
print						{return PRINT;}

input						{return INPUT;}

\=							{return ASSIGN;}

\+							{return PLUS;}

\-							{return MINUS;}

\*							{return MULT;}
\/							{return DIV;}
"<="|">="|"=="|"!="|"<"|">"			{return REL_OP;}

\;							{return SC;}

\:							{return COL;}

\(							{return LP;}

\)							{return RP;}

\{							{return LC;}

\}							{return RC;}

and							{return AND;}

or							{return OR;}


[a-zA-Z]+                   {
								yylval.type = ID_T;
								yylval.id = string(yytext);
								yylval.isTemp = false;
								return ID;
							}


[0]|[1-9]{digit}* 			{
								yylval.type = INT_T;
								yylval.value = atoi(yytext);
								yylval.isTemp = false;
								return NUM;
							}

\"[^"]*\"					{return STRING;}


"//"[^\n]*\n 				{} 

.							{
								output::errorLex(yylineno);
								exit(0);
							}


%%



