using DataAccess.Interfaces;
using Microsoft.Data.Sqlite;
using SharedModels;
using System.Collections.Generic;
using System.Threading.Tasks;
using System;

namespace DataAccess.Sqlite
{
    /// <summary>
    /// SQLite implementation of supplier repository.
    /// Handles CRUD operations for Supplier entities.
    /// </summary>
    public class SqliteSupplierRepository : ISupplierRepository
    {
        private readonly string _connectionString;

        public SqliteSupplierRepository(string connectionString)
        {
            _connectionString = connectionString;
        }

        public async Task<int> AddAsync(Supplier supplier)
        {
            using var conn = SqliteHelpers.GetConnection(_connectionString);
            string sql = @"INSERT INTO Suppliers (Name, Login, Password, Description)
                           VALUES (@Name, @Login, @Password, @Description);
                           SELECT last_insert_rowid();";

            using var cmd = new SqliteCommand(sql, conn);
            cmd.Parameters.AddWithValue("@Name", supplier.Name);
            cmd.Parameters.AddWithValue("@Login", supplier.Login);
            cmd.Parameters.AddWithValue("@Password", supplier.Password);
            cmd.Parameters.AddWithValue("@Description", supplier.Description);

            var result = await cmd.ExecuteScalarAsync();
            return Convert.ToInt32((long)result!);
        }

        public async Task DeleteAsync(int id)
        {
            using var conn = SqliteHelpers.GetConnection(_connectionString);
            string sql = "DELETE FROM Suppliers WHERE Id = @Id;";
            using var cmd = new SqliteCommand(sql, conn);
            cmd.Parameters.AddWithValue("@Id", id);
            await cmd.ExecuteNonQueryAsync();
        }

        public async Task<IEnumerable<Supplier>> GetAllAsync()
        {
            var suppliers = new List<Supplier>();
            using var conn = SqliteHelpers.GetConnection(_connectionString);
            string sql = "SELECT Id, Name, Login, Password, Description FROM Suppliers;";
            using var cmd = new SqliteCommand(sql, conn);
            using var reader = await cmd.ExecuteReaderAsync();

            while (await reader.ReadAsync())
            {
                suppliers.Add(new Supplier
                {
                    Id = Convert.ToInt32(reader["Id"]),
                    Name = Convert.ToString(reader["Name"]) ?? "",
                    Login = Convert.ToString(reader["Login"]) ?? "",
                    Password = Convert.ToString(reader["Password"]) ?? "",
                    Description = Convert.ToString(reader["Description"]) ?? ""
                });
            }

            return suppliers;
        }

        public async Task<Supplier?> GetByIdAsync(int id)
        {
            using var conn = SqliteHelpers.GetConnection(_connectionString);
            string sql = "SELECT Id, Name, Login, Password, Description FROM Suppliers WHERE Id=@Id;";
            using var cmd = new SqliteCommand(sql, conn);
            cmd.Parameters.AddWithValue("@Id", id);
            using var reader = await cmd.ExecuteReaderAsync();

            if (await reader.ReadAsync())
            {
                return new Supplier
                {
                    Id = Convert.ToInt32(reader["Id"]),
                    Name = Convert.ToString(reader["Name"]) ?? "",
                    Login = Convert.ToString(reader["Login"]) ?? "",
                    Password = Convert.ToString(reader["Password"]) ?? "",
                    Description = Convert.ToString(reader["Description"]) ?? ""
                };
            }

            return null;
        }

        public async Task<Supplier?> GetByLoginAsync(string login)
        {
            using var conn = SqliteHelpers.GetConnection(_connectionString);
            string sql = "SELECT Id, Name, Login, Password, Description FROM Suppliers WHERE Login=@Login;";
            using var cmd = new SqliteCommand(sql, conn);
            cmd.Parameters.AddWithValue("@Login", login);
            using var reader = await cmd.ExecuteReaderAsync();

            if (await reader.ReadAsync())
            {
                return new Supplier
                {
                    Id = Convert.ToInt32(reader["Id"]),
                    Name = Convert.ToString(reader["Name"]) ?? "",
                    Login = Convert.ToString(reader["Login"]) ?? "",
                    Password = Convert.ToString(reader["Password"]) ?? "",
                    Description = Convert.ToString(reader["Description"]) ?? ""
                };
            }

            return null;
        }

        public async Task UpdateAsync(Supplier supplier)
        {
            using var conn = SqliteHelpers.GetConnection(_connectionString);
            string sql = "UPDATE Suppliers SET Name=@Name, Login=@Login, Password=@Password, Description=@Description WHERE Id=@Id;";
            using var cmd = new SqliteCommand(sql, conn);
            cmd.Parameters.AddWithValue("@Name", supplier.Name);
            cmd.Parameters.AddWithValue("@Login", supplier.Login);
            cmd.Parameters.AddWithValue("@Password", supplier.Password);
            cmd.Parameters.AddWithValue("@Description", supplier.Description);
            cmd.Parameters.AddWithValue("@Id", supplier.Id);
            await cmd.ExecuteNonQueryAsync();
        }
    }
}
