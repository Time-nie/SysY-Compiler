#include "Instruction.h"
#include "BasicBlock.h"
#include <iostream>
#include "Function.h"
#include "Type.h"
#include <assert.h>
extern FILE *yyout;

Instruction::Instruction(unsigned instType, BasicBlock *insert_bb)
{
    prev = next = this;
    opcode = -1;
    this->instType = instType;
    if (insert_bb != nullptr)
    {
        insert_bb->insertBack(this);
        parent = insert_bb;
    }
}

Instruction::~Instruction()
{
    parent->remove(this);
}

BasicBlock *Instruction::getParent()
{
    return parent;
}

void Instruction::setParent(BasicBlock *bb)
{
    parent = bb;
}

void Instruction::setNext(Instruction *inst)
{
    next = inst;
}

void Instruction::setPrev(Instruction *inst)
{
    prev = inst;
}

Instruction *Instruction::getNext()
{
    return next;
}

Instruction *Instruction::getPrev()
{
    return prev;
}

BinaryInstruction::BinaryInstruction(unsigned opcode, Operand *dst, Operand *src1, Operand *src2, BasicBlock *insert_bb) : Instruction(BINARY, insert_bb)
{
    this->opcode = opcode;
    operands.push_back(dst);
    operands.push_back(src1);
    operands.push_back(src2);
    dst->setDef(this);
    src1->addUse(this);
    src2->addUse(this);
}

BinaryInstruction::~BinaryInstruction()
{
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
    operands[2]->removeUse(this);
}

void BinaryInstruction::output() const
{
    std::string s1, s2, s3, op, type;
    s1 = operands[0]->toStr();
    s2 = operands[1]->toStr();
    s3 = operands[2]->toStr();
    type = operands[0]->getType()->toStr();
    switch (opcode)
    {
    case ADD:
        op = "add";
        break;
    case SUB:
        op = "sub";
        break;
    case MUL:
        op = "mul";
        break;
    case DIV:
        op = "sdiv";
        break;
    case MOD:
        op = "srem";
        break;
    default:
        break;
    }
    fprintf(yyout, "  %s = %s %s %s, %s\n", s1.c_str(), op.c_str(), type.c_str(), s2.c_str(), s3.c_str());
}

CmpInstruction::CmpInstruction(unsigned opcode, Operand *dst, Operand *src1, Operand *src2, BasicBlock *insert_bb) : Instruction(CMP, insert_bb)
{
    this->opcode = opcode;
    operands.push_back(dst);
    operands.push_back(src1);
    operands.push_back(src2);
    dst->setDef(this);
    src1->addUse(this);
    src2->addUse(this);
    dst->getSymbolEntry()->setType(TypeSystem::boolType);
}

CmpInstruction::~CmpInstruction()
{
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
    operands[2]->removeUse(this);
}

void CmpInstruction::output() const
{
    std::string s1, s2, s3, op, type;
    s1 = operands[0]->toStr();
    s2 = operands[1]->toStr();
    s3 = operands[2]->toStr();
    type = operands[1]->getType()->toStr();
    switch (opcode)
    {
    case E:
        op = "eq";
        break;
    case NE:
        op = "ne";
        break;
    case L:
        op = "slt";
        break;
    case LE:
        op = "sle";
        break;
    case G:
        op = "sgt";
        break;
    case GE:
        op = "sge";
        break;
    default:
        op = "";
        break;
    }

    fprintf(yyout, "  %s = icmp %s %s %s, %s\n", s1.c_str(), op.c_str(), type.c_str(), s2.c_str(), s3.c_str());
}

UncondBrInstruction::UncondBrInstruction(BasicBlock *to, BasicBlock *insert_bb) : Instruction(UNCOND, insert_bb)
{
    branch = to;
}

void UncondBrInstruction::output() const
{
    fprintf(yyout, "  br label %%B%d\n", branch->getNo());
}

void UncondBrInstruction::setBranch(BasicBlock *bb)
{
    branch = bb;
}

BasicBlock *UncondBrInstruction::getBranch()
{
    return branch;
}

CondBrInstruction::CondBrInstruction(BasicBlock *true_branch, BasicBlock *false_branch, Operand *cond, BasicBlock *insert_bb) : Instruction(COND, insert_bb)
{
    this->true_branch = true_branch;
    this->false_branch = false_branch;
    cond->addUse(this);
    operands.push_back(cond);
}

