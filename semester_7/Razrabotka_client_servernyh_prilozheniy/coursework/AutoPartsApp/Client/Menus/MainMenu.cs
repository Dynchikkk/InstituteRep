using Client.Api;
using Client.Utils;
using SharedModels;

namespace Client.Menus;

public class MainMenu
{
    private readonly ApiClient _api;

    public MainMenu(ApiClient api) { _api = api; }

    public async Task RunAsync()
    {
        Console.WriteLine(await _api.PingAsync());
        ConsoleHelper.Pause();

        while (true)
        {
            Console.Clear();
            Console.WriteLine("=== Supplier–Client Console ===");
            Console.WriteLine("1) Войти");
            Console.WriteLine("2) Просмотреть категории и товары (без входа)");
            Console.WriteLine("0) Выход");

            int choice = ConsoleHelper.ReadInt("Выбор: ", 0, 2);
            if (choice == 0)
            {
                break;
            }

            if (choice == 1)
            {
                string login = ConsoleHelper.ReadNonEmpty("Login: ");
                Console.Write("Password: ");
                string pwd = Console.ReadLine() ?? string.Empty;

                Models.AuthResultDto? auth = await _api.LoginAsync(login, pwd);
                if (auth == null || !auth.Success)
                {
                    Console.WriteLine("Ошибка авторизации: " + (auth?.ErrorMessage ?? "нет ответа"));
                    ConsoleHelper.Pause();
                    continue;
                }

                if (auth.Role == nameof(Role.Client))
                {
                    ClientMenu clientMenu = new(_api, auth.UserId!.Value);
                    await clientMenu.RunAsync();
                }
                else if (auth.Role == nameof(Role.Supplier))
                {
                    SupplierMenu supplierMenu = new(_api, auth.UserId!.Value);
                    await supplierMenu.RunAsync();
                }
                else
                {
                    Console.WriteLine("Неизвестная роль");
                    ConsoleHelper.Pause();
                }
            }
            else if (choice == 2)
            {
                await ShowCategoriesAndParts();
                ConsoleHelper.Pause();
            }
        }
    }

    private async Task ShowCategoriesAndParts()
    {
        IEnumerable<PartCategory>? cats = await _api.GetCategoriesAsync();
        if (cats == null)
        {
            Console.WriteLine("Не удалось получить категории");
            return;
        }

        Console.WriteLine("Категории:");
        foreach (PartCategory c in cats)
        {
            Console.WriteLine($"{c.Id}) {c.Name}");
        }

        int catId = ConsoleHelper.ReadInt("Введите id категории для просмотра (0 - отмена): ", 0, int.MaxValue);
        if (catId == 0)
        {
            return;
        }

        IEnumerable<Part>? parts = await _api.GetPartsAsync(catId, null);
        if (parts == null) { Console.WriteLine("Нет деталей"); return; }

        Console.WriteLine("Детали:");
        foreach (Part p in parts)
        {
            Console.WriteLine($"{p.Id}) {p.Name} — price: {p.Price} qty: {p.Quantity} supplier:{p.SupplierId}");
        }
    }
}
