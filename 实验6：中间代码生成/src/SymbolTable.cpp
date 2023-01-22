// 对SymbolTable.h中声明的函数的实现
// 已实现插入，需要实现查找函数
#include "SymbolTable.h"
#include "Type.h"
#include <assert.h>
#include <iostream>
#include <sstream>

SymbolEntry::SymbolEntry(Type *type, int kind)
{
    this->type = type;
    this->kind = kind;
    this->next = nullptr;
}

void SymbolEntry::setNext(SymbolEntry *se)
{
    SymbolEntry *temp = this;
    int count = ((FunctionType *)(se->getType()))->getParamsType().size();
    while (temp)
    {
        if ((long unsigned int)count == ((FunctionType *)(temp->getType()))->getParamsType().size())
        {
            fprintf(stderr, "function \"%s\" is defined twice\n", se->toStr().c_str());
            assert((long unsigned int)count != ((FunctionType *)(temp->getType()))->getParamsType().size());
        }
        temp = temp->getNext();
    }
    temp = this;
    while (temp->getNext())
        temp = temp->getNext();
    temp->next = se;
}

ConstantSymbolEntry::ConstantSymbolEntry(Type *type, int value) : SymbolEntry(type, SymbolEntry::CONSTANT)
{
    this->value = value;
}

std::string ConstantSymbolEntry::toStr()
{
    std::ostringstream buffer;
    buffer << value;
    return buffer.str();
}

IdentifierSymbolEntry::IdentifierSymbolEntry(Type *type, std::string name, int scope) : SymbolEntry(type, SymbolEntry::VARIABLE), name(name)
{
    this->scope = scope;
    addr = nullptr;
}

std::string IdentifierSymbolEntry::toStr()
{
    return "@" + name;
}

TemporarySymbolEntry::TemporarySymbolEntry(Type *type, int label) : SymbolEntry(type, SymbolEntry::TEMPORARY)
{
    this->label = label;
}

std::string TemporarySymbolEntry::toStr()
{
    std::ostringstream buffer;
    buffer << "%t" << label;
    return buffer.str();
}

SymbolTable::SymbolTable()
{
    prev = nullptr;
    level = 0;
}

SymbolTable::SymbolTable(SymbolTable *prev)
{
    this->prev = prev;
    this->level = prev->level + 1;
}

/*
    Description: lookup the symbol entry of an identifier in the symbol table
    Parameters:
        name: identifier name
    Return: pointer to the symbol entry of the identifier

    hint:
    1. The symbol table is a stack. The top of the stack contains symbol entries in the current scope.
    2. Search the entry in the current symbol table at first.
    3. If it's not in the current table, search it in previous ones(along the 'prev' link).
    4. If you find the entry, return it.
    5. If you can't find it in all symbol tables, return nullptr.
*/
SymbolEntry *SymbolTable::lookup(std::string name)
{
    SymbolTable *current = identifiers;
    while (current != nullptr)
        // symbolTable为map类型的成员变量
        if (current->symbolTable.find(name) != current->symbolTable.end())
            return current->symbolTable[name];
        else
            // 向下一个SymbolTable去找
            current = current->prev;
    return nullptr;
}

// install the entry into current symbol table.
void SymbolTable::install(std::string name, SymbolEntry *entry)
{
    // 同时检查是否有函数的重定义,如果有同名的函数，链入符号表项
    if (symbolTable.find(name) != symbolTable.end() && symbolTable[name]->getType()->isFunc())
    {
        symbolTable[name]->setNext(entry);
    }
    else
    {
        symbolTable[name] = entry;
    }
}

int SymbolTable::counter = 0;
static SymbolTable t;
SymbolTable *identifiers = &t;
SymbolTable *globals = &t;
