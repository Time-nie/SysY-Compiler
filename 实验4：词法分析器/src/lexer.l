 //定义段
%option noyywrap
%{
    /*
    * You will need to comment this line in lab5.
    */
    #define ONLY_FOR_LEX
    
    #ifdef ONLY_FOR_LEX
    #else
    #define YYSTYPE void *
    #include "parser.h"
    #endif

    #define YY_NO_UNPUT
    #define YY_NO_INPUT
    #include <string>

    #ifdef ONLY_FOR_LEX
    #include <ostream>
    #include <fstream>
    #include <malloc.h>
    #include <unordered_map>
    using namespace std;
    extern FILE *yyin; 
    extern FILE *yyout;



    //链表形式组织符号表（此处符号表只记录ID）
    //链表节点
    struct node {
        char name[56];
        node* prev, * next;
    };
    //链表
    struct id_list {
        node* head, * tail;
        int count;
    };

    id_list idlist;

    // 初始化符号表链表
    void init_idlist() {
        idlist.head = (node*)malloc(sizeof(node));
        idlist.head->next = idlist.head->prev = nullptr;
        idlist.tail = idlist.head;
        idlist.count = 0;
    }

    // 链表中添加元素
    node* add(char* s) {
        node *id_elem = nullptr;
        id_elem = (node*)malloc(sizeof(node));
        strcpy(id_elem->name, s);
        idlist.tail->next = id_elem;
        id_elem->prev = idlist.tail;
        id_elem->next = nullptr;
        idlist.tail = id_elem;
        idlist.count++;
        return id_elem;
    }

    //自定义stack_element类（符号栈中元素）
    /*
    每个栈元素stack_element会持有一个指向前一元素的指针pre和一个map
    map是无序的，存储的是当前这个{}范围下所有的映射对：<标识符名，对应符号表表项的地址>
    */
    class stack_element {
    private:
        unordered_map<string, node*> map;
        stack_element* prev;
    public:
        //初始化空的符号栈的首元素
        stack_element() {
            prev = nullptr;
        }
        //往符号栈里压元素，新压入元素的pre自然就是低他一层的元素
        stack_element(stack_element* back) {
            prev = back;
        }
        void add_into_map(string name, node* id) {
            map[name] = id;
        }
        stack_element* get_prev() {
            return prev;
        }
        node* get_identifier(string name) {
            if (map.empty()) {
                return nullptr;
            }
            if (map.find(name) != map.end()) {
                return map[name];
            }
            else return nullptr;
        }
        ~stack_element() {
            prev = nullptr;
            unordered_map<string, node*>().swap(map);
            malloc_trim(0);
        }
    };

    // symble_stack 类，识别到标识符将其存入符号栈中，最后再一次性输出
    class symble_stack: public stack_element {
    private:
        // 栈的顶部
        stack_element* top;
    public:
        // 初始化，之所以要初始化一个top表项，是为了存储全局标识符，这些标识符没有{}标识
        symble_stack() {
            stack_element* t = new stack_element();
            top = t;
        }

        //栈中的每一个元素都代表一个{}范围内所有标识符相关的存储
        // 添加元素
        void push() {
            stack_element* t = new stack_element(top);
            top = t;
        }

        // 弹出元素
        void pop() {
            stack_element* p;
            p = top;
            top = top->get_prev();
            p->~stack_element();
        }

        // 添加标识符
        void add_map(string name, node* id) {
            top->add_into_map(name, id);
        }

        //查找符号栈中是否曾出现过同样的标识符
        node* lookup(string name) {
        // 1. 未出现：创建一个新的idlist_entry，并添加到top指针指向的map中，然后返回idlist_entry的地址
        // 2. 已出现：返回对应的idlist_entry地址

            node* p_entry = nullptr;

            //搜索：从栈顶依次向下搜索,因为{}可能层层嵌套
            stack_element* p;
            p = top;
            do {
                p_entry = p->get_identifier(name);
                if (p_entry) {
                    //p_entry不为空，意味着已经找到了
                    return p_entry;
                }
                //p_entry为空，意味着还没找到，继续向下搜索
                p = p->get_prev();
            } while (p);
            

            //搜索不到，于是这是一个新的标识符
            p_entry = add((char*)name.c_str());
            top->add_into_map(name, p_entry);
            return p_entry;
        }
    };

    symble_stack stack;

    // DEBUG_FOR_LAB4 将我们传递的字符串由 yyout 输出
    //打印除ID外所有符号串的单词，词素，行号
    void DEBUG_FOR_LAB4(string s)
    {
        string DEBUG_INFO = "\t" + s + "\t" + to_string(yylineno) +"\n";
        fputs(DEBUG_INFO.c_str(), yyout);
    }
    
    // 打印ID:单词，词素，行号，符号表项的地址
    void print_id(node* id_elem) {
        char* INFO = new char[1024];
        sprintf(INFO, "\t%s\t%s\t%d\t%p\n", "IDENTIFIER", yytext, yylineno, id_elem);
        fputs(INFO, yyout);
        delete INFO;
    }

    #endif
%}
 //十进制
DECIMIAL ([1-9][0-9]*|0)  
 //八进制
OCTAL (0[0-7]+)           
 //十六进制
HEXADECIMAL (0[xX][0-9A-Fa-f]+)            

ID [[:alpha:]_][[:alpha:][:digit:]_]*
 //回车换行符
EOL (\r\n|\n|\r)   
 //制表符（空格）
WHITE [\t ]        

%x BLOCKCOMMENT            
 //块注释    
BLOCKCOMMENTBEGIN "/*"           
 //通配符+换行
