%{
/**************************************************
operator.y
YACC file 
Date 2021/10/13
<nkliwenjie@163.com>
**************************************************/
// 定义段：包括头文件、函数定义、全局变量等
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#ifndef YYSTYPE
// 由于需要返回的是一个后缀表达式，是一个字符串，因此 YYSTYPE可声明为 char*
#define YYSTYPE char* // 用于确定$$的变量类型
#endif

char idStr[50];
char numStr[50];
int yylex();
extern int yyparse();
FILE* yyin;
void yyerror(const char* s);
%}


// 声明运算符的结合性和优先级，优先级由低到高的顺序声明
%token NUMBER
%token ID
%token ADD
%token SUB
%token MUL
%token DIV
%token LEFT_PAR
%token RIGHT_PAR

%left ADD SUB
%left MUL DIV
%right UMINUS // 取负

// 规则段：进行语法分析（包括CFG以及翻译模式）
%%

lines :    lines expr ';' { printf("%s\n", $2); } 
      |    lines ';'
      |
      ;
// 将计算值修改成字符串的拷贝（strcpy）和连接（strcat）
expr  :    expr ADD expr  { $$ = (char*)malloc(50*sizeof(char)); strcpy($$,$1); strcat($$,$3); strcat($$,"+"); }
      |    expr SUB expr  { $$ = (char*)malloc(50*sizeof(char)); strcpy($$,$1); strcat($$,$3); strcat($$,"- "); }
      |    expr MUL expr  { $$ = (char*)malloc(50*sizeof(char)); strcpy($$,$1); strcat($$,$3); strcat($$,"* "); }
      |    expr DIV expr  { $$ = (char*)malloc(50*sizeof(char)); strcpy($$,$1); strcat($$,$3); strcat($$,"/ "); }
      |    LEFT_PAR expr RIGHT_PAR   { $$ = $2; }
      |    SUB  expr %prec UMINUS  { $$ = (char*)malloc(50*sizeof(char)); strcpy($$,"- "); strcat($$,$2); }
      |    NUMBER         { $$ = (char*)malloc(50*sizeof(char)); strcpy($$,$1); strcat($$," "); }
      |    ID             { $$ = (char*)malloc(50*sizeof(char)); strcpy($$,$1); strcat($$," "); }  // ID 的翻译模式执行动作就修改为将 $1 的值赋给 ID
      ;

%%

// programs section

// yylex函数：实现词法分析功能
int yylex()
{
    int t;
    while(1){
        t=getchar();
        if(t==' ' || t=='\t'||t=='\n')
            ;
        
        // NUMBER 的翻译模式执行动作就修改为将yylval的值拷贝给 NUMBER，这里翻译模式的代码中并未出现 yylval，
        // 却依然完成了赋值操作，这是因为 yacc 与 lex 默认将 yylval 的值赋给了识别出的标识符
        // 也就是例子中的 $1, 所以这里的 strcpy($$,$1)也等价于 strcpy($$,yylval)
        else if ((t>='0' && t<= '9')){
            int ti=0;
            // 当读到一个字符为整数字符时，连续接下来的数字字符直到读到的不为数字字符的字符
            while((t>='0'&&t<='9')){
                numStr[ti]=t;
                t=getchar();
                ti++;
            }
            // 在字符串最后添加结束符\0
            numStr[ti]='\0';
            // 将这个字符串的地址赋给yylval
            yylval=numStr;
            ungetc(t,stdin);
            return NUMBER;
        }
        
        // 为当读到一个字符为字母或下划线时，连续读接下来的字符，直到出现一个不是数字或字母或下划线的字符停止
        else if ((t>='a'&& t<='z')||(t>='A'&&t<='Z')||(t=='_')){
            int ti=0;
            while((t>='a'&& t<='z')||(t>='A'&&t<='Z')||(t=='_')||(t>='0'&&t<='9')){
                idStr[ti]=t;
                ti++;
                t=getchar();
            }
            idStr[ti]='\0';
            // 将读到的若干字符存为一个字符串，将这个字符串的地址赋给 yylval
            yylval=idStr;
            ungetc(t,stdin);
            return ID;
        }
        else if(t=='+') {
            return ADD;  
        }
        else if(t=='-'){
            return SUB;
        }
        else if(t=='*'){
            return MUL;
        }
        else if(t=='/'){
            return DIV;
        }
        else if(t=='('){
            return LEFT_PAR;
        }
        else if(t==')'){
            return RIGHT_PAR;
        }
        else {
            return t;
        }
    }
}

int main(void)
{
    yyin = stdin;
    do{
        yyparse();
    } while(!feof(yyin));
    return 0;
}
void yyerror(const char* s){
    fprintf(stderr, "Parse error: %s\n", s);
    exit(1);
}