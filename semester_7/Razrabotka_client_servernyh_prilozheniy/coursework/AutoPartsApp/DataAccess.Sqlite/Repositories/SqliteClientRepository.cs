using DataAccess.Abstractions.Core;
using DataAccess.Abstractions.Repositories;
using DataAccess.Sqlite.Helpers;
using Microsoft.Data.Sqlite;
using SharedModels;

namespace DataAccess.Sqlite.Repositories;

/// <summary>
/// SQLite implementation of IClientRepository.
/// </summary>
public class SqliteClientRepository : IClientRepository
{
    private readonly IDatabaseConnectionFactory<SqliteConnection> _factory;

    public SqliteClientRepository(IDatabaseConnectionFactory<SqliteConnection> factory)
    {
        _factory = factory;
    }

    public async Task<IEnumerable<Client>> GetAllAsync()
    {
        List<Client> result = [];
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new("SELECT Id, Name, Login, Password FROM Clients;", conn);
        using SqliteDataReader reader = await cmd.ExecuteReaderAsync();

        while (await reader.ReadAsync())
        {
            result.Add(new Client
            {
                Id = reader.GetInt32(0),
                Name = reader.GetString(1),
                Login = reader.GetString(2),
                Password = reader.GetString(3)
            });
        }

        return result;
    }

    public async Task<Client?> GetByIdAsync(int id)
    {
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new("SELECT Id, Name, Login, Password FROM Clients WHERE Id = @id;", conn);
        _ = cmd.Parameters.AddWithValue("@id", id);

        using SqliteDataReader reader = await cmd.ExecuteReaderAsync();
        return await reader.ReadAsync()
            ? new Client
            {
                Id = reader.GetInt32(0),
                Name = reader.GetString(1),
                Login = reader.GetString(2),
                Password = reader.GetString(3)
            }
            : null;
    }

    public async Task<Client?> GetByLoginAsync(string login)
    {
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new("SELECT Id, Name, Login, Password FROM Clients WHERE Login = @login;", conn);
        _ = cmd.Parameters.AddWithValue("@login", login);

        using SqliteDataReader reader = await cmd.ExecuteReaderAsync();
        return await reader.ReadAsync()
            ? new Client
            {
                Id = reader.GetInt32(0),
                Name = reader.GetString(1),
                Login = reader.GetString(2),
                Password = reader.GetString(3)
            }
            : null;
    }

    public async Task<int> AddAsync(Client client)
    {
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new(
            "INSERT INTO Clients (Name, Login, Password) VALUES (@n, @l, @p); SELECT last_insert_rowid();", conn);

        _ = cmd.Parameters.AddWithValue("@n", client.Name);
        _ = cmd.Parameters.AddWithValue("@l", client.Login);
        _ = cmd.Parameters.AddWithValue("@p", client.Password);

        return await cmd.ExecuteInsertAndGetIdAsync();
    }

    public async Task UpdateAsync(Client client)
    {
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new(
            "UPDATE Clients SET Name=@n, Login=@l, Password=@p WHERE Id=@id;", conn);

        _ = cmd.Parameters.AddWithValue("@id", client.Id);
        _ = cmd.Parameters.AddWithValue("@n", client.Name);
        _ = cmd.Parameters.AddWithValue("@l", client.Login);
        _ = cmd.Parameters.AddWithValue("@p", client.Password);

        _ = await cmd.ExecuteNonQueryAsync();
    }

    public async Task DeleteAsync(int id)
    {
        using SqliteConnection conn = _factory.CreateConnection();
        using SqliteCommand cmd = new("DELETE FROM Clients WHERE Id=@id;", conn);
        _ = cmd.Parameters.AddWithValue("@id", id);
        _ = await cmd.ExecuteNonQueryAsync();
    }
}
