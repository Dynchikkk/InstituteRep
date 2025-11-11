using Server.Core;
using Server.Services;
using SharedModels;

namespace Server.Controllers
{
    public class MessageController : ControllerBase
    {
        private readonly MessageService _svc;

        public MessageController(MessageService svc) => _svc = svc;

        // GET /messages?clientId=1&supplierId=2
        public async Task GetConversation(HttpContext ctx)
        {
            var q = ctx.Request.QueryString;
            if (!int.TryParse(q["clientId"], out var clientId) || !int.TryParse(q["supplierId"], out var supplierId))
            {
                await Error(ctx, "clientId and supplierId are required and must be integers");
                return;
            }

            var list = await _svc.GetConversationAsync(clientId, supplierId);
            await Json(ctx, list);
        }

        // POST /messages/send
        // body: { "clientId":..., "supplierId":..., "fromRole": 0|1, "text":"..." }
        public async Task SendMessage(HttpContext ctx)
        {
            var dto = await ctx.ReadJsonAsync<Message>();
            if (dto == null)
            {
                await Error(ctx, "Invalid message body");
                return;
            }

            var saved = await _svc.SendAsync(dto.ClientId, dto.SupplierId, dto.FromRole, dto.Text);
            await Json(ctx, saved);
        }
    }
}
