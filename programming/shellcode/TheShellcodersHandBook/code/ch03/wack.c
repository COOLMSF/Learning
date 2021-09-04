#include<stdint.h>

#define _BUFFER_SIZE 10
const uint8_t buffer[_BUFFER_SIZE] = {
      0x31, 0xdb, 0xb0, 0x01, 0xcd, 0x80, 0xff, 0xff, 0xff, 0xff
          
};

int main()
{

  int *ret;
  ret = (int *)&ret + 2;
  (*ret) = (long int)buffer;
}
