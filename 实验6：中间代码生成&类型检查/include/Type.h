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
public:
    enum
    {
        INT,
        VOID,
        FUNC,
        PTR,
        ARRAY,
        STRING
    };
    Type(int kind) : kind(kind){};
    // virtual ~Type() {};
    virtual std::string toStr() = 0;
    bool isInt() const { return kind == INT; };
    bool isVoid() const { return kind == VOID; };
    bool isFunc() const { return kind == FUNC; };
    bool isArray() const { return kind == ARRAY; };
    bool isString() const { return kind == STRING; };
    int getKind() { return kind; };
};

class IntType : public Type
{
private:
    int size;
    bool constant;

public:
    IntType(int size, bool constant = false)
        : Type(Type::INT), size(size), constant(constant){};
    std::string toStr();
    bool isConstant() { return constant; }
};

class VoidType : public Type
{
public:
    VoidType() : Type(Type::VOID){};
    std::string toStr();
};

class FunctionType : public Type
{
private:
    Type *returnType;
    std::vector<Type *> paramsType;
    std::vector<SymbolEntry*> paramsSe;

public:
    FunctionType(Type* returnType,
                 std::vector<Type*> paramsType,
                 std::vector<SymbolEntry*> paramsSe)
        : Type(Type::FUNC),
          returnType(returnType),
          paramsType(paramsType),
          paramsSe(paramsSe){};
    Type *getRetType() { return returnType; };
    std::vector<Type *> getParamsType() { return paramsType; };
    std::string toStr();
    std::vector<SymbolEntry*> getParamsSe() { return paramsSe; };

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
          constant(constant){};
    std::string toStr();
    int getLength() const { return length; };
    Type *getElementType() const { return elementType; };
    void setArrayType(Type *arrayType) { this->arrayType = arrayType; };
    Type *getArrayType() const { return arrayType; };
};

class StringType : public Type
{
private:
    int length;

public:
    StringType(int length) : Type(Type::STRING), length(length){};
    int getLength() const { return length; };
    std::string toStr();
};

class PointerType : public Type
{
private:
    Type *valueType;

public:
    PointerType(Type *valueType) : Type(Type::PTR) { this->valueType = valueType; };
    std::string toStr();
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
