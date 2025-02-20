using Microsoft.AspNetCore.Mvc;
using ShopApp.Models;
using ShopApp.Services;

namespace ShopApp.Controllers
{
    /// <summary>
    /// Provides endpoints for interacting with products
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    public class ProductsController : ControllerBase
    {
        private readonly ILogger<ProductsController> _logger;
        private readonly IProductService<Product> _productService;

        /// <summary>
        /// Base constructor
        /// </summary>
        /// <param name="logger">ProductsController logger</param>
        public ProductsController(ILogger<ProductsController> logger)
        {
            _logger = logger;
#if DEBUG
            _productService = new ProductService();
#endif
        }

        /// <summary>
        /// Create new product 
        /// </summary>
        /// <param name="description">Product description</param>
        /// <param name="price">Product price</param>
        /// <returns>Created product</returns>
        [HttpPost, Route("create")]
        public Guid CreateProduct(string description, double price)
        {
            Product createdProduct = new Product()
            {
                Id = Guid.NewGuid(),
                Description = description,
                Price = price
            };
            if (_productService.Add(createdProduct))
            {
                return createdProduct.Id;
            }
            return Guid.Empty;
        }

        /// <summary>
        /// Remove product by id
        /// </summary>
        /// <param name="id">Product id</param>
        /// <returns>Removed product if success, else - null</returns>
        [HttpPost, Route("remove")]
        public Product? RemoveProduct(Guid id)
        {
            return _productService.Remove(id);
        }

        /// <summary>
        /// Edit existed product
        /// </summary>
        /// <param name="id">Product id</param>
        /// <param name="description">Product description</param>
        /// <param name="price">Product price</param>
        /// <returns>Edited product if success, else - null</returns>
        [HttpPost, Route("edit")]
        public Product? EditProduct(Guid id, string description, double price)
        {
            Product tempProduct = new Product()
            {
                Id = id,
                Description = description,
                Price = price
            };
            return _productService.Edit(tempProduct);
        }

        /// <summary>
        /// Search product by id
        /// </summary>
        /// <param name="id">Product id</param>
        /// <returns>Found product if success, else - null</returns>
        [HttpPost, Route("search")]
        public Product? SearchProduct(Guid id)
        {
            return _productService.Search(id);
        }
    }
}
