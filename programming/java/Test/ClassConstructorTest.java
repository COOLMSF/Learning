public class ClassConstructorTest {
    public static void main(String[] args) {
        Student stu = new Student(22, "coolder", "male");
        System.out.println(stu.getName() + ',' + stu.getGender() + ',' + stu.getAge());

        Student stu1 = new Student();
        System.out.println(stu1.getName() + ',' + stu1.getGender() + ',' + stu1.getAge());

    }
}

class Student {

    int age;
    String name;
    String gender;

    // Constructor for Student class
    public Student() {
        age = 0;
        name = "";
        gender = "unknown";
    }

    public Student(int aAge, String aName, String aGender) {
            age = aAge;
            name = aName;
            gender = aGender;
    }

    // Write some method for this class
    public String getName() {
        return this.name;
    }

    public int getAge() {
        return this.age;
    }

    public String getGender() {
        return this.gender;
    }
}