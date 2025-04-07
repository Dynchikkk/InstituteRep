package calculator.Core;

import Udp.IntegralRequestPacket;
import Udp.IntegralResponsePacket;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class UdpClient {
    private final int _serverPort;
    private final String _serverHost;
    private final DatagramSocket _socket;
    
    public UdpClient(String serverHost, int serverPort, int clientPort) throws Exception {
        _serverHost = serverHost;
        _serverPort = serverPort;
        _socket = new DatagramSocket(clientPort);
        _socket.setSoTimeout(0);
    }
    
    // Отправка сообщения о регистрации на сервер
    public void register() {
        try {
            byte[] data = "REGISTER".getBytes();
            DatagramPacket packet = new DatagramPacket(
                    data, data.length, InetAddress.getByName(_serverHost), _serverPort);
            _socket.send(packet);
            System.out.println("The client has sent a message about registration");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    public void close() {
        if (_socket != null && !_socket.isClosed()) {
            _socket.close();
        }
    }
    
    // Прослушивание входящих UDP-запросов
    public void listenForRequests() {
        new Thread(() -> {
            byte[] buf = new byte[1024];
            while (true) {
                try {
                    DatagramPacket packet = new DatagramPacket(buf, buf.length);
                    _socket.receive(packet);
                    IntegralRequestPacket request = deserializeRequest(packet);
                    System.out.println("Request received: [" + 
                            request.getStart() + ", " + 
                            request.getEnd() + ", " + 
                            request.getStepWidth() + "]");
                    double partialResult = processRequest(request);
                    sendResponse(packet.getAddress(), packet.getPort(), partialResult);
                    System.out.println("The result has been sent: " + partialResult);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }
    
    // Преобразование UDP-пакета в объект запроса
    private IntegralRequestPacket deserializeRequest(DatagramPacket packet) throws Exception {
        ByteArrayInputStream bais = new ByteArrayInputStream(packet.getData(), 0, packet.getLength());
        ObjectInputStream ois = new ObjectInputStream(bais);
        return (IntegralRequestPacket) ois.readObject();
    }
    
    // Обработка запроса с использованием Callable и Future
    private double processRequest(IntegralRequestPacket request) throws StepException {
        final int THREAD_COUNT = 5;
        double start = request.getStart();
        double end = request.getEnd();
        double stepWidth = request.getStepWidth();
        
        double sign = (start > end) ? -1.0 : 1.0;
        if (start > end) {
            double tmp = start;
            start = end;
            end = tmp;
        }
        if (stepWidth > (end - start)) {
            throw new StepException(stepWidth, start, end);
        }
        
        double totalInterval = end - start;
        double subIntervalLength = totalInterval / THREAD_COUNT;
        
        ExecutorService executor = Executors.newFixedThreadPool(THREAD_COUNT);
        List<Future<Double>> futures = new ArrayList<>();
        
        for (int i = 0; i < THREAD_COUNT; i++) {
            double subStart = start + i * subIntervalLength;
            double subEnd = (i == THREAD_COUNT - 1) ? end : subStart + subIntervalLength;
            
            IntegralCallable task = new IntegralCallable(subStart, subEnd, stepWidth);
            futures.add(executor.submit(task));
        }
        
        double sum = 0.0;
        for (Future<Double> future : futures) {
            try {
                sum += future.get();
            } catch (InterruptedException | ExecutionException e) {
                e.printStackTrace();
            }
        }
        
        executor.shutdown();
        return sign * sum;
    }
    
    // Отправка результата вычисления обратно серверу
    private void sendResponse(InetAddress address, int port, double partialResult) throws Exception {
        IntegralResponsePacket response = new IntegralResponsePacket(partialResult);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ObjectOutputStream oos = new ObjectOutputStream(baos);
        oos.writeObject(response);
        oos.flush();
        byte[] responseData = baos.toByteArray();
        DatagramPacket responsePacket = new DatagramPacket(responseData, responseData.length, address, port);
        _socket.send(responsePacket);
    }
}
