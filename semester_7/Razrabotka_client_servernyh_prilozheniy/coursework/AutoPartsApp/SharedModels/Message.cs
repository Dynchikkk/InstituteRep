namespace SharedModels;

public class Message
{
    public int Id { get; set; }
    public int SupplierId { get; set; }
    public int ClientId { get; set; }
    public Role FromRole { get; set; }
    public string Text { get; set; } = "";
    public DateTime SentAt { get; set; }
}
