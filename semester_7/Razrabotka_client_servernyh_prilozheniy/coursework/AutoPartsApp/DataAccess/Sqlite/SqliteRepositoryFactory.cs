using DataAccess.Interfaces;

namespace DataAccess.Sqlite
{
    /// <summary>
    /// SQLite implementation of the repository factory.
    /// </summary>
    public class SqliteRepositoryFactory : IRepositoryFactory
    {
        private readonly string _connectionString;

        public IClientRepository Clients { get; }
        public ISupplierRepository Suppliers { get; }
        public IMessageRepository Messages { get; }
        public IRatingRepository Ratings { get; }
        public IPartRepository Parts { get; }
        public IBasketRepository Basket { get; }
        public IPartCategoryRepository Categories { get; }

        public SqliteRepositoryFactory(string dbPath)
        {
            _connectionString = $"Data Source={dbPath};";

            Clients = new SqliteClientRepository(_connectionString);
            Suppliers = new SqliteSupplierRepository(_connectionString);
            Messages = new SqliteMessageRepository(_connectionString);
            Ratings = new SqliteRatingRepository(_connectionString);
            Parts = new SqlitePartRepository(_connectionString);
            Basket = new SqliteBasketRepository(_connectionString);
            Categories = new SqlitePartCategoryRepository(_connectionString);
        }

        public async Task InitializeAsync()
        {
            var init = new SqliteDatabaseInitializer(_connectionString);
            await init.InitializeAsync();

        }
    }
}
