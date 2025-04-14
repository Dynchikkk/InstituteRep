using Microsoft.Data.Sqlite;
using ShopApp.Core.Models;

namespace ShopApp.WebApi.Data
{
    /// <summary>
    /// Provides methods to interact with the SQLite database.
    /// </summary>
    public class SqliteDataBase
    {
        private const string SQL_CREATE_TABLE_PRODUCTS = @"
            CREATE TABLE IF NOT EXISTS Products (
                Id TEXT PRIMARY KEY,
                Description TEXT,
                Price REAL,
                Image TEXT NULL
            );";
        private const string SQL_CREATE_INDEX_PRODUCTS_ID = @"
            CREATE INDEX IF NOT EXISTS IDX_PRODUCTS_ID 
            ON Products(Id);";
        private const string SQL_SELECT_ALL_PRODUCTS = "SELECT Id, Description, Price, Image FROM Products;";
        private const string SQL_SELECT_PRODUCT_BY_ID = "SELECT Id, Description, Price, Image FROM Products WHERE Id = @Id;";
        private const string SQL_INSERT_PRODUCT = @"
            INSERT INTO Products (Id, Description, Price, Image)
            VALUES (@Id, @Description, @Price, @Image);";
        private const string SQL_UPDATE_PRODUCT = @"
            UPDATE Products 
            SET Description = @Description, Price = @Price, Image = @Image
            WHERE Id = @Id;";
        private const string SQL_DELETE_PRODUCT = "DELETE FROM Products WHERE Id = @Id;";

        private readonly string _connectionString;

        /// <summary>
        /// Initializes a new instance of the <see cref="SqliteDataBase"/> class.
        /// </summary>
        /// <param name="connectionString">The SQLite connection string.</param>
        public SqliteDataBase(string connectionString)
        {
            _connectionString = connectionString;
        }

        /// <summary>
        /// Asynchronously creates the Products table if it does not exist.
        /// </summary>
        public async Task CreateTableAsync()
        {
            using SqliteConnection connection = new(_connectionString);
            await connection.OpenAsync();
            using SqliteCommand cmd = connection.CreateCommand();
            cmd.CommandText = SQL_CREATE_TABLE_PRODUCTS;
            _ = await cmd.ExecuteNonQueryAsync();
        }

        /// <summary>
        /// Asynchronously creates an index on the Id field of the Products table.
        /// </summary>
        public async Task CreateIndexAsync()
        {
            using SqliteConnection connection = new(_connectionString);
            await connection.OpenAsync();
            using SqliteCommand cmd = connection.CreateCommand();
            cmd.CommandText = SQL_CREATE_INDEX_PRODUCTS_ID;
            _ = await cmd.ExecuteNonQueryAsync();
        }

        /// <summary>
        /// Asynchronously retrieves all products from the Products table.
        /// </summary>
        /// <returns>An enumerable collection of <see cref="Product"/> objects.</returns>
        public async Task<IEnumerable<Product>> SelectProductsAsync()
        {
            List<Product> products = [];

            using SqliteConnection connection = new(_connectionString);
            await connection.OpenAsync();
            using SqliteCommand cmd = connection.CreateCommand();
            cmd.CommandText = SQL_SELECT_ALL_PRODUCTS;

            using SqliteDataReader reader = await cmd.ExecuteReaderAsync();
            while (await reader.ReadAsync())
            {
                string? idStr = reader["Id"]?.ToString();
                if (string.IsNullOrWhiteSpace(idStr) || !Guid.TryParse(idStr, out Guid parsedId))
                {
                    continue;
                }
                products.Add(new Product
                {
                    Id = parsedId,
                    Description = reader["Description"]?.ToString(),
                    Price = Convert.ToDouble(reader["Price"]),
                    Image = reader["Image"]?.ToString()
                });
            }
            return products;
        }

        /// <summary>
        /// Asynchronously retrieves a single product by its Id.
        /// </summary>
        /// <param name="productId">The unique identifier of the product.</param>
        /// <returns>A <see cref="Product"/> object if found; otherwise, null.</returns>
        public async Task<Product?> SelectProductByIdAsync(Guid productId)
        {
            using SqliteConnection connection = new(_connectionString);
            await connection.OpenAsync();
            using SqliteCommand cmd = connection.CreateCommand();
            cmd.CommandText = SQL_SELECT_PRODUCT_BY_ID;
            _ = cmd.Parameters.AddWithValue("@Id", productId.ToString());

            using SqliteDataReader reader = await cmd.ExecuteReaderAsync();
            if (await reader.ReadAsync())
            {
                string? idStr = reader["Id"]?.ToString();
                return string.IsNullOrWhiteSpace(idStr) || !Guid.TryParse(idStr, out Guid parsedId)
                    ? null
                    : new Product
                    {
                        Id = parsedId,
                        Description = reader["Description"]?.ToString(),
                        Price = Convert.ToDouble(reader["Price"]),
                        Image = reader["Image"]?.ToString()
                    };
            }
            return null;
        }

        /// <summary>
        /// Asynchronously inserts a new product into the Products table.
        /// </summary>
        /// <param name="product">The <see cref="Product"/> to insert.</param>
        public async Task InsertProductAsync(Product product)
        {
            using SqliteConnection connection = new(_connectionString);
            await connection.OpenAsync();
            using SqliteCommand cmd = connection.CreateCommand();
            cmd.CommandText = SQL_INSERT_PRODUCT;
            _ = cmd.Parameters.AddWithValue("@Id", product.Id.ToString());
            _ = cmd.Parameters.AddWithValue("@Description", product.Description);
            _ = cmd.Parameters.AddWithValue("@Price", product.Price);
            _ = cmd.Parameters.AddWithValue("@Image", product.Image ?? (object)DBNull.Value);
            _ = await cmd.ExecuteNonQueryAsync();
        }

        /// <summary>
        /// Asynchronously updates an existing product in the Products table.
        /// </summary>
        /// <param name="product">The <see cref="Product"/> with updated data.</param>
        public async Task UpdateProductAsync(Product product)
        {
            using SqliteConnection connection = new(_connectionString);
            await connection.OpenAsync();
            using SqliteCommand cmd = connection.CreateCommand();
            cmd.CommandText = SQL_UPDATE_PRODUCT;
            _ = cmd.Parameters.AddWithValue("@Id", product.Id.ToString());
            _ = cmd.Parameters.AddWithValue("@Description", product.Description);
            _ = cmd.Parameters.AddWithValue("@Price", product.Price);
            _ = cmd.Parameters.AddWithValue("@Image", product.Image ?? (object)DBNull.Value);
            _ = await cmd.ExecuteNonQueryAsync();
        }

        /// <summary>
        /// Asynchronously deletes a product from the Products table by its Id.
        /// </summary>
        /// <param name="productId">The unique identifier of the product to delete.</param>
        public async Task DeleteProductAsync(Guid productId)
        {
            using SqliteConnection connection = new(_connectionString);
            await connection.OpenAsync();
            using SqliteCommand cmd = connection.CreateCommand();
            cmd.CommandText = SQL_DELETE_PRODUCT;
            _ = cmd.Parameters.AddWithValue("@Id", productId.ToString());
            _ = await cmd.ExecuteNonQueryAsync();
        }
    }
}
