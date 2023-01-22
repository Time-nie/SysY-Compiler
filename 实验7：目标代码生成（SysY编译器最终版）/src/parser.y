// 使用子结点构造父节点，从而构造出整个AST
%code top{
    #include <iostream>
    #include <assert.h>
    #include <cstring>
    #include <stack>
    #include "parser.h"
    extern Ast ast;
    int yylex();
    int yyerror( char const * );
    std::stack<StmtNode*> While_stack;
    int idx;
    int* arrayValue;
    std::stack<InitArray*> Arr_stack;
    ArrayType* arrayType;
    int leftCnt = 0;
    int paramNo = 0;
}

%code requires {
    #include "Ast.h"
    #include "SymbolTable.h"
    #include "Type.h"
}

//属性值可能的取值类型
%union {
    int itype;
    char* strtype;
    StmtNode* stmttype;
    ExprNode* exprtype;
    Type* type;
    SymbolEntry* se;
}

%start Program
%token <strtype> ID 
%token <itype> INTEGER
%token IF ELSE WHILE
%token INT VOID
%token LPAREN RPAREN LBRACE RBRACE SEMICOLON LBRACKET RBRACKET COMMA  
%token ADD SUB MUL DIV MOD OR AND LESS LEQ MORE MEQ ASSIGN EQ NE NOT
%token CONST
%token RETURN BREAK CONTINUE


%nterm <stmttype> Stmts Stmt AssignStmt BlockStmt IfStmt WhileStmt BreakStmt ContinueStmt ReturnStmt DeclStmt FuncDef EmptyStmt FuncDefParams FuncDefParam VarDefs ConstDefs VarDef ConstDef ExprStmt MaybeFuncDefParams
%nterm <exprtype> Exp AddExp MulExp UnaryExp InitVal ConstInitVal InitValList ConstInitValList FuncArrayIndices FuncCallExp Cond LOrExp  EqExp PrimaryExp LVal ArrayIndices RelExp LAndExp FuncCallParams 
%nterm <type> Type

%precedence THEN
%precedence ELSE   //让else的优先级更高，即else优先与最近的if匹配
%%

/*
parse.y 实现类型检查部分：
变量（常量）声明：1）类型不能为void；2）重复声明
变量（常量）使用：未声明
函数调用时未声明
*/

//----------------------------编译单元---------------------------
Program
    : Stmts {
        ast.setRoot($1);
    }
    ;

//----------------------------类型---------------------------

Type
    : INT {
        $$ = TypeSystem::intType;
    }
    | VOID {
        $$ = TypeSystem::voidType;
    }
    ;

//----------------------------语句---------------------------
Stmts
    : Stmt {$$=$1;}
    | Stmts Stmt{
        $$ = new SeqNode($1, $2);
    }
    ;
Stmt
    : AssignStmt {$$=$1;}
    | BlockStmt {$$=$1;}
    | IfStmt {$$=$1;}
    | WhileStmt {$$=$1;}
    | BreakStmt {$$=$1;}
    | ContinueStmt {$$=$1;}
    | ReturnStmt {$$=$1;}
    | DeclStmt {$$=$1;}
    | FuncDef {$$=$1;}
    | EmptyStmt {$$=$1;}
    | ExprStmt {$$=$1;}
    ;
LVal
    : ID {
        SymbolEntry *se;
        //identifiers为一个SymbolTable*类型的外部变量
        //寻找当前域中是否有这个标识符，并返回表项指针，若没有，则语法有问题，报错
        se = identifiers->lookup($1);
        if(se == nullptr)
        {
            // 如果找不到报错
            fprintf(stderr, "identifier \"%s\" is undefined\n", (char*)$1);
            delete [](char*)$1;
            assert(se != nullptr);
        }
        //new了一个ID类的结点，这个类继承自ExprNode
        $$ = new Id(se);
        delete []$1;
    }  
    | ID ArrayIndices{  //数组
        SymbolEntry* se;
        se = identifiers->lookup($1);
        if(se == nullptr)
            fprintf(stderr, "identifier \"%s\" is undefined\n", (char*)$1);
        $$ = new Id(se, $2);
        delete []$1;
    }
    ;
//坑！！识别诸如单独函数调用的语句
ExprStmt
    : Exp SEMICOLON {
        $$ = new ExprStmt($1);
    }

