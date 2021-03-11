import java.awt.*;
import java.awt.event.*;
import java.time.*;
import javax.swing.*;

public class TimerTest {
    public static void main(String[] args) {
        var listener = new TimePrinter();
        var timer = new Timer(1000 , listener);

        timer.start();

        JOptionPane.showMessageDialog(null, "Quit program?");
        System.exit(0);
    }
}

class TimePrinter implements ActionListener {
    @Override
    public void actionPerformed(ActionEvent actionEvent) {
        System.out.println("At the home, the time is " + Instant.ofEpochSecond(actionEvent.getWhen()));
        Toolkit.getDefaultToolkit().beep();
    }
}