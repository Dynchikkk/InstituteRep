using SharedModels;

namespace DataAccess.Abstractions.Repositories
{
    /// <summary>
    /// Operations for client basket items.
    /// </summary>
    public interface IBasketRepository
    {
        Task<IEnumerable<BasketItem>> GetByClientAsync(int clientId);
        Task<int> AddAsync(BasketItem item);
        Task ClearAsync(int clientId);
        Task DeleteAsync(int basketItemId);
    }
}
