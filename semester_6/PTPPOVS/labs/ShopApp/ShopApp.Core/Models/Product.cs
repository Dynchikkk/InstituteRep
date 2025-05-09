﻿using Microsoft.EntityFrameworkCore;

namespace ShopApp.Core.Models
{
    /// <summary>
    /// Represents a product in the store.
    /// </summary>
    [Index(nameof(Id))]
    public class Product : ICloneable
    {
        /// <summary>
        /// Gets or sets the unique identifier of the product.
        /// </summary>
        public Guid Id { get; set; }

        /// <summary>
        /// Gets or sets the description of the product.
        /// </summary>
        public string? Description { get; set; }

        /// <summary>
        /// Gets or sets the price of the product.
        /// </summary>
        public double Price { get; set; }

        /// <summary>
        /// Gets or sets the image path of the product.
        /// </summary>
        public string? Image { get; set; } = null;

        /// <summary>
        /// Creates a deep copy of the current product instance.
        /// </summary>
        /// <returns>A new <see cref="Product"/> object with the same values.</returns>
        public object Clone()
        {
            return new Product()
            {
                Id = Id,
                Description = Description,
                Price = Price,
                Image = Image
            };
        }
    }
}
