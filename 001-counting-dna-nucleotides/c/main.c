#include <stdio.h>

int main()
{
    char nucleotides[1000];
    scanf("%s", nucleotides);
    printf("Analyzing:\n%s\n\n", nucleotides);

    int count_A = 0;
    int count_C = 0;
    int count_G = 0;
    int count_T = 0;

    int i = 0;
    char curr_nucleotide = *(nucleotides + i);
    while(i <= 1000 && curr_nucleotide != '\0')
    {
        if (curr_nucleotide == 'A')
        {
            ++count_A;
        } else if (curr_nucleotide == 'C')
        {
            ++count_C;
        } else if (curr_nucleotide == 'G')
        {
            ++count_G;
        } else if (curr_nucleotide == 'T')
        {
            ++count_T;
        }

        ++i;

        curr_nucleotide = *(nucleotides + i);
    }

    printf("Results:\nA C G T:\n%d %d %d %d\n",
        count_A, count_C, count_G, count_T);
    return 0;
}
