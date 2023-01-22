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
    SymbolEntry *link;

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
    void setLink(SymbolEntry *se);
    SymbolEntry *getLink() { return link; };
    // You can add any function you need here.
    virtual int getValue() = 0;
    virtual void SetValue(int value) = 0;
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
    std::string strValue;

public:
    ConstantSymbolEntry(Type *type, int value);
    ConstantSymbolEntry(Type *type, std::string strValue);
    ConstantSymbolEntry(Type *type);
    virtual ~ConstantSymbolEntry(){};
    int getValue()
    {
        fprintf(stderr, "ConstantSymbolEntry\n");
        return value;
    };
    void SetValue(int value) { this->value = value; };
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
    int value;
    int *arrayValue;
    bool allZero;
    bool initial;
    int label;
    bool constant;
    int paramNo;
    bool sysy;

public:
    // IdentifierSymbolEntry(Type *type, std::string name, int scope);
    IdentifierSymbolEntry(Type *type, std::string name, int scope, int paramNo = -1, bool sysy = false);
    virtual ~IdentifierSymbolEntry(){};
    std::string toStr();
    bool isGlobal() const { return scope == GLOBAL; };
    bool isParam() const { return scope == PARAM; };
    bool isLocal() const { return scope >= LOCAL; };
    int getScope() const { return scope; };
    void setAddr(Operand *addr) { this->addr = addr; };
    Operand *getAddr() { return addr; };
    std::string getName() { return name; };
    // You can add any function you need here.
    void SetValue(int value) { this->value = value; };
    int getValue()
    {
        fprintf(stderr, "IdentifierSymbolEntry\n");
        return value;
    };
    void makeZero() { allZero = true; };
    bool isAllZero() const { return allZero; };
    void setArrayValue(int *arrayValue);
    int *getArrayValue() const { return arrayValue; };
    int getLabel() const { return label; };
    void setLabel() { label = SymbolTable::getLabel(); };
    void setConst() { constant = true; };
    bool getConst() const { return constant; };
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
    int stack_offset;
    int label;
    int value;

public:
    TemporarySymbolEntry(Type *type, int label);
    virtual ~TemporarySymbolEntry(){};
    std::string toStr();
    int getLabel() const { return label; };
    void setOffset(int offset) { this->stack_offset = offset; };
    int getOffset() { return this->stack_offset; };
    void SetValue(int value) { this->value = value; };
    int getValue()
    {
        fprintf(stderr, "TemporarySymbolEntry\n");
        return value;
    };
};

extern SymbolTable *identifiers;
extern SymbolTable *globals;

#endif
