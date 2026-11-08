USE BookStoreOnline;
GO
-- Them 24 sach tu bien soan + 8 dau sach co that de minh hoa catalog.
-- Chay SAU 03_upgrade.sql. Chay lai khong chen trung theo ma sach.
SET XACT_ABORT ON;
BEGIN TRY
 BEGIN TRANSACTION;
 IF NOT EXISTS(SELECT 1 FROM dbo.Categories WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'Văn học') INSERT INTO dbo.Categories(Name) VALUES(N'Văn học');
 IF NOT EXISTS(SELECT 1 FROM dbo.Categories WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'Kinh tế') INSERT INTO dbo.Categories(Name) VALUES(N'Kinh tế');
 IF NOT EXISTS(SELECT 1 FROM dbo.Categories WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'Kỹ năng sống') INSERT INTO dbo.Categories(Name) VALUES(N'Kỹ năng sống');
 IF NOT EXISTS(SELECT 1 FROM dbo.Categories WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'Thiếu nhi') INSERT INTO dbo.Categories(Name) VALUES(N'Thiếu nhi');
 IF NOT EXISTS(SELECT 1 FROM dbo.Categories WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'Tâm lý') INSERT INTO dbo.Categories(Name) VALUES(N'Tâm lý');
 IF NOT EXISTS(SELECT 1 FROM dbo.Categories WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'Khoa học') INSERT INTO dbo.Categories(Name) VALUES(N'Khoa học');
 IF NOT EXISTS(SELECT 1 FROM dbo.Categories WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'Ngoại ngữ') INSERT INTO dbo.Categories(Name) VALUES(N'Ngoại ngữ');
 IF NOT EXISTS(SELECT 1 FROM dbo.Categories WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'Công nghệ') INSERT INTO dbo.Categories(Name) VALUES(N'Công nghệ');
 IF NOT EXISTS(SELECT 1 FROM dbo.Categories WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'Lịch sử & văn hóa') INSERT INTO dbo.Categories(Name) VALUES(N'Lịch sử & văn hóa');
 IF NOT EXISTS(SELECT 1 FROM dbo.Categories WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'Sức khỏe') INSERT INTO dbo.Categories(Name) VALUES(N'Sức khỏe');
 IF NOT EXISTS(SELECT 1 FROM dbo.Authors WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'An Nhiên') INSERT INTO dbo.Authors(Name) VALUES(N'An Nhiên');
 IF NOT EXISTS(SELECT 1 FROM dbo.Authors WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'Antoine de Saint-Exupéry') INSERT INTO dbo.Authors(Name) VALUES(N'Antoine de Saint-Exupéry');
 IF NOT EXISTS(SELECT 1 FROM dbo.Authors WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'Elizabeth Kolbert') INSERT INTO dbo.Authors(Name) VALUES(N'Elizabeth Kolbert');
 IF NOT EXISTS(SELECT 1 FROM dbo.Authors WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'Higashino Keigo') INSERT INTO dbo.Authors(Name) VALUES(N'Higashino Keigo');
 IF NOT EXISTS(SELECT 1 FROM dbo.Authors WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'Hoàng Duy') INSERT INTO dbo.Authors(Name) VALUES(N'Hoàng Duy');
 IF NOT EXISTS(SELECT 1 FROM dbo.Authors WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'Johann Wolfgang von Goethe') INSERT INTO dbo.Authors(Name) VALUES(N'Johann Wolfgang von Goethe');
 IF NOT EXISTS(SELECT 1 FROM dbo.Authors WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'Linh Chi') INSERT INTO dbo.Authors(Name) VALUES(N'Linh Chi');
 IF NOT EXISTS(SELECT 1 FROM dbo.Authors WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'Mai Vy') INSERT INTO dbo.Authors(Name) VALUES(N'Mai Vy');
 IF NOT EXISTS(SELECT 1 FROM dbo.Authors WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'Minh Hạ') INSERT INTO dbo.Authors(Name) VALUES(N'Minh Hạ');
 IF NOT EXISTS(SELECT 1 FROM dbo.Authors WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'Nguyễn Văn Huyên') INSERT INTO dbo.Authors(Name) VALUES(N'Nguyễn Văn Huyên');
 IF NOT EXISTS(SELECT 1 FROM dbo.Authors WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'Ngô Đức Hùng') INSERT INTO dbo.Authors(Name) VALUES(N'Ngô Đức Hùng');
 IF NOT EXISTS(SELECT 1 FROM dbo.Authors WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'Paulo Coelho') INSERT INTO dbo.Authors(Name) VALUES(N'Paulo Coelho');
 IF NOT EXISTS(SELECT 1 FROM dbo.Authors WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'Quang Lâm') INSERT INTO dbo.Authors(Name) VALUES(N'Quang Lâm');
 IF NOT EXISTS(SELECT 1 FROM dbo.Authors WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'Trần Quang Đức') INSERT INTO dbo.Authors(Name) VALUES(N'Trần Quang Đức');
 IF NOT EXISTS(SELECT 1 FROM dbo.Publishers WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'NXB Hội Nhà Văn') INSERT INTO dbo.Publishers(Name) VALUES(N'NXB Hội Nhà Văn');
 IF NOT EXISTS(SELECT 1 FROM dbo.Publishers WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'NXB Mộc Tri Thức (mẫu)') INSERT INTO dbo.Publishers(Name) VALUES(N'NXB Mộc Tri Thức (mẫu)');
 IF NOT EXISTS(SELECT 1 FROM dbo.Publishers WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'NXB Thế Giới') INSERT INTO dbo.Publishers(Name) VALUES(N'NXB Thế Giới');
 IF NOT EXISTS(SELECT 1 FROM dbo.Publishers WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'NXB Tổng hợp TP.HCM') INSERT INTO dbo.Publishers(Name) VALUES(N'NXB Tổng hợp TP.HCM');
 IF NOT EXISTS(SELECT 1 FROM dbo.Publishers WITH (UPDLOCK,HOLDLOCK) WHERE Name=N'NXB Văn Học') INSERT INTO dbo.Publishers(Name) VALUES(N'NXB Văn Học');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-EX-001')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Một ngày ở phố nhỏ',N'Những cuộc gặp gỡ bình dị ở một khu phố, nơi mỗi người giữ một câu chuyện riêng.

Đầu sách, tác giả, giá, thông số và bìa là dữ liệu minh họa do dự án biên soạn để kiểm thử website.',N'DEMO-EX-001',(SELECT Id FROM dbo.Categories WHERE Name=N'Văn học'),(SELECT Id FROM dbo.Authors WHERE Name=N'Minh Hạ'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),89000,115000,13,128,2026,N'/images/extra-01.svg',N'TRANG MẪU · MỘT NGÀY Ở PHỐ NHỎ

Đây là nội dung đọc thử tự biên soạn cho đầu sách minh họa “Một ngày ở phố nhỏ”. Những cuộc gặp gỡ bình dị ở một khu phố, nơi mỗi người giữ một câu chuyện riêng.

Hãy bắt đầu từ một câu hỏi: bạn muốn tìm hiểu điều gì sau khi đọc? Viết ra một ý tưởng nhỏ và liên hệ với một tình huống bạn đã trải qua.
---PAGE---
THỬ QUAN SÁT THEO MỘT CÁCH MỚI

Chọn một chi tiết trong chủ đề hôm nay. Bạn có thể ghi lại điều đã biết, điều còn chưa rõ và một ví dụ trong đời sống. Khi đặt những ghi chú cạnh nhau, hãy tìm xem có mối liên hệ nào giữa chúng.

Một câu hỏi tốt không nhất thiết phải dài. Nó chỉ cần giúp bạn nhìn rõ hơn vấn đề đang quan tâm.
---PAGE---
GHI CHÚ SAU KHI ĐỌC

Điều gì khiến bạn chú ý nhất? Bạn muốn tìm thêm cuốn sách nào về chủ đề này? Hãy lưu một câu hỏi và dành thời gian quay lại với nó.

