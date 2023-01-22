#include "Unit.h"

void Unit::insertFunc(Function *f)
{
    func_list.push_back(f);
}

void Unit::removeFunc(Function *func)
{
    func_list.erase(std::find(func_list.begin(), func_list.end(), func));
}

void Unit::output() const
{
    globalBB->output();
    for (auto &func : func_list)
        func->output();
}

void Unit::genMachineCode(MachineUnit *munit)
{
    fprintf(stderr, "Unit::genMachineCode\n");
    AsmBuilder *builder = new AsmBuilder();
    builder->setUnit(munit);

    globalBB->genMachineCode(builder);

    for (auto &func : func_list)
        func->genMachineCode(builder);
}

Unit::~Unit()
{
    for (auto &func : func_list)
        delete func;
}
