#include <iostream>

using namespace std;

const int keys[][22] = \
{{49, 45, 26, 25, 94, 23, 25, 41, 44, 79, 70, 24, 30, 31, 81, 54, 26, 46, 87, 77, 46, 23}, {97, 86, 50, 47, 69, 67, 40, 67, 51, 69, 94, 25, 59, 48, 80, 44, 88, 49, 94, 22, 52, 50}, {66, 59, 74, 63, 46, 34, 46, 62, 89, 24, 54, 91, 64, 30, 50, 68, 37, 67, 42, 67, 40, 35}, {44, 30, 64, 84, 91, 67, 58, 89, 73, 60, 57, 84, 32, 84, 22, 74, 40, 100, 49, 66, 25, 32}, {48, 42, 48, 87, 93, 90, 36, 54, 56, 98, 79, 60, 62, 78, 71, 21, 99, 44, 28, 96, 38, 24}, {85, 65, 46, 97, 96, 63, 95, 61, 40, 54, 47, 84, 69, 27, 36, 36, 23, 27, 78, 32, 32, 38}, {40, 72, 46, 88, 34, 40, 81, 70, 96, 55, 74, 68, 75, 46, 29, 27, 65, 99, 55, 40, 46, 88}, {31, 80, 31, 46, 60, 43, 53, 25, 56, 29, 61, 44, 75, 67, 82, 84, 71, 22, 25, 54, 59, 25}, {75, 98, 54, 98, 81, 22, 67, 43, 29, 46, 90, 95, 42, 60, 30, 85, 67, 92, 31, 38, 31, 46}, {77, 34, 20, 49, 65, 66, 86, 51, 77, 26, 55, 69, 80, 86, 79, 88, 87, 65, 49, 99, 46, 71}, {74, 35, 89, 27, 95, 62, 97, 54, 95, 89, 98, 41, 30, 58, 74, 97, 28, 52, 95, 25, 62, 44}, {51, 30, 99, 71, 23, 81, 56, 24, 48, 63, 94, 60, 98, 80, 44, 83, 73, 85, 93, 44, 59, 62}, {100, 75, 65, 50, 48, 81, 69, 97, 97, 55, 48, 27, 49, 61, 83, 61, 44, 48, 66, 82, 55, 93}, {85, 96, 95, 47, 26, 51, 31, 20, 55, 86, 85, 22, 53, 30, 42, 29, 24, 78, 46, 90, 46, 76}, {42, 89, 23, 34, 21, 38, 62, 54, 94, 28, 67, 22, 68, 53, 21, 77, 53, 69, 27, 57, 46, 70}, {70, 95, 55, 29, 91, 22, 44, 66, 53, 31, 44, 42, 22, 32, 38, 60, 54, 88, 46, 46, 77, 79}, {28, 81, 64, 84, 63, 93, 79, 62, 76, 62, 100, 28, 55, 84, 37, 72, 95, 41, 86, 83, 72, 64}, {27, 27, 74, 83, 93, 97, 88, 24, 96, 61, 87, 98, 81, 48, 23, 94, 94, 61, 33, 99, 92, 44}, {40, 30, 22, 61, 31, 77, 62, 58, 82, 31, 45, 60, 77, 29, 77, 32, 73, 57, 72, 22, 41, 33}, {57, 79, 50, 86, 77, 54, 80, 82, 64, 39, 21, 87, 29, 75, 61, 52, 91, 50, 37, 71, 58, 100}, {88, 77, 99, 45, 25, 44, 65, 27, 64, 24, 37, 61, 23, 55, 43, 66, 48, 21, 58, 88, 36, 56}, {74, 34, 95, 45, 87, 48, 86, 87, 84, 88, 46, 88, 50, 75, 87, 34, 82, 93, 30, 74, 28, 22}, {88, 88, 27, 53, 51, 75, 78, 76, 60, 63, 34, 75, 80, 90, 98, 85, 60, 21, 29, 33, 69, 48}, {96, 74, 80, 95, 29, 45, 92, 22, 65, 67, 71, 44, 85, 59, 88, 57, 49, 91, 77, 84, 24, 79}, {91, 69, 71, 91, 56, 63, 64, 20, 58, 56, 63, 72, 89, 53, 89, 87, 43, 65, 90, 71, 94, 52}, {47, 63, 22, 72, 45, 100, 33, 55, 34, 94, 65, 76, 37, 58, 48, 21, 88, 20, 84, 71, 24, 90}, {23, 23, 74, 42, 56, 88, 59, 56, 80, 38, 96, 32, 62, 23, 22, 83, 60, 87, 50, 32, 88, 76}, {56, 91, 95, 44, 88, 22, 61, 51, 23, 60, 100, 93, 67, 43, 79, 98, 46, 29, 69, 81, 59, 78}, {67, 70, 91, 34, 90, 26, 21, 50, 51, 85, 93, 46, 44, 51, 30, 88, 71, 78, 81, 68, 92, 42}, {86, 53, 45, 42, 93, 65, 44, 92, 21, 59, 27, 47, 72, 50, 23, 31, 87, 94, 43, 69, 21, 71}, {36, 35, 36, 24, 87, 37, 40, 95, 54, 69, 41, 35, 69, 56, 49, 27, 74, 72, 43, 58, 93, 24}, {23, 44, 99, 74, 56, 89, 96, 89, 88, 76, 44, 28, 46, 48, 33, 24, 88, 57, 24, 80, 76, 51}, {80, 55, 58, 90, 51, 70, 82, 43, 90, 70, 56, 60, 27, 46, 32, 92, 92, 44, 92, 77, 84, 99}, {56, 43, 66, 89, 89, 38, 88, 49, 50, 38, 57, 92, 50, 58, 96, 82, 51, 70, 49, 95, 31, 82}, {20, 21, 61, 57, 20, 81, 93, 71, 44, 61, 31, 82, 57, 92, 96, 97, 54, 86, 89, 30, 83, 92}, {33, 54, 68, 56, 33, 55, 79, 64, 80, 23, 53, 65, 34, 71, 36, 78, 20, 39, 72, 70, 29, 42}, {98, 57, 82, 36, 30, 73, 36, 20, 83, 89, 48, 40, 35, 65, 49, 75, 50, 78, 80, 70, 86, 36}, {87, 46, 33, 67, 59, 87, 24, 39, 87, 22, 40, 63, 54, 66, 77, 48, 89, 64, 25, 92, 93, 28}, {100, 35, 92, 41, 98, 35, 57, 68, 59, 24, 28, 68, 45, 100, 23, 25, 39, 69, 91, 90, 55, 40}, {82, 53, 96, 44, 80, 62, 38, 43, 29, 39, 68, 43, 21, 90, 97, 80, 77, 39, 68, 80, 77, 46}, {80, 81, 20, 81, 50, 65, 23, 56, 36, 58, 40, 97, 43, 40, 41, 20, 51, 79, 50, 98, 37, 21}, {38, 88, 41, 61, 68, 69, 27, 65, 53, 73, 54, 56, 46, 31, 99, 97, 50, 42, 41, 60, 69, 73}, {85, 79, 43, 51, 54, 25, 59, 50, 21, 45, 39, 52, 66, 23, 79, 90, 96, 51, 40, 61, 34, 86}, {94, 86, 62, 54, 87, 81, 46, 53, 90, 24, 71, 70, 61, 38, 21, 24, 71, 89, 54, 36, 25, 68}, {51, 85, 74, 28, 77, 66, 82, 54, 29, 84, 56, 41, 54, 23, 47, 53, 25, 32, 94, 44, 72, 60}, {38, 42, 30, 67, 73, 42, 26, 88, 25, 38, 20, 36, 66, 80, 48, 44, 54, 42, 74, 33, 77, 50}, {27, 84, 90, 42, 94, 68, 51, 51, 52, 86, 70, 35, 64, 92, 24, 58, 40, 64, 28, 90, 86, 51}, {23, 42, 58, 30, 86, 83, 86, 28, 30, 41, 58, 68, 28, 67, 24, 84, 31, 96, 86, 40, 82, 42}, {83, 70, 28, 93, 93, 93, 37, 38, 73, 32, 44, 63, 74, 38, 23, 65, 82, 61, 81, 32, 61, 49}, {58, 89, 36, 83, 74, 35, 47, 37, 81, 42, 50, 88, 24, 76, 98, 43, 87, 55, 41, 62, 23, 25}, {31, 24, 98, 95, 73, 89, 45, 58, 96, 31, 23, 46, 20, 86, 24, 61, 78, 20, 63, 69, 45, 22}, {41, 84, 93, 97, 83, 37, 43, 30, 73, 57, 84, 89, 73, 58, 39, 49, 71, 94, 97, 74, 51, 87}, {72, 75, 45, 64, 84, 72, 31, 93, 66, 35, 90, 37, 39, 100, 55, 25, 99, 35, 100, 59, 43, 54}, {30, 89, 30, 32, 90, 74, 52, 65, 50, 36, 92, 94, 50, 90, 74, 71, 36, 43, 63, 80, 82, 86}, {65, 98, 28, 46, 79, 79, 68, 35, 34, 40, 82, 83, 68, 41, 65, 73, 36, 28, 70, 62, 48, 96}, {30, 48, 86, 75, 31, 90, 21, 92, 66, 94, 40, 47, 84, 58, 44, 24, 79, 67, 51, 88, 30, 73}, {89, 50, 100, 100, 82, 20, 73, 65, 27, 20, 85, 23, 86, 26, 65, 99, 80, 25, 72, 91, 89, 68}, {90, 75, 40, 29, 60, 94, 77, 85, 53, 84, 37, 34, 32, 22, 68, 63, 52, 61, 95, 28, 25, 35}, {43, 79, 46, 89, 66, 65, 92, 45, 32, 65, 93, 75, 63, 60, 66, 25, 49, 27, 97, 74, 90, 47}, {93, 96, 37, 43, 95, 51, 94, 44, 26, 34, 97, 73, 34, 94, 63, 47, 94, 97, 45, 50, 67, 61}, {90, 46, 65, 23, 25, 89, 97, 81, 20, 71, 33, 51, 50, 51, 25, 95, 96, 91, 90, 40, 68, 79}, {34, 36, 96, 27, 83, 77, 84, 84, 32, 45, 45, 97, 56, 64, 35, 73, 95, 77, 95, 99, 40, 91}, {29, 21, 56, 30, 97, 20, 20, 89, 28, 24, 79, 84, 27, 37, 89, 76, 33, 42, 92, 86, 46, 54}, {71, 96, 26, 70, 46, 78, 43, 75, 47, 70, 90, 87, 47, 52, 56, 72, 63, 44, 75, 68, 52, 51}, {44, 68, 51, 84, 45, 64, 21, 47, 29, 65, 89, 48, 37, 91, 90, 36, 39, 35, 94, 95, 34, 45}, {80, 60, 87, 25, 32, 95, 90, 40, 86, 23, 88, 24, 87, 47, 90, 39, 86, 40, 25, 57, 29, 88}, {89, 29, 23, 30, 39, 31, 23, 22, 72, 54, 26, 42, 91, 72, 69, 43, 55, 97, 74, 53, 51, 81}, {23, 34, 33, 25, 96, 99, 37, 34, 48, 63, 69, 64, 69, 65, 79, 23, 27, 40, 85, 58, 50, 20}, {39, 32, 97, 41, 41, 68, 61, 91, 42, 89, 21, 77, 67, 80, 42, 35, 100, 41, 91, 43, 92, 82}, {28, 98, 98, 40, 94, 30, 68, 35, 86, 94, 52, 38, 76, 66, 72, 51, 39, 55, 99, 56, 68, 33}, {62, 31, 32, 50, 84, 50, 85, 47, 56, 37, 73, 38, 38, 84, 72, 82, 87, 27, 72, 62, 59, 67}, {36, 49, 49, 21, 67, 24, 56, 79, 37, 43, 64, 49, 37, 37, 62, 97, 75, 99, 58, 96, 22, 26}, {38, 25, 76, 28, 76, 82, 71, 93, 56, 73, 51, 26, 33, 86, 27, 29, 48, 75, 85, 73, 64, 50}, {29, 43, 20, 93, 80, 44, 68, 71, 81, 63, 74, 75, 40, 87, 67, 71, 70, 35, 89, 38, 97, 99}, {25, 58, 33, 48, 44, 90, 69, 88, 48, 79, 81, 23, 79, 87, 81, 94, 52, 77, 21, 32, 25, 45}, {61, 73, 64, 100, 94, 95, 81, 67, 48, 93, 25, 53, 44, 42, 24, 69, 56, 98, 85, 53, 28, 50}, {52, 82, 85, 88, 59, 91, 27, 55, 47, 40, 96, 72, 98, 77, 53, 41, 97, 71, 40, 81, 31, 83}, {98, 71, 47, 61, 34, 62, 34, 33, 45, 62, 61, 59, 21, 100, 34, 57, 56, 28, 27, 31, 98, 22}, {54, 27, 51, 74, 30, 33, 77, 57, 61, 40, 59, 69, 79, 82, 53, 88, 73, 89, 76, 48, 36, 58}, {21, 41, 52, 94, 69, 22, 80, 76, 51, 96, 53, 81, 93, 69, 33, 96, 99, 33, 30, 34, 93, 82}, {59, 77, 87, 67, 67, 92, 83, 61, 66, 53, 94, 58, 24, 32, 22, 95, 91, 74, 55, 49, 65, 66}, {35, 39, 43, 37, 34, 67, 96, 90, 84, 96, 36, 27, 92, 79, 78, 64, 84, 81, 97, 68, 98, 82}, {26, 60, 88, 92, 44, 44, 32, 99, 26, 91, 52, 61, 67, 28, 81, 33, 97, 78, 92, 94, 39, 93}, {99, 79, 74, 63, 96, 45, 68, 86, 59, 58, 74, 69, 33, 32, 43, 26, 20, 95, 100, 80, 83, 35}, {38, 87, 73, 56, 37, 90, 70, 41, 80, 90, 75, 43, 99, 96, 57, 86, 77, 72, 78, 93, 23, 26}, {56, 68, 62, 46, 84, 71, 88, 72, 25, 54, 54, 65, 92, 89, 35, 95, 68, 62, 95, 87, 32, 75}, {43, 26, 59, 24, 75, 99, 89, 51, 81, 70, 92, 22, 40, 27, 56, 82, 45, 75, 67, 24, 75, 39}, {98, 36, 42, 43, 61, 45, 46, 51, 37, 31, 100, 32, 88, 45, 68, 82, 84, 30, 53, 92, 96, 48}, {26, 36, 81, 74, 28, 78, 29, 48, 59, 30, 24, 79, 67, 22, 56, 48, 67, 63, 45, 53, 98, 31}, {21, 30, 91, 30, 59, 57, 96, 96, 89, 96, 92, 28, 30, 51, 79, 72, 71, 45, 77, 52, 70, 76}, {86, 76, 73, 57, 36, 81, 60, 88, 25, 95, 84, 51, 66, 42, 88, 99, 80, 96, 69, 21, 67, 91}, {29, 91, 76, 75, 90, 31, 61, 37, 60, 49, 36, 58, 74, 47, 47, 28, 60, 57, 56, 64, 64, 42}, {53, 24, 79, 27, 88, 53, 26, 73, 30, 31, 76, 35, 47, 37, 40, 90, 92, 60, 72, 20, 59, 38}, {78, 84, 22, 37, 56, 73, 83, 90, 97, 41, 73, 83, 91, 96, 52, 54, 34, 100, 68, 52, 54, 64}, {38, 78, 87, 99, 38, 50, 37, 89, 74, 53, 96, 62, 48, 51, 74, 72, 67, 98, 87, 37, 73, 67}, {90, 80, 45, 47, 75, 70, 77, 88, 81, 21, 79, 22, 66, 75, 38, 48, 40, 23, 58, 44, 100, 26}, {23, 33, 58, 95, 99, 34, 38, 55, 76, 63, 38, 27, 39, 45, 81, 76, 22, 87, 85, 77, 99, 74}, {83, 96, 96, 22, 43, 86, 42, 78, 76, 39, 46, 27, 100, 86, 26, 79, 39, 57, 33, 95, 37, 63}, {38, 29, 45, 46, 58, 54, 34, 70, 46, 51, 95, 60, 27, 51, 49, 39, 33, 40, 73, 73, 71, 60}, {57, 55, 60, 73, 34, 84, 86, 67, 56, 33, 86, 62, 57, 40, 76, 58, 100, 69, 49, 47, 41, 56}};
int first[] = {21, 33, 63, 42, 70, 14, 3, 53, 112, 46, 125, 35, 50, 66, 118, 63, 35, 126};
int second[] = {76, 39, 4, 83, 110, 36, 92, 25, 81, 1, 73, 77, 25, 84, 109, 75, 116, 49, 88, 46};
int last[] = {19, 72, 119, 80, 21, 95, 18, 19, 89, 79, 15, 78, 112, 59, 90, 71, 73, 100, 65, 56, 62, 84};

std::string decode(int* encoded_string, int keys_offset, int keys_used, int str_len)
{
    for(int i=keys_offset; i<keys_offset+keys_used; ++i)
        for(int j=0; j<str_len; ++j)
            encoded_string[j] ^= keys[i][j];

    std::string s;
    for(int j=0; j<str_len; ++j)
        s += static_cast<char>(encoded_string[j]);

    return s;
}

int main()
{

    cout << "cr4ckm3 level 4. enjoy" << endl;
    cout << "In this level, there's something wrong with decoding messages - you have to find the issue and fix code." << endl;
    cout << "You can find the issue with g++/clang++ sanitizers. For more info check man or documentation." << endl;
    cout << "Example usage of sanitizers: g++ -fsanitize=address <source_file>" << endl;
    cout << "Decoding messages:" << endl;
    cout << decode(first, 75, 25, 18) << endl;
    cout << decode(second, 50, 50, 20) << endl;
    cout << decode(last, 0, 101, 22) << endl;
}
