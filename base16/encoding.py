def write_base16(file, format, data):
    b1 = 64+(data>>4)
    b2 = 64+(data & 0xf)
    file.write(chr(b1)),
    file.write(chr(b2)),
