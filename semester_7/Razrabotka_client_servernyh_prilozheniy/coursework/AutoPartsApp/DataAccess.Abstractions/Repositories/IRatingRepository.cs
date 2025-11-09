using SharedModels;

namespace DataAccess.Abstractions.Repositories
{
    /// <summary>
    /// Operations for supplier ratings set by clients.
    /// </summary>
    public interface IRatingRepository
    {
        Task<int> AddAsync(Rating rating);
        Task UpdateAsync(Rating rating);
        Task<Rating?> GetByClientAndSupplierAsync(int clientId, int supplierId);
        Task<IEnumerable<Rating>> GetBySupplierAsync(int supplierId);
        Task<IEnumerable<Rating>> GetByClientAsync(int clientId);

        /// <summary>
        /// Returns average value for supplier or null if no ratings.
        /// </summary>
        Task<double?> GetAverageForSupplierAsync(int supplierId);

        /// <summary>
        /// Returns the (latest) rating value given by a specific client for a supplier.
        /// </summary>
        Task<int?> GetClientRatingAsync(int clientId, int supplierId);
    }
}
