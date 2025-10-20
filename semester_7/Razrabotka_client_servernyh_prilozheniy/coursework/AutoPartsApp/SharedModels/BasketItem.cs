namespace SharedModels
{
    public class BasketItem
    {
        public int Id { get; set; }
        public int ClientId { get; set; }
        public int SupplierId { get; set; }
        public int PartId { get; set; }
        public int Quantity { get; set; }
    }
}
