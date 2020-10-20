package com.company;

import java.lang.reflect.Array;
import java.util.*;

public class Main {

    public static void main(String[] args) {
        Student[] studentGroup = new Student[3];

        studentGroup[0] = new Student("coolder", "male", 22, "1831625232", "Network");
        studentGroup[1] = new Student("COLMSF", "female", 18, "1831615242", "Clould");
        studentGroup[2] = new Student("coolme", "female", 17, "183161522", "Security");

        //for (Student stu :
        //        studentGroup) {
        //    stu.stuSubject.chinese.setScore(new Random().nextDouble() * 100);
        //    stu.stuSubject.english.setScore(new Random().nextDouble() * 100);
        //    stu.stuSubject.math.setScore(new Random().nextDouble() * 100);
        //}

        //for (Student stu :
        //        studentGroup) {
        //    stu.stuSubject.printSubjectScore();
        //}

        // Random set score
        //for (Student stu :
        //        studentGroup) {
        //    stu.setStuSubjects();
        //}

        //for (Student stu :
        //        studentGroup) {
        //    sortedScoreList.put(stu.getStuName(), stu.stuSubject.getAverageScore());
        //}

        //Map<String, Double> w = sortByValue(sortedScoreList);

        //Set set = w.entrySet();
        //Iterator iterator = set.iterator();
        //while(iterator.hasNext()) {
        //    Map.Entry mentry = (Map.Entry)iterator.next();
        //    System.out.print("Name: "+ mentry.getKey() + "    Average Score:" + mentry.getValue());
        //    System.out.println("\n");
        //}

        
        // Set student subject
        System.out.println("All subject Math, English, Chinese");

        for (Student stu :
                studentGroup) {
            System.out.println("Student Name:" + stu.getName());
            stu.setStuSubjects();
            System.out.println();
        }

        Arrays.sort(studentGroup);

        for (Student stu :
                studentGroup) {
            stu.printStuInfo();
            System.out.println();
        }

        //for (Student stu :
        //        studentGroup) {
        //    System.out.println(stu.getName() + ' ' + stu.stuSubject.getAverageScore());
        //}
    }
}
