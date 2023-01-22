#include "MachineCode.h"
#include "Type.h"
extern FILE *yyout;

MachineOperand::MachineOperand(int tp, int val)
{
    this->type = tp;
    if (tp == MachineOperand::IMM)
        this->val = val;
    else
        this->reg_no = val;
}

MachineOperand::MachineOperand(std::string label)
{
    this->type = MachineOperand::LABEL;
    this->label = label;
}

MachineOperand::MachineOperand(std::string label, bool isfunc)
{
    this->type = MachineOperand::LABEL;
    this->label = label;
    this->isfunc = isfunc;
}

bool MachineOperand::operator==(const MachineOperand &a) const
{
    if (this->type != a.type)
        return false;
    if (this->type == IMM)
        return this->val == a.val;
    return this->reg_no == a.reg_no;
}

bool MachineOperand::operator<(const MachineOperand &a) const
{
    if (this->type == a.type)
    {
        if (this->type == IMM)
            return this->val < a.val;
        return this->reg_no < a.reg_no;
    }
    return this->type < a.type;

    if (this->type != a.type)
        return false;
    if (this->type == IMM)
        return this->val == a.val;
    return this->reg_no == a.reg_no;
}

void MachineOperand::PrintReg()
{
    switch (reg_no)
    {
    // 栈底
    case 11:
        fprintf(yyout, "fp");
        break;
    // 栈顶
    case 13:
        fprintf(yyout, "sp");
        break;
    // 保存函数返回地址
    case 14:
        fprintf(yyout, "lr");
        break;
    case 15:
        fprintf(yyout, "pc");
        break;
    default:
        fprintf(yyout, "r%d", reg_no);
        break;
    }
}

void MachineOperand::output()
{
    /* HINT：print operand
     * Example:
     * immediate num 1 -> print #1;
     * register 1 -> print r1;
     * lable addr_a -> print addr_a; */
    switch (this->type)
    {
    case IMM:
        fprintf(yyout, "#%d", this->val);
        break;
    case VREG:
        fprintf(yyout, "v%d", this->reg_no);
        break;
    case REG:
        PrintReg();
        break;
    case LABEL:
        if (this->label.substr(0, 2) == ".L" || isfunc)
            fprintf(yyout, "%s", this->label.c_str());
        else
            fprintf(yyout, "addr_%s", this->label.c_str());
    default:
        break;
    }
}

void MachineInstruction::PrintCond()
{
    // TODO
    switch (cond)
    {
    case LT:
        fprintf(yyout, "lt ");
        break;
    case EQ:
        fprintf(yyout, "eq ");
        break;
    case NE:
        fprintf(yyout, "ne ");
        break;
    case LE:
        fprintf(yyout, "le ");
        break;
    case GT:
        fprintf(yyout, "gt ");
        break;
    case GE:
        fprintf(yyout, "ge ");
        break;
    default:
        fprintf(yyout, " ");
        break;
    }
}

// 还
void MachineInstruction::insertBefore(MachineInstruction *inst)
{
    auto &instructions = parent->getInsts();
    auto it = std::find(instructions.begin(), instructions.end(), this);
    instructions.insert(it, inst);
}

// 还
void MachineInstruction::insertAfter(MachineInstruction *inst)
{
    auto &instructions = parent->getInsts();
    auto it = std::find(instructions.begin(), instructions.end(), this);
    instructions.insert(++it, inst);
}

BinaryMInstruction::BinaryMInstruction(
    MachineBlock *p, int op,
    MachineOperand *dst, MachineOperand *src1, MachineOperand *src2,
    int cond)
{
    this->parent = p;
    this->type = MachineInstruction::BINARY;
    this->op = op;
    this->cond = cond;
    this->def_list.push_back(dst);
    this->use_list.push_back(src1);
    this->use_list.push_back(src2);
    dst->setParent(this);
    src1->setParent(this);
    src2->setParent(this);
}

