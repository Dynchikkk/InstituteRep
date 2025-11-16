using DataAccess.Abstractions.Repositories;
using SharedModels;

namespace Server.Services;

/// <summary>
/// Builds and returns basket for a client based on personal ratings.
/// </summary>
public class BasketService
{
    private readonly IBasketRepository _basketRepo;
    private readonly IPartRepository _partRepo;
    private readonly IRatingRepository _ratingRepo;

    public BasketService(IBasketRepository basketRepo, IPartRepository partRepo, IRatingRepository ratingRepo)
    {
        _basketRepo = basketRepo;
        _partRepo = partRepo;
        _ratingRepo = ratingRepo;
    }

    public Task<IEnumerable<BasketItem>> GetByClientAsync(int clientId)
    {
        return _basketRepo.GetByClientAsync(clientId);
    }

    public async Task<IEnumerable<BasketItem>> BuildAsync(int clientId, int categoryId, int requiredQuantity)
    {
        await _basketRepo.ClearAsync(clientId);

        // get personal ratings
        List<Rating> ratings = (await _ratingRepo.GetByClientAsync(clientId))
            .OrderByDescending(r => r.Value)
            .ToList();

        List<BasketItem> basket = [];
        int remaining = requiredQuantity;

        foreach (Rating? r in ratings)
        {
            if (remaining <= 0)
            {
                break;
            }

            List<Part> parts = (await _partRepo.GetBySupplierAsync(r.SupplierId))
                .Where(p => p.CategoryId == categoryId && p.Quantity > 0)
                .ToList();

            foreach (Part? p in parts)
            {
                if (remaining <= 0)
                {
                    break;
                }

                int take = Math.Min(p.Quantity, remaining);
                if (take <= 0)
                {
                    continue;
                }

                BasketItem item = new()
                {
                    ClientId = clientId,
                    SupplierId = p.SupplierId,
                    PartId = p.Id,
                    Quantity = take
                };

                _ = await _basketRepo.AddAsync(item);
                basket.Add(item);
                remaining -= take;
            }
        }

        return basket;
    }

    public Task ClearAsync(int clientId)
    {
        return _basketRepo.ClearAsync(clientId);
    }
}