Ba trang này minh họa thao tác đọc thử; chúng không trích từ sách đang phát hành trên thị trường.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-EX-002')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Thư gửi mùa thu',N'Những lá thư về gia đình, ký ức và sự thay đổi khi bước vào một giai đoạn mới.

Đầu sách, tác giả, giá, thông số và bìa là dữ liệu minh họa do dự án biên soạn để kiểm thử website.',N'DEMO-EX-002',(SELECT Id FROM dbo.Categories WHERE Name=N'Văn học'),(SELECT Id FROM dbo.Authors WHERE Name=N'Hoàng Duy'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),109000,145000,14,136,2026,N'/images/extra-02.svg',N'TRANG MẪU · THƯ GỬI MÙA THU

Đây là nội dung đọc thử tự biên soạn cho đầu sách minh họa “Thư gửi mùa thu”. Những lá thư về gia đình, ký ức và sự thay đổi khi bước vào một giai đoạn mới.

Hãy bắt đầu từ một câu hỏi: bạn muốn tìm hiểu điều gì sau khi đọc? Viết ra một ý tưởng nhỏ và liên hệ với một tình huống bạn đã trải qua.
---PAGE---
THỬ QUAN SÁT THEO MỘT CÁCH MỚI

Chọn một chi tiết trong chủ đề hôm nay. Bạn có thể ghi lại điều đã biết, điều còn chưa rõ và một ví dụ trong đời sống. Khi đặt những ghi chú cạnh nhau, hãy tìm xem có mối liên hệ nào giữa chúng.

Một câu hỏi tốt không nhất thiết phải dài. Nó chỉ cần giúp bạn nhìn rõ hơn vấn đề đang quan tâm.
---PAGE---
GHI CHÚ SAU KHI ĐỌC

Điều gì khiến bạn chú ý nhất? Bạn muốn tìm thêm cuốn sách nào về chủ đề này? Hãy lưu một câu hỏi và dành thời gian quay lại với nó.

Ba trang này minh họa thao tác đọc thử; chúng không trích từ sách đang phát hành trên thị trường.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-EX-003')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Khi thành phố ngủ',N'Một hành trình quan sát thành phố sau giờ tan tầm, từ những quán nhỏ đến những chuyến xe cuối ngày.

Đầu sách, tác giả, giá, thông số và bìa là dữ liệu minh họa do dự án biên soạn để kiểm thử website.',N'DEMO-EX-003',(SELECT Id FROM dbo.Categories WHERE Name=N'Văn học'),(SELECT Id FROM dbo.Authors WHERE Name=N'Linh Chi'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),139000,185000,15,144,2026,N'/images/extra-03.svg',N'TRANG MẪU · KHI THÀNH PHỐ NGỦ

Đây là nội dung đọc thử tự biên soạn cho đầu sách minh họa “Khi thành phố ngủ”. Một hành trình quan sát thành phố sau giờ tan tầm, từ những quán nhỏ đến những chuyến xe cuối ngày.

Hãy bắt đầu từ một câu hỏi: bạn muốn tìm hiểu điều gì sau khi đọc? Viết ra một ý tưởng nhỏ và liên hệ với một tình huống bạn đã trải qua.
---PAGE---
THỬ QUAN SÁT THEO MỘT CÁCH MỚI

Chọn một chi tiết trong chủ đề hôm nay. Bạn có thể ghi lại điều đã biết, điều còn chưa rõ và một ví dụ trong đời sống. Khi đặt những ghi chú cạnh nhau, hãy tìm xem có mối liên hệ nào giữa chúng.

Một câu hỏi tốt không nhất thiết phải dài. Nó chỉ cần giúp bạn nhìn rõ hơn vấn đề đang quan tâm.
---PAGE---
GHI CHÚ SAU KHI ĐỌC

Điều gì khiến bạn chú ý nhất? Bạn muốn tìm thêm cuốn sách nào về chủ đề này? Hãy lưu một câu hỏi và dành thời gian quay lại với nó.

Ba trang này minh họa thao tác đọc thử; chúng không trích từ sách đang phát hành trên thị trường.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-EX-004')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Tài chính cá nhân từ con số không',N'Thực hành lập ngân sách, phân biệt chi tiêu cần thiết và đặt mục tiêu tiết kiệm.

Đầu sách, tác giả, giá, thông số và bìa là dữ liệu minh họa do dự án biên soạn để kiểm thử website.',N'DEMO-EX-004',(SELECT Id FROM dbo.Categories WHERE Name=N'Kinh tế'),(SELECT Id FROM dbo.Authors WHERE Name=N'Quang Lâm'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),179000,239000,16,152,2026,N'/images/extra-04.svg',N'TRANG MẪU · TÀI CHÍNH CÁ NHÂN TỪ CON SỐ KHÔNG

Đây là nội dung đọc thử tự biên soạn cho đầu sách minh họa “Tài chính cá nhân từ con số không”. Thực hành lập ngân sách, phân biệt chi tiêu cần thiết và đặt mục tiêu tiết kiệm.

Hãy bắt đầu từ một câu hỏi: bạn muốn tìm hiểu điều gì sau khi đọc? Viết ra một ý tưởng nhỏ và liên hệ với một tình huống bạn đã trải qua.
---PAGE---
THỬ QUAN SÁT THEO MỘT CÁCH MỚI

Chọn một chi tiết trong chủ đề hôm nay. Bạn có thể ghi lại điều đã biết, điều còn chưa rõ và một ví dụ trong đời sống. Khi đặt những ghi chú cạnh nhau, hãy tìm xem có mối liên hệ nào giữa chúng.

Một câu hỏi tốt không nhất thiết phải dài. Nó chỉ cần giúp bạn nhìn rõ hơn vấn đề đang quan tâm.
---PAGE---
GHI CHÚ SAU KHI ĐỌC

Điều gì khiến bạn chú ý nhất? Bạn muốn tìm thêm cuốn sách nào về chủ đề này? Hãy lưu một câu hỏi và dành thời gian quay lại với nó.

Ba trang này minh họa thao tác đọc thử; chúng không trích từ sách đang phát hành trên thị trường.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-EX-005')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Khởi nghiệp từ ý tưởng nhỏ',N'Bắt đầu bằng việc tìm hiểu nhu cầu khách hàng, thử một sản phẩm nhỏ và học từ phản hồi.

Đầu sách, tác giả, giá, thông số và bìa là dữ liệu minh họa do dự án biên soạn để kiểm thử website.',N'DEMO-EX-005',(SELECT Id FROM dbo.Categories WHERE Name=N'Kinh tế'),(SELECT Id FROM dbo.Authors WHERE Name=N'Mai Vy'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),219000,289000,17,160,2026,N'/images/extra-05.svg',N'TRANG MẪU · KHỞI NGHIỆP TỪ Ý TƯỞNG NHỎ

Đây là nội dung đọc thử tự biên soạn cho đầu sách minh họa “Khởi nghiệp từ ý tưởng nhỏ”. Bắt đầu bằng việc tìm hiểu nhu cầu khách hàng, thử một sản phẩm nhỏ và học từ phản hồi.

Hãy bắt đầu từ một câu hỏi: bạn muốn tìm hiểu điều gì sau khi đọc? Viết ra một ý tưởng nhỏ và liên hệ với một tình huống bạn đã trải qua.
---PAGE---
THỬ QUAN SÁT THEO MỘT CÁCH MỚI

Chọn một chi tiết trong chủ đề hôm nay. Bạn có thể ghi lại điều đã biết, điều còn chưa rõ và một ví dụ trong đời sống. Khi đặt những ghi chú cạnh nhau, hãy tìm xem có mối liên hệ nào giữa chúng.

Một câu hỏi tốt không nhất thiết phải dài. Nó chỉ cần giúp bạn nhìn rõ hơn vấn đề đang quan tâm.
---PAGE---
GHI CHÚ SAU KHI ĐỌC

