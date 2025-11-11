using DataAccess.Abstractions.Repositories;
using SharedModels;

namespace Server.Services
{
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

        public Task<IEnumerable<BasketItem>> GetByClientAsync(int clientId) => _basketRepo.GetByClientAsync(clientId);

        public async Task<IEnumerable<BasketItem>> BuildAsync(int clientId, int categoryId, int requiredQuantity)
        {
            await _basketRepo.ClearAsync(clientId);

            // get personal ratings
            var ratings = (await _ratingRepo.GetByClientAsync(clientId))
                .OrderByDescending(r => r.Value)
                .ToList();

            var basket = new List<BasketItem>();
            int remaining = requiredQuantity;

            foreach (var r in ratings)
            {
                if (remaining <= 0) break;

                var parts = (await _partRepo.GetBySupplierAsync(r.SupplierId))
                    .Where(p => p.CategoryId == categoryId && p.Quantity > 0)
                    .ToList();

                foreach (var p in parts)
                {
                    if (remaining <= 0) break;
                    var take = Math.Min(p.Quantity, remaining);
                    if (take <= 0) continue;

                    var item = new BasketItem
                    {
                        ClientId = clientId,
                        SupplierId = p.SupplierId,
                        PartId = p.Id,
                        Quantity = take
                    };

                    await _basketRepo.AddAsync(item);
                    basket.Add(item);
                    remaining -= take;
                }
            }

            return basket;
        }

        public Task ClearAsync(int clientId) => _basketRepo.ClearAsync(clientId);
    }
}
