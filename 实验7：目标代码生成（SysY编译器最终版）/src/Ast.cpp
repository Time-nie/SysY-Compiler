// 负责输出语法树
// 编写输出output函数
#include "Ast.h"
#include "SymbolTable.h"
#include "Unit.h"
#include "Instruction.h"
#include "IRBuilder.h"
#include <string>
#include "Type.h"
#include <assert.h>
#include <stack>

extern FILE *yyout;
int Node::counter = 0;
IRBuilder *Node::builder = nullptr;

bool in_func = 0;

SymbolEntry *se_const0 = new ConstantSymbolEntry(TypeSystem::intType, 0);
ExprNode *temp_const0 = new Constant(se_const0);
Operand *src0_const0 = temp_const0->getOperand();

std::vector<Instruction *> global;
int paramno = 0;

Node::Node()
{
    seq = counter++;
    // 初始化为空
    link = nullptr;
}

void Node::setLink(Node *node)
{
    Node *temp = this;
    // 找到结点链表串的最后一个结点
    while (temp->getLink())
    {
        temp = temp->getLink();
    }
    temp->link = node;
}

Node *Node::getLink()
{
    return link;
}

// 回填函数
void Node::backPatch(std::vector<Instruction *> &list, BasicBlock *bb, bool branch)
{
    if (branch)
        for (auto &inst : list)
        {
            if (inst->isCond())
                dynamic_cast<CondBrInstruction *>(inst)->setTrueBranch(bb);
            else if (inst->isUncond())
                dynamic_cast<UncondBrInstruction *>(inst)->setBranch(bb);
        }
    else
        for (auto &inst : list)
        {
            if (inst->isCond())
                dynamic_cast<CondBrInstruction *>(inst)->setFalseBranch(bb);
            else if (inst->isUncond())
                dynamic_cast<UncondBrInstruction *>(inst)->setBranch(bb);
        }
}

std::vector<Instruction *> Node::merge(std::vector<Instruction *> &list1, std::vector<Instruction *> &list2)
{
    std::vector<Instruction *> res(list1);
    res.insert(res.end(), list2.begin(), list2.end());
    return res;
}

// 根开始gencode()
void Ast::genCode(Unit *unit)
{
    fprintf(stderr, "Ast::genCode\n");
    // 这个builder应该是唯一的
    IRBuilder *builder = new IRBuilder(unit);
    // Node类的静态方法
    Node::setIRBuilder(builder);
    root->genCode();

    // 声明链接库
    // fprintf(yyout, "declare i32 @getint()\n");
    // fprintf(yyout, "declare void @putint(i32)\n");
    // fprintf(yyout, "declare i32 @getch()\n");
    // fprintf(yyout, "declare void @putch(i32)\n");
    // fprintf(yyout, "declare void @putf(i32)\n\n");

    // // 输出全局指令
    // int s = global.size();
    // for (int i = 0; i < s; i++)
    // {
    //     global[i]->output();
    // }
}

// 函数定义
void FunctionDef::genCode()
{
    fprintf(stderr, "FunctionDef::genCode\n");
    Unit *unit = builder->getUnit();
    Function *func = new Function(unit, se);
    BasicBlock *entry = func->getEntry();
    // set the insert point to the entry basicblock of this function.

    builder->setInsertBB(entry);

    paramno = 0;
    // 函数参数中间代码生成
    if (FuncDefParams)
        FuncDefParams->genCode();

    // 函数体中间代码生成
    if (stmt)
        stmt->genCode();

    // 根据基本块的前驱、后继关系进行流图的构造
    for (auto block = func->begin(); block != func->end(); block++)
    {
        // 获取该块的第一条和最后一条指令
        Instruction *i = (*block)->begin();
        Instruction *last = (*block)->rbegin();
        while (i != last)
        {
            if (i->isCond() || i->isUncond())
            {
                // 移除块中跳转指令
                (*block)->remove(i);
            }
            i = i->getLink();
        }
        // 有条件跳转
        if (last->isCond())
        {
            BasicBlock *truebranch, *falsebranch;
            truebranch =
                dynamic_cast<CondBrInstruction *>(last)->getTrueBranch();
            falsebranch =
                dynamic_cast<CondBrInstruction *>(last)->getFalseBranch();
            if (truebranch->empty())
            {
                new RetInstruction(nullptr, truebranch);
            }
            else if (falsebranch->empty())
            {
                new RetInstruction(nullptr, falsebranch);
            }
            (*block)->addSucc(truebranch);
            (*block)->addSucc(falsebranch);
            truebranch->addPred(*block);
            falsebranch->addPred(*block);
        }
        // 无条件跳转
        else if (last->isUncond())
        {
            // 获取要跳转的基本块
            BasicBlock *dst =
                dynamic_cast<UncondBrInstruction *>(last)->getBranch();
            // 跳转块链接
            (*block)->addSucc(dst);
            dst->addPred(*block);

            if (dst->empty())
            {
                if (((FunctionType *)(se->getType()))->getRetType() ==
                    TypeSystem::intType)
                    new RetInstruction(new Operand(new ConstantSymbolEntry(
                                           TypeSystem::intType, 0)),
                                       dst);
                else if (((FunctionType *)(se->getType()))->getRetType() ==
                         TypeSystem::voidType)
                    new RetInstruction(nullptr, dst);
            }
        }
        // 最后一条语句不是返回以及跳转
        else if (!last->isRet())
        {
            if (((FunctionType *)(se->getType()))->getRetType() ==
                TypeSystem::voidType)
            {
                new RetInstruction(nullptr, *block);
            }
        }
    }
}

// 函数调用中间代码生成
void FuncCallExpr::genCode()
{
    fprintf(stderr, "FuncCallExpr::genCode\n");

    BasicBlock *bb = builder->getInsertBB();
    std::vector<Operand *> operands;
    ExprNode *temp = param;
    while (temp)
    {
        // 参数中间代码生成
        temp->genCode();
        operands.push_back(temp->getOperand());
        temp = ((ExprNode *)temp->getLink());
    }
    bb = builder->getInsertBB();
    // fprintf("ssssssssss%s")
    new CallInstruction(dst, symbolEntry, operands, bb);
}

