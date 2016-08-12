number [0-9]+
letter [a-zA-Z]
name (_|[a-zA-Z])(_|[a-zA-Z]|[0-9]|[0-9]+)*
blanks (\t|" ")
newline \n
string ((\").*(\")|(\').*(\'))  
comment (\-)(\-).*

%{
  FILE *fp;
  int line = 1; //inicia com primeira linha
  void savetofile(char * text, char * tipo);
%}

%%
and     {printf("%s: T_AND.\n", yytext); savetofile(yytext,"T_AND");}
not     {printf("%s: T_NOT.\n", yytext); savetofile(yytext,"T_NOT");}
or      {printf("%s: T_OR.\n", yytext); savetofile(yytext,"T_OR");}
while   {printf("%s: T_WHILE.\n", yytext); savetofile(yytext,"T_WHILE");}
do      {printf("%s: T_DO.\n", yytext); savetofile(yytext,"T_DO");}
function {printf("%s: T_FUNCTION.\n", yytext); savetofile(yytext,"T_FUNCTION");}
end     {printf("%s: T_END.\n", yytext); savetofile(yytext,"T_END");}
for     {printf("%s: T_FOR.\n", yytext); savetofile(yytext,"T_FOR");}
else    {printf("%s: T_ELSE.\n", yytext); savetofile(yytext,"T_ELSE");}
if      {printf("%s: T_IF \n", yytext); savetofile(yytext,"T_IF");}
elseif  {printf("%s: T_ELSEIF.\n", yytext); savetofile(yytext,"T_ELSEIF");}
then    {printf("%s: T_THEN.\n", yytext); savetofile(yytext,"T_THEN");}
return  {printf("%s: T_RETURN.\n", yytext); savetofile(yytext,"T_RETURN");}
local   {printf("%s: T_LOCAL.\n", yytext); savetofile(yytext,"T_LOCAL");}
nil     {printf("%s: T_NIL.\n", yytext); savetofile(yytext,"T_NIL");}
print     {printf("%s: T_PRINT.\n", yytext); savetofile(yytext,"T_PRINT");}
\+       {printf("%s: T_PLUS.\n", yytext); savetofile(yytext,"T_PLUS");} 
\-       {printf("%s: T_MINUS.\n", yytext); savetofile(yytext,"T_MINUS");}  
\*       {printf("%s: T_TIMES.\n", yytext); savetofile(yytext,"T_TIMES");}  
\/       {printf("%s: T_DIV.\n", yytext); savetofile(yytext,"T_DIV");}  
\,       {printf("%s: T_COMMA.\n", yytext); savetofile(yytext,"T_COMMA");}  
\(       {printf("%s: T_OPENPAR.\n", yytext); savetofile(yytext,"T_OPENPAR");}
\)       {printf("%s: T_CLOSEPAR.\n", yytext); savetofile(yytext,"T_CLOSEPAR");}
\;       {printf("%s: T_SEMICOL.\n", yytext); savetofile(yytext,"T_SEMICOL");}
\=       {printf("%s: T_ASSIGN.\n", yytext); savetofile(yytext,"T_ASSIGN");}
\=\=       {printf("%s: T_EQ.\n", yytext); savetofile(yytext,"T_EQ");}
\~\=       {printf("%s: T_NEQ.\n", yytext); savetofile(yytext,"T_NEQ");}
\<\=       {printf("%s: T_LTEQ.\n", yytext); savetofile(yytext,"T_LTEQ");}
\>\=       {printf("%s: T_GTEQ.\n", yytext); savetofile(yytext,"T_GTEQ");}
\>       {printf("%s: T_LT.\n", yytext); savetofile(yytext,"T_LT");}
\<       {printf("%s: T_GT.\n", yytext); savetofile(yytext,"T_GT");}
{comment} {printf("%s: Comment.\n", yytext);}
{string}  {printf("%s: String.\n", yytext); savetofile(yytext,"String");}
{newline} {line++;printf("New line.\n");}
{blanks} {printf("Blank.\n");}
{number} {printf("%s: T_NUMBER.\n ",yytext);savetofile(yytext,"T_NUMBER");}
{name} {printf("%s: T_NAME.\n",yytext); savetofile(yytext,"T_NAME");}
. {printf("%s: Error in line %d. This character doesn't belongs to language!\n",yytext, line); /*colocar return para parar no erro*/ }
%%
#include <stdio.h>

FILE *fp;

//void savetofile(char * text, char * tipo);

int main(void){ 
   fp = fopen("tokens.txt", "w+");
   // função do lex
   yylex();
   printf("\nTotal de linhas: %d \n", line);
   fclose(fp);

   return 0;

}

void savetofile (char * text, char * tipo){
    //printf("\nstring passada: %s\n", text); // usada para debugar a string passada para a esta função
    fprintf(fp, "[%s, \"%s\"]\n",tipo, text);
}
