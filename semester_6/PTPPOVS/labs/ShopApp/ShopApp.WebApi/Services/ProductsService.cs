using Newtonsoft.Json;
using ShopApp.Core.Models;
using ShopApp.Core.Services;
using System.Collections.Concurrent;

namespace ShopApp.WebApi.Services
{
    /// <summary>
    /// Implementation of the product service for managing products.
    /// Provides methods to add, edit, remove, and search products.
    /// The products are stored in a JSON file whose path is specified in the configuration.
    /// </summary>
    public class ProductsService : IProductsService<Product>, IDisposable
    {
        private const string CONFIGURATION_DATA_BASE_FILE_PATH = "DataBaseFilePath";

        private readonly ConcurrentDictionary<Guid, Product> _products;
        private readonly IConfiguration _configuration;

        private readonly SemaphoreSlim _fileSemaphore;
        private readonly CancellationTokenSource _cancellationTokenSource;

        private readonly string _dataBasePath;

        /// <summary>
        /// Base constructor. Initializes the products collection by loading data from the file.
        /// Throws an exception if the file path is not specified in the configuration.
        /// </summary>
        /// <param name="configuration">Application configuration containing the database file path.</param>
        /// <exception cref="Exception">Thrown if the required configuration key is missing.</exception>
        public ProductsService(IConfiguration configuration)
        {
            _cancellationTokenSource = new CancellationTokenSource();
            _fileSemaphore = new SemaphoreSlim(1, 1);

            _configuration = configuration;
            _dataBasePath = _configuration[CONFIGURATION_DATA_BASE_FILE_PATH];
            if (string.IsNullOrEmpty(_dataBasePath))
            {
                throw new Exception($"ERROR: Can't find {CONFIGURATION_DATA_BASE_FILE_PATH} in configuration file");
            }

            _products = new ConcurrentDictionary<Guid, Product>();
            Task.Run(() => InitFromFileAsync(_cancellationTokenSource.Token)).Wait();
        }

        /// <summary>
        /// Finalizer for the service. Cancels any pending operations.
        /// </summary>
        public void Dispose()
        {
            _cancellationTokenSource?.Cancel();
            GC.SuppressFinalize(this);
        }

        /// <summary>
        /// Adds a product to the collection.
        /// </summary>
        /// <param name="product">The product to add.</param>
        /// <returns>True if the product was successfully added, otherwise false.</returns>
        public Task<bool> Add(Product product)
        {
            if (_products.ContainsKey(product.Id))
            {
                return Task.FromResult(false);
            }
            if (!_products.TryAdd(product.Id, product))
            {
                return Task.FromResult(false);
            }
            _ = WriteToFileAsync(_cancellationTokenSource.Token);
            return Task.FromResult(true);
        }

        /// <summary>
        /// Edits (updates) an existing product in the collection.
        /// </summary>
        /// <param name="product">The product with updated data.</param>
        /// <returns>The updated product if successful, otherwise null.</returns>
        public Task<Product?> Edit(Product product)
        {
            if (!_products.TryGetValue(product.Id, out Product? oldProduct))
            {
                return Task.FromResult<Product?>(null);
            }
            if (_products.TryUpdate(product.Id, product, oldProduct))
            {
                _ = WriteToFileAsync(_cancellationTokenSource.Token);
                return Task.FromResult<Product?>(product);
            }
            return Task.FromResult<Product?>(null);
        }

        /// <summary>
        /// Removes a product from the collection by its identifier.
        /// </summary>
        /// <param name="productId">The identifier of the product to remove.</param>
        /// <returns>The removed product if successful, otherwise null.</returns>
        public Task<Product?> Remove(Guid productId)
        {
            if (!_products.TryRemove(productId, out Product? removedProduct))
            {
                return Task.FromResult<Product?>(null);
            }
            _ = WriteToFileAsync(_cancellationTokenSource.Token);
            return Task.FromResult<Product?>(removedProduct);
        }

        /// <summary>
        /// Searches for a product in the collection by its identifier.
        /// </summary>
        /// <param name="productId">The identifier of the product to search for.</param>
        /// <returns>The found product if it exists, otherwise null.</returns>
        public Task<Product?> Search(Guid productId)
        {
            return Task.FromResult(_products.TryGetValue(productId, out Product? foundProduct) ? 
                foundProduct : 
                null);
        }

        /// <summary>
        /// Asynchronously initializes the products collection by loading data from the JSON file.
        /// If the file does not exist, a new file with an empty JSON array is created.
        /// </summary>
        /// <param name="cancellationToken">A cancellation token for the operation.</param>
        /// <returns>A task representing the asynchronous operation.</returns>
        private async Task InitFromFileAsync(CancellationToken cancellationToken)
        {
            if (!File.Exists(_dataBasePath))
            {
                await File.WriteAllTextAsync(_dataBasePath, "[]", cancellationToken);
                return;
            }

            string json = await File.ReadAllTextAsync(_dataBasePath, cancellationToken);
            if (string.IsNullOrEmpty(json))
            {
                return;
            }

            List<Product>? productsFromFile = JsonConvert.DeserializeObject<List<Product>>(json);
            if (productsFromFile == null)
            {
                return;
            }

            _products.Clear();
            foreach (Product product in productsFromFile)
            {
                _products[product.Id] = product;
            }
        }

        /// <summary>
        /// Asynchronously writes the current products collection to the JSON file.
        /// This operation is performed in a thread-safe manner using SemaphoreSlim.
        /// </summary>
        /// <param name="cancellationToken">A cancellation token for the operation.</param>
        /// <returns>A task representing the asynchronous operation.</returns>
        private async Task WriteToFileAsync(CancellationToken cancellationToken)
        {
            await _fileSemaphore.WaitAsync(cancellationToken);
            try
            {
                // Serialize the collection of products.
                string json = JsonConvert.SerializeObject(_products.Values.ToList(), Formatting.Indented);
                await File.WriteAllTextAsync(_dataBasePath, json, cancellationToken);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"ERROR: can't write data to file. {ex.Message}");
            }
            finally
            {
                _fileSemaphore.Release();
            }
        }
    }
}
