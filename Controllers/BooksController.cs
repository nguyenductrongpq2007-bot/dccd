using BookStoreOnline.Data;
using BookStoreOnline.Models;
using BookStoreOnline.Services;
using BookStoreOnline.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
namespace BookStoreOnline.Controllers;

public class BooksController(BookStoreContext db, ReadingListService reading) : Controller
{
    private IQueryable<Book> ActiveBooks() => db.Books.AsNoTracking()
        .Include(x => x.Author).Include(x => x.Category).Include(x => x.Publisher).Where(x => x.IsActive);

    public async Task<IActionResult> Details(int id)
    {
        var b = await ActiveBooks().FirstOrDefaultAsync(x => x.Id == id);
        if (b == null) return NotFound();
        reading.Remember(id);
        return View(new BookDetailsModel
        {
            Book = b,
            Related = await ActiveBooks().Where(x => x.Id != id && x.CategoryId == b.CategoryId)
                .OrderByDescending(x => x.Stock > 0).ThenByDescending(x => x.CreatedAt).ThenByDescending(x => x.Id).Take(4).ToListAsync(),
            Sold = await db.OrderItems.Where(x => x.BookId == id && x.Order.Status == "Đã giao").SumAsync(x => (int?)x.Quantity) ?? 0
        });
    }

    public async Task<IActionResult> Sample(int id, int page = 1)
    {
        var b = await db.Books.AsNoTracking().FirstOrDefaultAsync(x => x.Id == id && x.IsActive);
        if (b == null) return NotFound();
        var pages = b.SampleText.Replace("\r\n", "\n").Split("\n---PAGE---\n", StringSplitOptions.RemoveEmptyEntries)
            .Where(x => !string.IsNullOrWhiteSpace(x)).ToArray();
        if (pages.Length == 0)
        {
            TempData["Error"] = "Cuốn sách này chưa có trang đọc thử. Bạn có thể xem giới thiệu và thông tin sách.";
            return RedirectToAction(nameof(Details), new { id });
        }
        ViewBag.Page = Math.Clamp(page, 1, pages.Length);
        ViewBag.PageCount = pages.Length;
        ViewBag.Text = pages[(int)ViewBag.Page - 1];
        return View(b);
    }

    public async Task<IActionResult> Favorites()
    {
        var ids = reading.Favorites;
        var books = await ActiveBooks().Where(x => ids.Contains(x.Id)).ToListAsync();
        return View("ReadingList", new ReadingListModel
        {
            Title = "Tủ sách yêu thích", Description = "Lưu lại những cuốn sách bạn muốn đọc. Danh sách lưu trong phiên trình duyệt hiện tại.",
            Books = ids.Select(id => books.FirstOrDefault(x => x.Id == id)).OfType<Book>().ToList()
        });
    }

    public async Task<IActionResult> Recent()
    {
        var ids = reading.Recent;
        var books = await ActiveBooks().Where(x => ids.Contains(x.Id)).ToListAsync();
        return View("ReadingList", new ReadingListModel
        {
            Title = "Sách bạn vừa xem", Description = "12 cuốn sách được xem gần đây trong phiên trình duyệt hiện tại.",
            Books = ids.Select(id => books.FirstOrDefault(x => x.Id == id)).OfType<Book>().ToList()
        });
    }

    [HttpPost]
    public async Task<IActionResult> ToggleFavorite(int id, string? returnUrl)
    {
        bool quick = Request.Headers["X-Requested-With"].ToString() == "XMLHttpRequest";
        if (!await db.Books.AnyAsync(x => x.Id == id && x.IsActive))
            return quick ? NotFound(new { ok=false, message="Sách hiện không còn bán." }) : NotFound();
        bool saved = reading.Toggle(id);
        string message = saved ? "Đã lưu vào tủ sách yêu thích." : "Đã bỏ khỏi tủ sách yêu thích.";
        if (quick) return Json(new { ok=true, id, saved, count=reading.Favorites.Count, message });
        TempData["Success"] = message;
        return Url.IsLocalUrl(returnUrl) ? LocalRedirect(returnUrl!) : RedirectToAction(nameof(Favorites));
    }
}