void BinaryMInstruction::output()
{
    fprintf(stderr, "BinaryMInstruction::output\n");
    // TODO:
    // Complete other instructions
    switch (this->op)
    {
    case BinaryMInstruction::ADD:
        fprintf(yyout, "\tadd ");
        this->PrintCond();
        this->def_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[1]->output();
        fprintf(yyout, "\n");
        break;
    case BinaryMInstruction::SUB:
        fprintf(yyout, "\tsub ");
        this->PrintCond();
        this->def_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[1]->output();
        fprintf(yyout, "\n");
        break;
    case BinaryMInstruction::MUL:
        fprintf(yyout, "\tmul ");
        this->PrintCond();
        this->def_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[1]->output();
        fprintf(yyout, "\n");
        break;
    case BinaryMInstruction::DIV:
        fprintf(yyout, "\tsdiv ");
        this->PrintCond();
        this->def_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[1]->output();
        fprintf(yyout, "\n");
        break;
    case BinaryMInstruction::AND:
        fprintf(yyout, "\tand ");
        this->PrintCond();
        this->def_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[1]->output();
        fprintf(yyout, "\n");
        break;
    case BinaryMInstruction::OR:
        fprintf(yyout, "\torr ");
        this->PrintCond();
        this->def_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[1]->output();
        fprintf(yyout, "\n");
        break;
    default:
        break;
    }
}

LoadMInstruction::LoadMInstruction(MachineBlock *p,
                                   MachineOperand *dst, MachineOperand *src1, MachineOperand *src2,
                                   bool instack, int cond)
{
    this->instack = instack;
    this->parent = p;
    this->type = MachineInstruction::LOAD;
    this->op = -1;
    this->cond = cond;
    this->def_list.push_back(dst);
    this->use_list.push_back(src1);
    if (src2)
        this->use_list.push_back(src2);
    dst->setParent(this);
    src1->setParent(this);
    if (src2)
        src2->setParent(this);
}

void LoadMInstruction::output()
{
    fprintf(stderr, "LoadMInstruction::output\n");
    fprintf(yyout, "\tldr ");
    this->def_list[0]->output();
    fprintf(yyout, ", ");

    // Load immediate num, eg: ldr r1, =8
    if (this->use_list[0]->isImm())
    {
        fprintf(yyout, "=%d\n", this->use_list[0]->getVal());
        return;
    }

    // Load address
    if (this->use_list[0]->isReg() || this->use_list[0]->isVReg())
        fprintf(yyout, "[");

    this->use_list[0]->output();
    if (this->use_list.size() > 1)
    {
        fprintf(yyout, ", ");
        if (!instack)
        {
            this->use_list[1]->output();
        }
        else
        {
            // 输出寄存器偏移
            unsigned int off = 4 * (parent->getParent()->getSavedRegs().size() + 2);
            this->use_list[1]->addVal(off);
            this->use_list[1]->output();
        }
    }
    if (this->use_list[0]->isReg() || this->use_list[0]->isVReg())
        fprintf(yyout, "]");
    fprintf(yyout, "\n");
}

StoreMInstruction::StoreMInstruction(MachineBlock *p,
                                     MachineOperand *src1, MachineOperand *src2, MachineOperand *src3,
                                     int cond)
{
    // TODO
    this->parent = p;
    this->type = MachineInstruction::STORE;
    this->op = -1;
    this->cond = cond;
    this->use_list.push_back(src1);
    this->use_list.push_back(src2);
    if (src3)
        this->use_list.push_back(src3);
    src1->setParent(this);
    src2->setParent(this);
    if (src3)
        src3->setParent(this);
}

void StoreMInstruction::output()
{
    fprintf(stderr, "StoreMInstruction::output\n");
    // TODO
    // eg1. str r0 [r1, #4]
    // eg2. str r0 [r1]
    fprintf(yyout, "\tstr ");
    this->use_list[0]->output();
    fprintf(yyout, ", ");

    if (this->use_list[1]->isReg() || this->use_list[1]->isVReg())
        fprintf(yyout, "[");
    this->use_list[1]->output();

    // if use_list[2] is existed
    if (this->use_list.size() > 2)
    {
        fprintf(yyout, ", ");
        this->use_list[2]->output();
    }

    if (this->use_list[1]->isReg() || this->use_list[1]->isVReg())
        fprintf(yyout, "]");

    fprintf(yyout, "\n");
}

