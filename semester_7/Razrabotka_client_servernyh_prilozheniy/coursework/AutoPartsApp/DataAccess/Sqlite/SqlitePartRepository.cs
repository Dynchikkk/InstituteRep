using DataAccess.Interfaces;
using SharedModels;

namespace DataAccess.Sqlite;
internal class SqlitePartRepository : IPartRepository
{
    public SqlitePartRepository(string connectionString)
    {
    }

    public Task<int> AddAsync(Part part)
    {
        throw new NotImplementedException();
    }

    public Task DeleteAsync(int id)
    {
        throw new NotImplementedException();
    }

    public Task<IEnumerable<Part>> GetAllAsync()
    {
        throw new NotImplementedException();
    }

    public Task<IEnumerable<Part>> GetByCategoryAsync(int categoryId)
    {
        throw new NotImplementedException();
    }

    public Task<Part?> GetByIdAsync(int id)
    {
        throw new NotImplementedException();
    }

    public Task<IEnumerable<Part>> GetBySupplierAsync(int supplierId)
    {
        throw new NotImplementedException();
    }

    public Task UpdateAsync(Part part)
    {
        throw new NotImplementedException();
    }
}