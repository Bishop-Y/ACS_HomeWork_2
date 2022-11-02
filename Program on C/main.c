#include <stdio.h>
#include <string.h>
#include <time.h>

int fillStringManual(char array[100000]);
int fillStringFile(char array[100000], const char *inputFile);
int generation(char array[100000]);
int function(const char array[100000], int buffer);
void writeStringFile(int result, const char *outputFile);

int main(int argc, char *argv[])
{
    char string[100000];
    int result, buffer;

    if (argc == 3)
    {
        buffer = fillStringFile(string, argv[1]);
        result = function(string, buffer);
        writeStringFile(result, argv[2]);
        return 0;
    }

    printf("Enter type of filling: manual (1) or random (number != 1): ");
    int inputType;
    scanf("%d", &inputType);

    if (inputType == 1)
    {
        buffer = fillStringManual(string);
    }
    else
    {
        buffer = generation(string);
    }

    time_t start_time = clock();
    int i;
    for (i = 0; i < 1000000; ++i)
    {
        result = function(string, buffer);
    }
    time_t end_time = clock();

    if (result)
    {
        printf("\nThe nested sequence of parentheses is correct.");
    }
    else
    {
        printf("\nThe nested sequence of parentheses is incorrect.");
    }

    printf("\nTime: %d\n", (int)difftime(end_time, start_time) / 1000);
    return 0;
}
