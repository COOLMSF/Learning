import java.io.FileNotFoundException;
import java.io.FileReader;

public class FileReaderTest {
    public static void main(String args[]) throws FileNotFoundException {
        FileReader fileReader = new FileReader("FileDoesNotExist");

        int i;

        while ((i = fileReader.read()) != -1) {
            System.out.print((char) i);
        }
    }
}