AssignStmt
    :
    LVal ASSIGN Exp SEMICOLON {
        $$ = new AssignStmt($1, $3);
    }
    ;
BlockStmt  //语句块
    :   LBRACE 
        //每一个块{}都新建一个符号表来保存当前标识符,原有的符号表会由现在符号表的pre指针指向
        {identifiers = new SymbolTable(identifiers);} 
        Stmts RBRACE 
        {
            //每一个{}的作用域里面都是一个复合语句-此处为抽象的非终结符Stmts
            $$ = new CompoundStmt($3);
            //遇到}，当前的块语句结束，删除top符号表
            SymbolTable *top = identifiers;
            identifiers = identifiers->getPrev();
            delete top;
        }
    ;
IfStmt
    //之前已经约定else优先级高于then；产生式的优先级与该产生式最右边的终结符优先级相同
    //%prec THEN的作用是解决悬空-else的二义性问题，他会将终结符THEN的优先级赋给下述产生式
    //这样的话，下述第二个候选式优先级更高（即else优先匹配）
    : IF LPAREN Cond RPAREN Stmt %prec THEN {
        $$ = new IfStmt($3, $5);
    }
    | IF LPAREN Cond RPAREN Stmt ELSE Stmt {
        $$ = new IfElseStmt($3, $5, $7);
    }
    ;

WhileStmt
    :   WHILE LPAREN Cond RPAREN {
        WhileStmt *whileNode = new WhileStmt($3);
        $<stmttype>$ = whileNode;
        While_stack.push(whileNode);
        }
        Stmt {
        StmtNode *whileNode = $<stmttype>5; 
        ((WhileStmt*)whileNode)->setStmt($6);
        $$=whileNode;
        While_stack.pop();
    }
    ;

BreakStmt   //Break语句
    : BREAK SEMICOLON {
        $$ = new BreakStmt(While_stack.top());
    }
    ;
    
ContinueStmt   //Continue语句
    : CONTINUE SEMICOLON {
        $$ = new ContinueStmt(While_stack.top());
        // $$ = new ContinueStmt();
    }
    ;
ReturnStmt    // 返回语句
    :
    RETURN Exp SEMICOLON{
        $$ = new ReturnStmt($2);
    }
    |
    RETURN SEMICOLON{
        $$ = new ReturnStmt();
    }
    ;
EmptyStmt    //空语句
    : SEMICOLON {
        $$ = new EmptyStmt();
    }
    | LBRACE RBRACE {
        $$=new EmptyStmt();
    }
    ;
Exp   // 算数表达式
    :
    AddExp {$$ = $1;}
    ;
Cond   // 关系+逻辑运算（补）
    :
    LOrExp {$$ = $1;}
    ;

AddExp  // 加减法(双目算数表达式)
    : MulExp {$$ = $1;}
    | AddExp ADD MulExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::ADD, $1, $3);
    }
    | AddExp SUB MulExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::SUB, $1, $3);
    }
    ;

MulExp  // 乘除模(双目算数表达式)
    : UnaryExp {$$ = $1;}
    | MulExp MUL UnaryExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::MUL, $1, $3);
    }
    | MulExp DIV UnaryExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::DIV, $1, $3);
    }
    | MulExp MOD UnaryExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::MOD, $1, $3);
    }
    ;

UnaryExp  //单目运算(双目算数表达式)
    :
    PrimaryExp {$$ = $1;}
    |
    ADD UnaryExp  //'+'号
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new UnaryExpr(se, UnaryExpr::ADD, $2);
    }
    |
    SUB UnaryExp  //'-'号
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new UnaryExpr(se, UnaryExpr::SUB, $2);
    }
    |
    NOT UnaryExp  //'!'号
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new UnaryExpr(se, UnaryExpr::NOT, $2);
    }
    |
    FuncCallExp {$$ = $1;}
    ;

