using Client.Api;
using Client.Utils;
using SharedModels;

namespace Client.Menus;

public class SupplierMenu
{
    private readonly ApiClient _api;
    private readonly int _supplierId;

    public SupplierMenu(ApiClient api, int supplierId)
    {
        _api = api;
        _supplierId = supplierId;
    }

    public async Task RunAsync()
    {
        while (true)
        {
            Console.Clear();
            Console.WriteLine($"=== Supplier Menu (id={_supplierId}) ===");
            Console.WriteLine("1) Посмотреть мои товары");
            Console.WriteLine("2) Добавить товар");
            Console.WriteLine("3) Обновить товар (количество/цена)");
            Console.WriteLine("4) Посмотреть переписку с клиентом");
            Console.WriteLine("5) Посмотреть рейтинги (средние и персональные)");
            Console.WriteLine("0) Выйти");

            int c = ConsoleHelper.ReadInt("Выбор: ", 0, 5);
            if (c == 0)
            {
                break;
            }

            try
            {
                switch (c)
                {
                    case 1: await ShowMyParts(); break;
                    case 2: await AddPartFlow(); break;
                    case 3: await UpdatePartFlow(); break;
                    case 4: await ConversationFlow(); break;
                    case 5: await ShowRatings(); break;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Ошибка: " + ex.Message);
            }

            ConsoleHelper.Pause();
        }
    }

    private async Task ShowMyParts()
    {
        IEnumerable<Part>? parts = await _api.GetPartsAsync(null, _supplierId);
        if (parts == null || !parts.Any()) { Console.WriteLine("Нет товаров"); return; }

        foreach (Part p in parts)
        {
            Console.WriteLine($"{p.Id}) {p.Name} — {p.Price} qty:{p.Quantity} cat:{p.CategoryId}");
        }
    }

    private async Task AddPartFlow()
    {
        string name = ConsoleHelper.ReadNonEmpty("Name: ");
        int catId = ConsoleHelper.ReadInt("CategoryId: ", 1, int.MaxValue);
        double price = ConsoleHelper.ReadDouble("Price: ");
        int qty = ConsoleHelper.ReadInt("Quantity: ", 0, int.MaxValue);

        Part part = new() { Name = name, CategoryId = catId, SupplierId = _supplierId, Price = price, Quantity = qty };
        Part? created = await _api.AddPartAsync(part);
        Console.WriteLine(created != null ? $"Added id={created.Id}" : "Failed");
    }

    private async Task UpdatePartFlow()
    {
        int id = ConsoleHelper.ReadInt("PartId: ", 1, int.MaxValue);
        Part? existing = (await _api.GetPartsAsync(null, _supplierId)).FirstOrDefault(p => p.Id == id);
        if (existing == null) { Console.WriteLine("Не найдено"); return; }

        double price = ConsoleHelper.ReadDouble($"Price ({existing.Price}): ");
        int qty = ConsoleHelper.ReadInt($"Quantity ({existing.Quantity}): ", 0, int.MaxValue);

        existing.Price = price;
        existing.Quantity = qty;
        bool ok = await _api.UpdatePartAsync(existing);
        Console.WriteLine(ok ? "Updated" : "Failed");
    }

    private async Task ConversationFlow()
    {
        int clientId = ConsoleHelper.ReadInt("ClientId: ", 1, int.MaxValue);
        IEnumerable<Message>? conv = await _api.GetConversationAsync(clientId, _supplierId);
        if (conv != null)
        {
            Console.WriteLine("=== Conversation ===");
            foreach (Message m in conv)
            {
                Console.WriteLine($"[{m.SentAt:u}] {(m.FromRole == Role.Supplier ? "You" : "Client")} : {m.Text}");
            }
        }

        Console.Write("Write message (empty - skip): ");
        string? txt = Console.ReadLine();
        if (!string.IsNullOrWhiteSpace(txt))
        {
            Message msg = new() { ClientId = clientId, SupplierId = _supplierId, FromRole = Role.Supplier, Text = txt, SentAt = DateTime.UtcNow };
            Message? saved = await _api.SendMessageAsync(msg);
            Console.WriteLine(saved != null ? "Sent" : "Failed");
        }
    }

    private async Task ShowRatings()
    {
        IEnumerable<Part>? parts = await _api.GetPartsAsync();
        IEnumerable<int>? suppliers = parts?.Select(p => p.SupplierId).Distinct();
        if (suppliers == null) { Console.WriteLine("Нет данных"); return; }

        Console.WriteLine("Средние рейтинги (по поставщикам):");
        foreach (int s in suppliers)
        {
            double? avg = await _api.GetAverageRatingAsync(s);
            Console.WriteLine($"{s}: {(avg.HasValue ? avg.Value.ToString("0.00") : "—")}");
        }

        int clientId = ConsoleHelper.ReadInt("Enter clientId to view personal rating (0 to skip): ", 0, int.MaxValue);
        if (clientId == 0)
        {
            return;
        }

        int? personal = await _api.GetPersonalRatingAsync(clientId, _supplierId);
        Console.WriteLine(personal.HasValue ? $"Client {clientId} rating: {personal.Value}" : "No rating from client");
    }
}
