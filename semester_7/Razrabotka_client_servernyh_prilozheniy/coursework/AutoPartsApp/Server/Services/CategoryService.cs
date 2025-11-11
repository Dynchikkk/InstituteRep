using DataAccess.Abstractions.Repositories;
using SharedModels;

namespace Server.Services
{
    public class CategoryService
    {
        private readonly ICategoryRepository _categoryRepo;

        public CategoryService(ICategoryRepository categoryRepo)
        {
            _categoryRepo = categoryRepo;
        }

        public Task<IEnumerable<PartCategory>> GetAllAsync() => _categoryRepo.GetAllAsync();

        public Task<int> AddAsync(PartCategory category) => _categoryRepo.AddAsync(category);
    }
}
