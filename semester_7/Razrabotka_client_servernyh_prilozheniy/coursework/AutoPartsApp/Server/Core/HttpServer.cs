using System.Net;

namespace Server.Core
{
    /// <summary>
    /// Core HTTP server based on HttpListener. 
    /// Listens to requests and dispatches them to the router.
    /// </summary>
    public class HttpServer
    {
        private readonly HttpListener _listener;
        private readonly Router _router;
        private bool _isRunning;

        public HttpServer(string prefix, Router router)
        {
            _listener = new HttpListener();
            _listener.Prefixes.Add(prefix.EndsWith("/") ? prefix : prefix + "/");
            _router = router;
        }

        public async Task StartAsync(CancellationToken cancellationToken = default)
        {
            _isRunning = true;
            _listener.Start();
            Console.WriteLine($"[SERVER] Listening on {_listener.Prefixes.First()}");

            while (_isRunning && !cancellationToken.IsCancellationRequested)
            {
                try
                {
                    var context = await _listener.GetContextAsync();
                    _ = HandleRequestAsync(context);
                }
                catch (HttpListenerException ex) when (ex.ErrorCode == 995) // cancelled
                {
                    break;
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"[ERROR] Listener exception: {ex.Message}");
                }
            }

            _listener.Stop();
            Console.WriteLine("[SERVER] Stopped");
        }

        private async Task HandleRequestAsync(HttpListenerContext listenerContext)
        {
            var context = new HttpContext(listenerContext);

            try
            {
                await _router.RouteAsync(context);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"[ERROR] Unhandled request exception: {ex}");
                await context.WriteJsonAsync(new { error = "Internal server error" }, HttpStatusCode.InternalServerError);
            }
        }

        public void Stop()
        {
            _isRunning = false;
            _listener.Stop();
        }
    }
}
