using SharedModels;

namespace DataAccess.Abstractions.Repositories;

/// <summary>
/// Operations for part categories.
/// </summary>
public interface ICategoryRepository
{
    Task<IEnumerable<PartCategory>> GetAllAsync();
    Task<int> AddAsync(PartCategory category);
}
