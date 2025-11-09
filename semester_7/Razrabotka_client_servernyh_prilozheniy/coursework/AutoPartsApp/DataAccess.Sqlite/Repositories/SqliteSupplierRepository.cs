using DataAccess.Abstractions.Core;
using DataAccess.Abstractions.Repositories;
using DataAccess.Sqlite.Helpers;
using Microsoft.Data.Sqlite;
using SharedModels;

namespace DataAccess.Sqlite.Repositories
{
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
            var result = new List<Supplier>();
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand("SELECT Id, Name, Login, Password, Description FROM Suppliers;", conn);
            using var reader = await cmd.ExecuteReaderAsync();

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
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand("SELECT Id, Name, Login, Password, Description FROM Suppliers WHERE Id=@id;", conn);
            cmd.Parameters.AddWithValue("@id", id);

            using var reader = await cmd.ExecuteReaderAsync();
            if (await reader.ReadAsync())
            {
                return new Supplier
                {
                    Id = reader.GetInt32(0),
                    Name = reader.GetString(1),
                    Login = reader.GetString(2),
                    Password = reader.GetString(3),
                    Description = reader.GetString(4)
                };
            }
            return null;
        }

        public async Task<Supplier?> GetByLoginAsync(string login)
        {
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand("SELECT Id, Name, Login, Password, Description FROM Suppliers WHERE Login=@login;", conn);
            cmd.Parameters.AddWithValue("@login", login);

            using var reader = await cmd.ExecuteReaderAsync();
            if (await reader.ReadAsync())
            {
                return new Supplier
                {
                    Id = reader.GetInt32(0),
                    Name = reader.GetString(1),
                    Login = reader.GetString(2),
                    Password = reader.GetString(3),
                    Description = reader.GetString(4)
                };
            }
            return null;
        }

        public async Task<int> AddAsync(Supplier supplier)
        {
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand(
                "INSERT INTO Suppliers (Name, Login, Password, Description) VALUES (@n, @l, @p, @d); SELECT last_insert_rowid();", conn);

            cmd.Parameters.AddWithValue("@n", supplier.Name);
            cmd.Parameters.AddWithValue("@l", supplier.Login);
            cmd.Parameters.AddWithValue("@p", supplier.Password);
            cmd.Parameters.AddWithValue("@d", supplier.Description);

            return await cmd.ExecuteInsertAndGetIdAsync();
        }

        public async Task UpdateAsync(Supplier supplier)
        {
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand(
                "UPDATE Suppliers SET Name=@n, Login=@l, Password=@p, Description=@d WHERE Id=@id;", conn);

            cmd.Parameters.AddWithValue("@id", supplier.Id);
            cmd.Parameters.AddWithValue("@n", supplier.Name);
            cmd.Parameters.AddWithValue("@l", supplier.Login);
            cmd.Parameters.AddWithValue("@p", supplier.Password);
            cmd.Parameters.AddWithValue("@d", supplier.Description);

            await cmd.ExecuteNonQueryAsync();
        }

        public async Task DeleteAsync(int id)
        {
            using var conn = _factory.CreateConnection();
            using var cmd = new SqliteCommand("DELETE FROM Suppliers WHERE Id=@id;", conn);
            cmd.Parameters.AddWithValue("@id", id);
            await cmd.ExecuteNonQueryAsync();
        }
    }
}
