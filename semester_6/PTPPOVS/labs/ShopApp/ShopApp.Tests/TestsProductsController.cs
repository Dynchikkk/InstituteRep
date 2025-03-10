using Microsoft.Extensions.Logging;
using Moq;
using ShopApp.Core.Models;
using ShopApp.Core.Services;
using ShopApp.WebApi.Controllers;

namespace ShopApp.Tests
{
    [TestFixture]
    internal class TestsProductsController
    {
        private Mock<ILogger<ProductsController>> _mockLogger;
        private Mock<IProductsService<Product>> _mockProductService;
        private ProductsController _controller;

        [SetUp]
        public void SetUp()
        {
            // Create mocks for dependencies
            _mockLogger = new Mock<ILogger<ProductsController>>();
            _mockProductService = new Mock<IProductsService<Product>>();

            // Initialize controller with mocked dependencies
            _controller = new ProductsController(_mockLogger.Object, _mockProductService.Object);
        }

        [TestCase("Product A", 10.0)]
        [TestCase("Product B", 20.0)]
        [TestCase("Product C", 30.0)]
        public void CreateProduct_WhenServiceReturnsTrue_ReturnsNonEmptyGuid(string description, double price)
        {
            _ = _mockProductService.Setup(s => s.Add(It.IsAny<Product>())).Returns(true);

            // Act
            Guid result = _controller.CreateProduct(description, price);

            // Assert
            Assert.That(result, Is.Not.EqualTo(Guid.Empty), "CreateProduct should return a non-empty Guid if the product is successfully created.");
            _mockProductService.Verify(s => s.Add(It.Is<Product>(p => p.Description == description && p.Price == price)), Times.Once);
        }

        [TestCase("Product A", 10.0)]
        [TestCase("Product B", 20.0)]
        [TestCase("Product C", 30.0)]
        public void CreateProduct_WhenServiceReturnsFalse_ReturnsEmptyGuid(string description, double price)
        {
            _ = _mockProductService.Setup(s => s.Add(It.IsAny<Product>())).Returns(false);

            // Act
            Guid result = _controller.CreateProduct(description, price);

            // Assert
            Assert.That(result, Is.EqualTo(Guid.Empty), "CreateProduct should return Guid.Empty if product creation fails.");
        }

        [TestCase("Product A", 10.0)]
        [TestCase("Product B", 20.0)]
        [TestCase("Product C", 30.0)]
        public void RemoveProduct_WhenProductExists_ReturnsProduct(string description, double price)
        {
            // Arrange
            Product product = new()
            {
                Id = Guid.NewGuid(),
                Description = description,
                Price = price
            };

            _ = _mockProductService.Setup(s => s.Remove(product.Id)).Returns(product);

            // Act
            Product? result = _controller.RemoveProduct(product.Id);

            // Assert
            Assert.That(result, Is.Not.Null, "RemoveProduct should return the product if removal is successful.");
            Assert.That(result.Id, Is.EqualTo(product.Id), "Removed product should have the same Id.");
        }

        [Test]
        public void RemoveProduct_WhenProductDoesNotExist_ReturnsNull()
        {
            // Arrange
            Guid productId = Guid.NewGuid();
            _ = _mockProductService.Setup(s => s.Remove(productId)).Returns(null as Product);

            // Act
            Product? result = _controller.RemoveProduct(productId);

            // Assert
            Assert.That(result, Is.Null, "RemoveProduct should return null if the product is not found.");
        }

        [TestCase("Product A", 10.0)]
        [TestCase("Product B", 20.0)]
        [TestCase("Product C", 30.0)]
        public void EditProduct_WhenProductExists_ReturnsEditedProduct(string newDescription, double newPrice)
        {
            // Arrange
            Product editedProduct = new()
            {
                Id = Guid.NewGuid(),
                Description = newDescription,
                Price = newPrice
            };

            _ = _mockProductService.Setup(s => s.Edit(It.Is<Product>(p => p.Id == editedProduct.Id && p.Description == newDescription && p.Price == newPrice)))
                .Returns(editedProduct);

            // Act
            Product? result = _controller.EditProduct(editedProduct.Id, newDescription, newPrice);

            // Assert
            Assert.That(result, Is.Not.Null, "EditProduct should return the updated product if editing is successful.");
            Assert.That(result.Description, Is.EqualTo(newDescription), "Product description should be updated.");
            Assert.That(result.Price, Is.EqualTo(newPrice), "Product price should be updated.");
        }

        [TestCase("Product A", 10.0)]
        [TestCase("Product B", 20.0)]
        [TestCase("Product C", 30.0)]
        public void EditProduct_WhenProductDoesNotExist_ReturnsNull(string newDescription, double newPrice)
        {
            // Arrange
            Guid productId = Guid.NewGuid();

            _ = _mockProductService.Setup(s => s.Edit(It.IsAny<Product>())).Returns(null as Product);

            // Act
            Product? result = _controller.EditProduct(productId, newDescription, newPrice);

            // Assert
            Assert.That(result, Is.Null, "EditProduct should return null if the product is not found for editing.");
        }

        [TestCase("Product A", 10.0)]
        [TestCase("Product B", 20.0)]
        [TestCase("Product C", 30.0)]
        public void SearchProduct_WhenProductExists_ReturnsProduct(string newDescription, double newPrice)
        {
            // Arrange
            Product product = new()
            {
                Id = Guid.NewGuid(),
                Description = newDescription,
                Price = newPrice
            };

            _ = _mockProductService.Setup(s => s.Search(product.Id)).Returns(product);

            // Act
            Product? result = _controller.SearchProduct(product.Id);

            // Assert
            Assert.That(result, Is.Not.Null, "SearchProduct should return the product if it exists.");
            Assert.That(result.Id, Is.EqualTo(product.Id), "Found product should have the correct Id.");
        }

        [Test]
        public void SearchProduct_WhenProductDoesNotExist_ReturnsNull()
        {
            // Arrange
            Guid productId = Guid.NewGuid();
            _ = _mockProductService.Setup(s => s.Search(productId)).Returns(null as Product);

            // Act
            Product? result = _controller.SearchProduct(productId);

            // Assert
            Assert.That(result, Is.Null, "SearchProduct should return null if the product is not found.");
        }
    }
}
