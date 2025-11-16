using DataAccess.Abstractions.Core;
using DataAccess.Abstractions.Repositories;
using DataAccess.Sqlite.Helpers;
using Microsoft.Data.Sqlite;
using SharedModels;

namespace DataAccess.Sqlite.Repositories;

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
        List<Message> result = [];
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new(
            "SELECT Id, SupplierId, ClientId, FromRole, Text, SentAt FROM Messages WHERE ClientId=@cid AND SupplierId=@sid ORDER BY SentAt;", conn);

        _ = cmd.Parameters.AddWithValue("@cid", clientId);
        _ = cmd.Parameters.AddWithValue("@sid", supplierId);

        using SqliteDataReader reader = await cmd.ExecuteReaderAsync();
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
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new(
            "INSERT INTO Messages (SupplierId, ClientId, FromRole, Text, SentAt) VALUES (@sid, @cid, @r, @t, @time); SELECT last_insert_rowid();", conn);

        _ = cmd.Parameters.AddWithValue("@sid", message.SupplierId);
        _ = cmd.Parameters.AddWithValue("@cid", message.ClientId);
        _ = cmd.Parameters.AddWithValue("@r", (int)message.FromRole);
        _ = cmd.Parameters.AddWithValue("@t", message.Text);
        _ = cmd.Parameters.AddWithValue("@time", message.SentAt);

        return await cmd.ExecuteInsertAndGetIdAsync();
    }
}
