using BookStoreOnline.Models;
namespace BookStoreOnline.ViewModels;

public class BookDetailsModel
{
    public Book Book { get; set; } = null!;
    public List<Book> Related { get; set; } = [];
    public int Sold { get; set; }
}
public class ReadingListModel
{
    public string Title { get; set; } = "";
    public string Description { get; set; } = "";
    public List<Book> Books { get; set; } = [];
}
