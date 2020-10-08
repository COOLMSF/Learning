package com.company;

public class FactorThreadTest extends Factor implements Runnable {
    private Thread thread;
    private String threadName;

    FactorThreadTest(String threadName) {
        this.threadName = threadName;
    }

    @Override
    public void run() {
        System.out.println(super.getFactor(100));
    }

    public void start() {
        System.out.println("Thread " + threadName + "started");
        thread = new Thread(this, threadName);
        thread.start();
    }
}
