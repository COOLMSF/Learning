import java.io.DataOutputStream;
import java.net.Socket;

public class Client {
    public static void main(String[] args) {
        try {
            Socket s = new Socket("localhost", 4444);
            System.out.println("Print someghing");
            System.out.println(s.toString());

            DataOutputStream dout = new DataOutputStream(s.getOutputStream());
            dout.writeUTF("你好");
            dout.flush();
            dout.close();
            s.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
