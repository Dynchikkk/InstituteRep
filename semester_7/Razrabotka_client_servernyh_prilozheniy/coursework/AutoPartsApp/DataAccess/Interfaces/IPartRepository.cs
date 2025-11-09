using SharedModels;

namespace DataAccess.Interfaces
{
    /// <summary>
    /// Repository for supplier parts (items).
    /// </summary>
    public interface IPartRepository
    {
        /// <summary>Get part by ID.</summary>
        Task<Part?> GetByIdAsync(int id);

        /// <summary>Get all parts in the system.</summary>
        Task<IEnumerable<Part>> GetAllAsync();

        /// <summary>Get all parts belonging to a specific supplier.</summary>
        Task<IEnumerable<Part>> GetBySupplierAsync(int supplierId);

        /// <summary>Get all parts in a specific category.</summary>
        Task<IEnumerable<Part>> GetByCategoryAsync(int categoryId);

        /// <summary>Add a new part.</summary>
        Task<int> AddAsync(Part part);

        /// <summary>Update part information.</summary>
        Task UpdateAsync(Part part);

        /// <summary>Delete part by ID.</summary>
        Task DeleteAsync(int id);
    }
}
