#include <stdint.h>
int16_t usr_calc(int16_t val, char* mem) {
    int x_addr = 0x8fa;
        int x = mem[x_addr];
    int y = mem[x_addr+1];
    int c = 224 + x % 8;
    int flag = 0;

    for(int i = 0; i < 2; i++){
        if (mem[0x900 + x / 8 + y * 32 + i] == 0) {
            mem[0x900 + x / 8 + y * 32 + i] = c + i * 8;
            flag += (0xff<<(8*(1-i)));
        }
    }
    flag = ~flag & (0xff00 >> x % 8);
        return flag;
}
