#include "allheaders.h"
#include "student_struct.h"

int main() {
    Student student[3];

    Subject my_sub[2] = {
            [0].name = "Network",
            [0].score = 60,

            [1].name = "Software",
            [1].score = 99
    };

    init_stu_info(&student[1], "coolder", "male", 22, "1831615232", my_sub, MAX_SUBJECT);
    printf("%f", get_average_of_subjects(student[1], MAX_SUBJECT));
}