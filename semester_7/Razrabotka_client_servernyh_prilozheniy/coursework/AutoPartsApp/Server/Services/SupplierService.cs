using DataAccess.Abstractions.Repositories;
using SharedModels;

namespace Server.Services;

/// <summary>
/// Supplier-specific business logic.
/// </summary>
public class SupplierService
{
    private readonly ISupplierRepository _supplierRepo;
    private readonly IPartRepository _partRepo;
    private readonly IRatingRepository _ratingRepo;

    public SupplierService(ISupplierRepository supplierRepo, IPartRepository partRepo, IRatingRepository ratingRepo)
    {
        _supplierRepo = supplierRepo;
        _partRepo = partRepo;
        _ratingRepo = ratingRepo;
    }

    public Task<Supplier?> GetByIdAsync(int id)
    {
        return _supplierRepo.GetByIdAsync(id);
    }

    public Task<IEnumerable<Part>> GetPartsAsync(int supplierId)
    {
        return _partRepo.GetBySupplierAsync(supplierId);
    }

    public Task<double?> GetAverageRatingAsync(int supplierId)
    {
        return _ratingRepo.GetAverageForSupplierAsync(supplierId);
    }
}
