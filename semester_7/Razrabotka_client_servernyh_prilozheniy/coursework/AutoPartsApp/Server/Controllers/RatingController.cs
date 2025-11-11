using Server.Core;
using Server.Dtos;
using Server.Services;

namespace Server.Controllers
{
    public class RatingController : ControllerBase
    {
        private readonly RatingService _svc;

        public RatingController(RatingService svc) => _svc = svc;

        // GET /ratings/average?supplierId=...
        public async Task GetAverage(HttpContext ctx)
        {
            var q = ctx.Request.QueryString;
            if (!int.TryParse(q["supplierId"], out var supplierId))
            {
                await Error(ctx, "supplierId required");
                return;
            }

            var avg = await _svc.GetAverageAsync(supplierId);
            await Json(ctx, new { SupplierId = supplierId, Average = avg });
        }

        // GET /ratings/personal?clientId=...&supplierId=...
        public async Task GetPersonal(HttpContext ctx)
        {
            var q = ctx.Request.QueryString;
            if (!int.TryParse(q["clientId"], out var clientId) || !int.TryParse(q["supplierId"], out var supplierId))
            {
                await Error(ctx, "clientId and supplierId required");
                return;
            }

            var rating = await _svc.GetPersonalAsync(clientId, supplierId);
            await Json(ctx, new { ClientId = clientId, SupplierId = supplierId, Rating = rating });
        }

        // POST /ratings/set
        // body: { "clientId":..., "supplierId":..., "value": 1..10 }
        public async Task Set(HttpContext ctx)
        {
            var body = await ctx.ReadJsonAsync<SetRatingDto>();
            if (body == null)
            {
                await Error(ctx, "Invalid body");
                return;
            }

            if (body.Value < 1 || body.Value > 10)
            {
                await Error(ctx, "Value must be between 1 and 10");
                return;
            }

            var r = await _svc.SetRatingAsync(body.ClientId, body.SupplierId, body.Value);
            await Json(ctx, r);
        }
    }
}
