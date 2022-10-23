#include <stdio.h>
int main()
{
    int a, b, i, n;
    a = 0;
    b = 1;
    i = 1;
    printf("please input the number of Fibonacci: ");
    scanf("%d", &n);
    while (i < n)
    {
        int t = b;
        b = a + b;
        printf("fibo: %d\n", b);
        a = t;
        i = i + 1;
    }
    int m[2][2] = {{2, 0}, {2, 2}};
    putarray(4, m); // 2 0 2 2
    return 0;
}