MovMInstruction::MovMInstruction(MachineBlock *p, int op,
                                 MachineOperand *dst, MachineOperand *src,
                                 int cond)
{
    // TODO
    this->parent = p;
    this->op = op;
    this->type = MachineInstruction::MOV;
    this->cond = cond;
    this->def_list.push_back(dst);
    this->use_list.push_back(src);
    dst->setParent(this);
    src->setParent(this);
}

void MovMInstruction::output()
{
    fprintf(stderr, "MovMInstruction::output\n");
    // TODO
    switch (this->op)
    {
    case MovMInstruction::MOV:
        fprintf(yyout, "\tmov");
        break;
    case MovMInstruction::MVN:
        fprintf(yyout, "\tmvn");
        break;
    }
    this->PrintCond();
    this->def_list[0]->output();
    fprintf(yyout, ", ");
    this->use_list[0]->output();
    fprintf(yyout, "\n");
}

BranchMInstruction::BranchMInstruction(MachineBlock *p, int op,
                                       MachineOperand *dst,
                                       int cond)
{
    // TODO
    this->parent = p;
    this->type = MachineInstruction::BRANCH;
    this->op = op;
    this->cond = cond;
    this->def_list.push_back(dst);
    dst->setParent(this);
}

void BranchMInstruction::output()
{
    fprintf(stderr, "BranchMInstruction::output\n");
    // TODO
    switch (this->op)
    {
    case BranchMInstruction::EQ:
        fprintf(yyout, "\tbeq ");
        break;
    case BranchMInstruction::NE:
        fprintf(yyout, "\tbne ");
        break;
    case BranchMInstruction::LT:
        fprintf(yyout, "\tblt ");
        break;
    case BranchMInstruction::LE:
        fprintf(yyout, "\tble ");
        break;
    case BranchMInstruction::GT:
        fprintf(yyout, "\tbgt ");
        break;
    case BranchMInstruction::GE:
        fprintf(yyout, "\tbge ");
        break;
    case BranchMInstruction::B:
        fprintf(yyout, "\tb ");
        break;
    case BranchMInstruction::BL:
        fprintf(yyout, "\tbl ");
        break;
    case BranchMInstruction::BX:
        fprintf(yyout, "\tbx ");
        break;
    default:
        break;
    }
    this->def_list[0]->output();
    fprintf(yyout, "\n");
}

CmpMInstruction::CmpMInstruction(MachineBlock *p,
                                 MachineOperand *src1, MachineOperand *src2,
                                 int cond)
{
    // TODO
    this->parent = p;
    this->cond = cond;
    this->type = MachineInstruction::CMP;
    this->cond = cond;
    this->use_list.push_back(src1);
    this->use_list.push_back(src2);
    src1->setParent(this);
    src2->setParent(this);
}

void CmpMInstruction::output()
{
    fprintf(stderr, "CmpMInstruction::output\n");
    // TODO
    // Jsut for reg alloca test
    // delete it after test
    fprintf(yyout, "\tcmp ");
    use_list[0]->output();
    fprintf(yyout, ", ");
    use_list[1]->output();
    fprintf(yyout, "\n");
}

StackMInstrcuton::StackMInstrcuton(MachineBlock *p, int op,
                                   MachineOperand *src,
                                   int cond)
{
    // TODO
    this->parent = p;
    this->op = op;
    this->type = MachineInstruction::STACK;
    this->cond = cond;
    this->use_list.push_back(src);
    src->setParent(this);
}

