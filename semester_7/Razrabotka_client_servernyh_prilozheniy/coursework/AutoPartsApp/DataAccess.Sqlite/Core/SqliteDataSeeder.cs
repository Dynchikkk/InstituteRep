using DataAccess.Abstractions.Core;
using Microsoft.Data.Sqlite;

namespace DataAccess.Sqlite.Core
{
    /// <summary>
    /// SQLite implementation of IDataSeeder.
    /// Uses IDatabaseConnectionFactory&lt;SqliteConnection&gt; to run parameterized SQL
    /// and insert demo clients, suppliers, categories, parts, ratings and messages.
    /// </summary>
    public class SqliteDataSeeder : IDataSeeder
    {
        private readonly IDatabaseConnectionFactory<SqliteConnection> _factory;

        public SqliteDataSeeder(IDatabaseConnectionFactory<SqliteConnection> factory)
        {
            _factory = factory;
        }

        public async Task<bool> IsEmptyAsync()
        {
            await using var conn = _factory.CreateConnection();
            await using var cmd = conn.CreateCommand();
            cmd.CommandText = "SELECT (SELECT COUNT(1) FROM Clients) + (SELECT COUNT(1) FROM Suppliers) + (SELECT COUNT(1) FROM Parts)";

            var result = await cmd.ExecuteScalarAsync();
            var total = result != null && result != DBNull.Value ? Convert.ToInt32(result) : 0;
            return total == 0;
        }

