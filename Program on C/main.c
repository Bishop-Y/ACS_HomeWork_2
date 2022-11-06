#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int function(const char array[200], int size);

int main(int argc, char *argv[]) {
    char string[200];
    int size = 0;
    int ch;
    int result;

    if (argc == 3) {
        FILE *input;
        input = fopen(argv[1], "r");
        if (input == NULL) {
            printf("File does not exist");
            return 0;
        } else {
            do {
                ch = fgetc(input);
                string[size++] = ch;
            } while (ch != -1 && size < 200);
            string[size - 1] = '\0';
        }
        fclose(input);

        result = function(string, size);

        FILE *output;
        output = fopen(argv[2], "w");
        if (result) {
            fprintf(output, "The nested sequence of parentheses is correct.\n");
        } else {
            fprintf(output, "The nested sequence of parentheses is incorrect.\n");
        }
        fclose(output);
        return 0;
    }

    printf("Enter type of filling: manual (1) or random (number != 1): ");
    int inputType;
    scanf("%d", &inputType);

    int index = 0;
    if (inputType == 1) {
        printf("\nType your string: ");
        do {
            ch = fgetc(stdin);
            string[size++] = ch;
        } while (ch != -1 && size < 200);
        string[size - 1] = '\0';
    } else {
        int seed;
        printf("\nEnter seed: ");
        scanf("%d", &seed);
        srand(seed);
        size = rand() % 200;
        printf("\n");
        do {
            string[index] = 33 + rand() % 95;
            printf("%c", string[index]);
            ++index;
        } while (index < size);
    }

    if (argc == 2) {
        time_t start_time = clock();
        for (index = 0; index < 20000000; ++index) {
            result = function(string, size);
        }
        time_t end_time = clock();
        printf("\nTime: %d\n", (int) difftime(end_time, start_time) / 1000);
    } else {
        result = function(string, size);
    }

    if (result) {
        printf("\n\nThe nested sequence of parentheses is correct\n.");
    } else {
        printf("\n\nThe nested sequence of parentheses is incorrect\n.");
    }

    return 0;
}