FuncCallExp //函数调用
    : ID LPAREN RPAREN {   // 没有参数
        SymbolEntry* se;
        se = identifiers->lookup($1);
        //函数调用前必须要有声明/定义
        if(se == nullptr)
        {
            fprintf(stderr, "function \"%s\" is undefined\n", (char*)$1);
            delete [](char*)$1;
            assert(se != nullptr);
        }
        $$ = new FuncCallExpr(se);
    }
    | ID LPAREN FuncCallParams RPAREN {   
        SymbolEntry* se;   
        se = identifiers->lookup($1);
        if(se == nullptr)
        {
            fprintf(stderr, "function \"%s\" is undefined\n", (char*)$1);
            delete [](char*)$1;
            assert(se != nullptr);
        }
        $$ = new FuncCallExpr(se, $3);
    }
    ;

//函数调用参数列表（实参），参数1，参数2...
FuncCallParams 
    : Exp {$$ = $1;}
    //COMMA为逗号
    | FuncCallParams COMMA Exp {
        $$ = $1;
        $$->setLink($3);
    }
    ;

PrimaryExp  // 基本数字/ID
    : LPAREN Exp RPAREN {
        $$ = $2;
    }
    | LVal {
        $$ = $1;
    }
    | INTEGER {
        SymbolEntry* se = new ConstantSymbolEntry(TypeSystem::intType, $1);
        $$ = new Constant(se);
    }
    ;

LOrExp
    : LAndExp {$$ = $1;}
    | LOrExp OR LAndExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::OR, $1, $3);
    }
    ;

LAndExp
    : EqExp {$$ = $1;}
    | LAndExp AND EqExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::AND, $1, $3);
    }
    ;

EqExp
    : RelExp {$$ = $1;}
    | EqExp EQ RelExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::EQ, $3, $1);
    }
    | EqExp NE RelExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::NE, $3, $1);
    }
    ;

RelExp
    : AddExp {$$ = $1;}
    | RelExp LESS AddExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::MORE, $3, $1);
    }
    | RelExp LEQ AddExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::MEQ, $3, $1);
    }
    | RelExp MORE AddExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::LESS, $3, $1);
    }
    | RelExp MEQ AddExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::LEQ, $3, $1);
    }
    ;



//----------------------------声明---------------------------
DeclStmt
    :
    //变量声明
    Type VarDefs SEMICOLON {
        //变量的类型不能为void
        if($1==TypeSystem::voidType)
        {
            fprintf(stderr, "variable type can't be void type\n");   
            assert($1!=TypeSystem::voidType);
        }
        $$ = $2;
    }
    |
    //常量声明
    CONST Type ConstDefs SEMICOLON {
        //常量的类型不能为void
        if($2==TypeSystem::voidType)
        {
            fprintf(stderr, "constant variable type can't be void type\n");   
            assert($2!=TypeSystem::voidType);
        }
        $$ = $3;
    }
    ;
VarDefs
    : VarDefs COMMA VarDef {
        $$ = $1;
        $1->setLink($3); //参数表的参数通过指针串起来
    } 
    | VarDef {$$ = $1;}
    ;
ConstDefs
    : ConstDefs COMMA ConstDef {
        $$ = $1;
        $1->setLink($3);
    }
    | ConstDef {$$ = $1;}
    ;


