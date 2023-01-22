#include "Instruction.h"
#include "BasicBlock.h"
#include <iostream>
#include "Function.h"
#include "Type.h"
#include <assert.h>
extern FILE *yyout;

Instruction::Instruction(unsigned instType, BasicBlock *insert_bb)
{
    prev = link = this;
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

void Instruction::setLink(Instruction *inst)
{
    link = inst;
}

void Instruction::setPrev(Instruction *inst)
{
    prev = inst;
}

Instruction *Instruction::getLink()
{
    return link;
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
    dst->getEntry()->setType(TypeSystem::boolType);
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
}

UncondBrInstruction::UncondBrInstruction(BasicBlock *to, BasicBlock *insert_bb) : Instruction(UNCOND, insert_bb)
{
    branch = to;
}

void UncondBrInstruction::output() const
{
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

GlobalInstruction::GlobalInstruction(Operand *dst, std::vector<Operand *> expr, SymbolEntry *se, BasicBlock *insertBB) : Instruction(GLOBAL, insertBB)
{
    operands.push_back(dst);
    for (unsigned int i = 0; i < expr.size(); i++)
    {
        operands.push_back(expr[i]);
    }
    this->se = se;
    dst->setDef(this);
}

void GlobalInstruction::output() const
{
}

// Bool2IntInstruction
Bool2IntInstruction::Bool2IntInstruction(Operand *dst, Operand *src, BasicBlock *insertBB) : Instruction(TEMP, insertBB)
{
    operands.push_back(dst);
    operands.push_back(src);
}

void Bool2IntInstruction::output() const
{
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
}

StoreInstruction::StoreInstruction(Operand *dst_addr, Operand *src, BasicBlock *insert_bb, int paramno) : Instruction(STORE, insert_bb)
{
    operands.push_back(dst_addr);
    operands.push_back(src);
    dst_addr->addUse(this);
    src->addUse(this);
    this->paramno = paramno;
}

StoreInstruction::~StoreInstruction()
{
    operands[0]->removeUse(this);
    operands[1]->removeUse(this);
}

void StoreInstruction::output() const
{
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
}

NotInstruction::NotInstruction(Operand *dst, Operand *src, BasicBlock *insert_bb) : Instruction(NOT, insert_bb)
{
    operands.push_back(dst);
    operands.push_back(src);
    dst->setDef(this);
    src->addUse(this);

    dst->getEntry()->setType(TypeSystem::boolType);
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
}

MachineOperand *Instruction::genMachineOperand(Operand *ope)
{
    auto se = ope->getEntry();
    MachineOperand *mope = nullptr;
    if (se->isConstant())
        mope = new MachineOperand(MachineOperand::IMM, dynamic_cast<ConstantSymbolEntry *>(se)->getValue());
    else if (se->isTemporary())
        mope = new MachineOperand(MachineOperand::VREG, dynamic_cast<TemporarySymbolEntry *>(se)->getLabel());
    else if (se->isVariable())
    {
        auto id_se = dynamic_cast<IdentifierSymbolEntry *>(se);
        if (id_se->isGlobal())
            mope = new MachineOperand(id_se->getName().c_str());
        else
            exit(0);
    }
    return mope;
}

MachineOperand *Instruction::genMachineReg(int reg)
{
    return new MachineOperand(MachineOperand::REG, reg);
}

MachineOperand *Instruction::genMachineVReg()
{
    return new MachineOperand(MachineOperand::VREG, SymbolTable::getLabel());
}

MachineOperand *Instruction::genMachineImm(int val)
{
    return new MachineOperand(MachineOperand::IMM, val);
}

MachineOperand *Instruction::genMachineLabel(int block_no)
{
    std::ostringstream buf;
    buf << ".L" << block_no;
    std::string label = buf.str();
    return new MachineOperand(label);
}

void AllocaInstruction::genMachineCode(AsmBuilder *builder)
{
    fprintf(stderr, "AllocaInstruction::genMachineCode\n");
    auto cur_func = builder->getFunction();
    int size = se->getType()->getSize() / 8;
    fprintf(stderr, "1234567891012345678%s: %d: %d\n", se->toStr().c_str(), size, se->getType()->getSize());
    if (size < 0)
        size = 4;
    int offset = cur_func->AllocSpace(size);
    fprintf(stderr, "1234567891012345678%s: %d: %doffset\n", se->toStr().c_str(), size, offset);
    dynamic_cast<TemporarySymbolEntry *>(operands[0]->getEntry())->setOffset(-offset);
    fprintf(stderr, "AllocaInstruction::genMachineCode-out\n");
}

void LoadInstruction::genMachineCode(AsmBuilder *builder)
{

    fprintf(stderr, "LoadInstruction::genMachineCode\n");
    auto cur_block = builder->getBlock();
    MachineInstruction *cur_inst = nullptr;
    if (operands[1]->getEntry()->isVariable() && dynamic_cast<IdentifierSymbolEntry *>(operands[1]->getEntry())->isGlobal())
    {
        fprintf(stderr, "SSSSSSSSSSSSSSSSSSSSSSSSSSSoperands[1]->getEntry()->isVariable() && dynamic_cast<IdentifierSymbolEntry *>(operands[1]->getEntry())->isGlobal()\n");
        fprintf(stderr, "LoadInstruction::genMachineCode,isGlobal\n");
        auto dst = genMachineOperand(operands[0]);
        auto internal_reg1 = genMachineVReg();
        auto internal_reg2 = new MachineOperand(*internal_reg1);
        auto src = genMachineOperand(operands[1]);
        // example: load r0, addr_a
        cur_inst = new LoadMInstruction(cur_block, internal_reg1, src);
        cur_block->InsertInst(cur_inst);
        // example: load r1, [r0]
        cur_inst = new LoadMInstruction(cur_block, dst, internal_reg2);
        cur_block->InsertInst(cur_inst);
    }
    // Load local operand
    else if (operands[1]->getEntry()->isTemporary() && operands[1]->getDef() && operands[1]->getDef()->isAlloc())
    {

        fprintf(stderr, "LoadInstruction::genMachineCode,isTemporary\n");
        // example: load r1, [r0, #4]
        auto dst = genMachineOperand(operands[0]);
        auto src1 = genMachineReg(11);
        int off = dynamic_cast<TemporarySymbolEntry *>(operands[1]->getEntry())->getOffset();
        auto src2 = genMachineImm(dynamic_cast<TemporarySymbolEntry *>(operands[1]->getEntry())->getOffset());
        fprintf(stderr, "%d", off);
        if (off > 255 || off < -255)
        {
            fprintf(stderr, "%d", off);
            auto operand = genMachineVReg();
            if (Judge(off))
                cur_block->InsertInst((new LoadMInstruction(cur_block, operand, src2)));
            else
            {
                cur_block->InsertInst(new MovMInstruction(cur_block, MovMInstruction::MOV, operand, genMachineImm(off & 0xffff)));
                if (off & 0xffff00)
                    cur_block->InsertInst(new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, operand, operand, genMachineImm(off & 0xff0000)));
                if (off & 0xff000000)
                    cur_block->InsertInst(new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, operand, operand, genMachineImm(off & 0xff000000)));
            }
            src2 = operand;
        }
        cur_inst = new LoadMInstruction(cur_block, dst, src1, src2);
        cur_block->InsertInst(cur_inst);
    }
    else
    {

        fprintf(stderr, "LoadInstruction::genMachineCode-else\n");
        // example: load r1, [r0]
        auto dst = genMachineOperand(operands[0]);
        auto src = genMachineOperand(operands[1]);
        cur_inst = new LoadMInstruction(cur_block, dst, src);
        cur_block->InsertInst(cur_inst);
    }
    fprintf(stderr, "LoadInstruction::genMachineCode-out\n");
}

