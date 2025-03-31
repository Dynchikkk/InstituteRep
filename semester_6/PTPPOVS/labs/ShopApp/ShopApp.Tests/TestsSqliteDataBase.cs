using Microsoft.Data.Sqlite;
using ShopApp.Core.Data;
using ShopApp.Core.Models;
using ShopApp.WebApi.Data;

namespace ShopApp.Tests
{
    [TestFixture]
    public class TestsSqliteDataBase
    {
        private string _dbFilePath;
        private string _connectionString;
        private IDataBase _dataBase;

        [SetUp]
        public async Task SetUp()
        {
            // Create a temporary file for the SQLite database.
            _dbFilePath = Path.Combine(Path.GetTempPath(), $"{Guid.NewGuid()}.db");
            _connectionString = $"Data Source={_dbFilePath}";
            _dataBase = new SqliteDataBase(_connectionString);

            // Create table and index.
            await _dataBase.CreateTableAsync();
            await _dataBase.CreateIndexAsync();
        }

        [TearDown]
        public void TearDown()
        {
            // Clean up the temporary database file.
            if (File.Exists(_dbFilePath))
            {
                const int maxRetries = 10;
                const int delayMs = 100;
                for (int retry = 0; retry < maxRetries; retry++)
                {
                    try
                    {
                        File.Delete(_dbFilePath);
                        break;
                    }
                    catch (IOException)
                    {
                        System.Threading.Thread.Sleep(delayMs);
                    }
                }
            }
        }

        [Test]
        public async Task CreateTableAsync_TableExistsInDatabase()
        {
            // Act: Query sqlite_master to check for table existence.
            bool tableExists;
            using (SqliteConnection connection = new(_connectionString))
            {
                await connection.OpenAsync();
                using SqliteCommand cmd = connection.CreateCommand();
                cmd.CommandText = "SELECT name FROM sqlite_master WHERE type='table' AND name='Products';";
                object? result = await cmd.ExecuteScalarAsync();
                tableExists = result != null && result.ToString() == "Products";
            }
            // Assert
            Assert.That(tableExists, Is.True, "The Products table should exist after CreateTableAsync is called.");
        }

        [Test]
        public async Task CreateIndexAsync_IndexExistsInDatabase()
        {
            // Act: Query sqlite_master to check for index existence.
            bool indexExists;
            using (SqliteConnection connection = new(_connectionString))
            {
                await connection.OpenAsync();
                using SqliteCommand cmd = connection.CreateCommand();
                cmd.CommandText = "SELECT name FROM sqlite_master WHERE type='index' AND name='IDX_PRODUCTS_ID';";
                object? result = await cmd.ExecuteScalarAsync();
                indexExists = result != null && result.ToString() == "IDX_PRODUCTS_ID";
            }
            // Assert
            Assert.That(indexExists, Is.True, "The IDX_PRODUCTS_ID index should exist after CreateIndexAsync is called.");
        }

        [TestCase("Test Product", 19.99, null)]
        public async Task InsertProductAsync_And_SelectProductByIdAsync_ReturnsInsertedProduct(string description, double price, string? image)
        {
            // Arrange
            Product product = new()
            {
                Id = Guid.NewGuid(),
                Description = description,
                Price = price,
                Image = image
            };

            // Act
            await _dataBase.InsertProductAsync(product);
            Product? selected = await _dataBase.SelectProductByIdAsync(product.Id);

            // Assert
            Assert.That(selected, Is.Not.Null, "Inserted product should be found by SelectProductByIdAsync.");
            Assert.That(selected!.Id, Is.EqualTo(product.Id));
            Assert.That(selected.Description, Is.EqualTo(product.Description));
            Assert.That(selected.Price, Is.EqualTo(product.Price));
        }

        [TestCase(
            "Original Description", 10.0, null,
            "Updated Description", 15.5, null)]
        public async Task UpdateProductAsync_UpdatesExistingProduct(
            string originalDescription, double originalPrice, string? originalImage,
            string updatedDescription, double updatedPrice, string? updatedImage)
        {
            // Arrange
            Product product = new()
            {
                Id = Guid.NewGuid(),
                Description = originalDescription,
                Price = originalPrice,
                Image = originalImage
            };
            await _dataBase.InsertProductAsync(product);

            // Act
            product.Description = updatedDescription;
            product.Price = updatedPrice;
            product.Image = updatedImage;
            await _dataBase.UpdateProductAsync(product);
            Product? updated = await _dataBase.SelectProductByIdAsync(product.Id);

            // Assert
            Assert.That(updated, Is.Not.Null, "Updated product should be found.");
            Assert.That(updated!.Description, Is.EqualTo(updatedDescription));
            Assert.That(updated.Price, Is.EqualTo(updatedPrice));
        }

        [TestCase("Test Product", 19.99, null)]
        public async Task DeleteProductAsync_RemovesProduct(string description, double price, string? image)
        {
            // Arrange
            Product product = new()
            {
                Id = Guid.NewGuid(),
                Description = description,
                Price = price,
                Image = image
            };
            await _dataBase.InsertProductAsync(product);

            // Act
            await _dataBase.DeleteProductAsync(product.Id);
            Product? deleted = await _dataBase.SelectProductByIdAsync(product.Id);

            // Assert
            Assert.That(deleted, Is.Null, "Product should be null after deletion.");
        }

        [TestCase(
            "Original Description", 10.0, null,
            "Updated Description", 15.5, null)]
        public async Task SelectProductsAsync_ReturnsAllInsertedProducts(
            string firstDescription, double firstPrice, string? firstImage,
            string secondDescription, double secondPrice, string? secondImage)
        {
            // Arrange
            Product product1 = new()
            {
                Id = Guid.NewGuid(),
                Description = firstDescription,
                Price = firstPrice,
                Image = firstImage
            };
            Product product2 = new()
            {
                Id = Guid.NewGuid(),
                Description = secondDescription,
                Price = secondPrice,
                Image = secondImage
            };

            await _dataBase.InsertProductAsync(product1);
            await _dataBase.InsertProductAsync(product2);

            // Act
            IEnumerable<Product> products = await _dataBase.SelectProductsAsync();
            List<Product> list = products.ToList();

            // Assert
            Assert.That(list.Any(p => p.Id == product1.Id), Is.True, "Product 1 should be in the result set.");
            Assert.That(list.Any(p => p.Id == product2.Id), Is.True, "Product 2 should be in the result set.");
        }
    }
}
