#include <iostream>
#include <string.h>
#include <unistd.h>
#include "Ast.h"
#include "Unit.h"
#include "Type.h"
#include "SymbolTable.h"
using namespace std;

Ast ast;
Unit unit;
extern FILE *yyin;
extern FILE *yyout;

int yyparse();

char outfile[256] = "a.out";
bool dump_tokens;
bool dump_ast;
bool dump_ir;

int main(int argc, char *argv[])
{
    int opt;
    while ((opt = getopt(argc, argv, "iato:")) != -1)
    {
        switch (opt)
        {
        case 'o':
            strcpy(outfile, optarg);
            break;
        case 'a':
            dump_ast = true;
            break;
        case 't':
            dump_tokens = true;
            break;
        case 'i':
            dump_ir = true;
            break;
        default:
            fprintf(stderr, "Usage: %s [-o outfile] infile\n", argv[0]);
            exit(EXIT_FAILURE);
            break;
        }
    }
    if (optind >= argc)
    {
        fprintf(stderr, "no input file\n");
        exit(EXIT_FAILURE);
    }
    if (!(yyin = fopen(argv[optind], "r")))
    {
        fprintf(stderr, "%s: No such file or directory\nno input file\n", argv[optind]);
        exit(EXIT_FAILURE);
    }
    if (!(yyout = fopen(outfile, "w")))
    {
        fprintf(stderr, "%s: fail to open output file\n", outfile);
        exit(EXIT_FAILURE);
    }

    // SymbolEntry* seGetint = new IdentifierSymbolEntry(TypeSystem::intType, "getint", identifiers->getLevel());
    // identifiers->install("getint", seGetint);
    // SymbolEntry* seGetch = new IdentifierSymbolEntry(TypeSystem::intType, "getch", identifiers->getLevel());
    // identifiers->install("getch", seGetch);
    // SymbolEntry* seGetarray = new IdentifierSymbolEntry(TypeSystem::intType, "getarray", identifiers->getLevel());
    // identifiers->install("getarray", seGetarray);
    // SymbolEntry* sePutint = new IdentifierSymbolEntry(TypeSystem::voidType, "putint", identifiers->getLevel());
    // identifiers->install("putint", sePutint);
    // SymbolEntry* sePutch = new IdentifierSymbolEntry(TypeSystem::voidType, "putch", identifiers->getLevel());
    // identifiers->install("putch", sePutch);
    // SymbolEntry* sePutarray = new IdentifierSymbolEntry(TypeSystem::voidType, "putarray", identifiers->getLevel());
    // identifiers->install("putarray", sePutarray);
    // SymbolEntry* sePutf = new IdentifierSymbolEntry(TypeSystem::voidType, "putf", identifiers->getLevel());
    // identifiers->install("putf", sePutf);

    // 添加运行时库
    // create a se and install to "identifiers"
    // getint
    std::vector<Type*> vec;
    std::vector<SymbolEntry*> vec1;
    Type* funcType = new FunctionType(TypeSystem::intType, vec,vec1);
    SymbolTable* st = identifiers;
    while(st->getPrev())
        st = st->getPrev();
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, "getint", st->getLevel());
    st->install("getint", se);

    // getch
    funcType = new FunctionType(TypeSystem::intType, vec,vec1);
    st = identifiers;
    while(st->getPrev())
        st = st->getPrev();
    se = new IdentifierSymbolEntry(funcType,"getch", st->getLevel());
    st->install("getch", se);

    // getarray
    ArrayType* arr = new ArrayType(TypeSystem::intType, -1);
    vec.push_back(arr);
    funcType = new FunctionType(TypeSystem::intType, vec,vec1);
    st = identifiers;
    while(st->getPrev())
        st = st->getPrev();
    se = new IdentifierSymbolEntry(funcType, "getarray", st->getLevel());
    st->install("getarray", se);

    // putint
    vec.clear();
    vec1.clear();
    vec.push_back(TypeSystem::intType);
    funcType = new FunctionType(TypeSystem::voidType, vec,vec1);
    st = identifiers;
    while(st->getPrev())
        st = st->getPrev();
    se = new IdentifierSymbolEntry(funcType, "putint", st->getLevel());
    st->install("putint", se);

    // putch
    vec.clear();
    vec1.clear();
    vec.push_back(TypeSystem::intType);
    funcType = new FunctionType(TypeSystem::voidType, vec,vec1);
    st = identifiers;
    while(st->getPrev())
        st = st->getPrev();
    se = new IdentifierSymbolEntry(funcType, "putch", st->getLevel());
    st->install("putch", se);

    // putarray
    vec.clear();
    vec1.clear();
    vec.push_back(TypeSystem::intType);
    arr = new ArrayType(TypeSystem::intType, -1);
    vec.push_back(arr);
    funcType = new FunctionType(TypeSystem::voidType, vec,vec1);
    st = identifiers;
    while(st->getPrev())
        st = st->getPrev();
    se = new IdentifierSymbolEntry(funcType, "putarray", st->getLevel());
    st->install("putarray", se);

    // putf
    vec.clear();
    vec1.clear();
    StringType* str = new StringType(0);
    vec.push_back(str);
    funcType = new FunctionType(TypeSystem::voidType, vec,vec1);
    st = identifiers;
    while(st->getPrev())
        st = st->getPrev();
    se = new IdentifierSymbolEntry(funcType, "putf", st->getLevel());
    st->install("putf", se);

    // starttime
    vec.clear();
    vec1.clear();
    funcType = new FunctionType(TypeSystem::voidType, vec,vec1);
    st = identifiers;
    while(st->getPrev())
        st = st->getPrev();
    se = new IdentifierSymbolEntry(funcType, "starttime", st->getLevel());
    st->install("starttime", se);

    // stoptime
    vec.clear();
    vec1.clear();
    funcType = new FunctionType(TypeSystem::voidType, vec,vec1);
    st = identifiers;
    while(st->getPrev())
        st = st->getPrev();
    se = new IdentifierSymbolEntry(funcType, "stoptime", st->getLevel());
    st->install("stoptime", se);

    yyparse();
    if(dump_ast)
        ast.output();
    ast.typeCheck();
    ast.genCode(&unit);
    if(dump_ir)
        unit.output();
    
    return 0;
}
