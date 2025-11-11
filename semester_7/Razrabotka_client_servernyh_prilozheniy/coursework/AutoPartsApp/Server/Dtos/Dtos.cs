namespace Server.Dtos
{
    public record class LoginRequestDto(string Login, string Password);

    public record class AuthResultDto(bool Success, string? Role, int? UserId, string? ErrorMessage);

    public record class SetRatingDto(int ClientId, int SupplierId, int Value);

    public record class BuildBasketDto(int ClientId, int CategoryId, int Quantity);

    public record class AddCategoryDto(string Name);
}
