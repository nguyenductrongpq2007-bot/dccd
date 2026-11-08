# Xác minh bản nâng cấp

- PASS: cấu hình XML/JSON của dự án .NET 8.
- PASS: tất cả bìa SVG parse được và đường dẫn ảnh của 32 sách mới tồn tại.
- PASS: mã sách mới không trùng trong bộ dữ liệu, giá bán không vượt giá bìa, tồn kho không âm.
- PASS: 24 sách tự biên soạn có 3 trang mẫu; 8 sách có thật không bị gán mẫu tự viết.
- PASS: các trường mới khớp giữa SQL, model, context, form và controller quản trị.
- PASS: node --check cho JavaScript dùng trên website và bản xem thử.
- PASS: kiểm tra bản xem thử bằng mô phỏng DOM: 48 sách, tìm theo tên, khoảng giá kể cả đảo cận, còn hàng, có mẫu, sắp xếp, phân trang, yêu thích, vừa xem, đọc thử 3 trang, giới hạn số lượng và ngưỡng miễn phí giao hàng.
## Kiểm tra bổ sung cho bản trải nghiệm ngày 11/10/2026

- PASS: node --check cho site.js và JavaScript bản xem thử mới.
- PASS: mô phỏng DOM cho thêm giỏ thành công, phản hồi hết/vượt tồn kho, lỗi mạng và phản hồi HTML ngoài dự kiến; thông báo không tự thêm lại; nút được khôi phục.
- PASS: mô phỏng xác nhận payload chứa token CSRF và same-origin; cập nhật hai bộ đếm giỏ, bỏ qua lần gửi lặp khi đang xử lý, nút Mua ngay dùng gửi form thông thường.
- PASS: mô phỏng nút hiện/ẩn mật khẩu và thu gọn bộ lọc trên điện thoại.
- PASS: so sánh byte tất cả tệp SQL với bản 48 sách trước: không thay đổi, không cần migration mới.
- PASS (kiểm tra mã nguồn): global antiforgery, lọc đơn theo chủ sở hữu, giao dịch Serializable khi checkout và kiểm tra local returnUrl được giữ. Đây không phải kiểm thử bảo mật/runtime.
- PASS: kiểm tra UTF-8 không có ký tự thay thế, cấu hình XML/JSON và bìa SVG parse được.

Các controller Cart, Account và Orders đã thay đổi để thêm giỏ AJAX, tiếp tục thanh toán sau đăng ký, điền địa chỉ đơn gần nhất, chuẩn hóa +84 và mua lại. Ghi chú checkout có thể bỏ trống. Các điểm này phải kiểm tra thực tế trên Windows theo checklist cuối HUONG_DAN_NANG_CAP.md.

Chưa kiểm tra: build C#/Razor, SQL Server, EF translation, đăng nhập/checkout thực tế và render giao diện trên trình duyệt. Môi trường tạo tệp không có .NET SDK, SQL Server hoặc binary trình duyệt. Chạy scripts/verify.ps1 và checklist trong HUONG_DAN_NANG_CAP.md trên máy Windows.


## Bản trang chủ mở rộng

- PASS: bản xem thử 72 sách; bộ lọc 70 sách còn hàng và 62 sách còn hàng có mẫu; phân trang 6 trang.
- PASS: mô phỏng tủ sách chủ đề, lọc tác giả/NXB, bài hướng dẫn, trang hỗ trợ và giới thiệu.
- PASS: mô phỏng tab tủ sách trong site.js: chọn theo hash, click, phím mũi tên, Home/End và thuộc tính ARIA.
- PASS: JavaScript bản thật và bản xem thử parse được; các kiểm tra giỏ trước vẫn qua.
- 24 sách DEMO-HOME và SQL 05 được kiểm tra cấu trúc/dữ liệu tĩnh. Chưa chạy SQL hoặc xác minh truy vấn EF.

Các kết quả về 48 sách ở trên thuộc bản trước. Bản hiện tại có thêm SQL 05; phải chạy để nạp thêm sách.


## Bản giao diện tinh gọn

- PASS: cú pháp JavaScript bản thật/bản xem thử.
- PASS: mô phỏng 80 sách; 16 sách có nguồn, 64 sách minh họa; tìm không dấu ở bản xem thử.
- PASS: kiểm tra giỏ AJAX cũ, tab thể loại, yêu thích AJAX đồng bộ các nút và lỗi không gửi lại.
- Bộ lọc nguồn/không dấu trên EF, controller yêu thích/giỏ mới và SQL 06 chưa chạy thực tế.
- Chưa build C#/Razor hoặc render trình duyệt.

## Kiểm tra lần bỏ 5 khối theo ảnh

- PASS: cả MVC và bản xem thử không còn 5 khối được yêu cầu; không còn liên kết tới #reading-corner.
- PASS: cấu trúc HTML bản xem thử lồng đúng, ID không trùng.
- PASS: JavaScript bản xem thử parse được; mô phỏng bộ lọc, sắp xếp, phân trang, yêu thích, vừa xem, đọc thử, giỏ hàng và phí giao hàng.
- Database, controller, model, view model và ảnh tải lên không bị thay đổi. Không cần SQL mới.
- Chưa build C#/Razor hoặc chạy SQL Server trên môi trường này do không có .NET SDK/SQL Server; chưa kiểm tra hình ảnh bằng trình duyệt.
