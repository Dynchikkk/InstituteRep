using DataAccess.Abstractions.Core;
using DataAccess.Abstractions.Repositories;
using DataAccess.Sqlite.Helpers;
using Microsoft.Data.Sqlite;
using SharedModels;

namespace DataAccess.Sqlite.Repositories
{
    /// <summary>
    /// SQLite implementation of IPartRepository.
    /// </summary>
    public class SqlitePartRepository : IPartRepository
    {
        private readonly IDatabaseConnectionFactory<SqliteConnection> _factory;

        public SqlitePartRepository(IDatabaseConnectionFactory<SqliteConnection> factory)
        {
            _factory = factory;
        }

        public async Task<IEnumerable<Part>> GetAllAsync()
        {
            var result = new List<Part>();
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand("SELECT Id, SupplierId, CategoryId, Name, Price, Quantity FROM Parts;", conn);
            using var reader = await cmd.ExecuteReaderAsync();

            while (await reader.ReadAsync())
            {
                result.Add(ReadPart(reader));
            }
            return result;
        }

        public async Task<IEnumerable<Part>> GetBySupplierAsync(int supplierId)
        {
            var result = new List<Part>();
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand("SELECT Id, SupplierId, CategoryId, Name, Price, Quantity FROM Parts WHERE SupplierId=@sid;", conn);
            cmd.Parameters.AddWithValue("@sid", supplierId);
            using var reader = await cmd.ExecuteReaderAsync();

            while (await reader.ReadAsync())
            {
                result.Add(ReadPart(reader));
            }
            return result;
        }

        public async Task<IEnumerable<Part>> GetByCategoryAsync(int categoryId)
        {
            var result = new List<Part>();
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand("SELECT Id, SupplierId, CategoryId, Name, Price, Quantity FROM Parts WHERE CategoryId=@cid;", conn);
            cmd.Parameters.AddWithValue("@cid", categoryId);
            using var reader = await cmd.ExecuteReaderAsync();

            while (await reader.ReadAsync())
            {
                result.Add(ReadPart(reader));
            }
            return result;
        }

        public async Task<Part?> GetByIdAsync(int partId)
        {
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand("SELECT Id, SupplierId, CategoryId, Name, Price, Quantity FROM Parts WHERE Id=@id;", conn);
            cmd.Parameters.AddWithValue("@id", partId);
            using var reader = await cmd.ExecuteReaderAsync();

            if (await reader.ReadAsync())
            {
                return ReadPart(reader);
            }
            return null;
        }

        public async Task<int> AddAsync(Part part)
        {
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand(
                "INSERT INTO Parts (SupplierId, CategoryId, Name, Price, Quantity) VALUES (@sid, @cid, @n, @p, @q); SELECT last_insert_rowid();", conn);

            cmd.Parameters.AddWithValue("@sid", part.SupplierId);
            cmd.Parameters.AddWithValue("@cid", part.CategoryId);
            cmd.Parameters.AddWithValue("@n", part.Name);
            cmd.Parameters.AddWithValue("@p", part.Price);
            cmd.Parameters.AddWithValue("@q", part.Quantity);

            return await cmd.ExecuteInsertAndGetIdAsync();
        }

        public async Task UpdateAsync(Part part)
        {
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand(
                "UPDATE Parts SET SupplierId=@sid, CategoryId=@cid, Name=@n, Price=@p, Quantity=@q WHERE Id=@id;", conn);

            cmd.Parameters.AddWithValue("@id", part.Id);
            cmd.Parameters.AddWithValue("@sid", part.SupplierId);
            cmd.Parameters.AddWithValue("@cid", part.CategoryId);
            cmd.Parameters.AddWithValue("@n", part.Name);
            cmd.Parameters.AddWithValue("@p", part.Price);
            cmd.Parameters.AddWithValue("@q", part.Quantity);

            await cmd.ExecuteNonQueryAsync();
        }

        public async Task UpdateQuantityAsync(int partId, int newQuantity)
        {
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand("UPDATE Parts SET Quantity=@q WHERE Id=@id;", conn);
            cmd.Parameters.AddWithValue("@id", partId);
            cmd.Parameters.AddWithValue("@q", newQuantity);
            await cmd.ExecuteNonQueryAsync();
        }

        private static Part ReadPart(SqliteDataReader reader)
        {
            return new Part
            {
                Id = reader.GetInt32(0),
                SupplierId = reader.GetInt32(1),
                CategoryId = reader.GetInt32(2),
                Name = reader.GetString(3),
                Price = reader.GetDouble(4),
                Quantity = reader.GetInt32(5)
            };
        }
    }
}
