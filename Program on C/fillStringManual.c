#include <stdio.h>

int fillStringManual(char array[100000]) {
    int buffer = 0;
    printf("\nType your string: ");
    getchar();
    fgets(array, 100000, stdin);
    while (array[buffer] != '\0' && buffer < 100000) {
        ++buffer;
    }
    return buffer;
}
