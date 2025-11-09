using DataAccess.Interfaces;
using SharedModels;

namespace DataAccess.Sqlite;
internal class SqlitePartCategoryRepository : IPartCategoryRepository
{
    public SqlitePartCategoryRepository(string connectionString)
    {
    }

    public Task<int> AddAsync(PartCategory category)
    {
        throw new NotImplementedException();
    }

    public Task DeleteAsync(int id)
    {
        throw new NotImplementedException();
    }

    public Task<IEnumerable<PartCategory>> GetAllAsync()
    {
        throw new NotImplementedException();
    }

    public Task<PartCategory?> GetByIdAsync(int id)
    {
        throw new NotImplementedException();
    }

    public Task UpdateAsync(PartCategory category)
    {
        throw new NotImplementedException();
    }
}