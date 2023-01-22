#include "LinearScan.h"
#include <algorithm>
#include <iostream>
#include "LiveVariableAnalysis.h"
#include "MachineCode.h"

LinearScan::LinearScan(MachineUnit *unit)
{
    this->unit = unit;
    for (int i = 4; i < 11; i++)
        regs.push_back(i);
}

void LinearScan::allocateRegisters()
{
    fprintf(stderr, "LinearScan::allocateRegisters()\n");
    for (auto &f : unit->getFuncs())
    {
        fprintf(stderr, "auto &f : unit->getFuncs(),f:%s\n", f->getSymbol()->toStr().c_str());
        func = f;
        bool success;
        success = false;
        while (!success) // repeat until all vregs can be mapped
        {
            fprintf(stderr, "computeLiveIntervals in\n");
            computeLiveIntervals();
            fprintf(stderr, "computeLiveIntervals out\n");
            success = linearScanRegisterAllocation();
            fprintf(stderr, "linearScanRegisterAllocation\n");
            if (success)
            {
                fprintf(stderr, "success \n");
                // all vregs can be mapped to real regs
                modifyCode();
                fprintf(stderr, "modifyCode\n");
            }
            else
            {
                fprintf(stderr, "success not\n");
                // spill vregs that can't be mapped to real regs
                genSpillCode();
                fprintf(stderr, "genSpillCode\n");
            }
        }
    }
}

void LinearScan::makeDuChains()
{
    LiveVariableAnalysis lva;
    lva.pass(func);
    du_chains.clear();
    int i = 0;
    std::map<MachineOperand, std::set<MachineOperand *>> liveVar;
    for (auto &bb : func->getBlocks())
    {
        liveVar.clear();
        for (auto &t : bb->getLiveOut())
            liveVar[*t].insert(t);
        int no;
        no = i = bb->getInsts().size() + i;
        for (auto inst = bb->getInsts().rbegin(); inst != bb->getInsts().rend(); inst++)
        {
            (*inst)->setNo(no--);
            for (auto &def : (*inst)->getDef())
            {
                if (def->isVReg())
                {
                    auto &uses = liveVar[*def];
                    du_chains[def].insert(uses.begin(), uses.end());
                    auto &kill = lva.getAllUses()[*def];
                    std::set<MachineOperand *> res;
                    set_difference(uses.begin(), uses.end(), kill.begin(), kill.end(), inserter(res, res.end()));
                    liveVar[*def] = res;
                }
            }
            for (auto &use : (*inst)->getUse())
            {
                if (use->isVReg())
                    liveVar[*use].insert(use);
            }
        }
    }
}

void LinearScan::computeLiveIntervals()
{
    makeDuChains();
    intervals.clear();
    for (auto &du_chain : du_chains)
    {
        int t = -1;
        for (auto &use : du_chain.second)
            t = std::max(t, use->getParent()->getNo());
        Interval *interval = new Interval({du_chain.first->getParent()->getNo(), t, false, 0, 0, {du_chain.first}, du_chain.second});
        intervals.push_back(interval);
    }
    for (auto &interval : intervals)
    {
        auto uses = interval->uses;
        auto begin = interval->start;
        auto end = interval->end;
        for (auto block : func->getBlocks())
        {
            auto liveIn = block->getLiveIn();
            auto liveOut = block->getLiveOut();
            bool in = false;
            bool out = false;
            for (auto use : uses)
                if (liveIn.count(use))
                {
                    in = true;
                    break;
                }
            for (auto use : uses)
                if (liveOut.count(use))
                {
                    out = true;
                    break;
                }
            if (in && out)
            {
                begin = std::min(begin, (*(block->begin()))->getNo());
                end = std::max(end, (*(block->end()))->getNo());
            }
            else if (!in && out)
            {
                for (auto i : block->getInsts())
                    if (i->getDef().size() > 0 &&
                        i->getDef()[0] == *(uses.begin()))
                    {
                        begin = std::min(begin, i->getNo());
                        break;
                    }
                end = std::max(end, (*(block->end()))->getNo());
            }
            else if (in && !out)
            {
                begin = std::min(begin, (*(block->begin()))->getNo());
                int temp = 0;
                for (auto use : uses)
                    if (use->getParent()->getParent() == block)
                        temp = std::max(temp, use->getParent()->getNo());
                end = std::max(temp, end);
            }
        }
        interval->start = begin;
        interval->end = end;
    }
    bool change;
    change = true;
    while (change)
    {
        change = false;
        std::vector<Interval *> t(intervals.begin(), intervals.end());
        for (size_t i = 0; i < t.size(); i++)
            for (size_t j = i + 1; j < t.size(); j++)
            {
                Interval *w1 = t[i];
                Interval *w2 = t[j];
                if (**w1->defs.begin() == **w2->defs.begin())
                {
                    std::set<MachineOperand *> temp;
                    set_intersection(w1->uses.begin(), w1->uses.end(), w2->uses.begin(), w2->uses.end(), inserter(temp, temp.end()));
                    if (!temp.empty())
                    {
                        change = true;
                        w1->defs.insert(w2->defs.begin(), w2->defs.end());
                        w1->uses.insert(w2->uses.begin(), w2->uses.end());
                        // w1->start = std::min(w1->start, w2->start);
                        // w1->end = std::max(w1->end, w2->end);
                        auto w1Min = std::min(w1->start, w1->end);
                        auto w1Max = std::max(w1->start, w1->end);
                        auto w2Min = std::min(w2->start, w2->end);
                        auto w2Max = std::max(w2->start, w2->end);
                        w1->start = std::min(w1Min, w2Min);
                        w1->end = std::max(w1Max, w2Max);
                        auto it = std::find(intervals.begin(), intervals.end(), w2);
                        if (it != intervals.end())
                            intervals.erase(it);
                    }
                }
            }
    }
    sort(intervals.begin(), intervals.end(), compareStart);
}

