using DataAccess.Abstractions.Repositories;
using SharedModels;

namespace Server.Services
{
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
            => _messageRepo.GetConversationAsync(clientId, supplierId);

        public async Task<Message> SendAsync(int clientId, int supplierId, Role from, string text)
        {
            var msg = new Message
            {
                ClientId = clientId,
                SupplierId = supplierId,
                FromRole = from,
                Text = text,
                SentAt = DateTime.UtcNow
            };

            var id = await _messageRepo.AddAsync(msg);
            msg.Id = id;
            return msg;
        }
    }
}
