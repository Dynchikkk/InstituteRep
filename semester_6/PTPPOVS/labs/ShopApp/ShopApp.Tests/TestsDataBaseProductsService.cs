using Microsoft.EntityFrameworkCore;
using ShopApp.Core.Models;
using ShopApp.WebApi.Data;
using ShopApp.WebApi.Services;

namespace ShopApp.Tests
{
    /// <summary>
    /// NUnit tests for the DataBaseProductService class.
    /// </summary>
    [TestFixture]
    public class DataBaseProductServiceTests
    {
        /// <summary>
        /// Creates a new set of DbContextOptions with an InMemory database for isolated tests.
        /// </summary>
        /// <returns>A new instance of DbContextOptions for ApplicationContext.</returns>
        private DbContextOptions<ApplicationContext> CreateNewContextOptions()
        {
            return new DbContextOptionsBuilder<ApplicationContext>()
                .UseInMemoryDatabase(databaseName: Guid.NewGuid().ToString())
                .Options;
        }

        /// <summary>
        /// Tests that adding a product returns true and the product is correctly saved in the database.
        /// The test data is provided via TestCase attributes.
        /// </summary>
        /// <param name="description">Product description.</param>
        /// <param name="price">Product price.</param>
        /// <param name="image">Product image path.</param>
        [TestCase("Test Product A", 9.99, "imageA.jpg")]
        [TestCase("Test Product B", 19.99, "imageB.jpg")]
        public async Task Add_Product_ShouldReturnTrue(string description, double price, string image)
        {
            // Arrange
            DbContextOptions<ApplicationContext> options = CreateNewContextOptions();
            using ApplicationContext context = new(options);
            DataBaseProductService service = new(context);
            Product product = new()
            {
                Id = Guid.NewGuid(),
                Description = description,
                Price = price,
                Image = image,
            };

            // Act
            bool result = await service.Add(product);

            // Assert
            Assert.That(result, Is.True, "Product should be added successfully.");

            // Verify that the product is saved in the database.
            Product? savedProduct = await context.Products.FirstOrDefaultAsync(p => p.Id == product.Id);
            Assert.That(savedProduct, Is.Not.Null, "Saved product should not be null.");
            Assert.That(savedProduct?.Description, Is.EqualTo(description), "The product description does not match.");
            Assert.That(savedProduct?.Price, Is.EqualTo(price), "The product price does not match.");
            Assert.That(savedProduct?.Image, Is.EqualTo(image), "The product image path does not match.");
        }

        /// <summary>
        /// Tests that removing a product returns the removed product and deletes it from the database.
        /// The test data is provided via a TestCase attribute.
        /// </summary>
        /// <param name="description">Product description.</param>
        /// <param name="price">Product price.</param>
        /// <param name="image">Product image path.</param>
        [TestCase("Test Product Remove", 10.0, "remove.jpg")]
        public async Task Remove_Product_ShouldReturnProductAndRemoveIt(string description, double price, string image)
        {
            // Arrange
            DbContextOptions<ApplicationContext> options = CreateNewContextOptions();
            Product product = new()
            {
                Id = Guid.NewGuid(),
                Description = description,
                Price = price,
                Image = image,
            };

            // Save the product in the database.
            using (ApplicationContext context = new(options))
            {
                _ = context.Products.Add(product);
                _ = await context.SaveChangesAsync();
            }

            // Act & Assert
            using (ApplicationContext context = new(options))
            {
                DataBaseProductService service = new(context);
                Product? removedProduct = await service.Remove(product.Id);
                Assert.That(removedProduct, Is.Not.Null, "Removed product should not be null.");
                Assert.That(removedProduct.Id, Is.EqualTo(product.Id), "The removed product ID should match the original product ID.");

                // Verify that the product has been removed.
                bool exists = await context.Products.AnyAsync(p => p.Id == product.Id);
                Assert.That(exists, Is.False, "Product should no longer exist in the database.");
            }
        }

        /// <summary>
        /// Tests that editing an existing product returns the updated product.
        /// Test data is provided via a TestCase attribute.
        /// </summary>
        /// <param name="originalDesc">Original product description.</param>
        /// <param name="updatedDesc">Updated product description.</param>
        /// <param name="originalPrice">Original product price.</param>
        /// <param name="updatedPrice">Updated product price.</param>
        /// <param name="originalImg">Original product image path.</param>
        /// <param name="updatedImg">Updated product image path.</param>
        [TestCase("Original Description", "Updated Description", 10.0, 15.50, "original.jpg", "updated.jpg")]
        public async Task Edit_Product_ShouldReturnUpdatedProduct(
            string originalDesc, string updatedDesc,
            double originalPrice, double updatedPrice,
            string originalImg, string updatedImg)
        {
            // Arrange
            DbContextOptions<ApplicationContext> options = CreateNewContextOptions();
            Product product = new()
            {
                Id = Guid.NewGuid(),
                Description = originalDesc,
                Price = originalPrice,
                Image = originalImg,
            };

            // Save the original product.
            using (ApplicationContext context = new(options))
            {
                _ = context.Products.Add(product);
                _ = await context.SaveChangesAsync();
            }

            // Modify the product.
            product.Description = updatedDesc;
            product.Price = updatedPrice;
            product.Image = updatedImg;

            // Act & Assert
            using (ApplicationContext context = new(options))
            {
                DataBaseProductService service = new(context);
                Product? updatedProduct = await service.Edit(product);
                Assert.That(updatedProduct, Is.Not.Null, "Updated product should not be null.");
                Assert.That(updatedProduct.Description, Is.EqualTo(updatedDesc), "Product description was not updated correctly.");
                Assert.That(updatedProduct.Price, Is.EqualTo(updatedPrice), "Product price was not updated correctly.");
                Assert.That(updatedProduct.Image, Is.EqualTo(updatedImg), "Product image path was not updated correctly.");
            }
        }

        /// <summary>
        /// Tests that searching for an existing product returns the correct product.
        /// Test data is provided via a TestCase attribute.
        /// </summary>
        /// <param name="description">Product description.</param>
        /// <param name="price">Product price.</param>
        /// <param name="image">Product image path.</param>
        [TestCase("Search Test Product", 5.00, "search.jpg")]
        public async Task Search_Product_ShouldReturnCorrectProduct(string description, double price, string image)
        {
            // Arrange
            DbContextOptions<ApplicationContext> options = CreateNewContextOptions();
            Product product = new()
            {
                Id = Guid.NewGuid(),
                Description = description,
                Price = price,
                Image = image,
            };

            using (ApplicationContext context = new(options))
            {
                _ = context.Products.Add(product);
                _ = await context.SaveChangesAsync();
            }

            // Act & Assert
            using (ApplicationContext context = new(options))
            {
                DataBaseProductService service = new(context);
                Product? foundProduct = await service.Search(product.Id);
                Assert.That(foundProduct, Is.Not.Null, "Found product should not be null.");
                Assert.That(foundProduct.Id, Is.EqualTo(product.Id), "The found product ID should match the searched product ID.");
                Assert.That(foundProduct.Description, Is.EqualTo(description), "The product description does not match.");
                Assert.That(foundProduct.Price, Is.EqualTo(price), "The product price does not match.");
                Assert.That(foundProduct.Image, Is.EqualTo(image), "The product image path does not match.");
            }
        }
    }
}
