%{
#include <stdint.h>
//#include "y.tab.h"
#define YYSTYPE uint32_t
char *endptr;
int lineno = 1;
%}

%%
^#                      ;
[\t ]                   ;
[A-Za-z_][A-Za-z0-9_]*  printf("op: %s\n", yytext);
#[0-9]+                 printf("decimal: %s\n", yytext);
#0x[0-9a-fA-F]+         printf("hex: %s\n", yytext);
[0-9]+.*                printf("%d: error: invalid suffix \"%s\" on integer constant\n", lineno, yytext);
,                       ;
.*:                     printf("label: %s\n", yytext);
\n                      lineno++;
%%

int yyerror(char *s)
{
	fprintf(stderr, "%d: %s at %s\n", lineno, s, yytext);
}

/* Determine how many operand of this instruction */
int lookup_inst(char *inst)
{
    return 0;
    if (!strcasecmp(inst, "mov"))
        return 2;
}
