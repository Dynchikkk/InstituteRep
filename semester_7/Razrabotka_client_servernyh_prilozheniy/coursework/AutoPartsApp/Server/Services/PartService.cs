using DataAccess.Abstractions.Repositories;
using SharedModels;

namespace Server.Services
{
    public class PartService
    {
        private readonly IPartRepository _partRepo;
        private readonly ICategoryRepository _categoryRepo;

        public PartService(IPartRepository partRepo, ICategoryRepository categoryRepo)
        {
            _partRepo = partRepo;
            _categoryRepo = categoryRepo;
        }

        public Task<IEnumerable<Part>> GetAllAsync() => _partRepo.GetAllAsync();

        public Task<IEnumerable<Part>> GetByCategoryAsync(int categoryId) => _partRepo.GetByCategoryAsync(categoryId);

        public Task<IEnumerable<Part>> GetBySupplierAsync(int supplierId) => _partRepo.GetBySupplierAsync(supplierId);

        public async Task<Part?> AddAsync(Part part)
        {
            var id = await _partRepo.AddAsync(part);
            part.Id = id;
            return part;
        }

        public Task UpdateAsync(Part part) => _partRepo.UpdateAsync(part);

        public Task UpdateQuantityAsync(int partId, int newQuantity) => _partRepo.UpdateQuantityAsync(partId, newQuantity);

        public Task<IEnumerable<PartCategory>> GetCategoriesAsync() => _categoryRepo.GetAllAsync();
    }
}
