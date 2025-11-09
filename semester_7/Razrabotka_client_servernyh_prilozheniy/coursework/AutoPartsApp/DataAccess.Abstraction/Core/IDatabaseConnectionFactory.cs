using System.Data;

namespace DataAccess.Abstractions.Core
{
    /// <summary>
    /// Defines contract for creating database connections.
    /// </summary>
    public interface IDatabaseConnectionFactory
    {
        IDbConnection CreateConnection();
    }
}
