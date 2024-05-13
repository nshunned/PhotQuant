#include <stdio.h>
#include <stdint.h>

int main()
{
    
    uint32_t sig32 = 0x01230ABC;
    uint32_t *sig32_ptr = &sig32;
    
    printf("sig32:                          0x%08X\n", sig32);
    printf("sig32_ptr:                      0x%08X\n", sig32_ptr);
    printf("sig32 & 0x0000FFFF:             0x%08X\n", sig32 & 0x0000FFFF);
    printf("(sig32 & 0xFFFF0000)>>16:       0x%08X\n", (sig32 & 0xFFFF0000)>>16);
    printf("\n");



    // printf("sig32_ptr+1:        0x%X\n", sig32_ptr+1);
    // printf("\n");
    
    // uint16_t sig16 = 0x0DEF;
    // uint16_t *sig16_ptr = &sig16;
    
    // printf("sig16:              0x%04X\n", sig16);
    // printf("sig16_ptr:          0x%X\n", sig16_ptr);
    // printf("(*(sig16_ptr)):     0x%04X\n", (*(sig16_ptr)));
    // printf("\n");

    // printf("sig16_ptr+1:        0x%X\n", sig16_ptr+1);
    // printf("(*(sig16_ptr+1)):   0x%04X\n", (*(sig16_ptr+1)));
    // printf("\n");

    // printf("sig16_ptr+2:        0x%X\n", sig16_ptr+2);
    // printf("(*(sig16_ptr+2)):   0x%04X\n", (*(sig16_ptr+2)));
    // printf("\n");
    
    printf("sizeof(int) %d\n", sizeof(int));

    return 0;
}