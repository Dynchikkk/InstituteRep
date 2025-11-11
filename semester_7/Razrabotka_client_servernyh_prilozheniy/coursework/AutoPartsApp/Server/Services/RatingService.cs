using DataAccess.Abstractions.Repositories;
using SharedModels;

namespace Server.Services
{
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
            var existing = await _ratingRepo.GetByClientAndSupplierAsync(clientId, supplierId);
            if (existing != null)
            {
                existing.Value = value;
                existing.CreatedAt = DateTime.UtcNow;
                await _ratingRepo.UpdateAsync(existing);
                return existing;
            }

            var r = new Rating
            {
                ClientId = clientId,
                SupplierId = supplierId,
                Value = value,
                CreatedAt = DateTime.UtcNow
            };

            var id = await _ratingRepo.AddAsync(r);
            r.Id = id;
            return r;
        }

        public Task<double?> GetAverageAsync(int supplierId) => _ratingRepo.GetAverageForSupplierAsync(supplierId);

        public Task<int?> GetPersonalAsync(int clientId, int supplierId) => _ratingRepo.GetClientRatingAsync(clientId, supplierId);

        public Task<IEnumerable<Rating>> GetForSupplierAsync(int supplierId) => _ratingRepo.GetBySupplierAsync(supplierId);
    }
}
