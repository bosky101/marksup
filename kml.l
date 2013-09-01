%{
#include <stdio.h>
#include "y.tab.h"
%}

br [\n]
textfield [_][_]+
password [\*][\*]+
alpha [a-zA-Z]
div [^\n]+
%%
[a-zA-Z][0-9a-zA-Z_]+ yylval.string=strdup(yytext); return VALUE;
[\[] return SQ_START;
[\]] return SQ_END;
{textfield}	return TEXTFIELD;
{textfield}{br}{textfield}+	return TEXTAREA;
{password}	return PASSWORD;
{br}	return BR;
div{div}  yylval=strdup(yytext);return DIV;
ppp{br}{div}{br}  return P;
[.]+{br} ;
[ \t\n]  ;
%%