bool LinearScan::linearScanRegisterAllocation()
{
    bool success = true;
    active.clear();
    regs.clear();
    for (int i = 4; i < 11; i++)
        regs.push_back(i);
    for (auto &i : intervals)
    {
        expireOldIntervals(i);
        if (regs.empty())
        {
            spillAtInterval(i);
            success = false;
        }
        else
        {
            i->rreg = regs.front();
            regs.erase(regs.begin());
            insertToActive(i);
        }
    }
    return success;
}

void LinearScan::modifyCode()
{
    for (auto &interval : intervals)
    {
        func->addSavedRegs(interval->rreg);
        for (auto def : interval->defs)
            def->setReg(interval->rreg);
        for (auto use : interval->uses)
            use->setReg(interval->rreg);
    }
}

void LinearScan::genSpillCode()
{
    for (auto &interval : intervals)
    {
        if (!interval->spill)
            continue;
        auto cur_func = func;
        MachineInstruction *cur_inst = 0;
        MachineBlock *cur_block;
        int offset = cur_func->AllocSpace(4);
        for (auto use : interval->uses)
        {
            auto reg = new MachineOperand(*use);
            cur_block = use->getParent()->getParent();
            auto useinst = use->getParent();
            cur_inst = new LoadMInstruction(cur_block, reg, new MachineOperand(MachineOperand::REG, 11), new MachineOperand(MachineOperand::IMM, -offset));
            for (auto i = cur_block->getInsts().begin(); i != cur_block->getInsts().end(); i++)
            {
                if (*i == useinst)
                {
                    cur_block->getInsts().insert(i, 1, cur_inst);
                    break;
                }
            }
        }
        for (auto def : interval->defs)
        {
            auto reg = new MachineOperand(*def);
            cur_block = def->getParent()->getParent();
            auto definst = def->getParent();
            cur_inst = new StoreMInstruction(cur_block, reg, new MachineOperand(MachineOperand::REG, 11), new MachineOperand(MachineOperand::IMM, -offset));
            for (auto i = cur_block->getInsts().begin(); i != cur_block->getInsts().end(); i++)
            {
                if (*i == definst)
                {
                    i++;
                    cur_block->getInsts().insert(i, 1, cur_inst);
                    break;
                }
            }
        }
    }
}

void LinearScan::expireOldIntervals(Interval *interval)
{
    auto it = active.begin();
    while (it != active.end())
    {
        if ((*it)->end >= interval->start)
            return;
        regs.push_back((*it)->rreg);
        it = active.erase(find(active.begin(), active.end(), *it));
        sort(regs.begin(), regs.end());
    }
}

void LinearScan::spillAtInterval(Interval *interval)
{
    auto spill = active.back();
    if (spill->end > interval->end)
    {
        spill->spill = true;
        interval->rreg = spill->rreg;
        insertToActive(interval);
    }
    else
    {
        interval->spill = true;
    }
}

bool LinearScan::compareStart(Interval *a, Interval *b)
{
    return a->start < b->start;
}

void LinearScan::insertToActive(Interval *handled_interval)
{
    if (active.size() == 0)
    {
        active.push_back(handled_interval);
        return;
    }
    for (auto it = active.begin(); it != active.end(); it++)
    {
        if ((*it)->end > handled_interval->end)
        {
            active.insert(it, 1, handled_interval);
            return;
        }
    }
    active.push_back(handled_interval);
    return;
}