// 写
void StoreInstruction::genMachineCode(AsmBuilder *builder)
{
    // TODO
    auto cur_block = builder->getBlock();
    MachineInstruction *cur_inst = nullptr;
    // Store to a global var
    if (operands[0]->getEntry()->isVariable() && dynamic_cast<IdentifierSymbolEntry *>(operands[0]->getEntry())->isGlobal())
    {
        auto dst = genMachineOperand(operands[0]);
        auto src = genMachineOperand(operands[1]);
        // 把imm→reg(new load)
        if (src->isImm())
        {
            auto internal_reg = genMachineVReg();
            cur_inst = new LoadMInstruction(cur_block, internal_reg, src);
            cur_block->InsertInst(cur_inst);
            src = new MachineOperand(*internal_reg);
        }
        auto internal_reg1 = genMachineVReg();
        auto internal_reg2 = new MachineOperand(*internal_reg1);
        // example: load r0, addr_a 加载全局变量地址
        cur_inst = new LoadMInstruction(cur_block, internal_reg1, dst);
        cur_block->InsertInst(cur_inst);
        // example: store r1, [r0] 存值入全局变量
        cur_inst = new StoreMInstruction(cur_block, src, internal_reg2);
        cur_block->InsertInst(cur_inst);
    }
    // store to a param
    else if (paramno != -1)
    {
        auto dst1 = genMachineReg(11);
        int off = dynamic_cast<TemporarySymbolEntry *>(operands[0]->getEntry())->getOffset();
        auto dst2 = genMachineImm(off);
        if (off > 255 || off < -255)
        {
            auto operand = genMachineVReg();
            if (Judge(off))
                cur_block->InsertInst((new LoadMInstruction(cur_block, operand, dst2)));
            else
            {
                cur_block->InsertInst(new MovMInstruction(cur_block, MovMInstruction::MOV, operand, genMachineImm(off & 0xffff)));
                if (off & 0xffff00)
                    cur_block->InsertInst(new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, operand, operand, genMachineImm(off & 0xff0000)));
                if (off & 0xff000000)
                    cur_block->InsertInst(new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, operand, operand, genMachineImm(off & 0xff000000)));
            }
            // cur_block->InsertInst((new LoadMInstruction(cur_block, operand, dst2)));
            dst2 = operand;
        }
        // auto dst2 = genMachineImm(dynamic_cast<TemporarySymbolEntry *>(operands[0]->getEntry())->getOffset());
        if (paramno > 3) // is in stack
        {
            // int off = dynamic_cast<TemporarySymbolEntry *>(operands[1]->getEntry())->getOffset();
            // auto src2 = genMachineImm(off);

            auto reg1 = genMachineVReg();
            // cur_inst = new LoadMInstruction(cur_block, reg1, genMachineReg(11), src2);
            cur_inst = new LoadMInstruction(cur_block, reg1, genMachineReg(11), genMachineImm((paramno - 4) * 4), true);
            cur_block->InsertInst(cur_inst);
            cur_inst = new StoreMInstruction(cur_block, new MachineOperand(*reg1), dst1, dst2);
            cur_block->InsertInst(cur_inst);
        }
        else // is in regs
        {
            auto src = genMachineReg(paramno);
            cur_inst = new StoreMInstruction(cur_block, src, dst1, dst2);
            cur_block->InsertInst(cur_inst);
        }
    }
    // store to a local operand 存储一个栈中的临时变量
    else if (operands[0]->getEntry()->isTemporary() && operands[0]->getDef() && operands[0]->getDef()->isAlloc())
    {
        // example: store r1, [r0, #4]
        auto src = genMachineOperand(operands[1]);

        if (src->isImm())
        {
            int off = src->getVal();
            auto operand = genMachineVReg();
            if (Judge(off))
                cur_block->InsertInst((new LoadMInstruction(cur_block, operand, src)));
            else
            {
                cur_block->InsertInst(new MovMInstruction(cur_block, MovMInstruction::MOV, operand, genMachineImm(off & 0xffff)));
                if (off & 0xffff00)
                    cur_block->InsertInst(new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, operand, operand, genMachineImm(off & 0xff0000)));
                if (off & 0xff000000)
                    cur_block->InsertInst(new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, operand, operand, genMachineImm(off & 0xff000000)));
            }
            src = new MachineOperand(*operand);
        }

        auto dst1 = genMachineReg(11);
        auto dst2 = genMachineImm(dynamic_cast<TemporarySymbolEntry *>(operands[0]->getEntry())->getOffset());
        cur_inst = new StoreMInstruction(cur_block, src, dst1, dst2);
        cur_block->InsertInst(cur_inst);
    }
    // store to temporary variable 存储一个数组元素，数组元素的地址存放在一个临时变量中，只需生成一条存储指令即可
    else
    {
        // example: store r1, [r0]
        auto src = genMachineOperand(operands[1]);
        if (src->isImm())
        {
            int off = src->getVal();
            auto operand = genMachineVReg();
            if (Judge(off))
                cur_block->InsertInst((new LoadMInstruction(cur_block, operand, src)));
            else
            {
                cur_block->InsertInst(new MovMInstruction(cur_block, MovMInstruction::MOV, operand, genMachineImm(off & 0xffff)));
                if (off & 0xffff00)
                    cur_block->InsertInst(new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, operand, operand, genMachineImm(off & 0xff0000)));
                if (off & 0xff000000)
                    cur_block->InsertInst(new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, operand, operand, genMachineImm(off & 0xff000000)));
            }
            src = new MachineOperand(*operand);
        }
        auto dst = genMachineOperand(operands[0]);
        cur_inst = new StoreMInstruction(cur_block, src, dst);
        cur_block->InsertInst(cur_inst);
    }
}

