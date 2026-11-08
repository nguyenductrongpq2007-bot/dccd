using System.Text.Json;
using Microsoft.EntityFrameworkCore;
using BookStoreOnline.Data;
using BookStoreOnline.ViewModels;
namespace BookStoreOnline.Services;
public class CartService(IHttpContextAccessor access,BookStoreContext db) {
 private ISession Session => access.HttpContext!.Session;
 public Dictionary<int,int> Get() { try { return JsonSerializer.Deserialize<Dictionary<int,int>>(Session.GetString("Cart")??"{}")??[]; } catch(JsonException){return [];} }
 public void Set(int id,int quantity) { var cart=Get();if(quantity<=0)cart.Remove(id);else cart[id]=Math.Min(quantity,20);Session.SetString("Cart",JsonSerializer.Serialize(cart)); }
 public void Clear()=>Session.Remove("Cart");
 public async Task<List<CartLine>> Lines(){var cart=Get();var ids=cart.Keys.ToList();var books=await db.Books.AsNoTracking().Include(x=>x.Author).Where(x=>ids.Contains(x.Id)).ToListAsync();return books.Select(b=>new CartLine(b,cart[b.Id])).ToList();}
 public int Count=>Get().Values.Sum();
}
