namespace DataAccess.Abstractions.Config
{
    /// <summary>
    /// Common database configuration.
    /// </summary>
    public class DatabaseSettings
    {
        public string ConnectionString { get; set; } = "Data Source=database.db";
    }
}
