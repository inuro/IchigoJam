class Base128:
    __index = 0
    __byte_count = 0
    __reminder = 0
    
    #encoding (using 0x30~0x7A and 0xAB~0xDF)
    #update: for Hankaku_Kana, using 0xFF6B~0xFF9F
    def __encode(self, val):
        if val < 75:
            code = val + 0x30
        else:
            code = val + 0xFF20
        return unichr(code).encode('utf-8')
    
    #actual writing method
    def __write(self, file, val):
        str = self.__encode(val)
        #print('-> %s %d %s' % (format(val,'07b'), val, str))
        file.write(str),
        
    #public interface
    def write_base128(self, file, data):
        #print ('{} {} '.format(self.__byte_count, self.__index)),
        #divide & combine to align 7bit
        val = data >> (self.__index + 1) 
        #print ('%s %s %s ' % ( format(data,'02x'),format(data,'08b'), format(val,'07b'))),

        #write val 
        #if on the 7bit border write reminder
        #else combine devided val with reminder
        val_to_write = 0
        if self.__index == 0 and self.__byte_count > 0:
            self.__write(file, self.__reminder)
            val_to_write = val
        else:
            val_to_write = (val | self.__reminder)
        #print ('%s %s' % (format(self.__reminder,'07b'), format(val_to_write,'07b'))),
        self.__write(file, val_to_write)
        
        #calcurate reminder and update index
        reminder_shift = 6 - self.__index
        self.__reminder = (data & (0x7f >> reminder_shift)) << reminder_shift
        self.__index = (self.__index + 1) % 7
        self.__byte_count = self.__byte_count + 1
        
    #don't forget to write the last reminder at the end of the file
    def reminded_char(self):
        return self.__encode(self.__reminder)
    
    #total bytes processed
    def bytes(self):
        return self.__byte_count




base128 = Base128()
while True:
    byte = in_file.read(1)
    if byte == '':
    base128.write_base128(out_file, ord(byte))
out_file.write(base128.reminded_char())