// 写
// 这边可能需要考虑第二个源操作数为imm时的范围限制，还未处理
void BinaryInstruction::genMachineCode(AsmBuilder *builder)
{
    // TODO:
    // complete other instructions
    auto cur_block = builder->getBlock();
    auto dst = genMachineOperand(operands[0]);
    auto src1 = genMachineOperand(operands[1]);
    auto src2 = genMachineOperand(operands[2]);
    /* HINT:
     * The source operands of ADD instruction in ir code both can be immediate num.
     * However, it's not allowed in assembly code.
     * So you need to insert LOAD/MOV instrucrion to load immediate num into register.
     * As to other instructions, such as MUL, CMP, you need to deal with this situation, too.*/
    MachineInstruction *cur_inst = nullptr;
    if (src1->isImm())
    {
        auto internal_reg = genMachineVReg();

        cur_inst = new LoadMInstruction(cur_block, internal_reg, src1);
        cur_block->InsertInst(cur_inst);
        src1 = new MachineOperand(*internal_reg);
    }
    switch (opcode)
    {
    case ADD:
    {
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, dst, src1, src2);
        break;
    }
    case SUB:
    {
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::SUB, dst, src1, src2);
        break;
    }
    case MUL:
        if (src2->isImm())
        {
            auto internal_reg = genMachineVReg();
            cur_inst = new LoadMInstruction(cur_block, internal_reg, src2);
            cur_block->InsertInst(cur_inst);
            src2 = new MachineOperand(*internal_reg);
        }
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::MUL, dst, src1, src2);
        break;
    case DIV:
        if (src2->isImm())
        {
            auto internal_reg = genMachineVReg();
            cur_inst = new LoadMInstruction(cur_block, internal_reg, src2);
            cur_block->InsertInst(cur_inst);
            src2 = new MachineOperand(*internal_reg);
        }
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::DIV, dst, src1, src2);
        break;
    case AND:
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::AND, dst, src1, src2);
        break;
    case OR:
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::OR, dst, src1, src2);
        break;
    case MOD:
    {
        // 运算转化：a%b <==> a-(a/b)*b
        if (src2->isImm())
        {
            fprintf(stderr, "%d", src2->getVal());
            auto internal_reg = genMachineVReg();
            cur_inst = new LoadMInstruction(cur_block, internal_reg, src2);
            cur_block->InsertInst(cur_inst);
            src2 = new MachineOperand(*internal_reg);
        }
        // DIV
        auto dst_div = genMachineVReg();
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::DIV, dst_div, src1, src2);
        cur_block->InsertInst(cur_inst);
        // MUL
        auto dst_mul = genMachineVReg();
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::MUL, dst_mul, dst_div, src2);
        cur_block->InsertInst(cur_inst);
        // SUB
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::SUB, dst, src1, dst_mul);
        break;
    }
    default:
        break;
    }
    cur_block->InsertInst(cur_inst);
}