CondBrInstruction::~CondBrInstruction()
{
    operands[0]->removeUse(this);
}

void CondBrInstruction::output() const
{
    std::string cond, type;
    cond = operands[0]->toStr();
    type = operands[0]->getType()->toStr();
    int true_label = true_branch->getNo();
    int false_label = false_branch->getNo();
    fprintf(yyout, "  br %s %s, label %%B%d, label %%B%d\n", type.c_str(), cond.c_str(), true_label, false_label);
}

void CondBrInstruction::setFalseBranch(BasicBlock *bb)
{
    false_branch = bb;
}

BasicBlock *CondBrInstruction::getFalseBranch()
{
    return false_branch;
}

void CondBrInstruction::setTrueBranch(BasicBlock *bb)
{
    true_branch = bb;
}

BasicBlock *CondBrInstruction::getTrueBranch()
{
    return true_branch;
}

GlobalInstruction::GlobalInstruction(Operand *dst, Operand *expr, SymbolEntry *se, BasicBlock *insertBB) : Instruction(GLOBAL, insertBB)
{
    operands.push_back(dst);
    operands.push_back(expr);
    this->se = se;
    dst->setDef(this);
}

void GlobalInstruction::output() const
{
    if (operands[1] == nullptr)
    {
        if (operands[0]->getType() == TypeSystem::constIntType)
        {
            fprintf(stderr, "Initials need to be assigned when declaring constants\n");
            assert(operands[0]->getType() != TypeSystem::constIntType);
        }
        else
        {
            fprintf(yyout, "%s = global %s 0, align 4 \n", operands[0]->toStr().c_str(), operands[0]->getType()->toStr().c_str());
        }
    }
    else
    {
        if (operands[0]->getType() == TypeSystem::constIntType)
        {
            fprintf(yyout, "%s = constant %s %s, align 4 \n", operands[0]->toStr().c_str(), operands[0]->getType()->toStr().c_str(), operands[1]->toStr().c_str());
        }
        else
        {
            fprintf(yyout, "%s = global %s %s, align 4 \n", operands[0]->toStr().c_str(), operands[0]->getType()->toStr().c_str(), operands[1]->toStr().c_str());
        }
    }
}

// 零拓展
ZextInstruction::ZextInstruction(Operand *dst, Operand *src, BasicBlock *insertBB) : Instruction(TEMP, insertBB)
{
    operands.push_back(dst);
    operands.push_back(src);
}

void ZextInstruction::output() const
{
    fprintf(yyout, "  %s = zext i1 %s to i32\n", operands[0]->toStr().c_str(), operands[1]->toStr().c_str());
}

CallInstruction::CallInstruction(Operand *dst,
                                 SymbolEntry *func,
                                 std::vector<Operand *> params,
                                 BasicBlock *insert_bb)
    : Instruction(CALL, insert_bb), func(func)
{
    operands.push_back(dst);
    if (dst)
        dst->setDef(this);
    for (auto param : params)
    {
        operands.push_back(param);
        param->addUse(this);
    }
}

void CallInstruction::output() const
{
    fprintf(yyout, "  ");
    if (operands[0])
        fprintf(yyout, "%s = ", operands[0]->toStr().c_str());
    FunctionType *type = (FunctionType *)(func->getType());
    fprintf(yyout, "call %s %s(", type->getRetType()->toStr().c_str(),
            func->toStr().c_str());
    for (long unsigned int i = 1; i < operands.size(); i++)
    {
        if (i != 1)
            fprintf(yyout, ", ");
        fprintf(yyout, "%s %s", operands[i]->getType()->toStr().c_str(),
                operands[i]->toStr().c_str());
    }
    fprintf(yyout, ")\n");
}

RetInstruction::RetInstruction(Operand *src, BasicBlock *insert_bb) : Instruction(RET, insert_bb)
{
    if (src != nullptr)
    {
        operands.push_back(src);
        src->addUse(this);
    }
}

RetInstruction::~RetInstruction()
{
    if (!operands.empty())
        operands[0]->removeUse(this);
}

void RetInstruction::output() const
{
    if (operands.empty())
    {
        fprintf(yyout, "  ret void\n");
    }
    else
    {
        std::string ret, type;
        ret = operands[0]->toStr();
        type = operands[0]->getType()->toStr();
        fprintf(yyout, "  ret %s %s\n", type.c_str(), ret.c_str());
    }
}

