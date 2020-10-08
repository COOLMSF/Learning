package com.company;

/*
 * The ball fall from 100 meters hight, bound 1/2 than before
 */

public class Ball {
    private int c = 0;
    private double hight = 100.0;
    private double boundDistance = 0.0;
    private double totalDistance = 0.0;

    Object calculate(int times) {
        this.c = times;
        for (int i = 0; i < times; i++) {
            totalDistance += hight;
            boundDistance = hight * 0.5;
            totalDistance += boundDistance;
            hight = boundDistance;
        }

        return this;
    }

    @Override
    public String toString() {
        calculate(c);
        return "totalDistance:" + totalDistance + " boundDistance:" + boundDistance;
    }
}
