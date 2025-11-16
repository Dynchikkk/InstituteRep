using DataAccess.Abstractions.Repositories;
using SharedModels;

namespace Server.Services;

public class CategoryService
{
    private readonly ICategoryRepository _categoryRepo;

    public CategoryService(ICategoryRepository categoryRepo)
    {
        _categoryRepo = categoryRepo;
    }

    public Task<IEnumerable<PartCategory>> GetAllAsync()
    {
        return _categoryRepo.GetAllAsync();
    }

    public Task<int> AddAsync(PartCategory category)
    {
        return _categoryRepo.AddAsync(category);
    }
}