VarDef
    : ID {   //新创建标识符，和前面的LVAL不同
        //检查变量是否重复声明
        if(identifiers->lookup($1))
        {
            //在当前作用域能够找到这个标识符名字，表示重复定义
            fprintf(stderr, "identifier \"%s\" is defined twice\n", (char*)$1);
            //assert(identifiers->lookup($1)==nullptr);
        }
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(TypeSystem::intType, $1, identifiers->getLevel());
        identifiers->install($1, se);
        $$ = new DeclStmt(new Id(se));
        delete []$1;
    }
    // a[2][3] vec存2和3
    | ID ArrayIndices {
        fprintf(stderr,"VarDef:ID ArrayIndices\n");
        SymbolEntry* se;
        std::vector<int> vec;
        ExprNode* temp = $2;
        //获取每一个数组维度的值，如2
        while(temp){
            vec.push_back(temp->getValue());
            temp = (ExprNode*)(temp->getLink());
        }
        Type *type = TypeSystem::intType;
        Type* temp1;

        //设置当前数组的类型type->多维数组-数组的数组        
        while(!vec.empty()){
            temp1 = new ArrayType(type, vec.back());
            if(type->isArray())
                ((ArrayType*)type)->setArrayType(temp1);
            type = temp1;
            vec.pop_back();
        }
        arrayType = (ArrayType*)type;
        se = new IdentifierSymbolEntry(type, $1, identifiers->getLevel());

        // 当前的情况是未赋初值的数组，所以调用setAllZero        
        ((IdentifierSymbolEntry*)se)->makeZero();
        int *p = new int[type->getSize()];
        ((IdentifierSymbolEntry*)se)->setArrayValue(p);
        identifiers->install($1, se);
        $$ = new DeclStmt(new Id(se));
        delete []$1;
    }
    | ID ASSIGN Exp {
        //配合样例先删去
        //检查变量是否重复声明
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(TypeSystem::intType, $1, identifiers->getLevel());
        identifiers->install($1, se);
        $$ = new DeclStmt(new Id(se), $3);
        delete []$1;
    }
    | ID ArrayIndices ASSIGN {
        fprintf(stderr,"VarDef-ID ArrayIndices ASSIGN\n");
        SymbolEntry* se;
        std::vector<int> vec;
        ExprNode* temp = $2;
        while(temp){
            vec.push_back(temp->getValue());
            temp = (ExprNode*)(temp->getLink());
        }
        Type* type = TypeSystem::intType;
        Type* temp1;
        for(auto it = vec.rbegin(); it != vec.rend(); it++) {
            temp1 = new ArrayType(type, *it);
            if(type->isArray())
                ((ArrayType*)type)->setArrayType(temp1);
            type = temp1;
        }
        arrayType = (ArrayType*)type;
        idx = 0;
        //把Arr_stack清空
        std::stack<InitArray*>().swap(Arr_stack);
        se = new IdentifierSymbolEntry(type, $1, identifiers->getLevel());
        $<se>$ = se;
        arrayValue = new int[arrayType->getSize()];
    }
      InitVal {
   
        //arrayValue在InitVal的语义动作中去赋值  
        ((IdentifierSymbolEntry*)$<se>4)->setArrayValue(arrayValue);
        if(((InitArray*)$5)->isEmpty())
            ((IdentifierSymbolEntry*)$<se>4)->makeZero();
        identifiers->install($1, $<se>4);
        $$ = new DeclStmt(new Id($<se>4), $5);
        delete []$1;
    }
    ;
//[2][3]
ArrayIndices
    : LBRACKET Exp RBRACKET {
        $$ = $2;
    }
    | ArrayIndices LBRACKET Exp RBRACKET {
        $$ = $1;
        $1->setLink($3);
    }
    ;

