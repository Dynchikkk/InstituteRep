using SharedModels;

namespace DataAccess.Interfaces
{
    /// <summary>
    /// Repository interface for managing client entities.
    /// </summary>
    public interface IClientRepository
    {
        /// <summary>Get client by unique ID.</summary>
        Task<Client?> GetByIdAsync(int id);

        /// <summary>Get client by login (for authentication).</summary>
        Task<Client?> GetByLoginAsync(string login);

        /// <summary>Get all registered clients.</summary>
        Task<IEnumerable<Client>> GetAllAsync();

        /// <summary>Add a new client to the database.</summary>
        Task<int> AddAsync(Client client);

        /// <summary>Update client information.</summary>
        Task UpdateAsync(Client client);

        /// <summary>Delete client by ID.</summary>
        Task DeleteAsync(int id);
    }
}
