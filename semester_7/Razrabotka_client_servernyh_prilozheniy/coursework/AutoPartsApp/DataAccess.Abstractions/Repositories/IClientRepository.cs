using SharedModels;

namespace DataAccess.Abstractions.Repositories
{
    /// <summary>
    /// CRUD and lookup operations for clients.
    /// </summary>
    public interface IClientRepository
    {
        Task<IEnumerable<Client>> GetAllAsync();
        Task<Client?> GetByIdAsync(int id);
        Task<Client?> GetByLoginAsync(string login);
        Task<int> AddAsync(Client client);   // returns created Id (or non-zero indicator)
        Task UpdateAsync(Client client);
        Task DeleteAsync(int id);
    }
}
