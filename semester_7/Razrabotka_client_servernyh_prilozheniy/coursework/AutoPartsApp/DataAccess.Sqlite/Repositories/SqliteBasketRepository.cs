using DataAccess.Abstractions.Core;
using DataAccess.Abstractions.Repositories;
using DataAccess.Sqlite.Helpers;
using Microsoft.Data.Sqlite;
using SharedModels;

namespace DataAccess.Sqlite.Repositories
{
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
            var result = new List<BasketItem>();
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand(
                "SELECT Id, ClientId, SupplierId, PartId, Quantity FROM BasketItems WHERE ClientId=@cid;", conn);

            cmd.Parameters.AddWithValue("@cid", clientId);
            using var reader = await cmd.ExecuteReaderAsync();
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
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand(
                "INSERT INTO BasketItems (ClientId, SupplierId, PartId, Quantity) VALUES (@cid, @sid, @pid, @q); SELECT last_insert_rowid();", conn);

            cmd.Parameters.AddWithValue("@cid", item.ClientId);
            cmd.Parameters.AddWithValue("@sid", item.SupplierId);
            cmd.Parameters.AddWithValue("@pid", item.PartId);
            cmd.Parameters.AddWithValue("@q", item.Quantity);

            return await cmd.ExecuteInsertAndGetIdAsync();
        }

        public async Task ClearAsync(int clientId)
        {
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand("DELETE FROM BasketItems WHERE ClientId=@cid;", conn);
            cmd.Parameters.AddWithValue("@cid", clientId);
            await cmd.ExecuteNonQueryAsync();
        }

        public async Task DeleteAsync(int basketItemId)
        {
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand("DELETE FROM BasketItems WHERE Id=@id;", conn);
            cmd.Parameters.AddWithValue("@id", basketItemId);
            await cmd.ExecuteNonQueryAsync();
        }
    }
}
