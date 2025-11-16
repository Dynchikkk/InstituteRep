using System.Net;

namespace Server.Core;

/// <summary>
/// Simple routing system to map (method, path) to a specific handler.
/// </summary>
public class Router
{
    private readonly Dictionary<(string method, string path), Func<HttpContext, Task>> _routes = [];

    public void Register(string method, string path, Func<HttpContext, Task> handler)
    {
        _routes[(method.ToUpperInvariant(), path.ToLowerInvariant())] = handler;
    }

    public async Task RouteAsync(HttpContext context)
    {
        (string HttpMethod, string) key = (context.HttpMethod, context.Path.ToLowerInvariant());

        if (_routes.TryGetValue(key, out Func<HttpContext, Task>? handler))
        {
            await handler(context);
        }
        else
        {
            await context.WriteTextAsync("Route not found", HttpStatusCode.NotFound);
        }
    }
}
