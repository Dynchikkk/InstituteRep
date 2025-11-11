using Server.Core;
using Server.Services;
using SharedModels;

namespace Server.Controllers
{
    public class PartController : ControllerBase
    {
        private readonly PartService _svc;

        public PartController(PartService svc) => _svc = svc;

        // GET /parts                   -> all parts
        // GET /parts?categoryId=1      -> by category
        // GET /parts?supplierId=1      -> by supplier
        public async Task Get(HttpContext ctx)
        {
            var q = ctx.Request.QueryString;
            if (int.TryParse(q["categoryId"], out var catId))
            {
                var parts = await _svc.GetByCategoryAsync(catId);
                await Json(ctx, parts);
                return;
            }

            if (int.TryParse(q["supplierId"], out var supplierId))
            {
                var parts = await _svc.GetBySupplierAsync(supplierId);
                await Json(ctx, parts);
                return;
            }

            var all = await _svc.GetAllAsync();
            await Json(ctx, all);
        }

        // POST /parts/add
        // body: Part (JSON)
        public async Task Add(HttpContext ctx)
        {
            var part = await ctx.ReadJsonAsync<Part>();
            if (part == null)
            {
                await Error(ctx, "Invalid part body");
                return;
            }

            var created = await _svc.AddAsync(part);
            await Json(ctx, created);
        }

        // POST /parts/update
        public async Task Update(HttpContext ctx)
        {
            var part = await ctx.ReadJsonAsync<Part>();
            if (part == null || part.Id == 0)
            {
                await Error(ctx, "Invalid part body or missing Id");
                return;
            }

            await _svc.UpdateAsync(part);
            await Json(ctx, new { ok = true });
        }
    }
}
