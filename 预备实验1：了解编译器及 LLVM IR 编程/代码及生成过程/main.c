#include <stdio.h>
#include <time.h>
//宏定义
#define MAX 32
clock_t start, stop; // clock_t为clock()函数返回的变量类型
int main()
{
    scanf("%d", &n);
    while (n--)
    {
        double duration;
        start = clock();
        int a, b, i, t, n, book = 0;
        a = 0;
        b = 1;
        i = 1;

        //死代码
        if (0 == 1)
            printf("error");
        // 斐波那契数列
        for (book = 0; book < Max; book++)
        {
            printf("success\n");
            printf("%d\n", a);
            printf("%d\n", b);
            while (Max)
            {
                t = b;
                b = a + b;
                printf("%d\n", b);
                a = t;
                i = i + 1;
                book++;
            }
        }
    }
    stop = clock();
    duration = (double)(stop - start) / CLOCKS_PER_SEC;
    printf("程序运行时间为：");
    printf("%f\n", duration);
    return 0;
}