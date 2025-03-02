using Newtonsoft.Json;
using ShopApp.Models;

namespace ShopApp.Services
{
    /// <summary>
    /// Implementation of the product service for managing products.
    /// Provides methods to add, edit, remove, and search products.
    /// The products are stored in a JSON file whose path is specified in the configuration.
    /// </summary>
    public class ProductsService : IProductsService<Product>
    {
        private const string CONFIGURATION_DATA_BASE_FILE_PATH = "DataBaseFilePath";

        private readonly Dictionary<Guid, Product> _products;
        private readonly IConfiguration _configuration;

        private readonly SemaphoreSlim _semaphore;
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
            _semaphore = new SemaphoreSlim(1, 1);

            _configuration = configuration;
            _dataBasePath = _configuration[CONFIGURATION_DATA_BASE_FILE_PATH];
            if (string.IsNullOrEmpty(_dataBasePath))
            {
                throw new Exception($"ERROR: Can't find {CONFIGURATION_DATA_BASE_FILE_PATH} in configuration file");
            }

            _products = [];
            Task.Run(() => InitFromFileAsync(_cancellationTokenSource.Token)).Wait();
        }

        /// <summary>
        /// Finalizer for the service. Cancels any pending operations.
        /// </summary>
        ~ProductsService()
        {
            _cancellationTokenSource?.Cancel();
        }

        /// <summary>
        /// Adds a product to the collection.
        /// </summary>
        /// <param name="product">The product to add.</param>
        /// <returns>True if the product was successfully added, otherwise false.</returns>
        public bool Add(Product product)
        {
            if (_products.ContainsKey(product.Id))
            {
                return false;
            }
            _products.Add(product.Id, product);

            // Fire-and-forget async write to file
            _ = WriteToFileAsync(_cancellationTokenSource.Token);
            return true;
        }

        /// <summary>
        /// Edits (updates) an existing product in the collection.
        /// </summary>
        /// <param name="product">The product with updated data.</param>
        /// <returns>The updated product if successful, otherwise null.</returns>
        public Product? Edit(Product product)
        {
            if (!_products.ContainsKey(product.Id))
            {
                return null;
            }
            _products[product.Id] = (Product)product.Clone();
            _ = WriteToFileAsync(_cancellationTokenSource.Token);
            return _products[product.Id];
        }

        /// <summary>
        /// Removes a product from the collection by its identifier.
        /// </summary>
        /// <param name="productId">The identifier of the product to remove.</param>
        /// <returns>The removed product if successful, otherwise null.</returns>
        public Product? Remove(Guid productId)
        {
            if (!_products.TryGetValue(productId, out Product? removedProduct))
            {
                return null;
            }
            _ = _products.Remove(productId);
            _ = WriteToFileAsync(_cancellationTokenSource.Token);
            return removedProduct;
        }

        /// <summary>
        /// Searches for a product in the collection by its identifier.
        /// </summary>
        /// <param name="productId">The identifier of the product to search for.</param>
        /// <returns>The found product if it exists, otherwise null.</returns>
        public Product? Search(Guid productId)
        {
            return _products.TryGetValue(productId, out Product? foundProduct) ? foundProduct : null;
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
            await _semaphore.WaitAsync(cancellationToken);
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
                _ = _semaphore.Release();
            }
        }
    }
}
