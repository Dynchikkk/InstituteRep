using DataAccess.Abstractions.Core;
using DataAccess.Sqlite.Config;
using Microsoft.Data.Sqlite;

namespace DataAccess.Sqlite.Core;

/// <summary>
/// Initializes SQLite database (creates tables if missing).
/// </summary>
public class SqliteDatabaseInitializer : IDatabaseInitializer
{
    private readonly SqliteDatabaseSettings _settings;

    public SqliteDatabaseInitializer(SqliteDatabaseSettings settings)
    {
        _settings = settings;
    }

    public void Initialize()
    {
        using SqliteConnection connection = new(_settings.ConnectionString);
        connection.Open();

        SqliteCommand cmd = connection.CreateCommand();
        cmd.CommandText = @"
                CREATE TABLE IF NOT EXISTS Clients (
                    Id INTEGER PRIMARY KEY AUTOINCREMENT,
                    Name TEXT,
                    Login TEXT,
                    Password TEXT
                );
                CREATE TABLE IF NOT EXISTS Suppliers (
                    Id INTEGER PRIMARY KEY AUTOINCREMENT,
                    Name TEXT,
                    Login TEXT,
                    Password TEXT,
                    Description TEXT
                );
                CREATE TABLE IF NOT EXISTS Messages (
                    Id INTEGER PRIMARY KEY AUTOINCREMENT,
                    SupplierId INTEGER,
                    ClientId INTEGER,
                    FromRole INTEGER,
                    Text TEXT,
                    SentAt TEXT
                );
                CREATE TABLE IF NOT EXISTS Ratings (
                    Id INTEGER PRIMARY KEY AUTOINCREMENT,
                    SupplierId INTEGER,
                    ClientId INTEGER,
                    Value INTEGER,
                    CreatedAt TEXT
                );
                CREATE TABLE IF NOT EXISTS PartCategories (
                    Id INTEGER PRIMARY KEY AUTOINCREMENT,
                    Name TEXT
                );
                CREATE TABLE IF NOT EXISTS Parts (
                    Id INTEGER PRIMARY KEY AUTOINCREMENT,
                    SupplierId INTEGER,
                    CategoryId INTEGER,
                    Name TEXT,
                    Price REAL,
                    Quantity INTEGER
                );
                CREATE TABLE IF NOT EXISTS BasketItems (
                    Id INTEGER PRIMARY KEY AUTOINCREMENT,
                    ClientId INTEGER,
                    SupplierId INTEGER,
                    PartId INTEGER,
                    Quantity INTEGER
                );";
        _ = cmd.ExecuteNonQuery();
    }
}
