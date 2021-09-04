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