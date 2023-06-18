#include <stdio.h>

int main()
{
    char dna_string[1000];

    scanf("%s", dna_string);

    printf("Analyzing:\n%s\n\n", dna_string);

    int i = 0;
    char curr_base = *(dna_string + i);

    while(i <= 1000 && curr_base != '\0')
    {
        if (curr_base == 'T')
        {
            dna_string[i] = 'U';
        }

        ++i;
        curr_base = *(dna_string + i);
    }

    printf("Output:\n%s\n", dna_string);

    return 0;
}