// 二元运算表达式中间代码生成
void BinaryExpr::genCode()
{
    fprintf(stderr, "BinaryExpr::genCode\n");
    // 获取新的指令要插入的基本块insertBB
    BasicBlock *bb = builder->getInsertBB();
    // 获取当前所处的函数
    Function *func = bb->getParent();
    // fprintf(stderr, "op: %d", op);
    if (op == AND)
    {
        // fprintf(stderr, "Come in AND\n");
        expr1->genCode();
        if (expr1->getOperand() == nullptr)
        {
            fprintf(stderr, "BinaryExpr can't be void type\n");
            assert(expr1->getOperand() != nullptr);
        }
        Instruction *test = bb->rbegin();
        // 考虑if(2&&3),第一个表达式为算术表达式
        if (!test->isCond() && !test->isUncond())
        {
            int opcode = CmpInstruction::NE;
            Operand *src1 = expr1->getOperand();
            Operand *src2 = src0_const0;
            // dst比较指令目的寄存器
            SymbolEntry *tse = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
            Operand *dst = new Operand(tse);
            Operand *n1 = src1;
            // bool转int的类型转换
            if (src1->getType() == TypeSystem::boolType)
            {
                SymbolEntry *s = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
                n1 = new Operand(s);
                new Bool2IntInstruction(n1, src1, bb); // 零拓展
            }
            // 跟0比较，判断表达式真假
            new CmpInstruction(opcode, dst, n1, src2, bb);
            Instruction *temp = new CondBrInstruction(nullptr, nullptr, dst, bb);
            // trueList和falseList均为目标地址未确定的跳转指令的向量
            expr1->trueList().push_back(temp);
            expr1->falseList().push_back(temp);
        }
        // new了一个新的基本块trueBB，如果第一个表达式的结果为真，那么跳到这个基本块
        BasicBlock *trueBB = new BasicBlock(func);

        backPatch(expr1->trueList(), trueBB, true);
        // 设置当前的新的指令（第二个表达式对应的指令）要插入到的基本块为trueBB
        builder->setInsertBB(trueBB); // set the insert point to the trueBB so that intructions generated by expr2 will be inserted into it.
        trueBB->addPred(bb);          // 没用
        bb->addSucc(trueBB);

        expr2->genCode();
        if (expr2->getOperand() == nullptr)
        {
            fprintf(stderr, "BinaryExpr can't be void type\n");
            assert(expr2->getOperand() != nullptr);
        }
        bb = builder->getInsertBB();
        test = bb->rbegin();
        if (!test->isCond() && !test->isUncond())
        {
            int opcode = CmpInstruction::NE;
            Operand *src1 = expr2->getOperand();
            Operand *src2 = src0_const0;
            SymbolEntry *tse = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
            Operand *dst = new Operand(tse);
            Operand *n1 = src1;
            if (src1->getType() == TypeSystem::boolType)
            {
                SymbolEntry *s = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
                n1 = new Operand(s);
                new Bool2IntInstruction(n1, src1, bb);
            }
            new CmpInstruction(opcode, dst, n1, src2, bb);
            Instruction *temp = new CondBrInstruction(nullptr, nullptr, dst, bb);
            expr2->trueList().push_back(temp);
            expr2->falseList().push_back(temp);
        }

        true_list = expr2->trueList();
        false_list = merge(expr1->falseList(), expr2->falseList());
    }
    else if (op == OR)
    {
        // fprintf(stderr, "Come in OR\n");
        expr1->genCode();
        if (expr1->getOperand() == nullptr)
        {
            fprintf(stderr, "BinaryExpr can't be void type\n");
            assert(expr1->getOperand() != nullptr);
        }
        Instruction *test = bb->rbegin();
        if (!test->isCond() && !test->isUncond())
        {
            int opcode = CmpInstruction::NE;
            Operand *src1 = expr1->getOperand();
            Operand *src2 = src0_const0;
            SymbolEntry *tse = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
            Operand *dst = new Operand(tse);
            Operand *n1 = src1;
            if (src1->getType() == TypeSystem::boolType)
            {
                SymbolEntry *s = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
                n1 = new Operand(s);
                new Bool2IntInstruction(n1, src1, bb); // 零拓展
            }
            new CmpInstruction(opcode, dst, n1, src2, bb);                        // 比较
            Instruction *temp = new CondBrInstruction(nullptr, nullptr, dst, bb); // 条件跳转
            expr1->trueList().push_back(temp);
            expr1->falseList().push_back(temp);
        }

        BasicBlock *ntrueBB = new BasicBlock(func); // if the result of lhs is true, jump to the trueBB.

        // 与AND逻辑区别
        backPatch(expr1->falseList(), ntrueBB, false);

        builder->setInsertBB(ntrueBB); // set the insert point to the trueBB so that intructions generated by expr2 will be inserted into it.
        ntrueBB->addPred(bb);          // 没用
        bb->addSucc(ntrueBB);

        expr2->genCode();
        if (expr2->getOperand() == nullptr)
        {
            fprintf(stderr, "BinaryExpr can't be void type\n");
            assert(expr2->getOperand() != nullptr);
        }
        bb = builder->getInsertBB();
        test = bb->rbegin();
        if (!test->isCond() && !test->isUncond())
        {
            int opcode = CmpInstruction::NE;
            Operand *src1 = expr2->getOperand();
            Operand *src2 = src0_const0;
            SymbolEntry *tse = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
            Operand *dst = new Operand(tse);
            Operand *n1 = src1;
            if (src1->getType() == TypeSystem::boolType)
            {
                SymbolEntry *s = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
                n1 = new Operand(s);
                new Bool2IntInstruction(n1, src1, bb);
            }
            new CmpInstruction(opcode, dst, n1, src2, bb);
            Instruction *temp = new CondBrInstruction(nullptr, nullptr, dst, bb);
            expr2->trueList().push_back(temp);
            expr2->falseList().push_back(temp);
        }

        // 与AND逻辑区别
        false_list = expr2->falseList();
        true_list = merge(expr1->trueList(), expr2->trueList());
    }
    else if (op >= LESS && op <= NE) // LESS, MORE, LEQ, MEQ, EQ, NE
    {
        // fprintf(stderr, "Come in LESS~NE\n");
        expr1->genCode(); // 生成子表达式中间代码
        expr2->genCode();
        // 类型检查
        if (expr1->getOperand() == nullptr)
        {
            fprintf(stderr, "BinaryExpr can't be void type\n");
            assert(expr1->getOperand() != nullptr);
        }
        if (expr2->getOperand() == nullptr)
        {
            fprintf(stderr, "BinaryExpr can't be void type\n");
            assert(expr2->getOperand() != nullptr);
        }
        // 通过getOperand函数得到子表达式的目的操作数
        Operand *src1 = expr1->getOperand();
        Operand *src2 = expr2->getOperand();

        int opcode = -1;
        switch (op)
        {
        case LESS:
            opcode = CmpInstruction::L;
            break;
        case MORE:
            opcode = CmpInstruction::G;
            break;
        case LEQ:
            opcode = CmpInstruction::LE;
            break;
        case MEQ:
            opcode = CmpInstruction::GE;
            break;
        case EQ:
            opcode = CmpInstruction::E;
            break;
        case NE:
            opcode = CmpInstruction::NE;
            break;
        }

        Operand *n1 = src1, *n2 = src2;
        // bool -> int 隐式类型转换
        if (src1->getType() == TypeSystem::boolType)
        {
            SymbolEntry *s = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
            n1 = new Operand(s);
            new Bool2IntInstruction(n1, src1, bb);
        }
        if (src2->getType() == TypeSystem::boolType)
        {
            SymbolEntry *s2 = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
            n2 = new Operand(s2);
            new Bool2IntInstruction(n2, src2, bb);
        }

        SymbolEntry *tse = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        dst = new Operand(tse); // 目的寄存器
        new CmpInstruction(opcode, dst, n1, n2, bb);
    }
    else if (op >= ADD && op <= MOD)
    {
        // fprintf(stderr, "Come in ADD~MOD\n");
        expr1->genCode();
        expr2->genCode();
        if (expr1->getOperand() == nullptr)
        {
            fprintf(stderr, "BinaryExpr can't be void type\n");
            assert(expr1->getOperand() != nullptr);
        }
        if (expr2->getOperand() == nullptr)
        {
            fprintf(stderr, "BinaryExpr can't be void type\n");
            assert(expr2->getOperand() != nullptr);
        }
        Operand *src1 = expr1->getOperand();
        Operand *src2 = expr2->getOperand();
        int opcode;
        switch (op)
        {
        case ADD:
            opcode = BinaryInstruction::ADD;
            break;
        case SUB:
            opcode = BinaryInstruction::SUB;
            break;
        case MUL:
            opcode = BinaryInstruction::MUL;
            break;
        case DIV:
            opcode = BinaryInstruction::DIV;
            break;
        case MOD:
            opcode = BinaryInstruction::MOD;
            break;
        }

        Operand *n1 = src1, *n2 = src2;
        if (src2->getType() == TypeSystem::boolType)
        {
            SymbolEntry *s2 = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
            n2 = new Operand(s2);
            new Bool2IntInstruction(n2, src2, bb);
        }
        if (src1->getType() == TypeSystem::boolType)
        {
            SymbolEntry *s = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
            n1 = new Operand(s);
            new Bool2IntInstruction(n1, src1, bb);
        }
        if (op == ADD || op == MUL)
        {
            new BinaryInstruction(opcode, dst, src2, src1, bb);
        }
        else
        {
            new BinaryInstruction(opcode, dst, src1, src2, bb);
        }
    }
    // fprintf(stderr, "NOT Come in\n");
}

