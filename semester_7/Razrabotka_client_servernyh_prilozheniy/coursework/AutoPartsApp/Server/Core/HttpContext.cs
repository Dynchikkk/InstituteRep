using System.Net;
using System.Text;
using System.Text.Json;

namespace Server.Core;

/// <summary>
/// Lightweight wrapper around HttpListenerContext for simplified access to request/response.
/// </summary>
public class HttpContext
{
    public HttpListenerContext RawContext { get; }

    public HttpListenerRequest Request => RawContext.Request;
    public HttpListenerResponse Response => RawContext.Response;
    public string HttpMethod => Request.HttpMethod.ToUpperInvariant();
    public string Path => Request.Url?.AbsolutePath ?? "";

    public HttpContext(HttpListenerContext context)
    {
        RawContext = context;
    }

    public async Task<T?> ReadJsonAsync<T>()
    {
        using StreamReader reader = new(Request.InputStream, Request.ContentEncoding);
        string body = await reader.ReadToEndAsync();
        return string.IsNullOrWhiteSpace(body)
            ? default
            : JsonSerializer.Deserialize<T>(body, new JsonSerializerOptions { PropertyNameCaseInsensitive = true });
    }

    public async Task WriteJsonAsync(object data, HttpStatusCode status = HttpStatusCode.OK)
    {
        string json = JsonSerializer.Serialize(data, new JsonSerializerOptions { WriteIndented = true });
        byte[] bytes = Encoding.UTF8.GetBytes(json);
        Response.ContentType = "application/json";
        Response.StatusCode = (int)status;
        await Response.OutputStream.WriteAsync(bytes);
        Response.Close();
    }

    public async Task WriteTextAsync(string text, HttpStatusCode status = HttpStatusCode.OK)
    {
        byte[] bytes = Encoding.UTF8.GetBytes(text);
        Response.ContentType = "text/plain; charset=utf-8"; // Добавляем charset
        Response.StatusCode = (int)status;
        Response.ContentLength64 = bytes.Length; // Добавляем длину контента
        await Response.OutputStream.WriteAsync(bytes, 0, bytes.Length);
        Response.Close();
    }
}
