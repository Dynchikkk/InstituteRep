using SharedModels;

namespace DataAccess.Interfaces
{
    /// <summary>
    /// Repository for managing client shopping baskets.
    /// </summary>
    public interface IBasketRepository
    {
        /// <summary>Add a new item to the basket.</summary>
        Task<int> AddAsync(BasketItem item);

        /// <summary>Get all basket items for a specific client.</summary>
        Task<IEnumerable<BasketItem>> GetAllForClientAsync(int clientId);

        /// <summary>Clear basket for a specific client.</summary>
        Task ClearAsync(int clientId);

        /// <summary>
        /// Build a basket for the client based on their personal supplier ratings.
        /// </summary>
        /// <param name="clientId">Current client ID.</param>
        /// <param name="categoryId">Requested part category.</param>
        /// <param name="neededQuantity">Total quantity required.</param>
        Task<IEnumerable<BasketItem>> BuildBasketAsync(int clientId, int categoryId, int neededQuantity);
    }
}
