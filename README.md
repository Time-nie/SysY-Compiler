# SysY-Compiler
NKU-COSC0017-编译系统原理



#### 一. 预备实验1：了解编译器及 LLVM IR 编程

1. 概述

   通过改进版斐波拉契数列程序在 Ubuntu 虚拟机上对编译器的各个阶段及其功能进行了探索。通过加入宏定义、死代码等部分对编译预处理的功能进行验证，探索了词法 分析和语法分析的过程；通过将 CFG 可视化分析了中间代码生成的多阶段；在代码优化阶段， 对 O1 O3 和不同优化 pass 方法对比，并通过程序性能（运行时间）进行优化验证，为增强结果稳定性，在原始斐波那契程序基础上进行 10000 次循环并取均值。通过反汇编，对比 x86、 arm 和 llvm 汇编和链接结果并得出结论。融合函数、数组、隐式类型转换、9 种运算、“geiint” 和“putint”等 SysY 编译器各语言特性编写 LLVM IR 程序，并用 LLVM 编译成目标程序并 成功执行验证。



#### 二. 预备实验2：定义编译器&汇编编程

1. 概述

   在此次实验中，为了将来完成编译器，我们小组合作确定了我们的编译器支持的 SysY 语 言特性，并参考 SysY 中巴克斯瑙尔范式定义，用上下文无关文法描述了 SysY 语言子集。并根据所选 SysY 语言特性设计了改进版斐波拉契数列和阶乘程序，包含二维数、putarray() 和 getint()  I/O 操作，函数调用、算数运算等十余种 SysY 语言特性，自主编写等价的 ARM 汇 编程序并进行优化，通过解决遇到的栈帧调整、函数调用等困难对 ARM 汇编有了基本掌握， 最后用汇编器生成可执行程序，调试通过并得到正确结果。



#### 三. 预备实验3：熟悉语法分析器生成工具

1. 代码描述

   + expr.y ：表达式计算
   + operator.y ：中缀表达式转后缀表达式
   + expr_plus.y ：通过符号表实现进阶版表达式计算




#### 四. 词法分析器



