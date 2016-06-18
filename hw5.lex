%{

#include <stdio.h>
#include "hw5.hpp"
#include "hw5.tab.hpp"
#include "output.hpp"

using namespace output;


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
								yylval.isBase = false;
								return TRUE;
							}
false						{
								yylval.type = BOOL_T;
								yylval.value = 0;
								yylval.isBase = false;
								return FALSE;
							}

D							{
								yylval.type = DECIMAL_T;
								yylval.isBase = true;
								return DECIMAL;
							}

B							{
								yylval.type = BINARY_T;
								yylval.isBase = true;
								return BINARY;
							}

H							{
								yylval.type = HEXA_T;
								yylval.isBase = true;
								return HEXIDECIMAL;
							}

int							{
								yylval.type = DECIMAL_T;
								yylval.isBase = false;
								return INT;
							}
							
bool						{
								yylval.type = BOOL_T;
								yylval.isBase = false;
								return BOOL;
							}

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
								yylval.isBase = false;
								return ID;
							}


[0]|[1-9]{digit}* 			{
								yylval.type = DECIMAL_T;
								yylval.value = atoi(yytext);
								yylval.isBase = true;
								return NUM;
							}

\"[^"]*\"					{return STRING;}


"//"[^\n]*\n 				{} 

.							{
								output::errorLex(yylineno);
								exit(0);
							}


%%



