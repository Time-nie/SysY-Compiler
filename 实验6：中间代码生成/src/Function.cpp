#include "Function.h"
#include "Unit.h"
#include "Type.h"
#include <list>

extern FILE *yyout;

Function::Function(Unit *u, SymbolEntry *s)
{
    u->insertFunc(this);
    entry = new BasicBlock(this);
    sym_ptr = s;
    parent = u;
}

Function::~Function()
{
    auto delete_list = block_list;
    for (auto &i : delete_list)
        delete i;
    // parent->removeFunc(this);
}

// remove the basicblock bb from its block_list.
void Function::remove(BasicBlock *bb)
{
    block_list.erase(std::find(block_list.begin(), block_list.end(), bb));
}

void Function::output() const
{
    FunctionType *funcType = dynamic_cast<FunctionType *>(sym_ptr->getType());
    Type *retType = funcType->getRetType();

    std::vector<Type *> params = funcType->getParamsType();
    std::string paramstr;
    std::vector<Type *>::iterator it;
    int i = 0;
    for (it = params.begin(); it != params.end(); it++)
    {
        if (paramstr.size() != 0)
            paramstr = paramstr + ",";
        paramstr = paramstr + " " + (*it)->toStr() + " " + paramsOperand[i]->toStr();
        i++;
    }

    fprintf(yyout, "define %s %s(%s) {\n", retType->toStr().c_str(), sym_ptr->toStr().c_str(), paramstr.c_str());

    // fprintf(yyout, "define %s %s() {\n", retType->toStr().c_str(), sym_ptr->toStr().c_str());
    std::set<BasicBlock *> v;
    std::list<BasicBlock *> q;
    // enrty为函数的入口基本块
    q.push_back(entry);
    v.insert(entry);

    while (!q.empty())
    {
        // bb为这个函数最前面的基本块（第一次位entry）
        auto bb = q.front();
        q.pop_front();
        // 调用当前基本块的output函数
        bb->output();
        // succ为基本块bb的后续基本块构成的向量
        for (auto succ = bb->succ_begin(); succ != bb->succ_end(); succ++)
        {
            // v是一个set，所以会排除掉那些重复的基本块
            if (v.find(*succ) == v.end())
            {
                v.insert(*succ);
                q.push_back(*succ);
            }
        }
    }
    fprintf(yyout, "}\n");
}
