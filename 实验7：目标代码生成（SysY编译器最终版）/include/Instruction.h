#ifndef __INSTRUCTION_H__
#define __INSTRUCTION_H__

#include "Operand.h"
#include "AsmBuilder.h"
#include <vector>
#include <map>
#include <sstream>

class BasicBlock;

class Instruction
{
public:
    Instruction(unsigned instType, BasicBlock *insert_bb = nullptr);
    virtual ~Instruction();
    BasicBlock *getParent();
    bool isUncond() const { return instType == UNCOND; };
    bool isCond() const { return instType == COND; };
    bool isAlloc() const { return instType == ALLOCA; };
    bool isRet() const { return instType == RET; };
    void setParent(BasicBlock *);
    void setLink(Instruction *);
    void setPrev(Instruction *);
    Instruction *getLink();
    Instruction *getPrev();
    virtual void output() const = 0;
    MachineOperand *genMachineOperand(Operand *);
    MachineOperand *genMachineReg(int reg);
    MachineOperand *genMachineVReg();
    MachineOperand *genMachineImm(int val);
    MachineOperand *genMachineLabel(int block_no);
    virtual void genMachineCode(AsmBuilder *) = 0;

protected:
    unsigned instType;
    unsigned opcode;
    Instruction *prev;
    Instruction *link;
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
        NOT,
        GEP
    };

public:
    bool Judge(int imm)
    {
        // 这里为啥要强制类型转换嘞，因为下边要用到右移，而对于有符号数右移，如果是负数，算数右移会在前边补1。
        // 无符号数右移就是逻辑右移
        unsigned int num = (unsigned int)imm;
        // 思路就是每次循环左移两位，看看结果是否可以用8位来表示了。
        for (int i = 0; i < 16; i++)
        {
            if (num <= 0xff)
            {
                return true;
            }
            num = ((num << 2) | (num >> 30));
        }
        return false;
    }
};

// meaningless instruction, used as the head node of the instruction list.
class DummyInstruction : public Instruction
{
public:
    DummyInstruction() : Instruction(-1, nullptr){};
    void output() const {};
    void genMachineCode(AsmBuilder *){};
};

class AllocaInstruction : public Instruction
{
public:
    AllocaInstruction(Operand *dst, SymbolEntry *se, BasicBlock *insert_bb = nullptr);
    ~AllocaInstruction();
    void output() const;
    void genMachineCode(AsmBuilder *);

private:
    SymbolEntry *se;
};

class LoadInstruction : public Instruction
{
public:
    LoadInstruction(Operand *dst, Operand *src_addr, BasicBlock *insert_bb = nullptr);
    ~LoadInstruction();
    void output() const;
    void genMachineCode(AsmBuilder *);
};

class StoreInstruction : public Instruction
{
    int paramno;

public:
    StoreInstruction(Operand *dst_addr, Operand *src, BasicBlock *insert_bb = nullptr, int paramno = -1);
    ~StoreInstruction();
    void output() const;
    void genMachineCode(AsmBuilder *);
};

class BinaryInstruction : public Instruction
{
public:
    BinaryInstruction(unsigned opcode, Operand *dst, Operand *src1, Operand *src2, BasicBlock *insert_bb = nullptr);
    ~BinaryInstruction();
    void output() const;
    void genMachineCode(AsmBuilder *);
    enum
    {
        SUB,
        ADD,
        MUL,
        DIV,
        MOD,
        AND,
        OR,
    };
};

class CmpInstruction : public Instruction
{
public:
    CmpInstruction(unsigned opcode, Operand *dst, Operand *src1, Operand *src2, BasicBlock *insert_bb = nullptr);
    ~CmpInstruction();
    void output() const;
    void genMachineCode(AsmBuilder *);
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
    void genMachineCode(AsmBuilder *);

protected:
    BasicBlock *branch;
};

// conditional branch
class CondBrInstruction : public Instruction
{
public:
    enum
    {
        E,
        NE,
        L,
        GE,
        G,
        LE
    };

    CondBrInstruction(BasicBlock *, BasicBlock *, Operand *, BasicBlock *insert_bb = nullptr);
    ~CondBrInstruction();
    void output() const;
    void setTrueBranch(BasicBlock *);
    BasicBlock *getTrueBranch();
    void setFalseBranch(BasicBlock *);
    BasicBlock *getFalseBranch();
    void genMachineCode(AsmBuilder *);
    void setop(int op) { opcode = op; };

protected:
    BasicBlock *true_branch;
    BasicBlock *false_branch;
};

class GlobalInstruction : public Instruction
{
public:
    GlobalInstruction(Operand *dst, std::vector<Operand *> expr, SymbolEntry *se, BasicBlock *insertBB = nullptr);
    ~GlobalInstruction(){};
    void output() const;
    void genMachineCode(AsmBuilder *);

private:
    SymbolEntry *se;
};

class Bool2IntInstruction : public Instruction
{
public:
    Bool2IntInstruction(Operand *dst, Operand *src, BasicBlock *insertBB = nullptr);
    ~Bool2IntInstruction(){};
    void output() const;
    void genMachineCode(AsmBuilder *);
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
    void genMachineCode(AsmBuilder *);
    SymbolEntry *getEntry()
    {
        return func;
    }
};

class RetInstruction : public Instruction
{
public:
    RetInstruction(Operand *src, BasicBlock *insert_bb = nullptr);
    ~RetInstruction();
    void output() const;
    void genMachineCode(AsmBuilder *);
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
    void genMachineCode(AsmBuilder *);
};

class ArInstruction : public Instruction
{
private:
    bool paramFirst;
    bool first;
    bool last;
    Operand *init;

public:
    ArInstruction(Operand *dst,
                  Operand *arr,
                  Operand *idx,
                  BasicBlock *insert_bb = nullptr,
                  bool paramFirst = false);
    ~ArInstruction();
    void output() const;
    void setFirst() { first = true; };
    void setLast() { last = true; };
    Operand *getInit() const { return init; };
    void setInit(Operand *init) { this->init = init; };
    void genMachineCode(AsmBuilder *);
};

#endif