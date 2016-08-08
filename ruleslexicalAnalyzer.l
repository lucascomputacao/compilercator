digits [0-9]+
letter [a-zA-Z]
id (_|[a-zA-Z])(_|[a-zA-Z]|[0-9]|[0-9]+)*
operators (\+|\-|\*|\/|\,|\(|\)|\;|\=|\==|\~=|\<=|\>=|\>|\<|\{|\})
blanks (\t|" ")

%{
  FILE *fp;
  int line;
%}

%%
\n {line++;printf("Nova linha\n");}
{blanks} {printf("Blank\n"	);}
and	|
not	|
int	|
or	|
while	|
do	|
function |
end	|
for	|
else	|
if	|
elseif	|
then	|
return	|
local	|
nil	{printf("%s:Keyword\n ",yytext);}
{digits} {printf("%s:Digits\n ",yytext);}
 /*{id} {printf("%s:Identifier\n ",yytext); fputs(yytext, fp);}*/
{id} {printf("Identifier\n"); savetofile(yytext);}
{operators} {printf("%s:Operators\n  ",yytext);}
. {printf("%s: Error in line %d. This character does not belongs to language!\n  ",yytext, line); return 0;}
 /*.|\n*/
%%
#include <stdio.h>

FILE *fp;

void savetofile(char * text);

int main(void){
   fp = fopen("tokens.txt", "w+");

   // funçaõ do lex
   yylex();
   printf("\nTotal de linhas: %d \n", line);

   // fecha arquivo
   fclose(fp);

   return 0;
}

void savetofile (char * text){
    fwrite (text, 1, sizeof(text), fp);
}
