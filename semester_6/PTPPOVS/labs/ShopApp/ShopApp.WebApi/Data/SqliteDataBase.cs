using Microsoft.Data.Sqlite;
using ShopApp.Core.Data;
using ShopApp.Core.Models;

namespace ShopApp.WebApi.Data
{
    /// <summary>
    /// Provides methods to interact with the SQLite database.
    /// </summary>
    public class SqliteDataBase : IDataBase
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
        /// Creates the Products table if it does not exist.
        /// </summary>
        public void CreateTable()
        {
            using SqliteConnection connection = new(_connectionString);
            connection.Open();
            using SqliteCommand cmd = connection.CreateCommand();
            cmd.CommandText = SQL_CREATE_TABLE_PRODUCTS;
            _ = cmd.ExecuteNonQuery();
        }

        /// <summary>
        /// Creates an index on the Id field of the Products table.
        /// </summary>
        public void CreateIndex()
        {
            using SqliteConnection connection = new(_connectionString);
            connection.Open();
            using SqliteCommand cmd = connection.CreateCommand();
            cmd.CommandText = SQL_CREATE_INDEX_PRODUCTS_ID;
            _ = cmd.ExecuteNonQuery();
        }

        /// <summary>
        /// Retrieves all products from the Products table.
        /// </summary>
        /// <returns>An enumerable collection of <see cref="Product"/> objects.</returns>
        public IEnumerable<Product> SelectProducts()
        {
            List<Product> products = [];
            using (SqliteConnection connection = new(_connectionString))
            {
                connection.Open();
                using SqliteCommand cmd = connection.CreateCommand();
                cmd.CommandText = SQL_SELECT_ALL_PRODUCTS;
                using SqliteDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
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
            }
            return products;
        }

        /// <summary>
        /// Retrieves a single product by its Id.
        /// </summary>
        /// <param name="productId">The unique identifier of the product.</param>
        /// <returns>A <see cref="Product"/> object if found; otherwise, null.</returns>
        public Product? SelectProductById(Guid productId)
        {
            using SqliteConnection connection = new(_connectionString);
            connection.Open();
            using SqliteCommand cmd = connection.CreateCommand();
            cmd.CommandText = SQL_SELECT_PRODUCT_BY_ID;
            cmd.Parameters.AddWithValue("@Id", productId.ToString());
            using SqliteDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                string? idStr = reader["Id"]?.ToString();
                if (string.IsNullOrWhiteSpace(idStr) || !Guid.TryParse(idStr, out Guid parsedId))
                {
                    return null; 
                }

                return new Product
                {
                    Id = parsedId,
                    Description = reader["Description"]?.ToString(),
                    Price = Convert.ToDouble(reader["Price"]),
                    Image = reader["Image"]?.ToString()
                };
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// Inserts a new product into the Products table.
        /// </summary>
        /// <param name="product">The <see cref="Product"/> to insert.</param>
        public void InsertProduct(Product product)
        {
            using SqliteConnection connection = new(_connectionString);
            connection.Open();
            using SqliteCommand cmd = connection.CreateCommand();
            cmd.CommandText = SQL_INSERT_PRODUCT;
            _ = cmd.Parameters.AddWithValue("@Id", product.Id.ToString());
            _ = cmd.Parameters.AddWithValue("@Description", product.Description);
            _ = cmd.Parameters.AddWithValue("@Price", product.Price);
            _ = cmd.Parameters.AddWithValue("@Image", product.Image ?? (object)DBNull.Value);
            _ = cmd.ExecuteNonQuery();
        }

        /// <summary>
        /// Updates an existing product in the Products table.
        /// </summary>
        /// <param name="product">The <see cref="Product"/> with updated data.</param>
        public void UpdateProduct(Product product)
        {
            using SqliteConnection connection = new(_connectionString);
            connection.Open();
            using SqliteCommand cmd = connection.CreateCommand();
            cmd.CommandText = SQL_UPDATE_PRODUCT;
            _ = cmd.Parameters.AddWithValue("@Id", product.Id.ToString());
            _ = cmd.Parameters.AddWithValue("@Description", product.Description);
            _ = cmd.Parameters.AddWithValue("@Price", product.Price);
            _ = cmd.Parameters.AddWithValue("@Image", product.Image ?? (object)DBNull.Value);
            _ = cmd.ExecuteNonQuery();
        }

        /// <summary>
        /// Deletes a product from the Products table by its Id.
        /// </summary>
        /// <param name="productId">The unique identifier of the product to delete.</param>
        public void DeleteProduct(Guid productId)
        {
            using (var connection = new SqliteConnection(_connectionString))
            {
                connection.Open();
                using (var cmd = connection.CreateCommand())
                {
                    cmd.CommandText = SQL_DELETE_PRODUCT;
                    cmd.Parameters.AddWithValue("@Id", productId.ToString());
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}