/*
cmp r1,r0
beq .L1(true)
b .L2
*/
// 写
// 实现比较+true分支条件跳转
void CmpInstruction::genMachineCode(AsmBuilder *builder)
{
    // TODO
    auto cur_block = builder->getBlock();
    // auto dst = genMachineOperand(operands[0]);
    auto src1 = genMachineOperand(operands[1]);
    auto src2 = genMachineOperand(operands[2]);
    MachineInstruction *cur_inst = nullptr;
    // cmp R,R  or  cmp R,#imm
    if (src1->isImm())
    {
        auto internal_reg = genMachineVReg();
        cur_inst = new LoadMInstruction(cur_block, internal_reg, src1);
        cur_block->InsertInst(cur_inst);
        src1 = new MachineOperand(*internal_reg);
    }
    if (src2->isImm())
    {
        auto internal_reg = genMachineVReg();
        cur_inst = new LoadMInstruction(cur_block, internal_reg, src2);
        cur_block->InsertInst(cur_inst);
        src2 = new MachineOperand(*internal_reg);
    }
    cur_inst = new CmpMInstruction(cur_block, src1, src2);
    cur_block->InsertInst(cur_inst);

    CondBrInstruction *nextinst = dynamic_cast<CondBrInstruction *>(getLink());
    if (nextinst != 0)
    {
        switch (this->opcode)
        {
        case E:
            nextinst->setop(CondBrInstruction::E);
            break;
        case NE:
            nextinst->setop(CondBrInstruction::NE);
            break;
        case LE:
            nextinst->setop(CondBrInstruction::LE);
            break;
        case GE:
            nextinst->setop(CondBrInstruction::GE);
            break;
        case L:
            nextinst->setop(CondBrInstruction::L);
            break;
        case G:
            nextinst->setop(CondBrInstruction::G);
            break;
        default:
            break;
        }
        std::string label;
        label = ".L";
        std::stringstream s;
        auto bb = nextinst->getTrueBranch();
        s << bb->getNo();
        std::string temp;
        s >> temp;
        label += temp;
        // dst为真分支对应的基本块编号
        auto dst = new MachineOperand(label);
        int op;
        switch (opcode)
        {
        case E:
            op = BranchMInstruction::EQ;
            break;
        case NE:
            op = BranchMInstruction::NE;
            break;
        case LE:
            op = BranchMInstruction::LE;
            break;
        case GE:
            op = BranchMInstruction::GE;
            break;
        case L:
            op = BranchMInstruction::LT;
            break;
        case G:
            op = BranchMInstruction::GT;
            break;
        default:
            break;
        }
        cur_inst = new BranchMInstruction(cur_block, op, dst);
        cur_block->InsertInst(cur_inst);
    }
    // nextinst is not br  ==> need to save the result of cmp
    else
    {
        int op;
        switch (opcode)
        {
        case E:
            op = MachineInstruction::EQ;
            break;
        case NE:
            op = MachineInstruction::NE;
            break;
        case LE:
            op = MachineInstruction::LE;
            break;
        case GE:
            op = MachineInstruction::GE;
            break;
        case L:
            op = MachineInstruction::LT;
            break;
        case G:
            op = MachineInstruction::GT;
            break;
        default:
            break;
        }

        auto dst = genMachineOperand(operands[0]);
        // 生成mov指令存储cmp结果
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, new MachineOperand(MachineOperand::IMM, 1), op);
        cur_block->InsertInst(cur_inst);
        switch (op)
        {
        case MachineInstruction::EQ:
            op = MachineInstruction::NE;
            break;
        case MachineInstruction::NE:
            op = MachineInstruction::EQ;
            break;
        case MachineInstruction::GE:
            op = MachineInstruction::LT;
            break;
        case MachineInstruction::LE:
            op = MachineInstruction::GT;
            break;
        case MachineInstruction::GT:
            op = MachineInstruction::LE;
            break;
        case MachineInstruction::LT:
            op = MachineInstruction::GE;
            break;
        default:
            break;
        }
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, new MachineOperand(MachineOperand::IMM, 0), op);
        cur_block->InsertInst(cur_inst);
    }
}

