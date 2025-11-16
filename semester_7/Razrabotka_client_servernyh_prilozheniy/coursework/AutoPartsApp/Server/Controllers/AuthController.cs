using Server.Core;
using Server.Dtos;
using Server.Services;

namespace Server.Controllers;

public class AuthController : ControllerBase
{
    private readonly AuthService _auth;

    public AuthController(AuthService auth)
    {
        _auth = auth;
    }

    // POST /auth/login
    public async Task Login(HttpContext ctx)
    {
        LoginRequestDto? req = await ctx.ReadJsonAsync<LoginRequestDto>();
        if (req == null)
        {
            await Error(ctx, "Invalid JSON body");
            return;
        }

        AuthResultDto res = await _auth.LoginAsync(req.Login, req.Password);
        await Json(ctx, res);
    }
}
