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
[a-zA-Z0-9][^/\[\]\n]+ yylval.string=strdup(yytext); return VALUE;
[\/] return SLASH;
[\[] return SQ_START;
[\]] return SQ_END;
{textfield}	return TEXTFIELD;
{textfield}{br}{textfield}+	return TEXTAREA;
{password}	return PASSWORD;
{br}+	  return BR;
[ \t\n]+  ;
%%
