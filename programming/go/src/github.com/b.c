#include <stdio.h>
#include <string.h>

int main()
{
char word[] = "abcdef";  
int idxToDel = 2; 
memmove(&word[idxToDel], &word[idxToDel + 1], strlen(word) - idxToDel);

puts(word);
}
