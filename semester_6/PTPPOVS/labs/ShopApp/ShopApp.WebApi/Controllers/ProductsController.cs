using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using ShopApp.Core.Models;
using ShopApp.Core.Services;

namespace ShopApp.WebApi.Controllers
{
    /// <summary>
    /// Provides endpoints for interacting with products.
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    public class ProductsController : ControllerBase
    {
        private readonly ILogger<ProductsController> _logger;
        private readonly IProductsService<Product> _productService;

        /// <summary>
        /// Base constructor.
        /// </summary>
        /// <param name="logger">ProductsController logger</param>
        /// <param name="productsService">Products service</param>
        public ProductsController(ILogger<ProductsController> logger, IProductsService<Product> productsService)
        {
            _logger = logger;
            _productService = productsService;
        }

        /// <summary>
        /// Create new product.
        /// </summary>
        /// <param name="description">Product description</param>
        /// <param name="price">Product price</param>
        /// <param name="image">Product image (optional)</param>
        /// <returns>JSON string of the created product if success, else empty JSON</returns>
        [HttpPost, Route("create")]
        public async Task<string> CreateProduct(string description, double price, string? image = null)
        {
            Product createdProduct = new()
            {
                Id = Guid.NewGuid(),
                Description = description,
                Price = price,
                Image = image
            };

            bool isAdded = await _productService.Add(createdProduct);
            return isAdded ? JsonConvert.SerializeObject(createdProduct) : "{}";
        }

        /// <summary>
        /// Remove product by id.
        /// </summary>
        /// <param name="id">Product id</param>
        /// <returns>JSON string of the removed product if success, else empty JSON</returns>
        [HttpPost, Route("remove")]
        public async Task<string> RemoveProduct(Guid id)
        {
            Product? removedProduct = await _productService.Remove(id);
            return removedProduct != null ? JsonConvert.SerializeObject(removedProduct) : "{}";
        }

        /// <summary>
        /// Edit existed product.
        /// </summary>
        /// <param name="id">Product id</param>
        /// <param name="description">Product description</param>
        /// <param name="price">Product price</param>
        /// <param name="image">Product image (optional)</param>
        /// <returns>JSON string of the updated product if success, else empty JSON</returns>
        [HttpPost, Route("edit")]
        public async Task<string> EditProduct(Guid id, string description, double price, string? image = null)
        {
            Product tempProduct = new()
            {
                Id = id,
                Description = description,
                Price = price,
                Image = image
            };

            Product? editedProduct = await _productService.Edit(tempProduct);
            return editedProduct != null ? JsonConvert.SerializeObject(editedProduct) : "{}";
        }

        /// <summary>
        /// Search product by id.
        /// </summary>
        /// <param name="id">Product id</param>
        /// <returns>JSON string of the found product if success, else empty JSON</returns>
        [HttpGet, Route("search")]
        public async Task<string> SearchProduct(Guid id)
        {
            Product? foundProduct = await _productService.Search(id);
            return foundProduct != null ? JsonConvert.SerializeObject(foundProduct) : "{}";
        }
    }
}
