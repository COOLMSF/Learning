package com.company;

public class Cel2Far {
    private double celsius;
    private double fahrenheit;

    Cel2Far(double celsius) {
        this.celsius = celsius;
    }

    public double getFar() {
        return (celsius * 9 / 5.0) + 32;
    }
}
