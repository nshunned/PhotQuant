#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

int main(void) {
    printf("HELLO WORLD\n");

    int intArray[] = {1, 2, 3, 4, 5};
    int length = sizeof(intArray) / sizeof(intArray[0]);

    for (int i = 0; i < length; i++)
        printf("%d ", intArray[i]);

    unsigned long long number = 1000;

    printf("\n");

    return 0;
}

char** splitString(char* string, const char deliminator[]) {
    char** result = NULL;
    char* token = strtok(string, deliminator);
    int n = 0;

    while (token) {
        result = realloc(result, sizeof(char*) * (++n));
        if (result == NULL)
            exit(-1); // memory allocation failed
        result[n-1] = token;
        token = strtok(NULL, ", ");
    }

    result = realloc(result, sizeof (char*) * (n+1));
    result[n] = 0;
    
    return result;
}