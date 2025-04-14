using ShopApp.Core.Models;
using ShopApp.Core.Services;
using ShopApp.WebApi.Data;

namespace ShopApp.WebApi.Services
{
    /// <summary>
    /// Provides database operations for products.
    /// </summary>
    public class DataBaseProductService : IProductsService<Product>
    {
        private readonly ApplicationContext _context;

        /// <summary>
        /// Initializes a new instance of the <see cref="DataBaseProductService"/> class.
        /// </summary>
        /// <param name="context">The application database context.</param>
        public DataBaseProductService(ApplicationContext context)
        {
            _context = context;
        }

        /// <summary>
        /// Adds a new product to the database.
        /// </summary>
        /// <param name="product">The product to add.</param>
        /// <returns>True if the product was added; otherwise, false.</returns>
        public async Task<bool> Add(Product product)
        {
            _ = _context.Products.Add(product);
            return await _context.SaveChangesAsync() > 0;
        }

        /// <summary>
        /// Removes a product from the database by its identifier.
        /// </summary>
        /// <param name="productId">The identifier of the product to remove.</param>
        /// <returns>The removed product if successful; otherwise, null.</returns>
        public async Task<Product?> Remove(Guid productId)
        {
            Product? product = await _context.Products.FindAsync(productId);
            if (product != null)
            {
                _ = _context.Products.Remove(product);
                _ = await _context.SaveChangesAsync();
            }
            return product;
        }

        /// <summary>
        /// Edits an existing product in the database.
        /// </summary>
        /// <param name="product">The updated product.</param>
        /// <returns>The updated product if successful; otherwise, null.</returns>
        public async Task<Product?> Edit(Product product)
        {
            Product? entity = await _context.Products.FindAsync(product.Id);
            if (entity == null)
            {
                return null;
            }

            // Update individual properties
            entity.Description = product.Description;
            entity.Price = product.Price;
            entity.Image = product.Image;

            _ = await _context.SaveChangesAsync();
            return entity;
        }

        /// <summary>
        /// Searches for a product in the database by its identifier.
        /// </summary>
        /// <param name="productId">The identifier of the product to search for.</param>
        /// <returns>The found product if exists; otherwise, null.</returns>
        public async Task<Product?> Search(Guid productId)
        {
            return await _context.Products.FindAsync(productId);
        }

        /// <summary>
        /// Releases the unmanaged resources used by the service.
        /// </summary>
        public void Dispose()
        {
            _context.Dispose();
        }
    }
}
