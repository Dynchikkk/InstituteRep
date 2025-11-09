using DataAccess.Interfaces;
using Microsoft.Data.Sqlite;
using SharedModels;
using System.Collections.Generic;
using System.Threading.Tasks;
using System;

namespace DataAccess.Sqlite
{
    /// <summary>
    /// Handles messages between clients and suppliers.
    /// </summary>
    public class SqliteMessageRepository : IMessageRepository
    {
        private readonly string _connectionString;

        public SqliteMessageRepository(string connectionString)
        {
            _connectionString = connectionString;
        }

        public async Task<int> AddAsync(Message message)
        {
            using var conn = SqliteHelpers.GetConnection(_connectionString);
            string sql = @"INSERT INTO Messages (SupplierId, ClientId, FromRole, Text, SentAt)
                           VALUES (@SupplierId, @ClientId, @FromRole, @Text, @SentAt);
                           SELECT last_insert_rowid();";
            using var cmd = new SqliteCommand(sql, conn);
            cmd.Parameters.AddWithValue("@SupplierId", message.SupplierId);
            cmd.Parameters.AddWithValue("@ClientId", message.ClientId);
            cmd.Parameters.AddWithValue("@FromRole", (int)message.FromRole);
            cmd.Parameters.AddWithValue("@Text", message.Text);
            cmd.Parameters.AddWithValue("@SentAt", message.SentAt);

            var result = await cmd.ExecuteScalarAsync();
            return Convert.ToInt32((long)result!);
        }

        public async Task<IEnumerable<Message>> GetDialogAsync(int clientId, int supplierId)
        {
            var list = new List<Message>();
            using var conn = SqliteHelpers.GetConnection(_connectionString);
            string sql = @"SELECT Id, SupplierId, ClientId, FromRole, Text, SentAt
                           FROM Messages
                           WHERE ClientId=@ClientId AND SupplierId=@SupplierId
                           ORDER BY SentAt ASC;";
            using var cmd = new SqliteCommand(sql, conn);
            cmd.Parameters.AddWithValue("@ClientId", clientId);
            cmd.Parameters.AddWithValue("@SupplierId", supplierId);

            using var reader = await cmd.ExecuteReaderAsync();
            while (await reader.ReadAsync())
            {
                list.Add(new Message
                {
                    Id = Convert.ToInt32(reader["Id"]),
                    SupplierId = Convert.ToInt32(reader["SupplierId"]),
                    ClientId = Convert.ToInt32(reader["ClientId"]),
                    FromRole = (Role)Convert.ToInt32(reader["FromRole"]),
                    Text = Convert.ToString(reader["Text"]) ?? "",
                    SentAt = DateTime.Parse(reader["SentAt"].ToString()!)
                });
            }
            return list;
        }
    }
}
