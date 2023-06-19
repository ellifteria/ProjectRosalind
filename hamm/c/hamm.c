#include <stdio.h>

int main()
{
    char dna_1[1001];
    char dna_2[1001];
    scanf("%s", dna_1);
    scanf("%s", dna_2);
    printf("Analyzing:\n%s\n%s\n\n", dna_1, dna_2);

    int error = 0;

    int i = 0;
    char curr_base_1 = *(dna_1 + i);
    char curr_base_2 = *(dna_2 + i);
    while(
        i <= 1000 &&
        curr_base_1 != '\0' &&
        curr_base_2 != '\0'
    )
    {
       if (curr_base_1 != curr_base_2)
       {
        ++error;
       }

        ++i;

        curr_base_1 = *(dna_1 + i);
        curr_base_2 = *(dna_2 + i);

    }

    printf("Result:\n%d\n", error);
    return 0;
}
