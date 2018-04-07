#include <stdint.h>

//store patterns on BASIC array( [0]- )

//val must be: tetromino_type<<2 + rotate_pattern
int16_t usr_calc(int16_t val, char* mem) {
    //flattern every pattern of tetrominoes
    //block[0]=0x1596; block[1]=0x4596; block[2]=0x526A; block[3]=0x4156;
    int16_t* bp = (int16_t*)&mem[0x800+val];
    int16_t block = *bp;

    int x = 10;
    int y = 10;
    for(int i=0; i<4; i++){
        int b = (block >> (i*4)) & 3;
        int a = (block >> (i*4+2)) & 3;
        mem[0x900 + (x + a) + (y + b) * 32] = 248;
    }
    return 0;
}
