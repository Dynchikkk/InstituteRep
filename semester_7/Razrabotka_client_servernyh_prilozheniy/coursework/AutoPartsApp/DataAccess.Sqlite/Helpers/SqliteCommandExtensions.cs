using Microsoft.Data.Sqlite;

namespace DataAccess.Sqlite.Helpers
{
    /// <summary>
    /// Extension methods to simplify safe command execution.
    /// </summary>
    public static class SqliteCommandExtensions
    {
        /// <summary>
        /// Executes INSERT command and safely returns last inserted Id.
        /// </summary>
        public static async Task<int> ExecuteInsertAndGetIdAsync(this SqliteCommand cmd)
        {
            var result = await cmd.ExecuteScalarAsync();
            return result != null && result != DBNull.Value ? Convert.ToInt32(result) : 0;
        }
    }
}
