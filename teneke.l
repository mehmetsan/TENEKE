letters [a-zğüşöçı_,*/_+A-ZĞÜŞÖÇ]+
integer [0-9]+
%{
#include "teneke.h"
int lineCounter = 1;
%}
%%
\\n {lineCounter++;}
olursa {printf("IF ",yytext); return (IF);}
olmazsa {printf("ELSE ",yytext); return(ELSE);}
başla {printf("BASLA ",yytext); return(BASLA);}
bitir. {printf("BITIR ",yytext); return(BITIR);}
fonksiyon {printf("FUNC_BEGIN ",yytext); return(FUNC_BEGIN);} 
fonksiyoff {printf("FUNC_END ",yytext); return(FUNC_END);}
\/ {printf("PARAM_DIV", yytext); return(PARAM_DIV);}
\( {printf("LP ",yytext); return(LP);}
\) {printf("RP ",yytext); return(RP);}
\[ {printf("LSQ ",yytext); return(LSQ);}
\] {printf("RSQ ",yytext); return(RSQ);}
\; {printf("SEMI_COL ",yytext); return(SEMI_COL);}
\. {printf("END_LINE",yytext); return(END_LINE);}
veya {printf("OR_OP ",yytext); return(OR_OP);}
ve {printf("AND_OP ",yytext); return(AND_OP);}
denkse {printf("DENKLIK ",yytext); return(DENKLIK);}
farklıysa {printf("FARKLILIK ",yytext); return(FARKLILIK);}
büyükken {printf("BUYUK ",yytext); return(BUYUK);}
küçükken {printf("KUCUK ",yytext); return(KUCUK);}
büyük_eşitken {printf("BUYUK_ESIT ",yytext); return(BUYUK_ESIT);}
küçük_eşitken {printf("KUCUK_ESIT ",yytext); return(KUCUK_ESIT);}
olurken {printf("LOOP ",yytext); return(LOOP);}
artıbir {printf("INCREMENT ",yytext); return(INCREMENT);}
eksibir {printf("DECREMENT ",yytext); return(DECREMENT);}
eksi {printf("MINUS ",yytext); return(MINUS);}
artı {printf("PLUS ",yytext); return(PLUS);}
çarpı {printf("MULT ",yytext); return(MULT);}
bölü {printf("DIV ",yytext); return(DIV);}
denktir {printf("ASSIGNMENT_OP ",yytext); return(ASSIGNMENT_OP);}
oku! {printf("SCAN ",yytext); return(SCAN);}
bas! {printf("PRINT ",yytext); return(PRINT);}
yürü {printf("YURU ",yytext); return(YURU);}
dön {printf("DON ",yytext); return(DON);}
tut {printf("TUT ",yytext); return(TUT);}
bırak {printf("SAL ",yytext); return(BIRAK);}
data_oku {printf("DATA_OKU ",yytext); return(DATA_OKU);}
data_ver {printf("DATA_AT ",yytext); return(DATA_VER);}
data_al {printf("DATA_VER ",yytext); return(DATA_AL);}
dönüyor {printf("RETURN ",yytext); return(RETURN);}
dizi {printf("ARRAY_INIT ",yytext); return(ARRAY_INIT);}
doğru|yanlış {printf("MANTIK_DEGERI ",yytext); return(MANTIK_DEGERI);}
\:.+\: {printf("COMMENT ",yytext); return(COMMENT);}
{integer} {printf("INT ",yytext); return(INT);}
{letters}  {printf("VAR ",yytext); return(VAR);}
({letters}{integer}) {printf("VAR ",yytext); return(VAR);}

. printf(" ");
%%
extern int lineCounter;

int main()
{
int i=0;
	while(i < 30)
	{
		yylex();
        i++;
	}
}
int yywrap(void) {return 1;}
