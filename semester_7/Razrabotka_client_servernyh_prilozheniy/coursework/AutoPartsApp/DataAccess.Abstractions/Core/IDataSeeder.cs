namespace DataAccess.Abstractions.Core;

/// <summary>
/// Seed test / demo data into database.
/// Implementations should be idempotent and safe to call multiple times.
/// </summary>
public interface IDataSeeder
{
    /// <summary>
    /// Check whether the database is empty (no domain data).
    /// Return true if empty (needs seeding), false otherwise.
    /// </summary>
    Task<bool> IsEmptyAsync();

    /// <summary>
    /// Seed demo/test data into the database.
    /// </summary>
    Task SeedAsync();
}
