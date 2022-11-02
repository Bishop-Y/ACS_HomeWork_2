#include <stdio.h>

int fillStringFile(char array[100000], const char* inputFile) {
    FILE* input;
    input = fopen(inputFile, "r");
    int buffer = 0;
    fscanf(input, "%c", &array[buffer]);
    while (array[buffer] != '\0' && buffer < 100000) {
        ++buffer;
        fscanf(input, "%c", &array[buffer]);
    }
    fclose(input);
    return buffer;
}

