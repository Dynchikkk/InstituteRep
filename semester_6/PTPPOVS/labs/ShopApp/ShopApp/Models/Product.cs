namespace ShopApp.Models
{
    /// <summary>
    /// Store data about product
    /// </summary>
    public class Product : ICloneable
    {
        /// <summary>
        /// Unique id in system
        /// </summary>
        public Guid Id { get; set; }
        /// <summary>
        /// Product description
        /// </summary>
        public string Description { get; set; }
        /// <summary>
        /// Product price
        /// </summary>
        public double Price { get; set; }

        public object Clone()
        {
            return new Product()
            {
                Id = Id,
                Description = Description,
                Price = Price
            };
        }
    }
}
