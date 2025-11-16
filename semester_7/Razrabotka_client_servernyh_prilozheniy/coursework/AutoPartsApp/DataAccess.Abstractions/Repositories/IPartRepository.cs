using SharedModels;

namespace DataAccess.Abstractions.Repositories;

/// <summary>
/// Operations for parts (items) managed by suppliers.
/// </summary>
public interface IPartRepository
{
    Task<IEnumerable<Part>> GetAllAsync();
    Task<IEnumerable<Part>> GetBySupplierAsync(int supplierId);
    Task<IEnumerable<Part>> GetByCategoryAsync(int categoryId);
    Task<Part?> GetByIdAsync(int partId);
    Task<int> AddAsync(Part part);
    Task UpdateAsync(Part part);
    Task UpdateQuantityAsync(int partId, int newQuantity);
}
