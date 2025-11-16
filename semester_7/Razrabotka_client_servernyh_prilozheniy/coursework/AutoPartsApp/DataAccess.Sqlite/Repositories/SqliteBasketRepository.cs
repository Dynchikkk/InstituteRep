using DataAccess.Abstractions.Core;
using DataAccess.Abstractions.Repositories;
using DataAccess.Sqlite.Helpers;
using Microsoft.Data.Sqlite;
using SharedModels;

namespace DataAccess.Sqlite.Repositories;

/// <summary>
/// SQLite implementation of IBasketRepository.
/// </summary>
public class SqliteBasketRepository : IBasketRepository
{
    private readonly IDatabaseConnectionFactory<SqliteConnection> _factory;

    public SqliteBasketRepository(IDatabaseConnectionFactory<SqliteConnection> factory)
    {
        _factory = factory;
    }

    public async Task<IEnumerable<BasketItem>> GetByClientAsync(int clientId)
    {
        List<BasketItem> result = [];
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new(
            "SELECT Id, ClientId, SupplierId, PartId, Quantity FROM BasketItems WHERE ClientId=@cid;", conn);

        _ = cmd.Parameters.AddWithValue("@cid", clientId);
        using SqliteDataReader reader = await cmd.ExecuteReaderAsync();
        while (await reader.ReadAsync())
        {
            result.Add(new BasketItem
            {
                Id = reader.GetInt32(0),
                ClientId = reader.GetInt32(1),
                SupplierId = reader.GetInt32(2),
                PartId = reader.GetInt32(3),
                Quantity = reader.GetInt32(4)
            });
        }

        return result;
    }

    public async Task<int> AddAsync(BasketItem item)
    {
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new(
            "INSERT INTO BasketItems (ClientId, SupplierId, PartId, Quantity) VALUES (@cid, @sid, @pid, @q); SELECT last_insert_rowid();", conn);

        _ = cmd.Parameters.AddWithValue("@cid", item.ClientId);
        _ = cmd.Parameters.AddWithValue("@sid", item.SupplierId);
        _ = cmd.Parameters.AddWithValue("@pid", item.PartId);
        _ = cmd.Parameters.AddWithValue("@q", item.Quantity);

        return await cmd.ExecuteInsertAndGetIdAsync();
    }

    public async Task ClearAsync(int clientId)
    {
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new("DELETE FROM BasketItems WHERE ClientId=@cid;", conn);
        _ = cmd.Parameters.AddWithValue("@cid", clientId);
        _ = await cmd.ExecuteNonQueryAsync();
    }

    public async Task DeleteAsync(int basketItemId)
    {
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new("DELETE FROM BasketItems WHERE Id=@id;", conn);
        _ = cmd.Parameters.AddWithValue("@id", basketItemId);
        _ = await cmd.ExecuteNonQueryAsync();
    }
}
