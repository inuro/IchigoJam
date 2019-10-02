#include <stdint.h>

//store patterns on BASIC array( [0]- 

#define VRAM_OFFSET   0x900 //VRAM offset
#define ARRAY_OFFSET   0x800 //ARRAY offset

//vals offsets
#define B_OFFSET  0x8ce
#define R_OFFSET  0x8ee
#define X_OFFSET  0x8fa
#define Y_OFFSET  0x8fc
#define Z_OFFSET  0x8fe

//val must be: tetromino_type<<2 + rotate_pattern
uint16_t usr_calc(uint16_t val, uint8_t* mem) {
    //flattern every pattern of tetrominoes
    //block[0]=0x1596; block[1]=0x4596; block[2]=0x526A; block[3]=0x4156;
    uint8_t* vram_addr = mem + VRAM_OFFSET;
    uint16_t* block_addr = mem + ARRAY_OFFSET;
    //int16_t block = *(block_addr + val);

    int x = *(mem + X_OFFSET);
    int y = *(mem + Y_OFFSET);
    int b = *(mem + B_OFFSET);//block_type
    int r = *(mem + R_OFFSET);//rotation
    int block_offset = b * 4 + r;
    int block = *(block_addr + block_offset);
    for(int i=0; i<4; i++){
        int b = (block >> (i*4)) & 3;
        int a = (block >> (i*4+2)) & 3;
        *(vram_addr + (x + a) + (y + b) * 32) = val;
    }
    return block_offset;
}
