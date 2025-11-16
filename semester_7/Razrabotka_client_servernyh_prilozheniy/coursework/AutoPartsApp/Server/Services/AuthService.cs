using DataAccess.Abstractions.Repositories;
using Server.Dtos;
using SharedModels;

namespace Server.Services;

/// <summary>
/// Authentication logic. Returns AuthResultDto (no tuples).
/// </summary>
public class AuthService
{
    private readonly IClientRepository _clientRepo;
    private readonly ISupplierRepository _supplierRepo;

    public AuthService(IClientRepository clientRepo, ISupplierRepository supplierRepo)
    {
        _clientRepo = clientRepo;
        _supplierRepo = supplierRepo;
    }

    /// <summary>
    /// Attempts to login; returns AuthResultDto describing outcome and role.
    /// </summary>
    public async Task<AuthResultDto> LoginAsync(string login, string password)
    {
        Client? client = await _clientRepo.GetByLoginAsync(login);
        if (client != null && client.Password == password)
        {
            return new AuthResultDto(true, nameof(Role.Client), client.Id, null);
        }

        Supplier? supplier = await _supplierRepo.GetByLoginAsync(login);
        return supplier != null && supplier.Password == password
            ? new AuthResultDto(true, nameof(Role.Supplier), supplier.Id, null)
            : new AuthResultDto(false, null, null, "Invalid credentials");
    }
}
