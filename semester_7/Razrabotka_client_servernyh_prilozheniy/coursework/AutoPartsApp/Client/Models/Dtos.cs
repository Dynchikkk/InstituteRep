namespace Client.Models;

public record LoginRequestDto(string Login, string Password);
public record AuthResultDto(bool Success, string? Role, int? UserId, string? ErrorMessage);

public record SetRatingDto(int ClientId, int SupplierId, int Value);
public record BuildBasketDto(int ClientId, int CategoryId, int Quantity);
public record AddCategoryDto(string Name);
