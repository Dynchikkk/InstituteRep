using System.Net;

namespace Server.Core
{
    /// <summary>
    /// Simple HTTP router: maps request paths to controller actions.
    /// </summary>
    public class Router
    {
        private readonly Dictionary<string, Func<HttpContext, Task>> _getRoutes = new();
        private readonly Dictionary<string, Func<HttpContext, Task>> _postRoutes = new();

        public void RegisterGet(string path, Func<HttpContext, Task> handler)
        {
            _getRoutes[path.ToLower()] = handler;
        }

        public void RegisterPost(string path, Func<HttpContext, Task> handler)
        {
            _postRoutes[path.ToLower()] = handler;
        }

        public async Task RouteAsync(HttpContext context)
        {
            var method = context.HttpMethod;
            var path = context.Path.ToLower();

            Func<HttpContext, Task>? handler = method switch
            {
                "GET" => _getRoutes.ContainsKey(path) ? _getRoutes[path] : null,
                "POST" => _postRoutes.ContainsKey(path) ? _postRoutes[path] : null,
                _ => null
            };

            if (handler == null)
            {
                await context.WriteJsonAsync(new { error = "Not Found" }, HttpStatusCode.NotFound);
                return;
            }

            await handler(context);
        }
    }
}