// 控制流指令
// 只需要生成一条无条件跳转指令即可，至于跳转目的操作数的生成
// 只需要调用 genMachineLabel() 函数即可，参数为目的基本块号；
// 写
void UncondBrInstruction::genMachineCode(AsmBuilder *builder)
{
    // TODO
    auto cur_bb = builder->getBlock();
    std::string label;
    label = ".L";
    std::stringstream s;
    s << branch->getNo();
    std::string temp;
    s >> temp;
    label += temp;
    auto dst = new MachineOperand(label);
    cur_bb->InsertInst(new BranchMInstruction(cur_bb, BranchMInstruction::B, dst));
}

// 对于 CondBrInstruction，在中间代码中该指令一定位于 CmpInstruction 之后
// 对 CondBrInstruction，首先需要在 AsmBuilder 中添加成员以记录前一条 CmpInstruction 的条件码
// 从而在遇到 CondBrInstruction 时生成对应的条件跳转指令跳转到 True Branch
// 之后需要生成一条无条件跳转指令跳转到 False Branch。
void CondBrInstruction::genMachineCode(AsmBuilder *builder)
{
    // TODO
    auto cur_bb = builder->getBlock();
    std::string label;
    label = ".L";
    std::stringstream s;
    s << false_branch->getNo();
    std::string temp;
    s >> temp;
    label += temp;
    auto dst = new MachineOperand(label);
    cur_bb->InsertInst(new BranchMInstruction(cur_bb, BranchMInstruction::B, dst));
}

