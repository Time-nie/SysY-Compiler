#ifndef __TYPE_H__
#define __TYPE_H__
#include <vector>
#include <string>
#include "SymbolTable.h"
class Type
{
private:
    int kind;

protected:
    int size;

public:
    enum
    {
        INT,
        VOID,
        FUNC,
        PTR,
        ARRAY,
    };
    Type(int kind) : kind(kind){};
    // virtual ~Type() {};
    virtual std::string toStr() = 0;
    bool isInt() const { return kind == INT; };
    bool isVoid() const { return kind == VOID; };
    bool isFunc() const { return kind == FUNC; };
    bool isArray() const { return kind == ARRAY; };
    int getKind() { return kind; };
    virtual int getSize() = 0;
};

class IntType : public Type
{
private:
    bool constant;

public:
    IntType(int size, bool constant = false)
        : Type(Type::INT), constant(constant) { this->size = size; };
    std::string toStr();
    bool isConstant() { return constant; }
    int getSize() { return size; };
};

class VoidType : public Type
{
public:
    VoidType() : Type(Type::VOID){};
    std::string toStr();
    int getSize() { return size; };
};

class FunctionType : public Type
{
private:
    Type *returnType;
    std::vector<Type *> paramsType;
    std::vector<SymbolEntry *> paramsSe;

public:
    FunctionType(Type *returnType,
                 std::vector<Type *> paramsType,
                 std::vector<SymbolEntry *> paramsSe)
        : Type(Type::FUNC),
          returnType(returnType),
          paramsType(paramsType),
          paramsSe(paramsSe){};
    Type *getRetType() { return returnType; };
    std::vector<Type *> getParamsType() { return paramsType; };
    std::string toStr();
    std::vector<SymbolEntry *> getParamsSe() { return paramsSe; };
    int getSize() { return size; };
};

class ArrayType : public Type
{
private:
    Type *elementType;
    Type *arrayType = nullptr;
    int length;
    bool constant;

public:
    ArrayType(Type *elementType,
              int length,
              bool constant = false)
        : Type(Type::ARRAY),
          elementType(elementType),
          length(length),
          constant(constant)
    {
        size = elementType->getSize() * length;
    };
    std::string toStr();
    int getLength() const { return length; };
    Type *getEType() const { return elementType; };
    void setArrayType(Type *arrayType) { this->arrayType = arrayType; };
    Type *getArrayType() const { return arrayType; };
    int getSize() { return size; };
};

class PointerType : public Type
{
private:
    Type *valueType;

public:
    PointerType(Type *valueType) : Type(Type::PTR) { this->valueType = valueType; };
    std::string toStr();
    int getSize() { return size; };
    Type *getType() const { return valueType; };
};

class TypeSystem
{
private:
    static IntType commonInt;
    static IntType commonBool;
    static VoidType commonVoid;
    static IntType commonConstInt;

public:
    static Type *intType;
    static Type *voidType;
    static Type *boolType;
    static Type *constIntType;
};

#endif
