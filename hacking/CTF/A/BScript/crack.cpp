#include <iostream>
#include <fstream>
#include <cstring>
#include <vector>
#include <stdlib.h>
using namespace std;
int main()
{
    for (int i = 0; i < 804; i++)
    {
        char fname[20] = "BScript\\";
        char s[20];
        memset(s, 0, sizeof(s));
        itoa(i, s, 10);
        strcat(fname, s);
        strcat(fname, ".exe");
        char s2[100];
        memset(s2, 0, sizeof(s2));
        FILE *fr = NULL;
        fr = fopen(fname, "rb");
        fseek(fr,0,SEEK_END);
        int size = ftell(fr);
        //printf("%X",size);
        if (size == 48643)
        {
            fseek(fr, 0x1C40, SEEK_SET);
            fread(&s2, 1, 0x40, fr);
            fclose(fr);
            FILE *NewFile = NULL;
            NewFile = fopen("new", "ab");
            for (int i = 0x40 - 1; i >= 0; i--)
                fwrite(&s2[i], 1, 1, NewFile);
        }
        else if (size == 48625)
        {
            fseek(fr, 0x1C20, SEEK_SET);
            fread(&s2, 1, 0x20, fr);
            fclose(fr);
            FILE *NewFile = NULL;
            NewFile = fopen("new", "ab");
            for (int i = 0; i < 0x20; i++)
                fwrite(&s2[i], 1, 1, NewFile);
        }
    }
    system("pause");
}
