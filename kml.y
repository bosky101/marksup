%{
#include <stdio.h>
#include <string.h>
extern int yylineno;
extern void yyerror(const char *str);

void yyerror(const char *str)
{
  //	fprintf(stderr,"error: %s\n",str);
  	fprintf(stderr," Syntax Error in Line : %d : %s\n",yylineno,str);
}

int yywrap()
{
	return 1;
}

main()
{
	yyparse();
}

%}

%token TEXTAREA
%token TEXTFIELD 
%token PASSWORD
%token BUTTON VALUE
%token SQ_START VALUE SQ_END
%token P
%token DIV
%token BR
%%

elements: /* empty */
	| elements element
	;


element:
	textfield
	|
	password
	|
	textarea
	|
	button
	|
	br
	|
	p
	|
	div
	;

p:
     	P
	{
		printf("\tsome paragraph\n");
	}
	;

div:
	DIV
	{
	  printf("\tsome div\n");
	}
	;

textarea:
	TEXTAREA
	{
		printf("\tsome textarea\n");
	}
	;

textfield:
	TEXTFIELD
	{
		printf("\tTextfield\n");
	}
	;

password:
	PASSWORD
	{
		printf("\tpassword\n");
	}
	;

button:
	BUTTON
	{
		printf("\tbutton\n");
	}
	;

br:
	BR
	{
		printf("\t<BR>\n");
	}
	;