//{{2,3},2+3,5}
InitVal 
    : Exp {
        fprintf(stderr,"InitVal-Exp IN\n");
        fprintf(stderr,"%s\n",$1->getSymPtr()->getType()->toStr().c_str());
        fprintf(stderr,"111111111111111111\n");
        $$ = $1;
        if(!Arr_stack.empty()){
            arrayValue[idx++] = $1->getValue();
            Type* arrTy = Arr_stack.top()->getSymPtr()->getType();
            if(arrTy == TypeSystem::intType)
                Arr_stack.top()->addExpr($1);
            else
                while(arrTy){
                    if(((ArrayType*)arrTy)->getEType() != TypeSystem::intType){
                        arrTy = ((ArrayType*)arrTy)->getEType();
                        SymbolEntry* se = new ConstantSymbolEntry(arrTy);
                        InitArray* list = new InitArray(se);
                        Arr_stack.top()->addExpr(list);
                        Arr_stack.push(list);
                    }else{
                        Arr_stack.top()->addExpr($1);
                        while(Arr_stack.top()->isFull() && Arr_stack.size() != (long unsigned int)leftCnt){
                            arrTy = ((ArrayType*)arrTy)->getArrayType();
                            Arr_stack.pop();
                        }
                        break;
                    }
                }
        fprintf(stderr,"InitVal-Exp out\n");
        }         
    }//a[2]={}
    | LBRACE RBRACE {
        fprintf(stderr,"InitVal-LBRACE RBRACE\n");
        SymbolEntry* se;
        ExprNode* list;
        if(Arr_stack.empty()){
            // 如果只用一个{}初始化数组，那么栈一定为空,此时也没必要再加入栈了
            memset(arrayValue, 0, arrayType->getSize());
            idx += arrayType->getSize() / TypeSystem::intType->getSize();
            se = new ConstantSymbolEntry(arrayType);
            list = new InitArray(se);
        }else{//{{1,2},{}}
            // 栈不空说明肯定不是只有{}
            // 此时需要确定{}到底占了几个元素
            Type* type = ((ArrayType*)(Arr_stack.top()->getSymPtr()->getType()))->getEType();
            int len = type->getSize() / TypeSystem::intType->getSize();
            memset(arrayValue + idx, 0, type->getSize());
            idx += len;
            se = new ConstantSymbolEntry(type);
            list = new InitArray(se);
            Arr_stack.top()->addExpr(list);
            while(Arr_stack.top()->isFull() && Arr_stack.size() != (long unsigned int)leftCnt){
                Arr_stack.pop();
            }
        }
        $$ = list;
    }
    | LBRACE {
        fprintf(stderr,"InitVal-LBRACE\n");
        SymbolEntry* se;
        //取当前initValue的arraytype
        if(!Arr_stack.empty())
            arrayType = (ArrayType*)(((ArrayType*)(Arr_stack.top()->getSymPtr()->getType()))->getEType());
        se = new ConstantSymbolEntry(arrayType);
        if(arrayType->getEType() != TypeSystem::intType){
            arrayType = (ArrayType*)(arrayType->getEType());
        }
        InitArray* expr = new InitArray(se);
        if(!Arr_stack.empty())
            Arr_stack.top()->addExpr(expr);
        Arr_stack.push(expr);
        $<exprtype>$ = expr;
        leftCnt++;
        fprintf(stderr,"InitVal-LBRACE-out\n");
    } 
      InitValList RBRACE {
        fprintf(stderr,"InitValList RBRACE\n");
        leftCnt--;
        while(Arr_stack.top() != $<exprtype>2 && Arr_stack.size() > (long unsigned int)(leftCnt + 1))
            Arr_stack.pop();
        if(Arr_stack.top() == $<exprtype>2)
            Arr_stack.pop();
        $$ = $<exprtype>2;
        if(!Arr_stack.empty())
            while(Arr_stack.top()->isFull() && Arr_stack.size() != (long unsigned int)leftCnt){
                Arr_stack.pop();
            }
        int size = ((ArrayType*)($$->getSymPtr()->getType()))->getSize()/ TypeSystem::intType->getSize();
        while(idx % size != 0)
            arrayValue[idx++] = 0;
        if(!Arr_stack.empty())
            arrayType = (ArrayType*)(((ArrayType*)(Arr_stack.top()->getSymPtr()->getType()))->getEType());
    }
    ;

InitValList
    : InitVal {
        fprintf(stderr,"InitValList-InitVal\n");
        $$ = $1;
    }
    | InitValList COMMA InitVal {
        fprintf(stderr,"InitValList-InitValList COMMA InitVal\n");
        $$ = $1;
    }
    ;
    
//常量的声明要求必须赋初值
ConstDef
    : ID ASSIGN Exp {
        //检查常量是否重复声明
        if(identifiers->lookup($1))
        {
            //在当前作用域能够找到这个标识符名字，表示重复定义
            fprintf(stderr, "constant identifier \"%s\" is defined twice\n", (char*)$1);
            assert(identifiers->lookup($1)==nullptr);
        }
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(TypeSystem::constIntType, $1, identifiers->getLevel());
        se->SetValue($3->getValue());
        identifiers->install($1, se);
        $$ = new DeclStmt(new Id(se), $3);
        delete []$1;
    }
    | ID ArrayIndices ASSIGN  {
        SymbolEntry* se;
        std::vector<int> vec;
        ExprNode* temp = $2;
        while(temp){
            vec.push_back(temp->getValue());
            temp = (ExprNode*)(temp->getLink());
        }
        Type* type = TypeSystem::constIntType;
        Type* temp1;
        for(auto it = vec.rbegin(); it != vec.rend(); it++) {
            temp1 = new ArrayType(type, *it, true);
            if(type->isArray())
                ((ArrayType*)type)->setArrayType(temp1);
            type = temp1;
        }
        arrayType = (ArrayType*)type;
        idx = 0;
        std::stack<InitArray*>().swap(Arr_stack);
        se = new IdentifierSymbolEntry(type, $1, identifiers->getLevel());
        ((IdentifierSymbolEntry*)se)->setConst();
        $<se>$ = se;
        arrayValue = new int[arrayType->getSize()];
    }
      ConstInitVal {
        ((IdentifierSymbolEntry*)$<se>4)->setArrayValue(arrayValue);
        identifiers->install($1, $<se>4);
        // if(!identifiers->install($1, $<se>4))
        //     fprintf(stderr, "identifier \"%s\" is already defined\n", (char*)$1);
        identifiers->install($1, $<se>4);
        $$ = new DeclStmt(new Id($<se>4), $5);
        delete []$1;
    } 
    ;

