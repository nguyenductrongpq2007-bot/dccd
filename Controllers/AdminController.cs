using System.Data;
using System.Security.Claims;
using BookStoreOnline.Data;
using BookStoreOnline.Models;
using BookStoreOnline.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
namespace BookStoreOnline.Controllers;
[Authorize(Roles="Admin")] public class AdminController(BookStoreContext db,IWebHostEnvironment env):Controller {
 public override async Task OnActionExecutionAsync(Microsoft.AspNetCore.Mvc.Filters.ActionExecutingContext context,Microsoft.AspNetCore.Mvc.Filters.ActionExecutionDelegate next){var id=int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);if(!await db.Users.AnyAsync(x=>x.Id==id&&x.IsActive&&x.Role=="Admin")){context.Result=Forbid();return;}await next();}
 public async Task<IActionResult> Index()=>View(new AdminDashboard{BookCount=await db.Books.CountAsync(),UserCount=await db.Users.CountAsync(),Pending=await db.Orders.CountAsync(x=>x.Status=="Chờ duyệt"),Revenue=await db.Orders.Where(x=>x.Status=="Đã giao").SumAsync(x=>(decimal?)x.Total)??0,Orders=await db.Orders.Include(x=>x.User).OrderByDescending(x=>x.Id).Take(8).ToListAsync()});
 public async Task<IActionResult> Books(string? q){var books=db.Books.Include(x=>x.Category).Include(x=>x.Author).AsQueryable();if(!string.IsNullOrWhiteSpace(q))books=books.Where(x=>x.Title.Contains(q));return View(await books.OrderByDescending(x=>x.Id).ToListAsync());}
 private async Task Lookups(){ViewBag.Categories=await db.Categories.OrderBy(x=>x.Name).ToListAsync();ViewBag.Authors=await db.Authors.OrderBy(x=>x.Name).ToListAsync();ViewBag.Publishers=await db.Publishers.OrderBy(x=>x.Name).ToListAsync();}
 public async Task<IActionResult> EditBook(int? id){await Lookups();if(id==null)return View(new BookForm());var b=await db.Books.FindAsync(id);if(b==null)return NotFound();ViewBag.Image=b.ImagePath;return View(new BookForm{Id=b.Id,Title=b.Title,Description=b.Description,Isbn=b.Isbn,CategoryId=b.CategoryId,AuthorId=b.AuthorId,PublisherId=b.PublisherId,Price=b.Price,ListPrice=b.ListPrice,Stock=b.Stock,Pages=b.Pages,Year=b.Year,SampleText=b.SampleText,IsActive=b.IsActive,Language=b.Language,Binding=b.Binding,Dimensions=b.Dimensions,Translator=b.Translator,SourceUrl=b.SourceUrl});}
 [HttpPost,RequestSizeLimit(6_000_000)] public async Task<IActionResult> EditBook(BookForm f){
 await Lookups();
 if(!string.IsNullOrWhiteSpace(f.SourceUrl) && (!Uri.TryCreate(f.SourceUrl,UriKind.Absolute,out var sourceUri) || (sourceUri.Scheme!="https" && sourceUri.Scheme!="http"))) ModelState.AddModelError("SourceUrl","Đường dẫn nguồn phải bắt đầu bằng https:// hoặc http://.");
 if(f.ListPrice<f.Price)ModelState.AddModelError("ListPrice","Giá bìa phải lớn hơn hoặc bằng giá bán.");
 if(!await db.Categories.AnyAsync(x=>x.Id==f.CategoryId)||!await db.Authors.AnyAsync(x=>x.Id==f.AuthorId)||!await db.Publishers.AnyAsync(x=>x.Id==f.PublisherId))ModelState.AddModelError("","Danh mục, tác giả hoặc nhà xuất bản không hợp lệ.");
 byte[]? bytes=null;string? ext=null;
 if(f.Cover!=null){if(f.Cover.Length>5_000_000||f.Cover.Length<12)ModelState.AddModelError("Cover","Ảnh phải dưới 5 MB.");else{using var ms=new MemoryStream();await f.Cover.CopyToAsync(ms);bytes=ms.ToArray();ext=bytes[0]==0xff&&bytes[1]==0xd8&&bytes[2]==0xff?".jpg":bytes.Take(8).SequenceEqual(new byte[]{137,80,78,71,13,10,26,10})?".png":null;if(ext==null)ModelState.AddModelError("Cover","Chỉ nhận ảnh JPEG hoặc PNG thực.");}}
 if(!ModelState.IsValid)return View(f);var b=f.Id==0?new Book():await db.Books.FindAsync(f.Id);if(b==null)return NotFound();
 b.Title=f.Title.Trim();b.Description=f.Description;b.Isbn=f.Isbn;b.CategoryId=f.CategoryId;b.AuthorId=f.AuthorId;b.PublisherId=f.PublisherId;b.Price=f.Price;b.ListPrice=f.ListPrice;b.Stock=f.Stock;b.Pages=f.Pages;b.Year=f.Year;b.SampleText=f.SampleText??"";b.IsActive=f.IsActive;
 b.Language=f.Language.Trim();b.Binding=f.Binding.Trim();b.Dimensions=f.Dimensions?.Trim()??"";
 b.Translator=f.Translator?.Trim()??"";b.SourceUrl=f.SourceUrl?.Trim()??"";
 if(bytes!=null&&ext!=null){var dir=Path.Combine(env.WebRootPath,"uploads");Directory.CreateDirectory(dir);var filename=Guid.NewGuid().ToString("N")+ext;await System.IO.File.WriteAllBytesAsync(Path.Combine(dir,filename),bytes);b.ImagePath="/uploads/"+filename;}
 if(string.IsNullOrEmpty(b.ImagePath))b.ImagePath="/images/default.svg";if(f.Id==0)db.Books.Add(b);await db.SaveChangesAsync();TempData["Success"]="Đã lưu sách.";return RedirectToAction("Books");}
 [HttpPost] public async Task<IActionResult> DeleteBook(int id){var b=await db.Books.FindAsync(id);if(b==null)return NotFound();if(await db.OrderItems.AnyAsync(x=>x.BookId==id)){b.IsActive=false;TempData["Success"]="Sách có trong đơn hàng nên được ngừng bán để giữ lịch sử.";}else db.Books.Remove(b);await db.SaveChangesAsync();return RedirectToAction("Books");}
 public async Task<IActionResult> Categories()=>View(await db.Categories.OrderBy(x=>x.Name).ToListAsync());
 [HttpPost] public async Task<IActionResult> SaveCategory(int id,string name){if(string.IsNullOrWhiteSpace(name)||name.Trim().Length>100){TempData["Error"]="Tên danh mục từ 1 đến 100 ký tự.";return RedirectToAction("Categories");}if(await db.Categories.AnyAsync(x=>x.Name==name.Trim()&&x.Id!=id)){TempData["Error"]="Tên danh mục đã tồn tại.";return RedirectToAction("Categories");}var c=id==0?new Category():await db.Categories.FindAsync(id);if(c==null)return NotFound();c.Name=name.Trim();if(id==0)db.Categories.Add(c);await db.SaveChangesAsync();return RedirectToAction("Categories");}
 [HttpPost] public async Task<IActionResult> DeleteCategory(int id){var c=await db.Categories.FindAsync(id);if(c==null)return NotFound();if(await db.Books.AnyAsync(x=>x.CategoryId==id))TempData["Error"]="Danh mục đang có sách, không thể xóa.";else{db.Categories.Remove(c);await db.SaveChangesAsync();}return RedirectToAction("Categories");}
 public async Task<IActionResult> Orders()=>View(await db.Orders.Include(x=>x.User).OrderByDescending(x=>x.Id).ToListAsync());
 public async Task<IActionResult> Order(int id){var o=await db.Orders.Include(x=>x.OrderItems).Include(x=>x.User).FirstOrDefaultAsync(x=>x.Id==id);return o==null?NotFound():View(o);}
 [HttpPost] public async Task<IActionResult> SetStatus(int id,string status){await using var tx=await db.Database.BeginTransactionAsync(IsolationLevel.Serializable);var o=await db.Orders.FindAsync(id);if(o==null)return NotFound();bool valid=(o.Status=="Chờ duyệt"&&status=="Đang giao")||(o.Status=="Đang giao"&&status=="Đã giao");if(!valid){TempData["Error"]="Chỉ chuyển Chờ duyệt → Đang giao → Đã giao.";}else{o.Status=status;await db.SaveChangesAsync();await tx.CommitAsync();}return RedirectToAction("Order",new{id});}
 public async Task<IActionResult> Users()=>View(await db.Users.OrderByDescending(x=>x.Id).ToListAsync());
 [HttpPost] public async Task<IActionResult> ToggleUser(int id){var u=await db.Users.FindAsync(id);if(u==null)return NotFound();if(u.Role=="Admin"){TempData["Error"]="Không khóa tài khoản quản trị trong chức năng này.";}else{u.IsActive=!u.IsActive;await db.SaveChangesAsync();}return RedirectToAction("Users");}
 [HttpPost] public async Task<IActionResult> AddLookup(string kind,string name){if(string.IsNullOrWhiteSpace(name)||name.Trim().Length>150)return BadRequest();name=name.Trim();if(kind=="author"&&!await db.Authors.AnyAsync(x=>x.Name==name))db.Authors.Add(new Author{Name=name});else if(kind=="publisher"&&!await db.Publishers.AnyAsync(x=>x.Name==name))db.Publishers.Add(new Publisher{Name=name});await db.SaveChangesAsync();return RedirectToAction("EditBook");}
}
