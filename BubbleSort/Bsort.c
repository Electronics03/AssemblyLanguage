#include <stddef.h>

void swap(int v[], size_t k)
{
    int tmp = v[k];
    v[k] = v[k + 1];
    v[k + 1] = tmp;
    return;
}
void sort(int v[], size_t n)
{
    size_t i, j;
    for (i = 0; i < n; i++)
        for (j = i - 1; (j >= 0) && (v[j] > v[j + 1]); j--)
            swap(v, j);
    return;
}
int main(void)
{
    int A[10] = {9, 3, 5, 6, 8, 2, 1, 0, 4, 7};
    sort(A, 10);
    return 0;
}