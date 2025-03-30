using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Logging.Abstractions;
using ShopApp.WebApi.Controllers;
using ShopApp.WebApi.Services;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.IO;
using System.Threading;
using System.Threading.Tasks;

namespace ShopApp.Tests
{
    [TestFixture]
    public class TestsProductsServiceController
    {
        private string _tempFilePath;
        private IConfiguration _configuration;
        private ProductsService _productService;
        private ProductsController _controller;
        private ILogger<ProductsController> _logger;

        [SetUp]
        public void SetUp()
        {
            // Generate a unique temporary file path using a GUID.
            _tempFilePath = Path.Combine(Path.GetTempPath(), $"{Guid.NewGuid()}.json");

            // Build an in-memory configuration with the database file path.
            Dictionary<string, string?> configDictionary = new()
            {
                { "DataBaseFilePath", _tempFilePath }
            };
            _configuration = new ConfigurationBuilder()
                .AddInMemoryCollection(configDictionary)
                .Build();

            // Instantiate the real ProductsService using the configuration.
            _productService = new ProductsService(_configuration);

            // Use a NullLogger for the controller.
            _logger = NullLogger<ProductsController>.Instance;

            // Inject the real dependency into the controller.
            _controller = new ProductsController(_logger, _productService);
        }

        [TearDown]
        public void TearDown()
        {
            _productService.Dispose();
            // Delete the temporary file with retry logic in case of IO exceptions.
            const int maxRetries = 10;
            const int delayMs = 100;
            for (int retry = 0; retry < maxRetries; retry++)
            {
                try
                {
                    if (File.Exists(_tempFilePath))
                    {
                        File.Delete(_tempFilePath);
                    }
                    break;
                }
                catch (IOException)
                {
                    Thread.Sleep(delayMs);
                }
            }
        }

        [TestCase("Product A", 10.0)]
        [TestCase("Product B", 20.0)]
        [TestCase("Product C", 30.0)]
        public async Task CreateProduct_IntegrationTest_ReturnsNonEmptyGuid(string description, double price)
        {
            // Act
            Guid productId = await _controller.CreateProduct(description, price);

            // Assert
            Assert.That(productId, Is.Not.EqualTo(Guid.Empty), "CreateProduct should return a non-empty Guid.");

            // Verify that the product can be found after creation.
            var product = await _controller.SearchProduct(productId);
            Assert.That(product, Is.Not.Null, "Product should be found after creation.");
            Assert.That(product!.Description, Is.EqualTo(description), "Product description should match.");
            Assert.That(product.Price, Is.EqualTo(price), "Product price should match.");
        }

        [TestCase("Original Product A", 10.0, "Updated Product A", 15.0)]
        [TestCase("Original Product B", 20.0, "Updated Product B", 25.0)]
        [TestCase("Original Product C", 30.0, "Updated Product C", 35.0)]
        public async Task EditProduct_IntegrationTest_ReturnsUpdatedProduct(
            string initialDescription, double initialPrice,
            string updatedDescription, double updatedPrice)
        {
            // Arrange
            Guid productId = await _controller.CreateProduct(initialDescription, initialPrice);
            Assert.That(productId, Is.Not.EqualTo(Guid.Empty));

            // Act
            var editedProduct = await _controller.EditProduct(productId, updatedDescription, updatedPrice);

            // Assert
            Assert.That(editedProduct, Is.Not.Null, "EditProduct should return the updated product.");
            Assert.That(editedProduct!.Description, Is.EqualTo(updatedDescription), "Product description should be updated.");
            Assert.That(editedProduct.Price, Is.EqualTo(updatedPrice), "Product price should be updated.");
        }

        [TestCase("Product A", 10.0)]
        [TestCase("Product B", 20.0)]
        [TestCase("Product C", 30.0)]
        public async Task RemoveProduct_IntegrationTest_ReturnsRemovedProduct(string description, double price)
        {
            // Arrange
            Guid productId = await _controller.CreateProduct(description, price);
            Assert.That(productId, Is.Not.EqualTo(Guid.Empty));

            // Act
            var removedProduct = await _controller.RemoveProduct(productId);

            // Assert
            Assert.That(removedProduct, Is.Not.Null, "RemoveProduct should return the removed product.");
            Assert.That(removedProduct!.Id, Is.EqualTo(productId), "Removed product should have the same Id.");

            // Verify that searching for the product now returns null.
            var productAfterRemoval = await _controller.SearchProduct(productId);
            Assert.That(productAfterRemoval, Is.Null, "Product should not be found after removal.");
        }

        [TestCase("Product A", 10.0)]
        [TestCase("Product B", 20.0)]
        [TestCase("Product C", 30.0)]
        public async Task SearchProduct_IntegrationTest_ReturnsProduct(string description, double price)
        {
            // Arrange
            Guid productId = await _controller.CreateProduct(description, price);
            Assert.That(productId, Is.Not.EqualTo(Guid.Empty));

            // Act
            var product = await _controller.SearchProduct(productId);

            // Assert
            Assert.That(product, Is.Not.Null, "SearchProduct should return the product if it exists.");
            Assert.That(product!.Description, Is.EqualTo(description), "Product description should match.");
            Assert.That(product.Price, Is.EqualTo(price), "Product price should match.");
        }
    }
}
