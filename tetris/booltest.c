#include <stdint.h>
#include <stdbool.h>

int main(int val, char* mem){
	bool flag = false;
	for(int i=0; i<8; i++){
		int x = *(mem + i);
		flag |= x;
	}
	return (int)flag;	
}


