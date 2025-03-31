using Moq;
using ShopApp.Core.Data;
using ShopApp.Core.Models;
using ShopApp.WebApi.Services;

namespace ShopApp.Tests
{
    [TestFixture]
    public class TestsProductsService
    {
        private Mock<IDataBase> _mockDataBase;
        private ProductsService _service;

        [SetUp]
        public void SetUp()
        {
            _mockDataBase = new Mock<IDataBase>();

            // For initialization, simulate successful table/index creation.
            _ = _mockDataBase.Setup(db => db.CreateTableAsync())
                .Returns(Task.CompletedTask);
            _ = _mockDataBase.Setup(db => db.CreateIndexAsync())
                .Returns(Task.CompletedTask);

            _service = new ProductsService(_mockDataBase.Object);
        }

        [TearDown]
        public void TearDown()
        {
            _service?.Dispose();
        }

        [TestCase("Test Product", 19.99, null)]
        public async Task Add_WhenInsertSucceeds_ReturnsTrue(string description, double price, string? image)
        {
            // Arrange
            Product product = new()
            {
                Id = Guid.NewGuid(),
                Description = description,
                Price = price,
                Image = image
            };
            _ = _mockDataBase.Setup(db => db.InsertProductAsync(product))
                .Returns(Task.CompletedTask);

            // Act
            bool result = await _service.Add(product);

            // Assert
            Assert.That(result, Is.True, "Service.Add should return true when InsertProductAsync succeeds.");
            _mockDataBase.Verify(db => db.InsertProductAsync(It.Is<Product>(p => p.Id == product.Id)), Times.Once);
        }

        [TestCase("Test Product", 19.99, null)]
        public async Task Add_WhenInsertFails_ReturnsFalse(string description, double price, string? image)
        {
            // Arrange
            Product product = new()
            {
                Id = Guid.NewGuid(),
                Description = description,
                Price = price,
                Image = image
            };
            _ = _mockDataBase.Setup(db => db.InsertProductAsync(product))
                .ThrowsAsync(new Exception("Insert error"));

            // Act
            bool result = await _service.Add(product);

            // Assert
            Assert.That(result, Is.False, "Service.Add should return false when InsertProductAsync fails.");
        }

        [TestCase("Test Product", 19.99, null)]
        public async Task Edit_WhenUpdateSucceeds_ReturnsProduct(string description, double price, string? image)
        {
            // Arrange
            Product product = new()
            {
                Id = Guid.NewGuid(),
                Description = description,
                Price = price,
                Image = image
            };
            _ = _mockDataBase.Setup(db => db.UpdateProductAsync(product))
                .Returns(Task.CompletedTask);
            _ = _mockDataBase.Setup(db => db.SelectProductByIdAsync(product.Id))
                .ReturnsAsync(product);

            // Act
            Product? result = await _service.Edit(product);

            // Assert
            Assert.That(result, Is.Not.Null, "Service.Edit should return the product when update succeeds.");
            Assert.That(result!.Id, Is.EqualTo(product.Id));
            _mockDataBase.Verify(db => db.UpdateProductAsync(It.Is<Product>(p => p.Id == product.Id)), Times.Once);
        }

        [TestCase("Test Product", 19.99, null)]
        public async Task Edit_WhenUpdateFails_ReturnsNull(string description, double price, string? image)
        {
            // Arrange
            Product product = new()
            {
                Id = Guid.NewGuid(),
                Description = description,
                Price = price,
                Image = image
            };
            _ = _mockDataBase.Setup(db => db.UpdateProductAsync(product))
                .ThrowsAsync(new Exception("Update error"));

            // Act
            Product? result = await _service.Edit(product);

            // Assert
            Assert.That(result, Is.Null, "Service.Edit should return null when update fails.");
        }

        [TestCase("Test Product", 19.99, null)]
        public async Task Remove_WhenProductExists_ReturnsProduct(string description, double price, string? image)
        {
            // Arrange
            Product product = new()
            {
                Id = Guid.NewGuid(),
                Description = description,
                Price = price,
                Image = image
            };
            _ = _mockDataBase.Setup(db => db.SelectProductByIdAsync(product.Id))
                .ReturnsAsync(product);
            _ = _mockDataBase.Setup(db => db.DeleteProductAsync(product.Id))
                .Returns(Task.CompletedTask);

            // Act
            Product? result = await _service.Remove(product.Id);

            // Assert
            Assert.That(result, Is.Not.Null, "Service.Remove should return the product when it exists.");
            Assert.That(result!.Id, Is.EqualTo(product.Id));
            _mockDataBase.Verify(db => db.DeleteProductAsync(product.Id), Times.Once);
        }

        [Test]
        public async Task Remove_WhenProductDoesNotExist_ReturnsNull()
        {
            // Arrange
            Guid productId = Guid.NewGuid();
            _ = _mockDataBase.Setup(db => db.SelectProductByIdAsync(productId))
                .ReturnsAsync((Product?)null);

            // Act
            Product? result = await _service.Remove(productId);

            // Assert
            Assert.That(result, Is.Null, "Service.Remove should return null if the product is not found.");
        }

        [TestCase("Test Product", 19.99, null)]
        public async Task Search_WhenProductExists_ReturnsProduct(string description, double price, string? image)
        {
            // Arrange
            Product product = new()
            {
                Id = Guid.NewGuid(),
                Description = description,
                Price = price,
                Image = image
            };
            _ = _mockDataBase.Setup(db => db.SelectProductByIdAsync(product.Id))
                .ReturnsAsync(product);

            // Act
            Product? result = await _service.Search(product.Id);

            // Assert
            Assert.That(result, Is.Not.Null, "Service.Search should return the product if it exists.");
            Assert.That(result!.Id, Is.EqualTo(product.Id));
        }

        [Test]
        public async Task Search_WhenProductDoesNotExist_ReturnsNull()
        {
            // Arrange
            Guid productId = Guid.NewGuid();
            _ = _mockDataBase.Setup(db => db.SelectProductByIdAsync(productId))
                .ReturnsAsync((Product?)null);

            // Act
            Product? result = await _service.Search(productId);

            // Assert
            Assert.That(result, Is.Null, "Service.Search should return null if the product is not found.");
        }

        [TestCase(
            "Original Description", 10.0, null,
            "Updated Description", 15.5, null)]
        public async Task GetAll_ReturnsAllProducts(
            string firstDescription, double firstPrice, string? firstImage,
            string secondDescription, double secondPrice, string? secondImage)
        {
            // Arrange
            List<Product> products =
            [
                new Product
                {
                    Id = Guid.NewGuid(),
                    Description = firstDescription,
                    Price = firstPrice,
                    Image = firstImage
                },
                new Product
                {
                    Id = Guid.NewGuid(),
                    Description = secondDescription,
                    Price = secondPrice,
                    Image = secondImage
                }
            ];
            _ = _mockDataBase.Setup(db => db.SelectProductsAsync())
                .ReturnsAsync(products);

            // Act
            IEnumerable<Product> result = await _service.GetAll();

            // Assert
            Assert.That(result, Is.Not.Null, "Service.GetAll should not return null.");
            Assert.That(result.Count(), Is.EqualTo(2), "Service.GetAll should return all products.");
        }
    }
}
