//结点的定义-表达式与语句，可再细分
// node-ExprNode/StmtNode
#ifndef __AST_H__
#define __AST_H__

#include <fstream>

//符号表项类，在SymbolTable.h中实现
class SymbolEntry;

//结点类
class Node
{
private:
    static int counter;
    int seq;

public:
    //结点又指向下一个结点，用以表示表达式声明列表，函数参数列表等若干个表达式拼接而成的表达式
    Node *next;
    Node();
    int getSeq() const { return seq; };
    virtual void output(int level) = 0; //等待子类重载实现
    //添加next结点
    void setNext(Node *node);
    //获取当前结点的next结点
    Node *getNext();
};

//细分大类一：表达式结点类
class ExprNode : public Node
{
protected:
    SymbolEntry *symbolEntry;

public:
    ExprNode(SymbolEntry *symbolEntry) : symbolEntry(symbolEntry){};
    virtual int getValue() { return 0; };
    SymbolEntry *getSymbolEntry() { return symbolEntry; }
};

class BinaryExpr : public ExprNode
{
private:
    int op;
    ExprNode *expr1, *expr2;

public:
    enum
    {
        ADD,
        SUB,
        MUL,
        DIV,
        MOD,
        AND,
        OR,
        LESS,
        LESSEQUAL,
        GREATER,
        GREATEREQUAL,
        EQUAL,
        NOTEQUAL
    };
    BinaryExpr(SymbolEntry *se, int op, ExprNode *expr1, ExprNode *expr2)
        : ExprNode(se), op(op), expr1(expr1), expr2(expr2){};
    void output(int level);
    int getValue();
};

class UnaryExpr : public ExprNode
{
private:
    int op;
    ExprNode *expr;

public:
    enum
    {
        ADD,
        SUB,
        NOT
    };
    UnaryExpr(SymbolEntry *se, int op, ExprNode *expr) : ExprNode(se), op(op), expr(expr){};
    void output(int level);
};

class FuncCallExp : public ExprNode
{
private:
    ExprNode *param;

public:
    FuncCallExp(SymbolEntry *se, ExprNode *param = nullptr)
        : ExprNode(se), param(param){};
    void output(int level);
};

class Constant : public ExprNode
{
public:
    Constant(SymbolEntry *se) : ExprNode(se){};
    void output(int level);
};

class Id : public ExprNode
{
public:
    Id(SymbolEntry *se) : ExprNode(se){};
    void output(int level);
};

//细分大类二：语句结点类
class StmtNode : public Node
{
};

class CompoundStmt : public StmtNode
{
private:
    StmtNode *stmt;

public:
    CompoundStmt(StmtNode *stmt) : stmt(stmt){};
    void output(int level);
};

class SeqNode : public StmtNode
{
private:
    StmtNode *stmt1, *stmt2;

public:
    SeqNode(StmtNode *stmt1, StmtNode *stmt2) : stmt1(stmt1), stmt2(stmt2){};
    void output(int level);
};

class ExprStmt : public StmtNode
{
private:
    ExprNode *expr;

public:
    ExprStmt(ExprNode *expr) : expr(expr){};
    void output(int level);
};

class DeclStmt : public StmtNode
{
private:
    Id *id;
    //用于获取赋值给标识符的表达式,如果为空，代表只声明，不赋初值
    ExprNode *expr;

public:
    DeclStmt(Id *id, ExprNode *expr = nullptr) : id(id), expr(expr){};
    void output(int level);
    Id *getId() { return id; }
};

class IfStmt : public StmtNode
{
private:
    ExprNode *cond;
    StmtNode *thenStmt;

public:
    IfStmt(ExprNode *cond, StmtNode *thenStmt) : cond(cond), thenStmt(thenStmt){};
    void output(int level);
};

class IfElseStmt : public StmtNode
{
private:
    ExprNode *cond;
    StmtNode *thenStmt;
    StmtNode *elseStmt;

public:
    IfElseStmt(ExprNode *cond, StmtNode *thenStmt, StmtNode *elseStmt) : cond(cond), thenStmt(thenStmt), elseStmt(elseStmt){};
    void output(int level);
};

class WhileStmt : public StmtNode
{
private:
    ExprNode *cond;
    StmtNode *stmt;

public:
    WhileStmt(ExprNode *cond, StmtNode *stmt) : cond(cond), stmt(stmt){};
    void output(int level);
};

class BreakStmt : public StmtNode
{
public:
    BreakStmt(){};
    void output(int level);
};

class ContinueStmt : public StmtNode
{
public:
    ContinueStmt(){};
    void output(int level);
};

class ReturnStmt : public StmtNode
{
private:
    ExprNode *retValue;

public:
    ReturnStmt(ExprNode *retValue) : retValue(retValue){};
    void output(int level);
};

class AssignStmt : public StmtNode
{
private:
    ExprNode *lval;
    ExprNode *expr;

public:
    AssignStmt(ExprNode *lval, ExprNode *expr) : lval(lval), expr(expr){};
    void output(int level);
};

class FunctionDef : public StmtNode
{
private:
    SymbolEntry *se;
    StmtNode *stmt;
    DeclStmt *FuncDefParams;

public:
    FunctionDef(SymbolEntry *se, StmtNode *stmt, DeclStmt *FuncDefParams = nullptr) : se(se), stmt(stmt), FuncDefParams(FuncDefParams){};
    void output(int level);
};

class EmptyStmt : public StmtNode
{
public:
    EmptyStmt(){};
    void output(int level);
};

//定义树
class Ast
{
private:
    Node *root;

public:
    Ast() { root = nullptr; }
    void setRoot(Node *n) { root = n; }
    void output();
};

#endif