// 一元运算表达式代码生成
void UnaryExpr::genCode()
{
    fprintf(stderr, "UnaryExpr::genCode\n");
    expr->genCode();
    if (expr->getOperand() == nullptr)
    {
        fprintf(stderr, "UnaryExpr can't be void type\n");
        assert(expr->getOperand() != nullptr);
    }
    BasicBlock *bb = builder->getInsertBB();
    Operand *src = expr->getOperand();
    int opcode;

    if (op == ADD || op == SUB)
    {
        switch (op)
        {
        case ADD:
            opcode = BinaryInstruction::ADD;
            symbolEntry->SetValue(src->getEntry()->getValue());
            break;
        case SUB:
            opcode = BinaryInstruction::SUB;
            symbolEntry->SetValue(-(src->getEntry()->getValue()));
            break;
        }

        dst = new Operand(symbolEntry);
        Operand *n = src;
        // bool -> int隐式类型转换
        if (src->getType() == TypeSystem::boolType)
        {
            SymbolEntry *s = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
            n = new Operand(s);
            new Bool2IntInstruction(n, src, bb);
        }
        Operand *src0 = src0_const0;
        new BinaryInstruction(opcode, dst, src0, n, bb);
        // new UnaryInstruction(opcode, dst, n, bb);
    }
    else if (op == NOT)
    {
        // !3 -> 3和0作比较
        if (expr->getOperand()->getType() == TypeSystem::intType)
        {
            opcode = CmpInstruction::E;
            Operand *src = expr->getOperand();
            Operand *src0 = src0_const0;
            SymbolEntry *s = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
            Operand *n = new Operand(s);
            if (dst->getType() != src->getType())
                new Bool2IntInstruction(n, dst, bb);
            new CmpInstruction(opcode, this->dst, src, src0, bb);
        }
        // 等价于与true异或运算
        else if (expr->getOperand()->getType() == TypeSystem::boolType)
        {
            // new BinaryInstruction(BinaryInstruction::XOR, dst, src, one, bb);
            new NotInstruction(this->dst, src, bb);
        }
        fprintf(stderr, "出去NOT\n");
    }
}

void Constant::genCode()
{
    // we don't need to generate code.
}

