using DataAccess.Abstractions.Core;
using DataAccess.Abstractions.Repositories;
using DataAccess.Sqlite.Helpers;
using Microsoft.Data.Sqlite;
using SharedModels;

namespace DataAccess.Sqlite.Repositories
{
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
            var result = new List<PartCategory>();
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand("SELECT Id, Name FROM PartCategories;", conn);
            using var reader = await cmd.ExecuteReaderAsync();

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
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand(
                "INSERT INTO PartCategories (Name) VALUES (@n); SELECT last_insert_rowid();", conn);

            cmd.Parameters.AddWithValue("@n", category.Name);
            return await cmd.ExecuteInsertAndGetIdAsync();
        }
    }
}
