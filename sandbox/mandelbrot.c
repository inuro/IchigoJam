#include <stdint.h>

int mandelbrot(int16_t arg, uint8_t* ram, const uint8_t* font)
{
    (void)arg; (void)font;
    int n = 32;
    int w = 64, h = 48;
    int a = 2 << 6, b = a * a, c = (3 << 12) / w;
    for (int y = 0; y < h; y++) {
        int v = (y - h / 2) * c;
        for (int x = 0; x < w; x++) {
            int u = (x - (w * 3) / 4) * c;
            uint8_t* z = &ram[0x900 + (x / 2) + (y / 2) * 32];
            int j = 1 << ((y % 2) * 2 + (x % 2));
            int k = j | 0x80 | *z;
            *z = k;
            int p = u, q = v, i = 0;
            do {
                int r = p / 64; p = r * r; if (p < 0) goto l40;
                int s = q / 64; q = s * s; if (q < 0) goto l40;
                if (p + q < 0 || p + q > b) goto l40;
                p = p - q + u;
                q = 2 * r * s + v;
            } while (++i < n);
            *z = k ^ j;
          l40:;
        }
    }
    return 0;
}
