%{
#include<stdio.h>
char infile[20],outfile[20];
int nc=0;
%}

%%
"/*"[a-zA-Z0-9\n\t ]*"*/"  {nc++;}
"//"[a-zA-Z0-9\t ]*"\n"   {nc++;}
%%

int main()
{
	scanf("%s",infile);
    scanf("%s",outfile);
    yyin=fopen(infile,"r");
	yyout=fopen(outfile,"w");
	yylex( );
	fprintf(yyout,"The number of comment lines=%d\n",nc);
	fclose(yyin);
	fclose(yyout);
}

int yywrap( )
{
	return 1;
}
