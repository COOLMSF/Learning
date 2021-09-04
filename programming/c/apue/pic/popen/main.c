#include "allheaders.h"

int main() {
    FILE *fpr, *fpw;
    char buf[1024];

    fpr = popen("ls", "r");

    if (fpr == NULL)
        err(EXIT_FAILURE, "popen");

    while (fgets(buf, 1024, fpr) != NULL) {
        if (fputs(buf, stdout) == EOF)
            err(EXIT_FAILURE, "fputs");
    }

    fpw = popen("cat", "w");

    if (!fpw)
        err(EXIT_FAILURE, "fpw");

    while (feof(fpw)) {
        fwrite(buf, sizeof(char), 1, fpw);
    }

    fclose(fpr);
    fclose(fpw);
}
