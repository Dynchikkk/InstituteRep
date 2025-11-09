using DataAccess.Abstractions.Core;
using DataAccess.Abstractions.Repositories;
using DataAccess.Sqlite.Helpers;
using Microsoft.Data.Sqlite;
using SharedModels;

namespace DataAccess.Sqlite.Repositories
{
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
            var result = new List<Client>();
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand("SELECT Id, Name, Login, Password FROM Clients;", conn);
            using var reader = await cmd.ExecuteReaderAsync();

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
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand("SELECT Id, Name, Login, Password FROM Clients WHERE Id = @id;", conn);
            cmd.Parameters.AddWithValue("@id", id);

            using var reader = await cmd.ExecuteReaderAsync();
            if (await reader.ReadAsync())
            {
                return new Client
                {
                    Id = reader.GetInt32(0),
                    Name = reader.GetString(1),
                    Login = reader.GetString(2),
                    Password = reader.GetString(3)
                };
            }
            return null;
        }

        public async Task<Client?> GetByLoginAsync(string login)
        {
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand("SELECT Id, Name, Login, Password FROM Clients WHERE Login = @login;", conn);
            cmd.Parameters.AddWithValue("@login", login);

            using var reader = await cmd.ExecuteReaderAsync();
            if (await reader.ReadAsync())
            {
                return new Client
                {
                    Id = reader.GetInt32(0),
                    Name = reader.GetString(1),
                    Login = reader.GetString(2),
                    Password = reader.GetString(3)
                };
            }
            return null;
        }

        public async Task<int> AddAsync(Client client)
        {
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand(
                "INSERT INTO Clients (Name, Login, Password) VALUES (@n, @l, @p); SELECT last_insert_rowid();", conn);

            cmd.Parameters.AddWithValue("@n", client.Name);
            cmd.Parameters.AddWithValue("@l", client.Login);
            cmd.Parameters.AddWithValue("@p", client.Password);

            return await cmd.ExecuteInsertAndGetIdAsync();
        }

        public async Task UpdateAsync(Client client)
        {
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand(
                "UPDATE Clients SET Name=@n, Login=@l, Password=@p WHERE Id=@id;", conn);

            cmd.Parameters.AddWithValue("@id", client.Id);
            cmd.Parameters.AddWithValue("@n", client.Name);
            cmd.Parameters.AddWithValue("@l", client.Login);
            cmd.Parameters.AddWithValue("@p", client.Password);

            await cmd.ExecuteNonQueryAsync();
        }

        public async Task DeleteAsync(int id)
        {
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand("DELETE FROM Clients WHERE Id=@id;", conn);
            cmd.Parameters.AddWithValue("@id", id);
            await cmd.ExecuteNonQueryAsync();
        }
    }
}
