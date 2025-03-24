package calculator;

import calculator.Core.Server.UdpServer;
import calculator.UI.MainFrame;
import java.net.SocketException;
import javax.swing.SwingUtilities;

public class Calculator {
    public static void main(String[] args) {
         try {
            UdpServer udpServer = new UdpServer(5000);
            udpServer.listen();
            System.out.println("UDP-сервер запущен на порту 5000...");
            
            SwingUtilities.invokeLater(() -> {
                MainFrame frame = new MainFrame(udpServer);
                frame.setVisible(true);
            });
        } catch (SocketException e) {
            e.printStackTrace();
        }
    }
}
