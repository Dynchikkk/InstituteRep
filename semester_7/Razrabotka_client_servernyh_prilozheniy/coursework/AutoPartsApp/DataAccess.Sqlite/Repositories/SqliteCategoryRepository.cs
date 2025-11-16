using DataAccess.Abstractions.Core;
using DataAccess.Abstractions.Repositories;
using DataAccess.Sqlite.Helpers;
using Microsoft.Data.Sqlite;
using SharedModels;

namespace DataAccess.Sqlite.Repositories;

/// <summary>
/// SQLite implementation of ICategoryRepository.
/// </summary>
public class SqliteCategoryRepository : ICategoryRepository
{
    private readonly IDatabaseConnectionFactory<SqliteConnection> _factory;

    public SqliteCategoryRepository(IDatabaseConnectionFactory<SqliteConnection> factory)
    {
        _factory = factory;
    }

    public async Task<IEnumerable<PartCategory>> GetAllAsync()
    {
        List<PartCategory> result = [];
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new("SELECT Id, Name FROM PartCategories;", conn);
        using SqliteDataReader reader = await cmd.ExecuteReaderAsync();

        while (await reader.ReadAsync())
        {
            result.Add(new PartCategory
            {
                Id = reader.GetInt32(0),
                Name = reader.GetString(1)
            });
        }

        return result;
    }

    public async Task<int> AddAsync(PartCategory category)
    {
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new(
            "INSERT INTO PartCategories (Name) VALUES (@n); SELECT last_insert_rowid();", conn);

        _ = cmd.Parameters.AddWithValue("@n", category.Name);
        return await cmd.ExecuteInsertAndGetIdAsync();
    }
}
