> BẢN NÂNG CẤP: Đọc BAT_DAU_VS2022.txt và HUONG_DAN_NANG_CAP.md trước. Database mới chạy 01 → 02 → 03 → 04; database có sẵn chỉ chạy 03 → 04. Các hướng dẫn dưới đây mô tả chức năng nền của dự án.

# Đối chiếu ảnh đề bài

| Yêu cầu | Mã nguồn | Cách kiểm tra |
|---|---|---|
| Đăng ký / đăng nhập | AccountController, Views/Account | Đăng ký, đăng nhập, đăng xuất |
| Danh mục / tìm kiếm / lọc | HomeController, CatalogModel | Kết hợp 3 bộ lọc cùng từ khóa |
| Chi tiết sách | BooksController.Details | Thông tin tác giả, NXB, giá, tồn kho |
| Đọc thử vài trang | BooksController.Sample | Chuyển trang 1 → 2 → 3 |
| Giỏ hàng | CartController, CartService | Thêm, cập nhật, xóa |
| Checkout | OrdersController.Checkout | Trừ tồn kho, lưu đơn SQL trong transaction |
| Lịch sử đơn | OrdersController.Index/Details | Chỉ chủ đơn được xem |
| CRUD Category | AdminController | Thêm, xem, sửa, xóa danh mục trống |
| CRUD Product + Upload ảnh | AdminController.EditBook/DeleteBook | Upload PNG/JPEG; sách đã có đơn chỉ ngừng bán |
| Quản lý đơn | AdminController.SetStatus | Chờ duyệt → Đang giao → Đã giao |
| Quản lý người dùng | AdminController.Users/ToggleUser | Khóa/mở khách hàng |
| ASP.NET MVC | ASP.NET Core MVC, Controllers + Razor | Không phải website HTML giả lập |
| Entity Framework Db First | Database/*.sql, scripts/scaffold.ps1 | Chạy SQL trước, reverse engineering EF Core sau |
| SQL Server | appsettings, SQL scripts | SQL Server/LocalDB thật |
| Bootstrap | _Layout, form/table/grid | Bootstrap 5.3.3 |
| LINQ | Home/Admin/Orders controllers | Where, OrderBy, Skip, Take, Sum |

Phiên bản cụ thể: .NET 8 / EF Core 8. Ảnh không ghi MVC5 / EF6 hay EDMX. Nếu giảng viên yêu cầu EDMX thì phải chuyển sang .NET Framework MVC5/EF6; không gọi EF Core là EF6.
