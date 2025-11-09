using DataAccess.Abstractions.Core;
using DataAccess.Abstractions.Repositories;
using DataAccess.Sqlite.Helpers;
using Microsoft.Data.Sqlite;
using SharedModels;

namespace DataAccess.Sqlite.Repositories
{
    /// <summary>
    /// SQLite implementation of IRatingRepository.
    /// </summary>
    public class SqliteRatingRepository : IRatingRepository
    {
        private readonly IDatabaseConnectionFactory<SqliteConnection> _factory;

        public SqliteRatingRepository(IDatabaseConnectionFactory<SqliteConnection> factory)
        {
            _factory = factory;
        }

        public async Task<int> AddAsync(Rating rating)
        {
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand(
                "INSERT INTO Ratings (SupplierId, ClientId, Value, CreatedAt) VALUES (@sid, @cid, @v, @t); SELECT last_insert_rowid();", conn);

            cmd.Parameters.AddWithValue("@sid", rating.SupplierId);
            cmd.Parameters.AddWithValue("@cid", rating.ClientId);
            cmd.Parameters.AddWithValue("@v", rating.Value);
            cmd.Parameters.AddWithValue("@t", rating.CreatedAt);

            return await cmd.ExecuteInsertAndGetIdAsync();
        }

        public async Task UpdateAsync(Rating rating)
        {
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand(
                "UPDATE Ratings SET Value=@v, CreatedAt=@t WHERE SupplierId=@sid AND ClientId=@cid;", conn);

            cmd.Parameters.AddWithValue("@sid", rating.SupplierId);
            cmd.Parameters.AddWithValue("@cid", rating.ClientId);
            cmd.Parameters.AddWithValue("@v", rating.Value);
            cmd.Parameters.AddWithValue("@t", rating.CreatedAt);

            await cmd.ExecuteNonQueryAsync();
        }

        public async Task<Rating?> GetByClientAndSupplierAsync(int clientId, int supplierId)
        {
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand(
                "SELECT Id, SupplierId, ClientId, Value, CreatedAt FROM Ratings WHERE ClientId=@cid AND SupplierId=@sid;", conn);
            cmd.Parameters.AddWithValue("@cid", clientId);
            cmd.Parameters.AddWithValue("@sid", supplierId);

            using var reader = await cmd.ExecuteReaderAsync();
            if (await reader.ReadAsync())
            {
                return ReadRating(reader);
            }
            return null;
        }

        public async Task<IEnumerable<Rating>> GetBySupplierAsync(int supplierId)
        {
            var result = new List<Rating>();
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand("SELECT Id, SupplierId, ClientId, Value, CreatedAt FROM Ratings WHERE SupplierId=@sid;", conn);
            cmd.Parameters.AddWithValue("@sid", supplierId);

            using var reader = await cmd.ExecuteReaderAsync();
            while (await reader.ReadAsync())
            {
                result.Add(ReadRating(reader));
            }
            return result;
        }

        public async Task<IEnumerable<Rating>> GetByClientAsync(int clientId)
        {
            var result = new List<Rating>();
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand("SELECT Id, SupplierId, ClientId, Value, CreatedAt FROM Ratings WHERE ClientId=@cid;", conn);
            cmd.Parameters.AddWithValue("@cid", clientId);

            using var reader = await cmd.ExecuteReaderAsync();
            while (await reader.ReadAsync())
            {
                result.Add(ReadRating(reader));
            }
            return result;
        }

        public async Task<double?> GetAverageForSupplierAsync(int supplierId)
        {
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand("SELECT AVG(Value) FROM Ratings WHERE SupplierId=@sid;", conn);
            cmd.Parameters.AddWithValue("@sid", supplierId);
            var result = await cmd.ExecuteScalarAsync();
            return result != null && result != DBNull.Value ? Convert.ToDouble(result) : null;
        }

        public async Task<int?> GetClientRatingAsync(int clientId, int supplierId)
        {
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand(
                "SELECT Value FROM Ratings WHERE ClientId=@cid AND SupplierId=@sid;", conn);
            cmd.Parameters.AddWithValue("@cid", clientId);
            cmd.Parameters.AddWithValue("@sid", supplierId);

            var result = await cmd.ExecuteScalarAsync();
            return result != null && result != DBNull.Value ? Convert.ToInt32(result) : null;
        }

        private static Rating ReadRating(SqliteDataReader reader)
        {
            return new Rating
            {
                Id = reader.GetInt32(0),
                SupplierId = reader.GetInt32(1),
                ClientId = reader.GetInt32(2),
                Value = reader.GetInt32(3),
                CreatedAt = reader.GetDateTime(4)
            };
        }
    }
}
