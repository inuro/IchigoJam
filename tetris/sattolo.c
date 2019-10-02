#include <stdlib.h>

#define ARRAY_OFFSET   0x800 //ARRAY offset


int usr_calc(int val, char* mem){
	int offset = mem + ARRAY_OFFSET;
	for(int i=7; i>1; i--){
		int* a = offset + i-1;
		int* b = offset + _rand_r() % i;
		
		int t = *(a);
		*(a) = *(b);
		*(b) = t;
	}
}

		
