package com.company;

public class OriginalProxy implements StaticProxyTestInterface {
    private Original original;

    OriginalProxy(Original original1) {
        this.original = original1;
    }

    @Override
    public void doHack(String opration) {
        System.out.println("Hacking in Proxy");
    }
}
