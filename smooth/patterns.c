#include <stdint.h>

#define PCG_OFFSET   0x700

uint16_t patterns(uint16_t val, uint8_t* mem) {
	uint8_t* pcg_addr = mem + PCG_OFFSET;
 
	uint8_t bits[8] = {24,24,36,52,189,189,255,90};
	for(int j=0; j<8; j++){
		for(int i=0; i<8; i++){
			*(pcg_addr + i + j*8) = bits[i] >> j;
			*(pcg_addr + 40 + i + j*8) = bits[i] << (8-j);
		}
	}
	return 0;	
}



