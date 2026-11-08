# Hướng dẫn Backend API cho BookStoreOnline

Phần API được thêm trực tiếp vào dự án MVC hiện tại, dùng chung `BookStoreContext`,
các bảng SQL Server và cơ chế đăng nhập Cookie có sẵn. Không tạo database mới
và không thay thế giao diện MVC.

## 1. Chạy dự án

1. Mở `BookStoreOnline.sln` bằng Visual Studio 2022.
2. Mở `appsettings.json`, kiểm tra chuỗi kết nối `BookStore`.
3. Chạy các file SQL theo thứ tự trong thư mục `Database` nếu đây là máy mới:
   `01_schema.sql`, sau đó `02_seed.sql` và các file nâng cấp cần thiết theo README.
4. Build và chạy dự án (F5).

Swagger API: `/swagger` trong môi trường Development.

## 2. Các API đã thêm

| Method | URL | Chức năng | Đăng nhập |
|---|---|---|---|
| GET | `/api/books` | Danh sách sách, tìm kiếm, lọc danh mục, phân trang | Không |
| GET | `/api/books/{id}` | Chi tiết sách | Không |
| GET | `/api/categories` | Danh sách danh mục | Không |
| POST | `/api/account/register` | Đăng ký | Không |
| POST | `/api/account/login` | Đăng nhập | Không |
| GET | `/api/account/me` | Thông tin tài khoản hiện tại | Có |
| POST | `/api/account/logout` | Đăng xuất | Có |
| GET | `/api/cart` | Xem giỏ hàng | Cookie phiên |
| POST | `/api/cart/items` | Thêm/cập nhật số lượng | Cookie phiên |
| DELETE | `/api/cart/items/{bookId}` | Xóa một sách khỏi giỏ | Cookie phiên |
| DELETE | `/api/cart` | Xóa giỏ hàng | Cookie phiên |
| GET | `/api/orders` | Lịch sử đơn hàng của tài khoản | Có |
| GET | `/api/orders/{id}` | Chi tiết đơn hàng của tài khoản | Có |
| POST | `/api/orders` | Tạo đơn hàng, thanh toán COD | Có |

## 3. Ví dụ dữ liệu

Đăng nhập (`POST /api/account/login`):
```json
{
  "email": "customer@example.com",
  "password": "MatKhauCuaBan"
}
```

Thêm sách vào giỏ (`POST /api/cart/items`):
```json
{
  "bookId": 1,
  "quantity": 2
}
```

Tạo đơn hàng (`POST /api/orders`):
```json
{
  "recipient": "Nguyen Van A",
  "phone": "0901234567",
  "address": "123 Duong ABC, Quan 1, TP HCM",
  "note": "Giao gio hanh chinh",
  "items": [
    {
      "bookId": 1,
      "quantity": 2
    }
  ]
}
```

## 4. Lưu ý

- API đăng nhập dùng Cookie Authentication hiện có, không dùng JWT. Khi gọi API từ
  frontend khác origin, cần cấu hình CORS và gửi cookie credentials phù hợp.
- Các API POST/DELETE trong nhóm API bỏ kiểm tra antiforgery để tiện gọi bằng JSON.
  Nếu triển khai công khai trên Internet, cần bổ sung cơ chế chống CSRF phù hợp,
  giới hạn tốc độ đăng nhập, HTTPS và cấu hình CORS theo đúng domain frontend.
- API tạo đơn chỉ cho phép người dùng đã đăng nhập; giá và tồn kho luôn lấy từ
  database, không tin giá do frontend gửi lên.
- Đơn hàng tạo qua API sử dụng COD và trạng thái `Chờ duyệt`, tương thích với
  các giá trị trạng thái đang có trong database.
- Không đưa mật khẩu thật hoặc chuỗi kết nối chứa thông tin nhạy cảm lên GitHub.