Điều gì khiến bạn chú ý nhất? Bạn muốn tìm thêm cuốn sách nào về chủ đề này? Hãy lưu một câu hỏi và dành thời gian quay lại với nó.

Ba trang này minh họa thao tác đọc thử; chúng không trích từ sách đang phát hành trên thị trường.',1,N'Tiếng Việt',N'Bìa cứng',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-EX-006')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Kể chuyện cho thương hiệu',N'Tìm tiếng nói riêng cho một sản phẩm thông qua câu chuyện nhất quán và trải nghiệm khách hàng.

Đầu sách, tác giả, giá, thông số và bìa là dữ liệu minh họa do dự án biên soạn để kiểm thử website.',N'DEMO-EX-006',(SELECT Id FROM dbo.Categories WHERE Name=N'Kinh tế'),(SELECT Id FROM dbo.Authors WHERE Name=N'An Nhiên'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),69000,89000,18,168,2026,N'/images/extra-06.svg',N'TRANG MẪU · KỂ CHUYỆN CHO THƯƠNG HIỆU

Đây là nội dung đọc thử tự biên soạn cho đầu sách minh họa “Kể chuyện cho thương hiệu”. Tìm tiếng nói riêng cho một sản phẩm thông qua câu chuyện nhất quán và trải nghiệm khách hàng.

Hãy bắt đầu từ một câu hỏi: bạn muốn tìm hiểu điều gì sau khi đọc? Viết ra một ý tưởng nhỏ và liên hệ với một tình huống bạn đã trải qua.
---PAGE---
THỬ QUAN SÁT THEO MỘT CÁCH MỚI

Chọn một chi tiết trong chủ đề hôm nay. Bạn có thể ghi lại điều đã biết, điều còn chưa rõ và một ví dụ trong đời sống. Khi đặt những ghi chú cạnh nhau, hãy tìm xem có mối liên hệ nào giữa chúng.

Một câu hỏi tốt không nhất thiết phải dài. Nó chỉ cần giúp bạn nhìn rõ hơn vấn đề đang quan tâm.
---PAGE---
GHI CHÚ SAU KHI ĐỌC

Điều gì khiến bạn chú ý nhất? Bạn muốn tìm thêm cuốn sách nào về chủ đề này? Hãy lưu một câu hỏi và dành thời gian quay lại với nó.

Ba trang này minh họa thao tác đọc thử; chúng không trích từ sách đang phát hành trên thị trường.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-EX-007')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Mười phút cho một thói quen tốt',N'Những bài tập ngắn giúp xây dựng thói quen đọc, ghi chú và quản lý một ngày.

Đầu sách, tác giả, giá, thông số và bìa là dữ liệu minh họa do dự án biên soạn để kiểm thử website.',N'DEMO-EX-007',(SELECT Id FROM dbo.Categories WHERE Name=N'Kỹ năng sống'),(SELECT Id FROM dbo.Authors WHERE Name=N'Minh Hạ'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),89000,115000,0,176,2026,N'/images/extra-07.svg',N'TRANG MẪU · MƯỜI PHÚT CHO MỘT THÓI QUEN TỐT

Đây là nội dung đọc thử tự biên soạn cho đầu sách minh họa “Mười phút cho một thói quen tốt”. Những bài tập ngắn giúp xây dựng thói quen đọc, ghi chú và quản lý một ngày.

Hãy bắt đầu từ một câu hỏi: bạn muốn tìm hiểu điều gì sau khi đọc? Viết ra một ý tưởng nhỏ và liên hệ với một tình huống bạn đã trải qua.
---PAGE---
THỬ QUAN SÁT THEO MỘT CÁCH MỚI

Chọn một chi tiết trong chủ đề hôm nay. Bạn có thể ghi lại điều đã biết, điều còn chưa rõ và một ví dụ trong đời sống. Khi đặt những ghi chú cạnh nhau, hãy tìm xem có mối liên hệ nào giữa chúng.

Một câu hỏi tốt không nhất thiết phải dài. Nó chỉ cần giúp bạn nhìn rõ hơn vấn đề đang quan tâm.
---PAGE---
GHI CHÚ SAU KHI ĐỌC

Điều gì khiến bạn chú ý nhất? Bạn muốn tìm thêm cuốn sách nào về chủ đề này? Hãy lưu một câu hỏi và dành thời gian quay lại với nó.

Ba trang này minh họa thao tác đọc thử; chúng không trích từ sách đang phát hành trên thị trường.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-EX-008')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Lắng nghe trước khi trả lời',N'Các tình huống giao tiếp thường gặp và cách đặt câu hỏi để hiểu người đối diện.

Đầu sách, tác giả, giá, thông số và bìa là dữ liệu minh họa do dự án biên soạn để kiểm thử website.',N'DEMO-EX-008',(SELECT Id FROM dbo.Categories WHERE Name=N'Kỹ năng sống'),(SELECT Id FROM dbo.Authors WHERE Name=N'Hoàng Duy'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),109000,145000,20,184,2026,N'/images/extra-08.svg',N'TRANG MẪU · LẮNG NGHE TRƯỚC KHI TRẢ LỜI

Đây là nội dung đọc thử tự biên soạn cho đầu sách minh họa “Lắng nghe trước khi trả lời”. Các tình huống giao tiếp thường gặp và cách đặt câu hỏi để hiểu người đối diện.

Hãy bắt đầu từ một câu hỏi: bạn muốn tìm hiểu điều gì sau khi đọc? Viết ra một ý tưởng nhỏ và liên hệ với một tình huống bạn đã trải qua.
---PAGE---
THỬ QUAN SÁT THEO MỘT CÁCH MỚI

Chọn một chi tiết trong chủ đề hôm nay. Bạn có thể ghi lại điều đã biết, điều còn chưa rõ và một ví dụ trong đời sống. Khi đặt những ghi chú cạnh nhau, hãy tìm xem có mối liên hệ nào giữa chúng.

Một câu hỏi tốt không nhất thiết phải dài. Nó chỉ cần giúp bạn nhìn rõ hơn vấn đề đang quan tâm.
---PAGE---
GHI CHÚ SAU KHI ĐỌC

Điều gì khiến bạn chú ý nhất? Bạn muốn tìm thêm cuốn sách nào về chủ đề này? Hãy lưu một câu hỏi và dành thời gian quay lại với nó.

Ba trang này minh họa thao tác đọc thử; chúng không trích từ sách đang phát hành trên thị trường.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-EX-009')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Học cách bắt đầu lại',N'Nhìn lại mục tiêu, điều chỉnh kế hoạch và bắt đầu bằng một bước nhỏ có thể thực hiện.

Đầu sách, tác giả, giá, thông số và bìa là dữ liệu minh họa do dự án biên soạn để kiểm thử website.',N'DEMO-EX-009',(SELECT Id FROM dbo.Categories WHERE Name=N'Kỹ năng sống'),(SELECT Id FROM dbo.Authors WHERE Name=N'Linh Chi'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),139000,185000,21,192,2026,N'/images/extra-09.svg',N'TRANG MẪU · HỌC CÁCH BẮT ĐẦU LẠI

Đây là nội dung đọc thử tự biên soạn cho đầu sách minh họa “Học cách bắt đầu lại”. Nhìn lại mục tiêu, điều chỉnh kế hoạch và bắt đầu bằng một bước nhỏ có thể thực hiện.

Hãy bắt đầu từ một câu hỏi: bạn muốn tìm hiểu điều gì sau khi đọc? Viết ra một ý tưởng nhỏ và liên hệ với một tình huống bạn đã trải qua.
---PAGE---
THỬ QUAN SÁT THEO MỘT CÁCH MỚI

Chọn một chi tiết trong chủ đề hôm nay. Bạn có thể ghi lại điều đã biết, điều còn chưa rõ và một ví dụ trong đời sống. Khi đặt những ghi chú cạnh nhau, hãy tìm xem có mối liên hệ nào giữa chúng.

