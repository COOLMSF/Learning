import java.io.*;
import java.net.*;

public class Server {
    public static void main(String[] args) {
        try {

            // Create a socket with number
            ServerSocket ss = new ServerSocket(4444);

            Socket s = ss.accept();
            DataInputStream dis = new DataInputStream(s.getInputStream());

            String str = (String)dis.readUTF();
            System.out.println(str);
            ss.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}