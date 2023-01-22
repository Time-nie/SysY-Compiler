/**
 * linear scan register allocation
 */

#ifndef _LINEARSCAN_H__
#define _LINEARSCAN_H__
#include <list>
#include <map>
#include <set>
#include <vector>

class MachineUnit;
class MachineOperand;
class MachineFunction;

class LinearScan
{
private:
    struct Interval
    {
        int start;
        int end;
        bool spill; // whether this vreg should be spilled to memory
        int disp;   // displacement in stack
        int rreg;   // the real register mapped from virtual register if the vreg
                    // is not spilled to memory
        std::set<MachineOperand *> defs;
        std::set<MachineOperand *> uses;
    };
    MachineUnit *unit;
    MachineFunction *func;
    // 暂且先认为它是可用的寄存器吧
    std::vector<int> regs;
    std::map<MachineOperand *, std::set<MachineOperand *>> du_chains;
    std::vector<Interval *> intervals;
    std::vector<Interval *> active;
    static bool compareStart(Interval *a, Interval *b);
    static bool compareEnd(Interval *a, Interval *b);
    void expireOldIntervals(Interval *interval);
    void spillAtInterval(Interval *interval);
    void makeDuChains();
    void computeLiveIntervals();
    bool linearScanRegisterAllocation();
    void modifyCode();
    void genSpillCode();

public:
    LinearScan(MachineUnit *unit);
    void allocateRegisters();
    void insertToActive(Interval *handled_interval);
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

#endif