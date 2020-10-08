import java.io.File;
import java.io.FileReader;
import java.nio.CharBuffer;

public class ReadAndWriteToFile {
    public static void main(String[] args) {
        try {
            File testFile = new File("test.txt");

            if (testFile.createNewFile()) {
                System.out.printf("New file created:%s\n", testFile.getName());
            } else {
                System.out.println("File alread existed.");
            }
        } catch (Exception e) {
            System.out.println("An error occured.");
            e.printStackTrace();
        }

        try {
            FileReader fileReader = new FileReader("test.txt");
        } catch (Exception e) {
            System.out.println("An error occoured.");
            e.printStackTrace();
        }

        try {
            int i = 0;
            while ((i = fileReader.read()) != -1) {
                System.out.print((char)i);
            }
        } catch (Exception e) {
            System.out.println("An error occoured.");
            e.printStackTrace();
        }
    }
}