package calculator.Core.Data;

import calculator.Core.Integral.RecIntegral;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

public class DataManager {
    // Save data as text
    public static void saveDataAsText(File file, List<RecIntegral> integrals) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
            for (RecIntegral integral : integrals) {
                writer.write(integral.getTopBorder() + ";" 
                        + integral.getBottomBorder() + ";" 
                        + integral.getStepWidth() + ";" 
                        + integral.getResult());
                writer.newLine();
            }
        }
    }

    // Load data from text
    public static ArrayList<RecIntegral> loadDataFromText(File file) throws IOException {
        ArrayList<RecIntegral> integrals = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(";");
                if (parts.length < 4) {
                    continue;
                } 
                double top = Double.parseDouble(parts[0]);
                double bottom = Double.parseDouble(parts[1]);
                double step = Double.parseDouble(parts[2]);
                double result = Double.parseDouble(parts[3]);
                RecIntegral integral = new RecIntegral(top, bottom, step, result);
                integrals.add(integral);
            }
        } catch (Exception e) {
            throw new IOException("Error when load data: " + e.getMessage());
        }
        return integrals;
    }

    // Save data as binary
    public static void saveDataAsBinary(File file, List<RecIntegral> integrals) throws IOException {
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(file))) {
            oos.writeObject(integrals);
        }
    }

    // Load data from binary
    public static ArrayList<RecIntegral> loadDataFromBinary(File file) throws IOException, ClassNotFoundException {
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(file))) {
            return (ArrayList<RecIntegral>) ois.readObject();
        }
    }
    
     // Сохранение данных в JSON формате с использованием ручного парсера
    public static void saveDataAsJson(File file, List<RecIntegral> integrals) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(
                new OutputStreamWriter(new FileOutputStream(file), StandardCharsets.UTF_8))) {
            writer.write("[\n");
            for (int i = 0; i < integrals.size(); i++) {
                RecIntegral r = integrals.get(i);
                writer.write("  {\"topBorder\": " + r.getTopBorder() +
                             ", \"bottomBorder\": " + r.getBottomBorder() +
                             ", \"stepWidth\": " + r.getStepWidth() +
                             ", \"result\": " + r.getResult() + "}");
                if (i != integrals.size() - 1) {
                    writer.write(",");
                }
                writer.write("\n");
            }
            writer.write("]");
        }
    }
    
    // Загрузка данных из JSON формата с использованием простого ручного парсера
    public static ArrayList<RecIntegral> loadDataFromJson(File file) throws IOException {
        ArrayList<RecIntegral> integrals = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(
                new InputStreamReader(new FileInputStream(file), StandardCharsets.UTF_8))) {
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line.trim());
            }
        }
        String content = sb.toString();
        // Удаляем начальный и конечный квадратные скобки
        if (!content.startsWith("[") || !content.endsWith("]")) {
            throw new IOException("Incorrect JSON format");
        }
        content = content.substring(1, content.length() - 1).trim();
        if (content.isEmpty()) {
            return integrals;
        }
        // Разбиваем на объекты по разделителю "},"
        String[] items = content.split("},");
        for (String sourceItem : items) {
            String item = sourceItem.trim();
            // Если это не последний элемент, добавляем закрывающую фигурную скобку
            if (!item.endsWith("}")) {
                item = item + "}";
            }
            // Удаляем открывающую и закрывающую фигурные скобки
            if (item.startsWith("{") && item.endsWith("}")) {
                item = item.substring(1, item.length() - 1).trim();
            } else {
                throw new IOException("Incorrect JSON format: " + item);
            }
            // Разбиваем строку на пары "ключ: значение"
            String[] pairs = item.split(",");
            double topBorder = 0, bottomBorder = 0, stepWidth = 0, result = 0;
            for (String pair : pairs) {
                String[] keyValue = pair.split(":");
                if (keyValue.length != 2) {
                    continue;
                }
                String key = keyValue[0].trim().replaceAll("\"", "");
                String value = keyValue[1].trim();
                switch (key) {
                    case "topBorder":
                        topBorder = Double.parseDouble(value);
                        break;
                    case "bottomBorder":
                        bottomBorder = Double.parseDouble(value);
                        break;
                    case "stepWidth":
                        stepWidth = Double.parseDouble(value);
                        break;
                    case "result":
                        result = Double.parseDouble(value);
                        break;
                    default:
                        // Неизвестный ключ - можно проигнорировать
                        break;
                }
            }
            try {
                RecIntegral integral = new RecIntegral(topBorder, bottomBorder, stepWidth, result);
                integrals.add(integral);
            } catch (Exception e) {
                throw new IOException("Error when create RecIntegral: " + e.getMessage());
            }
        }
        return integrals;
    }
}
