%{
#include <stdint.h>
//#include "y.tab.h"
#define YYSTYPE uint32_t
char *endptr;
int lineno;
%}

%%
^#      ;
[\t ]   ;
[a-zA-Z#]+(_*[a-zA-Z0-9]+)|([a-zA-Z0-9]*) printf("op: %s\n", yytext);
,       ;
.*:     printf("label: %s\n", yytext);
\n      ++lineno;
%%

int yyerror(char *s)
{
	fprintf(stderr, "%d: %s at %s\n", lineno, s, yytext);
}
