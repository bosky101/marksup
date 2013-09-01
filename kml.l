%{
#include <stdio.h>
#include "y.tab.h"
%}

br [\n]
textfield [_][_]+
password [\*][\*]+
div [^\n]+
%%
\[[^\[\]]+\]	return BUTTON;
{textfield}	return TEXTFIELD;
{textfield}{br}{textfield}+	return TEXTAREA;
{password}	return PASSWORD;
{br}	return BR;
{div}	return DIV;
{br}{div}{br}	return P;
%%