        public async Task SeedAsync()
        {
            await using var conn = _factory.CreateConnection();
            await using var tx = conn.BeginTransaction();

            try
            {
                // Clients
                var insertClient = conn.CreateCommand();
                insertClient.Transaction = tx;
                insertClient.CommandText = "INSERT INTO Clients (Name, Login, Password) VALUES (@name, @login, @pwd);";
                insertClient.Parameters.AddWithValue("@name", "Alice");
                insertClient.Parameters.AddWithValue("@login", "alice");
                insertClient.Parameters.AddWithValue("@pwd", "pass1");
                await insertClient.ExecuteNonQueryAsync();

                insertClient.Parameters["@name"].Value = "Bob";
                insertClient.Parameters["@login"].Value = "bob";
                insertClient.Parameters["@pwd"].Value = "pass2";
                await insertClient.ExecuteNonQueryAsync();

                // Suppliers
                var insertSupplier = conn.CreateCommand();
                insertSupplier.Transaction = tx;
                insertSupplier.CommandText = "INSERT INTO Suppliers (Name, Login, Password, Description) VALUES (@name, @login, @pwd, @desc);";
                insertSupplier.Parameters.AddWithValue("@name", "AcmeParts");
                insertSupplier.Parameters.AddWithValue("@login", "acme");
                insertSupplier.Parameters.AddWithValue("@pwd", "acme123");
                insertSupplier.Parameters.AddWithValue("@desc", "Reliable parts supplier");
                await insertSupplier.ExecuteNonQueryAsync();

                insertSupplier.Parameters["@name"].Value = "BestSupplies";
                insertSupplier.Parameters["@login"].Value = "best";
                insertSupplier.Parameters["@pwd"].Value = "best123";
                insertSupplier.Parameters["@desc"].Value = "Quality first";
                await insertSupplier.ExecuteNonQueryAsync();

                // Categories
                var insertCategory = conn.CreateCommand();
                insertCategory.Transaction = tx;
                insertCategory.CommandText = "INSERT INTO PartCategories (Name) VALUES (@name);";
                insertCategory.Parameters.AddWithValue("@name", "Filters");
                await insertCategory.ExecuteNonQueryAsync();
                insertCategory.Parameters["@name"].Value = "SparkPlugs";
                await insertCategory.ExecuteNonQueryAsync();

                // Get supplier ids and category ids (last_insert_rowid not reliable across multiple statements here),
                // so query by known logins/names to fetch ids.
                var getIdCmd = conn.CreateCommand();
                getIdCmd.Transaction = tx;

                // Supplier1 id
                getIdCmd.CommandText = "SELECT Id FROM Suppliers WHERE Login = @login LIMIT 1;";
                getIdCmd.Parameters.AddWithValue("@login", "acme");
                var supplier1IdObj = await getIdCmd.ExecuteScalarAsync();
                var supplier1Id = supplier1IdObj != null && supplier1IdObj != DBNull.Value ? Convert.ToInt32(supplier1IdObj) : 0;

                // Supplier2 id
                getIdCmd.Parameters["@login"].Value = "best";
                var supplier2IdObj = await getIdCmd.ExecuteScalarAsync();
                var supplier2Id = supplier2IdObj != null && supplier2IdObj != DBNull.Value ? Convert.ToInt32(supplier2IdObj) : 0;

                // Category ids
                var getCatCmd = conn.CreateCommand();
                getCatCmd.Transaction = tx;
                getCatCmd.CommandText = "SELECT Id FROM PartCategories WHERE Name = @name LIMIT 1;";
                getCatCmd.Parameters.AddWithValue("@name", "Filters");
                var cat1Obj = await getCatCmd.ExecuteScalarAsync();
                var cat1Id = cat1Obj != null && cat1Obj != DBNull.Value ? Convert.ToInt32(cat1Obj) : 0;

                getCatCmd.Parameters["@name"].Value = "SparkPlugs";
                var cat2Obj = await getCatCmd.ExecuteScalarAsync();
                var cat2Id = cat2Obj != null && cat2Obj != DBNull.Value ? Convert.ToInt32(cat2Obj) : 0;

                // Parts
                var insertPart = conn.CreateCommand();
                insertPart.Transaction = tx;
                insertPart.CommandText = @"
                    INSERT INTO Parts (SupplierId, CategoryId, Name, Price, Quantity)
                    VALUES (@sid, @cid, @name, @price, @qty);";
                insertPart.Parameters.AddWithValue("@sid", supplier1Id);
                insertPart.Parameters.AddWithValue("@cid", cat1Id);
                insertPart.Parameters.AddWithValue("@name", "Air Filter A");
                insertPart.Parameters.AddWithValue("@price", 12.5);
                insertPart.Parameters.AddWithValue("@qty", 3);
                await insertPart.ExecuteNonQueryAsync();

                insertPart.Parameters["@sid"].Value = supplier1Id;
                insertPart.Parameters["@cid"].Value = cat2Id;
                insertPart.Parameters["@name"].Value = "Spark Plug X";
                insertPart.Parameters["@price"].Value = 7.0;
                insertPart.Parameters["@qty"].Value = 5;
                await insertPart.ExecuteNonQueryAsync();

                insertPart.Parameters["@sid"].Value = supplier2Id;
                insertPart.Parameters["@cid"].Value = cat1Id;
                insertPart.Parameters["@name"].Value = "Air Filter B";
                insertPart.Parameters["@price"].Value = 15.0;
                insertPart.Parameters["@qty"].Value = 2;
                await insertPart.ExecuteNonQueryAsync();

                // Ratings: Alice (client login "alice") rates suppliers
                var getClientCmd = conn.CreateCommand();
                getClientCmd.Transaction = tx;
                getClientCmd.CommandText = "SELECT Id FROM Clients WHERE Login = @login LIMIT 1;";
                getClientCmd.Parameters.AddWithValue("@login", "alice");
                var client1Obj = await getClientCmd.ExecuteScalarAsync();
                var client1Id = client1Obj != null && client1Obj != DBNull.Value ? Convert.ToInt32(client1Obj) : 0;

                // Alice rates BestSupplies (supplier2) 10, and AcmeParts (supplier1) 7
                var insertRating = conn.CreateCommand();
                insertRating.Transaction = tx;
                insertRating.CommandText = @"
                    INSERT INTO Ratings (SupplierId, ClientId, Value, CreatedAt) 
                    VALUES (@sid, @cid, @val, @now);";
                insertRating.Parameters.AddWithValue("@sid", supplier2Id);
                insertRating.Parameters.AddWithValue("@cid", client1Id);
                insertRating.Parameters.AddWithValue("@val", 10);
                insertRating.Parameters.AddWithValue("@now", DateTime.UtcNow.ToString("o"));
                await insertRating.ExecuteNonQueryAsync();

                insertRating.Parameters["@sid"].Value = supplier1Id;
                insertRating.Parameters["@val"].Value = 7;
                insertRating.Parameters["@now"].Value = DateTime.UtcNow.ToString("o");
                await insertRating.ExecuteNonQueryAsync();

                // Messages between Alice and AcmeParts
                var insertMessage = conn.CreateCommand();
                insertMessage.Transaction = tx;
                insertMessage.CommandText = @"
                    INSERT INTO Messages (SupplierId, ClientId, FromRole, Text, SentAt)
                    VALUES (@sid, @cid, @role, @text, @sent);";
                insertMessage.Parameters.AddWithValue("@sid", supplier1Id);
                insertMessage.Parameters.AddWithValue("@cid", client1Id);
                insertMessage.Parameters.AddWithValue("@role", (int)0); // Role.Client assumed 0
                insertMessage.Parameters.AddWithValue("@text", "Hello, do you have Air Filter A?");
                insertMessage.Parameters.AddWithValue("@sent", DateTime.UtcNow.ToString("o"));
                await insertMessage.ExecuteNonQueryAsync();

                insertMessage.Parameters["@role"].Value = (int)1; // Role.Supplier assumed 1
                insertMessage.Parameters["@text"].Value = "Yes, we have 3 in stock.";
                insertMessage.Parameters["@sent"].Value = DateTime.UtcNow.ToString("o");
                await insertMessage.ExecuteNonQueryAsync();

                // Commit
                tx.Commit();
            }
            catch
            {
                try { tx.Rollback(); } catch { }
                throw;
            }
        }
    }
}
