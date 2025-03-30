using ShopApp.Core.Models;

namespace ShopApp.Core.Data
{
    /// <summary>
    /// Defines the methods required for interacting with the database.
    /// </summary>
    public interface IDataBase
    {
        /// <summary>
        /// Creates the Products table if it does not exist.
        /// </summary>
        void CreateTable();

        /// <summary>
        /// Creates an index on the Id field of the Products table.
        /// </summary>
        void CreateIndex();

        /// <summary>
        /// Retrieves all products from the Products table.
        /// </summary>
        /// <returns>An enumerable collection of <see cref="Product"/> objects.</returns>
        IEnumerable<Product> SelectProducts();

        /// <summary>
        /// Retrieves a single product by its Id.
        /// </summary>
        /// <param name="productId">The unique identifier of the product.</param>
        /// <returns>A <see cref="Product"/> object if found; otherwise, null.</returns>
        Product? SelectProductById(Guid productId);

        /// <summary>
        /// Inserts a new product into the Products table.
        /// </summary>
        /// <param name="product">The <see cref="Product"/> to insert.</param>
        void InsertProduct(Product product);

        /// <summary>
        /// Updates an existing product in the Products table.
        /// </summary>
        /// <param name="product">The <see cref="Product"/> with updated data.</param>
        void UpdateProduct(Product product);

        /// <summary>
        /// Deletes a product from the Products table by its Id.
        /// </summary>
        /// <param name="productId">The unique identifier of the product to delete.</param>
        void DeleteProduct(Guid productId);
    }
}