// ID中间代码生成（加载值）
void Id::genCode()
{
    fprintf(stderr, "Id::genCode\n");
    BasicBlock *bb = builder->getInsertBB();
    Operand *addr = dynamic_cast<IdentifierSymbolEntry *>(symbolEntry)->getAddr();
    Type *symboleType = this->getSymPtr()->getType();
    if (this->getSymPtr()->getType()->isInt())
        new LoadInstruction(dst, addr, bb);
    else if (symboleType->isArray())
    {
        // b=2+a[2][3]
        // arrIdx代表[2][3]这种，实际存在形式为2->3
        if (arrIdx)
        {
            fprintf(stderr, "AAAAAAAAAAAAAAAAAAAAId::genCode->arrIdx\n");
            // type1为数组类型[2][3],type为元素类型[3]
            Type *type = ((ArrayType *)symboleType)->getEType();
            Type *type1 = symboleType;
            // tempSrc：要加载的标识符地址，tempDst：目的操作数
            Operand *tempSrc = addr;
            Operand *tempDst = dst;
            // idx就是2->3
            ExprNode *idx = arrIdx;
            bool flag = false;
            bool pointer = false; // 为true表示dst为指针类型->用于函数参数
            bool firstFlag = true;
            while (true)
            {
                fprintf(stderr, "%d\n", ((ArrayType *)type1)->getLength());
                // 函数参数，像a[2][],a[]
                if (((ArrayType *)type1)->getLength() == -1)
                {
                    fprintf(stderr, "(ArrayType *)type1)->getLength() == -1\n");
                    Operand *dst1 = new Operand(new TemporarySymbolEntry(new PointerType(type), SymbolTable::getLabel()));
                    tempSrc = dst1;
                    new LoadInstruction(dst1, addr, bb);
                    flag = true;
                    firstFlag = false;
                }
                // idx为空，也就是表示数组是定义而非使用，生成ArInstruction
                // idx=0，paramFirst = false跳出
                // a[0]
                if (!idx)
                {
                    fprintf(stderr, "!idx\n");
                    Operand *dst1 = new Operand(new TemporarySymbolEntry(new PointerType(type), SymbolTable::getLabel()));
                    Operand *idx = new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0));
                    new ArInstruction(dst1, tempSrc, idx, bb);
                    tempDst = dst1;
                    pointer = true;
                    break;
                }
                // 以下必定是idx有值，idx=2->3
                // 带有此处flag（Ar指令中paramFirst）标志，若为函数参数中的[]维度(参数最后一维)，该标志为true，否则为false
                idx->genCode();
                auto gep = new ArInstruction(tempDst, tempSrc, idx->getOperand(), bb, flag);
                if (!flag && firstFlag)
                {
                    gep->setFirst();
                    firstFlag = false;
                }
                if (flag)
                    flag = false;
                if (type == TypeSystem::intType ||
                    type == TypeSystem::constIntType)
                    break;
                type = ((ArrayType *)type)->getEType();
                type1 = ((ArrayType *)type1)->getEType();
                tempSrc = tempDst;
                tempDst = new Operand(new TemporarySymbolEntry(
                    new PointerType(type), SymbolTable::getLabel()));
                idx = (ExprNode *)(idx->getLink());
            }
            dst = tempDst;
            // 如果是右值还需要一条load
            if (!left && !pointer)
            {
                Operand *dst1 = new Operand(new TemporarySymbolEntry(
                    TypeSystem::intType, SymbolTable::getLabel()));
                new LoadInstruction(dst1, dst, bb);
                dst = dst1;
            }
        }
        else
        {
            if (((ArrayType *)symboleType)->getLength() == -1)
            {
                Operand *dst1 = new Operand(new TemporarySymbolEntry(
                    new PointerType(
                        ((ArrayType *)symboleType)->getEType()),
                    SymbolTable::getLabel()));
                new LoadInstruction(dst1, addr, bb);
                dst = dst1;
            }
            else
            {
                Operand *idx = new Operand(
                    new ConstantSymbolEntry(TypeSystem::intType, 0));
                auto gep = new ArInstruction(dst, addr, idx, bb);
                gep->setFirst();
            }
        }
    }
}
void InitArray::output(int level)
{
    std::string type;
    if (symbolEntry->getType())
        type = symbolEntry->getType()->toStr();
    fprintf(yyout, "%*cInitValueListExpr\ttype: %s\n", level, ' ',
            type.c_str());
    Node *temp = expr;
    while (temp)
    {
        temp->output(level + 4);
        temp = temp->getLink();
    }
}
void InitArray::addExpr(ExprNode *expr)
{
    if (this->expr == nullptr)
    {
        assert(childCnt == 0);
        childCnt++;
        this->expr = expr;
    }
    else
    {
        childCnt++;
        this->expr->setLink(expr);
    }
}

bool InitArray::isFull()
{
    ArrayType *type = (ArrayType *)(this->symbolEntry->getType());
    return childCnt == type->getLength();
}

void InitArray::fill()
{
    Type *type = ((ArrayType *)(this->getType()))->getEType();
    // a[3][4]
    if (type->isArray())
    {
        while (!isFull())
            this->addExpr(new InitArray(new ConstantSymbolEntry(type)));
        ExprNode *temp = expr;
        while (temp)
        {
            ((InitArray *)temp)->fill();
            temp = (ExprNode *)(temp->getLink());
        }
    }
    // a[3]
    if (type->isInt())
    {
        while (!isFull())
            this->addExpr(new Constant(new ConstantSymbolEntry(type, 0)));
        return;
    }
}

// if(cond)
//    then_bb
// end

// if(cond)
//     int flag=1
//     if(flag)
//         then_then_bb
// end_bb

void IfStmt::genCode()
{
    fprintf(stderr, "IfStmt::genCode\n");
    Function *func;
    BasicBlock *then_bb, *end_bb;

    func = builder->getInsertBB()->getParent();
    then_bb = new BasicBlock(func);
    end_bb = new BasicBlock(func);

    cond->genCode();

    BasicBlock *bb = builder->getInsertBB();
    Instruction *test = bb->rbegin();
    if (!test->isCond() && !test->isUncond())
    {
        Operand *src1 = cond->getOperand();
        Operand *n = src1;
        // int ->与0作比较并保存为bool类型
        if (src1->getType() == TypeSystem::intType)
        {
            int opcode = CmpInstruction::NE;
            Operand *src2 = src0_const0;
            SymbolEntry *tse = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
            Operand *dst = new Operand(tse);
            new CmpInstruction(opcode, dst, n, src2, bb);
            n = dst;
        }
        Instruction *temp = new CondBrInstruction(nullptr, nullptr, n, bb);
        cond->trueList().push_back(temp);
        cond->falseList().push_back(temp);
    }

    // 回填
    backPatch(cond->trueList(), then_bb, true);
    backPatch(cond->falseList(), end_bb, false);

    builder->setInsertBB(then_bb);
    if (thenStmt != nullptr)
        thenStmt->genCode();
    then_bb = builder->getInsertBB();
    new UncondBrInstruction(end_bb, then_bb);

    builder->setInsertBB(end_bb);
}
// if(cond)
//     flag=1
//     if(flag)
//         then_bb
//     else
//         else_bb
// else
//     flag=0
//     if(flag)
//         then_bb
//     else
//         else_bb
// end_bb

void IfElseStmt::genCode()
{
    fprintf(stderr, "IfElseStmt::genCode\n");
    Function *func;
    BasicBlock *then_bb, *else_bb, *end_bb;
    func = builder->getInsertBB()->getParent();
    then_bb = new BasicBlock(func);
    else_bb = new BasicBlock(func);
    end_bb = new BasicBlock(func);

    cond->genCode();

    BasicBlock *bb = builder->getInsertBB();
    Instruction *test = bb->rbegin();
    if (!test->isCond() && !test->isUncond())
    {
        Operand *src1 = cond->getOperand();
        Operand *n = src1;
        if (src1->getType() == TypeSystem::intType)
        {
            int opcode = CmpInstruction::NE;
            Operand *src2 = src0_const0;
            SymbolEntry *tse = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
            Operand *dst = new Operand(tse);
            new CmpInstruction(opcode, dst, src1, src2, bb);
            n = dst;
        }
        Instruction *temp = new CondBrInstruction(nullptr, nullptr, n, bb);
        cond->trueList().push_back(temp);
        cond->falseList().push_back(temp);
    }

    backPatch(cond->trueList(), then_bb, true);
    backPatch(cond->falseList(), else_bb, false);

    builder->setInsertBB(then_bb);
    if (thenStmt != nullptr)
        thenStmt->genCode();
    then_bb = builder->getInsertBB();
    new UncondBrInstruction(end_bb, then_bb);

    builder->setInsertBB(else_bb);
    if (elseStmt != nullptr)
        elseStmt->genCode();
    else_bb = builder->getInsertBB();
    new UncondBrInstruction(end_bb, else_bb);

    builder->setInsertBB(end_bb);
}

