%{
/****************************************************************************
expr_plus.y
YACC file 
Date 2022/10/7
<2012307@mail.nankai.edu.cn>
****************************************************************************/

#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>  //导入isdigit()函数
#include <string.h> 
#define NSYMS 20        /* maximum number of symbols */
struct symtab {
        char *name;
        double value;
}symtab[NSYMS];       //记录标识符名字和数值的符号表
struct symtab *symlook(char *s);
	char idStr[50];
	int yylex();
	extern int yyparse();
	FILE* yyin;
	void yyerror(const char* s);
%}

//属性值可能具有的类型
%union {
        double  dval;
        struct symtab *symp;
}

//%token 为每一个都自动分配不等的整数值
%token ADD      
%token SUB
%token MUL
%token DIV
%token LEFTPAR
%token RIGHTPAR
%token <dval> NUMBER //数字对应属性值
%token UMINUS
%token equal
%token <symp> ID  //标识符对应属性值

%right equal
%left ADD SUB
%left MUL DIV
%right UMINUS
%left LEFTPAR RIGHTPAR

//表达式的属性值设置为数值类型
%type <dval> expr

%%
lines	:	lines expr ';'	{ printf("%f\n", $2); }
		| lines ';'
		|
		;

expr	: expr ADD expr { $$ = $1 + $3; }
		| expr SUB expr { $$ = $1 - $3; }
		| expr MUL expr { $$ = $1 * $3; }
		| expr DIV expr { $$ = $1 / $3; }
		| LEFTPAR expr RIGHTPAR { $$ = $2; }
		| UMINUS expr %prec UMINUS { $$ = -$2; }
		| NUMBER { $$ = $1; }
		| ID equal expr { $1->value=$3; $$=$3;}
		| ID {$$=$1->value;}  
		;


%%
int isLastCharPram=0;
int count=0;
int yylex()
{
	int t;
	count++;
	while (1)
	{
		t = getchar();
		if (t == ' ' || t == '\n' || t == '\t') { ; }
		else if (isdigit(t))
		{
			yylval.dval = 0;//属性值，在此处即指对应的数值
			while (isdigit(t))
			{
				yylval.dval = yylval.dval * 10 + t - '0';
				t = getchar();
			}
			ungetc(t, stdin);
			isLastCharPram=0;
			return NUMBER;
		}
		else if ((t>='a'&&t<='z')||(t>='A'&&t<='Z')||(t=='_'))//标识符以字母下划线开头
		{
			int ti=0;
			while ((t>='a'&&t<='z')||(t>='A'&&t<='Z')||(t=='_')||(t>='0'&&t<='9'))
			{
				idStr[ti]=t;
				t = getchar();
				ti++;
			}
			idStr[ti]='\0';

			char* temp = (char*)malloc (50*sizeof(char)); 
			strcpy(temp,idStr);
			yylval.symp=symlook(temp); 

			ungetc(t, stdin);
			isLastCharPram=0;
			return ID;
		}
		else if (t == '-')
		{
			if(count!=1&&isLastCharPram==0)
			{
				return SUB;
			}
			else
			{
				isLastCharPram=0;
				return UMINUS;
			}
		} 
		else if (t == '(')
		{
			isLastCharPram=1;
			return LEFTPAR;
		}
		else if(t == ';')
		{
			count=0;   // 每次读入一个字符串重新清0
			return t;
		}
        else if (t == '=')
		{
			isLastCharPram=0;
			return equal;
		}
		else
		{
			isLastCharPram=0;
			if (t == '+') return ADD;
			else if (t == '*') return MUL;
			else if (t == '/') return DIV;
			else if (t == ')') return RIGHTPAR;
			else return t;
		}
	}
}

int main()
{
	yyin = stdin;
	do {
		yyparse();
	} while (!feof(yyin));
	return 0;
}
void yyerror(const char* s) {
	fprintf(stderr, "Parse error: %s\n", s);
	exit(1);
}
// 符号表查找程序
// 返回一个符号表的表项
struct symtab* symlook(char *s){
    char *p;
    struct symtab *sp;
	// 遍历符号表中每一个表项
    for(sp=symtab;sp<&symtab[NSYMS];sp++){
		// 如果找到了表中存在这一项，返回指向该表项的指针
        if(sp->name && !strcmp(sp->name,s))
            return sp;
		// 如果找不到这一项，那就新建一个表项，strdup函数用于拷贝字符串
        if(!sp->name){
            sp->name=strdup(s);
            return sp;
            }
        }
        yyerror("Wrong input");
        exit(1);
}