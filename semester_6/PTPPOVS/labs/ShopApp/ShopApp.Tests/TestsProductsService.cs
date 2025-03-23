using Microsoft.Extensions.Configuration;
using Moq;
using ShopApp.Core.Models;
using ShopApp.WebApi.Services;

namespace ShopApp.Tests
{
    [TestFixture]
    internal class TestsProductsService
    {
        [TestFixture]
        public class ProductsServiceMoqTests
        {
            private string _tempFilePath;
            private Mock<IConfiguration> _mockConfiguration;
            private ProductsService _service;

            [SetUp]
            public void SetUp()
            {
                // Generate a unique temporary file path using a GUID.
                _tempFilePath = Path.Combine(Path.GetTempPath(), $"{Guid.NewGuid()}.json");

                // Configure the mock for IConfiguration.
                _mockConfiguration = new Mock<IConfiguration>();
                _mockConfiguration.Setup(config => config["DataBaseFilePath"]).Returns(_tempFilePath);

                // Initialize the service with the mocked configuration.
                _service = new ProductsService(_mockConfiguration.Object);
            }

            [TearDown]
            public void TearDown()
            {
                _service.Dispose();
                // TEMP
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

            [Test]
            public void Constructor_MissingConfiguration_ThrowsException()
            {
                // Simulate a missing configuration for the database file path.
                Mock<IConfiguration> emptyConfig = new();
                emptyConfig.Setup(config => config["DataBaseFilePath"]).Returns(null as string);

                Assert.Throws<Exception>(() => new ProductsService(emptyConfig.Object),
                    "Constructor should throw an exception when the database file path is missing.");
            }

            [TestCase("Product A", 10.0)]
            [TestCase("Product B", 20.0)]
            [TestCase("Product C", 30.0)]
            public async Task Add_NewProduct_WithVariousData_ReturnsTrue(string description, double price)
            {
                // Arrange
                Product product = new()
                {
                    Id = Guid.NewGuid(),
                    Description = description,
                    Price = price
                };

                // Act
                bool result = await _service.Add(product);

                // Assert
                Assert.That(result, Is.True, $"Adding a new product with description '{description}' and price {price} should return true.");
            }

            [TestCase("Product A", 10.0)]
            [TestCase("Product B", 20.0)]
            [TestCase("Product C", 30.0)]
            public async Task Add_DuplicateProduct_ReturnsFalse(string description, double price)
            {
                // Arrange
                Product product = new()
                {
                    Id = Guid.NewGuid(),
                    Description = description,
                    Price = price
                };

                // Act
                await _service.Add(product);
                bool secondAdd = await _service.Add(product);

                // Assert
                Assert.That(secondAdd, Is.False, "Adding a duplicate product should return false.");
            }

            [TestCase("Original Product A", 10.0, "Updated Product A", 15.0)]
            [TestCase("Original Product B", 20.0, "Updated Product B", 25.0)]
            [TestCase("Original Product C", 30.0, "Updated Product C", 35.0)]
            public async Task Edit_ExistingProduct_WithVariousData_ReturnsUpdatedProduct(
                string originalDescription, double originalPrice,
                string updatedDescription, double updatedPrice)
            {
                // Arrange
                Product product = new()
                {
                    Id = Guid.NewGuid(),
                    Description = originalDescription,
                    Price = originalPrice
                };
                await _service.Add(product);

                // Update product values.
                // Предполагается, что Product реализует ICloneable.
                Product newProduct = (Product)product.Clone();
                newProduct.Description = updatedDescription;
                newProduct.Price = updatedPrice;

                // Act
                Product? updatedProduct = await _service.Edit(newProduct);

                // Assert
                Assert.That(updatedProduct, Is.Not.Null, "Editing an existing product should return the updated product.");
                Assert.That(updatedProduct.Description, Is.EqualTo(updatedDescription), "The product description should be updated.");
                Assert.That(updatedProduct.Price, Is.EqualTo(updatedPrice), "The product price should be updated.");
            }

            [TestCase("Product A", 10.0)]
            [TestCase("Product B", 20.0)]
            [TestCase("Product C", 30.0)]
            public async Task Edit_NonExistingProduct_ReturnsNull(string description, double price)
            {
                // Arrange
                Product product = new()
                {
                    Id = Guid.NewGuid(),
                    Description = description,
                    Price = price
                };

                // Act
                Product? result = await _service.Edit(product);

                // Assert
                Assert.That(result, Is.Null, "Editing a non-existing product should return null.");
            }

            [TestCase("Product A", 10.0)]
            [TestCase("Product B", 20.0)]
            [TestCase("Product C", 30.0)]
            public async Task Remove_ExistingProduct_ReturnsRemovedProduct(string description, double price)
            {
                // Arrange
                Product product = new()
                {
                    Id = Guid.NewGuid(),
                    Description = description,
                    Price = price
                };
                await _service.Add(product);

                // Act
                Product? removedProduct = await _service.Remove(product.Id);

                // Assert
                Assert.That(removedProduct, Is.Not.Null, "Removing an existing product should return the removed product.");
                Assert.That(removedProduct.Id, Is.EqualTo(product.Id), "The removed product should have the same ID.");
            }

            [Test]
            public async Task Remove_NonExistingProduct_ReturnsNull()
            {
                // Act
                Product? removedProduct = await _service.Remove(Guid.NewGuid());

                // Assert
                Assert.That(removedProduct, Is.Null, "Removing a non-existing product should return null.");
            }

            [TestCase("Product A", 10.0)]
            [TestCase("Product B", 20.0)]
            [TestCase("Product C", 30.0)]
            public async Task Search_ExistingProduct_ReturnsProduct(string description, double price)
            {
                // Arrange
                Product product = new()
                {
                    Id = Guid.NewGuid(),
                    Description = description,
                    Price = price
                };
                await _service.Add(product);

                // Act
                Product? foundProduct = await _service.Search(product.Id);

                // Assert
                Assert.That(foundProduct, Is.Not.Null, "Searching for an existing product should return the product.");
                Assert.That(foundProduct.Id, Is.EqualTo(product.Id), "The found product should have the same ID.");
            }

            [Test]
            public async Task Search_NonExistingProduct_ReturnsNull()
            {
                // Act
                Product? foundProduct = await _service.Search(Guid.NewGuid());

                // Assert
                Assert.That(foundProduct, Is.Null, "Searching for a non-existing product should return null.");
            }
        }
    }
}
