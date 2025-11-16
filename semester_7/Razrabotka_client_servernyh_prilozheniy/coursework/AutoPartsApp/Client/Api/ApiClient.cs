using Client.Models;
using SharedModels;
using System.Net.Http.Json;
using System.Text.Json;

namespace Client.Api;

public sealed class ApiClient : IDisposable
{
    private readonly HttpClient _http;
    private readonly JsonSerializerOptions _jsonOptions;

    public string BaseUrl { get; }

    public ApiClient(string baseUrl = "http://localhost:8080/")
    {
        if (!baseUrl.EndsWith("/"))
        {
            baseUrl += "/";
        }

        BaseUrl = baseUrl;

        // Настраиваем HttpClient для правильной работы
        _http = new HttpClient()
        {
            Timeout = TimeSpan.FromSeconds(30)
        };

        _jsonOptions = new JsonSerializerOptions()
        {
            PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
            PropertyNameCaseInsensitive = true
        };
    }

    public async Task<string> PingAsync()
    {
        try
        {
            string url = BaseUrl + "ping";
            HttpResponseMessage response = await _http.GetAsync(url);
            return response.IsSuccessStatusCode ? await response.Content.ReadAsStringAsync() : $"HTTP Error: {response.StatusCode}";
        }
        catch (Exception ex)
        {
            return $"Ping failed: {ex.Message}";
        }
    }

    // Обновим методы для лучшей обработки ошибок
    private async Task<T?> GetAsync<T>(string path)
    {
        try
        {
            string url = BaseUrl + path.TrimStart('/');
            using HttpResponseMessage res = await _http.GetAsync(url);
            if (res.IsSuccessStatusCode)
            {
                return await res.Content.ReadFromJsonAsync<T>(_jsonOptions);
            }

            Console.WriteLine($"GET {path} failed: {res.StatusCode}");
            return default;
        }
        catch (Exception ex)
        {
            Console.WriteLine($"GET {path} error: {ex.Message}");
            return default;
        }
    }

    private async Task<T?> PostAsync<T>(string path, object? body)
    {
        try
        {
            string url = BaseUrl + path.TrimStart('/');
            using HttpResponseMessage res = await _http.PostAsJsonAsync(url, body ?? new { }, _jsonOptions);
            if (res.IsSuccessStatusCode)
            {
                return await res.Content.ReadFromJsonAsync<T>(_jsonOptions);
            }

            Console.WriteLine($"POST {path} failed: {res.StatusCode}");
            return default;
        }
        catch (Exception ex)
        {
            Console.WriteLine($"POST {path} error: {ex.Message}");
            return default;
        }
    }

    private async Task<bool> PostNoResultAsync(string path, object? body)
    {
        string url = BaseUrl + path.TrimStart('/');
        using HttpResponseMessage res = await _http.PostAsJsonAsync(url, body ?? new { }, _jsonOptions);
        return res.IsSuccessStatusCode;
    }

    // Auth
    public Task<AuthResultDto?> LoginAsync(string login, string password)
    {
        return PostAsync<AuthResultDto>("auth/login", new LoginRequestDto(login, password));
    }

    // Parts
    public Task<IEnumerable<Part>?> GetPartsAsync(int? categoryId = null, int? supplierId = null)
    {
        List<string> qs = [];
        if (categoryId != null)
        {
            qs.Add($"categoryId={categoryId}");
        }

        if (supplierId != null)
        {
            qs.Add($"supplierId={supplierId}");
        }

        string path = "parts" + (qs.Count > 0 ? "?" + string.Join("&", qs) : "");
        return GetAsync<IEnumerable<Part>>(path);
    }

    public Task<Part?> AddPartAsync(Part p)
    {
        return PostAsync<Part>("parts/add", p);
    }

    public Task<bool> UpdatePartAsync(Part p)
    {
        return PostNoResultAsync("parts/update", p);
    }

    // Messages
    public Task<IEnumerable<Message>?> GetConversationAsync(int clientId, int supplierId)
    {
        return GetAsync<IEnumerable<Message>>($"messages?clientId={clientId}&supplierId={supplierId}");
    }

    public Task<Message?> SendMessageAsync(Message m)
    {
        return PostAsync<Message>("messages/send", m);
    }

    // Ratings
    public async Task<double?> GetAverageRatingAsync(int supplierId)
    {
        JsonElement? el = await GetAsync<JsonElement?>($"ratings/average?supplierId={supplierId}");
        return el is JsonElement je && je.TryGetProperty("Average", out JsonElement avg) ? avg.GetDouble() : (double?)null;
    }

    public async Task<int?> GetPersonalRatingAsync(int clientId, int supplierId)
    {
        JsonElement? el = await GetAsync<JsonElement?>($"ratings/personal?clientId={clientId}&supplierId={supplierId}");
        return el is JsonElement je && je.TryGetProperty("Rating", out JsonElement r) ? r.GetInt32() : (int?)null;
    }

    public Task<Rating?> SetRatingAsync(int clientId, int supplierId, int value)
    {
        return PostAsync<Rating>("ratings/set", new SetRatingDto(clientId, supplierId, value));
    }

    // Basket
    public Task<IEnumerable<BasketItem>?> BuildBasketAsync(int clientId, int categoryId, int quantity)
    {
        return PostAsync<IEnumerable<BasketItem>>("basket/build", new BuildBasketDto(clientId, categoryId, quantity));
    }

    public Task<IEnumerable<BasketItem>?> GetBasketAsync(int clientId)
    {
        return GetAsync<IEnumerable<BasketItem>>($"basket?clientId={clientId}");
    }

    // Categories
    public Task<IEnumerable<PartCategory>?> GetCategoriesAsync()
    {
        return GetAsync<IEnumerable<PartCategory>>("categories");
    }

    public async Task<int?> AddCategoryAsync(string name)
    {
        JsonElement? el = await PostAsync<JsonElement?>("categories/add", new AddCategoryDto(name));
        return el is JsonElement je && je.TryGetProperty("id", out JsonElement id) ? id.GetInt32() : (int?)null;
    }

    public void Dispose()
    {
        _http.Dispose();
    }
}