StackMInstrcuton::StackMInstrcuton(MachineBlock *p,
                                   int op,
                                   std::vector<MachineOperand *> srcs,
                                   MachineOperand *src,
                                   MachineOperand *src1,
                                   int cond)
{
    this->parent = p;
    this->type = MachineInstruction::STACK;
    this->op = op;
    this->cond = cond;
    if (srcs.size())
        for (auto it = srcs.begin(); it != srcs.end(); it++)
            this->use_list.push_back(*it);
    this->use_list.push_back(src);
    src->setParent(this);
    if (src1)
    {
        this->use_list.push_back(src1);
        src1->setParent(this);
    }
}

void StackMInstrcuton::output()
{
    fprintf(stderr, "StackMInstrcuton::output\n");
    switch (op)
    {
    case PUSH:
        fprintf(yyout, "\tpush ");
        break;
    case POP:
        fprintf(yyout, "\tpop ");
        break;
    }
    fprintf(yyout, "{");
    this->use_list[0]->output();
    for (long unsigned int i = 1; i < use_list.size(); i++)
    {
        fprintf(yyout, ", ");
        this->use_list[i]->output();
    }
    fprintf(yyout, "}\n");
}

GlobalMInstruction::GlobalMInstruction(MachineBlock *p, MachineOperand *dst, std::vector<MachineOperand *> src, SymbolEntry *se)
{
    this->se = se;
    this->parent = p;
    def_list.push_back(dst);
    for (unsigned int i = 0; i < src.size(); i++)
    {
        use_list.push_back(src[i]);
        src[i]->setParent(this);
    }

    dst->setParent(this);
}

void GlobalMInstruction::frontoutput()
{
    IdentifierSymbolEntry *se1 = (IdentifierSymbolEntry *)se;
    if (!se1->isAllZero())
    {
        fprintf(stderr, "进来了\n");
        fprintf(yyout, "\t.global %s\n", def_list[0]->getLabel().c_str());
        fprintf(yyout, "\t.align 4\n");
        // fprintf(yyout, "\t.size %s, 4\n", def_list[0]->getLabel().c_str());
        fprintf(yyout, "\t.size %s, %d\n", def_list[0]->getLabel().c_str(), (int)(4 * use_list.size()));
        fprintf(yyout, "%s:\n", def_list[0]->getLabel().c_str());
        for (unsigned int i = 0; i < use_list.size(); i++)
            fprintf(yyout, "\t.word %d\n", use_list[i]->getVal());
    }
    else
    {
        if (se->getType()->isArray())
        {
            fprintf(yyout, "\t.balign 4\n");
            fprintf(yyout, "\t%s: .skip %d\n", se->toStr().substr(1).c_str(), se->getType()->getSize() / 8);
        }
    }
}

void GlobalMInstruction::output()
{
    fprintf(stderr, "GlobalMInstruction::output\n");
    fprintf(yyout, "addr_%s:\n", def_list[0]->getLabel().c_str());
    fprintf(yyout, "\t.word %s\n", def_list[0]->getLabel().c_str());
}

MachineFunction::MachineFunction(MachineUnit *p, SymbolEntry *sym_ptr)
{
    this->parent = p;
    this->sym_ptr = sym_ptr;
    this->stack_size = 0;
};

void MachineBlock::output()
{
    fprintf(yyout, ".L%d:\n", this->no);
    fprintf(stderr, "MachineBlock::output, .L%d:\n", this->no);
    for (auto iter : inst_list)
    {
        if (iter->isBX())
        {
            auto fp = new MachineOperand(MachineOperand::REG, 11);
            auto lr = new MachineOperand(MachineOperand::REG, 14);
            auto cur_inst =
                new StackMInstrcuton(this, StackMInstrcuton::POP, parent->getSavedRegs(), fp, lr);
            cur_inst->output();
        }
        iter->output();
    }
}

