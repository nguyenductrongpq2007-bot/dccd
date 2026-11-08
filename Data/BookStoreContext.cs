using Microsoft.EntityFrameworkCore;
using BookStoreOnline.Models;
namespace BookStoreOnline.Data;
// Mapping mirrors Database/01_schema.sql. Database is authoritative; regenerate with scripts/scaffold.ps1.
public partial class BookStoreContext(DbContextOptions<BookStoreContext> options) : DbContext(options) {
 public DbSet<Book> Books => Set<Book>(); public DbSet<Category> Categories => Set<Category>(); public DbSet<Author> Authors => Set<Author>(); public DbSet<Publisher> Publishers => Set<Publisher>(); public DbSet<User> Users => Set<User>(); public DbSet<Order> Orders => Set<Order>(); public DbSet<OrderItem> OrderItems => Set<OrderItem>();
 protected override void OnModelCreating(ModelBuilder m) {
  m.Entity<Category>().ToTable("Categories").Property(x=>x.Name).HasMaxLength(100); m.Entity<Author>().ToTable("Authors").Property(x=>x.Name).HasMaxLength(150); m.Entity<Publisher>().ToTable("Publishers").Property(x=>x.Name).HasMaxLength(150);
  m.Entity<Book>(e=>{e.ToTable("Books");
 e.Property(x=>x.Language).HasMaxLength(50); e.Property(x=>x.Binding).HasMaxLength(50);
 e.Property(x=>x.Dimensions).HasMaxLength(50); e.Property(x=>x.Translator).HasMaxLength(150);
 e.Property(x=>x.SourceUrl).HasMaxLength(500); e.Property(x=>x.Title).HasMaxLength(250); e.Property(x=>x.Isbn).HasMaxLength(30); e.Property(x=>x.ImagePath).HasMaxLength(300); e.Property(x=>x.Price).HasPrecision(18,0);e.Property(x=>x.ListPrice).HasPrecision(18,0);e.HasOne(x=>x.Category).WithMany().HasForeignKey(x=>x.CategoryId).OnDelete(DeleteBehavior.Restrict);e.HasOne(x=>x.Author).WithMany().HasForeignKey(x=>x.AuthorId).OnDelete(DeleteBehavior.Restrict);e.HasOne(x=>x.Publisher).WithMany().HasForeignKey(x=>x.PublisherId).OnDelete(DeleteBehavior.Restrict);});
  m.Entity<User>(e=>{e.ToTable("Users");e.Property(x=>x.Email).HasMaxLength(254);e.HasIndex(x=>x.Email).IsUnique(); e.Property(x=>x.FullName).HasMaxLength(100);e.Property(x=>x.Role).HasMaxLength(20);e.Property(x=>x.PasswordHash).HasMaxLength(600);});
  m.Entity<Order>(e=>{e.ToTable("Orders");e.Property(x=>x.CheckoutKey).HasMaxLength(32);e.HasIndex(x=>x.CheckoutKey).IsUnique();e.Property(x=>x.Recipient).HasMaxLength(100);e.Property(x=>x.Phone).HasMaxLength(20);e.Property(x=>x.Address).HasMaxLength(500);e.Property(x=>x.Note).HasMaxLength(1000);e.Property(x=>x.Status).HasMaxLength(30);e.Property(x=>x.PaymentMethod).HasMaxLength(20);e.Property(x=>x.Total).HasPrecision(18,0);e.Property(x=>x.ShippingFee).HasPrecision(18,0);e.HasOne(x=>x.User).WithMany().HasForeignKey(x=>x.UserId).OnDelete(DeleteBehavior.Restrict);});
  m.Entity<OrderItem>(e=>{e.ToTable("OrderItems");e.Property(x=>x.UnitPrice).HasPrecision(18,0);e.Property(x=>x.BookTitle).HasMaxLength(250);e.HasOne(x=>x.Order).WithMany(x=>x.OrderItems).HasForeignKey(x=>x.OrderId);e.HasOne(x=>x.Book).WithMany().HasForeignKey(x=>x.BookId).OnDelete(DeleteBehavior.Restrict);});
 }
}