AllocaInstruction::AllocaInstruction(Operand *dst, SymbolEntry *se, BasicBlock *insert_bb) : Instruction(ALLOCA, insert_bb)
{
    operands.push_back(dst);
    dst->setDef(this);
    this->se = se;
}

AllocaInstruction::~AllocaInstruction()
{
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == 0)
        delete operands[0];
}

void AllocaInstruction::output() const
{
    std::string dst, type;
    dst = operands[0]->toStr();
    type = se->getType()->toStr();
    fprintf(yyout, "  %s = alloca %s, align 4\n", dst.c_str(), type.c_str());
}

LoadInstruction::LoadInstruction(Operand *dst, Operand *src_addr, BasicBlock *insert_bb) : Instruction(LOAD, insert_bb)
{
    fprintf(stderr, "LoadInstruction\n");
    fprintf(stderr, "dst: %s,src_addr :%s\n", dst->toStr().c_str(), src_addr->toStr().c_str());
    operands.push_back(dst);
    operands.push_back(src_addr);
    dst->setDef(this);
    src_addr->addUse(this);
}

LoadInstruction::~LoadInstruction()
{
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
}

void LoadInstruction::output() const
{
    std::string dst = operands[0]->toStr();
    std::string src = operands[1]->toStr();
    std::string src_type;
    std::string dst_type;
    dst_type = operands[0]->getType()->toStr();
    src_type = operands[1]->getType()->toStr();
    fprintf(yyout, "  %s = load %s, %s %s, align 4\n", dst.c_str(), dst_type.c_str(), src_type.c_str(), src.c_str());
}

StoreInstruction::StoreInstruction(Operand *dst_addr, Operand *src, BasicBlock *insert_bb) : Instruction(STORE, insert_bb)
{
    operands.push_back(dst_addr);
    operands.push_back(src);
    dst_addr->addUse(this);
    src->addUse(this);
}

StoreInstruction::~StoreInstruction()
{
    operands[0]->removeUse(this);
    operands[1]->removeUse(this);
}

void StoreInstruction::output() const
{
    std::string dst = operands[0]->toStr();
    std::string src = operands[1]->toStr();
    std::string dst_type = operands[0]->getType()->toStr();
    std::string src_type = operands[1]->getType()->toStr();

    fprintf(yyout, "  store %s %s, %s %s, align 4\n", src_type.c_str(), src.c_str(), dst_type.c_str(), dst.c_str());
}

UnaryInstruction::UnaryInstruction(unsigned opcode, Operand *dst, Operand *src, BasicBlock *insert_bb) : Instruction(UNARY, insert_bb)
{
    this->opcode = opcode;
    operands.push_back(dst);
    operands.push_back(src);
    dst->setDef(this);
    src->addUse(this);
}

UnaryInstruction::~UnaryInstruction()
{
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
}

void UnaryInstruction::output() const
{
    std::string s1, s2, type;
    s1 = operands[0]->toStr();
    s2 = operands[1]->toStr();
    type = operands[0]->getType()->toStr();
    switch (opcode)
    {
    case ADD:
        fprintf(yyout, "  %s = add %s 0, %s\n", s1.c_str(), type.c_str(), s2.c_str());
        break;
    case SUB:
        fprintf(yyout, "  %s = sub %s 0, %s\n", s1.c_str(), type.c_str(), s2.c_str());
        break;
    case NOT:
        fprintf(yyout, "  %s = not %s %s\n", s1.c_str(), type.c_str(), s2.c_str());
        break;
    default:
        break;
    }
}

NotInstruction::NotInstruction(Operand *dst, Operand *src, BasicBlock *insert_bb) : Instruction(NOT, insert_bb)
{
    operands.push_back(dst);
    operands.push_back(src);
    dst->setDef(this);
    src->addUse(this);

    dst->getSymbolEntry()->setType(TypeSystem::boolType);
}

NotInstruction::~NotInstruction()
{
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
}

void NotInstruction::output() const
{
    std::string s1, s2, type;
    s1 = operands[0]->toStr();
    s2 = operands[1]->toStr();
    type = operands[0]->getType()->toStr();

    fprintf(yyout, "  %s = xor %s %s, true\n", s1.c_str(), type.c_str(), s2.c_str());
}
