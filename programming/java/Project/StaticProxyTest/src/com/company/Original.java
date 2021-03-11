package com.company;

public class Original implements StaticProxyTestInterface {
    void Hack(String target) {
        System.out.println("Hacking " + target);
    }

    void Crack(String target) {
        System.out.println("Cracking " + target);
    }

    @Override
    public void doHack(String opration) {
        System.out.println("Hacking with " + opration);
    }
}
