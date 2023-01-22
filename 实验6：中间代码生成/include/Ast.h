// 结点的定义-表达式与语句，可再细分
//  node-ExprNode/StmtNode
#ifndef __AST_H__
#define __AST_H__

#include <fstream>
#include "Operand.h"

// 符号表项类，在SymbolTable.h中实现
class SymbolEntry;
class Unit;
class Function;
class BasicBlock;
class Instruction;
class IRBuilder;

// 结点类
class Node
{
private:
    static int counter;
    int seq;

protected:
    std::vector<Instruction *> true_list;
    std::vector<Instruction *> false_list;
    static IRBuilder *builder;
    void backPatch(std::vector<Instruction *> &list, BasicBlock *bb, bool branch);
    std::vector<Instruction *> merge(std::vector<Instruction *> &list1, std::vector<Instruction *> &list2);

public:
    // 结点又指向下一个结点，用以表示表达式声明列表，函数参数列表等若干个表达式拼接而成的表达式
    Node *next;
    Node();
    int getSeq() const { return seq; };
    static void setIRBuilder(IRBuilder *ib) { builder = ib; };
    virtual void output(int level) = 0; // 等待子类重载实现
    // 添加next结点
    void setNext(Node *node);
    // 获取当前结点的next结点
    Node *getNext();
    virtual void typeCheck() = 0;
    virtual void genCode() = 0;
    std::vector<Instruction *> &trueList() { return true_list; }
    std::vector<Instruction *> &falseList() { return false_list; }
};

// 细分大类一：表达式结点类
class ExprNode : public Node
{
protected:
    SymbolEntry *symbolEntry;
    Operand *dst; // The result of the subtree is stored into dst.
protected:
    Type *type;

public:
    ExprNode(SymbolEntry *symbolEntry) : symbolEntry(symbolEntry){};
    Operand *getOperand() { return dst; };
    virtual int getValue() { return 0; };
    SymbolEntry *getSymPtr() { return symbolEntry; };
    Type *getType() { return type; };
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
        MORE,
        LEQ,
        MEQ,
        EQ,
        NE
    };
    BinaryExpr(SymbolEntry *se, int op, ExprNode *expr1, ExprNode *expr2) : ExprNode(se), op(op), expr1(expr1), expr2(expr2) { dst = new Operand(se); };
    void output(int level);
    int getValue();
    void typeCheck();
    void genCode();
    void setType(Type *type) { this->type = type; };
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
    UnaryExpr(SymbolEntry *se, int op, ExprNode *expr) : ExprNode(se), op(op), expr(expr) { dst = new Operand(se); };
    void output(int level);
    int getValue();
    void typeCheck();
    void genCode();
};

class FuncCallExpr : public ExprNode
{
private:
    ExprNode *param;

public:
    FuncCallExpr(SymbolEntry *se, ExprNode *param = nullptr);
    void output(int level);
    void typeCheck();
    void genCode();
    int getValue() { return 0; };
};

// class Constant : public ExprNode {
//    public:
//     Constant(SymbolEntry* se) : ExprNode(se) {
//         dst = new Operand(se);
//         // type = TypeSystem::intType;
//     };
//     void output(int level);
//     int getValue();
//     bool typeCheck(Type* retType = nullptr);
//     void genCode();
// };

class Constant : public ExprNode
{
public:
    Constant(SymbolEntry *se) : ExprNode(se)
    {
        dst = new Operand(se);
        // type = TypeSystem::intType;
    };
    void output(int level);
    void typeCheck();
    void genCode();
    int getValue();
};

class Id : public ExprNode
{
public:
    Id(SymbolEntry *se) : ExprNode(se)
    {
        SymbolEntry *temp = new TemporarySymbolEntry(se->getType(), SymbolTable::getLabel());
        dst = new Operand(temp);
    };
    void output(int level);
    void typeCheck();
    void genCode();
    int getValue() { return 0; };
};

// 细分大类二：语句结点类
class StmtNode : public Node
{
    // 为函数声明的类型检查新增checkRet函数
public:
    virtual bool checkRet(Type *retType) { return false; };
};

class CompoundStmt : public StmtNode
{
private:
    StmtNode *stmt;

public:
    CompoundStmt(StmtNode *stmt) : stmt(stmt){};
    void output(int level);
    void typeCheck();
    void genCode();
    bool checkRet(Type *retType) { return stmt->checkRet(retType); }
};

