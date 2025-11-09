using DataAccess.Interfaces;
using SharedModels;

namespace DataAccess.Sqlite;
internal class SqliteRatingRepository : IRatingRepository
{
    public SqliteRatingRepository(string connectionString)
    {
    }

    public Task<int> AddOrUpdateAsync(Rating rating)
    {
        throw new NotImplementedException();
    }

    public Task<IEnumerable<Rating>> GetAllForClientAsync(int clientId)
    {
        throw new NotImplementedException();
    }

    public Task<IEnumerable<Rating>> GetAllForSupplierAsync(int supplierId)
    {
        throw new NotImplementedException();
    }

    public Task<double> GetAverageRatingAsync(int supplierId)
    {
        throw new NotImplementedException();
    }

    public Task<int?> GetClientRatingAsync(int clientId, int supplierId)
    {
        throw new NotImplementedException();
    }
}