#include <stdio.h>
#include <math.h>
#include <time.h>
#include <stdlib.h>
#include <unistd.h>

int rand_num()
{
	int num;
	num = rand() % 10;
	return num;
}

void add()
{
	int a, b, input, result;

	srand((unsigned)time( NULL ) );

	a = rand_num();

	// Nop here, or the random number will be the same, because computer run
	// so fast, that the random seed doesn't change

	b = rand_num();
	result = a + b;

	printf("%d+%d=?", a, b);
	scanf("%d", &input);

	if (input == result)
		printf("Very good\n");
	else
		printf("You are wrong\n");
}

void minus()
{
	int a, b, input, result;

	srand((unsigned)time( NULL ) );

	a = rand_num();

	// Nop here, or the random number will be the same, because computer run
	// so fast, that the random seed doesn't change

	b = rand_num();
	result = a - b;

	printf("%d-%d=?", a, b);
	scanf("%d", &input);

	if (input == result)
		printf("Very good\n");
	else
		printf("You are wrong\n");
}

void multiple()
{
	int a, b, input, result;

	srand((unsigned)time( NULL ) );

	a = rand_num();

	// Nop here, or the random number will be the same, because computer run
	// so fast, that the random seed doesn't change

	b = rand_num();
	result = a * b;

	printf("%d*%d=?", a, b);
	scanf("%d", &input);

	if (input == result)
		printf("Very good\n");
	else
		printf("You are wrong\n");
}
int main () {
	add();
	minus();
	multiple();
}
