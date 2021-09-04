#include<stdio.h>
#include<unistd.h>

#define LEN 0x10

int encrypt(char * encrypt_buf, char * data_read_from_stdin, int len);
int compare(char * encrypt_buf, int len);

int
main(void) {
    char encrypt_buf[LEN];
    char data_read_from_stdin[LEN];

    puts("Welcome to this little challenge");
    puts("Developed by Binary Newbie !!!");
    puts("Enter a serial: ");
    read(0, data_read_from_stdin, LEN);

    encrypt(encrypt_buf, data_read_from_stdin, LEN);

    if (compare(encrypt_buf, LEN)) {
        puts("OK");
    } else {
        puts("Not valid");
    }
}

int encrypt(char *encrypt_buf, char * data_read_from_stdin, int len) {
    for (int i = 0; i < len; i++) {
        int data = data_read_from_stdin[i];

        if (data >= 0x30 && data <= 0x39) {
            data -= 0x30;
        } else if (data >= 0x41 && data <= 0x46) {
            data -= 0x41;
        } else if (data >= 0x61 && data <= 0x66) {
            data -= 0x61;
        } else
            return 0;

        encrypt_buf[i] = data;
    }
}

int compare(char * encrypt_buf, int len) {
    for (int i = 0; i < len; i++) {
        int data = encrypt_buf[i];
        int data1;

        if (data == 1) {
            data1 = data;
            data ^= 0xdead;
            data &= 0xbabe;
            data >>= 4;
            data += data1;
            
            if (data == 0x1998)
                continue;
            else 
                return 0;
        }

    }
}
