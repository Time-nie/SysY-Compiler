#include "BasicBlock.h"
#include "Function.h"
#include <algorithm>

extern FILE *yyout;

// insert the instruction to the front of the basicblock.
void BasicBlock::insertFront(Instruction *inst)
{
    insertBefore(inst, head->getLink());
}

// insert the instruction to the back of the basicblock.
void BasicBlock::insertBack(Instruction *inst)
{
    insertBefore(inst, head);
}

// insert the instruction dst before src.
void BasicBlock::insertBefore(Instruction *dst, Instruction *src)
{
    // 让dst插到src前面
    src->getPrev()->setLink(dst);
    dst->setPrev(src->getPrev());

    dst->setLink(src);
    src->setPrev(dst);

    dst->setParent(this);
}

// remove the instruction from intruction list.
void BasicBlock::remove(Instruction *inst)
{
    inst->getPrev()->setLink(inst->getLink());
    inst->getLink()->setPrev(inst->getPrev());
}

void BasicBlock::output() const
{
    // 这边的no指的是？编号？
    fprintf(yyout, "B%d:", no);

    // 输出前继的若干个基本块的no
    if (!pred.empty())
    {
        fprintf(yyout, "%*c; preds = %%B%d", 32, '\t', pred[0]->getNo());
        for (auto i = pred.begin() + 1; i != pred.end(); i++)
            fprintf(yyout, ", %%B%d", (*i)->getNo());
    }
    fprintf(yyout, "\n");
    // head为这个基本块的第一条指令，调用每一条指令的output
    for (auto i = head->getLink(); i != head; i = i->getLink())
        i->output();
}

void BasicBlock::addSucc(BasicBlock *bb)
{
    succ.push_back(bb);
}

// remove the successor basicclock bb.
void BasicBlock::removeSucc(BasicBlock *bb)
{
    succ.erase(std::find(succ.begin(), succ.end(), bb));
}

void BasicBlock::addPred(BasicBlock *bb)
{
    pred.push_back(bb);
}

// remove the predecessor basicblock bb.
void BasicBlock::removePred(BasicBlock *bb)
{
    pred.erase(std::find(pred.begin(), pred.end(), bb));
}

void BasicBlock::genMachineCode(AsmBuilder *builder)
{
    fprintf(stderr, "BasicBlock::genMachineCode\n");
    auto cur_func = builder->getFunction();
    auto cur_block = new MachineBlock(cur_func, no);
    builder->setBlock(cur_block);
    for (auto i = head->getLink(); i != head; i = i->getLink())
    {
        // fprintf(stderr, "11111111111111111111\n");
        // i->output();
        i->genMachineCode(builder);
        // fprintf(stderr, "22222222222222222222\n");
    }
    if (cur_func)
        cur_func->InsertBlock(cur_block);
}

BasicBlock::BasicBlock(Function *f)
{
    this->no = SymbolTable::getLabel();
    f->insertBlock(this);
    parent = f;
    head = new DummyInstruction();
    head->setParent(this);
}

BasicBlock::BasicBlock()
{
    this->no = SymbolTable::getLabel();
    parent = 0;
    head = new DummyInstruction();
    head->setParent(this);
}

BasicBlock::~BasicBlock()
{
    Instruction *inst;
    inst = head->getLink();
    while (inst != head)
    {
        Instruction *t;
        t = inst;
        inst = inst->getLink();
        delete t;
    }
    for (auto &bb : pred)
        bb->removeSucc(this);
    for (auto &bb : succ)
        bb->removePred(this);
    parent->remove(this);
}
