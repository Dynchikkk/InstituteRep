using DataAccess.Abstractions.Core;
using DataAccess.Sqlite.Config;
using Microsoft.Data.Sqlite;

public class SqliteConnectionFactory : IDatabaseConnectionFactory<SqliteConnection>
{
    private readonly string _connectionString;

    public SqliteConnectionFactory(SqliteDatabaseSettings databaseSettings)
    {
        _connectionString = databaseSettings.ConnectionString;
    }

    public SqliteConnection CreateConnection()
    {
        var conn = new SqliteConnection(_connectionString);
        conn.Open();
        return conn;
    }
}
