#include <stdio.h>
#include <string.h>

#define MAX_LEN 256

int main(void)
{
    FILE* fp;
    fp = fopen("file.txt", "r");
    if (fp == NULL) {
      perror("Failed: ");
      return 1;
    }

    char buffer[MAX_LEN];
    // -1 to allow room for NULL terminator for really long string
    while (fgets(buffer, MAX_LEN - 1, fp))
    {
	char name[MAX_LEN], user_des[MAX_LEN], venue[MAX_LEN];
        // Remove trailing newline
        buffer[strcspn(buffer, "\n")] = 0;
	sscanf(buffer, "%[^','], %[^','], %[^',']", name, user_des, venue);
	// sscanf(tokenstring, "%[^','],%[^','],%[^','],%s", o, s, t, f);

	printf("name:%s\n", name);
	printf("user_des:%s\n", user_des);
	printf("venue:%s\n", venue);
    }

    fclose(fp);
    return 0;
}
