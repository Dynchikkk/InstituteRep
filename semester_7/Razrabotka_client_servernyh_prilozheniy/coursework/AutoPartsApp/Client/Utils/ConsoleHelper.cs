using System.Globalization;

namespace Client.Utils;

public static class ConsoleHelper
{
    public static int ReadInt(string prompt, int min = int.MinValue, int max = int.MaxValue)
    {
        while (true)
        {
            Console.Write(prompt);
            string? s = Console.ReadLine();
            if (int.TryParse(s, NumberStyles.Integer, CultureInfo.InvariantCulture, out int v) && v >= min && v <= max)
            {
                return v;
            }

            Console.WriteLine($"Введите целое число в диапазоне {min}..{max}");
        }
    }

    public static double ReadDouble(string prompt, double min = double.MinValue, double max = double.MaxValue)
    {
        while (true)
        {
            Console.Write(prompt);
            string? s = Console.ReadLine();
            if (double.TryParse(s, NumberStyles.Float | NumberStyles.AllowThousands, CultureInfo.InvariantCulture, out double v) && v >= min && v <= max)
            {
                return v;
            }

            Console.WriteLine($"Введите число в диапазоне {min}..{max}");
        }
    }

    public static string ReadNonEmpty(string prompt)
    {
        while (true)
        {
            Console.Write(prompt);
            string? s = Console.ReadLine();
            if (!string.IsNullOrWhiteSpace(s))
            {
                return s.Trim();
            }

            Console.WriteLine("Значение не может быть пустым");
        }
    }

    public static void Pause() { Console.WriteLine("Нажмите Enter..."); _ = Console.ReadLine(); }
}
