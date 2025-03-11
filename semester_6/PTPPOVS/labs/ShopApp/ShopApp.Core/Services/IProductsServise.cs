namespace ShopApp.Core.Services
{
    /// <summary>
    /// Abstract product service
    /// </summary>
    /// <typeparam name="T">Type of Product</typeparam>
    public interface IProductsService<T> : IDisposable
        where T : class
    {
        /// <summary>
        /// Add product to collection
        /// </summary>
        /// <param name="product">Product</param>
        /// <returns>True if add was successful, else - false</returns>
        bool Add(T product);
        /// <summary>
        /// Remove product from collection
        /// </summary>
        /// <param name="productId">Product id</param>
        /// <returns>Product if remove was successful, else - null</returns>
        T? Remove(Guid productId);
        /// <summary>
        /// Edit product in collection
        /// </summary>
        /// <param name="product">Product</param>
        /// <returns>Product if edit was successful, else - null</returns>
        T? Edit(T product);
        /// <summary>
        /// Search product in collection
        /// </summary>
        /// <param name="productId">Product id</param>
        /// <returns>Product if search was successful, else - null</returns>
        T? Search(Guid productId);
    }
}
