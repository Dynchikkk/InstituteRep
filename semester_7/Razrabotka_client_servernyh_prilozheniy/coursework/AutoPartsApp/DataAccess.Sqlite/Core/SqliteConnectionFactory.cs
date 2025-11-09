using DataAccess.Abstractions.Core;
using Microsoft.Data.Sqlite;

public class SqliteConnectionFactory : IDatabaseConnectionFactory<SqliteConnection>
{
    private readonly string _connectionString;

    public SqliteConnectionFactory(string connectionString)
    {
        _connectionString = connectionString;
    }

    public SqliteConnection CreateConnection()
    {
        var conn = new SqliteConnection(_connectionString);
        conn.Open();
        return conn;
    }
}
