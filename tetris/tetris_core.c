#include <stdint.h>
#include <stdbool.h>

// implement collision check

//  [0]-[27]: block patterns
//    LET[0],#1596,#4596,#526A,#4156,#159A,#4856,#126A,#4526,#1592,#456A,#926A,#456,#156A,#8596,#156A,#8596,#5926,#156,#5926,#156,#159D,#89AB,#159D,#89AB,#596A,#596A,#596A,#596A
//  X:  x position of left of block area(4x4)
//  Y:  y position of top of block area(4x4)
//  B:  block type (0~6)
//  R:  rotation (0~3, counter-clockwise)

#define VRAM_OFFSET   0x900 //VRAM offset
#define ARRAY_OFFSET   0x810 //ARRAY offset - save [0]-[7] for working area
//vals offsets
#define B_OFFSET  0x8ce
#define R_OFFSET  0x8ee
#define X_OFFSET  0x8fa
#define Y_OFFSET  0x8fc

//  val:  charactor code to be displayed. 
//  0:  means clean up
//  -1: means dry run to check collision
//  other number: charactor code
int16_t usr_calc(int16_t val, uint8_t* mem) {
    uint8_t* vram_addr = mem + VRAM_OFFSET;
    uint16_t* block_addr = mem + ARRAY_OFFSET;

    int x = *(mem + X_OFFSET);
    int y = *(mem + Y_OFFSET);
    int b = *(mem + B_OFFSET);//block_type
    int r = *(mem + R_OFFSET);//rotation
    int block_offset = b * 4 + r;
    int block = *(block_addr + block_offset);
    bool collision = false;   //collision flag
    
    for(int i=0; i<4; i++){
        int b = (block >> (i*4)) & 3;
        int a = (block >> (i*4+2)) & 3;
        collision |= (*(vram_addr + (x + a) + (y + b) * 32) != 0);
        if(val >= 0){
            *(vram_addr + (x + a) + (y + b) * 32) = val;
        }
    }
    return (int16_t)collision;
}