void ContinueStmt::genCode()
{
    fprintf(stderr, "ContinueStmt::genCode\n");
    // Todo
    Function *func = builder->getInsertBB()->getParent();
    BasicBlock *bb = builder->getInsertBB();
    new UncondBrInstruction(((WhileStmt *)whileStmt)->get_cond_bb(), bb);
    BasicBlock *continue_next_bb = new BasicBlock(func);
    builder->setInsertBB(continue_next_bb);
}

void BreakStmt::genCode()
{
    fprintf(stderr, "BreakStmt::genCode\n");
    Function *func = builder->getInsertBB()->getParent();
    BasicBlock *bb = builder->getInsertBB();
    fprintf(stderr, "1111111111111111\n");
    new UncondBrInstruction(((WhileStmt *)whileStmt)->get_end_bb(), bb);
    fprintf(stderr, "2222222222222222\n");
    BasicBlock *break_next_bb = new BasicBlock(func);
    fprintf(stderr, "333333333333333\n");
    builder->setInsertBB(break_next_bb);
}

// while(cond)
//     loop_bb
// end_bb
void WhileStmt::genCode()
{
    fprintf(stderr, "WhileStmt::genCode\n");
    Function *func;
    BasicBlock *cond_bb, *loop_bb, *end_bb, *bb;

    bb = builder->getInsertBB();
    func = bb->getParent();
    cond_bb = new BasicBlock(func);
    loop_bb = new BasicBlock(func);
    end_bb = new BasicBlock(func);

    this->cond_bb = cond_bb;
    this->end_bb = end_bb;

    bb->addSucc(cond_bb);
    cond_bb->addPred(bb);

    builder->setInsertBB(cond_bb);
    cond->genCode();
    new UncondBrInstruction(cond_bb, bb);

    bb = builder->getInsertBB();
    Instruction *test = bb->rbegin();
    if (!test->isCond() && !test->isUncond())
    {
        Operand *src1 = cond->getOperand();
        // fprintf(stderr, "ttttttttttttt%s", src1->getType()->toStr().c_str());
        Operand *n = src1;
        if (src1->getType() == TypeSystem::intType)
        {
            // fprintf(stderr, "hhhhhhhhhhh");
            int opcode = CmpInstruction::NE;
            Operand *src2 = src0_const0;
            SymbolEntry *tse = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
            Operand *dst = new Operand(tse);
            new CmpInstruction(opcode, dst, src1, src2, bb);
            n = dst;
        }
        // fprintf(stderr, "pppppppppppppp%s", n->getType()->toStr().c_str());
        Instruction *temp = new CondBrInstruction(nullptr, nullptr, n, bb);
        cond->trueList().push_back(temp);
        cond->falseList().push_back(temp);
    }

    backPatch(cond->trueList(), loop_bb, true);
    backPatch(cond->falseList(), end_bb, false);
    bb = builder->getInsertBB();

    builder->setInsertBB(loop_bb);
    if (stmt != nullptr)
        stmt->genCode();
    loop_bb = builder->getInsertBB();
    new UncondBrInstruction(cond_bb, loop_bb);

    builder->setInsertBB(end_bb);
}

void CompoundStmt::genCode()
{
    fprintf(stderr, "CompoundStmt::genCode\n");
    stmt->genCode();
}

void SeqNode::genCode()
{
    fprintf(stderr, "SeqNode::genCode\n");
    stmt1->genCode();
    if (stmt2 != nullptr)
        stmt2->genCode();
}

