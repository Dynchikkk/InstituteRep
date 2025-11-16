using DataAccess.Abstractions.Core;
using Microsoft.Data.Sqlite;

namespace DataAccess.Sqlite.Core;

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
        await using SqliteConnection conn = _factory.CreateConnection();
        await using SqliteCommand cmd = conn.CreateCommand();
        cmd.CommandText = "SELECT (SELECT COUNT(1) FROM Clients) + (SELECT COUNT(1) FROM Suppliers) + (SELECT COUNT(1) FROM Parts)";

        object? result = await cmd.ExecuteScalarAsync();
        int total = result != null && result != DBNull.Value ? Convert.ToInt32(result) : 0;
        return total == 0;
    }

    public async Task SeedAsync()
    {
        await using SqliteConnection conn = _factory.CreateConnection();
        await using SqliteTransaction tx = conn.BeginTransaction();

        try
        {
            // Clients
            SqliteCommand insertClient = conn.CreateCommand();
            insertClient.Transaction = tx;
            insertClient.CommandText = "INSERT INTO Clients (Name, Login, Password) VALUES (@name, @login, @pwd);";
            _ = insertClient.Parameters.AddWithValue("@name", "Alice");
            _ = insertClient.Parameters.AddWithValue("@login", "alice");
            _ = insertClient.Parameters.AddWithValue("@pwd", "pass1");
            _ = await insertClient.ExecuteNonQueryAsync();

            insertClient.Parameters["@name"].Value = "Bob";
            insertClient.Parameters["@login"].Value = "bob";
            insertClient.Parameters["@pwd"].Value = "pass2";
            _ = await insertClient.ExecuteNonQueryAsync();

            // Suppliers
            SqliteCommand insertSupplier = conn.CreateCommand();
            insertSupplier.Transaction = tx;
            insertSupplier.CommandText = "INSERT INTO Suppliers (Name, Login, Password, Description) VALUES (@name, @login, @pwd, @desc);";
            _ = insertSupplier.Parameters.AddWithValue("@name", "AcmeParts");
            _ = insertSupplier.Parameters.AddWithValue("@login", "acme");
            _ = insertSupplier.Parameters.AddWithValue("@pwd", "acme123");
            _ = insertSupplier.Parameters.AddWithValue("@desc", "Reliable parts supplier");
            _ = await insertSupplier.ExecuteNonQueryAsync();

            insertSupplier.Parameters["@name"].Value = "BestSupplies";
            insertSupplier.Parameters["@login"].Value = "best";
            insertSupplier.Parameters["@pwd"].Value = "best123";
            insertSupplier.Parameters["@desc"].Value = "Quality first";
            _ = await insertSupplier.ExecuteNonQueryAsync();

            // Categories
            SqliteCommand insertCategory = conn.CreateCommand();
            insertCategory.Transaction = tx;
            insertCategory.CommandText = "INSERT INTO PartCategories (Name) VALUES (@name);";
            _ = insertCategory.Parameters.AddWithValue("@name", "Filters");
            _ = await insertCategory.ExecuteNonQueryAsync();
            insertCategory.Parameters["@name"].Value = "SparkPlugs";
            _ = await insertCategory.ExecuteNonQueryAsync();

            // Get supplier ids and category ids (last_insert_rowid not reliable across multiple statements here),
            // so query by known logins/names to fetch ids.
            SqliteCommand getIdCmd = conn.CreateCommand();
            getIdCmd.Transaction = tx;

            // Supplier1 id
            getIdCmd.CommandText = "SELECT Id FROM Suppliers WHERE Login = @login LIMIT 1;";
            _ = getIdCmd.Parameters.AddWithValue("@login", "acme");
            object? supplier1IdObj = await getIdCmd.ExecuteScalarAsync();
            int supplier1Id = supplier1IdObj != null && supplier1IdObj != DBNull.Value ? Convert.ToInt32(supplier1IdObj) : 0;

            // Supplier2 id
            getIdCmd.Parameters["@login"].Value = "best";
            object? supplier2IdObj = await getIdCmd.ExecuteScalarAsync();
            int supplier2Id = supplier2IdObj != null && supplier2IdObj != DBNull.Value ? Convert.ToInt32(supplier2IdObj) : 0;

            // Category ids
            SqliteCommand getCatCmd = conn.CreateCommand();
            getCatCmd.Transaction = tx;
            getCatCmd.CommandText = "SELECT Id FROM PartCategories WHERE Name = @name LIMIT 1;";
            _ = getCatCmd.Parameters.AddWithValue("@name", "Filters");
            object? cat1Obj = await getCatCmd.ExecuteScalarAsync();
            int cat1Id = cat1Obj != null && cat1Obj != DBNull.Value ? Convert.ToInt32(cat1Obj) : 0;

            getCatCmd.Parameters["@name"].Value = "SparkPlugs";
            object? cat2Obj = await getCatCmd.ExecuteScalarAsync();
            int cat2Id = cat2Obj != null && cat2Obj != DBNull.Value ? Convert.ToInt32(cat2Obj) : 0;

            // Parts
            SqliteCommand insertPart = conn.CreateCommand();
            insertPart.Transaction = tx;
            insertPart.CommandText = @"
                    INSERT INTO Parts (SupplierId, CategoryId, Name, Price, Quantity)
                    VALUES (@sid, @cid, @name, @price, @qty);";
            _ = insertPart.Parameters.AddWithValue("@sid", supplier1Id);
            _ = insertPart.Parameters.AddWithValue("@cid", cat1Id);
            _ = insertPart.Parameters.AddWithValue("@name", "Air Filter A");
            _ = insertPart.Parameters.AddWithValue("@price", 12.5);
            _ = insertPart.Parameters.AddWithValue("@qty", 3);
            _ = await insertPart.ExecuteNonQueryAsync();

            insertPart.Parameters["@sid"].Value = supplier1Id;
            insertPart.Parameters["@cid"].Value = cat2Id;
            insertPart.Parameters["@name"].Value = "Spark Plug X";
            insertPart.Parameters["@price"].Value = 7.0;
            insertPart.Parameters["@qty"].Value = 5;
            _ = await insertPart.ExecuteNonQueryAsync();

            insertPart.Parameters["@sid"].Value = supplier2Id;
            insertPart.Parameters["@cid"].Value = cat1Id;
            insertPart.Parameters["@name"].Value = "Air Filter B";
            insertPart.Parameters["@price"].Value = 15.0;
            insertPart.Parameters["@qty"].Value = 2;
            _ = await insertPart.ExecuteNonQueryAsync();

            // Ratings: Alice (client login "alice") rates suppliers
            SqliteCommand getClientCmd = conn.CreateCommand();
            getClientCmd.Transaction = tx;
            getClientCmd.CommandText = "SELECT Id FROM Clients WHERE Login = @login LIMIT 1;";
            _ = getClientCmd.Parameters.AddWithValue("@login", "alice");
            object? client1Obj = await getClientCmd.ExecuteScalarAsync();
            int client1Id = client1Obj != null && client1Obj != DBNull.Value ? Convert.ToInt32(client1Obj) : 0;

            // Alice rates BestSupplies (supplier2) 10, and AcmeParts (supplier1) 7
            SqliteCommand insertRating = conn.CreateCommand();
            insertRating.Transaction = tx;
            insertRating.CommandText = @"
                    INSERT INTO Ratings (SupplierId, ClientId, Value, CreatedAt) 
                    VALUES (@sid, @cid, @val, @now);";
            _ = insertRating.Parameters.AddWithValue("@sid", supplier2Id);
            _ = insertRating.Parameters.AddWithValue("@cid", client1Id);
            _ = insertRating.Parameters.AddWithValue("@val", 10);
            _ = insertRating.Parameters.AddWithValue("@now", DateTime.UtcNow.ToString("o"));
            _ = await insertRating.ExecuteNonQueryAsync();

            insertRating.Parameters["@sid"].Value = supplier1Id;
            insertRating.Parameters["@val"].Value = 7;
            insertRating.Parameters["@now"].Value = DateTime.UtcNow.ToString("o");
            _ = await insertRating.ExecuteNonQueryAsync();

            // Messages between Alice and AcmeParts
            SqliteCommand insertMessage = conn.CreateCommand();
            insertMessage.Transaction = tx;
            insertMessage.CommandText = @"
                    INSERT INTO Messages (SupplierId, ClientId, FromRole, Text, SentAt)
                    VALUES (@sid, @cid, @role, @text, @sent);";
            _ = insertMessage.Parameters.AddWithValue("@sid", supplier1Id);
            _ = insertMessage.Parameters.AddWithValue("@cid", client1Id);
            _ = insertMessage.Parameters.AddWithValue("@role", 0); // Role.Client assumed 0
            _ = insertMessage.Parameters.AddWithValue("@text", "Hello, do you have Air Filter A?");
            _ = insertMessage.Parameters.AddWithValue("@sent", DateTime.UtcNow.ToString("o"));
            _ = await insertMessage.ExecuteNonQueryAsync();

            insertMessage.Parameters["@role"].Value = 1; // Role.Supplier assumed 1
            insertMessage.Parameters["@text"].Value = "Yes, we have 3 in stock.";
            insertMessage.Parameters["@sent"].Value = DateTime.UtcNow.ToString("o");
            _ = await insertMessage.ExecuteNonQueryAsync();

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
