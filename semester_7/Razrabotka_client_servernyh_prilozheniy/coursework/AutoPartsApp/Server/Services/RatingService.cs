using DataAccess.Abstractions.Repositories;
using SharedModels;

namespace Server.Services;

/// <summary>
/// Rating management: add/update and query averages / personal ratings.
/// </summary>
public class RatingService
{
    private readonly IRatingRepository _ratingRepo;

    public RatingService(IRatingRepository ratingRepo)
    {
        _ratingRepo = ratingRepo;
    }

    public async Task<Rating> SetRatingAsync(int clientId, int supplierId, int value)
    {
        Rating? existing = await _ratingRepo.GetByClientAndSupplierAsync(clientId, supplierId);
        if (existing != null)
        {
            existing.Value = value;
            existing.CreatedAt = DateTime.UtcNow;
            await _ratingRepo.UpdateAsync(existing);
            return existing;
        }

        Rating r = new()
        {
            ClientId = clientId,
            SupplierId = supplierId,
            Value = value,
            CreatedAt = DateTime.UtcNow
        };

        int id = await _ratingRepo.AddAsync(r);
        r.Id = id;
        return r;
    }

    public Task<double?> GetAverageAsync(int supplierId)
    {
        return _ratingRepo.GetAverageForSupplierAsync(supplierId);
    }

    public Task<int?> GetPersonalAsync(int clientId, int supplierId)
    {
        return _ratingRepo.GetClientRatingAsync(clientId, supplierId);
    }

    public Task<IEnumerable<Rating>> GetForSupplierAsync(int supplierId)
    {
        return _ratingRepo.GetBySupplierAsync(supplierId);
    }
}