BLOCKCOMMENTELEMENT .|\n         
BLOCKCOMMENTEND "*/" 
 //行注释：以双斜杠开头，后跟若干个非换行的字符
LINECOMMENT \/\/[^\n]*


 //规则段
%%
  //step1: 补充终结符
  //step2: 补充十六，八进制，注释等的处理
  //step3：考虑需要存入符号表的符号的处理：{ , } ,ID
"int" {
    /*
    * Questions: 
    *   Q1: Why we need to return INT in further labs?
    *   Q2: What is "INT" actually?
    */
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("INT\tint");   
    #else
        return INT;
    #endif
}
"void" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("VOID\tvoid");
    #else
        return VOID;
    #endif 
}
"if" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("IF\tif");
    #else
        return IF;
    #endif
};
"else" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("ELSE\telse");
    #else
        return ELSE;
    #endif
};
"return" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("RETURN\treturn");
    #else
        return RETURN;
    #endif
}
"const" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("CONST\tconst");
    #else
        return CONST;
    #endif 
}
"while" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("WHILE\twhile");
    #else
        return WHILE;
    #endif
}
"break" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("BREAK\tbreak");
    #else
        return BREAK;
    #endif
}
"continue" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("CONTINUE\tcontinue");
    #else
        return CONTINUE;
    #endif
}
"=" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("ASSIGN\t=");
    #else
        return ASSIGN;
    #endif
}
"==" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("EQUAL\t==");
    #else
        return EQUAL;
    #endif
}
"!=" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("NOTEQUAL\t!=");
    #else
        return NOTEQUAL;
    #endif
}
"<=" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LESSEQUAL\t<=");
    #else
        return LESSEQUAL;
    #endif
}
">=" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("GREATEREQUAL\t<=");
    #else
        return GREATEREQUAL;
    #endif
}
"<" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LESS\t<");
    #else
        return LESS;
    #endif
}
">" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("GREATER\t>");
    #else
        return GREATER;
    #endif
}
"+" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("ADD\t+");
    #else
        return ADD;
    #endif
}
"-" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("SUB\t-");
    #else
        return SUB;
    #endif
}
"*" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("MUL\t*");
    #else
        return MUL;
    #endif
}
"/" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("DIV\t/");
    #else
        return DIV;
    #endif
}
"%" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("MOD\t%");
    #else
        return MOD;
    #endif
}
"&&" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("AND\t&&");
    #else
        return AND;
    #endif
}
"||" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("OR\t||");
    #else
        return OR;
    #endif
}
"!" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("NOT\t!");
    #else
        return NOT;
    #endif
}
";" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("SEMICOLON\t;");
    #else
        return SEMICOLON;
    #endif
}
"(" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LPAREN\t(");
    #else
        return LPAREN;
    #endif
}
")" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("RPAREN\t)");
    #else
    return RPAREN;
    #endif
}
"[" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LBRACKET\t[");
    #else
        return LBRACKET;
    #endif
}
"]" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("RBRACKET\t]");
    #else
        return RBRACKET;
    #endif
}
"," {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("COMMA\t,");
    #else
        return COMMA;
    #endif
}

"{" { 
    #ifdef ONLY_FOR_LEX
        stack.push();
        DEBUG_FOR_LAB4("LBRACE\t{");
    #else
        return LBRACE;
    #endif    
}

"}" { 
    #ifdef ONLY_FOR_LEX
        stack.pop();
        DEBUG_FOR_LAB4("RBRACE\t}");
    #else
        return RBRACE;
    #endif    
}


{DECIMIAL} {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4(string("NUMBER\t") + string(yytext));
    #else
        return INTEGER;
    #endif
}

{OCTAL} {
    #ifdef ONLY_FOR_LEX
        //sscanf()会将参数str的字符串根据参数format字符串来转换并格式化数据,转换后的结果存于对应的参数内，与sprintf相对
        int num;
        sscanf(yytext, "%o", &num);  //将8进制转为10进制数
        DEBUG_FOR_LAB4(string("NUMBER\t") + to_string(num));
    #else
        return INTEGER;
    #endif
}

{HEXADECIMAL} {
    #ifdef ONLY_FOR_LEX
        int num;
        sscanf(yytext, "%x", &num);  //将16进制转为10进制数
        DEBUG_FOR_LAB4(string("NUMBER\t") + to_string(num));
    #else
        return INTEGER;
    #endif
}

<*>{EOL} {              // EOL回车换行符
    yylineno++;
}

{WHITE} {}

{LINECOMMENT} {}   //处理注释，使用定义好的独占状态BLOCKCOMMENT
{BLOCKCOMMENTBEGIN} {BEGIN BLOCKCOMMENT;}
<BLOCKCOMMENT>{BLOCKCOMMENTELEMENT} {}
<BLOCKCOMMENT>{BLOCKCOMMENTEND} {BEGIN INITIAL;} //使用宏BEGIN来切换状态，初始状态默认为INITIAL 


{ID}  { 
    string str = yytext; //yytext = 词素
    node *p = stack.lookup(str);
    print_id(p);
}

     
%%           //代码段（用户子程序）
#ifdef ONLY_FOR_LEX
int main(int argc, char **argv){
    if(argc != 5){
        fprintf(stderr, "Argument Not Enough");
        exit(EXIT_FAILURE);
    }

    if(!(yyin = fopen(argv[1], "r"))){
        fprintf(stderr, "No such file or directory: %s", argv[1]);
        exit(EXIT_FAILURE);
    }

    if(!(yyout = fopen(argv[3], "w"))){
        fprintf(stderr, "No such file or directory: %s", argv[3]);
        exit(EXIT_FAILURE);
    }

    // 初始化符号表（链表）
    init_idlist();

    yylex();
    return 0;
}
#endif
