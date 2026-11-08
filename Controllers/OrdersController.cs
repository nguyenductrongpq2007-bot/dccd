using System.Data;
using Microsoft.AspNetCore.Authentication;
using System.Security.Claims;
using BookStoreOnline.Data;
using BookStoreOnline.Models;
using BookStoreOnline.Services;
using BookStoreOnline.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
namespace BookStoreOnline.Controllers;
[Authorize] public class OrdersController(BookStoreContext db,CartService cart):Controller {
 private int UserId=>int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);
 public async Task<IActionResult> Index()=>View(await db.Orders.AsNoTracking().Include(x=>x.OrderItems).Where(x=>x.UserId==UserId).OrderByDescending(x=>x.Id).ToListAsync());
 [HttpGet] public async Task<IActionResult> Checkout()
 {
  var lines=await cart.Lines();if(lines.Count==0)return RedirectToAction("Index","Cart");
  var last=await db.Orders.AsNoTracking().Where(x=>x.UserId==UserId).OrderByDescending(x=>x.Id).FirstOrDefaultAsync();
  var token=Guid.NewGuid().ToString("N");HttpContext.Session.SetString("CheckoutToken",token);
  ViewBag.Lines=lines;ViewBag.AddressPrefilled=last!=null;
  return View(new CheckoutForm{Recipient=last?.Recipient??User.Identity!.Name??"",Phone=last?.Phone??"",Address=last?.Address??"",Token=token});
 }
 [HttpPost] public async Task<IActionResult> Checkout(CheckoutForm f){ViewBag.Lines=await cart.Lines();if(!ModelState.IsValid)return View(f);if(f.Phone.StartsWith("+84"))f.Phone="0"+f.Phone[3..];if(f.Token!=HttpContext.Session.GetString("CheckoutToken")){TempData["Error"]="Phiên đặt hàng hết hạn hoặc đã hoàn tất. Vui lòng kiểm tra lịch sử đơn hàng.";return RedirectToAction("Index");}
 if(!await db.Users.AnyAsync(x=>x.Id==UserId&&x.IsActive)){await HttpContext.SignOutAsync();return RedirectToAction("Login","Account");}
 var quantities=cart.Get();if(quantities.Count==0)return RedirectToAction("Index","Cart");
 await using var tx=await db.Database.BeginTransactionAsync(IsolationLevel.Serializable);
 var ids=quantities.Keys.ToList();var books=await db.Books.Where(x=>ids.Contains(x.Id)).ToListAsync();
 if(books.Count!=ids.Count||books.Any(x=>!x.IsActive||x.Stock<quantities[x.Id])){ModelState.AddModelError("","Một số sách đã hết hàng. Hãy cập nhật giỏ hàng.");await tx.RollbackAsync();return View(f);}
 var subtotal=books.Sum(x=>x.Price*quantities[x.Id]);var shipping=subtotal>=300000?0:30000;
 var order=new Order{CheckoutKey=f.Token,UserId=UserId,Recipient=f.Recipient.Trim(),Phone=f.Phone,Address=f.Address.Trim(),Note=f.Note??"",ShippingFee=shipping,Total=subtotal+shipping};
 foreach(var b in books){order.OrderItems.Add(new OrderItem{BookId=b.Id,BookTitle=b.Title,Quantity=quantities[b.Id],UnitPrice=b.Price});b.Stock-=quantities[b.Id];}
 db.Orders.Add(order);
 try { await db.SaveChangesAsync(); await tx.CommitAsync(); }
 catch(DbUpdateException) { await tx.RollbackAsync();db.ChangeTracker.Clear();var existing=await db.Orders.AsNoTracking().FirstOrDefaultAsync(x=>x.CheckoutKey==f.Token&&x.UserId==UserId);if(existing==null)throw;cart.Clear();HttpContext.Session.Remove("CheckoutToken");return RedirectToAction("Details",new{id=existing.Id}); }
cart.Clear();HttpContext.Session.Remove("CheckoutToken");TempData["Success"]=$"Đặt hàng thành công! Mã đơn BS{order.Id:D6}. Thanh toán khi nhận hàng.";return RedirectToAction("Details",new{id=order.Id});
 }
 [HttpPost]
 public async Task<IActionResult> Reorder(int id)
 {
  var order=await db.Orders.AsNoTracking().Include(x=>x.OrderItems).FirstOrDefaultAsync(x=>x.Id==id&&x.UserId==UserId);
  if(order==null)return NotFound();
  var wanted=order.OrderItems.GroupBy(x=>x.BookId).ToDictionary(x=>x.Key,x=>x.Sum(i=>i.Quantity));
  var ids=wanted.Keys.ToList();
  var available=await db.Books.AsNoTracking().Where(x=>ids.Contains(x.Id)&&x.IsActive&&x.Stock>0).ToListAsync();
  var existing=cart.Get();int added=0;bool changed=false;
  foreach(var pair in wanted)
  {
   var book=available.FirstOrDefault(x=>x.Id==pair.Key);
   var current=existing.GetValueOrDefault(pair.Key);
   var quantity=book==null?0:Math.Max(0,Math.Min(pair.Value,Math.Min(20-current,book.Stock-current)));
   if(quantity>0){cart.Set(pair.Key,current+quantity);added+=quantity;}
   if(quantity<pair.Value)changed=true;
  }
  TempData[added>0?"Success":"Error"]=added>0
   ?$"Đã thêm {added} cuốn vào giỏ. Giá được cập nhật theo hiện tại."+(changed?" Một số sách hết hàng hoặc vượt giới hạn nên chưa thêm đủ.":"")
   :"Chưa thể thêm sách từ đơn này. Sách có thể đã hết hàng hoặc giỏ đã đạt giới hạn.";
  return RedirectToAction("Index","Cart");
 }
 public async Task<IActionResult> Details(int id){var order=await db.Orders.AsNoTracking().Include(x=>x.OrderItems).FirstOrDefaultAsync(x=>x.Id==id&&x.UserId==UserId);return order==null?NotFound():View(order);}
}
