#include <iostream>
#include <string.h>
#include <unistd.h>
#include "Ast.h"
#include "Unit.h"
#include "MachineCode.h"
#include "LinearScan.h"
#include "Type.h"
#include "SymbolTable.h"
using namespace std;

Ast ast;
Unit unit;
MachineUnit mUnit;
extern FILE *yyin;
extern FILE *yyout;

int yyparse();

char outfile[256] = "a.out";
bool dump_tokens;
bool dump_ast;
bool dump_ir;
bool dump_asm;

int main(int argc, char *argv[])
{
    int opt;
    while ((opt = getopt(argc, argv, "Siato:")) != -1)
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
        case 'S':
            dump_asm = true;
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

    // 添加运行时库
    // create a se and install to "identifiers"
    // getint
    std::vector<Type *> vec;
    std::vector<SymbolEntry *> vec1;
    Type *funcType = new FunctionType(TypeSystem::intType, vec, vec1);
    SymbolTable *st = identifiers;
    while (st->getPrev())
        st = st->getPrev();
    SymbolEntry *se = new IdentifierSymbolEntry(funcType, "getint", st->getLevel());
    st->install("getint", se);

    // getch
    funcType = new FunctionType(TypeSystem::intType, vec, vec1);
    st = identifiers;
    while (st->getPrev())
        st = st->getPrev();
    se = new IdentifierSymbolEntry(funcType, "getch", st->getLevel());
    st->install("getch", se);

    // getarray
    ArrayType *arr = new ArrayType(TypeSystem::intType, -1);
    vec.push_back(arr);
    funcType = new FunctionType(TypeSystem::intType, vec, vec1);
    st = identifiers;
    while (st->getPrev())
        st = st->getPrev();
    se = new IdentifierSymbolEntry(funcType, "getarray", st->getLevel());
    st->install("getarray", se);

    // putint
    vec.clear();
    vec1.clear();
    vec.push_back(TypeSystem::intType);
    funcType = new FunctionType(TypeSystem::voidType, vec, vec1);
    st = identifiers;
    while (st->getPrev())
        st = st->getPrev();
    se = new IdentifierSymbolEntry(funcType, "putint", st->getLevel());
    st->install("putint", se);

    // putch
    vec.clear();
    vec1.clear();
    vec.push_back(TypeSystem::intType);
    funcType = new FunctionType(TypeSystem::voidType, vec, vec1);
    st = identifiers;
    while (st->getPrev())
        st = st->getPrev();
    se = new IdentifierSymbolEntry(funcType, "putch", st->getLevel());
    st->install("putch", se);

    // putarray
    vec.clear();
    vec1.clear();
    vec.push_back(TypeSystem::intType);
    arr = new ArrayType(TypeSystem::intType, -1);
    vec.push_back(arr);
    funcType = new FunctionType(TypeSystem::voidType, vec, vec1);
    st = identifiers;
    while (st->getPrev())
        st = st->getPrev();
    se = new IdentifierSymbolEntry(funcType, "putarray", st->getLevel());
    st->install("putarray", se);

    // starttime
    vec.clear();
    vec1.clear();
    funcType = new FunctionType(TypeSystem::voidType, vec, vec1);
    st = identifiers;
    while (st->getPrev())
        st = st->getPrev();
    se = new IdentifierSymbolEntry(funcType, "starttime", st->getLevel());
    st->install("starttime", se);

    // stoptime
    vec.clear();
    vec1.clear();
    funcType = new FunctionType(TypeSystem::voidType, vec, vec1);
    st = identifiers;
    while (st->getPrev())
        st = st->getPrev();
    se = new IdentifierSymbolEntry(funcType, "stoptime", st->getLevel());
    st->install("stoptime", se);

    yyparse();
    fprintf(stderr, "过了yyparse\n");
    if (dump_ast)
        ast.output();
    fprintf(stderr, "完成语法树输出\n");
    ast.typeCheck();
    ast.genCode(&unit);
    if (dump_ir)
        unit.output();
    fprintf(stderr, "完成中间代码生成\n");
    unit.genMachineCode(&mUnit);
    fprintf(stderr, "完成目标代码生成\n");
    LinearScan linearScan(&mUnit);
    fprintf(stderr, "完成初始化linearScan\n");
    linearScan.allocateRegisters();
    fprintf(stderr, "完成寄存器分配\n");
    if (dump_asm)
        mUnit.output();
    fprintf(stderr, "完成目标代码输出\n");
    return 0;
}