void MachineFunction::output()
{
    fprintf(stderr, "MachineFunction:output ,%s\n", this->sym_ptr->toStr().c_str() + 1);
    fprintf(yyout, "\t.global %s\n", this->sym_ptr->toStr().c_str() + 1);
    fprintf(yyout, "\t.type %s , %%function\n", this->sym_ptr->toStr().c_str() + 1);
    fprintf(yyout, "%s:\n", this->sym_ptr->toStr().c_str() + 1);
    // TODO
    /* Hint:
     *  1. Save fp
     *  2. fp = sp
     *  3. Save callee saved register
     *  4. Allocate stack space for local variable */

    // Traverse all the block in block_list to print assembly code.
    auto fp = new MachineOperand(MachineOperand::REG, 11);
    auto sp = new MachineOperand(MachineOperand::REG, 13);
    auto lr = new MachineOperand(MachineOperand::REG, 14);
    (new StackMInstrcuton(nullptr, StackMInstrcuton::PUSH, getSavedRegs(), fp, lr))->output();

    (new MovMInstruction(nullptr, MovMInstruction::MOV, fp, sp))->output();
    int off = AllocSpace(0);
    // 局部变量大小
    auto size = new MachineOperand(MachineOperand::IMM, off);
    if (off < -255 || off > 255)
    {
        auto r4 = new MachineOperand(MachineOperand::REG, 4);
        //(new LoadMInstruction(nullptr, r4, size))->output();
        // 先用 MOV 把它的低 16 位放到寄存器里，然后
        (new MovMInstruction(nullptr, MovMInstruction::MOV, r4, new MachineOperand(MachineOperand::IMM, off & 0xffff)))->output();
        // 用 ADD 把它高 16 位的两个字节加到寄存器里
        if (off & 0xffff00)
            (new BinaryMInstruction(nullptr, BinaryMInstruction::ADD, r4, r4, new MachineOperand(MachineOperand::IMM, off & 0xff0000)))->output();
        if (off & 0xff000000)
            (new BinaryMInstruction(nullptr, BinaryMInstruction::ADD, r4, r4, new MachineOperand(MachineOperand::IMM, off & 0xff000000)))->output();
        // 为局部变量开辟空间
        (new BinaryMInstruction(nullptr, BinaryMInstruction::SUB, sp, sp, r4))->output();
    }
    else
    {
        (new BinaryMInstruction(nullptr, BinaryMInstruction::SUB, sp, sp, size))->output();
    }
    for (auto iter : block_list)
    {
        iter->output();
    }
    fprintf(yyout, "\n");
}

std::vector<MachineOperand *> MachineFunction::getSavedRegs()
{
    std::vector<MachineOperand *> regs;
    for (auto it = saved_regs.begin(); it != saved_regs.end(); it++)
    {
        auto reg = new MachineOperand(MachineOperand::REG, *it);
        regs.push_back(reg);
    }
    return regs;
}

void MachineUnit::PrintGlobalDecl()
{
    // TODO:
    // You need to print global variable/const declarition code;
    fprintf(stderr, "进入1\n");
    for (auto inst : global_list)
    {
        fprintf(stderr, "进入2\n");
        inst->frontoutput();
    }
}

void MachineUnit::printGlobalBridges()
{
    for (auto inst : global_list)
    {
        inst->output();
    }
}

void MachineUnit::output()
{
    fprintf(stderr, "MachineUnit:output \n");
    // TODO
    /* Hint:
     * 1. You need to print global variable/const declarition code;
     * 2. Traverse all the function in func_list to print assembly code;
     * 3. Don't forget print bridge label at the end of assembly code!! */
    fprintf(yyout, "\t.arch armv8-a\n");
    fprintf(yyout, "\t.arch_extension crc\n");
    fprintf(yyout, "\t.arm\n");
    fprintf(yyout, "\t.data\n");
    fprintf(stderr, "com to PrintGlobalDecl \n");
    PrintGlobalDecl();
    fprintf(stderr, "out from PrintGlobalDecl\n");
    fprintf(yyout, "\t.text\n");
    for (auto iter : func_list)
        iter->output();
    printGlobalBridges();
}