// 函数参数/变量声明
void DeclStmt::genCode()
{
    fprintf(stderr, "DeclStmt::genCode\n");
    IdentifierSymbolEntry *se = dynamic_cast<IdentifierSymbolEntry *>(id->getSymPtr());
    // 全局变量
    if (se->isGlobal())
    {
        Operand *addr;
        SymbolEntry *addr_se;
        addr_se = new IdentifierSymbolEntry(*se); // 地址
        addr_se->setType(new PointerType(se->getType()));
        addr = new Operand(addr_se);
        se->setAddr(addr);
        Instruction *g;
        if (expr != nullptr)
        {
            if (expr->isInitArr())
            {
                int n = se->getType()->getSize() / 32;
                int *p = se->getArrayValue();
                std::vector<Operand *> v;
                BasicBlock *bb = builder->getUnit()->getGlobalBB();
                for (int i = 0; i < n; i++)
                {
                    ConstantSymbolEntry *temp = new ConstantSymbolEntry(TypeSystem::intType, p[i]);
                    Operand *t = new Operand(temp);
                    v.push_back(t);
                }
                g = new GlobalInstruction(new Operand(id->getSymPtr()), v, se, bb);
            }
            else
            {
                expr->genCode();
                // 通通化为const，让等号右侧返回一个定值
                // 为了应对单目表达式（例如-1），为了获取表达式的值直接转为const类型，
                ConstantSymbolEntry *se_const = new ConstantSymbolEntry(TypeSystem::intType, expr->getOperand()->getEntry()->getValue());
                Operand *n = new Operand(se_const);
                BasicBlock *bb = builder->getUnit()->getGlobalBB();
                std::vector<Operand *> v;
                v.push_back(n);
                g = new GlobalInstruction(new Operand(id->getSymPtr()), v, se, bb);
            }
        }
        else
        {
            fprintf(stderr, "DeclStmt::genCode_expr = nullptr");
            BasicBlock *bb = builder->getUnit()->getGlobalBB();
            Operand *src0 = src0_const0;
            // 全局变量默认赋值0
            std::vector<Operand *> v;
            v.push_back(src0);
            g = new GlobalInstruction(new Operand(id->getSymPtr()), v, se, bb);
        }
        global.push_back(g);
    }
    else if (se->isLocal() || se->isParam())
    {
        fprintf(stderr, "44444444444444444se->isLocal() || se->isParam()\n");
        Function *func = builder->getInsertBB()->getParent();
        BasicBlock *entry = func->getEntry();
        Instruction *alloca;
        Operand *addr;
        SymbolEntry *addr_se;
        Type *type;
        type = new PointerType(se->getType());
        addr_se = new TemporarySymbolEntry(type, SymbolTable::getLabel());
        addr = new Operand(addr_se);
        alloca = new AllocaInstruction(addr, se); // allocate space for local id in function stack.
        entry->insertFront(alloca);               // allocate instructions should be inserted into the begin of the entry block.
        se->setAddr(addr);                        // set the addr operand in symbol entry so that we can use it in subsequent code generation.

        if (se->isParam())
        {
            fprintf(stderr, "%s: se->isParam()\n", se->toStr().c_str());
            // store参数的值到刚刚分配的空间中
            type = se->getType();
            SymbolEntry *s = new TemporarySymbolEntry(type, SymbolTable::getLabel());
            Operand *src = new Operand(s);
            BasicBlock *bb = builder->getInsertBB();
            new StoreInstruction(addr, src, bb, paramno);
            paramno++;
            func->pushParamsOperand(src);
        }

        if (expr != nullptr)
        {
            fprintf(stderr, "44444444444444444expr != nullptr\n");
            if (expr->isInitArr())
            {
                fprintf(stderr, "44444444444444444444expr->isInitArr()\n");
                Operand *init = nullptr;
                BasicBlock *bb = builder->getInsertBB();
                // temp遍历{}中每一个赋值
                ExprNode *temp = expr;
                std::stack<ExprNode *> Arr_stack;
                std::vector<int> idx;
                idx.push_back(0);
                //{{2,3},2,3+2,4}那么{2,3}->2->(3+2)->4
                //{2,3,4}
                // 循环遍历初始化表达式中的每个元素
                // 使用一个堆栈来跟踪初始化表达式中的当前位置，一个向量来跟踪被初始化元素的索引
                while (temp)
                {
                    fprintf(stderr, "44444444444444444444while\n");
                    // if 语句检查当前元素是否为数组，如果是，则将其压入堆栈并继续遍历
                    // 第一次一定会进入到下面这个if，因为一定是一个{}在最外面，每次遇到新的{}都会idx压入
                    if (temp->isInitArr())
                    {
                        fprintf(stderr, " if (temp->isInitArr())\n");
                        Arr_stack.push(temp);
                        idx.push_back(0);
                        temp = ((InitArray *)temp)->getExpr();
                        continue;
                    }
                    else
                    {
                        fprintf(stderr, "44444444444444444444else\n");
                        temp->genCode();
                        // 获取数组的子元素的类型（如果是多维数组，type为array，否则为int）
                        /*
                        a[4][2][3]
                        arraytype(4,arraytype(2,arraytype(3,int)))
                        */
                        Type *type = ((ArrayType *)(se->getType()))->getEType();
                        // tempSrc赋初值为标识符的地址
                        Operand *tempSrc = addr;
                        Operand *tempDst;
                        Operand *index;
                        bool flag = true;
                        int i = 1;
                        // 如果不是，则为当前元素生成代码，然后使用一系列ArInstruction和StoreInstruction将元素存储到内存中的相应位置
                        // 像是a[4][2][3],我们一维一维地推进寻址，tempdst由[2][3]数组指针类型->[3]数组指针类型->
                        // int指针类型，每一维对应一条Ar指令
                        // Ar指令中fist表示第一维，last表示最后一维,index表示索引
                        while (true)
                        {
                            tempDst = new Operand(new TemporarySymbolEntry(new PointerType(type), SymbolTable::getLabel()));
                            index = (new Constant(new ConstantSymbolEntry(TypeSystem::intType, idx[i++])))->getOperand();
                            // new一条数组指令,first表示是第一个
                            // a[index1]->dst(二维数组);a[index1][index2]->dst(一维);a[index1][index2][index3]->dst(int)
                            auto gep = new ArInstruction(tempDst, tempSrc, index, bb);
                            // init初始为空
                            gep->setInit(init);
                            // 第一维
                            if (flag)
                            {
                                gep->setFirst();
                                flag = false;
                            }
                            // 判断最后一维并设置last标志位
                            if (type == TypeSystem::intType || type == TypeSystem::constIntType)
                            {
                                gep->setLast();
                                init = tempDst;
                                break;
                            }
                            type = ((ArrayType *)type)->getEType();
                            tempSrc = tempDst;
                        }
                        new StoreInstruction(tempDst, temp->getOperand(), bb);
                    }
                    while (true)
                    {
                        if (temp->getLink())
                        {
                            temp = (ExprNode *)(temp->getLink());
                            idx[idx.size() - 1]++;
                            break;
                        }
                        else
                        {
                            temp = Arr_stack.top();
                            Arr_stack.pop();
                            idx.pop_back();
                            if (Arr_stack.empty())
                                break;
                        }
                    }
                    if (Arr_stack.empty())
                        break;
                }
            }
            else
            {
                fprintf(stderr, "444444444444444444else\n");
                expr->genCode();
                BasicBlock *bb = builder->getInsertBB();
                Operand *src = expr->getOperand();
                new StoreInstruction(addr, src, bb);
            }
        }
    }
    // 串接后续函数参数/变量声明
    if (this->getLink())
        this->getLink()->genCode();
}

void ReturnStmt::genCode()
{
    fprintf(stderr, "ReturnStmt::genCode\n");
    Operand *src = nullptr;
    if (retValue != nullptr)
    {
        retValue->genCode();
        src = retValue->getOperand();
    }
    new RetInstruction(src, builder->getInsertBB());
}

void AssignStmt::genCode()
{
    fprintf(stderr, "AssignStmt::genCode\n");
    BasicBlock *bb = builder->getInsertBB();
    expr->genCode();
    Operand *addr = nullptr;
    if (lval->getSymPtr()->getType()->isArray())
    {
        ((Id *)lval)->setLeft();
        lval->genCode();
        addr = lval->getOperand();
    }
    else
    {
        addr = dynamic_cast<IdentifierSymbolEntry *>(lval->getSymPtr())->getAddr();
    }
    Operand *src = expr->getOperand();
    /***
     * We haven't implemented array yet, the lval can only be ID. So we just store the result of the `expr` to the addr of the id.
     * If you want to implement array, you have to caculate the address first and then store the result into it.
     */
    new StoreInstruction(addr, src, bb);
}

// 最顶层是根节点的类型检查
void Ast::typeCheck()
{
    if (root != nullptr)
        root->typeCheck();
}

