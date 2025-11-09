using SharedModels;

namespace DataAccess.Abstractions.Repositories
{
    /// <summary>
    /// CRUD and lookup operations for suppliers.
    /// </summary>
    public interface ISupplierRepository
    {
        Task<IEnumerable<Supplier>> GetAllAsync();
        Task<Supplier?> GetByIdAsync(int id);
        Task<Supplier?> GetByLoginAsync(string login);
        Task<int> AddAsync(Supplier supplier);
        Task UpdateAsync(Supplier supplier);
        Task DeleteAsync(int id);
    }
}
