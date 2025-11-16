using DataAccess.Abstractions.Core;
using DataAccess.Abstractions.Repositories;
using DataAccess.Sqlite.Helpers;
using Microsoft.Data.Sqlite;
using SharedModels;

namespace DataAccess.Sqlite.Repositories;

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
        List<Part> result = [];
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new("SELECT Id, SupplierId, CategoryId, Name, Price, Quantity FROM Parts;", conn);
        using SqliteDataReader reader = await cmd.ExecuteReaderAsync();

        while (await reader.ReadAsync())
        {
            result.Add(ReadPart(reader));
        }

        return result;
    }

    public async Task<IEnumerable<Part>> GetBySupplierAsync(int supplierId)
    {
        List<Part> result = [];
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new("SELECT Id, SupplierId, CategoryId, Name, Price, Quantity FROM Parts WHERE SupplierId=@sid;", conn);
        _ = cmd.Parameters.AddWithValue("@sid", supplierId);
        using SqliteDataReader reader = await cmd.ExecuteReaderAsync();

        while (await reader.ReadAsync())
        {
            result.Add(ReadPart(reader));
        }

        return result;
    }

    public async Task<IEnumerable<Part>> GetByCategoryAsync(int categoryId)
    {
        List<Part> result = [];
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new("SELECT Id, SupplierId, CategoryId, Name, Price, Quantity FROM Parts WHERE CategoryId=@cid;", conn);
        _ = cmd.Parameters.AddWithValue("@cid", categoryId);
        using SqliteDataReader reader = await cmd.ExecuteReaderAsync();

        while (await reader.ReadAsync())
        {
            result.Add(ReadPart(reader));
        }

        return result;
    }

    public async Task<Part?> GetByIdAsync(int partId)
    {
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new("SELECT Id, SupplierId, CategoryId, Name, Price, Quantity FROM Parts WHERE Id=@id;", conn);
        _ = cmd.Parameters.AddWithValue("@id", partId);
        using SqliteDataReader reader = await cmd.ExecuteReaderAsync();

        return await reader.ReadAsync() ? ReadPart(reader) : null;
    }

    public async Task<int> AddAsync(Part part)
    {
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new(
            "INSERT INTO Parts (SupplierId, CategoryId, Name, Price, Quantity) VALUES (@sid, @cid, @n, @p, @q); SELECT last_insert_rowid();", conn);

        _ = cmd.Parameters.AddWithValue("@sid", part.SupplierId);
        _ = cmd.Parameters.AddWithValue("@cid", part.CategoryId);
        _ = cmd.Parameters.AddWithValue("@n", part.Name);
        _ = cmd.Parameters.AddWithValue("@p", part.Price);
        _ = cmd.Parameters.AddWithValue("@q", part.Quantity);

        return await cmd.ExecuteInsertAndGetIdAsync();
    }

    public async Task UpdateAsync(Part part)
    {
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new(
            "UPDATE Parts SET SupplierId=@sid, CategoryId=@cid, Name=@n, Price=@p, Quantity=@q WHERE Id=@id;", conn);

        _ = cmd.Parameters.AddWithValue("@id", part.Id);
        _ = cmd.Parameters.AddWithValue("@sid", part.SupplierId);
        _ = cmd.Parameters.AddWithValue("@cid", part.CategoryId);
        _ = cmd.Parameters.AddWithValue("@n", part.Name);
        _ = cmd.Parameters.AddWithValue("@p", part.Price);
        _ = cmd.Parameters.AddWithValue("@q", part.Quantity);

        _ = await cmd.ExecuteNonQueryAsync();
    }

    public async Task UpdateQuantityAsync(int partId, int newQuantity)
    {
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new("UPDATE Parts SET Quantity=@q WHERE Id=@id;", conn);
        _ = cmd.Parameters.AddWithValue("@id", partId);
        _ = cmd.Parameters.AddWithValue("@q", newQuantity);
        _ = await cmd.ExecuteNonQueryAsync();
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
