using Client.Api;
using Client.Utils;
using SharedModels;

namespace Client.Menus;

public class ClientMenu
{
    private readonly ApiClient _api;
    private readonly int _clientId;

    public ClientMenu(ApiClient api, int clientId)
    {
        _api = api;
        _clientId = clientId;
    }

    public async Task RunAsync()
    {
        while (true)
        {
            Console.Clear();
            Console.WriteLine($"=== Client Menu (id={_clientId}) ===");
            Console.WriteLine("1) Просмотреть поставщиков и их средний рейтинг");
            Console.WriteLine("2) Просмотреть товары по категории");
            Console.WriteLine("3) Переписка с поставщиком");
            Console.WriteLine("4) Поставить персональный рейтинг");
            Console.WriteLine("5) Собрать корзину по категории");
            Console.WriteLine("6) Посмотреть текущую корзину");
            Console.WriteLine("0) Выйти");

            int c = ConsoleHelper.ReadInt("Выбор: ", 0, 6);
            if (c == 0)
            {
                break;
            }

            try
            {
                switch (c)
                {
                    case 1: await ShowSuppliersWithRatings(); break;
                    case 2: await ShowPartsByCategory(); break;
                    case 3: await ConversationFlow(); break;
                    case 4: await SetRatingFlow(); break;
                    case 5: await BuildBasketFlow(); break;
                    case 6: await ShowBasket(); break;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Ошибка: " + ex.Message);
            }

            ConsoleHelper.Pause();
        }
    }

    private async Task ShowSuppliersWithRatings()
    {
        IEnumerable<Part>? parts = await _api.GetPartsAsync();
        IEnumerable<int>? suppliers = parts?.Select(p => p.SupplierId).Distinct();
        if (suppliers == null) { Console.WriteLine("Нет данных"); return; }

        Console.WriteLine("Поставщики (id) — средний рейтинг:");
        foreach (int sId in suppliers)
        {
            double? avg = await _api.GetAverageRatingAsync(sId);
            Console.WriteLine($"{sId}: {(avg.HasValue ? avg.Value.ToString("0.00") : "—")}");
        }
    }

    private async Task ShowPartsByCategory()
    {
        IEnumerable<PartCategory>? cats = await _api.GetCategoriesAsync();
        if (cats == null) { Console.WriteLine("Нет категорий"); return; }

        foreach (PartCategory c in cats)
        {
            Console.WriteLine($"{c.Id}) {c.Name}");
        }

        int catId = ConsoleHelper.ReadInt("Категория id: ", 1, int.MaxValue);
        IEnumerable<Part>? parts = await _api.GetPartsAsync(catId, null);
        if (parts == null) { Console.WriteLine("Нет деталей"); return; }

        foreach (Part p in parts)
        {
            Console.WriteLine($"{p.Id}) {p.Name} — {p.Price} — qty:{p.Quantity} supplier:{p.SupplierId}");
        }
    }

    private async Task ConversationFlow()
    {
        int supplierId = ConsoleHelper.ReadInt("SupplierId: ", 1, int.MaxValue);
        IEnumerable<Message>? conv = await _api.GetConversationAsync(_clientId, supplierId);
        if (conv != null)
        {
            Console.WriteLine("=== Conversation ===");
            foreach (Message m in conv)
            {
                Console.WriteLine($"[{m.SentAt:u}] {(m.FromRole == Role.Client ? "You" : "Supplier")} : {m.Text}");
            }
        }

        Console.Write("Write message (empty - skip): ");
        string? txt = Console.ReadLine();
        if (!string.IsNullOrWhiteSpace(txt))
        {
            Message msg = new() { ClientId = _clientId, SupplierId = supplierId, FromRole = Role.Client, Text = txt, SentAt = DateTime.UtcNow };
            Message? saved = await _api.SendMessageAsync(msg);
            Console.WriteLine(saved != null ? "Sent" : "Failed");
        }
    }

    private async Task SetRatingFlow()
    {
        int supplierId = ConsoleHelper.ReadInt("SupplierId: ", 1, int.MaxValue);
        int value = ConsoleHelper.ReadInt("Value (1..10): ", 1, 10);
        Rating? r = await _api.SetRatingAsync(_clientId, supplierId, value);
        Console.WriteLine(r != null ? $"Rating set to {r.Value}" : "Failed");
    }

    private async Task BuildBasketFlow()
    {
        IEnumerable<PartCategory>? cats = await _api.GetCategoriesAsync();
        if (cats == null) { Console.WriteLine("Нет категорий"); return; }

        foreach (PartCategory c in cats)
        {
            Console.WriteLine($"{c.Id}) {c.Name}");
        }

        int catId = ConsoleHelper.ReadInt("CategoryId: ", 1, int.MaxValue);
        int qty = ConsoleHelper.ReadInt("Quantity: ", 1, int.MaxValue);
        IEnumerable<BasketItem>? basket = await _api.BuildBasketAsync(_clientId, catId, qty);
        if (basket == null) { Console.WriteLine("Не удалось собрать корзину"); return; }

        Console.WriteLine("Собранная корзина:");
        foreach (BasketItem it in basket)
        {
            Console.WriteLine($"supplier:{it.SupplierId} part:{it.PartId} qty:{it.Quantity}");
        }
    }

    private async Task ShowBasket()
    {
        IEnumerable<BasketItem>? items = await _api.GetBasketAsync(_clientId);
        if (items == null || !items.Any()) { Console.WriteLine("Корзина пуста"); return; }

        foreach (BasketItem it in items)
        {
            Console.WriteLine($"{it.Id}) supplier:{it.SupplierId} part:{it.PartId} qty:{it.Quantity}");
        }
    }
}
