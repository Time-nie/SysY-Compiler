// 符号表实现保存：单词，词素，类型，作用域，行号等
// 三种类型的符号表项（常量属性值，中间变量信息，标识符相关信息）
// 为每一个语句块创建一个符号表，能够区别标识符的声明与使用
#ifndef __SYMBOLTABLE_H__
#define __SYMBOLTABLE_H__

#include <string>
#include <map>

class Type;
class Operand;
class ExprNode;

class SymbolEntry
{
private:
    int kind;
    // 用于链接重载的同名函数
    SymbolEntry *next;

protected:
    enum
    {
        CONSTANT,
        VARIABLE,
        TEMPORARY
    };          // 分为三类：常量，变量，中间变量，由变量kind表示
    Type *type; // 符号的类型

public:
    SymbolEntry(Type *type, int kind);
    virtual ~SymbolEntry(){};
    bool isConstant() const { return kind == CONSTANT; };
    bool isTemporary() const { return kind == TEMPORARY; };
    bool isVariable() const { return kind == VARIABLE; };
    Type *getType() { return type; };
    void setType(Type *type) { this->type = type; };
    virtual std::string toStr() = 0;
    void setNext(SymbolEntry *se);
    SymbolEntry *getNext() { return next; };
    // You can add any function you need here.
};

/*
    Symbol entry for literal constant. Example:

    int a = 1;

    Compiler should create constant symbol entry for literal constant '1'.
*/
// 第一类符号表项：常量
class ConstantSymbolEntry : public SymbolEntry
{
private:
    int value;

public:
    ConstantSymbolEntry(Type *type, int value);
    virtual ~ConstantSymbolEntry(){};
    int getValue() const { return value; };
    std::string toStr();
    // You can add any function you need here.
};

/*
    Symbol entry for identifier. Example:

    int a;
    int b;
    void f(int c)
    {
        int d;
        {
            int e;
        }
    }

    Compiler should create identifier symbol entries for variables a, b, c, d and e:

    | variable | scope    |
    | a        | GLOBAL   |
    | b        | GLOBAL   |
    | c        | PARAM    |
    | d        | LOCAL    |
    | e        | LOCAL +1 |
*/
// 第二类符号表项：变量
class IdentifierSymbolEntry : public SymbolEntry
{
private:
    enum
    {
        GLOBAL,
        PARAM,
        LOCAL
    };
    std::string name;
    int scope;
    Operand *addr; // The address of the identifier.
    // You can add any field you need here.

public:
    IdentifierSymbolEntry(Type *type, std::string name, int scope);
    virtual ~IdentifierSymbolEntry(){};
    std::string toStr();
    bool isGlobal() const { return scope == GLOBAL; };
    bool isParam() const { return scope == PARAM; };
    bool isLocal() const { return scope >= LOCAL; };
    int getScope() const { return scope; };
    void setAddr(Operand *addr) { this->addr = addr; };
    Operand *getAddr() { return addr; };
    // You can add any function you need here.
};

/*
    Symbol entry for temporary variable created by compiler. Example:

    int a;
    a = 1 + 2 + 3;

    The compiler would generate intermediate code like:

    t1 = 1 + 2
    t2 = t1 + 3
    a = t2

    So compiler should create temporary symbol entries for t1 and t2:

    | temporary variable | label |
    | t1                 | 1     |
    | t2                 | 2     |
*/
// 第三类符号表项：中间变量
class TemporarySymbolEntry : public SymbolEntry
{
private:
    int label;

public:
    TemporarySymbolEntry(Type *type, int label);
    virtual ~TemporarySymbolEntry(){};
    std::string toStr();
    int getLabel() const { return label; };
    // You can add any function you need here.
};

// symbol table managing identifier symbol entries
class SymbolTable
{
private:
    std::map<std::string, SymbolEntry *> symbolTable;
    SymbolTable *prev;
    int level;
    static int counter;

public:
    SymbolTable();
    SymbolTable(SymbolTable *prev);
    void install(std::string name, SymbolEntry *entry);
    std::map<std::string, SymbolEntry *> getSymbolTable() { return symbolTable; };
    SymbolEntry *lookup(std::string name);
    SymbolTable *getPrev() { return prev; };
    int getLevel() { return level; };
    static int getLabel() { return counter++; };
};

extern SymbolTable *identifiers;
extern SymbolTable *globals;

#endif
