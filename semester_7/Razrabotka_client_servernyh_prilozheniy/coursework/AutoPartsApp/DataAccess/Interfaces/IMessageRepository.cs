using SharedModels;

namespace DataAccess.Interfaces
{
    /// <summary>
    /// Repository for handling client-supplier messages.
    /// </summary>
    public interface IMessageRepository
    {
        /// <summary>Get full message history between client and supplier.</summary>
        Task<IEnumerable<Message>> GetDialogAsync(int clientId, int supplierId);

        /// <summary>Store a new message.</summary>
        Task<int> AddAsync(Message message);
    }
}
