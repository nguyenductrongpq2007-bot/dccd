using System.Data;
using System.Security.Claims;
using BookStoreOnline.Data;
using BookStoreOnline.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BookStoreOnline.ApiControllers;

[ApiController]
[Route("api/orders")]
[Authorize]
[IgnoreAntiforgeryToken]
public class OrdersApiController(BookStoreContext db) : ControllerBase
{
    public class CreateOrderRequest
    {
        [System.ComponentModel.DataAnnotations.Required]
        [System.ComponentModel.DataAnnotations.StringLength(100)]
        public string Recipient { get; set; } = "";

        [System.ComponentModel.DataAnnotations.Required]
        [System.ComponentModel.DataAnnotations.RegularExpression(@"^(0|\+84)[0-9]{9}$")]
        public string Phone { get; set; } = "";

        [System.ComponentModel.DataAnnotations.Required]
        [System.ComponentModel.DataAnnotations.StringLength(500, MinimumLength = 10)]
        public string Address { get; set; } = "";

        [System.ComponentModel.DataAnnotations.StringLength(1000)]
        public string Note { get; set; } = "";

        [System.ComponentModel.DataAnnotations.Required]
        public List<OrderItemRequest> Items { get; set; } = [];
    }

    public class OrderItemRequest
    {
        public int BookId { get; set; }
        public int Quantity { get; set; }
    }

    [HttpGet]
    public async Task<IActionResult> GetMyOrders()
    {
        var userId = CurrentUserId();
        var orders = await db.Orders.AsNoTracking()
            .Include(x => x.OrderItems)
            .Where(x => x.UserId == userId)
            .OrderByDescending(x => x.CreatedAt)
            .Select(x => new
            {
                x.Id, x.CreatedAt, x.Status, x.PaymentMethod, x.Total,
                x.Recipient, x.Phone, x.Address,
                items = x.OrderItems.Select(i => new
                {
                    i.BookId, i.BookTitle, i.Quantity, i.UnitPrice
                })
            }).ToListAsync();

        return Ok(orders);
    }

    [HttpGet("{id:int}")]
    public async Task<IActionResult> GetOrder(int id)
    {
        var userId = CurrentUserId();
        var order = await db.Orders.AsNoTracking()
            .Include(x => x.OrderItems)
            .Where(x => x.Id == id && x.UserId == userId)
            .Select(x => new
            {
                x.Id, x.CreatedAt, x.Status, x.PaymentMethod, x.Total,
                x.ShippingFee, x.Recipient, x.Phone, x.Address, x.Note,
                items = x.OrderItems.Select(i => new
                {
                    i.BookId, i.BookTitle, i.Quantity, i.UnitPrice
                })
            }).FirstOrDefaultAsync();

        return order == null ? NotFound(new { message = "Không tìm thấy đơn hàng." }) : Ok(order);
    }

    [HttpPost]
    public async Task<IActionResult> CreateOrder(CreateOrderRequest request)
    {
        var userId = CurrentUserId();
        if (request.Items.Count == 0 || request.Items.Any(x => x.BookId <= 0 || x.Quantity <= 0 || x.Quantity > 20))
            return BadRequest(new { message = "Danh sách sách hoặc số lượng không hợp lệ." });

        var quantities = request.Items
            .GroupBy(x => x.BookId)
            .ToDictionary(g => g.Key, g => g.Sum(x => x.Quantity));

        if (quantities.Values.Any(x => x > 20))
            return BadRequest(new { message = "Mỗi đầu sách chỉ được đặt tối đa 20 cuốn." });

        await using var tx = await db.Database.BeginTransactionAsync(IsolationLevel.Serializable);

        var ids = quantities.Keys.ToList();
        var books = await db.Books
            .Where(x => ids.Contains(x.Id) && x.IsActive)
            .ToListAsync();

        if (books.Count != ids.Count || books.Any(x => x.Stock < quantities[x.Id]))
        {
            await tx.RollbackAsync();
            return Conflict(new { message = "Một số sách không còn đủ số lượng trong kho." });
        }

        var subtotal = books.Sum(x => x.Price * quantities[x.Id]);
        var shipping = subtotal >= 300000 ? 0 : 30000;
        var order = new Order
        {
            CheckoutKey = Guid.NewGuid().ToString("N"),
            UserId = userId,
            Recipient = request.Recipient.Trim(),
            Phone = request.Phone.StartsWith("+84") ? "0" + request.Phone[3..] : request.Phone,
            Address = request.Address.Trim(),
            Note = request.Note ?? "",
            ShippingFee = shipping,
            Total = subtotal + shipping,
            PaymentMethod = "COD",
            Status = "Chờ duyệt"
        };

        foreach (var book in books)
        {
            var quantity = quantities[book.Id];
            order.OrderItems.Add(new OrderItem
            {
                BookId = book.Id,
                BookTitle = book.Title,
                Quantity = quantity,
                UnitPrice = book.Price
            });
            book.Stock -= quantity;
        }

        db.Orders.Add(order);
        await db.SaveChangesAsync();
        await tx.CommitAsync();

        return CreatedAtAction(nameof(GetOrder), new { id = order.Id }, new
        {
            order.Id, order.Total, order.ShippingFee, order.Status,
            order.PaymentMethod, order.CreatedAt
        });
    }

    private int CurrentUserId()
    {
        var idText = User.FindFirstValue(ClaimTypes.NameIdentifier);
        return int.TryParse(idText, out var id) ? id : 0;
    }
}
