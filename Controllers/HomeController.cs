using BookStoreOnline.Data;
using BookStoreOnline.Models;
using BookStoreOnline.Services;
using BookStoreOnline.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
namespace BookStoreOnline.Controllers;

public class HomeController(BookStoreContext db, ReadingListService reading) : Controller
{
    private IQueryable<Book> ActiveBooks() => db.Books.AsNoTracking()
        .Include(x => x.Category).Include(x => x.Author).Include(x => x.Publisher)
        .Where(x => x.IsActive);

    public async Task<IActionResult> Index(string? q, int? category, int? author,
        int? publisher, decimal? minPrice, decimal? maxPrice, bool inStock = false,
        bool hasSample = false, string sort = "new", int page = 1, string kind = "all")
    {
        q = string.IsNullOrWhiteSpace(q) ? null : q.Trim()[..Math.Min(q.Trim().Length, 120)];
        minPrice = minPrice.HasValue ? Math.Max(0, minPrice.Value) : null;
        maxPrice = maxPrice.HasValue ? Math.Max(0, maxPrice.Value) : null;
        if (minPrice > maxPrice) (minPrice, maxPrice) = (maxPrice, minPrice);
        var books = ActiveBooks();
        if (kind is not ("all" or "published" or "demo")) kind = "all";
        if (kind == "published") books = books.Where(x => x.SourceUrl != "");
        if (kind == "demo") books = books.Where(x => x.Isbn.StartsWith("DEMO-"));
        if (q != null) books = books.Where(x =>
            EF.Functions.Collate(x.Title, "Latin1_General_100_CI_AI").Contains(q) ||
            EF.Functions.Collate(x.Author.Name, "Latin1_General_100_CI_AI").Contains(q) || x.Isbn.Contains(q));
        if (category.HasValue) books = books.Where(x => x.CategoryId == category.Value);
        if (author.HasValue) books = books.Where(x => x.AuthorId == author.Value);
        if (publisher.HasValue) books = books.Where(x => x.PublisherId == publisher.Value);
        if (minPrice.HasValue) books = books.Where(x => x.Price >= minPrice.Value);
        if (maxPrice.HasValue) books = books.Where(x => x.Price <= maxPrice.Value);
        if (inStock) books = books.Where(x => x.Stock > 0);
        if (hasSample) books = books.Where(x => x.SampleText != "");
        string[] sorts = ["new", "price-asc", "price-desc", "title", "discount", "bestseller"];
        if (!sorts.Contains(sort)) sort = "new";
        var sales = db.OrderItems.Where(x => x.Order.Status == "Đã giao");
        if (sort == "bestseller") books = books.Where(b => sales.Any(x => x.BookId == b.Id));
        var total = await books.CountAsync();
        page = Math.Clamp(page, 1, Math.Max(1, (int)Math.Ceiling(total / 12.0)));
        books = sort switch
        {
            "price-asc" => books.OrderBy(x => x.Price).ThenBy(x => x.Id),
            "price-desc" => books.OrderByDescending(x => x.Price).ThenBy(x => x.Id),
            "title" => books.OrderBy(x => x.Title).ThenBy(x => x.Id),
            "discount" => books.OrderByDescending(x => (x.ListPrice - x.Price) / x.ListPrice).ThenBy(x => x.Id),
            "bestseller" => books.OrderByDescending(b => sales.Where(x => x.BookId == b.Id).Sum(x => (int?)x.Quantity) ?? 0).ThenBy(x => x.Id),
            _ => books.OrderByDescending(x => x.CreatedAt).ThenByDescending(x => x.Id)
        };
        var model = new CatalogModel
        {
            Books = await books.Skip((page - 1) * 12).Take(12).ToListAsync(),
            Total = total, Page = page, Q = q, Category = category, Author = author, Kind = kind,
            Publisher = publisher, MinPrice = minPrice, MaxPrice = maxPrice,
            InStock = inStock, HasSample = hasSample, Sort = sort,
            Categories = await db.Categories.OrderBy(x => x.Id).ToListAsync(),
            Authors = await db.Authors.OrderBy(x => x.Name).ToListAsync(),
            Publishers = await db.Publishers.OrderBy(x => x.Name).ToListAsync()
        };
        if (!model.IsFiltered && page == 1 && sort == "new")
        {
            model.NewBooks = await ActiveBooks().Where(x => x.Stock > 0)
                .OrderByDescending(x => x.SourceUrl != "").ThenByDescending(x => x.CreatedAt).ThenByDescending(x => x.Id).Take(4).ToListAsync();
            model.SampleBooks = await ActiveBooks().Where(x => x.Stock > 0 && x.SampleText != "")
                .OrderBy(x => x.Price).ThenByDescending(x => x.Id).Take(4).ToListAsync();
            string[] themes = ["Văn học", "Kinh tế", "Kỹ năng sống", "Thiếu nhi", "Lịch sử & văn hóa", "Sức khỏe"];
            foreach (var theme in themes)
            {
                var c = model.Categories.FirstOrDefault(x => x.Name == theme);
                if (c == null) continue;
                var rows = await ActiveBooks().Where(x => x.CategoryId == c.Id && x.Stock > 0)
                    .OrderByDescending(x => x.SourceUrl != "").ThenByDescending(x => x.CreatedAt).ThenByDescending(x => x.Id).Take(4).ToListAsync();
                if (rows.Count > 0) model.ThemeShelves.Add(new HomeShelf { CategoryId = c.Id, Name = c.Name, Books = rows });
            }
            model.FeaturedAuthors = await db.Authors.AsNoTracking()
                .Where(a => db.Books.Any(b => b.AuthorId == a.Id && b.IsActive && b.SourceUrl != ""))
                .Select(a => new CatalogSpotlight { Id = a.Id, Name = a.Name, BookCount = db.Books.Count(b => b.AuthorId == a.Id && b.IsActive) })
                .Where(a => a.BookCount > 0).OrderByDescending(a => a.BookCount).ThenBy(a => a.Name).Take(6).ToListAsync();
            model.FeaturedPublishers = await db.Publishers.AsNoTracking()
                .Where(p => db.Books.Any(b => b.PublisherId == p.Id && b.IsActive && b.SourceUrl != ""))
                .Select(p => new CatalogSpotlight { Id = p.Id, Name = p.Name, BookCount = db.Books.Count(b => b.PublisherId == p.Id && b.IsActive) })
                .Where(p => p.BookCount > 0).OrderByDescending(p => p.BookCount).ThenBy(p => p.Name).Take(6).ToListAsync();
            model.DiscountBooks = await ActiveBooks().Where(x => x.Stock > 0 && x.ListPrice > x.Price)
                .OrderByDescending(x => (x.ListPrice - x.Price) / x.ListPrice).ThenBy(x => x.Id).Take(4).ToListAsync();
            model.BestSellers = await ActiveBooks().Where(b => sales.Any(x => x.BookId == b.Id))
                .OrderByDescending(b => sales.Where(x => x.BookId == b.Id).Sum(x => (int?)x.Quantity) ?? 0).ThenBy(x => x.Id).Take(4).ToListAsync();
            var ids = reading.Recent;
            var recent = await ActiveBooks().Where(b => ids.Contains(b.Id)).ToListAsync();
            model.RecentBooks = ids.Select(id => recent.FirstOrDefault(x => x.Id == id)).OfType<Book>().Take(4).ToList();
        }
        return View(model);
    }

    [HttpGet]
    public async Task<IActionResult> Suggest(string? q)
    {
        q = q?.Trim();
        if (string.IsNullOrEmpty(q) || q.Length < 2 || q.Length > 120) return Json(Array.Empty<object>());
        return Json(await db.Books.AsNoTracking().Where(b => b.IsActive &&
            (EF.Functions.Collate(b.Title, "Latin1_General_100_CI_AI").Contains(q) ||
             EF.Functions.Collate(b.Author.Name, "Latin1_General_100_CI_AI").Contains(q)))
            .OrderBy(b => b.Title).Take(6).Select(b => new { title = b.Title }).ToListAsync());
    }

    public IActionResult Policy() => View();
    public IActionResult Support() => View();
    public IActionResult About() => View();
    public IActionResult Guide(string topic = "reading")
    {
        if (topic is not ("reading" or "children" or "notes")) return NotFound();
        ViewBag.Topic = topic;
        return View();
    }
    public IActionResult Error() => View();
    public IActionResult Denied() => StatusCode(403, "Bạn không có quyền truy cập.");
}
