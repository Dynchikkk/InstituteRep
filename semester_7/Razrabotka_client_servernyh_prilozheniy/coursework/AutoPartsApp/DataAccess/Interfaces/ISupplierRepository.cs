using SharedModels;

namespace DataAccess.Interfaces
{
    /// <summary>
    /// Repository interface for supplier management.
    /// </summary>
    public interface ISupplierRepository
    {
        /// <summary>Get supplier by ID.</summary>
        Task<Supplier?> GetByIdAsync(int id);

        /// <summary>Get supplier by login (for authentication).</summary>
        Task<Supplier?> GetByLoginAsync(string login);

        /// <summary>Get all suppliers.</summary>
        Task<IEnumerable<Supplier>> GetAllAsync();

        /// <summary>Add a new supplier.</summary>
        Task<int> AddAsync(Supplier supplier);

        /// <summary>Update supplier data.</summary>
        Task UpdateAsync(Supplier supplier);

        /// <summary>Delete supplier by ID.</summary>
        Task DeleteAsync(int id);
    }
}