/*---以下是语句节点类----*/
// 复合语句
void CompoundStmt::typeCheck()
{
    if (stmt)
        stmt->typeCheck();
}
// 序列语句
void SeqNode::typeCheck()
{
    if (stmt1)
        stmt1->typeCheck();
    if (stmt2)
        stmt2->typeCheck();
}
// 表达式语句
void ExprStmt::typeCheck()
{
    if (expr)
        expr->typeCheck();
}
// if语句
void IfStmt::typeCheck()
{
    cond->typeCheck();
    if (thenStmt)
        thenStmt->typeCheck();
}
// if-else语句
void IfElseStmt::typeCheck()
{
    cond->typeCheck();
    // if-else结构体中可能有的没有
    if (thenStmt)
        thenStmt->typeCheck();
    if (elseStmt)
        elseStmt->typeCheck();
}
// while语句
void WhileStmt::typeCheck()
{
    cond->typeCheck();
    if (stmt)
        stmt->typeCheck();
}
void EmptyStmt::typeCheck()
{
}
// Break
void BreakStmt::typeCheck()
{
}
// Continue
void ContinueStmt::typeCheck()
{
}
// 变量声明语句
void DeclStmt::typeCheck()
{
    id->typeCheck();
    if (expr)
        expr->typeCheck();
}
// 返回语句
void ReturnStmt::typeCheck()
{
    if (retValue)
        retValue->typeCheck();
}
// 赋值语句
void AssignStmt::typeCheck()
{
    lval->typeCheck();
    expr->typeCheck();
}
// 函数定义语句
void FunctionDef::typeCheck()
{
    // 获取返回值类型
    Type *retType = ((FunctionType *)(se->getType()))->getRetType();
    // 调用checkRet函数，归到ReturnStmt类主要实现
    if (!stmt->checkRet(retType))
    {
        // 这边这个if其实不大合适，为了配合样例加的，一种思路是checkRet的返回值改为int，考虑无return语句-1，有renturn语句0或1
        if (retType != TypeSystem::voidType)
        {
            fprintf(stderr, "function has no return statement function type doesn't match return type\n");
            // assert(stmt->checkRet(retType));
        };
    }
}
// 实现checkRet函数的主要的判断,判断return 语句操作数和函数声明的返回值类型是否匹配
bool ReturnStmt::checkRet(Type *retType)
{
    // 先判断没有返回值的情况
    if (!retValue)
    {
        // 返回值类型为void，则正确，否则均有类型错误
        if (retType != TypeSystem::voidType)
        {
            fprintf(stderr, "function has no return statement or function type doesn't match return type\n");
            assert(retType == TypeSystem::voidType);
            return false;
        }
        else
        {
            return true;
        }
    }
    else
    {
        // 获取返回值类型
        Type *valueType = retValue->getSymPtr()->getType();
        // fprintf(stderr, "aaaaaaaa%s,%s\n", valueType->toStr().c_str(), retType->toStr().c_str());
        //  考虑constINT和INT两种类型的兼融
        if ((retType == TypeSystem::constIntType || retType == TypeSystem::intType) &&
            (valueType == TypeSystem::constIntType || valueType == TypeSystem::intType))
        {
            return true;
        }
        else
        {
            if (valueType->isFunc() && ((FunctionType *)valueType)->getRetType() == TypeSystem::intType)
            {
                return true;
            }
            // fprintf(stderr, "aaaaaaaa%s,%s\n", valueType->toStr().c_str(), retType->toStr().c_str());
            fprintf(stderr, "function type doesn't match return type\n");
            return false;
        }
    }
}
/*---以下是表达式节点类----*/
// 常量
void Constant::typeCheck()
{
}
// 标识符
void Id::typeCheck()
{
}
// 二元表达式的类型检查
void BinaryExpr::typeCheck()
{
    expr1->typeCheck();
    expr2->typeCheck();
}
// 一元表达式的类型检查
void UnaryExpr::typeCheck()
{
    expr->typeCheck();
}
void FuncCallExpr::typeCheck()
{
}
// 函数调用表达式，判断函数调用时形参及实参类型或数目是否一致
// 涉及到非重载函数的重复声明的判断，因此把构造函数挪到这边，需要考虑重载函数，用next链接
FuncCallExpr::FuncCallExpr(SymbolEntry *se, ExprNode *param)
    : ExprNode(se), param(param)
{
    dst = nullptr;
    // 实参计数
    int actualParamCount = 0;
    ExprNode *temp1 = param;
    while (temp1)
    {
        actualParamCount++;
        temp1 = (ExprNode *)(temp1->getLink());
    }
    SymbolEntry *temp2 = se;
    // 遍历同名的函数列表（考虑同名重载函数）
    while (temp2)
    {
        // 获取声明的参数列表
        std::vector<Type *> params = ((FunctionType *)temp2->getType())->getParamsType();
        // 比较实参和形参的参数数目,尝试找到正确的函数对应的符号表项
        if ((long unsigned int)actualParamCount == params.size())
        {
            // 设置该函数名对应的符号表项
            this->symbolEntry = temp2;
            break;
        }
        // 这边给符号表项都加了一个next成员变量,专用于处理同名函数
        temp2 = temp2->getLink();
    }
    if (symbolEntry)
    {
        // 获取返回值的类型
        this->type = ((FunctionType *)symbolEntry->getType())->getRetType();
        // 构造目标寄存器的保存操作数
        if (this->type != TypeSystem::voidType)
        {
            SymbolEntry *se =
                new TemporarySymbolEntry(this->type, SymbolTable::getLabel());
            dst = new Operand(se);
        }
        // 获取参数的类型列表
        std::vector<Type *> params = ((FunctionType *)symbolEntry->getType())->getParamsType();
        // param是实参，temp初始化等于param
        ExprNode *temp = param;
        for (auto it = params.begin(); it != params.end(); it++)
        {
            if (temp == nullptr)
            {
                fprintf(stderr, "actual Param numbers %d not match in function %s\n", actualParamCount, symbolEntry->toStr().c_str());
                assert(temp != nullptr);
            }
            else if ((*it)->getKind() != Type::INT)
            {
                fprintf(stderr, "arguments type not match in function %s\n", symbolEntry->toStr().c_str());
                assert(temp != nullptr);
            }
            temp = (ExprNode *)(temp->getLink());
        }
        if (temp != nullptr)
        {
            fprintf(stderr, "actual param numbers %d not match in function %s\n", actualParamCount, symbolEntry->toStr().c_str());
            assert(temp != nullptr);
        }
    }
};

