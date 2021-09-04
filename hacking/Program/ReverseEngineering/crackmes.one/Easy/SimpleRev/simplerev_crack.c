#include<stdio.h>
#include<string.h>

int
main(void) {
    char text[] = "killshadow";
    char key[]  = "adsfkndcls";
    int len = strlen(key);

    char input;
    char str2[len];
    int var1 = 0;

    for (int var48=0; var48<len; var48++) {
        for (int input=65; input<91; input++) {
            var1 = input - key[var48 % len] + 0x3a;
            if (text[var48] == var1 + (var1 / 0x1a) * -0x1a + 'a') {
                putchar(input);
                break;
            }
        }
    }

}
