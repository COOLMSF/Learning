package com.company;

import java.util.*;

public class Main {
    // function to sort hashmap by values
    public static HashMap<String, Double> sortByValue(HashMap<String, Double> hm)
    {
        // Create a list from elements of HashMap
        List<Map.Entry<String, Double> > list =
                new LinkedList<Map.Entry<String, Double> >(hm.entrySet());

        // Sort the list
        Collections.sort(list, (o1, o2) -> (o1.getValue()).compareTo(o2.getValue()));

        // put data from sorted list to hashmap
        HashMap<String, Double> temp = new LinkedHashMap<>();
        for (Map.Entry<String, Double> aa : list) {
            temp.put(aa.getKey(), aa.getValue());
        }
        return temp;
    }

    public static void main(String[] args) {
        Student[] studentGroup = new Student[2];
        
        studentGroup[0] = new Student("coolder", "male", 22, "1831625232", "Network");
        studentGroup[1] = new Student("COLMSF", "female", 18, "1831615242", "Clould");

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

        var sortedScoreList = new HashMap<String, Double>();

        for (Student stu :
                studentGroup) {
            stu.stuSubject.chinese.setScore(new Random().nextDouble() * 100);
            stu.stuSubject.english.setScore(new Random().nextDouble() * 100);
            stu.stuSubject.math.setScore(new Random().nextDouble() * 100);
        }

        for (Student stu :
                studentGroup) {
            sortedScoreList.put(stu.getStuName(), stu.stuSubject.getAverageScore());
        }

        Map<String, Double> w = sortByValue(sortedScoreList);

        Set set = w.entrySet();
        Iterator iterator = set.iterator();
        while(iterator.hasNext()) {
            Map.Entry mentry = (Map.Entry)iterator.next();
            System.out.print("Name: "+ mentry.getKey() + "    Average Score:" + mentry.getValue());
            System.out.println("\n");
        }
    }
}
