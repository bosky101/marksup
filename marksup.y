%{
#include <stdio.h>
#include <string.h>
extern int yylineno;
extern void yyerror(const char *str);

char *value="";
int paraStarted=0;

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
%union{
  char *string;
}
%start elements
%token <string> TEXTAREA
%token <string> TEXTFIELD 
%token <string> PASSWORD
%token <string> SQ_START VALUE SQ_END
%token <string> P_START
%token <string> BR
%token <string> SPACE
%token <string> SLASH
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
	div
	|
	radios
	|
	br
       	;

div:
        value spacer 
	|
	value
	{
	 
	}
        ;

value:
       VALUE
       {
	 value=$1;
	 printf("%s\n",$1);
       }
       ;

spacer: 
        BR
	|
	SPACE
        {
	  
	  printf("%s",$1);
	};

textarea:
	TEXTAREA
	{
	  printf("<textarea name=\"%s\"><textarea>",value);
	}
	;

textfield:
	TEXTFIELD
	{
	  printf("<input type=\"text\" name=\"%s\"/>",$1);
	}
	;

password:
	PASSWORD
	{
	  printf("<input type=\"password\" name=\"%s\"/>",$1);
	}
	;

button:
	sq_start VALUE sq_end
	{
	  value=$2;
	  printf("<input type=\"button\" value=\"%s\" />",value);
	}
	;

radios:
        radios radio
	{};

radio:
      	VALUE SLASH
	{
	  printf("choices!");
	}
	;

br:
	BR
	{
	  printf("\n<BR>\n");
	}
	;

sq_start:
        SQ_START
	{
	  //printf("found [\n");
        };

sq_end:
        SQ_END
	{
	  //printf("found ]\n");
        };