class SeqNode : public StmtNode
{
private:
    StmtNode *stmt1, *stmt2;

public:
    SeqNode(StmtNode *stmt1, StmtNode *stmt2) : stmt1(stmt1), stmt2(stmt2){};
    void output(int level);

    StmtNode *getCurrent() { return stmt1; }
    StmtNode *getNext() { return stmt2; }

    void typeCheck();
    void genCode();
    bool checkRet(Type *retType)
    {
        bool result1 = false;
        bool result2 = false;
        if (stmt1)
        {
            result1 = stmt1->checkRet(retType);
        }
        if (stmt2)
        {
            result2 = stmt2->checkRet(retType);
        }
        return result1 || result2;
    }
};

class ExprStmt : public StmtNode
{
private:
    ExprNode *expr;

public:
    ExprStmt(ExprNode *expr) : expr(expr){};
    void output(int level);
    void typeCheck();
    void genCode() { expr->genCode(); };
    bool checkRet(Type *retType) { return false; }
};

class DeclStmt : public StmtNode
{
private:
    Id *id;
    // 用于获取赋值给标识符的表达式,如果为空，代表只声明，不赋初值
    ExprNode *expr;

public:
    DeclStmt(Id *id, ExprNode *expr = nullptr) : id(id), expr(expr){};
    void output(int level);
    Id *getId() { return id; }
    void typeCheck();
    void genCode();
    bool checkRet(Type *retType) { return false; }
};

class IfStmt : public StmtNode
{
private:
    ExprNode *cond;
    StmtNode *thenStmt;

public:
    IfStmt(ExprNode *cond, StmtNode *thenStmt) : cond(cond), thenStmt(thenStmt){};
    void output(int level);
    void typeCheck();
    void genCode();
    bool checkRet(Type *retType)
    {
        if (thenStmt)
        {
            return thenStmt->checkRet(retType);
        }
        return false;
    }
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
    void typeCheck();
    void genCode();
    bool checkRet(Type *retType)
    {
        bool result1 = false;
        bool result2 = false;
        if (thenStmt)
        {
            result1 = thenStmt->checkRet(retType);
        }
        if (elseStmt)
        {
            result2 = elseStmt->checkRet(retType);
        }
        return result1 || result2;
    }
};

class WhileStmt : public StmtNode
{
private:
    ExprNode *cond;
    StmtNode *stmt;

public:
    WhileStmt(ExprNode *cond, StmtNode *stmt) : cond(cond), stmt(stmt){};
    void output(int level);
    void typeCheck();
    void genCode();
    bool checkRet(Type *retType)
    {
        if (stmt)
        {
            return stmt->checkRet(retType);
        }
        return false;
    }
};

class BreakStmt : public StmtNode
{
public:
    BreakStmt(){};
    void output(int level);
    void typeCheck();
    void genCode(){};
    bool checkRet(Type *retType) { return false; }
};

class ContinueStmt : public StmtNode
{
public:
    ContinueStmt(){};
    void output(int level);
    void typeCheck();
    void genCode(){};
    bool checkRet(Type *retType) { return false; }
};

class ReturnStmt : public StmtNode
{
private:
    ExprNode *retValue;

public:
    ReturnStmt(ExprNode *retValue = nullptr) : retValue(retValue){};
    void output(int level);
    void typeCheck();
    void genCode();
    bool checkRet(Type *retType);
};

class AssignStmt : public StmtNode
{
private:
    ExprNode *lval;
    ExprNode *expr;

public:
    AssignStmt(ExprNode *lval, ExprNode *expr) : lval(lval), expr(expr){};
    void output(int level);
    void typeCheck();
    void genCode();
    bool checkRet(Type *retType) { return false; }
};

class FunctionDef : public StmtNode
{
private:
    SymbolEntry *se;
    DeclStmt *FuncDefParams;
    StmtNode *stmt;

public:
    FunctionDef(SymbolEntry *se, StmtNode *stmt, DeclStmt *FuncDefParams = nullptr) : se(se), FuncDefParams(FuncDefParams), stmt(stmt){};
    void output(int level);
    void typeCheck();
    void genCode();
    bool checkRet(Type *retType) { return false; }
};

class EmptyStmt : public StmtNode
{
public:
    EmptyStmt(){};
    void output(int level);
    void typeCheck();
    void genCode(){};
    bool checkRet(Type *retType) { return false; }
};

// 定义树
class Ast
{
private:
    Node *root;

public:
    Ast() { root = nullptr; }
    void setRoot(Node *n) { root = n; }
    void output();
    void typeCheck();
    void genCode(Unit *unit);
};

#endif
