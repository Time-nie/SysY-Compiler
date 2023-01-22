// 负责输出语法树
//编写输出output函数
#include "Ast.h"
#include "SymbolTable.h"
#include <string>
#include "Type.h"

extern FILE *yyout;
int Node::counter = 0;

Node::Node()
{
    seq = counter++;
    //初始化为空
    next = nullptr;
}

void Node::setNext(Node *node)
{
    Node *temp = this;
    //找到结点链表串的最后一个结点
    while (temp->getNext())
    {
        temp = temp->getNext();
    }
    temp->next = node;
}

Node *Node::getNext()
{
    return next;
}

void Ast::output()
{
    fprintf(yyout, "program\n");
    if (root != nullptr)
        root->output(4);
}

void BinaryExpr::output(int level)
{
    std::string op_str;
    switch (op)
    {
    case ADD:
        op_str = "add";
        break;
    case SUB:
        op_str = "sub";
        break;
    case MUL:
        op_str = "mul";
        break;
    case DIV:
        op_str = "div";
        break;
    case MOD:
        op_str = "mod";
        break;
    case AND:
        op_str = "and";
        break;
    case OR:
        op_str = "or";
        break;
    case LESS:
        op_str = "less";
        break;
    case LESSEQUAL:
        op_str = "lessequal";
        break;
    case GREATER:
        op_str = "greater";
        break;
    case GREATEREQUAL:
        op_str = "greaterequal";
        break;
    case EQUAL:
        op_str = "equal";
        break;
    case NOTEQUAL:
        op_str = "notequal";
        break;
    }
    fprintf(yyout, "%*cBinaryExpr\top: %s\n", level, ' ', op_str.c_str());
    expr1->output(level + 4);
    expr2->output(level + 4);
}

int BinaryExpr::getValue()
{
    int value;
    switch (op)
    {
    case ADD:
        value = expr1->getValue() + expr2->getValue();
        break;
    case SUB:
        value = expr1->getValue() - expr2->getValue();
        break;
    case MUL:
        value = expr1->getValue() * expr2->getValue();
        break;
    case DIV:
        value = expr1->getValue() / expr2->getValue();
        break;
    case MOD:
        value = expr1->getValue() % expr2->getValue();
        break;
    case AND:
        value = expr1->getValue() && expr2->getValue();
        break;
    case OR:
        value = expr1->getValue() || expr2->getValue();
        break;
    case LESS:
        value = expr1->getValue() < expr2->getValue();
        break;
    case LESSEQUAL:
        value = expr1->getValue() <= expr2->getValue();
        break;
    case GREATER:
        value = expr1->getValue() > expr2->getValue();
        break;
    case GREATEREQUAL:
        value = expr1->getValue() >= expr2->getValue();
        break;
    case EQUAL:
        value = expr1->getValue() == expr2->getValue();
        break;
    case NOTEQUAL:
        value = expr1->getValue() != expr2->getValue();
        break;
    }
    return value;
}

void Constant::output(int level)
{
    std::string type, value;
    type = symbolEntry->getType()->toStr();
    value = symbolEntry->toStr();
    fprintf(yyout, "%*cIntegerLiteral\tvalue: %s\ttype: %s\n", level, ' ',
            value.c_str(), type.c_str());
}

void Id::output(int level)
{
    std::string name, type;
    int scope;
    name = symbolEntry->toStr();
    type = symbolEntry->getType()->toStr();
    scope = dynamic_cast<IdentifierSymbolEntry *>(symbolEntry)->getScope();
    fprintf(yyout, "%*cId\tname: %s\tscope: %d\ttype: %s\n", level, ' ',
            name.c_str(), scope, type.c_str());
}

void FuncCallExp::output(int level)
{
    std::string name, type;
    int scope;
    name = symbolEntry->toStr();            //获取函数名
    type = symbolEntry->getType()->toStr(); //获取函数返回值类型
    scope = dynamic_cast<IdentifierSymbolEntry *>(symbolEntry)->getScope();
    fprintf(yyout, "%*cFuncCallExpr\tfunction name: %s\tscope: %d\ttype: %s\n",
            level, ' ', name.c_str(), scope, type.c_str());
    Node *temp = param;
    while (temp)
    {
        temp->output(level + 4);
        temp = temp->getNext();
    }
}

void ExprStmt::output(int level)
{
    fprintf(yyout, "%*cExprStmt\n", level, ' ');
    expr->output(level + 4);
}

void DeclStmt::output(int level)
{
    fprintf(yyout, "%*cDeclStmt\n", level, ' ');
    id->output(level + 4);
    if (expr)
        expr->output(level + 4);
    if (this->getNext())
    {
        this->getNext()->output(level);
    }
}

void UnaryExpr::output(int level)
{
    std::string op_str;
    switch (op)
    {
    case ADD:
        op_str = "add";
        break;
    case SUB:
        op_str = "minus";
        break;
    case NOT:
        op_str = "not";
        break;
    }
    fprintf(yyout, "%*cUnaryExpr\top: %s\n", level, ' ', op_str.c_str());
    expr->output(level + 4);
}

void CompoundStmt::output(int level)
{
    fprintf(yyout, "%*cCompoundStmt\n", level, ' ');
    if (stmt)
        stmt->output(level + 4);
}

void SeqNode::output(int level)
{
    // fprintf(yyout, "%*cSequence\n", level, ' ');
    stmt1->output(level);
    stmt2->output(level);
}

void EmptyStmt::output(int level)
{
    fprintf(yyout, "%*cEmptyStmt\n", level, ' ');
}

void IfStmt::output(int level)
{
    fprintf(yyout, "%*cIfStmt\n", level, ' ');
    cond->output(level + 4);
    thenStmt->output(level + 4);
}

void IfElseStmt::output(int level)
{
    fprintf(yyout, "%*cIfElseStmt\n", level, ' ');
    cond->output(level + 4);
    thenStmt->output(level + 4);
    elseStmt->output(level + 4);
}

void WhileStmt::output(int level)
{
    fprintf(yyout, "%*cWhileStmt\n", level, ' ');
    cond->output(level + 4);
    stmt->output(level + 4);
}
void BreakStmt::output(int level)
{
    fprintf(yyout, "%*cBreakStmt\n", level, ' ');
}

void ContinueStmt::output(int level)
{
    fprintf(yyout, "%*cContinueStmt\n", level, ' ');
}

void ReturnStmt::output(int level)
{
    fprintf(yyout, "%*cReturnStmt\n", level, ' ');
    retValue->output(level + 4);
}

void AssignStmt::output(int level)
{
    fprintf(yyout, "%*cAssignStmt\n", level, ' ');
    lval->output(level + 4);
    expr->output(level + 4);
}

void FunctionDef::output(int level)
{
    std::string name, type;
    name = se->toStr();
    type = se->getType()->toStr();
    fprintf(yyout, "%*cFunctionDefine function name: %s type: %s\n", level, ' ',
            name.c_str(), type.c_str());
    if (FuncDefParams)
    {
        FuncDefParams->output(level + 4);
    }
    stmt->output(level + 4);
}