Một câu hỏi tốt không nhất thiết phải dài. Nó chỉ cần giúp bạn nhìn rõ hơn vấn đề đang quan tâm.
---PAGE---
GHI CHÚ SAU KHI ĐỌC

Điều gì khiến bạn chú ý nhất? Bạn muốn tìm thêm cuốn sách nào về chủ đề này? Hãy lưu một câu hỏi và dành thời gian quay lại với nó.

Ba trang này minh họa thao tác đọc thử; chúng không trích từ sách đang phát hành trên thị trường.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-EX-010')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Khu vườn của bạn Thỏ',N'Bạn Thỏ và những người bạn cùng chăm sóc một khu vườn qua bốn mùa.

Đầu sách, tác giả, giá, thông số và bìa là dữ liệu minh họa do dự án biên soạn để kiểm thử website.',N'DEMO-EX-010',(SELECT Id FROM dbo.Categories WHERE Name=N'Thiếu nhi'),(SELECT Id FROM dbo.Authors WHERE Name=N'Quang Lâm'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),179000,239000,22,200,2026,N'/images/extra-10.svg',N'TRANG MẪU · KHU VƯỜN CỦA BẠN THỎ

Đây là nội dung đọc thử tự biên soạn cho đầu sách minh họa “Khu vườn của bạn Thỏ”. Bạn Thỏ và những người bạn cùng chăm sóc một khu vườn qua bốn mùa.

Hãy bắt đầu từ một câu hỏi: bạn muốn tìm hiểu điều gì sau khi đọc? Viết ra một ý tưởng nhỏ và liên hệ với một tình huống bạn đã trải qua.
---PAGE---
THỬ QUAN SÁT THEO MỘT CÁCH MỚI

Chọn một chi tiết trong chủ đề hôm nay. Bạn có thể ghi lại điều đã biết, điều còn chưa rõ và một ví dụ trong đời sống. Khi đặt những ghi chú cạnh nhau, hãy tìm xem có mối liên hệ nào giữa chúng.

Một câu hỏi tốt không nhất thiết phải dài. Nó chỉ cần giúp bạn nhìn rõ hơn vấn đề đang quan tâm.
---PAGE---
GHI CHÚ SAU KHI ĐỌC

Điều gì khiến bạn chú ý nhất? Bạn muốn tìm thêm cuốn sách nào về chủ đề này? Hãy lưu một câu hỏi và dành thời gian quay lại với nó.

Ba trang này minh họa thao tác đọc thử; chúng không trích từ sách đang phát hành trên thị trường.',1,N'Tiếng Việt',N'Bìa cứng',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-EX-011')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Chuyến tàu đến các vì sao',N'Một câu chuyện tưởng tượng về nhóm bạn nhỏ khám phá bầu trời và học cách hợp tác.

Đầu sách, tác giả, giá, thông số và bìa là dữ liệu minh họa do dự án biên soạn để kiểm thử website.',N'DEMO-EX-011',(SELECT Id FROM dbo.Categories WHERE Name=N'Thiếu nhi'),(SELECT Id FROM dbo.Authors WHERE Name=N'Mai Vy'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),219000,289000,23,208,2026,N'/images/extra-11.svg',N'TRANG MẪU · CHUYẾN TÀU ĐẾN CÁC VÌ SAO

Đây là nội dung đọc thử tự biên soạn cho đầu sách minh họa “Chuyến tàu đến các vì sao”. Một câu chuyện tưởng tượng về nhóm bạn nhỏ khám phá bầu trời và học cách hợp tác.

Hãy bắt đầu từ một câu hỏi: bạn muốn tìm hiểu điều gì sau khi đọc? Viết ra một ý tưởng nhỏ và liên hệ với một tình huống bạn đã trải qua.
---PAGE---
THỬ QUAN SÁT THEO MỘT CÁCH MỚI

Chọn một chi tiết trong chủ đề hôm nay. Bạn có thể ghi lại điều đã biết, điều còn chưa rõ và một ví dụ trong đời sống. Khi đặt những ghi chú cạnh nhau, hãy tìm xem có mối liên hệ nào giữa chúng.

Một câu hỏi tốt không nhất thiết phải dài. Nó chỉ cần giúp bạn nhìn rõ hơn vấn đề đang quan tâm.
---PAGE---
GHI CHÚ SAU KHI ĐỌC

Điều gì khiến bạn chú ý nhất? Bạn muốn tìm thêm cuốn sách nào về chủ đề này? Hãy lưu một câu hỏi và dành thời gian quay lại với nó.

Ba trang này minh họa thao tác đọc thử; chúng không trích từ sách đang phát hành trên thị trường.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-EX-012')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Mỗi ngày một điều tốt',N'Những câu chuyện ngắn về chia sẻ, xin lỗi và giúp đỡ mọi người dành cho bạn đọc nhỏ tuổi.

Đầu sách, tác giả, giá, thông số và bìa là dữ liệu minh họa do dự án biên soạn để kiểm thử website.',N'DEMO-EX-012',(SELECT Id FROM dbo.Categories WHERE Name=N'Thiếu nhi'),(SELECT Id FROM dbo.Authors WHERE Name=N'An Nhiên'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),69000,89000,24,216,2026,N'/images/extra-12.svg',N'TRANG MẪU · MỖI NGÀY MỘT ĐIỀU TỐT

Đây là nội dung đọc thử tự biên soạn cho đầu sách minh họa “Mỗi ngày một điều tốt”. Những câu chuyện ngắn về chia sẻ, xin lỗi và giúp đỡ mọi người dành cho bạn đọc nhỏ tuổi.

Hãy bắt đầu từ một câu hỏi: bạn muốn tìm hiểu điều gì sau khi đọc? Viết ra một ý tưởng nhỏ và liên hệ với một tình huống bạn đã trải qua.
---PAGE---
THỬ QUAN SÁT THEO MỘT CÁCH MỚI

Chọn một chi tiết trong chủ đề hôm nay. Bạn có thể ghi lại điều đã biết, điều còn chưa rõ và một ví dụ trong đời sống. Khi đặt những ghi chú cạnh nhau, hãy tìm xem có mối liên hệ nào giữa chúng.

Một câu hỏi tốt không nhất thiết phải dài. Nó chỉ cần giúp bạn nhìn rõ hơn vấn đề đang quan tâm.
---PAGE---
GHI CHÚ SAU KHI ĐỌC

Điều gì khiến bạn chú ý nhất? Bạn muốn tìm thêm cuốn sách nào về chủ đề này? Hãy lưu một câu hỏi và dành thời gian quay lại với nó.

Ba trang này minh họa thao tác đọc thử; chúng không trích từ sách đang phát hành trên thị trường.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-EX-013')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Nhận diện cảm xúc mỗi ngày',N'Gợi ý ghi lại cảm xúc, tìm hiểu tình huống dẫn đến cảm xúc và dành thời gian tự quan sát.

Đầu sách, tác giả, giá, thông số và bìa là dữ liệu minh họa do dự án biên soạn để kiểm thử website.',N'DEMO-EX-013',(SELECT Id FROM dbo.Categories WHERE Name=N'Tâm lý'),(SELECT Id FROM dbo.Authors WHERE Name=N'Minh Hạ'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),89000,115000,25,224,2026,N'/images/extra-13.svg',N'TRANG MẪU · NHẬN DIỆN CẢM XÚC MỖI NGÀY

Đây là nội dung đọc thử tự biên soạn cho đầu sách minh họa “Nhận diện cảm xúc mỗi ngày”. Gợi ý ghi lại cảm xúc, tìm hiểu tình huống dẫn đến cảm xúc và dành thời gian tự quan sát.

Hãy bắt đầu từ một câu hỏi: bạn muốn tìm hiểu điều gì sau khi đọc? Viết ra một ý tưởng nhỏ và liên hệ với một tình huống bạn đã trải qua.
---PAGE---
THỬ QUAN SÁT THEO MỘT CÁCH MỚI

