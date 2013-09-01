%{
#include <stdio.h>
#include <string.h>
extern int yylineno;
extern void yyerror(const char *str);

char *value="";

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
%start elements
%token TEXTAREA
%token TEXTFIELD 
%token PASSWORD
%token BUTTON
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
	p
	|
	div
	|
	br
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
	SQ_START VALUE SQ_END
	{
	  printf("\tbutton %s\n",value);
	}
	;

div:
	DIV
	{
	  printf("\t<div>\n");
	}
	;

p:
	P
	{
		printf("\t<P>\n");
	}
	;

br:
	BR
	{
		printf("\t<BR>\n");
	}
	;


