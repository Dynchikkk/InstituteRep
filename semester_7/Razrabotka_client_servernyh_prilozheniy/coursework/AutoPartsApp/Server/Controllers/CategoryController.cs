using Server.Core;
using Server.Dtos;
using Server.Services;

namespace Server.Controllers
{
    public class CategoryController : ControllerBase
    {
        private readonly CategoryService _svc;

        public CategoryController(CategoryService svc) => _svc = svc;

        // GET /categories
        public async Task GetAll(HttpContext ctx)
        {
            var cats = await _svc.GetAllAsync();
            await Json(ctx, cats);
        }

        // POST /categories/add
        // body: { name: "..." }
        public async Task Add(HttpContext ctx)
        {
            var dto = await ctx.ReadJsonAsync<AddCategoryDto>();
            if (dto == null || string.IsNullOrWhiteSpace(dto.Name))
            {
                await Error(ctx, "Invalid body");
                return;
            }

            var id = await _svc.AddAsync(new SharedModels.PartCategory { Name = dto.Name });
            await Json(ctx, new { id });
        }
    }
}
