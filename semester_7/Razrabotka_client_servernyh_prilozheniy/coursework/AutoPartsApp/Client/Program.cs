using Client.Api;
using Client.Menus;

internal class Program
{
    public static async Task<int> Main(string[] args)
    {
        Console.OutputEncoding = System.Text.Encoding.UTF8;
        string baseUrl = args.Length > 0 ? args[0] : "http://localhost:8080/";

        using ApiClient api = new(baseUrl);
        MainMenu main = new(api);
        await main.RunAsync();
        return 0;
    }
}
