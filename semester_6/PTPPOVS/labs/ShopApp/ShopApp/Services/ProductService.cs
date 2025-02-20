using ShopApp.Models;

namespace ShopApp.Services
{
    /// <summary>
    /// 'Product' realization of ProductService
    /// </summary>
    public class ProductService : IProductService<Product>
    {
        private readonly Dictionary<Guid, Product> _products;

        /// <summary>
        /// Base constructor. randomly generate products collection
        /// </summary>
        public ProductService()
        {
            _products = new Dictionary<Guid, Product>();
            for (int i = 0; i < 5; i++)
            {
                Product tempProduct = new Product()
                {
                    Id = Guid.NewGuid(),
                    Description = $"Random description of product {i}",
                    Price = Random.Shared.NextDouble()
                };
                _products.Add(tempProduct.Id, tempProduct);
            }
        }

        /// <summary>
        /// Base constructor. Fill products from parametres
        /// </summary>
        /// <param name="initialProducts">Initial products</param>
        public ProductService(List<Product> initialProducts)
        {
            _products = new Dictionary<Guid, Product>();
            foreach (var product in initialProducts)
            {
                _products.Add(product.Id, product);
            }
        }

        /// <summary>
        /// Add product to collection
        /// </summary>
        /// <param name="product">Product</param>
        /// <returns>True if add was successful, else - false</returns>
        public bool Add(Product product)
        {
            if (_products.ContainsKey(product.Id))
            {
                return false;
            }
            _products.Add(product.Id, product);
            return true;
        }

        /// <summary>
        /// Edit product in collection
        /// </summary>
        /// <param name="product">Product</param>
        /// <returns>Product if edit was successful, else - null</returns>
        public Product? Edit(Product product)
        {
            if (!_products.ContainsKey(product.Id))
            {
                return null;
            }
            _products[product.Id] = (Product)product.Clone();
            return _products[product.Id];
        }

        /// <summary>
        /// Remove product from collection
        /// </summary>
        /// <param name="productId">Product id</param>
        /// <returns>Product if remove was successful, else - null</returns>
        public Product? Remove(Guid productId)
        {
            if (!_products.TryGetValue(productId, out Product? removedProduct))
            {
                return null;
            }
            _products.Remove(productId);
            return removedProduct;
        }

        /// <summary>
        /// Search product in collection
        /// </summary>
        /// <param name="productId">Product id</param>
        /// <returns>Product if search was successful, else - null</returns>
        public Product? Search(Guid productId)
        {
            if (!_products.TryGetValue(productId, out Product? foundProduct))
            {
                return null;
            }
            return foundProduct;
        }
    }
}
