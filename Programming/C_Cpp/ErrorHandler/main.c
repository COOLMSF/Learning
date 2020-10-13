#include "allheaders.h"

int main() {
    FILE *fp;

    if (NULL == (fp = fopen("123", "r"))) {
        MyError("fopen");
    }
}