ConstInitVal
    : Exp {
        $$ = $1;
        if(!Arr_stack.empty()){
            arrayValue[idx++] = $1->getValue();
            Type* arrTy = Arr_stack.top()->getSymPtr()->getType();
            if(arrTy == TypeSystem::constIntType)
                Arr_stack.top()->addExpr($1);
            else
                while(arrTy){
                    if(((ArrayType*)arrTy)->getEType() != TypeSystem::constIntType){
                        arrTy = ((ArrayType*)arrTy)->getEType();
                        SymbolEntry* se = new ConstantSymbolEntry(arrTy);
                        InitArray* list = new InitArray(se);
                        Arr_stack.top()->addExpr(list);                                                                                                                                                                                                                                                                                 }else{
                        Arr_stack.top()->addExpr($1);
                        while(Arr_stack.top()->isFull() && Arr_stack.size() != (long unsigned int)leftCnt){
                            arrTy = ((ArrayType*)arrTy)->getArrayType();
                            Arr_stack.pop();
                        }
                        break;
                    }
                }
        }
    }
    | LBRACE RBRACE {
        SymbolEntry* se;
        ExprNode* list;
        if(Arr_stack.empty()){
            // 如果只用一个{}初始化数组，那么栈一定为空
            // 此时也没必要再加入栈了
            memset(arrayValue, 0, arrayType->getSize());
            idx += arrayType->getSize() / TypeSystem::constIntType->getSize();
            se = new ConstantSymbolEntry(arrayType);
            list = new InitArray(se);
        }else{
            // 栈不空说明肯定不是只有{}
            // 此时需要确定{}到底占了几个元素
            Type* type = ((ArrayType*)(Arr_stack.top()->getSymPtr()->getType()))->getEType();
            int len = type->getSize() / TypeSystem::constIntType->getSize();
            memset(arrayValue + idx, 0, type->getSize());
            idx += len;
            se = new ConstantSymbolEntry(type);
            list = new InitArray(se);
            Arr_stack.top()->addExpr(list);
            while(Arr_stack.top()->isFull() && Arr_stack.size() != (long unsigned int)leftCnt){
                Arr_stack.pop();
            }
        }
        $$ = list;
    }
    | LBRACE {
        SymbolEntry* se;
        if(!Arr_stack.empty())
            arrayType = (ArrayType*)(((ArrayType*)(Arr_stack.top()->getSymPtr()->getType()))->getEType());
        se = new ConstantSymbolEntry(arrayType);
        if(arrayType->getEType() != TypeSystem::intType){
            arrayType = (ArrayType*)(arrayType->getEType());
        }
        InitArray* expr = new InitArray(se);
        if(!Arr_stack.empty())
            Arr_stack.top()->addExpr(expr);
        Arr_stack.push(expr);
        $<exprtype>$ = expr;
        leftCnt++;
    } 
      ConstInitValList RBRACE {
        leftCnt--;
        while(Arr_stack.top() != $<exprtype>2 && Arr_stack.size() > (long unsigned int)(leftCnt + 1))
            Arr_stack.pop();
        if(Arr_stack.top() == $<exprtype>2)
            Arr_stack.pop();
        $$ = $<exprtype>2;
        if(!Arr_stack.empty())
            while(Arr_stack.top()->isFull() && Arr_stack.size() != (long unsigned int)leftCnt){
                Arr_stack.pop();
            }
        while(idx % (((ArrayType*)($$->getSymPtr()->getType()))->getSize()/ sizeof(int)) !=0 )
            arrayValue[idx++] = 0;
        if(!Arr_stack.empty())
            arrayType = (ArrayType*)(((ArrayType*)(Arr_stack.top()->getSymPtr()->getType()))->getEType());
    }
    ;

