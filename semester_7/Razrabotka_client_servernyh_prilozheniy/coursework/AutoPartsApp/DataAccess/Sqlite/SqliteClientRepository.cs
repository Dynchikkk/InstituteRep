using DataAccess.Interfaces;
using Microsoft.Data.Sqlite;
using SharedModels;
using System.Collections.Generic;
using System.Threading.Tasks;
using System;

namespace DataAccess.Sqlite
{
    /// <summary>
    /// SQLite implementation of client repository.
    /// Handles CRUD operations for Client entities.
    /// </summary>
    public class SqliteClientRepository : IClientRepository
    {
        private readonly string _connectionString;

        public SqliteClientRepository(string connectionString)
        {
            _connectionString = connectionString;
        }

        public async Task<int> AddAsync(Client client)
        {
            using var conn = SqliteHelpers.GetConnection(_connectionString);
            string sql = @"INSERT INTO Clients (Name, Login, Password)
                           VALUES (@Name, @Login, @Password);
                           SELECT last_insert_rowid();";

            using var cmd = new SqliteCommand(sql, conn);
            cmd.Parameters.AddWithValue("@Name", client.Name);
            cmd.Parameters.AddWithValue("@Login", client.Login);
            cmd.Parameters.AddWithValue("@Password", client.Password);

            var result = await cmd.ExecuteScalarAsync();
            return Convert.ToInt32((long)result!);
        }

        public async Task DeleteAsync(int id)
        {
            using var conn = SqliteHelpers.GetConnection(_connectionString);
            string sql = "DELETE FROM Clients WHERE Id = @Id;";
            using var cmd = new SqliteCommand(sql, conn);
            cmd.Parameters.AddWithValue("@Id", id);
            await cmd.ExecuteNonQueryAsync();
        }

        public async Task<IEnumerable<Client>> GetAllAsync()
        {
            var clients = new List<Client>();
            using var conn = SqliteHelpers.GetConnection(_connectionString);
            string sql = "SELECT Id, Name, Login, Password FROM Clients;";
            using var cmd = new SqliteCommand(sql, conn);
            using var reader = await cmd.ExecuteReaderAsync();

            while (await reader.ReadAsync())
            {
                clients.Add(new Client
                {
                    Id = Convert.ToInt32(reader["Id"]),
                    Name = Convert.ToString(reader["Name"]) ?? "",
                    Login = Convert.ToString(reader["Login"]) ?? "",
                    Password = Convert.ToString(reader["Password"]) ?? ""
                });
            }

            return clients;
        }

        public async Task<Client?> GetByIdAsync(int id)
        {
            using var conn = SqliteHelpers.GetConnection(_connectionString);
            string sql = "SELECT Id, Name, Login, Password FROM Clients WHERE Id = @Id;";
            using var cmd = new SqliteCommand(sql, conn);
            cmd.Parameters.AddWithValue("@Id", id);
            using var reader = await cmd.ExecuteReaderAsync();

            if (await reader.ReadAsync())
            {
                return new Client
                {
                    Id = Convert.ToInt32(reader["Id"]),
                    Name = Convert.ToString(reader["Name"]) ?? "",
                    Login = Convert.ToString(reader["Login"]) ?? "",
                    Password = Convert.ToString(reader["Password"]) ?? ""
                };
            }

            return null;
        }

        public async Task<Client?> GetByLoginAsync(string login)
        {
            using var conn = SqliteHelpers.GetConnection(_connectionString);
            string sql = "SELECT Id, Name, Login, Password FROM Clients WHERE Login = @Login;";
            using var cmd = new SqliteCommand(sql, conn);
            cmd.Parameters.AddWithValue("@Login", login);
            using var reader = await cmd.ExecuteReaderAsync();

            if (await reader.ReadAsync())
            {
                return new Client
                {
                    Id = Convert.ToInt32(reader["Id"]),
                    Name = Convert.ToString(reader["Name"]) ?? "",
                    Login = Convert.ToString(reader["Login"]) ?? "",
                    Password = Convert.ToString(reader["Password"]) ?? ""
                };
            }

            return null;
        }

        public async Task UpdateAsync(Client client)
        {
            using var conn = SqliteHelpers.GetConnection(_connectionString);
            string sql = "UPDATE Clients SET Name=@Name, Login=@Login, Password=@Password WHERE Id=@Id;";
            using var cmd = new SqliteCommand(sql, conn);
            cmd.Parameters.AddWithValue("@Name", client.Name);
            cmd.Parameters.AddWithValue("@Login", client.Login);
            cmd.Parameters.AddWithValue("@Password", client.Password);
            cmd.Parameters.AddWithValue("@Id", client.Id);
            await cmd.ExecuteNonQueryAsync();
        }
    }
}