Chọn một chi tiết trong chủ đề hôm nay. Bạn có thể ghi lại điều đã biết, điều còn chưa rõ và một ví dụ trong đời sống. Khi đặt những ghi chú cạnh nhau, hãy tìm xem có mối liên hệ nào giữa chúng.

Một câu hỏi tốt không nhất thiết phải dài. Nó chỉ cần giúp bạn nhìn rõ hơn vấn đề đang quan tâm.
---PAGE---
GHI CHÚ SAU KHI ĐỌC

Điều gì khiến bạn chú ý nhất? Bạn muốn tìm thêm cuốn sách nào về chủ đề này? Hãy lưu một câu hỏi và dành thời gian quay lại với nó.

Ba trang này minh họa thao tác đọc thử; chúng không trích từ sách đang phát hành trên thị trường.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-EX-014')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Khoảng lặng giữa những ngày bận',N'Bài tập suy ngẫm về thời gian nghỉ ngơi và cách sắp xếp những điều quan trọng.

Đầu sách, tác giả, giá, thông số và bìa là dữ liệu minh họa do dự án biên soạn để kiểm thử website.',N'DEMO-EX-014',(SELECT Id FROM dbo.Categories WHERE Name=N'Tâm lý'),(SELECT Id FROM dbo.Authors WHERE Name=N'Hoàng Duy'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),109000,145000,26,232,2026,N'/images/extra-14.svg',N'TRANG MẪU · KHOẢNG LẶNG GIỮA NHỮNG NGÀY BẬN

Đây là nội dung đọc thử tự biên soạn cho đầu sách minh họa “Khoảng lặng giữa những ngày bận”. Bài tập suy ngẫm về thời gian nghỉ ngơi và cách sắp xếp những điều quan trọng.

Hãy bắt đầu từ một câu hỏi: bạn muốn tìm hiểu điều gì sau khi đọc? Viết ra một ý tưởng nhỏ và liên hệ với một tình huống bạn đã trải qua.
---PAGE---
THỬ QUAN SÁT THEO MỘT CÁCH MỚI

Chọn một chi tiết trong chủ đề hôm nay. Bạn có thể ghi lại điều đã biết, điều còn chưa rõ và một ví dụ trong đời sống. Khi đặt những ghi chú cạnh nhau, hãy tìm xem có mối liên hệ nào giữa chúng.

Một câu hỏi tốt không nhất thiết phải dài. Nó chỉ cần giúp bạn nhìn rõ hơn vấn đề đang quan tâm.
---PAGE---
GHI CHÚ SAU KHI ĐỌC

Điều gì khiến bạn chú ý nhất? Bạn muốn tìm thêm cuốn sách nào về chủ đề này? Hãy lưu một câu hỏi và dành thời gian quay lại với nó.

Ba trang này minh họa thao tác đọc thử; chúng không trích từ sách đang phát hành trên thị trường.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-EX-015')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Hiểu mình qua những câu hỏi',N'Một tập câu hỏi để viết nhật ký, quan sát sở thích và nhìn lại các quyết định thường ngày.

Đầu sách, tác giả, giá, thông số và bìa là dữ liệu minh họa do dự án biên soạn để kiểm thử website.',N'DEMO-EX-015',(SELECT Id FROM dbo.Categories WHERE Name=N'Tâm lý'),(SELECT Id FROM dbo.Authors WHERE Name=N'Linh Chi'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),139000,185000,27,240,2026,N'/images/extra-15.svg',N'TRANG MẪU · HIỂU MÌNH QUA NHỮNG CÂU HỎI

Đây là nội dung đọc thử tự biên soạn cho đầu sách minh họa “Hiểu mình qua những câu hỏi”. Một tập câu hỏi để viết nhật ký, quan sát sở thích và nhìn lại các quyết định thường ngày.

Hãy bắt đầu từ một câu hỏi: bạn muốn tìm hiểu điều gì sau khi đọc? Viết ra một ý tưởng nhỏ và liên hệ với một tình huống bạn đã trải qua.
---PAGE---
THỬ QUAN SÁT THEO MỘT CÁCH MỚI

Chọn một chi tiết trong chủ đề hôm nay. Bạn có thể ghi lại điều đã biết, điều còn chưa rõ và một ví dụ trong đời sống. Khi đặt những ghi chú cạnh nhau, hãy tìm xem có mối liên hệ nào giữa chúng.

Một câu hỏi tốt không nhất thiết phải dài. Nó chỉ cần giúp bạn nhìn rõ hơn vấn đề đang quan tâm.
---PAGE---
GHI CHÚ SAU KHI ĐỌC

Điều gì khiến bạn chú ý nhất? Bạn muốn tìm thêm cuốn sách nào về chủ đề này? Hãy lưu một câu hỏi và dành thời gian quay lại với nó.

Ba trang này minh họa thao tác đọc thử; chúng không trích từ sách đang phát hành trên thị trường.',1,N'Tiếng Việt',N'Bìa cứng',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-EX-016')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Vũ trụ trong lòng bàn tay',N'Làm quen với hành tinh, ngôi sao và những câu hỏi đầu tiên về bầu trời.

Đầu sách, tác giả, giá, thông số và bìa là dữ liệu minh họa do dự án biên soạn để kiểm thử website.',N'DEMO-EX-016',(SELECT Id FROM dbo.Categories WHERE Name=N'Khoa học'),(SELECT Id FROM dbo.Authors WHERE Name=N'Quang Lâm'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),179000,239000,28,248,2026,N'/images/extra-16.svg',N'TRANG MẪU · VŨ TRỤ TRONG LÒNG BÀN TAY

Đây là nội dung đọc thử tự biên soạn cho đầu sách minh họa “Vũ trụ trong lòng bàn tay”. Làm quen với hành tinh, ngôi sao và những câu hỏi đầu tiên về bầu trời.

Hãy bắt đầu từ một câu hỏi: bạn muốn tìm hiểu điều gì sau khi đọc? Viết ra một ý tưởng nhỏ và liên hệ với một tình huống bạn đã trải qua.
---PAGE---
THỬ QUAN SÁT THEO MỘT CÁCH MỚI

Chọn một chi tiết trong chủ đề hôm nay. Bạn có thể ghi lại điều đã biết, điều còn chưa rõ và một ví dụ trong đời sống. Khi đặt những ghi chú cạnh nhau, hãy tìm xem có mối liên hệ nào giữa chúng.

Một câu hỏi tốt không nhất thiết phải dài. Nó chỉ cần giúp bạn nhìn rõ hơn vấn đề đang quan tâm.
---PAGE---
GHI CHÚ SAU KHI ĐỌC

Điều gì khiến bạn chú ý nhất? Bạn muốn tìm thêm cuốn sách nào về chủ đề này? Hãy lưu một câu hỏi và dành thời gian quay lại với nó.

Ba trang này minh họa thao tác đọc thử; chúng không trích từ sách đang phát hành trên thị trường.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-EX-017')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Hành trình của một giọt nước',N'Khám phá vòng tuần hoàn nước bằng những ví dụ gần gũi trong đời sống.

Đầu sách, tác giả, giá, thông số và bìa là dữ liệu minh họa do dự án biên soạn để kiểm thử website.',N'DEMO-EX-017',(SELECT Id FROM dbo.Categories WHERE Name=N'Khoa học'),(SELECT Id FROM dbo.Authors WHERE Name=N'Mai Vy'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),219000,289000,29,256,2026,N'/images/extra-17.svg',N'TRANG MẪU · HÀNH TRÌNH CỦA MỘT GIỌT NƯỚC

Đây là nội dung đọc thử tự biên soạn cho đầu sách minh họa “Hành trình của một giọt nước”. Khám phá vòng tuần hoàn nước bằng những ví dụ gần gũi trong đời sống.

Hãy bắt đầu từ một câu hỏi: bạn muốn tìm hiểu điều gì sau khi đọc? Viết ra một ý tưởng nhỏ và liên hệ với một tình huống bạn đã trải qua.
---PAGE---
THỬ QUAN SÁT THEO MỘT CÁCH MỚI

