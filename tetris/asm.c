#include <stdio.h>

int func1(int *a)
{
    int ret = 0;
    __asm__ __volatile__ (
        "mov r1, #99;"
	"str r1, [%1];"
        "mov %0, #88;"
	: "=r"(ret)
        : "r"(*a)        // Input operands
        :               // Overwritten registers
    );
   return ret;
}

