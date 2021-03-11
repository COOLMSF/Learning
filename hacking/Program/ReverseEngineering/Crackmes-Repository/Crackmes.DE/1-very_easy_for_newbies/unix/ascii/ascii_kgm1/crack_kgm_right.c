#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>

int getchar(void)
{
    int r = 0;
 
    r = 0x21 + (rand() % 0x59);

    return r;    
}

int main(void)
{
    srand(time(NULL));
    int found = 0;
    int iter = 0; 
    int key[8]  =   {0x45, 0x36, 0xab, 0xc8, 
                     0xcc, 0x11, 0xe3, 0x7a};
    do  {
            iter += 1;
            int start_array[8] = {0};

            for(int i = 0; i < 8; i++)
            {
                start_array[i] = getchar();
            }

            int out_array[8] = {0};

            // xor the two arrays
            for(int j = 0; j < 8; j++)
            {
                out_array[j] = start_array[j] ^ key[j];
            }

            int8_t total = 0;
        
            // get the total
            for(int k = 0; k < 8; k++)
            {
                total += out_array[k];
            }
        
     total = total & 0xFF;

            // only print valid keys 
     if(total > 0x51 && total < 0x7a)
     {
                // found valid key
                printf("Found valid key on iteration %i!\n", iter);

                found = 1;

                // print key
         for(int x = 0; x < 8; x++)
         {
      printf("%c", start_array[x]);
         }

                // print final character
         printf("%c\n", total);
     } 
        } while(found != 1);

    return 0;
}
