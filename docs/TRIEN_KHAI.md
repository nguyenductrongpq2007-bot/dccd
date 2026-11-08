# Triển khai IIS / hosting ASP.NET

1. Kiểm tra gói hosting hỗ trợ ASP.NET Core .NET 8 và SQL Server trước khi publish. Source này không chạy trên hosting chỉ có .NET Framework 4.x. SmarterASP.NET cần kiểm tra phiên bản runtime gói tài khoản hiện có.
2. Tạo SQL database hosting. Với tài khoản không được CREATE DATABASE, bỏ phần USE master / CREATE DATABASE / USE BookStoreOnline trong schema, chọn database được cấp rồi chạy CREATE TABLE. Chạy seed trong đúng database được cấp; sửa/bỏ USE BookStoreOnline ở seed tương tự.
3. Thiết lập ConnectionStrings__BookStore bằng cấu hình môi trường hosting hoặc appsettings.Production.json ở server. Không lưu mật khẩu thật vào git/ZIP source. Production dùng TLS SQL theo nhà cung cấp; không giữ TrustServerCertificate=True nếu có chứng chỉ đúng.
4. Visual Studio → nhấp phải project BookStoreOnline → Publish → Folder → Release. Hoặc `dotnet publish -c Release -o publish`.
5. Upload NỘI DUNG thư mục publish vào root website; không upload source .csproj để chạy. Với IIS tự quản lý cần ASP.NET Core Hosting Bundle .NET 8. Dùng HTTPS, môi trường ASPNETCORE_ENVIRONMENT=Production.
6. Cấp quyền ghi cho wwwroot/uploads. Sao lưu thư mục này cùng SQL database. Thiết lập Data Protection key storage bền vững trước khi scale/restart dài hạn; chọn cache session chia sẻ nếu dùng nhiều instance.
7. Tạo tài khoản đầu tiên, nâng quyền Admin trong SQL, kiểm thử checklist. Không phát hành với thông tin doanh nghiệp/chính sách mẫu. Nhập sách thật, ảnh bìa và trích đọc thử có quyền sử dụng; thay giá, tồn kho, thông tin liên hệ và các điều khoản thực tế.
8. Bản này chỉ COD, chưa nối nhà vận chuyển, hóa đơn điện tử, email hay cổng thanh toán. Cần hợp đồng/API và credential thật nếu triển khai các tích hợp đó; không dùng trang thành công giả để xác nhận thanh toán.

Mã nguồn có các lớp bảo vệ cơ bản nhưng chưa là chứng nhận sẵn sàng production. Trước khi mở kinh doanh: build/runtime QA, kiểm thử đồng thời, monitoring/logging, backup/restore, chính sách lưu dữ liệu, rate limiting đăng nhập và đánh giá bảo mật độc lập theo quy mô vận hành.
