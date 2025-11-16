namespace SharedModels;

public class Rating
{
    public int Id { get; set; }
    public int SupplierId { get; set; }
    public int ClientId { get; set; }
    public int Value { get; set; }
    public DateTime CreatedAt { get; set; }
}
