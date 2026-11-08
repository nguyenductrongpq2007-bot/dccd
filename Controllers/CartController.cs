using BookStoreOnline.Data;
using BookStoreOnline.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
namespace BookStoreOnline.Controllers;
public class CartController(BookStoreContext db, CartService cart) : Controller
{
 public async Task<IActionResult> Index()
 {
  var lines = await cart.Lines();
  var ids = lines.Select(x => x.Book.Id).ToList();
  ViewBag.Recommended = await db.Books.AsNoTracking().Include(x => x.Author).Include(x => x.Category).Include(x => x.Publisher)
    .Where(x => x.IsActive && x.Stock > 0 && !ids.Contains(x.Id)).OrderByDescending(x => x.SourceUrl != "")
    .ThenBy(x => x.Price).ThenByDescending(x => x.Id).Take(4).ToListAsync();
  return View(lines);
 }
 [HttpPost] public IActionResult Clear()
 {
  cart.Clear();TempData["Success"]="Đã xóa sách trong giỏ hàng.";return RedirectToAction("Index");
 }
 [HttpPost]
 public async Task<IActionResult> Add(int id, int quantity = 1, string? proceed = null)
 {
  bool quick = Request.Headers["X-Requested-With"].ToString() == "XMLHttpRequest" && proceed != "checkout";
  var b = await db.Books.FindAsync(id);
  if (b == null || !b.IsActive)
  {
   if (quick) return NotFound(new { ok=false, message="Sách hiện không còn bán. Hãy chọn một cuốn khác." });
   return NotFound();
  }
  var count = cart.Get().GetValueOrDefault(id) + Math.Clamp(quantity, 1, 20);
  if (count > b.Stock || count > 20)
  {
   const string message="Số lượng vượt quá tồn kho hoặc giới hạn 20 cuốn. Bạn có thể kiểm tra lại giỏ hàng.";
   if (quick) return Conflict(new { ok=false, message });
   TempData["Error"]=message;
   return RedirectToAction("Index");
  }
  cart.Set(id, count);
  if (quick) return Json(new { ok=true, count=cart.Count, message="Đã thêm sách vào giỏ hàng." });
  TempData["Success"]="Đã thêm sách vào giỏ hàng.";
  return proceed == "checkout" ? RedirectToAction("Checkout", "Orders") : RedirectToAction("Index");
 }
 [HttpPost]
 public async Task<IActionResult> Update(int id, int quantity)
 {
  var b = await db.Books.FindAsync(id);
  if (quantity > 0 && (b == null || !b.IsActive || quantity > b.Stock || quantity > 20)) TempData["Error"]="Số lượng không hợp lệ hoặc sách không còn bán.";
  else cart.Set(id, quantity);
  return RedirectToAction("Index");
 }
}
