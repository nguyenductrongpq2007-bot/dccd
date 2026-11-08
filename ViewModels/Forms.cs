using System.ComponentModel.DataAnnotations;
using BookStoreOnline.Models;
namespace BookStoreOnline.ViewModels;
public class LoginForm {
 [Required(ErrorMessage="Vui lòng nhập email."),EmailAddress(ErrorMessage="Email chưa đúng định dạng.")] public string Email {get;set;}="";
 [Required(ErrorMessage="Vui lòng nhập mật khẩu."),DataType(DataType.Password)] public string Password {get;set;}="";
}
public class RegisterForm {
 [Required(ErrorMessage="Vui lòng nhập email."),EmailAddress(ErrorMessage="Email chưa đúng định dạng.")] public string Email {get;set;}="";
 [Required(ErrorMessage="Vui lòng nhập họ tên."),StringLength(100,MinimumLength=2,ErrorMessage="Họ tên cần từ 2 đến 100 ký tự.")] public string FullName {get;set;}="";
 [Required(ErrorMessage="Vui lòng tạo mật khẩu."),StringLength(100,MinimumLength=8,ErrorMessage="Mật khẩu cần từ 8 đến 100 ký tự."),DataType(DataType.Password)] public string NewPassword {get;set;}="";
 [Required(ErrorMessage="Vui lòng nhập lại mật khẩu."),Compare(nameof(NewPassword),ErrorMessage="Hai mật khẩu chưa giống nhau."),DataType(DataType.Password)] public string ConfirmPassword {get;set;}="";
}
public class CheckoutForm {
 [Required(ErrorMessage="Vui lòng nhập tên người nhận."),StringLength(100,ErrorMessage="Tên người nhận tối đa 100 ký tự.")] public string Recipient {get;set;}="";
 [Required(ErrorMessage="Vui lòng nhập số điện thoại."),RegularExpression(@"^(0|\+84)[0-9]{9}$",ErrorMessage="Nhập 10 số bắt đầu bằng 0 hoặc số có mã +84, không có khoảng trắng.")] public string Phone {get;set;}="";
 [Required(ErrorMessage="Vui lòng nhập địa chỉ nhận sách."),StringLength(500,MinimumLength=10,ErrorMessage="Địa chỉ cần từ 10 đến 500 ký tự.")] public string Address {get;set;}="";
 [StringLength(1000,ErrorMessage="Ghi chú tối đa 1000 ký tự."),DisplayFormat(ConvertEmptyStringToNull=false)] public string Note {get;set;}="";
 [Required(ErrorMessage="Phiên đặt hàng chưa hợp lệ. Hãy mở lại giỏ hàng.")] public string Token {get;set;}="";
}
public class BookForm {
 [Required,StringLength(50)] public string Language {get;set;}="Tiếng Việt";
 [Required,StringLength(50)] public string Binding {get;set;}="Bìa mềm";
 [StringLength(50)] public string? Dimensions {get;set;}="";
 [StringLength(150)] public string? Translator {get;set;}="";
 [StringLength(500)] public string? SourceUrl {get;set;}=""; public int Id {get;set;} [Required,StringLength(250)] public string Title {get;set;}=""; [Required] public string Description {get;set;}=""; [Required,StringLength(30)] public string Isbn {get;set;}=""; [Range(1,int.MaxValue)] public int CategoryId {get;set;} [Range(1,int.MaxValue)] public int AuthorId {get;set;} [Range(1,int.MaxValue)] public int PublisherId {get;set;} [Range(1000,100000000)] public decimal Price {get;set;} [Range(1000,100000000)] public decimal ListPrice {get;set;} [Range(0,100000)] public int Stock {get;set;} [Range(1,10000)] public int Pages {get;set;} [Range(1900,2100)] public int Year {get;set;}=2026; [DisplayFormat(ConvertEmptyStringToNull=false)] public string SampleText {get;set;}=""; public bool IsActive {get;set;}=true; public IFormFile? Cover {get;set;} }
public record CartLine(Book Book,int Quantity) { public decimal Total => Book.Price*Quantity; }
public class CatalogModel {
 public string Kind {get;set;}="all";
 public List<Book> NewBooks {get;set;}=[];
 public List<Book> SampleBooks {get;set;}=[];
 public List<HomeShelf> ThemeShelves {get;set;}=[];
 public List<CatalogSpotlight> FeaturedAuthors {get;set;}=[];
 public List<CatalogSpotlight> FeaturedPublishers {get;set;}=[];
 public decimal? MinPrice {get;set;}
 public bool InStock {get;set;}
 public bool HasSample {get;set;}
 public bool IsFiltered => Kind!="all" || Q!=null || Category!=null || Author!=null || Publisher!=null || MinPrice!=null || MaxPrice!=null || InStock || HasSample;
 public List<Book> DiscountBooks {get;set;}=[];
 public List<Book> BestSellers {get;set;}=[];
 public List<Book> RecentBooks {get;set;}=[]; public List<Book> Books {get;set;}=[]; public List<Category> Categories {get;set;}=[]; public List<Author> Authors {get;set;}=[];public List<Publisher> Publishers {get;set;}=[];public string? Q {get;set;} public int? Category {get;set;}public int? Author {get;set;}public int? Publisher {get;set;}public decimal? MaxPrice {get;set;}public string Sort {get;set;}="new"; public int Page {get;set;}=1; public int Total {get;set;} public int PageCount => (int)Math.Ceiling(Total/12.0); }
public class AdminDashboard { public int BookCount {get;set;} public int UserCount {get;set;} public int Pending {get;set;} public decimal Revenue {get;set;} public List<Order> Orders {get;set;}=[]; }
public class HomeShelf { public int CategoryId {get;set;} public string Name {get;set;}=""; public List<Book> Books {get;set;}=[]; }
public class CatalogSpotlight { public int Id {get;set;} public string Name {get;set;}=""; public int BookCount {get;set;} }
