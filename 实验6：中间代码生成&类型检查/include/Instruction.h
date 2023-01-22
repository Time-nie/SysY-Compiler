#ifndef __INSTRUCTION_H__
#define __INSTRUCTION_H__

#include "Operand.h"
#include <vector>
#include <map>

class BasicBlock;

class Instruction
{
public:
    Instruction(unsigned instType, BasicBlock *insert_bb = nullptr);
    virtual ~Instruction();
    BasicBlock *getParent();
    bool isUncond() const { return instType == UNCOND; };
    bool isCond() const { return instType == COND; };

    bool isRet() const { return instType == RET; };

    void setParent(BasicBlock *);
    void setNext(Instruction *);
    void setPrev(Instruction *);
    Instruction *getNext();
    Instruction *getPrev();
    virtual void output() const = 0;

protected:
    unsigned instType;
    unsigned opcode;
    Instruction *prev;
    Instruction *next;
    BasicBlock *parent;
    std::vector<Operand *> operands;
    enum
    {
        BINARY,
        COND,
        UNCOND,
        RET,
        LOAD,
        STORE,
        CMP,
        ALLOCA,
        UNARY,
        GLOBAL,
        TEMP,
        CALL,
        NOT
    };
};

// meaningless instruction, used as the head node of the instruction list.
class DummyInstruction : public Instruction
{
public:
    DummyInstruction() : Instruction(-1, nullptr){};
    void output() const {};
};

class AllocaInstruction : public Instruction
{
public:
    AllocaInstruction(Operand *dst, SymbolEntry *se, BasicBlock *insert_bb = nullptr);
    ~AllocaInstruction();
    void output() const;

private:
    SymbolEntry *se;
};

class LoadInstruction : public Instruction
{
public:
    LoadInstruction(Operand *dst, Operand *src_addr, BasicBlock *insert_bb = nullptr);
    ~LoadInstruction();
    void output() const;
};

class StoreInstruction : public Instruction
{
public:
    StoreInstruction(Operand *dst_addr, Operand *src, BasicBlock *insert_bb = nullptr);
    ~StoreInstruction();
    void output() const;
};

class BinaryInstruction : public Instruction
{
public:
    BinaryInstruction(unsigned opcode, Operand *dst, Operand *src1, Operand *src2, BasicBlock *insert_bb = nullptr);
    ~BinaryInstruction();
    void output() const;
    enum
    {
        SUB,
        ADD,
        MUL,
        DIV,
        MOD,
        AND,
        OR
    };
};

class CmpInstruction : public Instruction
{
public:
    CmpInstruction(unsigned opcode, Operand *dst, Operand *src1, Operand *src2, BasicBlock *insert_bb = nullptr);
    ~CmpInstruction();
    void output() const;
    enum
    {
        E,
        NE,
        L,
        GE,
        G,
        LE
    };
};

// unconditional branch
class UncondBrInstruction : public Instruction
{
public:
    UncondBrInstruction(BasicBlock *, BasicBlock *insert_bb = nullptr);
    void output() const;
    void setBranch(BasicBlock *);
    BasicBlock *getBranch();

protected:
    BasicBlock *branch;
};

// conditional branch
class CondBrInstruction : public Instruction
{
public:
    CondBrInstruction(BasicBlock *, BasicBlock *, Operand *, BasicBlock *insert_bb = nullptr);
    ~CondBrInstruction();
    void output() const;
    void setTrueBranch(BasicBlock *);
    BasicBlock *getTrueBranch();
    void setFalseBranch(BasicBlock *);
    BasicBlock *getFalseBranch();

protected:
    BasicBlock *true_branch;
    BasicBlock *false_branch;
};

class GlobalInstruction : public Instruction
{
public:
    GlobalInstruction(Operand *dst, Operand *expr, SymbolEntry *se, BasicBlock *insertBB = nullptr);
    ~GlobalInstruction(){};
    void output() const;

private:
    SymbolEntry *se;
};

class ZextInstruction : public Instruction
{
public:
    ZextInstruction(Operand *dst, Operand *src, BasicBlock *insertBB = nullptr);
    ~ZextInstruction(){};
    void output() const;
};

class CallInstruction : public Instruction
{
private:
    SymbolEntry *func;

public:
    CallInstruction(Operand *dst,
                    SymbolEntry *func,
                    std::vector<Operand *> params,
                    BasicBlock *insert_bb = nullptr);
    void output() const;
};

class RetInstruction : public Instruction
{
public:
    RetInstruction(Operand *src, BasicBlock *insert_bb = nullptr);
    ~RetInstruction();
    void output() const;
};

class UnaryInstruction : public Instruction
{
public:
    UnaryInstruction(unsigned opcode, Operand *dst, Operand *src, BasicBlock *insert_bb = nullptr);
    ~UnaryInstruction();
    void output() const;
    enum
    {
        ADD,
        SUB,
        NOT
    };
};

class NotInstruction : public Instruction
{
public:
    NotInstruction(Operand *dst, Operand *src, BasicBlock *insert_bb = nullptr);
    ~NotInstruction();
    void output() const;
};

#endif