// 对于含参函数，需要使用 R0-R3 寄存器传递参数，如果参数个数大于四个还需要生成 PUSH 指令来传递参数；
// 之后生成跳转指令来进入 Callee 函数；在此之后，需要进行现场恢复的工作
// 如果之前通过压栈的方式传递了参数，需要恢复 SP 寄存器；
// 如果函数执行结果被用到，还需要保存 R0 寄存器中的返回值。
// 写
void CallInstruction::genMachineCode(AsmBuilder *builder)
{
    auto cur_block = builder->getBlock();
    MachineInstruction *cur_inst = 0;

    // pass params
    for (unsigned int i = 1; i < operands.size(); i++)
    {
        // 参数值传递按顺序存放在寄存器r0,r1,r2,r3里，超过4个参数值传递则放栈里
        // r0用于存放返回值
        if (i > 4)
        {
            auto reg1 = genMachineVReg();
            cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, reg1, genMachineOperand(operands[i]));
            cur_block->InsertInst(cur_inst);
            cur_inst = new StoreMInstruction(cur_block, reg1, genMachineReg(13), genMachineImm(-(operands.size() - i) * 4));
            cur_block->InsertInst(cur_inst);
            builder->getFunction()->AllocSpace(4);

            continue;
        }
        else
        {
            // auto reg1 = genMachineVReg();
            cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, genMachineReg(i - 1), genMachineOperand(operands[i]));
            cur_block->InsertInst(cur_inst);
        }
    }
    if (operands.size() > 5)
    {
        cur_inst = new BinaryMInstruction(nullptr, BinaryMInstruction::SUB, genMachineReg(13), genMachineReg(13), genMachineImm((operands.size() - 5) * 4));
        cur_block->InsertInst(cur_inst);
    }
    // example:  bl func
    std::string label = dynamic_cast<IdentifierSymbolEntry *>(this->getEntry())->getName();
    auto dst = new MachineOperand(label, 1);
    cur_inst = new BranchMInstruction(cur_block, BranchMInstruction::BL, dst);
    cur_block->InsertInst(cur_inst);

    if (operands.size() > 5)
    {
        auto off = genMachineImm((operands.size() - 5) * 4);
        auto sp = new MachineOperand(MachineOperand::REG, 13);
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD,
                                          sp, sp, off);
        cur_block->InsertInst(cur_inst);
    }

    // save the return value
    if (dynamic_cast<FunctionType *>(this->getEntry()->getType())->getRetType()->toStr() != "void")
    {
        auto ret = genMachineOperand(operands[0]);
        // r0存储函数返回值
        auto r0 = genMachineReg(0);
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, ret, r0);
        cur_block->InsertInst(cur_inst);
    }
}

// 当函数有返回值时，我们需要生成MOV 指令，将返回值保存在 R0 寄存器中；
// 我们需要生成 ADD 指令来恢复栈帧，（如果该函数有 Callee saved 寄存器，我们还需要生成 POP 指令恢复这些寄存器）
// 生成 POP 指令恢复 FP 寄存器；
// 最后再生成跳转指令来返回到 Caller。
void RetInstruction::genMachineCode(AsmBuilder *builder)
{
    // TODO
    /* HINT:
     * 1. Generate mov instruction to save return value in r0
     * 2. Restore callee saved registers and sp, fp
     * 3. Generate bx instruction */
    auto bb = builder->getBlock();
    if (!operands.empty())
    {
        auto dst = genMachineReg(0);
        auto src = genMachineOperand(operands[0]);
        // 1. Generate mov instruction to save return value in r0
        bb->InsertInst(new MovMInstruction(bb, MovMInstruction::MOV, dst, src));
    }

    // 2. Restore callee saved registers and sp, fp
    bb->InsertInst(new BinaryMInstruction(bb, BinaryMInstruction::SUB, genMachineReg(13), genMachineReg(11), genMachineImm(0)));
    // 3.Generate bx instruction
    bb->InsertInst(new BranchMInstruction(bb, BranchMInstruction::BX, genMachineReg(14)));
}

