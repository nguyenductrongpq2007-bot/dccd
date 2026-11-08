# Kết quả rà soát bản giao

- Đã kiểm tra cấu trúc source, số bảng SQL (7), dữ liệu seed (16 sách), cú pháp JSON, cấu trúc SVG và cặp khối C#/Razor.
- Kiểm tra logic preview qua DOM shim đạt: phân trang, bộ lọc kết hợp, kết quả trống, tổng tiền giỏ và trang đọc thử. Đây không phải kiểm thử browser.
- Đã kiểm tra cú pháp JavaScript của file xem giao diện bằng node --check.
- SQL có UNIQUE CheckoutKey để chặn tạo đơn trùng cùng phiên xác nhận; giá/tồn kho đọc từ SQL khi checkout trong transaction Serializable.
- Models sử dụng navigation OrderItems phù hợp tên navigation reverse engineering từ bảng OrderItems.
- Trang đọc thử xử lý cả xuống dòng Windows CRLF và LF.
- Giá trong Razor định dạng vi-VN.
- Chưa chạy compiler C#/Razor, scaffold, SQL scripts hay kiểm thử browser/backend vì môi trường không có .NET SDK / SQL Server. Đây là giới hạn kiểm chứng, không phải xác nhận mọi luồng đã PASS.

Tiếp tục bằng scripts/verify.ps1 và docs/KIEM_THU.md trên máy Windows.

## Bản Visual Studio 2022

Đã kiểm tra target net8.0 / C#12, EF Core 8.0.30 cho tất cả package và local tool, cấu hình SDK nhánh 8.0; không còn cấu hình net10.0. So sánh nội dung xác nhận Controllers, Models, Data, Views, Services, ViewModels, SQL và tài nguyên giao diện không thay đổi. Chưa chạy build thực tế vì môi trường không có SDK.

## Sửa theo lỗi build thực tế trong ảnh ngày 10/10/2026

- Sửa @page bị Razor hiểu là directive bằng currentPage / biểu thức tường minh.
- Sửa thẻ đóng tr sai cú pháp trong hai view chi tiết đơn; trình bày lại foreach / HTML nhiều dòng.
- Rà soát toàn bộ views không còn hai mẫu lỗi, đối chiếu cặp thẻ bảng trong hai view.
- Chưa xác nhận build thành công; cần Rebuild trên máy có SDK.
