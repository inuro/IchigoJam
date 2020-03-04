#include <stdint.h>

<<<<<<< HEAD
//store patterns on BASIC array( [0]- 

#define VRAM_OFFSET   0x900 //VRAM offset
#define ARRAY_OFFSET   0x800 //ARRAY offset

=======
//  [0]-[27]: block patterns
//  LET[0],#1596,#4596,#526A,#4156,#159A,#4856,#126A,#4526,#1592,#456A,#926A,#456,#156A,#8596,#156A,#8596,#5926,#156,#5926,#156,#159D,#89AB,#159D,#89AB,#596A,#596A,#596A,#596A



//  X:  x position of left of block area(4x4)
//  Y:  y position of top of block area(4x4)
//  B:  block type (0~6)
//  R:  rotation (0~3, counter-clockwise)

#define VRAM_OFFSET   0x900 //VRAM offset
#define ARRAY_OFFSET   0x800 //ARRAY offset
>>>>>>> 7f9af141ea2a129f6a04ad9c987db78ff83cc4df
//vals offsets
#define B_OFFSET  0x8ce
#define R_OFFSET  0x8ee
#define X_OFFSET  0x8fa
#define Y_OFFSET  0x8fc
<<<<<<< HEAD
#define Z_OFFSET  0x8fe

//val must be: tetromino_type<<2 + rotate_pattern
uint16_t usr_calc(uint16_t val, uint8_t* mem) {
    //flattern every pattern of tetrominoes
    //block[0]=0x1596; block[1]=0x4596; block[2]=0x526A; block[3]=0x4156;
    uint8_t* vram_addr = mem + VRAM_OFFSET;
    uint16_t* block_addr = mem + ARRAY_OFFSET;
    //int16_t block = *(block_addr + val);
=======

//  val:  charactor code to be displayed. 0 means clean up
uint16_t usr_calc(uint16_t val, uint8_t* mem) {
    uint8_t* vram_addr = mem + VRAM_OFFSET;
    uint16_t* block_addr = mem + ARRAY_OFFSET;
>>>>>>> 7f9af141ea2a129f6a04ad9c987db78ff83cc4df

    int x = *(mem + X_OFFSET);
    int y = *(mem + Y_OFFSET);
    int b = *(mem + B_OFFSET);//block_type
    int r = *(mem + R_OFFSET);//rotation
    int block_offset = b * 4 + r;
    int block = *(block_addr + block_offset);
<<<<<<< HEAD
=======
  
>>>>>>> 7f9af141ea2a129f6a04ad9c987db78ff83cc4df
    for(int i=0; i<4; i++){
        int b = (block >> (i*4)) & 3;
        int a = (block >> (i*4+2)) & 3;
        *(vram_addr + (x + a) + (y + b) * 32) = val;
    }
    return block_offset;
}
