digits [0-9]+ 
letter [a-zA-Z]
id (_|[a-zA-Z])(_|[a-zA-Z]|[0-9]|[0-9]+)*
operators (\+|\-|\*|\/|\,|\(|\)|\;|\=|\==|\~=|\<=|\>=|\>|\<|\{|\})
blanks (\t|" ")

%{
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
{id} {printf("%s:Identifier\n ",yytext);}
{operators} {printf("%s:Operators\n  ",yytext);}
. {printf("%s:Error\n  ",yytext); return 0;}
 /*.|\n*/
%%
void teste (void);
int main(void){
   yylex();
   printf("\nLinhas : %d \n Valor:%s ", line, yytext);
   //teste();
   return 0;		
}


void teste (void){
  printf("teste de chamada de função dentro do lex");	
}

