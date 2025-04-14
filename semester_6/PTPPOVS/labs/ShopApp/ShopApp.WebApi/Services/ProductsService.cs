using ShopApp.Core.Models;
using ShopApp.Core.Services;
using ShopApp.WebApi.Data;

namespace ShopApp.WebApi.Services
{
    /// <summary>
    /// Provides operations for managing products using a database.
    /// </summary>
    public class ProductsService : IProductsService<Product>, IDisposable
    {
        private readonly SqliteDataBase _dataBase;

        /// <summary>
        /// Initializes a new instance of the <see cref="ProductsService"/> class.
        /// </summary>
        /// <param name="dataBase">The database instance to be used for product operations.</param>
        public ProductsService(SqliteDataBase dataBase)
        {
            _dataBase = dataBase ?? throw new ArgumentNullException(nameof(dataBase));
            Task.Run(async () =>
            {
                await _dataBase.CreateTableAsync();
                await _dataBase.CreateIndexAsync();
            }).Wait();
        }

        /// <summary>
        /// Performs application-defined tasks associated with freeing, releasing, or resetting unmanaged resources.
        /// </summary>
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }

        /// <summary>
        /// Adds a new product.
        /// </summary>
        /// <param name="product">The product to add.</param>
        /// <returns>A task that represents the asynchronous add operation. The task result contains true if successful; otherwise, false.</returns>
        public async Task<bool> Add(Product product)
        {
            try
            {
                await _dataBase.InsertProductAsync(product);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        /// <summary>
        /// Updates an existing product.
        /// </summary>
        /// <param name="product">The product with updated data.</param>
        /// <returns>A task that represents the asynchronous update operation. The task result contains the updated product if successful; otherwise, null.</returns>
        public async Task<Product?> Edit(Product product)
        {
            try
            {
                await _dataBase.UpdateProductAsync(product);
                return product;
            }
            catch (Exception)
            {
                return null;
            }
        }

        /// <summary>
        /// Removes a product by its unique identifier.
        /// </summary>
        /// <param name="productId">The unique identifier of the product to remove.</param>
        /// <returns>A task that represents the asynchronous remove operation. The task result contains the removed product if successful; otherwise, null.</returns>
        public async Task<Product?> Remove(Guid productId)
        {
            try
            {
                // Get the product from the database before deleting.
                Product? product = await _dataBase.SelectProductByIdAsync(productId);
                if (product != null)
                {
                    await _dataBase.DeleteProductAsync(productId);
                }
                return product;
            }
            catch (Exception)
            {
                return null;
            }
        }

        /// <summary>
        /// Searches for a product by its unique identifier.
        /// </summary>
        /// <param name="productId">The unique identifier of the product.</param>
        /// <returns>A task that represents the asynchronous search operation. The task result contains the product if found; otherwise, null.</returns>
        public async Task<Product?> Search(Guid productId)
        {
            try
            {
                return await _dataBase.SelectProductByIdAsync(productId);
            }
            catch (Exception)
            {
                return null;
            }
        }

        /// <summary>
        /// Retrieves all products.
        /// </summary>
        /// <returns>A task that represents the asynchronous get operation. The task result contains an enumerable of <see cref="Product"/> objects.</returns>
        public async Task<IEnumerable<Product>> GetAll()
        {
            try
            {
                return await _dataBase.SelectProductsAsync();
            }
            catch (Exception)
            {
                return [];
            }
        }
    }
}
