#include <stdio.h>

void writeStringFile(int result, const char* outputFile) {
    FILE* output;
    output = fopen(outputFile, "w");
    if (result) {
        fprintf(output, "The nested sequence of parentheses is correct.\n");
    } else {
        fprintf(output, "The nested sequence of parentheses is incorrect.\n");
    }
    fclose(output);
}