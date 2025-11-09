using SharedModels;

namespace DataAccess.Interfaces
{
    /// <summary>
    /// Repository for managing part categories.
    /// </summary>
    public interface IPartCategoryRepository
    {
        /// <summary>Get all part categories.</summary>
        Task<IEnumerable<PartCategory>> GetAllAsync();

        /// <summary>Get category by ID.</summary>
        Task<PartCategory?> GetByIdAsync(int id);

        /// <summary>Add a new category.</summary>
        Task<int> AddAsync(PartCategory category);

        /// <summary>Update existing category.</summary>
        Task UpdateAsync(PartCategory category);

        /// <summary>Delete category by ID.</summary>
        Task DeleteAsync(int id);
    }
}