// Bool2IntInstruction
void Bool2IntInstruction::genMachineCode(AsmBuilder *builder)
{
    MachineInstruction *cur_inst;
    MachineBlock *cur_block = builder->getBlock();
    auto src = genMachineOperand(operands[1]);
    auto dst = genMachineOperand(operands[0]);
    cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, src);
    cur_block->InsertInst(cur_inst);
}

// 简单异或(与true)-单目运算，我们保证操作数是bool类型的
void NotInstruction::genMachineCode(AsmBuilder *builder)
{
    auto cur_block = builder->getBlock();
    auto dst = genMachineOperand(operands[0]);
    auto trueOperand = genMachineImm(1);
    auto falseOperand = genMachineImm(0);
    // 条件码EQ：表示前面运算的结果为0，则dst置为true
    auto cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, trueOperand, MachineInstruction::EQ);
    cur_block->InsertInst(cur_inst);
    // 条件码NE：表示前面运算的结果为1，则dst置为false
    cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, falseOperand, MachineInstruction::NE);
    cur_block->InsertInst(cur_inst);
}

void GlobalInstruction::genMachineCode(AsmBuilder *builder)
{
    // TODO
    auto cur_block = builder->getBlock();
    auto cur_unit = builder->getUnit();
    MachineInstruction *cur_inst = 0;
    auto dst = genMachineOperand(operands[0]);
    std::vector<MachineOperand *> src;
    for (unsigned int i = 1; i < operands.size(); i++)
    {
        src.push_back(genMachineOperand(operands[i]));
    }
    cur_inst = new GlobalMInstruction(cur_block, dst, src, se);
    // 交付给unit去实现
    cur_unit->insertGlobal(dynamic_cast<GlobalMInstruction *>(cur_inst));
}

ArInstruction::ArInstruction(Operand *dst,
                             Operand *arr,
                             Operand *idx,
                             BasicBlock *insert_bb,
                             bool paramFirst)
    : Instruction(GEP, insert_bb), paramFirst(paramFirst)
{
    operands.push_back(dst);
    operands.push_back(arr);
    operands.push_back(idx);
    dst->setDef(this);
    arr->addUse(this);
    idx->addUse(this);
    first = false;
    init = nullptr;
    last = false;
}

void ArInstruction::output() const
{
}

ArInstruction::~ArInstruction()
{
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
    operands[2]->removeUse(this);
}

