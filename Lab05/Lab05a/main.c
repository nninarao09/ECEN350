/* main.c simple program to test assembler program */

#include <stdio.h>

extern long long int test(long long int a, long long int b);
extern long long int test2(long long int d, long long int e);

int main(void)
{
    long long int c = test(7, 5);
    printf("Result of test(7, 5) = %d\n", c);
    long long int f = test2(6, 5);
    //printf("The ouptut of test2(6,5) without editing the main is = %d\n", f);
    return 0;
}
