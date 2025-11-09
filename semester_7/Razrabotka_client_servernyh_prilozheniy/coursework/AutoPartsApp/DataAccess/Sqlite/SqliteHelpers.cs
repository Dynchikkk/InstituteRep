using Microsoft.Data.Sqlite;

namespace DataAccess.Sqlite
{
    /// <summary>
    /// Common helper methods for working with SQLite connections.
    /// </summary>
    internal static class SqliteHelpers
    {
        public static SqliteConnection GetConnection(string connectionString)
        {
            var conn = new SqliteConnection(connectionString);
            conn.Open();
            return conn;
        }

        public static async Task<int> ExecuteNonQueryAsync(SqliteConnection conn, string sql, params SqliteParameter[] parameters)
        {
            using var cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.AddRange(parameters);
            return await cmd.ExecuteNonQueryAsync();
        }

        public static async Task<object?> ExecuteScalarAsync(SqliteConnection conn, string sql, params SqliteParameter[] parameters)
        {
            using var cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.AddRange(parameters);
            return await cmd.ExecuteScalarAsync();
        }
    }
}
