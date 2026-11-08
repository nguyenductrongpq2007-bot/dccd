using BookStoreOnline.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BookStoreOnline.ApiControllers;

[ApiController]
[Route("api/books")]
public class BooksApiController(BookStoreContext db) : ControllerBase
{
    // GET: /api/books?q=lap-trinh&categoryId=1&page=1&pageSize=12
    [HttpGet]
    public async Task<IActionResult> GetBooks(
        string? q, int? categoryId, int page = 1, int pageSize = 12)
    {
        page = Math.Max(1, page);
        pageSize = Math.Clamp(pageSize, 1, 50);

        var query = db.Books.AsNoTracking()
            .Include(x => x.Category)
            .Include(x => x.Author)
            .Include(x => x.Publisher)
            .Where(x => x.IsActive);

        if (!string.IsNullOrWhiteSpace(q))
            query = query.Where(x => x.Title.Contains(q) || x.Isbn.Contains(q));
        if (categoryId.HasValue)
            query = query.Where(x => x.CategoryId == categoryId.Value);

        var total = await query.CountAsync();
        var items = await query.OrderBy(x => x.Title)
            .Skip((page - 1) * pageSize).Take(pageSize)
            .Select(x => new
            {
                x.Id, x.Title, x.Description, x.Isbn, x.Price, x.ListPrice,
                x.Stock, x.Pages, x.Year, x.ImagePath,
                Category = x.Category.Name,
                Author = x.Author.Name,
                Publisher = x.Publisher.Name
            }).ToListAsync();

        return Ok(new { page, pageSize, total, items });
    }

    // GET: /api/books/5
    [HttpGet("{id:int}")]
    public async Task<IActionResult> GetBook(int id)
    {
        var book = await db.Books.AsNoTracking()
            .Include(x => x.Category).Include(x => x.Author).Include(x => x.Publisher)
            .Where(x => x.Id == id && x.IsActive)
            .Select(x => new
            {
                x.Id, x.Title, x.Description, x.Isbn, x.Price, x.ListPrice,
                x.Stock, x.Pages, x.Year, x.ImagePath, x.Language, x.Binding,
                x.Dimensions, x.Translator,
                Category = x.Category.Name,
                Author = x.Author.Name,
                Publisher = x.Publisher.Name
            }).FirstOrDefaultAsync();

        return book == null ? NotFound(new { message = "Không tìm thấy sách." }) : Ok(book);
    }
}
