namespace DataAccess.Interfaces
{
    /// <summary>
    /// Factory interface that provides access to specific repositories.
    /// </summary>
    public interface IRepositoryFactory
    {
        /// <summary>
        /// Initialize database and repositories.
        /// </summary>
        Task InitializeAsync();

        IClientRepository Clients { get; }
        ISupplierRepository Suppliers { get; }
        IMessageRepository Messages { get; }
        IRatingRepository Ratings { get; }
        IPartRepository Parts { get; }
        IBasketRepository Basket { get; }
        IPartCategoryRepository Categories { get; }
    }
}
