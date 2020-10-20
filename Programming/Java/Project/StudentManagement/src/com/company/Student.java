package com.company;
import java.util.*;

public class Student extends Person implements Comparable<Student> {

    final private String stuId;
    final private String stuClass;

    // Every student has 3 subjects
    public Subject[] stuSubjects = new Subject[3];

    Student(String stuName, String stuGender, int stuAge,
            String stuId, String stuClass) {

        super(stuName, stuGender, stuAge);

        this.stuId = stuId;
        this.stuClass = stuClass;

    }

    public int getStuAge() {
        return super.getAge();
    }

    public String getStuGender() {
        return super.getGender();
    }

    public String getStuName() {
        return super.getName();
    }

    public String getStuClass() {
        return this.stuClass;
    }

    public String getStuId() {
        return this.stuId;
    }

    public void printSubjectInfo() {
        for (Subject stuSubject : stuSubjects) {
            System.out.println("Subject Name:" + stuSubject.getName());
            System.out.println("Subject Score:" + stuSubject.getScore());
        }
    }

    public void printStuInfo() {
        System.out.println("Name:" + getStuName());
        System.out.println("Age:" + getStuAge());
        System.out.println("Gender:" + getStuGender());
        System.out.println("ID:" + getStuId());
        System.out.println("Class:" + getStuClass());

        printSubjectInfo();
        System.out.println("Average Score:" + getAverageScore());

    }

    public void setStuSubjects() {

        // Traverse all subjects, problem code!!!
        // for (Subject stuSubject : stuSubjects) {

        //     // Read subject name
        //     Scanner in = new Scanner(System.in);
        //     System.out.println("Subject name:");
        //     stuSubject.setName(in.nextLine());

        //     // Read subject score
        //     System.out.println("Subject score:");
        //     stuSubject.setScore(in.nextDouble());
        // }

        for (int i = 0; i < stuSubjects.length; i++) {

            Subject stuSubject = new Subject();
            Scanner in = new Scanner(System.in);

            System.out.println("Subject name:");
            stuSubject.setName(in.nextLine());

            // Read subject score
            System.out.println("Subject score:");
            stuSubject.setScore(in.nextDouble());

            stuSubjects[i] = stuSubject;
        }
    }

    // Get average score of all subjects
    public double getAverageScore() {

        double totalScore = 0;

        for (Subject i :
                stuSubjects) {
            totalScore += i.getScore();
        }

        return totalScore / stuSubjects.length;
    }

    //

    @Override
    public int compareTo(Student student) {
        return Double.compare(getAverageScore(), student.getAverageScore());
    }
}
