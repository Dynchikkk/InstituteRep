using DataAccess.Abstractions.Core;
using DataAccess.Abstractions.Repositories;
using DataAccess.Sqlite.Helpers;
using Microsoft.Data.Sqlite;
using SharedModels;

namespace DataAccess.Sqlite.Repositories
{
    /// <summary>
    /// SQLite implementation of IMessageRepository.
    /// </summary>
    public class SqliteMessageRepository : IMessageRepository
    {
        private readonly IDatabaseConnectionFactory<SqliteConnection> _factory;

        public SqliteMessageRepository(IDatabaseConnectionFactory<SqliteConnection> factory)
        {
            _factory = factory;
        }

        public async Task<IEnumerable<Message>> GetConversationAsync(int clientId, int supplierId)
        {
            var result = new List<Message>();
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand(
                "SELECT Id, SupplierId, ClientId, FromRole, Text, SentAt FROM Messages WHERE ClientId=@cid AND SupplierId=@sid ORDER BY SentAt;", conn);

            cmd.Parameters.AddWithValue("@cid", clientId);
            cmd.Parameters.AddWithValue("@sid", supplierId);

            using var reader = await cmd.ExecuteReaderAsync();
            while (await reader.ReadAsync())
            {
                result.Add(new Message
                {
                    Id = reader.GetInt32(0),
                    SupplierId = reader.GetInt32(1),
                    ClientId = reader.GetInt32(2),
                    FromRole = (Role)reader.GetInt32(3),
                    Text = reader.GetString(4),
                    SentAt = reader.GetDateTime(5)
                });
            }
            return result;
        }

        public async Task<int> AddAsync(Message message)
        {
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand(
                "INSERT INTO Messages (SupplierId, ClientId, FromRole, Text, SentAt) VALUES (@sid, @cid, @r, @t, @time); SELECT last_insert_rowid();", conn);

            cmd.Parameters.AddWithValue("@sid", message.SupplierId);
            cmd.Parameters.AddWithValue("@cid", message.ClientId);
            cmd.Parameters.AddWithValue("@r", (int)message.FromRole);
            cmd.Parameters.AddWithValue("@t", message.Text);
            cmd.Parameters.AddWithValue("@time", message.SentAt);

            return await cmd.ExecuteInsertAndGetIdAsync();
        }
    }
}
