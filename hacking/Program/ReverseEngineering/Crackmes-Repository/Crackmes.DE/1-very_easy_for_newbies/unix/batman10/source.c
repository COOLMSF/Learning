#include<stdio.h>
#include<locale.h>
#include<stdint.h>

typedef struct Bool {
    int a;
} bool;

// WARNING: Variable defined which should be unmapped: var_ch

int main(void)
{
    uint32_t uVar1;
    uint32_t *puVar2;
    uint32_t *puVar3;
    uint32_t *puVar4;
    int32_t iVar5;
    uint32_t uVar6;
    uint32_t uVar7;
    uint32_t *puVar8;
    int32_t iVar9;
    int32_t in_GS_OFFSET;
    int bVar10;
    uint8_t uVar11;
    uint32_t auStack1020 [125];
    uint32_t auStack520 [125];
    int32_t iStack20;
    int32_t var_ch;
    
    // [13] -r-x section size 882 named .text
    uVar11 = 0;
    puVar8 = auStack1020;
    iStack20 = *(int32_t *)(in_GS_OFFSET + 0x14);
    setlocale(6, ".OCP");
    iVar5 = 0x7d;
    puVar4 = auStack1020;
    while (iVar5 != 0) {
        iVar5 = iVar5 + -1;
        *puVar4 = 0;
        puVar4 = puVar4 + (uint32_t)uVar11 * 0x3ffffffe + 1;
    }
    iVar5 = 0x7d;
    puVar4 = auStack520;
    while (iVar5 != 0) {
        iVar5 = iVar5 + -1;
        *puVar4 = 0;
        puVar4 = puVar4 + (uint32_t)uVar11 * 0x3ffffffe + 1;
    }
    puVar4 = auStack520;
//    uVar1 = 
//            sym.imp.std::basic_ostream_char__std::char_traits_char_____std::operator____std::char_traits_char____std::basic_ostream_char__std::char_traits_char______char_const
              //        (reloc.std::cout, "Name:");

    printf("Name:\n");
    scanf("%s", puVar8);

    puts("Password:");
    scanf("%s", puVar4);

    puVar3 = puVar8;
    do {
        puVar2 = puVar3;
        uVar6 = *puVar2 + 0xfefefeff & ~*puVar2;
        uVar7 = uVar6 & 0x80808080;
        puVar3 = puVar2 + 1;
    } while (uVar7 == 0);
    bVar10 = (uVar6 & 0x8080) == 0;
    uVar11 = (uint8_t)uVar7;
    if (bVar10) {
        uVar11 = (uint8_t)(uVar7 >> 0x10);
    }
    if (bVar10) {
        puVar3 = (uint32_t *)((int32_t)puVar2 + 6);
    }
    iVar5 = (int32_t)puVar3 + ((-3 - (uint32_t)(uVar11)) - (int32_t)puVar8);
    puVar3 = puVar4;
    do {
        puVar2 = puVar3;
        uVar6 = *puVar2 + 0xfefefeff & ~*puVar2;
        uVar7 = uVar6 & 0x80808080;
        puVar3 = puVar2 + 1;
    } while (uVar7 == 0);
    bVar10 = (uVar6 & 0x8080) == 0;
    uVar11 = (uint8_t)uVar7;
    if (bVar10) {
        uVar11 = (uint8_t)(uVar7 >> 0x10);
    }
    if (bVar10) {
        puVar3 = (uint32_t *)((int32_t)puVar2 + 6);
    }
    iVar9 = (int32_t)puVar3 + ((-3 - (uint32_t)(uVar11)) - (int32_t)puVar4);
    if (iVar5 < 1) {
        iVar5 = 0;
    } else {
        puVar3 = (uint32_t *)(iVar5 + (int32_t)puVar8);
        iVar5 = 0;
        do {
            uVar11 = *(uint8_t *)puVar8;
            puVar8 = (uint32_t *)((int32_t)puVar8 + 1);
            iVar5 = iVar5 + (char)(uVar11 ^ 0x47);
        } while (puVar8 != puVar3);
    }
    if (iVar9 < 1) {
        iVar9 = 0;
    } else {
        puVar8 = (uint32_t *)(iVar9 + (int32_t)puVar4);
        iVar9 = 0;
        do {
            uVar11 = *(uint8_t *)puVar4;
            puVar4 = (uint32_t *)((int32_t)puVar4 + 1);
            iVar9 = iVar9 + (char)(uVar11 ^ 0x42);
        } while (puVar4 != puVar8);
    }
    if (iVar5 == iVar9) {
        /*
        uVar1 = 
                sym.imp.std::basic_ostream_char__std::char_traits_char_____std::operator____std::char_traits_char____std::basic_ostream_char__std::char_traits_char______char_const
                          (reloc.std::cout, "Good!");
        
        sym.imp.std::basic_ostream_char__std::char_traits_char_____std::endl_char__std::char_traits_char____std::basic_ostream_char__std::char_traits_char
                  (uVar1);
                  */
        puts("good");
    } else {
        /*
        uVar1 = 
                sym.imp.std::basic_ostream_char__std::char_traits_char_____std::operator____std::char_traits_char____std::basic_ostream_char__std::char_traits_char______char_const
                          (reloc.std::cout, "Bad!");
        
        sym.imp.std::basic_ostream_char__std::char_traits_char_____std::endl_char__std::char_traits_char____std::basic_ostream_char__std::char_traits_char
                  (uVar1);
                  */
        puts("bad");
    }
}
