#include <stdint.h>

#define ARRAY_OFFSET   0x800 //ARRAY offset


int16_t usr_calc(int16_t val, uint8_t* mem) {
    uint16_t* block_addr = mem + ARRAY_OFFSET;
    int var[4];
    for(int i=0;i<4;i++){
        var[i] = *(block_addr + 123 + i);
    }
    return var[0] + var[1] + var[2] + var[3];
}


