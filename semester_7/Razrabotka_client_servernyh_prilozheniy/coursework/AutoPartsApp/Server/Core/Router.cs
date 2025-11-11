using System.Net;

namespace Server.Core
{
    /// <summary>
    /// Simple routing system to map (method, path) to a specific handler.
    /// </summary>
    public class Router
    {
        private readonly Dictionary<(string method, string path), Func<HttpContext, Task>> _routes = new();

        public void Register(string method, string path, Func<HttpContext, Task> handler)
        {
            _routes[(method.ToUpperInvariant(), path.ToLowerInvariant())] = handler;
        }

        public async Task RouteAsync(HttpContext context)
        {
            var key = (context.HttpMethod, context.Path.ToLowerInvariant());

            if (_routes.TryGetValue(key, out var handler))
            {
                await handler(context);
            }
            else
            {
                await context.WriteTextAsync("Route not found", HttpStatusCode.NotFound);
            }
        }
    }
}
