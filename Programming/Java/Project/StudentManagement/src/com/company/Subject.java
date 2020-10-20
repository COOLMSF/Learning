package com.company;

public class Subject {
//    public Score score = new Score();
//    private String subjectName;
//
//    Subject() {
//        this.subjectName = "unknown";
//    }
//
//    public void setSubjectName(String subjectName) {
//        this.subjectName = subjectName;
//    }
//
//    public String getSubjectName() {
//        return subjectName;
//    }
//
//    public Chinese chinese = new Chinese();
//    public English english = new English();
//    public MAth math = new MAth();
//
//    void printSubjectScore() {
//        System.out.println("Chinese:" + chinese.getScore());
//        System.out.println("English:" + english.getScore());
//        System.out.println("Math:" + math.getScore());
//    }
//
//    public double getTotalScore() {
//        return chinese.getScore() + english.getScore() + math.getScore();
//    }
//
//    public double getAverageScore() {
//        return ((chinese.getScore() + english.getScore() + math.getScore()) / 3);
//    }
//
//    public void printSortedScore() {
//    }

    private String name;
    private double score;

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public double getScore() {
        return score;
    }
}