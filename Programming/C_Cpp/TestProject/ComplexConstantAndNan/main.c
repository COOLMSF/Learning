#include "allheaders.h"
#include <math.h>
#include "MyMacro.h"

struct Student {
    int a;
    int b;
};

long double
sum(const double *double_array) {
    long double double_array_sum = 0;

    //for (int i = 0; i < size && !isnan(double_array[i]); ++i) {
    //    double_array_sum += double_array[i];
    //}

    while (!isnan(*double_array)) {
        double_array_sum += *double_array;
        double_array++;
    }

    return double_array_sum;
}