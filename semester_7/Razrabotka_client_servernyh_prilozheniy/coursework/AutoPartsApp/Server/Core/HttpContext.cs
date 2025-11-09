using System.Net;
using System.Text;
using System.Text.Json;

namespace Server.Core
{
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
            using var reader = new StreamReader(Request.InputStream, Request.ContentEncoding);
            var body = await reader.ReadToEndAsync();
            if (string.IsNullOrWhiteSpace(body))
            {
                return default;
            }

            return JsonSerializer.Deserialize<T>(body, new JsonSerializerOptions { PropertyNameCaseInsensitive = true });
        }

        public async Task WriteJsonAsync(object data, HttpStatusCode status = HttpStatusCode.OK)
        {
            var json = JsonSerializer.Serialize(data, new JsonSerializerOptions { WriteIndented = true });
            var bytes = Encoding.UTF8.GetBytes(json);
            Response.ContentType = "application/json";
            Response.StatusCode = (int)status;
            await Response.OutputStream.WriteAsync(bytes);
            Response.Close();
        }

        public async Task WriteTextAsync(string text, HttpStatusCode status = HttpStatusCode.OK)
        {
            var bytes = Encoding.UTF8.GetBytes(text);
            Response.ContentType = "text/plain";
            Response.StatusCode = (int)status;
            await Response.OutputStream.WriteAsync(bytes);
            Response.Close();
        }
    }
}
