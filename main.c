#include <stdio.h>

void readArray(int a[], int n) {
    for (int i = 0; i < n; i++) {
        scanf("%d", &a[i]);
    }
}

void createArray(int a[], int b[], int n) {
    for (int i = 0; i < n; i++) {
        if (a[i] > 5) b[i] = a[i] + 5;
        else if (a[i] < -5) b[i] = a[i] - 5;
        else b[i] = 0;
    }
}

void printArray(int a[], int n) {
    for (int i = 0; i < n; i++) {
        printf("%d ", a[i]);
    }
}

int main() {
    int array_size, array_a[10], array_b[10];
    scanf("%d", &array_size);

    if (array_size < 0 || array_size > 10) {
        printf("Ошибка: размер массива должен быть в диапазоне 0 <= n <= 10. Запустите программу еще раз!");
        return 0;
    }

    readArray(array_a, array_size);

    createArray(array_a, array_b, array_size);

    printArray(array_b, array_size);

    return 0;
}