using System.Net;

namespace Server.Core;

/// <summary>
/// Base controller providing unified response methods.
/// </summary>
public abstract class ControllerBase
{
    protected async Task Json(HttpContext context, object data, HttpStatusCode status = HttpStatusCode.OK)
    {
        await context.WriteJsonAsync(data, status);
    }

    protected async Task Text(HttpContext context, string text, HttpStatusCode status = HttpStatusCode.OK)
    {
        await context.WriteTextAsync(text, status);
    }

    protected async Task Error(HttpContext context, string message, HttpStatusCode status = HttpStatusCode.BadRequest)
    {
        await Json(context, new { error = message }, status);
    }
}
