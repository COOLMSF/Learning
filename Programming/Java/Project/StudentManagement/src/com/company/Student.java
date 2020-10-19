package com.company;

import java.lang.reflect.Array;
import java.util.*;

public class Student extends Person {

    final private String stuName;
    final private String stuGender;
    final private int stuAge;
    final private String stuId;
    final private String stuClass;
    public Subject stuSubject = new Subject();

    Student(String stuName, String stuGender, int stuAge,
            String stuId, String stuClass) {

        this.stuName = stuName;
        this.stuGender = stuGender;
        this.stuAge = stuAge;
        this.stuId = stuId;
        this.stuClass = stuClass;

    }

    public int getStuAge() {
        return stuAge;
    }

    public String getStuClass() {
        return stuClass;
    }

    public String getStuId() {
        return stuId;
    }

    public String getStuGender() {
        return stuGender;
    }

    public String getStuName() {
        return stuName;
    }

    public void printStuInfo() {
        System.out.println("Name:" + getStuName());
        System.out.println("Age:" + getStuAge());
        System.out.println("Gender:" + getStuGender());
        System.out.println("ID:" + getStuId());
        System.out.println("Class:" + getStuClass());
        //System.out.println("Subject:" + getStuSubject());
    }


}
