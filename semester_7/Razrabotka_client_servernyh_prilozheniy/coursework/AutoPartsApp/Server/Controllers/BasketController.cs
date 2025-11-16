using Server.Core;
using Server.Dtos;
using Server.Services;

namespace Server.Controllers;

public class BasketController : ControllerBase
{
    private readonly BasketService _svc;

    public BasketController(BasketService svc)
    {
        _svc = svc;
    }

    // POST /basket/build
    // body: { clientId, categoryId, quantity }
    public async Task Build(HttpContext ctx)
    {
        BuildBasketDto? req = await ctx.ReadJsonAsync<BuildBasketDto>();
        if (req == null)
        {
            await Error(ctx, "Invalid body");
            return;
        }

        IEnumerable<SharedModels.BasketItem> basket = await _svc.BuildAsync(req.ClientId, req.CategoryId, req.Quantity);
        await Json(ctx, basket);
    }

    // GET /basket?clientId=...
    public async Task Get(HttpContext ctx)
    {
        System.Collections.Specialized.NameValueCollection q = ctx.Request.QueryString;
        if (!int.TryParse(q["clientId"], out int clientId))
        {
            await Error(ctx, "clientId required");
            return;
        }

        IEnumerable<SharedModels.BasketItem> items = await _svc.GetByClientAsync(clientId);
        await Json(ctx, items);
    }
}
