using Microsoft.EntityFrameworkCore;
using ShopApp.Core.Models;

namespace ShopApp.WebApi.Data
{
    /// <summary>
    /// Represents the application's database context.
    /// </summary>
    public class ApplicationContext : DbContext
    {
        /// <summary>
        /// Gets or sets the Products table.
        /// </summary>
        public DbSet<Product> Products { get; set; }

        /// <summary>
        /// Initializes a new instance of the <see cref="ApplicationContext"/> class.
        /// Ensures the database is created if it does not exist.
        /// </summary>
        /// <param name="options">The options for configuring the context.</param>
        public ApplicationContext(DbContextOptions<ApplicationContext> options)
            : base(options)
        {
        }
    }
}
