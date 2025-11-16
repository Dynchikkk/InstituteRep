using System.Net;

namespace Server.Core;

/// <summary>
/// Basic asynchronous HTTP server built on HttpListener.
/// </summary>
public class HttpServer
{
    private readonly HttpListener _listener = new();
    private readonly Router _router;

    public HttpServer(string prefix, Router router)
    {
        _router = router;
        _listener.Prefixes.Add(prefix);
    }

    public async Task StartAsync(CancellationToken token = default)
    {
        _listener.Start();
        Console.WriteLine($"[Server] Listening on {_listener.Prefixes.First()}");

        while (!token.IsCancellationRequested)
        {
            HttpListenerContext context = await _listener.GetContextAsync();
            _ = Task.Run(() => HandleRequestAsync(context));
        }

        _listener.Stop();
    }

    private async Task HandleRequestAsync(HttpListenerContext context)
    {
        try
        {
            HttpContext httpContext = new(context);
            await _router.RouteAsync(httpContext);
        }
        catch (Exception ex)
        {
            Console.WriteLine($"[Error] {ex.Message}");
            context.Response.StatusCode = (int)HttpStatusCode.InternalServerError;
            await using StreamWriter writer = new(context.Response.OutputStream);
            await writer.WriteAsync("Internal Server Error");
            context.Response.Close();
        }
    }
}
