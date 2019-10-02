#include <stdint.h>

#define VRAM_BASE   0x900
#define X_ADDR      0x8fa
#define Y_ADDR      0x8fc

void draw(int8_t x, int8_t y, int16_t val, int16_t chrcode, char*mem);

int16_t usr_calc(int16_t val, char* mem) {
    int8_t x = mem[X_ADDR];
    int8_t y = mem[Y_ADDR];
    //draw(x,y,val,0,mem);
    draw(x,y,val,248,mem);
    return 0;
}

void draw(int8_t x, int8_t y, int16_t val, int16_t chrcode, char* mem){
    int16_t block[28];
    block[0]=0x1596; block[1]=0x4596; block[2]=0x526A; block[3]=0x4156;
    block[4]=0x159A; block[5]=0x4856; block[6]=0x126A; block[7]=0x4526;
    block[8]=0x1592; block[9]=0x456A; block[10]=0x926A; block[11]=0x456;
    block[12]=0x156A; block[13]=0x8596; block[14]=0x156A; block[15]=0x8596;
    block[16]=0x5926; block[17]=0x156; block[18]=0x5926; block[19]=0x156;
    block[20]=0x159D; block[21]=0x89AB; block[22]=0x159D; block[23]=0x89AB;
    block[24]=0x596A; block[25]=0x596A; block[26]=0x596A; block[27]=0x596A;

    for(int8_t i=0; i<4; i++){
        int8_t b = (block[val] >> (i*4)) & 3;
        int8_t a = (block[val] >> (i*4+2)) & 3;
        mem[VRAM_BASE + (x + a) + (y + b) * 32] = chrcode;
    }
}
