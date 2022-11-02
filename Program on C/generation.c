#include <stdio.h>
#include <stdlib.h>

int generation(char array[100000]) {
    char set[36] = "QWERTYUIOPASDFGHJKLZXCVBNM((((()))))";
    int seed, index, buffer;
    printf("\nEnter seed: ");
    scanf("%d", &seed);
    srand(seed);
    buffer = rand() % 100;
    printf("\nGenerated string: ");
    for (index = 0; index < buffer - 1; index++) {
        array[index] = set[rand() % 36];
        printf("%c", array[index]);
    }
    array[index] = '\n';
    printf("%c", array[index]);
    return buffer;
}
