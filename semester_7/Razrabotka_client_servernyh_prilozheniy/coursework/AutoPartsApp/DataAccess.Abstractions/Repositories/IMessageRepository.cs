using SharedModels;

namespace DataAccess.Abstractions.Repositories;

/// <summary>
/// Chat / message operations between client and supplier.
/// </summary>
public interface IMessageRepository
{
    /// <summary>
    /// Get conversation (ordered) between client and supplier.
    /// </summary>
    Task<IEnumerable<Message>> GetConversationAsync(int clientId, int supplierId);

    /// <summary>
    /// Add a message to the conversation.
    /// </summary>
    Task<int> AddAsync(Message message);
}