ConstInitValList
    : ConstInitVal {
        $$ = $1;
    }
    | ConstInitValList COMMA ConstInitVal {
        $$ = $1;
    }
    ;
    
FuncDef
    :
    Type ID {
        identifiers = new SymbolTable(identifiers);
    }
    LPAREN MaybeFuncDefParams RPAREN {
        Type* funcType;
        std::vector<Type*> vec;
        std::vector<SymbolEntry*> vec1;
        DeclStmt* temp = (DeclStmt*)$5;
        while(temp){
            vec.push_back(temp->getId()->getSymPtr()->getType());
            vec1.push_back(temp->getId()->getSymPtr());
            temp = (DeclStmt*)(temp->getLink());
        }
        funcType = new FunctionType($1, vec, vec1);
        SymbolEntry* se = new IdentifierSymbolEntry(funcType, $2, identifiers->getPrev()->getLevel());
        identifiers->getPrev()->install($2, se);
        // $<se>$ = se;
    } 
    BlockStmt {
        SymbolEntry* se;
        se = identifiers->lookup($2);
        assert(se != nullptr);
        $$ = new FunctionDef(se, $8, (DeclStmt*)$5);
        SymbolTable* top = identifiers;
        identifiers = identifiers->getPrev();
        delete top;
        delete []$2;
    }
    ;

MaybeFuncDefParams
    : FuncDefParams {$$ = $1;}
    | %empty {$$ = nullptr;}

FuncDefParams
    : FuncDefParams COMMA FuncDefParam {
        $$ = $1;
        $$->setLink($3);
    }
    | FuncDefParam {$$ = $1;}
    ;
    
FuncDefParam
    : Type ID {
        //if(identifiers->lookup($2))
        //{
        //    //在当前作用域能够找到这个标识符名字，表示重复定义
        //    fprintf(stderr, "function parameter \"%s\" is defined twice\n", (char*)$2);
        //    assert(identifiers->lookup($2)==nullptr);
        //}
        SymbolEntry* se;
        se = new IdentifierSymbolEntry($1, $2, identifiers->getLevel());
        identifiers->install($2, se);
        $$ = new DeclStmt(new Id(se));
        delete []$2;    
    }
    | Type ID ASSIGN Exp {
        //if(identifiers->lookup($2))
        //{
        //    //在当前作用域能够找到这个标识符名字，表示重复定义
        //    fprintf(stderr, "function parameter \"%s\" is defined twice\n", (char*)$2);
        //    assert(identifiers->lookup($2)==nullptr);
        //}
        SymbolEntry *se;
        se = new IdentifierSymbolEntry($1, $2, identifiers->getLevel());
        identifiers->install($2, se);
        $$ = new DeclStmt(new Id(se),$4);
        delete []$2;
    }
    | Type ID FuncArrayIndices {
        // 这里也需要求值
        SymbolEntry* se;
        ExprNode* temp = $3;
        Type* arr = TypeSystem::intType;
        Type* arr1;
        std::stack<ExprNode*> Arr_stack;
        while(temp){
            Arr_stack.push(temp);
            temp = (ExprNode*)(temp->getLink());
        }
        while(!Arr_stack.empty()){
            arr1 = new ArrayType(arr, Arr_stack.top()->getValue());
            if(arr->isArray())
                ((ArrayType*)arr)->setArrayType(arr1);
            arr = arr1;
            Arr_stack.pop();
        }
        se = new IdentifierSymbolEntry(arr, $2, identifiers->getLevel(), paramNo++);
        identifiers->install($2, se);
        ((IdentifierSymbolEntry*)se)->setLabel();
        ((IdentifierSymbolEntry*)se)->setAddr(new Operand(se));
        $$ = new DeclStmt(new Id(se));
        delete []$2;
    }
    ;
FuncArrayIndices 
    : LBRACKET RBRACKET {
        $$ = new EmptyNode();
    }
    | FuncArrayIndices LBRACKET Exp RBRACKET {
        $$ = $1;
        $$->setLink($3);
    }
    ;
%%

int yyerror(char const* message)
{
    std::cerr<<message<<std::endl;
    return -1;
}
