// C program to reverse a string
#include <stdio.h>
 
// Function to reverse any sequence
// starting with pointer begin and
// ending with pointer end
void reverse(char* begin, char* end)
{
    char temp;
    while (begin < end) {
        temp = *begin;
        *begin++ = *end;
        *end-- = temp;
    }
}
 
// Function to reverse words*/
void reverseWords(char* s)
{
    char* word_begin = s;
 
    // Word boundary
    char* temp = s;
 
    // Reversing individual words as
    // explained in the first step
    while (*temp) {
        temp++;
        if (*temp == '\0') {
            reverse(word_begin, temp - 1);
        }
        else if (*temp == ' ') {
            reverse(word_begin, temp - 1);
            word_begin = temp + 1;
        }
    }
 
    // Reverse the entire string
    reverse(s, temp - 1);
}
 
// Driver Code
int main()
{
    char s[] = "i like this program very much";
    char* temp = s;
    reverseWords(s);
    printf("%s", s);
    return 0;
}
