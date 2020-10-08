import java.util.Date;

class Tester {
    public static void aMethod() {
        System.out.println("I just print some strings.");
    }

    public static void main(String[] args) {

        Date aDate = new Date();
        System.out.println(aDate.getClass().getPackage());
    }
}