using DataAccess.Abstractions.Repositories;
using SharedModels;

namespace Server.Services;

/// <summary>
/// Messaging logic: send and read conversation.
/// </summary>
public class MessageService
{
    private readonly IMessageRepository _messageRepo;

    public MessageService(IMessageRepository messageRepo)
    {
        _messageRepo = messageRepo;
    }

    public Task<IEnumerable<Message>> GetConversationAsync(int clientId, int supplierId)
    {
        return _messageRepo.GetConversationAsync(clientId, supplierId);
    }

    public async Task<Message> SendAsync(int clientId, int supplierId, Role from, string text)
    {
        Message msg = new()
        {
            ClientId = clientId,
            SupplierId = supplierId,
            FromRole = from,
            Text = text,
            SentAt = DateTime.UtcNow
        };

        int id = await _messageRepo.AddAsync(msg);
        msg.Id = id;
        return msg;
    }
}