// 第一维；最后一维；中间若干维；参数
void ArInstruction::genMachineCode(AsmBuilder *builder)
{
    auto cur_block = builder->getBlock();
    MachineInstruction *cur_inst;
    auto dst = genMachineOperand(operands[0]); // 目的操作数
    auto idx = genMachineOperand(operands[2]); // 维度（索引）
    // 是否有init（声明）
    // 比如a[3][2],init就表示a[0]这么一个地址[最后一维才对init进行赋值]
    if (init)
    {
        // 最后一个维度a[2][3]，数组等价于数组的数组，不断拆解下去肯定有一个维度是int类型
        // 如果是最后一个维度的话，我们已经有了初地址，那么不断+4+4就可以寻址了
        if (last)
        {
            // 插入一个新的 BinaryMInstruction 指令，
            // 该指令将 dst 操作数加上 genMachineOperand(init) 操作数再加上 genMachineImm(4) 操作数。并且返回 。
            auto base = genMachineOperand(init);
            cur_inst = new BinaryMInstruction(
                cur_block, BinaryMInstruction::ADD, dst, base, genMachineImm(4));
            cur_block->InsertInst(cur_inst);
        }
        return;
    }
    MachineOperand *base = nullptr;
    int size;
    // idx->索引
    // 若idx为常数，那么加载它的值，将其封装为MachineOperand*类型（操作数）
    auto idx1 = genMachineVReg();
    if (idx->isImm())
    {
        if (idx->getVal() < 255)
        {
            cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, idx1, idx);
            cur_block->InsertInst(cur_inst);
        }
        else
        {
            int off = idx->getVal();
            cur_block->InsertInst(new MovMInstruction(cur_block, MovMInstruction::MOV, idx1, genMachineImm(off & 0xffff)));
            if (off & 0xffff00)
                cur_block->InsertInst(new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, idx1, idx1, genMachineImm(off & 0xff0000)));
            if (off & 0xff000000)
                cur_block->InsertInst(new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, idx1, idx1, genMachineImm(off & 0xff000000)));
            // if (off & 0xffffff00)
            //     cur_block->InsertInst(new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, idx1, idx1, genMachineImm(off & 0xffffff00)));
        }
        idx = new MachineOperand(*idx1);
    }
    if (paramFirst) // 该数组是否为参数[]
    {
        // 按字节算
        size = ((PointerType *)(operands[1]->getType()))->getType()->getSize() / 8;
    }
    else // 不是参数 -> 变量
    {
        // 计算base（数组首地址）
        if (first) // 如果是数组的第一维的话
        {
            base = genMachineVReg();
            if (operands[1]->getEntry()->isVariable() &&
                ((IdentifierSymbolEntry *)(operands[1]->getEntry()))->isGlobal()) // 全局变量
            {
                auto src = genMachineOperand(operands[1]);
                // 直接加载进来
                // base:全局变量首地址
                cur_inst = new LoadMInstruction(cur_block, base, src);
                cur_block->InsertInst(cur_inst);
            }
            else // 局部变量：获取栈中偏移（getOffset()）
            {
                int offset = ((TemporarySymbolEntry *)(operands[1]->getEntry()))->getOffset();
                if (offset > -255 && offset < 255)
                {
                    cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, base, genMachineImm(offset));
                    cur_block->InsertInst(cur_inst);
                }
                else
                {
                    // 先用mov把它的低16位放到寄存器里，然后用add把它高16位的两个字节加到寄存器里
                    cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, base, genMachineImm(offset & 0xffff));
                    cur_block->InsertInst(cur_inst);
                    if (offset & 0xffff00)
                    {
                        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, base, base, genMachineImm(offset & 0xff0000));
                        cur_block->InsertInst(cur_inst);
                    }
                    if (offset & 0xff000000)
                    {
                        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, base, base, genMachineImm(offset & 0xff000000));
                        cur_block->InsertInst(cur_inst);
                    }
                }
            }
        }
        ArrayType *type = (ArrayType *)(((PointerType *)(operands[1]->getType()))->getType());
        size = type->getEType()->getSize() / 8;
    }

    // size保存当前维度大小
    // 使用常量size的值创建一个寄存器操作数size1，
    auto size1 = genMachineVReg();
    if (size > -255 && size < 255)
    {
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, size1, genMachineImm(size));
        cur_block->InsertInst(cur_inst);
    }
    else
    {
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, size1, genMachineImm(size & 0xffff));
        cur_block->InsertInst(cur_inst);
        if (size & 0xffff00)
        {
            cur_block->InsertInst(new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, size1, size1, genMachineImm(size & 0xff0000)));
            cur_block->InsertInst(cur_inst);
        }

        if (size & 0xff000000)
        {
            cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, size1, size1, genMachineImm(size & 0xff000000));
            cur_block->InsertInst(cur_inst);
        }
    }

    // a[3][4]，如果访问a[2][3]->*(a+(2*4)+3)
    // 索引到数组该维度首地址偏移
    auto off = genMachineVReg();
    cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::MUL, off, idx, size1);
    off = new MachineOperand(*off);
    cur_block->InsertInst(cur_inst);

    // 如果是参数或不是第一维
    if (paramFirst || !first)
    {
        // arr等价于operands[1]等价于变量的地址
        auto arr = genMachineOperand(operands[1]);
        // arr:当前维度首地址  off：索引对于当前维度首地址偏移 -> 索引的地址
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, dst, arr, off);
        cur_block->InsertInst(cur_inst);
    }
    // 第一维并且不是参数/全局变量
    else
    {
        auto addr = genMachineVReg();
        auto base1 = new MachineOperand(*base);
        // base1保存数组首地址，off为索引对于首地址偏移 -> 索引的偏移
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, addr, base1, off);
        cur_block->InsertInst(cur_inst);
        addr = new MachineOperand(*addr);
        if (operands[1]->getEntry()->isVariable() &&
            ((IdentifierSymbolEntry *)(operands[1]->getEntry()))->isGlobal())
        {
            cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, addr);
        }
        else
        {
            // 如果不是，则在当前块中插入一个新的 BinaryMInstruction 指令，
            // addr:索引在栈中偏移   fp：栈底指针  -> dst:索引的地址
            auto fp = genMachineReg(11);
            cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, dst, fp, addr);
        }
        cur_block->InsertInst(cur_inst);
    }
}
