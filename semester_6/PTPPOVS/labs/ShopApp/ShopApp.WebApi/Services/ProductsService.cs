using ShopApp.Core.Data;
using ShopApp.Core.Models;
using ShopApp.Core.Services;

namespace ShopApp.WebApi.Services
{
    /// <summary>
    /// Provides operations for managing products using a database.
    /// </summary>
    public class ProductsService : IProductsService<Product>, IDisposable
    {
        private readonly IDataBase _dataBase;

        /// <summary>
        /// Initializes a new instance of the <see cref="ProductsService"/> class.
        /// </summary>
        /// <param name="dataBase">The database instance to be used for product operations.</param>
        public ProductsService(IDataBase dataBase)
        {
            _dataBase = dataBase ?? throw new ArgumentNullException(nameof(dataBase));
            // Initialize the table and index.
            _dataBase.CreateTable();
            _dataBase.CreateIndex();
        }

        /// <summary>
        /// Performs application-defined tasks associated with freeing, releasing, or resetting unmanaged resources.
        /// </summary>
        public void Dispose()
        {
        }

        /// <summary>
        /// Adds a new product.
        /// </summary>
        /// <param name="product">The product to add.</param>
        /// <returns>A task that represents the asynchronous add operation. The task result contains true if successful; otherwise, false.</returns>
        public Task<bool> Add(Product product)
        {
            try
            {
                _dataBase.InsertProduct(product);
                return Task.FromResult(true);
            }
            catch (Exception)
            {
                return Task.FromResult(false);
            }
        }

        /// <summary>
        /// Updates an existing product.
        /// </summary>
        /// <param name="product">The product with updated data.</param>
        /// <returns>A task that represents the asynchronous update operation. The task result contains the updated product if successful; otherwise, null.</returns>
        public Task<Product?> Edit(Product product)
        {
            try
            {
                _dataBase.UpdateProduct(product);
                return Task.FromResult<Product?>(product);
            }
            catch (Exception)
            {
                return Task.FromResult<Product?>(null);
            }
        }

        /// <summary>
        /// Removes a product by its unique identifier.
        /// </summary>
        /// <param name="productId">The unique identifier of the product to remove.</param>
        /// <returns>A task that represents the asynchronous remove operation. The task result contains the removed product if successful; otherwise, null.</returns>
        public Task<Product?> Remove(Guid productId)
        {
            try
            {
                // Get the product from the database before deleting.
                var product = _dataBase.SelectProductById(productId);
                if (product != null)
                {
                    _dataBase.DeleteProduct(productId);
                }
                return Task.FromResult(product);
            }
            catch (Exception)
            {
                return Task.FromResult<Product?>(null);
            }
        }

        /// <summary>
        /// Searches for a product by its unique identifier.
        /// </summary>
        /// <param name="productId">The unique identifier of the product.</param>
        /// <returns>A task that represents the asynchronous search operation. The task result contains the product if found; otherwise, null.</returns>
        public Task<Product?> Search(Guid productId)
        {
            try
            {
                var product = _dataBase.SelectProductById(productId);
                return Task.FromResult(product);
            }
            catch (Exception)
            {
                return Task.FromResult<Product?>(null);
            }
        }

        /// <summary>
        /// Retrieves all products.
        /// </summary>
        /// <returns>A task that represents the asynchronous get operation. The task result contains an enumerable of <see cref="Product"/> objects.</returns>
        public Task<IEnumerable<Product>> GetAll()
        {
            try
            {
                var products = _dataBase.SelectProducts();
                return Task.FromResult(products);
            }
            catch (Exception)
            {
                return Task.FromResult(Enumerable.Empty<Product>());
            }
        }
    }
}
