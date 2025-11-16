using DataAccess.Abstractions.Core;
using DataAccess.Abstractions.Repositories;
using DataAccess.Sqlite.Helpers;
using Microsoft.Data.Sqlite;
using SharedModels;

namespace DataAccess.Sqlite.Repositories;

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
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new(
            "INSERT INTO Ratings (SupplierId, ClientId, Value, CreatedAt) VALUES (@sid, @cid, @v, @t); SELECT last_insert_rowid();", conn);

        _ = cmd.Parameters.AddWithValue("@sid", rating.SupplierId);
        _ = cmd.Parameters.AddWithValue("@cid", rating.ClientId);
        _ = cmd.Parameters.AddWithValue("@v", rating.Value);
        _ = cmd.Parameters.AddWithValue("@t", rating.CreatedAt);

        return await cmd.ExecuteInsertAndGetIdAsync();
    }

    public async Task UpdateAsync(Rating rating)
    {
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new(
            "UPDATE Ratings SET Value=@v, CreatedAt=@t WHERE SupplierId=@sid AND ClientId=@cid;", conn);

        _ = cmd.Parameters.AddWithValue("@sid", rating.SupplierId);
        _ = cmd.Parameters.AddWithValue("@cid", rating.ClientId);
        _ = cmd.Parameters.AddWithValue("@v", rating.Value);
        _ = cmd.Parameters.AddWithValue("@t", rating.CreatedAt);

        _ = await cmd.ExecuteNonQueryAsync();
    }

    public async Task<Rating?> GetByClientAndSupplierAsync(int clientId, int supplierId)
    {
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new(
            "SELECT Id, SupplierId, ClientId, Value, CreatedAt FROM Ratings WHERE ClientId=@cid AND SupplierId=@sid;", conn);
        _ = cmd.Parameters.AddWithValue("@cid", clientId);
        _ = cmd.Parameters.AddWithValue("@sid", supplierId);

        using SqliteDataReader reader = await cmd.ExecuteReaderAsync();
        return await reader.ReadAsync() ? ReadRating(reader) : null;
    }

    public async Task<IEnumerable<Rating>> GetBySupplierAsync(int supplierId)
    {
        List<Rating> result = [];
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new("SELECT Id, SupplierId, ClientId, Value, CreatedAt FROM Ratings WHERE SupplierId=@sid;", conn);
        _ = cmd.Parameters.AddWithValue("@sid", supplierId);

        using SqliteDataReader reader = await cmd.ExecuteReaderAsync();
        while (await reader.ReadAsync())
        {
            result.Add(ReadRating(reader));
        }

        return result;
    }

    public async Task<IEnumerable<Rating>> GetByClientAsync(int clientId)
    {
        List<Rating> result = [];
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new("SELECT Id, SupplierId, ClientId, Value, CreatedAt FROM Ratings WHERE ClientId=@cid;", conn);
        _ = cmd.Parameters.AddWithValue("@cid", clientId);

        using SqliteDataReader reader = await cmd.ExecuteReaderAsync();
        while (await reader.ReadAsync())
        {
            result.Add(ReadRating(reader));
        }

        return result;
    }

    public async Task<double?> GetAverageForSupplierAsync(int supplierId)
    {
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new("SELECT AVG(Value) FROM Ratings WHERE SupplierId=@sid;", conn);
        _ = cmd.Parameters.AddWithValue("@sid", supplierId);
        object? result = await cmd.ExecuteScalarAsync();
        return result != null && result != DBNull.Value ? Convert.ToDouble(result) : null;
    }

    public async Task<int?> GetClientRatingAsync(int clientId, int supplierId)
    {
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new(
            "SELECT Value FROM Ratings WHERE ClientId=@cid AND SupplierId=@sid;", conn);
        _ = cmd.Parameters.AddWithValue("@cid", clientId);
        _ = cmd.Parameters.AddWithValue("@sid", supplierId);

        object? result = await cmd.ExecuteScalarAsync();
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
