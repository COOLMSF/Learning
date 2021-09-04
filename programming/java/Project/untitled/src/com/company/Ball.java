package com.company;

/*
 * The ball fall from 100 meters hight, bound 1/2 than before
 */

public class Ball {

    private double hight = 100.0;
    private double boundDistance = 0.0;
    private double totalDistance = 0.0;

    void getResult(int times) {

        for (int i = 0; i < times; i++) {

            totalDistance += hight;
            boundDistance = hight * 0.5;
            totalDistance += boundDistance;
            hight = boundDistance;

        }

        System.out.println("totalDistance:" + totalDistance + " boundDistance:" + boundDistance);
    }
}