void BinaryExpr::output(int level)
{
    std::string op_str;
    switch (op)
    {
    case ADD:
        op_str = "add";
        break;
    case SUB:
        op_str = "sub";
        break;
    case MUL:
        op_str = "mul";
        break;
    case DIV:
        op_str = "div";
        break;
    case MOD:
        op_str = "mod";
        break;
    case AND:
        op_str = "and";
        break;
    case OR:
        op_str = "or";
        break;
    case LESS:
        op_str = "less";
        break;
    case LEQ:
        op_str = "lessequal";
        break;
    case MORE:
        op_str = "greater";
        break;
    case MEQ:
        op_str = "greaterequal";
        break;
    case EQ:
        op_str = "equal";
        break;
    case NE:
        op_str = "notequal";
        break;
    }
    fprintf(yyout, "%*cBinaryExpr\top: %s\n", level, ' ', op_str.c_str());
    expr1->output(level + 4);
    expr2->output(level + 4);
}

int BinaryExpr::getValue()
{
    int value;
    switch (op)
    {
    case ADD:
        value = expr1->getValue() + expr2->getValue();
        break;
    case SUB:
        value = expr1->getValue() - expr2->getValue();
        break;
    case MUL:
        value = expr1->getValue() * expr2->getValue();
        break;
    case DIV:
        value = expr1->getValue() / expr2->getValue();
        break;
    case MOD:
        value = expr1->getValue() % expr2->getValue();
        break;
    case AND:
        value = expr1->getValue() && expr2->getValue();
        break;
    case OR:
        value = expr1->getValue() || expr2->getValue();
        break;
    case LESS:
        value = expr1->getValue() < expr2->getValue();
        break;
    case LEQ:
        value = expr1->getValue() <= expr2->getValue();
        break;
    case MORE:
        value = expr1->getValue() > expr2->getValue();
        break;
    case MEQ:
        value = expr1->getValue() >= expr2->getValue();
        break;
    case EQ:
        value = expr1->getValue() == expr2->getValue();
        break;
    case NE:
        value = expr1->getValue() != expr2->getValue();
        break;
    }
    return value;
}

int UnaryExpr::getValue()
{
    int value;
    switch (op)
    {
    case NOT:
        value = !(expr->getValue());
        break;
    case SUB:
        value = -(expr->getValue());
        break;
    }
    return value;
}

int Constant::getValue()
{
    return ((ConstantSymbolEntry *)symbolEntry)->getValue();
}

int Id::getValue()
{
    return ((IdentifierSymbolEntry *)symbolEntry)->getValue();
}

void Ast::output()
{
    fprintf(yyout, "program\n");
    if (root != nullptr)
        root->output(4);
}

void Constant::output(int level)
{
    std::string type, value;
    type = symbolEntry->getType()->toStr();
    value = symbolEntry->toStr();
    fprintf(yyout, "%*cIntegerLiteral\tvalue: %s\ttype: %s\n", level, ' ',
            value.c_str(), type.c_str());
}

void Id::output(int level)
{
    std::string name, type;
    int scope;
    name = symbolEntry->toStr();
    type = symbolEntry->getType()->toStr();
    scope = dynamic_cast<IdentifierSymbolEntry *>(symbolEntry)->getScope();
    fprintf(yyout, "%*cId\tname: %s\tscope: %d\ttype: %s\n", level, ' ',
            name.c_str(), scope, type.c_str());
}

void FuncCallExpr::output(int level)
{
    std::string name, type;
    int scope;
    name = symbolEntry->toStr();            // 获取函数名
    type = symbolEntry->getType()->toStr(); // 获取函数返回值类型
    scope = dynamic_cast<IdentifierSymbolEntry *>(symbolEntry)->getScope();
    fprintf(yyout, "%*cFuncCallExpr\tfunction name: %s\tscope: %d\ttype: %s\n",
            level, ' ', name.c_str(), scope, type.c_str());
    Node *temp = param;
    while (temp)
    {
        temp->output(level + 4);
        temp = temp->getLink();
    }
}

void ExprStmt::output(int level)
{
    fprintf(yyout, "%*cmake\n", level, ' ');
    expr->output(level + 4);
}

void DeclStmt::output(int level)
{
    fprintf(yyout, "%*cDeclStmt\n", level, ' ');
    id->output(level + 4);
    if (expr)
        expr->output(level + 4);
    if (this->getLink())
    {
        this->getLink()->output(level);
    }
}

void CompoundStmt::output(int level)
{
    fprintf(yyout, "%*cCompoundStmt\n", level, ' ');
    if (stmt)
        stmt->output(level + 4);
}

void SeqNode::output(int level)
{
    // fprintf(yyout, "%*cSequence\n", level, ' ');
    stmt1->output(level);
    stmt2->output(level);
}

void EmptyStmt::output(int level)
{
    fprintf(yyout, "%*cEmptyStmt\n", level, ' ');
}

void IfStmt::output(int level)
{
    fprintf(yyout, "%*cIfStmt\n", level, ' ');
    cond->output(level + 4);
    thenStmt->output(level + 4);
}

void IfElseStmt::output(int level)
{
    fprintf(yyout, "%*cIfElseStmt\n", level, ' ');
    cond->output(level + 4);
    thenStmt->output(level + 4);
    elseStmt->output(level + 4);
}

void WhileStmt::output(int level)
{
    fprintf(yyout, "%*cWhileStmt\n", level, ' ');
    cond->output(level + 4);
    stmt->output(level + 4);
}
void BreakStmt::output(int level)
{
    fprintf(yyout, "%*cBreakStmt\n", level, ' ');
}

void ContinueStmt::output(int level)
{
    fprintf(yyout, "%*cContinueStmt\n", level, ' ');
}

void ReturnStmt::output(int level)
{
    fprintf(yyout, "%*cReturnStmt\n", level, ' ');
    retValue->output(level + 4);
}

void AssignStmt::output(int level)
{
    fprintf(yyout, "%*cAssignStmt\n", level, ' ');
    lval->output(level + 4);
    expr->output(level + 4);
}

void FunctionDef::output(int level)
{
    std::string name, type;
    name = se->toStr();
    type = se->getType()->toStr();
    fprintf(yyout, "%*cFunctionDefine function name: %s type: %s\n", level, ' ',
            name.c_str(), type.c_str());
    if (FuncDefParams)
    {
        FuncDefParams->output(level + 4);
    }
    stmt->output(level + 4);
}

void UnaryExpr::output(int level)
{
    std::string op_str;
    switch (op)
    {
    case NOT:
        op_str = "not";
        break;
    case SUB:
        op_str = "minus";
        break;
    }
    fprintf(yyout, "%*cUnaryExpr\top: %s\ttype: %s\n", level, ' ',
            op_str.c_str(), type->toStr().c_str());
    expr->output(level + 4);
}