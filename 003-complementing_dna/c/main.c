#include <stdio.h>

int main()
{
    char dna_string[1001];

    scanf("%s", dna_string);

    printf("Analyzing:\n%s\n\n", dna_string);

    int i = 0;
    char curr_base = *(dna_string + i);

    char new_dna_string[1001];
    int j = 1001 - 1 - i;
    new_dna_string[j] = '\0';
    --j;

    while(i <= 1000 && curr_base != '\0')
    {
        printf("%d: %c: %d\n", i, curr_base, j);

        if (curr_base == 'A')
        {
            new_dna_string[j] = 'T';

        } else if (curr_base == 'C')
        {
            new_dna_string[j] = 'G';

        } else if (curr_base == 'G')
        {
            new_dna_string[j] = 'C';

        } else if (curr_base == 'T')
        {
            new_dna_string[j] = 'A';
        }

        ++i;
        --j;
        curr_base = *(dna_string + i);
    }
    ++j;

    char* complementary_dna = new_dna_string + j;

    printf("Output:\n%s\n", complementary_dna);

    return 0;
}
