using Microsoft.Data.Sqlite;

namespace DataAccess.Sqlite
{
    /// <summary>
    /// Responsible for creating SQLite database schema if it doesn't exist.
    /// </summary>
    public class SqliteDatabaseInitializer
    {
        private readonly string _connectionString;

        public SqliteDatabaseInitializer(string connectionString)
        {
            _connectionString = connectionString;
        }

        public async Task InitializeAsync()
        {
            using var conn = new SqliteConnection(_connectionString);
            await conn.OpenAsync();

            var commands = new[]
            {
                // Clients
                @"CREATE TABLE IF NOT EXISTS Clients (
                    Id INTEGER PRIMARY KEY AUTOINCREMENT,
                    Name TEXT NOT NULL,
                    Login TEXT NOT NULL UNIQUE,
                    Password TEXT NOT NULL
                );",

                // Suppliers
                @"CREATE TABLE IF NOT EXISTS Suppliers (
                    Id INTEGER PRIMARY KEY AUTOINCREMENT,
                    Name TEXT NOT NULL,
                    Login TEXT NOT NULL UNIQUE,
                    Password TEXT NOT NULL,
                    Description TEXT
                );",

                // Categories
                @"CREATE TABLE IF NOT EXISTS PartCategories (
                    Id INTEGER PRIMARY KEY AUTOINCREMENT,
                    Name TEXT NOT NULL
                );",

                // Parts
                @"CREATE TABLE IF NOT EXISTS Parts (
                    Id INTEGER PRIMARY KEY AUTOINCREMENT,
                    SupplierId INTEGER NOT NULL,
                    CategoryId INTEGER NOT NULL,
                    Name TEXT NOT NULL,
                    Price REAL NOT NULL,
                    Quantity INTEGER NOT NULL,
                    FOREIGN KEY (SupplierId) REFERENCES Suppliers(Id),
                    FOREIGN KEY (CategoryId) REFERENCES PartCategories(Id)
                );",

                // Messages
                @"CREATE TABLE IF NOT EXISTS Messages (
                    Id INTEGER PRIMARY KEY AUTOINCREMENT,
                    SupplierId INTEGER NOT NULL,
                    ClientId INTEGER NOT NULL,
                    FromRole INTEGER NOT NULL,
                    Text TEXT NOT NULL,
                    SentAt TEXT NOT NULL,
                    FOREIGN KEY (SupplierId) REFERENCES Suppliers(Id),
                    FOREIGN KEY (ClientId) REFERENCES Clients(Id)
                );",

                // Ratings
                @"CREATE TABLE IF NOT EXISTS Ratings (
                    Id INTEGER PRIMARY KEY AUTOINCREMENT,
                    SupplierId INTEGER NOT NULL,
                    ClientId INTEGER NOT NULL,
                    Value INTEGER NOT NULL,
                    CreatedAt TEXT NOT NULL,
                    UNIQUE(SupplierId, ClientId),
                    FOREIGN KEY (SupplierId) REFERENCES Suppliers(Id),
                    FOREIGN KEY (ClientId) REFERENCES Clients(Id)
                );",

                // Basket
                @"CREATE TABLE IF NOT EXISTS BasketItems (
                    Id INTEGER PRIMARY KEY AUTOINCREMENT,
                    ClientId INTEGER NOT NULL,
                    SupplierId INTEGER NOT NULL,
                    PartId INTEGER NOT NULL,
                    Quantity INTEGER NOT NULL,
                    FOREIGN KEY (ClientId) REFERENCES Clients(Id),
                    FOREIGN KEY (SupplierId) REFERENCES Suppliers(Id),
                    FOREIGN KEY (PartId) REFERENCES Parts(Id)
                );"
            };

            foreach (var cmdText in commands)
            {
                using var cmd = conn.CreateCommand();
                cmd.CommandText = cmdText;
                await cmd.ExecuteNonQueryAsync();
            }
        }
    }
}
