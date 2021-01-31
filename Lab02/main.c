#include<stdio.h>

extern long long int test();
extern long long int lab02b();
extern void lab02c(long long int b);
extern long long int lab02d(long long int a);


int main(void)
{
	test();
	lab02b();
	lab02c(100);
	long long int a = lab02d(100); 
	printf("The address in hex is %x\n", a);
	
    return 0;
}
