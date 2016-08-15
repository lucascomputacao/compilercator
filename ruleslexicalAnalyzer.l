number [0-9]+ 
letter [a-zA-Z]
name (_|[a-zA-Z])(_|[a-zA-Z]|[0-9]+)*
blanks (\t|" ")
newline \n
string ((\").*(\")|(\').*(\'))  
comment \-\-.*

%{
  FILE *fp;
  int count = 0;
  int line = 1; //inicia com primeira linha
  void savetofile(char * text, char * tipo);
%}

%%
and     {savetofile(yytext,"T_AND");}
not     {savetofile(yytext,"T_NOT");}
or      {savetofile(yytext,"T_OR");}
while   {savetofile(yytext,"T_WHILE");}
do      {savetofile(yytext,"T_DO");}
function {savetofile(yytext,"T_FUNCTION");}
end     {savetofile(yytext,"T_END");}
for     {savetofile(yytext,"T_FOR");}
else    {savetofile(yytext,"T_ELSE");}
if      {savetofile(yytext,"T_IF");}
elseif  {savetofile(yytext,"T_ELSEIF");}
then    {savetofile(yytext,"T_THEN");}
return  {savetofile(yytext,"T_RETURN");}
local   {savetofile(yytext,"T_LOCAL");}
nil     {savetofile(yytext,"T_NIL");}
print     {savetofile(yytext,"T_PRINT");}
\+       {savetofile(yytext,"T_PLUS");}
\-       {savetofile(yytext,"T_MINUS");}
\*       {savetofile(yytext,"T_TIMES");}
\/       {savetofile(yytext,"T_DIV");}
\,       {savetofile(yytext,"T_COMMA");}
\(       {savetofile(yytext,"T_OPENPAR");}
\)       {savetofile(yytext,"T_CLOSEPAR");}
\;       {savetofile(yytext,"T_SEMICOL");}
\=       {savetofile(yytext,"T_ASSIGN");}
\=\=       {savetofile(yytext,"T_EQ");}
\~\=       {savetofile(yytext,"T_NEQ");}
\<\=       {savetofile(yytext,"T_LTEQ");}
\>\=       {savetofile(yytext,"T_GTEQ");}
\<       {savetofile(yytext,"T_LT");}
\>       {savetofile(yytext,"T_GT");}
{comment}
  /*{string}  {printf("%s: String.\n", yytext); savetofile(yytext,"String");}*/
{newline} {line++;}
{blanks}
{number} {savetofile(yytext,"T_NUMBER");}
{name} {savetofile(yytext,"T_NAME");}
. {printf("%s: Error in line %d. This character doesn't belongs to language!\n",yytext, line); /*colocar return para parar no erro*/ }
%%
#include <stdio.h>

FILE *fp;

//void savetofile(char * text, char * tipo);

int main(void){ 
   fp = fopen("tokens.txt", "w+");
   // função do lex
   yylex();
   //printf("\nTotal de linhas: %d \n", line);
   fclose(fp);

   return 0;
}

void savetofile (char * text, char * tipo){
    //printf("\nstring passada: %s\n", text); // usada para debugar a string passada para a esta função
    if (count == 0 ){
        fprintf(fp, "[%s, \"%s\"]",tipo, text);
        count++;
    }else{
        fprintf(fp, ", [%s, \"%s\"]",tipo, text);
    }

}
