#include <stdint.h>

#define VRAM_ADR    0x900 // VRAM先頭アドレス
#define VAR_ADR     0x800 // 変数格納アドレス

int16_t usr_calc(int16_t val, int8_t* mem) {
    int16_t* p = mem + VAR_ADR;
    int16_t data = *(p+val);
    return data;
}



