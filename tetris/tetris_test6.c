/**
  both show&hide
  
  val should be: 00tttrrd
    d:  display or erase flag.1=display 0=erase
    t:  tetromino_type. 0~6
    r:  tetromino rotate. 0~3
    val = t<<3 + r<<1 + d
*/


#include <stdint.h>

//store patterns on BASIC array( [0]- 

#define VRAM_OFFSET   0x900 //VRAM offset
#define VARS_OFFSET   0x800 //Variables offset

//val must be: tetromino_type<<2 + rotate_pattern
uint16_t usr_calc(uint16_t val, uint8_t* mem) {
    //flattern every pattern of tetrominoes
    //block[0]=0x1596; block[1]=0x4596; block[2]=0x526A; block[3]=0x4156;
    uint8_t* vram_addr = mem + VRAM_OFFSET;
    uint16_t* block_addr = mem + VARS_OFFSET;
    int16_t block = *(block_addr + val>>1);

    int x = 10;
    int y = 10;
    for(int i=0; i<4; i++){
        int b = (block >> (i*4)) & 3;
        int a = (block >> (i*4+2)) & 3;
        *(vram_addr + (x + a) + (y + b) * 32) = 248;
    }
    return block;
}
