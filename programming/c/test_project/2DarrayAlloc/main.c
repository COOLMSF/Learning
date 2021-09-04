#include <stdio.h>
#include <stdlib.h>

int main () {
	int **p;

	// Alloc space

	/*
	 * This is wrong.
	 *
	 * see, https://stackoverflow.com/questions/917783/how-do-i-work-with-dynamic-multi-dimensional-arrays-in-c
	 *
	 * It is not a multidimensional array - it is array of pointers to int
	 * , or array of arrays. To allocate memory for real 2D array you need
	 * to use malloc(dim1 * dim2 * sizeof(int)). If some function expects
	 * pointer to 2D array, like foo(int * bar[5][6]) and you pass your x
	 * , weird things will happen.
	 */
	p = (int **) malloc(sizeof(int *) * 2);
	for (int i = 0; i < 3; ++i) {
		p[i] = (int *) malloc(sizeof(int) * 3);
	}

	// Fill space
	for (int i = 0; i < 2; ++i) {
		for (int j = 0; j < 3; ++j) {
			p[i][j] = 0x66;
		}
	}

	// Print data
	for (int i = 0; i < 2; ++i) {
		for (int j = 0; j < 3; ++j) {
			printf("%d", p[i][j]);

			if (j != 2)
				putchar(' ');
		}
		putchar('\n');
	}
}
