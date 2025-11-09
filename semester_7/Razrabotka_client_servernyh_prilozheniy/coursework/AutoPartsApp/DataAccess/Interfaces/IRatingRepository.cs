using SharedModels;

namespace DataAccess.Interfaces
{
    /// <summary>
    /// Repository for managing supplier ratings from clients.
    /// </summary>
    public interface IRatingRepository
    {
        /// <summary>Add or update client's rating for a supplier.</summary>
        Task<int> AddOrUpdateAsync(Rating rating);

        /// <summary>Get all ratings for a specific supplier.</summary>
        Task<IEnumerable<Rating>> GetAllForSupplierAsync(int supplierId);

        /// <summary>Get all ratings given by a specific client.</summary>
        Task<IEnumerable<Rating>> GetAllForClientAsync(int clientId);

        /// <summary>Calculate average rating for a supplier (across all clients).</summary>
        Task<double> GetAverageRatingAsync(int supplierId);

        /// <summary>Get rating value that a client gave to a specific supplier.</summary>
        Task<int?> GetClientRatingAsync(int clientId, int supplierId);
    }
}
