#include "allheaders.h"
#include "student_struct.h"

int main() {
    Student student[3] = {
            [0].name = "coolder",
            [1].name = "COOLMSF"
    };

    Subject my_sub[2] = {
            [0].name = "Network",
            [0].score = 60,

            [1].name = "Software",
            [1].score = 99
    };

    init_stu_info(student, "hushanglai", "male", 22, "1831615232", my_sub, MAX_SUBJECT);
    print_stu_info(student, 3);
}