using BookStoreOnline.Data;
using BookStoreOnline.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BookStoreOnline.ApiControllers;

[ApiController]
[Route("api/cart")]
[IgnoreAntiforgeryToken]
public class CartApiController(CartService cart, BookStoreContext db) : ControllerBase
{
    public class CartItemRequest
    {
        public int BookId { get; set; }
        public int Quantity { get; set; }
    }

    [HttpGet]
    public async Task<IActionResult> GetCart()
    {
        var lines = await cart.Lines();
        return Ok(new
        {
            items = lines.Select(x => new
            {
                x.Book.Id, x.Book.Title, x.Book.Price, x.Book.ImagePath,
                x.Quantity, x.Total
            }),
            totalQuantity = lines.Sum(x => x.Quantity),
            subtotal = lines.Sum(x => x.Total)
        });
    }

    [HttpPost("items")]
    public async Task<IActionResult> SetItem(CartItemRequest request)
    {
        if (request.BookId <= 0 || request.Quantity < 0 || request.Quantity > 20)
            return BadRequest(new { message = "Số lượng phải từ 0 đến 20." });

        var book = await db.Books.AsNoTracking()
            .FirstOrDefaultAsync(x => x.Id == request.BookId && x.IsActive);

        if (book == null)
            return NotFound(new { message = "Sách không tồn tại hoặc đã ngừng bán." });

        if (request.Quantity > book.Stock)
            return BadRequest(new { message = "Số lượng vượt quá tồn kho." });

        cart.Set(request.BookId, request.Quantity);
        return await GetCart();
    }

    [HttpDelete("items/{bookId:int}")]
    public async Task<IActionResult> RemoveItem(int bookId)
    {
        cart.Set(bookId, 0);
        return await GetCart();
    }

    [HttpDelete]
    public async Task<IActionResult> ClearCart()
    {
        cart.Clear();
        return Ok(new { message = "Đã xóa giỏ hàng." });
    }
}
