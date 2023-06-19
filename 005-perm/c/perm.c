#include <stdio.h>

int factorial(int n)
{
    if (n <= 1)
    {
        return 1;
    }

    return n * factorial(n - 1);

}

void ip_swap(int* A, int a, int b)
{
    int tmp = *(A + a);
    A[a] = *(A + b);
    A[b] = tmp;

}

void print_array(int* A, int size)
{
    for (int i = 0; i < size; ++i)
    {
        printf("%d", *(A + i));

        if (i != size - 1)
        {
            printf(" ");
        }
    }

    printf("\n");

}

void permute(int* A, int n, int size)
{
    if (n <= 1)
    {
        print_array(A, size);
        return;
    }


    for (int i = 0; i < n; ++i)
    {
        permute(A, n - 1, size);
        if (n % 2 == 0)
        {
            ip_swap(A, i, n - 1);
        } else
        {
            ip_swap(A, 0, n - 1);
        }
    }

}

int main()
{
    int n;
    scanf("%d", &n);
    printf("Analyzing:\n%d\n", n);

    int num_perms = factorial(n);

    int base_permutation[n];

    for (int i = 0; i < n; ++i)
    {
        base_permutation[i] = i + 1;
    }

    printf("Permuting: \n");
    print_array(base_permutation, n);

    printf("Result:\n%d\n", num_perms);
    permute(base_permutation, n, n);

    return 0;
}
