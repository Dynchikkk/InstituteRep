using DataAccess.Abstractions.Repositories;
using SharedModels;

namespace Server.Services;

public class PartService
{
    private readonly IPartRepository _partRepo;
    private readonly ICategoryRepository _categoryRepo;

    public PartService(IPartRepository partRepo, ICategoryRepository categoryRepo)
    {
        _partRepo = partRepo;
        _categoryRepo = categoryRepo;
    }

    public Task<IEnumerable<Part>> GetAllAsync()
    {
        return _partRepo.GetAllAsync();
    }

    public Task<IEnumerable<Part>> GetByCategoryAsync(int categoryId)
    {
        return _partRepo.GetByCategoryAsync(categoryId);
    }

    public Task<IEnumerable<Part>> GetBySupplierAsync(int supplierId)
    {
        return _partRepo.GetBySupplierAsync(supplierId);
    }

    public async Task<Part?> AddAsync(Part part)
    {
        int id = await _partRepo.AddAsync(part);
        part.Id = id;
        return part;
    }

    public Task UpdateAsync(Part part)
    {
        return _partRepo.UpdateAsync(part);
    }

    public Task UpdateQuantityAsync(int partId, int newQuantity)
    {
        return _partRepo.UpdateQuantityAsync(partId, newQuantity);
    }

    public Task<IEnumerable<PartCategory>> GetCategoriesAsync()
    {
        return _categoryRepo.GetAllAsync();
    }
}
