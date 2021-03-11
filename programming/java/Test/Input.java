import java.util.*;
import com.coolder.test.UsePackage;

public class Input {
    public static void main(String[] args) {

        System.out.println("Whow is the best hacker of the world:");

        String nameOfBestHacker;
        Scanner in = new Scanner(System.in);
        nameOfBestHacker = in.nextLine();
        in.close();

        if (nameOfBestHacker.compareTo("coolder") == 0) {
            System.out.println("Yes, coolder is the best hacker of the world.");
        } else {
            System.out.println("How you don't know who is the best hacker in the world?");
        }

        Tester.aMethod();
    }
}
