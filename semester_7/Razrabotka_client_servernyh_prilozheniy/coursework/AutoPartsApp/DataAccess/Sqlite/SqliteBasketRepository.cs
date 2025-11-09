using DataAccess.Interfaces;
using SharedModels;

namespace DataAccess.Sqlite;
internal class SqliteBasketRepository : IBasketRepository
{
    public SqliteBasketRepository(string connectionString)
    {
    }

    public Task<int> AddAsync(BasketItem item)
    {
        throw new NotImplementedException();
    }

    public Task<IEnumerable<BasketItem>> BuildBasketAsync(int clientId, int categoryId, int neededQuantity)
    {
        throw new NotImplementedException();
    }

    public Task ClearAsync(int clientId)
    {
        throw new NotImplementedException();
    }

    public Task<IEnumerable<BasketItem>> GetAllForClientAsync(int clientId)
    {
        throw new NotImplementedException();
    }
}