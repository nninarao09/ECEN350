/* main.c simple program to test assembler program */

#include <stdio.h>

//extern long long int test(long long int a, long long int b);
extern long long int lab03b(long long int c);
extern long long int lab03c(long long int d);



int main(void)
{
    //long long int a = test(3, 5);
    //printf("Result of test(3, 5) = %ld\n", a);
    int c = lab03b(38);
    printf("Result of lab03b is = %ld\n", c);
    int d = lab03c(38);
    printf("Result of lab03c is = %ld\n", d);
    
    return 0;
}
