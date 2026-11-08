> BẢN NÂNG CẤP: Đọc BAT_DAU_VS2022.txt và HUONG_DAN_NANG_CAP.md trước. Database mới chạy 01 → 02 → 03 → 04; database có sẵn chỉ chạy 03 → 04. Các hướng dẫn dưới đây mô tả chức năng nền của dự án.

# Checklist kiểm thử tích hợp — phải chạy trên SQL Server thật

Chưa đánh dấu PASS trong bản giao vì môi trường tạo source không có .NET/SQL Server.

1. Restore, scaffold và build không lỗi. Mở trang chủ có 16 sách; trang 1 có 12, trang 2 có 4.
2. Lọc tác giả + thể loại + NXB: mọi kết quả khớp đồng thời. Tìm không có kết quả hiển thị trạng thái trống. Phân trang giữ tất cả bộ lọc. Sort giá tăng đúng thứ tự.
3. Chi tiết sách: giá, NXB, ISBN, stock khớp SQL. Đọc thử 3 trang; page=0 và 999 được giới hạn hợp lệ. Không có HTML được chèn từ sample.
4. Đăng ký email trùng bị chặn. Mật khẩu <8 ký tự bị chặn. PasswordHash không chứa mật khẩu thô. Đăng nhập sai hiển thị lỗi chung.
5. Thêm cùng sách hai lần cộng số lượng; max 20; không vượt stock. Update 0 xóa. Stock 0 không thêm được.
6. Đặt đơn 2 cuốn: total=server price*2+shipping. Dưới 300.000đ phí 30.000đ, từ 300.000đ phí 0. Stock giảm đúng, Orders và OrderItems tồn tại.
7. Gửi lại POST checkout sau thành công không tạo đơn thứ hai với token cũ (CheckoutKey có UNIQUE ở SQL). Kiểm tra lịch sử trước khi thử lại khi mất kết nối.
8. Hai khách cùng mua lượng hàng cuối: stock không âm; chỉ transaction hợp lệ hoàn tất. Nếu xảy ra deadlock/timeout SQL, kiểm tra lịch sử và thử lại; chưa có cơ chế tự retry transaction.
9. Khách A truy cập /Orders/Details/{id-cua-B}: 404. Khách thường truy cập /Admin: 403. POST không có antiforgery token bị từ chối.
10. Admin thêm/sửa/xóa sách. Sách có đơn được ngừng bán, lịch sử giữ nguyên tên và giá đã chốt. Danh mục chứa sách không xóa được.
11. Upload SVG, EXE đổi đuôi JPG, file >5MB đều bị từ chối. PNG/JPEG hợp lệ được lưu tên UUID; không ghi theo filename khách gửi.
12. Chuyển Chờ duyệt → Đang giao → Đã giao thành công. Chuyển ngược hoặc bỏ bước bị từ chối.
13. Khóa khách: lần đăng nhập sau không được, cookie cũ không đặt đơn mới được. Admin bị hạ quyền trong DB không tiếp tục truy cập Admin bằng cookie cũ.
14. Responsive: 375px, 768px, 1280px; menu có thể cuộn ngang, bộ lọc/giỏ/checkout rõ ràng. Tab bàn phím đi đến link/button; input có nhãn.
15. Môi trường IIS HTTPS: upload có quyền ghi, restart không mất SQL, đường dẫn ảnh còn truy cập được. Session local mất sau restart là hành vi đã ghi nhận.
