using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging.Abstractions;
using ShopApp.Core.Data;
using ShopApp.Core.Models;
using ShopApp.WebApi.Controllers;
using ShopApp.WebApi.Data;
using ShopApp.WebApi.Services;

namespace ShopApp.Tests
{
    [TestFixture]
    public class TestsProductsServiceController
    {
        private string _tempDbPath;
        private IConfiguration _configuration;
        private ProductsService _service;
        private ProductsController _controller;

        [SetUp]
        public void SetUp()
        {
            // Generate a unique temporary database file path.
            _tempDbPath = Path.Combine(Path.GetTempPath(), $"{Guid.NewGuid()}.db");

            // Build configuration with the connection string.
            Dictionary<string, string?> configDictionary = new()
            {
                { "ConnectionStrings:DefaultConnection", $"Data Source={_tempDbPath}" }
            };
            _configuration = new ConfigurationBuilder()
                .AddInMemoryCollection(configDictionary)
                .Build();

            // Instantiate the real ProductsService.
            string connectionString = _configuration.GetConnectionString("DefaultConnection")!;
            IDataBase dataBase = new SqliteDataBase(connectionString);
            _service = new ProductsService(dataBase);

            // Create the controller with a NullLogger.
            _controller = new ProductsController(NullLogger<ProductsController>.Instance, _service);
        }

        [TearDown]
        public void TearDown()
        {
            _service.Dispose();

            // Clean up the temporary database file.
            if (File.Exists(_tempDbPath))
            {
                const int maxRetries = 10;
                const int delayMs = 100;
                for (int retry = 0; retry < maxRetries; retry++)
                {
                    try
                    {
                        File.Delete(_tempDbPath);
                        break;
                    }
                    catch (IOException)
                    {
                        Thread.Sleep(delayMs);
                    }
                }
            }
        }

        [TestCase("Product A", 10.0)]
        [TestCase("Product B", 20.0)]
        public async Task CreateProduct_ReturnsNonEmptyGuid(string description, double price)
        {
            // Act
            Guid productId = await _controller.CreateProduct(description, price);

            // Assert
            Assert.That(productId, Is.Not.EqualTo(Guid.Empty), "CreateProduct should return a non-empty Guid.");

            // Verify that the product exists.
            Product? product = await _controller.SearchProduct(productId);
            Assert.That(product, Is.Not.Null, "Product should be found after creation.");
            Assert.That(product!.Description, Is.EqualTo(description), "Product description should match.");
            Assert.That(product.Price, Is.EqualTo(price), "Product price should match.");
        }

        [TestCase("Original Product A", 10.0, "Updated Product A", 15.0)]
        public async Task EditProduct_ReturnsUpdatedProduct(string initialDesc, double initialPrice, string updatedDesc, double updatedPrice)
        {
            // Arrange
            Guid productId = await _controller.CreateProduct(initialDesc, initialPrice);
            Assert.That(productId, Is.Not.EqualTo(Guid.Empty), "Product creation should return a valid Guid.");

            // Act
            Product? editedProduct = await _controller.EditProduct(productId, updatedDesc, updatedPrice);

            // Assert
            Assert.That(editedProduct, Is.Not.Null, "EditProduct should return the updated product.");
            Assert.That(editedProduct!.Description, Is.EqualTo(updatedDesc), "Product description should be updated.");
            Assert.That(editedProduct.Price, Is.EqualTo(updatedPrice), "Product price should be updated.");
        }

        [TestCase("Product A", 10.0)]
        public async Task RemoveProduct_ReturnsRemovedProduct(string description, double price)
        {
            // Arrange
            Guid productId = await _controller.CreateProduct(description, price);
            Assert.That(productId, Is.Not.EqualTo(Guid.Empty), "Product creation should return a valid Guid.");

            // Act
            Product? removedProduct = await _controller.RemoveProduct(productId);

            // Assert
            Assert.That(removedProduct, Is.Not.Null, "RemoveProduct should return the removed product.");
            Assert.That(removedProduct!.Id, Is.EqualTo(productId), "Removed product should have the correct ID.");

            // Verify the product no longer exists.
            Product? searchResult = await _controller.SearchProduct(productId);
            Assert.That(searchResult, Is.Null, "Product should not be found after removal.");
        }

        [TestCase("Product A", 10.0)]
        public async Task SearchProduct_ReturnsProduct(string description, double price)
        {
            // Arrange
            Guid productId = await _controller.CreateProduct(description, price);
            Assert.That(productId, Is.Not.EqualTo(Guid.Empty), "Product creation should return a valid Guid.");

            // Act
            Product? foundProduct = await _controller.SearchProduct(productId);

            // Assert
            Assert.That(foundProduct, Is.Not.Null, "SearchProduct should return the product if it exists.");
            Assert.That(foundProduct!.Description, Is.EqualTo(description), "Product description should match.");
            Assert.That(foundProduct.Price, Is.EqualTo(price), "Product price should match.");
        }
    }
}
