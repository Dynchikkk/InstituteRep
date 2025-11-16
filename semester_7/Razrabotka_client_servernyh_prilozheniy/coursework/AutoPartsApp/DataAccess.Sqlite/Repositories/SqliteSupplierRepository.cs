using DataAccess.Abstractions.Core;
using DataAccess.Abstractions.Repositories;
using DataAccess.Sqlite.Helpers;
using Microsoft.Data.Sqlite;
using SharedModels;

namespace DataAccess.Sqlite.Repositories;

/// <summary>
/// SQLite implementation of ISupplierRepository.
/// </summary>
public class SqliteSupplierRepository : ISupplierRepository
{
    private readonly IDatabaseConnectionFactory<SqliteConnection> _factory;

    public SqliteSupplierRepository(IDatabaseConnectionFactory<SqliteConnection> factory)
    {
        _factory = factory;
    }

    public async Task<IEnumerable<Supplier>> GetAllAsync()
    {
        List<Supplier> result = [];
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new("SELECT Id, Name, Login, Password, Description FROM Suppliers;", conn);
        using SqliteDataReader reader = await cmd.ExecuteReaderAsync();

        while (await reader.ReadAsync())
        {
            result.Add(new Supplier
            {
                Id = reader.GetInt32(0),
                Name = reader.GetString(1),
                Login = reader.GetString(2),
                Password = reader.GetString(3),
                Description = reader.GetString(4)
            });
        }

        return result;
    }

    public async Task<Supplier?> GetByIdAsync(int id)
    {
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new("SELECT Id, Name, Login, Password, Description FROM Suppliers WHERE Id=@id;", conn);
        _ = cmd.Parameters.AddWithValue("@id", id);

        using SqliteDataReader reader = await cmd.ExecuteReaderAsync();
        return await reader.ReadAsync()
            ? new Supplier
            {
                Id = reader.GetInt32(0),
                Name = reader.GetString(1),
                Login = reader.GetString(2),
                Password = reader.GetString(3),
                Description = reader.GetString(4)
            }
            : null;
    }

    public async Task<Supplier?> GetByLoginAsync(string login)
    {
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new("SELECT Id, Name, Login, Password, Description FROM Suppliers WHERE Login=@login;", conn);
        _ = cmd.Parameters.AddWithValue("@login", login);

        using SqliteDataReader reader = await cmd.ExecuteReaderAsync();
        return await reader.ReadAsync()
            ? new Supplier
            {
                Id = reader.GetInt32(0),
                Name = reader.GetString(1),
                Login = reader.GetString(2),
                Password = reader.GetString(3),
                Description = reader.GetString(4)
            }
            : null;
    }

    public async Task<int> AddAsync(Supplier supplier)
    {
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new(
            "INSERT INTO Suppliers (Name, Login, Password, Description) VALUES (@n, @l, @p, @d); SELECT last_insert_rowid();", conn);

        _ = cmd.Parameters.AddWithValue("@n", supplier.Name);
        _ = cmd.Parameters.AddWithValue("@l", supplier.Login);
        _ = cmd.Parameters.AddWithValue("@p", supplier.Password);
        _ = cmd.Parameters.AddWithValue("@d", supplier.Description);

        return await cmd.ExecuteInsertAndGetIdAsync();
    }

    public async Task UpdateAsync(Supplier supplier)
    {
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new(
            "UPDATE Suppliers SET Name=@n, Login=@l, Password=@p, Description=@d WHERE Id=@id;", conn);

        _ = cmd.Parameters.AddWithValue("@id", supplier.Id);
        _ = cmd.Parameters.AddWithValue("@n", supplier.Name);
        _ = cmd.Parameters.AddWithValue("@l", supplier.Login);
        _ = cmd.Parameters.AddWithValue("@p", supplier.Password);
        _ = cmd.Parameters.AddWithValue("@d", supplier.Description);

        _ = await cmd.ExecuteNonQueryAsync();
    }

    public async Task DeleteAsync(int id)
    {
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new("DELETE FROM Suppliers WHERE Id=@id;", conn);
        _ = cmd.Parameters.AddWithValue("@id", id);
        _ = await cmd.ExecuteNonQueryAsync();
    }
}
