package com.company;

import java.util.ArrayList;

public class FactorThreadTest extends Factor implements Runnable {
    private Thread thread;
    private String threadName;

    FactorThreadTest(String threadName) {
        super(123);
        this.threadName = threadName;
    }

    @Override
    public void run() {
        System.out.println(super.getFactor());
    }

    public void start() {
        System.out.println("Thread " + threadName + "started");
        thread = new Thread(this, threadName);
        thread.start();
    }

    @Override
    public ArrayList<Integer> getFactor() {
        return null;
    }
}
