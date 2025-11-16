using Server.Core;
using Server.Services;
using SharedModels;

namespace Server.Controllers;

public class MessageController : ControllerBase
{
    private readonly MessageService _svc;

    public MessageController(MessageService svc)
    {
        _svc = svc;
    }

    // GET /messages?clientId=1&supplierId=2
    public async Task GetConversation(HttpContext ctx)
    {
        System.Collections.Specialized.NameValueCollection q = ctx.Request.QueryString;
        if (!int.TryParse(q["clientId"], out int clientId) || !int.TryParse(q["supplierId"], out int supplierId))
        {
            await Error(ctx, "clientId and supplierId are required and must be integers");
            return;
        }

        IEnumerable<Message> list = await _svc.GetConversationAsync(clientId, supplierId);
        await Json(ctx, list);
    }

    // POST /messages/send
    // body: { "clientId":..., "supplierId":..., "fromRole": 0|1, "text":"..." }
    public async Task SendMessage(HttpContext ctx)
    {
        Message? dto = await ctx.ReadJsonAsync<Message>();
        if (dto == null)
        {
            await Error(ctx, "Invalid message body");
            return;
        }

        Message saved = await _svc.SendAsync(dto.ClientId, dto.SupplierId, dto.FromRole, dto.Text);
        await Json(ctx, saved);
    }
}
