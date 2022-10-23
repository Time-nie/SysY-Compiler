%{
/**************************************************
expr.y
YACC file 
Date 2022/10/7
<2012307@mail.nankai.edu.cn>
**************************************************/
// 定义段：用于添加所需头文件、函数定义、全局变量等
// 直接复制到语法分析程序中
#include<stdio.h>
#include<stdlib.h>
#include <ctype.h>  //导入isdigit()函数

#ifndef YYSTYPE
// 用于确定$$的变量类型，由于返回的是简单表达式计算结果，因此定义为double类型
#define YYSTYPE double 
#endif
int yylex();

// yyparse不断调用yylex函数来得到token的类型
extern int yyparse();
FILE* yyin;
void yyerror(const char* s);
%}


// 声明运算符的结合性和优先级，优先级由低到高的顺序声明
%token NUMBER
%token ADD
%token SUB
%token MUL
%token DIV
%token LEFT_PAR
%token RIGHT_PAR

%left ADD SUB
%left MUL DIV
%right UMINUS // 取负

// 规则段：进行语法分析（包括上下文无关文法和翻译模式）
%%

// 处理输入的一行以分号结束的简单表达式
lines :    lines expr ';' { printf("%f\n", $2); } 
      |    lines ';'
      |
      ;

expr  :    expr ADD expr  { $$ = $1 + $3; } // $$代表产生式左部的属性值，$n 为产生式右部第n个token的属性值
      |    expr SUB expr  { $$ = $1 - $3; }
      |    expr MUL expr  { $$ = $1 * $3; }
      |    expr DIV expr  { $$ = $1 / $3; }
      |    LEFT_PAR expr RIGHT_PAR   { $$ = $2; }
      |    '-'expr %prec UMINUS  { $$ =-$2; }  // %prec 提升优先级
      |    NUMBER { $$ = $1; }
      ;
%%

// programs section

// yylex函数：实现词法分析功能
int yylex()
{
    // place you tiken retrieving code here
    int t;
    while (1) {
        t = getchar();
        if (t==' ' || t=='\t' || t=='\n'){
            // do nothing
        }
        else if (isdigit(t)) {
            yylval = 0;
            while (isdigit(t)) {
                yylval = yylval * 10 + t - '0';
                t = getchar();
            }
            // ungetc函数将读出的多余字符再次放回到缓冲区去，下一次读数字符进行下一个单词识别时会再次读出来。
            // 此时非数字字符已经读出，因此需要再次放回缓冲区
            ungetc(t, stdin);
            return NUMBER;
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
    // feof()是检测流上的文件结束符的函数，如果文件结束，则返回非0值，否则返回0
    do{
        yyparse();
    } while(!feof(yyin));
    return 0;
}

// 报错函数被yyparse()调用，以便在遇到错误时汇报错误
void yyerror(const char* s){
    fprintf(stderr, "Parse error: %s\n", s);
    exit(1);
}