Chọn một chi tiết trong chủ đề hôm nay. Bạn có thể ghi lại điều đã biết, điều còn chưa rõ và một ví dụ trong đời sống. Khi đặt những ghi chú cạnh nhau, hãy tìm xem có mối liên hệ nào giữa chúng.

Một câu hỏi tốt không nhất thiết phải dài. Nó chỉ cần giúp bạn nhìn rõ hơn vấn đề đang quan tâm.
---PAGE---
GHI CHÚ SAU KHI ĐỌC

Điều gì khiến bạn chú ý nhất? Bạn muốn tìm thêm cuốn sách nào về chủ đề này? Hãy lưu một câu hỏi và dành thời gian quay lại với nó.

Ba trang này minh họa thao tác đọc thử; chúng không trích từ sách đang phát hành trên thị trường.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-EX-018')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Bí mật của những hạt giống',N'Quan sát cách một hạt giống nảy mầm và tìm hiểu điều kiện giúp cây lớn lên.

Đầu sách, tác giả, giá, thông số và bìa là dữ liệu minh họa do dự án biên soạn để kiểm thử website.',N'DEMO-EX-018',(SELECT Id FROM dbo.Categories WHERE Name=N'Khoa học'),(SELECT Id FROM dbo.Authors WHERE Name=N'An Nhiên'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),69000,89000,30,264,2026,N'/images/extra-18.svg',N'TRANG MẪU · BÍ MẬT CỦA NHỮNG HẠT GIỐNG

Đây là nội dung đọc thử tự biên soạn cho đầu sách minh họa “Bí mật của những hạt giống”. Quan sát cách một hạt giống nảy mầm và tìm hiểu điều kiện giúp cây lớn lên.

Hãy bắt đầu từ một câu hỏi: bạn muốn tìm hiểu điều gì sau khi đọc? Viết ra một ý tưởng nhỏ và liên hệ với một tình huống bạn đã trải qua.
---PAGE---
THỬ QUAN SÁT THEO MỘT CÁCH MỚI

Chọn một chi tiết trong chủ đề hôm nay. Bạn có thể ghi lại điều đã biết, điều còn chưa rõ và một ví dụ trong đời sống. Khi đặt những ghi chú cạnh nhau, hãy tìm xem có mối liên hệ nào giữa chúng.

Một câu hỏi tốt không nhất thiết phải dài. Nó chỉ cần giúp bạn nhìn rõ hơn vấn đề đang quan tâm.
---PAGE---
GHI CHÚ SAU KHI ĐỌC

Điều gì khiến bạn chú ý nhất? Bạn muốn tìm thêm cuốn sách nào về chủ đề này? Hãy lưu một câu hỏi và dành thời gian quay lại với nó.

Ba trang này minh họa thao tác đọc thử; chúng không trích từ sách đang phát hành trên thị trường.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-EX-019')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Tiếng Anh qua những ngày thường',N'Các chủ đề giới thiệu bản thân, học tập và mua sắm với bài tập từ vựng tự biên soạn.

Đầu sách, tác giả, giá, thông số và bìa là dữ liệu minh họa do dự án biên soạn để kiểm thử website.',N'DEMO-EX-019',(SELECT Id FROM dbo.Categories WHERE Name=N'Ngoại ngữ'),(SELECT Id FROM dbo.Authors WHERE Name=N'Minh Hạ'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),89000,115000,0,272,2026,N'/images/extra-19.svg',N'TRANG MẪU · TIẾNG ANH QUA NHỮNG NGÀY THƯỜNG

Đây là nội dung đọc thử tự biên soạn cho đầu sách minh họa “Tiếng Anh qua những ngày thường”. Các chủ đề giới thiệu bản thân, học tập và mua sắm với bài tập từ vựng tự biên soạn.

Hãy bắt đầu từ một câu hỏi: bạn muốn tìm hiểu điều gì sau khi đọc? Viết ra một ý tưởng nhỏ và liên hệ với một tình huống bạn đã trải qua.
---PAGE---
THỬ QUAN SÁT THEO MỘT CÁCH MỚI

Chọn một chi tiết trong chủ đề hôm nay. Bạn có thể ghi lại điều đã biết, điều còn chưa rõ và một ví dụ trong đời sống. Khi đặt những ghi chú cạnh nhau, hãy tìm xem có mối liên hệ nào giữa chúng.

Một câu hỏi tốt không nhất thiết phải dài. Nó chỉ cần giúp bạn nhìn rõ hơn vấn đề đang quan tâm.
---PAGE---
GHI CHÚ SAU KHI ĐỌC

Điều gì khiến bạn chú ý nhất? Bạn muốn tìm thêm cuốn sách nào về chủ đề này? Hãy lưu một câu hỏi và dành thời gian quay lại với nó.

Ba trang này minh họa thao tác đọc thử; chúng không trích từ sách đang phát hành trên thị trường.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-EX-020')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Sổ tay từ vựng theo chủ đề',N'Cách tổ chức từ mới, viết câu ví dụ và ôn tập bằng những nhóm chủ đề nhỏ.

Đầu sách, tác giả, giá, thông số và bìa là dữ liệu minh họa do dự án biên soạn để kiểm thử website.',N'DEMO-EX-020',(SELECT Id FROM dbo.Categories WHERE Name=N'Ngoại ngữ'),(SELECT Id FROM dbo.Authors WHERE Name=N'Hoàng Duy'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),109000,145000,32,280,2026,N'/images/extra-20.svg',N'TRANG MẪU · SỔ TAY TỪ VỰNG THEO CHỦ ĐỀ

Đây là nội dung đọc thử tự biên soạn cho đầu sách minh họa “Sổ tay từ vựng theo chủ đề”. Cách tổ chức từ mới, viết câu ví dụ và ôn tập bằng những nhóm chủ đề nhỏ.

Hãy bắt đầu từ một câu hỏi: bạn muốn tìm hiểu điều gì sau khi đọc? Viết ra một ý tưởng nhỏ và liên hệ với một tình huống bạn đã trải qua.
---PAGE---
THỬ QUAN SÁT THEO MỘT CÁCH MỚI

Chọn một chi tiết trong chủ đề hôm nay. Bạn có thể ghi lại điều đã biết, điều còn chưa rõ và một ví dụ trong đời sống. Khi đặt những ghi chú cạnh nhau, hãy tìm xem có mối liên hệ nào giữa chúng.

Một câu hỏi tốt không nhất thiết phải dài. Nó chỉ cần giúp bạn nhìn rõ hơn vấn đề đang quan tâm.
---PAGE---
GHI CHÚ SAU KHI ĐỌC

Điều gì khiến bạn chú ý nhất? Bạn muốn tìm thêm cuốn sách nào về chủ đề này? Hãy lưu một câu hỏi và dành thời gian quay lại với nó.

Ba trang này minh họa thao tác đọc thử; chúng không trích từ sách đang phát hành trên thị trường.',1,N'Tiếng Việt',N'Bìa cứng',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-EX-021')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Một câu chuyện, hai ngôn ngữ',N'Những mẩu chuyện Việt – Anh ngắn do dự án biên soạn để luyện đọc và so sánh cách diễn đạt.

Đầu sách, tác giả, giá, thông số và bìa là dữ liệu minh họa do dự án biên soạn để kiểm thử website.',N'DEMO-EX-021',(SELECT Id FROM dbo.Categories WHERE Name=N'Ngoại ngữ'),(SELECT Id FROM dbo.Authors WHERE Name=N'Linh Chi'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),139000,185000,33,288,2026,N'/images/extra-21.svg',N'TRANG MẪU · MỘT CÂU CHUYỆN, HAI NGÔN NGỮ

Đây là nội dung đọc thử tự biên soạn cho đầu sách minh họa “Một câu chuyện, hai ngôn ngữ”. Những mẩu chuyện Việt – Anh ngắn do dự án biên soạn để luyện đọc và so sánh cách diễn đạt.

