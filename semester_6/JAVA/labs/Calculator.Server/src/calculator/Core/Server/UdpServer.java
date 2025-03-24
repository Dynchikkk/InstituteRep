package calculator.Core.Server;

import Udp.IntegralRequestPacket;
import Udp.IntegralResponsePacket;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketAddress;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.List;

public class UdpServer {
    private final DatagramSocket _socket;
    private final List<SocketAddress> _clientList = new ArrayList<>();
    
    public UdpServer(int port) throws SocketException {
        _socket = new DatagramSocket(port);
    }
    
    // Метод для прослушивания входящих сообщений (регистрация или ответы)
    public void listen() {
        new Thread(() -> {
            byte[] buf = new byte[1024];
            while (true) {
                try {
                    DatagramPacket packet = new DatagramPacket(buf, buf.length);
                    _socket.receive(packet);
                    // Простая обработка: если сообщение – регистрация, добавляем клиента
                    String msg = new String(packet.getData(), 0, packet.getLength());
                    if ("REGISTER".equalsIgnoreCase(msg.trim())) {
                        if (!_clientList.contains(packet.getSocketAddress())) {
                            _clientList.add(packet.getSocketAddress());
                            System.out.println("Зарегистрирован клиент: " + packet.getSocketAddress());
                        }
                    } else {
                        // Обработка ответа с частичным результатом
                        ByteArrayInputStream bais = new ByteArrayInputStream(packet.getData(), 0, packet.getLength());
                        ObjectInputStream ois = new ObjectInputStream(bais);
                        IntegralResponsePacket response = (IntegralResponsePacket) ois.readObject();
                        System.out.println("Получен ответ от " + packet.getSocketAddress() 
                                + " - Частичный результат: " + response.getPartialResult());
                        // Здесь можно сохранять полученные результаты для последующего суммирования
                    }
                } catch (IOException | ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }
    
    // Отправка запроса конкретному клиенту
    public void sendRequest(SocketAddress clientAddress, IntegralRequestPacket request) {
        try {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ObjectOutputStream oos = new ObjectOutputStream(baos);
            oos.writeObject(request);
            oos.flush();
            byte[] data = baos.toByteArray();
            DatagramPacket packet = new DatagramPacket(data, data.length, clientAddress);
            _socket.send(packet);
            System.out.println("Отправлен запрос клиенту " + clientAddress + ": [" 
                    + request.getStart() + ", " + request.getEnd() + "]");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    // Метод для распределения вычислений между всеми клиентами
    public void distributeIntegralCalculation(double bottomBorder, double topBorder, double stepWidth) {
        int clientCount = _clientList.size();
        if (clientCount == 0) {
            System.out.println("Нет зарегистрированных клиентов для выполнения вычислений!");
            return;
        }
        double totalInterval = topBorder - bottomBorder;
        double subIntervalLength = totalInterval / clientCount;
        
        for (int i = 0; i < clientCount; i++) {
            double subStart = bottomBorder + i * subIntervalLength;
            double subEnd = (i == clientCount - 1) ? topBorder : subStart + subIntervalLength;
            IntegralRequestPacket request = new IntegralRequestPacket(subStart, subEnd, stepWidth);
            sendRequest(_clientList.get(i), request);
        }
    }
    
    // Геттер для списка клиентов (например, для UI)
    public List<SocketAddress> getClientList() {
        return _clientList;
    }
    
    public void close() {
        if (_socket != null && !_socket.isClosed()) {
            _socket.close();
        }
    }
}
