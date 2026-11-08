> BẢN NÂNG CẤP: Đọc BAT_DAU_VS2022.txt và HUONG_DAN_NANG_CAP.md trước. Database mới chạy 01 → 02 → 03 → 04; database có sẵn chỉ chạy 03 → 04. Các hướng dẫn dưới đây mô tả chức năng nền của dự án.

# Hướng dẫn cho người mới

## Bước 1 — Giải nén và mở dự án

Nhấp phải ZIP → Extract All. Mở thư mục BookStoreOnline_VS2022. Nhấp đúp BookStoreOnline.sln. Visual Studio 2022 17.14.16 của bạn hỗ trợ net8.0. Nếu thiếu SDK, cài .NET 8 SDK x64 (không phải chỉ Runtime), sau đó đóng và mở lại Visual Studio.

## Bước 2 — Tạo database

Mở SSMS → Server name `(localdb)\MSSQLLocalDB` → Authentication Windows → Connect. File → Open → File → chọn Database/01_schema.sql → Execute. Chọn Database/02_seed.sql → Execute. Refresh Databases → BookStoreOnline → Tables. Có 7 bảng: Categories, Authors, Publishers, Users, Books, Orders, OrderItems; Authors và Publishers là hai bảng độc lập. Không chạy seed lần thứ hai vì tên lookup là duy nhất.

## Bước 3 — Kiểm tra connection string

Trong Solution Explorer nhấp appsettings.json. Server phải trùng tên kết nối trong SSMS. Trong JSON, dấu gạch chéo ngược phải viết hai lần: `(localdb)\\MSSQLLocalDB`. Database là BookStoreOnline. Dùng Windows Authentication cho local; hosting dùng tài khoản SQL riêng và cấu hình Production ngoài source.

## Bước 4 — Thực hiện Database First

View → Terminal. Đảm bảo đường dẫn terminal ở thư mục BookStoreOnline_VS2022 (có csproj). Chạy `powershell -ExecutionPolicy Bypass -File scripts/scaffold.ps1`. Lệnh sinh lớp từ database, thay thế Models và Data/BookStoreContext. Không sửa schema bằng migration Code First. Khi đổi schema SQL, scaffold lại và kiểm tra build.

## Bước 5 — Chạy website

Trong terminal chạy `dotnet restore`, tiếp `dotnet build`, sau đó `dotnet dev-certs https --trust`. Chọn profile BookStoreOnline ở nút chạy trên thanh công cụ. F5. Website mở HTTPS tại localhost:7188. Nếu báo không kết nối database, kiểm tra SSMS và server ở appsettings.json trước.

## Bước 6 — Tạo tài khoản quản trị

Trên website nhấn Đăng nhập → Đăng ký ngay. Tạo tài khoản. Trong SSMS mở New Query, chạy UPDATE Users như README với đúng email đã đăng ký. Đăng xuất / đăng nhập lại. Thanh menu xuất hiện Quản trị.

## Bước 7 — Kiểm thử luồng khách hàng

Tìm sách, dùng bộ lọc, mở chi tiết, đọc ba trang, thêm vào giỏ, đổi số lượng, đặt hàng. Địa chỉ cần từ 10 ký tự; điện thoại 10 số bắt đầu bằng 0. Xem đơn BS000001. Tồn kho giảm theo số lượng. Tổng giá do server tính lại khi đặt; giá có thể thay đổi nếu admin cập nhật trước khi khách xác nhận.

## Bước 8 — Kiểm thử quản trị

Quản trị → Sách → Thêm sách. Thêm lookup tác giả/NXB trước nếu cần; sau khi thêm lookup quay lại form và điền sách. Upload ảnh JPG hoặc PNG, điền giá bìa ≥ giá bán, stock không âm. Trang mẫu phân cách bằng một dòng `---PAGE---`. Quản trị → Đơn hàng → Xem/xử lý → chọn Đang giao rồi Đã giao.

## Những lỗi hay gặp

- `dotnet` không nhận: cài SDK, khởi động lại Visual Studio / terminal.
- Login SQL thất bại: tên server hoặc authentication sai; kiểm tra kết nối SSMS.
- Không có bảng Books: chưa chạy schema hoặc sai database.
- Trùng tên danh mục: đã chạy seed trước đó; không chạy lại.
- Giỏ mất sau thời gian dài: giỏ dùng session 2 giờ. Đơn đã đặt vẫn nằm trong database.
- Không có menu Admin: UPDATE đúng email rồi đăng xuất và đăng nhập lại.
- HTTPS lỗi local: chạy dev-certs trust. Không truy cập HTTP để thử đăng nhập vì cookie dùng Secure.