Hãy bắt đầu từ một câu hỏi: bạn muốn tìm hiểu điều gì sau khi đọc? Viết ra một ý tưởng nhỏ và liên hệ với một tình huống bạn đã trải qua.
---PAGE---
THỬ QUAN SÁT THEO MỘT CÁCH MỚI

Chọn một chi tiết trong chủ đề hôm nay. Bạn có thể ghi lại điều đã biết, điều còn chưa rõ và một ví dụ trong đời sống. Khi đặt những ghi chú cạnh nhau, hãy tìm xem có mối liên hệ nào giữa chúng.

Một câu hỏi tốt không nhất thiết phải dài. Nó chỉ cần giúp bạn nhìn rõ hơn vấn đề đang quan tâm.
---PAGE---
GHI CHÚ SAU KHI ĐỌC

Điều gì khiến bạn chú ý nhất? Bạn muốn tìm thêm cuốn sách nào về chủ đề này? Hãy lưu một câu hỏi và dành thời gian quay lại với nó.

Ba trang này minh họa thao tác đọc thử; chúng không trích từ sách đang phát hành trên thị trường.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-EX-022')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Lập trình từ bài học đầu tiên',N'Làm quen với biến, điều kiện, vòng lặp và cách chia một bài toán thành các bước nhỏ.

Đầu sách, tác giả, giá, thông số và bìa là dữ liệu minh họa do dự án biên soạn để kiểm thử website.',N'DEMO-EX-022',(SELECT Id FROM dbo.Categories WHERE Name=N'Công nghệ'),(SELECT Id FROM dbo.Authors WHERE Name=N'Quang Lâm'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),179000,239000,34,296,2026,N'/images/extra-22.svg',N'TRANG MẪU · LẬP TRÌNH TỪ BÀI HỌC ĐẦU TIÊN

Đây là nội dung đọc thử tự biên soạn cho đầu sách minh họa “Lập trình từ bài học đầu tiên”. Làm quen với biến, điều kiện, vòng lặp và cách chia một bài toán thành các bước nhỏ.

Hãy bắt đầu từ một câu hỏi: bạn muốn tìm hiểu điều gì sau khi đọc? Viết ra một ý tưởng nhỏ và liên hệ với một tình huống bạn đã trải qua.
---PAGE---
THỬ QUAN SÁT THEO MỘT CÁCH MỚI

Chọn một chi tiết trong chủ đề hôm nay. Bạn có thể ghi lại điều đã biết, điều còn chưa rõ và một ví dụ trong đời sống. Khi đặt những ghi chú cạnh nhau, hãy tìm xem có mối liên hệ nào giữa chúng.

Một câu hỏi tốt không nhất thiết phải dài. Nó chỉ cần giúp bạn nhìn rõ hơn vấn đề đang quan tâm.
---PAGE---
GHI CHÚ SAU KHI ĐỌC

Điều gì khiến bạn chú ý nhất? Bạn muốn tìm thêm cuốn sách nào về chủ đề này? Hãy lưu một câu hỏi và dành thời gian quay lại với nó.

Ba trang này minh họa thao tác đọc thử; chúng không trích từ sách đang phát hành trên thị trường.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-EX-023')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Thiết kế website dễ sử dụng',N'Tìm hiểu bố cục, điều hướng, tính dễ đọc và cách kiểm tra giao diện trên điện thoại.

Đầu sách, tác giả, giá, thông số và bìa là dữ liệu minh họa do dự án biên soạn để kiểm thử website.',N'DEMO-EX-023',(SELECT Id FROM dbo.Categories WHERE Name=N'Công nghệ'),(SELECT Id FROM dbo.Authors WHERE Name=N'Mai Vy'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),219000,289000,35,304,2026,N'/images/extra-23.svg',N'TRANG MẪU · THIẾT KẾ WEBSITE DỄ SỬ DỤNG

Đây là nội dung đọc thử tự biên soạn cho đầu sách minh họa “Thiết kế website dễ sử dụng”. Tìm hiểu bố cục, điều hướng, tính dễ đọc và cách kiểm tra giao diện trên điện thoại.

Hãy bắt đầu từ một câu hỏi: bạn muốn tìm hiểu điều gì sau khi đọc? Viết ra một ý tưởng nhỏ và liên hệ với một tình huống bạn đã trải qua.
---PAGE---
THỬ QUAN SÁT THEO MỘT CÁCH MỚI

Chọn một chi tiết trong chủ đề hôm nay. Bạn có thể ghi lại điều đã biết, điều còn chưa rõ và một ví dụ trong đời sống. Khi đặt những ghi chú cạnh nhau, hãy tìm xem có mối liên hệ nào giữa chúng.

Một câu hỏi tốt không nhất thiết phải dài. Nó chỉ cần giúp bạn nhìn rõ hơn vấn đề đang quan tâm.
---PAGE---
GHI CHÚ SAU KHI ĐỌC

Điều gì khiến bạn chú ý nhất? Bạn muốn tìm thêm cuốn sách nào về chủ đề này? Hãy lưu một câu hỏi và dành thời gian quay lại với nó.

Ba trang này minh họa thao tác đọc thử; chúng không trích từ sách đang phát hành trên thị trường.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-EX-024')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Dữ liệu kể câu chuyện gì',N'Bắt đầu với bảng dữ liệu nhỏ, đặt câu hỏi và chọn cách trình bày dễ hiểu.

Đầu sách, tác giả, giá, thông số và bìa là dữ liệu minh họa do dự án biên soạn để kiểm thử website.',N'DEMO-EX-024',(SELECT Id FROM dbo.Categories WHERE Name=N'Công nghệ'),(SELECT Id FROM dbo.Authors WHERE Name=N'An Nhiên'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),69000,89000,36,312,2026,N'/images/extra-24.svg',N'TRANG MẪU · DỮ LIỆU KỂ CÂU CHUYỆN GÌ

Đây là nội dung đọc thử tự biên soạn cho đầu sách minh họa “Dữ liệu kể câu chuyện gì”. Bắt đầu với bảng dữ liệu nhỏ, đặt câu hỏi và chọn cách trình bày dễ hiểu.

Hãy bắt đầu từ một câu hỏi: bạn muốn tìm hiểu điều gì sau khi đọc? Viết ra một ý tưởng nhỏ và liên hệ với một tình huống bạn đã trải qua.
---PAGE---
THỬ QUAN SÁT THEO MỘT CÁCH MỚI

Chọn một chi tiết trong chủ đề hôm nay. Bạn có thể ghi lại điều đã biết, điều còn chưa rõ và một ví dụ trong đời sống. Khi đặt những ghi chú cạnh nhau, hãy tìm xem có mối liên hệ nào giữa chúng.

Một câu hỏi tốt không nhất thiết phải dài. Nó chỉ cần giúp bạn nhìn rõ hơn vấn đề đang quan tâm.
---PAGE---
GHI CHÚ SAU KHI ĐỌC

Điều gì khiến bạn chú ý nhất? Bạn muốn tìm thêm cuốn sách nào về chủ đề này? Hãy lưu một câu hỏi và dành thời gian quay lại với nó.

Ba trang này minh họa thao tác đọc thử; chúng không trích từ sách đang phát hành trên thị trường.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'CAT-2026-001')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Nhà giả kim',N'Một tiểu thuyết theo chân Santiago trên hành trình tìm kiếm điều mình mong muốn, đặt ra câu hỏi về lựa chọn và ý nghĩa của hạnh phúc.

