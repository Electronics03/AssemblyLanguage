#include <iostream>

void clear1(int array[], int size)
{
    for (int i = 0; i < size; i++)
        array[i] = 0;
    return;
}
int main(void)
{
    int A[10] = {9, 3, 5, 6, 8, 2, 1, 0, 4, 7};
    clear1(A, 10);
    for (int i = 0; i < 10; i++)
        std::cout << A[i] << " ";
    return 0;
}