Thông tin thư mục đối chiếu từ trang Nhã Nam được dẫn bên dưới. Mã CAT là mã nội bộ, không phải ISBN. Giá, tồn kho và bìa thiết kế chỉ dùng để minh họa; chưa cung cấp nội dung đọc thử của ấn bản này.',N'CAT-2026-001',(SELECT Id FROM dbo.Categories WHERE Name=N'Văn học'),(SELECT Id FROM dbo.Authors WHERE Name=N'Paulo Coelho'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Hội Nhà Văn'),79000,99000,21,228,2020,N'/images/catalog-01.svg',N'',1,N'Tiếng Việt',N'Đang cập nhật',N'',N'Lê Chu Cầu',N'https://nhanam.vn/nha-gia-kim-tb-2026');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'CAT-2026-002')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Điều kỳ diệu của tiệm tạp hóa Namiya',N'Những lá thư xuất hiện ở một tiệm tạp hóa tạo nên câu chuyện kết nối con người qua thời gian, với các tình huống đan xen và bất ngờ.

Thông tin thư mục đối chiếu từ trang Nhã Nam được dẫn bên dưới. Mã CAT là mã nội bộ, không phải ISBN. Giá, tồn kho và bìa thiết kế chỉ dùng để minh họa; chưa cung cấp nội dung đọc thử của ấn bản này.',N'CAT-2026-002',(SELECT Id FROM dbo.Categories WHERE Name=N'Văn học'),(SELECT Id FROM dbo.Authors WHERE Name=N'Higashino Keigo'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Hội Nhà Văn'),119000,149000,22,358,2025,N'/images/catalog-02.svg',N'',1,N'Tiếng Việt',N'Đang cập nhật',N'14 x 20.5 cm',N'Phương Nam',N'https://nhanam.vn/dieu-ky-dieu-cua-tiem-tap-hoa-namiya');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'CAT-2026-003')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Hoàng tử bé',N'Câu chuyện về một vị khách nhỏ từ hành tinh xa, gợi suy nghĩ về tình bạn, sự quan tâm và cách người lớn nhìn thế giới.

Thông tin thư mục đối chiếu từ trang Nhã Nam được dẫn bên dưới. Mã CAT là mã nội bộ, không phải ISBN. Giá, tồn kho và bìa thiết kế chỉ dùng để minh họa; chưa cung cấp nội dung đọc thử của ấn bản này.',N'CAT-2026-003',(SELECT Id FROM dbo.Categories WHERE Name=N'Thiếu nhi'),(SELECT Id FROM dbo.Authors WHERE Name=N'Antoine de Saint-Exupéry'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Hội Nhà Văn'),69000,89000,23,104,2020,N'/images/catalog-03.svg',N'',1,N'Tiếng Việt',N'Đang cập nhật',N'15 x 23 cm',N'Trác Phong',N'https://nhanam.vn/hoang-tu-be-tb-2025');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'CAT-2026-004')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Dưới bầu trời trắng',N'Một tác phẩm phi hư cấu xem xét những cách con người can thiệp vào môi trường và các câu hỏi đi kèm việc sửa chữa tác động của chính mình.

Thông tin thư mục đối chiếu từ trang Nhã Nam được dẫn bên dưới. Mã CAT là mã nội bộ, không phải ISBN. Giá, tồn kho và bìa thiết kế chỉ dùng để minh họa; chưa cung cấp nội dung đọc thử của ấn bản này.',N'CAT-2026-004',(SELECT Id FROM dbo.Categories WHERE Name=N'Khoa học'),(SELECT Id FROM dbo.Authors WHERE Name=N'Elizabeth Kolbert'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Tổng hợp TP.HCM'),139000,179000,24,356,2024,N'/images/catalog-04.svg',N'',1,N'Tiếng Việt',N'Đang cập nhật',N'14 x 20.5 cm',N'Hà Hường',N'https://nhanam.vn/duoi-bau-troi-trang-nha-nam');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'CAT-2026-005')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Họ và tên (bìa cứng)',N'Một công trình khảo cứu về tên họ người Việt, đặt việc gọi tên trong quan hệ với lịch sử và đời sống văn hóa.

Thông tin thư mục đối chiếu từ trang Nhã Nam được dẫn bên dưới. Mã CAT là mã nội bộ, không phải ISBN. Giá, tồn kho và bìa thiết kế chỉ dùng để minh họa; chưa cung cấp nội dung đọc thử của ấn bản này.',N'CAT-2026-005',(SELECT Id FROM dbo.Categories WHERE Name=N'Lịch sử & văn hóa'),(SELECT Id FROM dbo.Authors WHERE Name=N'Trần Quang Đức'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Thế Giới'),349000,439000,25,373,2026,N'/images/catalog-05.svg',N'',1,N'Tiếng Việt',N'Bìa cứng',N'15.5 x 24 cm',N'',N'https://nhanam.vn/ho-va-ten-bia-cung');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'CAT-2026-006')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Văn minh Việt Nam',N'Công trình nghiên cứu của Nguyễn Văn Huyên cung cấp một góc nhìn về văn hóa và xã hội Việt Nam qua những khảo sát của tác giả.

Thông tin thư mục đối chiếu từ trang Nhã Nam được dẫn bên dưới. Mã CAT là mã nội bộ, không phải ISBN. Giá, tồn kho và bìa thiết kế chỉ dùng để minh họa; chưa cung cấp nội dung đọc thử của ấn bản này.',N'CAT-2026-006',(SELECT Id FROM dbo.Categories WHERE Name=N'Lịch sử & văn hóa'),(SELECT Id FROM dbo.Authors WHERE Name=N'Nguyễn Văn Huyên'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Hội Nhà Văn'),119000,149000,26,324,2023,N'/images/catalog-06.svg',N'',1,N'Tiếng Việt',N'Đang cập nhật',N'15.5 x 24 cm',N'Đỗ Trọng Quang',N'https://nhanam.vn/van-minh-viet-nam-nha-nam-tai-ban');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'CAT-2026-007')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'3 phút sơ cứu',N'Sách của bác sĩ Ngô Đức Hùng giới thiệu chủ đề sơ cứu cho bạn đọc phổ thông. Trang này chỉ cung cấp thông tin về sách.

Thông tin thư mục đối chiếu từ trang Nhã Nam được dẫn bên dưới. Mã CAT là mã nội bộ, không phải ISBN. Giá, tồn kho và bìa thiết kế chỉ dùng để minh họa; chưa cung cấp nội dung đọc thử của ấn bản này.',N'CAT-2026-007',(SELECT Id FROM dbo.Categories WHERE Name=N'Sức khỏe'),(SELECT Id FROM dbo.Authors WHERE Name=N'Ngô Đức Hùng'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Thế Giới'),129000,169000,27,204,2025,N'/images/catalog-07.svg',N'',1,N'Tiếng Việt',N'Đang cập nhật',N'',N'',N'https://nhanam.vn/3-phut-so-cuu');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH (UPDLOCK,HOLDLOCK) WHERE Isbn=N'CAT-2026-008')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Nỗi đau của chàng Werther (bìa cứng)',N'Tiểu thuyết kinh điển của Goethe kể về Werther và một mối tình để lại nhiều day dứt, gắn với lịch sử văn học châu Âu.

Thông tin thư mục đối chiếu từ trang Nhã Nam được dẫn bên dưới. Mã CAT là mã nội bộ, không phải ISBN. Giá, tồn kho và bìa thiết kế chỉ dùng để minh họa; chưa cung cấp nội dung đọc thử của ấn bản này.',N'CAT-2026-008',(SELECT Id FROM dbo.Categories WHERE Name=N'Văn học'),(SELECT Id FROM dbo.Authors WHERE Name=N'Johann Wolfgang von Goethe'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Văn Học'),99000,129000,28,220,2024,N'/images/catalog-08.svg',N'',1,N'Tiếng Việt',N'Bìa cứng',N'14 x 20.5 cm',N'Quang Chiến',N'https://nhanam.vn/noi-dau-cua-chang-werther-bia-cung');
 COMMIT TRANSACTION;
END TRY
BEGIN CATCH
 IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
 THROW;
END CATCH;
GO
SELECT COUNT(*) AS TongSoSach FROM dbo.Books;
PRINT N'Da them du lieu catalog. Du lieu cu duoc giu nguyen.';
GO
