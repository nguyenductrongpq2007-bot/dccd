USE BookStoreOnline;
GO
-- Chay sau 03_upgrade.sql va 04_catalog.sql. Them 24 sach minh hoa, khong sua du lieu cu.
-- Ma DEMO-HOME la ma noi bo. Chay lai khong chen trung.
SET XACT_ABORT ON;
BEGIN TRY
 BEGIN TRANSACTION;
 IF NOT EXISTS(SELECT 1 FROM dbo.Categories WITH(UPDLOCK,HOLDLOCK) WHERE Name=N'Công nghệ') INSERT INTO dbo.Categories(Name) VALUES(N'Công nghệ');
 IF NOT EXISTS(SELECT 1 FROM dbo.Categories WITH(UPDLOCK,HOLDLOCK) WHERE Name=N'Khoa học') INSERT INTO dbo.Categories(Name) VALUES(N'Khoa học');
 IF NOT EXISTS(SELECT 1 FROM dbo.Categories WITH(UPDLOCK,HOLDLOCK) WHERE Name=N'Kinh tế') INSERT INTO dbo.Categories(Name) VALUES(N'Kinh tế');
 IF NOT EXISTS(SELECT 1 FROM dbo.Categories WITH(UPDLOCK,HOLDLOCK) WHERE Name=N'Kỹ năng sống') INSERT INTO dbo.Categories(Name) VALUES(N'Kỹ năng sống');
 IF NOT EXISTS(SELECT 1 FROM dbo.Categories WITH(UPDLOCK,HOLDLOCK) WHERE Name=N'Lịch sử & văn hóa') INSERT INTO dbo.Categories(Name) VALUES(N'Lịch sử & văn hóa');
 IF NOT EXISTS(SELECT 1 FROM dbo.Categories WITH(UPDLOCK,HOLDLOCK) WHERE Name=N'Ngoại ngữ') INSERT INTO dbo.Categories(Name) VALUES(N'Ngoại ngữ');
 IF NOT EXISTS(SELECT 1 FROM dbo.Categories WITH(UPDLOCK,HOLDLOCK) WHERE Name=N'Sức khỏe') INSERT INTO dbo.Categories(Name) VALUES(N'Sức khỏe');
 IF NOT EXISTS(SELECT 1 FROM dbo.Categories WITH(UPDLOCK,HOLDLOCK) WHERE Name=N'Thiếu nhi') INSERT INTO dbo.Categories(Name) VALUES(N'Thiếu nhi');
 IF NOT EXISTS(SELECT 1 FROM dbo.Categories WITH(UPDLOCK,HOLDLOCK) WHERE Name=N'Tâm lý') INSERT INTO dbo.Categories(Name) VALUES(N'Tâm lý');
 IF NOT EXISTS(SELECT 1 FROM dbo.Categories WITH(UPDLOCK,HOLDLOCK) WHERE Name=N'Văn học') INSERT INTO dbo.Categories(Name) VALUES(N'Văn học');
 IF NOT EXISTS(SELECT 1 FROM dbo.Authors WITH(UPDLOCK,HOLDLOCK) WHERE Name=N'An Nhiên') INSERT INTO dbo.Authors(Name) VALUES(N'An Nhiên');
 IF NOT EXISTS(SELECT 1 FROM dbo.Authors WITH(UPDLOCK,HOLDLOCK) WHERE Name=N'Hoàng Duy') INSERT INTO dbo.Authors(Name) VALUES(N'Hoàng Duy');
 IF NOT EXISTS(SELECT 1 FROM dbo.Authors WITH(UPDLOCK,HOLDLOCK) WHERE Name=N'Linh Chi') INSERT INTO dbo.Authors(Name) VALUES(N'Linh Chi');
 IF NOT EXISTS(SELECT 1 FROM dbo.Authors WITH(UPDLOCK,HOLDLOCK) WHERE Name=N'Mai Vy') INSERT INTO dbo.Authors(Name) VALUES(N'Mai Vy');
 IF NOT EXISTS(SELECT 1 FROM dbo.Authors WITH(UPDLOCK,HOLDLOCK) WHERE Name=N'Minh Hạ') INSERT INTO dbo.Authors(Name) VALUES(N'Minh Hạ');
 IF NOT EXISTS(SELECT 1 FROM dbo.Authors WITH(UPDLOCK,HOLDLOCK) WHERE Name=N'Quang Lâm') INSERT INTO dbo.Authors(Name) VALUES(N'Quang Lâm');
 IF NOT EXISTS(SELECT 1 FROM dbo.Publishers WITH(UPDLOCK,HOLDLOCK) WHERE Name=N'NXB Hành Trình (mẫu)') INSERT INTO dbo.Publishers(Name) VALUES(N'NXB Hành Trình (mẫu)');
 IF NOT EXISTS(SELECT 1 FROM dbo.Publishers WITH(UPDLOCK,HOLDLOCK) WHERE Name=N'NXB Mộc Tri Thức (mẫu)') INSERT INTO dbo.Publishers(Name) VALUES(N'NXB Mộc Tri Thức (mẫu)');
 IF NOT EXISTS(SELECT 1 FROM dbo.Publishers WITH(UPDLOCK,HOLDLOCK) WHERE Name=N'NXB Trang Mới (mẫu)') INSERT INTO dbo.Publishers(Name) VALUES(N'NXB Trang Mới (mẫu)');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH(UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-HOME-001')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Những lá thư bên cửa sổ',N'Một câu chuyện tự biên soạn về ký ức, những cuộc gặp và cách con người lưu giữ điều thân thuộc.

Tên sách, tác giả, ấn bản, thông số, giá và bìa do dự án tạo để minh họa giao diện. Mã DEMO-HOME là mã nội bộ, không phải ISBN.',N'DEMO-HOME-001',(SELECT Id FROM dbo.Categories WHERE Name=N'Văn học'),(SELECT Id FROM dbo.Authors WHERE Name=N'An Nhiên'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),59000,89000,16,104,2026,N'/images/home-book-01.svg',N'ĐỌC THỬ MINH HỌA · NHỮNG LÁ THƯ BÊN CỬA SỔ

Một câu chuyện tự biên soạn về ký ức, những cuộc gặp và cách con người lưu giữ điều thân thuộc.

Bạn có thể bắt đầu bằng một câu hỏi về chủ đề này. Điều gì khiến bạn chú ý? Ghi lại một chi tiết trước khi chuyển sang trang tiếp theo.
---PAGE---
MỘT CHI TIẾT, MỘT GÓC NHÌN

Chọn một tình huống gần gũi với bạn. Thử mô tả điều bạn nhìn thấy, thay vì vội đi đến kết luận. Một ví dụ cụ thể giúp câu hỏi ban đầu rõ ràng hơn.

Trang mẫu này do dự án tự biên soạn để kiểm thử chức năng đọc sách.
---PAGE---
SAU KHI ĐỌC

Viết một ý bạn muốn giữ lại, một điều còn chưa rõ và một chủ đề muốn đọc thêm. Bạn có thể trở lại những ghi chú này vào một ngày khác.

Đây là đầu sách minh họa, không phải trích đoạn của một ấn bản thương mại.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH(UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-HOME-002')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Chuyến xe về miền ký ức',N'Một câu chuyện tự biên soạn về ký ức, những cuộc gặp và cách con người lưu giữ điều thân thuộc.

Tên sách, tác giả, ấn bản, thông số, giá và bìa do dự án tạo để minh họa giao diện. Mã DEMO-HOME là mã nội bộ, không phải ISBN.',N'DEMO-HOME-002',(SELECT Id FROM dbo.Categories WHERE Name=N'Văn học'),(SELECT Id FROM dbo.Authors WHERE Name=N'Minh Hạ'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Trang Mới (mẫu)'),79000,109000,17,112,2026,N'/images/home-book-02.svg',N'ĐỌC THỬ MINH HỌA · CHUYẾN XE VỀ MIỀN KÝ ỨC

Một câu chuyện tự biên soạn về ký ức, những cuộc gặp và cách con người lưu giữ điều thân thuộc.

Bạn có thể bắt đầu bằng một câu hỏi về chủ đề này. Điều gì khiến bạn chú ý? Ghi lại một chi tiết trước khi chuyển sang trang tiếp theo.
---PAGE---
MỘT CHI TIẾT, MỘT GÓC NHÌN

Chọn một tình huống gần gũi với bạn. Thử mô tả điều bạn nhìn thấy, thay vì vội đi đến kết luận. Một ví dụ cụ thể giúp câu hỏi ban đầu rõ ràng hơn.

Trang mẫu này do dự án tự biên soạn để kiểm thử chức năng đọc sách.
---PAGE---
SAU KHI ĐỌC

Viết một ý bạn muốn giữ lại, một điều còn chưa rõ và một chủ đề muốn đọc thêm. Bạn có thể trở lại những ghi chú này vào một ngày khác.

Đây là đầu sách minh họa, không phải trích đoạn của một ấn bản thương mại.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH(UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-HOME-003')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Người giữ mùa nắng',N'Một câu chuyện tự biên soạn về ký ức, những cuộc gặp và cách con người lưu giữ điều thân thuộc.

Tên sách, tác giả, ấn bản, thông số, giá và bìa do dự án tạo để minh họa giao diện. Mã DEMO-HOME là mã nội bộ, không phải ISBN.',N'DEMO-HOME-003',(SELECT Id FROM dbo.Categories WHERE Name=N'Văn học'),(SELECT Id FROM dbo.Authors WHERE Name=N'Hoàng Duy'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Hành Trình (mẫu)'),99000,129000,18,120,2026,N'/images/home-book-03.svg',N'ĐỌC THỬ MINH HỌA · NGƯỜI GIỮ MÙA NẮNG

Một câu chuyện tự biên soạn về ký ức, những cuộc gặp và cách con người lưu giữ điều thân thuộc.

Bạn có thể bắt đầu bằng một câu hỏi về chủ đề này. Điều gì khiến bạn chú ý? Ghi lại một chi tiết trước khi chuyển sang trang tiếp theo.
---PAGE---
MỘT CHI TIẾT, MỘT GÓC NHÌN

Chọn một tình huống gần gũi với bạn. Thử mô tả điều bạn nhìn thấy, thay vì vội đi đến kết luận. Một ví dụ cụ thể giúp câu hỏi ban đầu rõ ràng hơn.

Trang mẫu này do dự án tự biên soạn để kiểm thử chức năng đọc sách.
---PAGE---
SAU KHI ĐỌC

Viết một ý bạn muốn giữ lại, một điều còn chưa rõ và một chủ đề muốn đọc thêm. Bạn có thể trở lại những ghi chú này vào một ngày khác.

Đây là đầu sách minh họa, không phải trích đoạn của một ấn bản thương mại.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH(UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-HOME-004')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Ngân sách cho những mục tiêu nhỏ',N'Tình huống minh họa về ghi chép, lập kế hoạch và quan sát nhu cầu trong đời sống; không phải lời khuyên đầu tư.

Tên sách, tác giả, ấn bản, thông số, giá và bìa do dự án tạo để minh họa giao diện. Mã DEMO-HOME là mã nội bộ, không phải ISBN.',N'DEMO-HOME-004',(SELECT Id FROM dbo.Categories WHERE Name=N'Kinh tế'),(SELECT Id FROM dbo.Authors WHERE Name=N'Linh Chi'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),129000,159000,19,128,2026,N'/images/home-book-04.svg',N'ĐỌC THỬ MINH HỌA · NGÂN SÁCH CHO NHỮNG MỤC TIÊU NHỎ

Tình huống minh họa về ghi chép, lập kế hoạch và quan sát nhu cầu trong đời sống; không phải lời khuyên đầu tư.

Bạn có thể bắt đầu bằng một câu hỏi về chủ đề này. Điều gì khiến bạn chú ý? Ghi lại một chi tiết trước khi chuyển sang trang tiếp theo.
---PAGE---
MỘT CHI TIẾT, MỘT GÓC NHÌN

Chọn một tình huống gần gũi với bạn. Thử mô tả điều bạn nhìn thấy, thay vì vội đi đến kết luận. Một ví dụ cụ thể giúp câu hỏi ban đầu rõ ràng hơn.

Trang mẫu này do dự án tự biên soạn để kiểm thử chức năng đọc sách.
---PAGE---
SAU KHI ĐỌC

Viết một ý bạn muốn giữ lại, một điều còn chưa rõ và một chủ đề muốn đọc thêm. Bạn có thể trở lại những ghi chú này vào một ngày khác.

Đây là đầu sách minh họa, không phải trích đoạn của một ấn bản thương mại.',1,N'Tiếng Việt',N'Bìa cứng',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH(UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-HOME-005')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Một cửa hàng, nhiều câu chuyện',N'Tình huống minh họa về ghi chép, lập kế hoạch và quan sát nhu cầu trong đời sống; không phải lời khuyên đầu tư.

Tên sách, tác giả, ấn bản, thông số, giá và bìa do dự án tạo để minh họa giao diện. Mã DEMO-HOME là mã nội bộ, không phải ISBN.',N'DEMO-HOME-005',(SELECT Id FROM dbo.Categories WHERE Name=N'Kinh tế'),(SELECT Id FROM dbo.Authors WHERE Name=N'Quang Lâm'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Trang Mới (mẫu)'),159000,189000,20,136,2026,N'/images/home-book-05.svg',N'ĐỌC THỬ MINH HỌA · MỘT CỬA HÀNG, NHIỀU CÂU CHUYỆN

Tình huống minh họa về ghi chép, lập kế hoạch và quan sát nhu cầu trong đời sống; không phải lời khuyên đầu tư.

Bạn có thể bắt đầu bằng một câu hỏi về chủ đề này. Điều gì khiến bạn chú ý? Ghi lại một chi tiết trước khi chuyển sang trang tiếp theo.
---PAGE---
MỘT CHI TIẾT, MỘT GÓC NHÌN

Chọn một tình huống gần gũi với bạn. Thử mô tả điều bạn nhìn thấy, thay vì vội đi đến kết luận. Một ví dụ cụ thể giúp câu hỏi ban đầu rõ ràng hơn.

Trang mẫu này do dự án tự biên soạn để kiểm thử chức năng đọc sách.
---PAGE---
SAU KHI ĐỌC

Viết một ý bạn muốn giữ lại, một điều còn chưa rõ và một chủ đề muốn đọc thêm. Bạn có thể trở lại những ghi chú này vào một ngày khác.

Đây là đầu sách minh họa, không phải trích đoạn của một ấn bản thương mại.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH(UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-HOME-006')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Hiểu khách hàng từ điều giản dị',N'Tình huống minh họa về ghi chép, lập kế hoạch và quan sát nhu cầu trong đời sống; không phải lời khuyên đầu tư.

Tên sách, tác giả, ấn bản, thông số, giá và bìa do dự án tạo để minh họa giao diện. Mã DEMO-HOME là mã nội bộ, không phải ISBN.',N'DEMO-HOME-006',(SELECT Id FROM dbo.Categories WHERE Name=N'Kinh tế'),(SELECT Id FROM dbo.Authors WHERE Name=N'Mai Vy'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Hành Trình (mẫu)'),189000,219000,21,144,2026,N'/images/home-book-06.svg',N'ĐỌC THỬ MINH HỌA · HIỂU KHÁCH HÀNG TỪ ĐIỀU GIẢN DỊ

Tình huống minh họa về ghi chép, lập kế hoạch và quan sát nhu cầu trong đời sống; không phải lời khuyên đầu tư.

Bạn có thể bắt đầu bằng một câu hỏi về chủ đề này. Điều gì khiến bạn chú ý? Ghi lại một chi tiết trước khi chuyển sang trang tiếp theo.
---PAGE---
MỘT CHI TIẾT, MỘT GÓC NHÌN

Chọn một tình huống gần gũi với bạn. Thử mô tả điều bạn nhìn thấy, thay vì vội đi đến kết luận. Một ví dụ cụ thể giúp câu hỏi ban đầu rõ ràng hơn.

Trang mẫu này do dự án tự biên soạn để kiểm thử chức năng đọc sách.
---PAGE---
SAU KHI ĐỌC

Viết một ý bạn muốn giữ lại, một điều còn chưa rõ và một chủ đề muốn đọc thêm. Bạn có thể trở lại những ghi chú này vào một ngày khác.

Đây là đầu sách minh họa, không phải trích đoạn của một ấn bản thương mại.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH(UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-HOME-007')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Sắp xếp một ngày vừa đủ',N'Gợi ý thực hành sắp xếp công việc, giao tiếp và lựa chọn một mục tiêu nhỏ mỗi ngày.

Tên sách, tác giả, ấn bản, thông số, giá và bìa do dự án tạo để minh họa giao diện. Mã DEMO-HOME là mã nội bộ, không phải ISBN.',N'DEMO-HOME-007',(SELECT Id FROM dbo.Categories WHERE Name=N'Kỹ năng sống'),(SELECT Id FROM dbo.Authors WHERE Name=N'An Nhiên'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),59000,89000,22,152,2026,N'/images/home-book-07.svg',N'ĐỌC THỬ MINH HỌA · SẮP XẾP MỘT NGÀY VỪA ĐỦ

Gợi ý thực hành sắp xếp công việc, giao tiếp và lựa chọn một mục tiêu nhỏ mỗi ngày.

Bạn có thể bắt đầu bằng một câu hỏi về chủ đề này. Điều gì khiến bạn chú ý? Ghi lại một chi tiết trước khi chuyển sang trang tiếp theo.
---PAGE---
MỘT CHI TIẾT, MỘT GÓC NHÌN

Chọn một tình huống gần gũi với bạn. Thử mô tả điều bạn nhìn thấy, thay vì vội đi đến kết luận. Một ví dụ cụ thể giúp câu hỏi ban đầu rõ ràng hơn.

Trang mẫu này do dự án tự biên soạn để kiểm thử chức năng đọc sách.
---PAGE---
SAU KHI ĐỌC

Viết một ý bạn muốn giữ lại, một điều còn chưa rõ và một chủ đề muốn đọc thêm. Bạn có thể trở lại những ghi chú này vào một ngày khác.

Đây là đầu sách minh họa, không phải trích đoạn của một ấn bản thương mại.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH(UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-HOME-008')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Nói điều mình muốn nói',N'Gợi ý thực hành sắp xếp công việc, giao tiếp và lựa chọn một mục tiêu nhỏ mỗi ngày.

Tên sách, tác giả, ấn bản, thông số, giá và bìa do dự án tạo để minh họa giao diện. Mã DEMO-HOME là mã nội bộ, không phải ISBN.',N'DEMO-HOME-008',(SELECT Id FROM dbo.Categories WHERE Name=N'Kỹ năng sống'),(SELECT Id FROM dbo.Authors WHERE Name=N'Minh Hạ'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Trang Mới (mẫu)'),79000,109000,23,160,2026,N'/images/home-book-08.svg',N'ĐỌC THỬ MINH HỌA · NÓI ĐIỀU MÌNH MUỐN NÓI

Gợi ý thực hành sắp xếp công việc, giao tiếp và lựa chọn một mục tiêu nhỏ mỗi ngày.

Bạn có thể bắt đầu bằng một câu hỏi về chủ đề này. Điều gì khiến bạn chú ý? Ghi lại một chi tiết trước khi chuyển sang trang tiếp theo.
---PAGE---
MỘT CHI TIẾT, MỘT GÓC NHÌN

Chọn một tình huống gần gũi với bạn. Thử mô tả điều bạn nhìn thấy, thay vì vội đi đến kết luận. Một ví dụ cụ thể giúp câu hỏi ban đầu rõ ràng hơn.

Trang mẫu này do dự án tự biên soạn để kiểm thử chức năng đọc sách.
---PAGE---
SAU KHI ĐỌC

Viết một ý bạn muốn giữ lại, một điều còn chưa rõ và một chủ đề muốn đọc thêm. Bạn có thể trở lại những ghi chú này vào một ngày khác.

Đây là đầu sách minh họa, không phải trích đoạn của một ấn bản thương mại.',1,N'Tiếng Việt',N'Bìa cứng',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH(UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-HOME-009')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Một trang kế hoạch cho ngày mai',N'Gợi ý thực hành sắp xếp công việc, giao tiếp và lựa chọn một mục tiêu nhỏ mỗi ngày.

Tên sách, tác giả, ấn bản, thông số, giá và bìa do dự án tạo để minh họa giao diện. Mã DEMO-HOME là mã nội bộ, không phải ISBN.',N'DEMO-HOME-009',(SELECT Id FROM dbo.Categories WHERE Name=N'Kỹ năng sống'),(SELECT Id FROM dbo.Authors WHERE Name=N'Hoàng Duy'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Hành Trình (mẫu)'),99000,129000,24,168,2026,N'/images/home-book-09.svg',N'ĐỌC THỬ MINH HỌA · MỘT TRANG KẾ HOẠCH CHO NGÀY MAI

Gợi ý thực hành sắp xếp công việc, giao tiếp và lựa chọn một mục tiêu nhỏ mỗi ngày.

Bạn có thể bắt đầu bằng một câu hỏi về chủ đề này. Điều gì khiến bạn chú ý? Ghi lại một chi tiết trước khi chuyển sang trang tiếp theo.
---PAGE---
MỘT CHI TIẾT, MỘT GÓC NHÌN

Chọn một tình huống gần gũi với bạn. Thử mô tả điều bạn nhìn thấy, thay vì vội đi đến kết luận. Một ví dụ cụ thể giúp câu hỏi ban đầu rõ ràng hơn.

Trang mẫu này do dự án tự biên soạn để kiểm thử chức năng đọc sách.
---PAGE---
SAU KHI ĐỌC

Viết một ý bạn muốn giữ lại, một điều còn chưa rõ và một chủ đề muốn đọc thêm. Bạn có thể trở lại những ghi chú này vào một ngày khác.

Đây là đầu sách minh họa, không phải trích đoạn của một ấn bản thương mại.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH(UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-HOME-010')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Bạn Gấu tìm lại cầu vồng',N'Câu chuyện tự biên soạn về sự tò mò, chia sẻ và cùng nhau giải quyết một việc nhỏ.

Tên sách, tác giả, ấn bản, thông số, giá và bìa do dự án tạo để minh họa giao diện. Mã DEMO-HOME là mã nội bộ, không phải ISBN.',N'DEMO-HOME-010',(SELECT Id FROM dbo.Categories WHERE Name=N'Thiếu nhi'),(SELECT Id FROM dbo.Authors WHERE Name=N'Linh Chi'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),129000,159000,25,176,2026,N'/images/home-book-10.svg',N'ĐỌC THỬ MINH HỌA · BẠN GẤU TÌM LẠI CẦU VỒNG

Câu chuyện tự biên soạn về sự tò mò, chia sẻ và cùng nhau giải quyết một việc nhỏ.

Bạn có thể bắt đầu bằng một câu hỏi về chủ đề này. Điều gì khiến bạn chú ý? Ghi lại một chi tiết trước khi chuyển sang trang tiếp theo.
---PAGE---
MỘT CHI TIẾT, MỘT GÓC NHÌN

Chọn một tình huống gần gũi với bạn. Thử mô tả điều bạn nhìn thấy, thay vì vội đi đến kết luận. Một ví dụ cụ thể giúp câu hỏi ban đầu rõ ràng hơn.

Trang mẫu này do dự án tự biên soạn để kiểm thử chức năng đọc sách.
---PAGE---
SAU KHI ĐỌC

Viết một ý bạn muốn giữ lại, một điều còn chưa rõ và một chủ đề muốn đọc thêm. Bạn có thể trở lại những ghi chú này vào một ngày khác.

Đây là đầu sách minh họa, không phải trích đoạn của một ấn bản thương mại.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH(UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-HOME-011')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Chiếc hộp của những câu hỏi',N'Câu chuyện tự biên soạn về sự tò mò, chia sẻ và cùng nhau giải quyết một việc nhỏ.

Tên sách, tác giả, ấn bản, thông số, giá và bìa do dự án tạo để minh họa giao diện. Mã DEMO-HOME là mã nội bộ, không phải ISBN.',N'DEMO-HOME-011',(SELECT Id FROM dbo.Categories WHERE Name=N'Thiếu nhi'),(SELECT Id FROM dbo.Authors WHERE Name=N'Quang Lâm'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Trang Mới (mẫu)'),159000,189000,26,184,2026,N'/images/home-book-11.svg',N'ĐỌC THỬ MINH HỌA · CHIẾC HỘP CỦA NHỮNG CÂU HỎI

Câu chuyện tự biên soạn về sự tò mò, chia sẻ và cùng nhau giải quyết một việc nhỏ.

Bạn có thể bắt đầu bằng một câu hỏi về chủ đề này. Điều gì khiến bạn chú ý? Ghi lại một chi tiết trước khi chuyển sang trang tiếp theo.
---PAGE---
MỘT CHI TIẾT, MỘT GÓC NHÌN

Chọn một tình huống gần gũi với bạn. Thử mô tả điều bạn nhìn thấy, thay vì vội đi đến kết luận. Một ví dụ cụ thể giúp câu hỏi ban đầu rõ ràng hơn.

Trang mẫu này do dự án tự biên soạn để kiểm thử chức năng đọc sách.
---PAGE---
SAU KHI ĐỌC

Viết một ý bạn muốn giữ lại, một điều còn chưa rõ và một chủ đề muốn đọc thêm. Bạn có thể trở lại những ghi chú này vào một ngày khác.

Đây là đầu sách minh họa, không phải trích đoạn của một ấn bản thương mại.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH(UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-HOME-012')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Cùng Mèo con khám phá khu phố',N'Câu chuyện tự biên soạn về sự tò mò, chia sẻ và cùng nhau giải quyết một việc nhỏ.

Tên sách, tác giả, ấn bản, thông số, giá và bìa do dự án tạo để minh họa giao diện. Mã DEMO-HOME là mã nội bộ, không phải ISBN.',N'DEMO-HOME-012',(SELECT Id FROM dbo.Categories WHERE Name=N'Thiếu nhi'),(SELECT Id FROM dbo.Authors WHERE Name=N'Mai Vy'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Hành Trình (mẫu)'),189000,219000,27,192,2026,N'/images/home-book-12.svg',N'ĐỌC THỬ MINH HỌA · CÙNG MÈO CON KHÁM PHÁ KHU PHỐ

Câu chuyện tự biên soạn về sự tò mò, chia sẻ và cùng nhau giải quyết một việc nhỏ.

Bạn có thể bắt đầu bằng một câu hỏi về chủ đề này. Điều gì khiến bạn chú ý? Ghi lại một chi tiết trước khi chuyển sang trang tiếp theo.
---PAGE---
MỘT CHI TIẾT, MỘT GÓC NHÌN

Chọn một tình huống gần gũi với bạn. Thử mô tả điều bạn nhìn thấy, thay vì vội đi đến kết luận. Một ví dụ cụ thể giúp câu hỏi ban đầu rõ ràng hơn.

Trang mẫu này do dự án tự biên soạn để kiểm thử chức năng đọc sách.
---PAGE---
SAU KHI ĐỌC

Viết một ý bạn muốn giữ lại, một điều còn chưa rõ và một chủ đề muốn đọc thêm. Bạn có thể trở lại những ghi chú này vào một ngày khác.

Đây là đầu sách minh họa, không phải trích đoạn của một ấn bản thương mại.',1,N'Tiếng Việt',N'Bìa cứng',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH(UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-HOME-013')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Chuyện kể bên mái đình',N'Một tủ sách minh họa chủ đề cảnh quan, ký ức và sinh hoạt văn hóa; không phải tài liệu khảo cứu lịch sử.

Tên sách, tác giả, ấn bản, thông số, giá và bìa do dự án tạo để minh họa giao diện. Mã DEMO-HOME là mã nội bộ, không phải ISBN.',N'DEMO-HOME-013',(SELECT Id FROM dbo.Categories WHERE Name=N'Lịch sử & văn hóa'),(SELECT Id FROM dbo.Authors WHERE Name=N'An Nhiên'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),59000,89000,28,200,2026,N'/images/home-book-13.svg',N'ĐỌC THỬ MINH HỌA · CHUYỆN KỂ BÊN MÁI ĐÌNH

Một tủ sách minh họa chủ đề cảnh quan, ký ức và sinh hoạt văn hóa; không phải tài liệu khảo cứu lịch sử.

Bạn có thể bắt đầu bằng một câu hỏi về chủ đề này. Điều gì khiến bạn chú ý? Ghi lại một chi tiết trước khi chuyển sang trang tiếp theo.
---PAGE---
MỘT CHI TIẾT, MỘT GÓC NHÌN

Chọn một tình huống gần gũi với bạn. Thử mô tả điều bạn nhìn thấy, thay vì vội đi đến kết luận. Một ví dụ cụ thể giúp câu hỏi ban đầu rõ ràng hơn.

Trang mẫu này do dự án tự biên soạn để kiểm thử chức năng đọc sách.
---PAGE---
SAU KHI ĐỌC

Viết một ý bạn muốn giữ lại, một điều còn chưa rõ và một chủ đề muốn đọc thêm. Bạn có thể trở lại những ghi chú này vào một ngày khác.

Đây là đầu sách minh họa, không phải trích đoạn của một ấn bản thương mại.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH(UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-HOME-014')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Những mùa lễ hội quê mình',N'Một tủ sách minh họa chủ đề cảnh quan, ký ức và sinh hoạt văn hóa; không phải tài liệu khảo cứu lịch sử.

Tên sách, tác giả, ấn bản, thông số, giá và bìa do dự án tạo để minh họa giao diện. Mã DEMO-HOME là mã nội bộ, không phải ISBN.',N'DEMO-HOME-014',(SELECT Id FROM dbo.Categories WHERE Name=N'Lịch sử & văn hóa'),(SELECT Id FROM dbo.Authors WHERE Name=N'Minh Hạ'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Trang Mới (mẫu)'),79000,109000,29,208,2026,N'/images/home-book-14.svg',N'ĐỌC THỬ MINH HỌA · NHỮNG MÙA LỄ HỘI QUÊ MÌNH

Một tủ sách minh họa chủ đề cảnh quan, ký ức và sinh hoạt văn hóa; không phải tài liệu khảo cứu lịch sử.

Bạn có thể bắt đầu bằng một câu hỏi về chủ đề này. Điều gì khiến bạn chú ý? Ghi lại một chi tiết trước khi chuyển sang trang tiếp theo.
---PAGE---
MỘT CHI TIẾT, MỘT GÓC NHÌN

Chọn một tình huống gần gũi với bạn. Thử mô tả điều bạn nhìn thấy, thay vì vội đi đến kết luận. Một ví dụ cụ thể giúp câu hỏi ban đầu rõ ràng hơn.

Trang mẫu này do dự án tự biên soạn để kiểm thử chức năng đọc sách.
---PAGE---
SAU KHI ĐỌC

Viết một ý bạn muốn giữ lại, một điều còn chưa rõ và một chủ đề muốn đọc thêm. Bạn có thể trở lại những ghi chú này vào một ngày khác.

Đây là đầu sách minh họa, không phải trích đoạn của một ấn bản thương mại.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH(UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-HOME-015')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Dạo bước qua phố cổ',N'Một tủ sách minh họa chủ đề cảnh quan, ký ức và sinh hoạt văn hóa; không phải tài liệu khảo cứu lịch sử.

Tên sách, tác giả, ấn bản, thông số, giá và bìa do dự án tạo để minh họa giao diện. Mã DEMO-HOME là mã nội bộ, không phải ISBN.',N'DEMO-HOME-015',(SELECT Id FROM dbo.Categories WHERE Name=N'Lịch sử & văn hóa'),(SELECT Id FROM dbo.Authors WHERE Name=N'Hoàng Duy'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Hành Trình (mẫu)'),99000,129000,30,216,2026,N'/images/home-book-15.svg',N'ĐỌC THỬ MINH HỌA · DẠO BƯỚC QUA PHỐ CỔ

Một tủ sách minh họa chủ đề cảnh quan, ký ức và sinh hoạt văn hóa; không phải tài liệu khảo cứu lịch sử.

Bạn có thể bắt đầu bằng một câu hỏi về chủ đề này. Điều gì khiến bạn chú ý? Ghi lại một chi tiết trước khi chuyển sang trang tiếp theo.
---PAGE---
MỘT CHI TIẾT, MỘT GÓC NHÌN

Chọn một tình huống gần gũi với bạn. Thử mô tả điều bạn nhìn thấy, thay vì vội đi đến kết luận. Một ví dụ cụ thể giúp câu hỏi ban đầu rõ ràng hơn.

Trang mẫu này do dự án tự biên soạn để kiểm thử chức năng đọc sách.
---PAGE---
SAU KHI ĐỌC

Viết một ý bạn muốn giữ lại, một điều còn chưa rõ và một chủ đề muốn đọc thêm. Bạn có thể trở lại những ghi chú này vào một ngày khác.

Đây là đầu sách minh họa, không phải trích đoạn của một ấn bản thương mại.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH(UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-HOME-016')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Một ngày sống cân bằng',N'Nội dung minh họa việc quan sát nhịp sinh hoạt và nghỉ ngơi; không đưa hướng dẫn chẩn đoán hoặc điều trị.

Tên sách, tác giả, ấn bản, thông số, giá và bìa do dự án tạo để minh họa giao diện. Mã DEMO-HOME là mã nội bộ, không phải ISBN.',N'DEMO-HOME-016',(SELECT Id FROM dbo.Categories WHERE Name=N'Sức khỏe'),(SELECT Id FROM dbo.Authors WHERE Name=N'Linh Chi'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),129000,159000,31,224,2026,N'/images/home-book-16.svg',N'ĐỌC THỬ MINH HỌA · MỘT NGÀY SỐNG CÂN BẰNG

Nội dung minh họa việc quan sát nhịp sinh hoạt và nghỉ ngơi; không đưa hướng dẫn chẩn đoán hoặc điều trị.

Bạn có thể bắt đầu bằng một câu hỏi về chủ đề này. Điều gì khiến bạn chú ý? Ghi lại một chi tiết trước khi chuyển sang trang tiếp theo.
---PAGE---
MỘT CHI TIẾT, MỘT GÓC NHÌN

Chọn một tình huống gần gũi với bạn. Thử mô tả điều bạn nhìn thấy, thay vì vội đi đến kết luận. Một ví dụ cụ thể giúp câu hỏi ban đầu rõ ràng hơn.

Trang mẫu này do dự án tự biên soạn để kiểm thử chức năng đọc sách.
---PAGE---
SAU KHI ĐỌC

Viết một ý bạn muốn giữ lại, một điều còn chưa rõ và một chủ đề muốn đọc thêm. Bạn có thể trở lại những ghi chú này vào một ngày khác.

Đây là đầu sách minh họa, không phải trích đoạn của một ấn bản thương mại.',1,N'Tiếng Việt',N'Bìa cứng',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH(UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-HOME-017')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Góc bếp và những bữa ăn vui',N'Nội dung minh họa việc quan sát nhịp sinh hoạt và nghỉ ngơi; không đưa hướng dẫn chẩn đoán hoặc điều trị.

Tên sách, tác giả, ấn bản, thông số, giá và bìa do dự án tạo để minh họa giao diện. Mã DEMO-HOME là mã nội bộ, không phải ISBN.',N'DEMO-HOME-017',(SELECT Id FROM dbo.Categories WHERE Name=N'Sức khỏe'),(SELECT Id FROM dbo.Authors WHERE Name=N'Quang Lâm'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Trang Mới (mẫu)'),159000,189000,32,232,2026,N'/images/home-book-17.svg',N'ĐỌC THỬ MINH HỌA · GÓC BẾP VÀ NHỮNG BỮA ĂN VUI

Nội dung minh họa việc quan sát nhịp sinh hoạt và nghỉ ngơi; không đưa hướng dẫn chẩn đoán hoặc điều trị.

Bạn có thể bắt đầu bằng một câu hỏi về chủ đề này. Điều gì khiến bạn chú ý? Ghi lại một chi tiết trước khi chuyển sang trang tiếp theo.
---PAGE---
MỘT CHI TIẾT, MỘT GÓC NHÌN

Chọn một tình huống gần gũi với bạn. Thử mô tả điều bạn nhìn thấy, thay vì vội đi đến kết luận. Một ví dụ cụ thể giúp câu hỏi ban đầu rõ ràng hơn.

Trang mẫu này do dự án tự biên soạn để kiểm thử chức năng đọc sách.
---PAGE---
SAU KHI ĐỌC

Viết một ý bạn muốn giữ lại, một điều còn chưa rõ và một chủ đề muốn đọc thêm. Bạn có thể trở lại những ghi chú này vào một ngày khác.

Đây là đầu sách minh họa, không phải trích đoạn của một ấn bản thương mại.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH(UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-HOME-018')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Nghỉ ngơi trong ngày bận rộn',N'Nội dung minh họa việc quan sát nhịp sinh hoạt và nghỉ ngơi; không đưa hướng dẫn chẩn đoán hoặc điều trị.

Tên sách, tác giả, ấn bản, thông số, giá và bìa do dự án tạo để minh họa giao diện. Mã DEMO-HOME là mã nội bộ, không phải ISBN.',N'DEMO-HOME-018',(SELECT Id FROM dbo.Categories WHERE Name=N'Sức khỏe'),(SELECT Id FROM dbo.Authors WHERE Name=N'Mai Vy'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Hành Trình (mẫu)'),189000,219000,33,240,2026,N'/images/home-book-18.svg',N'ĐỌC THỬ MINH HỌA · NGHỈ NGƠI TRONG NGÀY BẬN RỘN

Nội dung minh họa việc quan sát nhịp sinh hoạt và nghỉ ngơi; không đưa hướng dẫn chẩn đoán hoặc điều trị.

Bạn có thể bắt đầu bằng một câu hỏi về chủ đề này. Điều gì khiến bạn chú ý? Ghi lại một chi tiết trước khi chuyển sang trang tiếp theo.
---PAGE---
MỘT CHI TIẾT, MỘT GÓC NHÌN

Chọn một tình huống gần gũi với bạn. Thử mô tả điều bạn nhìn thấy, thay vì vội đi đến kết luận. Một ví dụ cụ thể giúp câu hỏi ban đầu rõ ràng hơn.

Trang mẫu này do dự án tự biên soạn để kiểm thử chức năng đọc sách.
---PAGE---
SAU KHI ĐỌC

Viết một ý bạn muốn giữ lại, một điều còn chưa rõ và một chủ đề muốn đọc thêm. Bạn có thể trở lại những ghi chú này vào một ngày khác.

Đây là đầu sách minh họa, không phải trích đoạn của một ấn bản thương mại.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH(UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-HOME-019')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Câu hỏi nhỏ về Trái Đất',N'Bắt đầu từ một câu hỏi về thiên nhiên và quan sát những điều gần gũi.

Tên sách, tác giả, ấn bản, thông số, giá và bìa do dự án tạo để minh họa giao diện. Mã DEMO-HOME là mã nội bộ, không phải ISBN.',N'DEMO-HOME-019',(SELECT Id FROM dbo.Categories WHERE Name=N'Khoa học'),(SELECT Id FROM dbo.Authors WHERE Name=N'An Nhiên'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),59000,89000,34,248,2026,N'/images/home-book-19.svg',N'ĐỌC THỬ MINH HỌA · CÂU HỎI NHỎ VỀ TRÁI ĐẤT

Bắt đầu từ một câu hỏi về thiên nhiên và quan sát những điều gần gũi.

Bạn có thể bắt đầu bằng một câu hỏi về chủ đề này. Điều gì khiến bạn chú ý? Ghi lại một chi tiết trước khi chuyển sang trang tiếp theo.
---PAGE---
MỘT CHI TIẾT, MỘT GÓC NHÌN

Chọn một tình huống gần gũi với bạn. Thử mô tả điều bạn nhìn thấy, thay vì vội đi đến kết luận. Một ví dụ cụ thể giúp câu hỏi ban đầu rõ ràng hơn.

Trang mẫu này do dự án tự biên soạn để kiểm thử chức năng đọc sách.
---PAGE---
SAU KHI ĐỌC

Viết một ý bạn muốn giữ lại, một điều còn chưa rõ và một chủ đề muốn đọc thêm. Bạn có thể trở lại những ghi chú này vào một ngày khác.

Đây là đầu sách minh họa, không phải trích đoạn của một ấn bản thương mại.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH(UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-HOME-020')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Gió đã đi đâu',N'Bắt đầu từ một câu hỏi về thiên nhiên và quan sát những điều gần gũi.

Tên sách, tác giả, ấn bản, thông số, giá và bìa do dự án tạo để minh họa giao diện. Mã DEMO-HOME là mã nội bộ, không phải ISBN.',N'DEMO-HOME-020',(SELECT Id FROM dbo.Categories WHERE Name=N'Khoa học'),(SELECT Id FROM dbo.Authors WHERE Name=N'Minh Hạ'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Trang Mới (mẫu)'),79000,109000,35,256,2026,N'/images/home-book-20.svg',N'ĐỌC THỬ MINH HỌA · GIÓ ĐÃ ĐI ĐÂU

Bắt đầu từ một câu hỏi về thiên nhiên và quan sát những điều gần gũi.

Bạn có thể bắt đầu bằng một câu hỏi về chủ đề này. Điều gì khiến bạn chú ý? Ghi lại một chi tiết trước khi chuyển sang trang tiếp theo.
---PAGE---
MỘT CHI TIẾT, MỘT GÓC NHÌN

Chọn một tình huống gần gũi với bạn. Thử mô tả điều bạn nhìn thấy, thay vì vội đi đến kết luận. Một ví dụ cụ thể giúp câu hỏi ban đầu rõ ràng hơn.

Trang mẫu này do dự án tự biên soạn để kiểm thử chức năng đọc sách.
---PAGE---
SAU KHI ĐỌC

Viết một ý bạn muốn giữ lại, một điều còn chưa rõ và một chủ đề muốn đọc thêm. Bạn có thể trở lại những ghi chú này vào một ngày khác.

Đây là đầu sách minh họa, không phải trích đoạn của một ấn bản thương mại.',1,N'Tiếng Việt',N'Bìa cứng',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH(UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-HOME-021')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Tư duy số cho người mới bắt đầu',N'Làm quen với cách chia bài toán thành các bước và tổ chức một sản phẩm số.

Tên sách, tác giả, ấn bản, thông số, giá và bìa do dự án tạo để minh họa giao diện. Mã DEMO-HOME là mã nội bộ, không phải ISBN.',N'DEMO-HOME-021',(SELECT Id FROM dbo.Categories WHERE Name=N'Công nghệ'),(SELECT Id FROM dbo.Authors WHERE Name=N'Hoàng Duy'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Hành Trình (mẫu)'),99000,129000,36,264,2026,N'/images/home-book-21.svg',N'ĐỌC THỬ MINH HỌA · TƯ DUY SỐ CHO NGƯỜI MỚI BẮT ĐẦU

Làm quen với cách chia bài toán thành các bước và tổ chức một sản phẩm số.

Bạn có thể bắt đầu bằng một câu hỏi về chủ đề này. Điều gì khiến bạn chú ý? Ghi lại một chi tiết trước khi chuyển sang trang tiếp theo.
---PAGE---
MỘT CHI TIẾT, MỘT GÓC NHÌN

Chọn một tình huống gần gũi với bạn. Thử mô tả điều bạn nhìn thấy, thay vì vội đi đến kết luận. Một ví dụ cụ thể giúp câu hỏi ban đầu rõ ràng hơn.

Trang mẫu này do dự án tự biên soạn để kiểm thử chức năng đọc sách.
---PAGE---
SAU KHI ĐỌC

Viết một ý bạn muốn giữ lại, một điều còn chưa rõ và một chủ đề muốn đọc thêm. Bạn có thể trở lại những ghi chú này vào một ngày khác.

Đây là đầu sách minh họa, không phải trích đoạn của một ấn bản thương mại.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH(UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-HOME-022')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Từ ý tưởng đến trang web',N'Làm quen với cách chia bài toán thành các bước và tổ chức một sản phẩm số.

Tên sách, tác giả, ấn bản, thông số, giá và bìa do dự án tạo để minh họa giao diện. Mã DEMO-HOME là mã nội bộ, không phải ISBN.',N'DEMO-HOME-022',(SELECT Id FROM dbo.Categories WHERE Name=N'Công nghệ'),(SELECT Id FROM dbo.Authors WHERE Name=N'Linh Chi'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Mộc Tri Thức (mẫu)'),129000,159000,37,272,2026,N'/images/home-book-22.svg',N'ĐỌC THỬ MINH HỌA · TỪ Ý TƯỞNG ĐẾN TRANG WEB

Làm quen với cách chia bài toán thành các bước và tổ chức một sản phẩm số.

Bạn có thể bắt đầu bằng một câu hỏi về chủ đề này. Điều gì khiến bạn chú ý? Ghi lại một chi tiết trước khi chuyển sang trang tiếp theo.
---PAGE---
MỘT CHI TIẾT, MỘT GÓC NHÌN

Chọn một tình huống gần gũi với bạn. Thử mô tả điều bạn nhìn thấy, thay vì vội đi đến kết luận. Một ví dụ cụ thể giúp câu hỏi ban đầu rõ ràng hơn.

Trang mẫu này do dự án tự biên soạn để kiểm thử chức năng đọc sách.
---PAGE---
SAU KHI ĐỌC

Viết một ý bạn muốn giữ lại, một điều còn chưa rõ và một chủ đề muốn đọc thêm. Bạn có thể trở lại những ghi chú này vào một ngày khác.

Đây là đầu sách minh họa, không phải trích đoạn của một ấn bản thương mại.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH(UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-HOME-023')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Tiếng Anh trong chuyến đi đầu tiên',N'Bài luyện đọc và từ vựng tự biên soạn xoay quanh những tình huống giao tiếp đơn giản.

Tên sách, tác giả, ấn bản, thông số, giá và bìa do dự án tạo để minh họa giao diện. Mã DEMO-HOME là mã nội bộ, không phải ISBN.',N'DEMO-HOME-023',(SELECT Id FROM dbo.Categories WHERE Name=N'Ngoại ngữ'),(SELECT Id FROM dbo.Authors WHERE Name=N'Quang Lâm'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Trang Mới (mẫu)'),159000,189000,38,280,2026,N'/images/home-book-23.svg',N'ĐỌC THỬ MINH HỌA · TIẾNG ANH TRONG CHUYẾN ĐI ĐẦU TIÊN

Bài luyện đọc và từ vựng tự biên soạn xoay quanh những tình huống giao tiếp đơn giản.

Bạn có thể bắt đầu bằng một câu hỏi về chủ đề này. Điều gì khiến bạn chú ý? Ghi lại một chi tiết trước khi chuyển sang trang tiếp theo.
---PAGE---
MỘT CHI TIẾT, MỘT GÓC NHÌN

Chọn một tình huống gần gũi với bạn. Thử mô tả điều bạn nhìn thấy, thay vì vội đi đến kết luận. Một ví dụ cụ thể giúp câu hỏi ban đầu rõ ràng hơn.

Trang mẫu này do dự án tự biên soạn để kiểm thử chức năng đọc sách.
---PAGE---
SAU KHI ĐỌC

Viết một ý bạn muốn giữ lại, một điều còn chưa rõ và một chủ đề muốn đọc thêm. Bạn có thể trở lại những ghi chú này vào một ngày khác.

Đây là đầu sách minh họa, không phải trích đoạn của một ấn bản thương mại.',1,N'Tiếng Việt',N'Bìa mềm',N'14 x 20.5 cm',N'',N'');
 IF NOT EXISTS(SELECT 1 FROM dbo.Books WITH(UPDLOCK,HOLDLOCK) WHERE Isbn=N'DEMO-HOME-024')
 INSERT INTO dbo.Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive,Language,Binding,Dimensions,Translator,SourceUrl) VALUES(N'Đối thoại với chính mình',N'Một tập gợi ý viết nhật ký và quan sát suy nghĩ, không thay thế tư vấn tâm lý.

Tên sách, tác giả, ấn bản, thông số, giá và bìa do dự án tạo để minh họa giao diện. Mã DEMO-HOME là mã nội bộ, không phải ISBN.',N'DEMO-HOME-024',(SELECT Id FROM dbo.Categories WHERE Name=N'Tâm lý'),(SELECT Id FROM dbo.Authors WHERE Name=N'Mai Vy'),(SELECT Id FROM dbo.Publishers WHERE Name=N'NXB Hành Trình (mẫu)'),189000,219000,39,288,2026,N'/images/home-book-24.svg',N'ĐỌC THỬ MINH HỌA · ĐỐI THOẠI VỚI CHÍNH MÌNH

Một tập gợi ý viết nhật ký và quan sát suy nghĩ, không thay thế tư vấn tâm lý.

Bạn có thể bắt đầu bằng một câu hỏi về chủ đề này. Điều gì khiến bạn chú ý? Ghi lại một chi tiết trước khi chuyển sang trang tiếp theo.
---PAGE---
MỘT CHI TIẾT, MỘT GÓC NHÌN

Chọn một tình huống gần gũi với bạn. Thử mô tả điều bạn nhìn thấy, thay vì vội đi đến kết luận. Một ví dụ cụ thể giúp câu hỏi ban đầu rõ ràng hơn.

Trang mẫu này do dự án tự biên soạn để kiểm thử chức năng đọc sách.
---PAGE---
SAU KHI ĐỌC

Viết một ý bạn muốn giữ lại, một điều còn chưa rõ và một chủ đề muốn đọc thêm. Bạn có thể trở lại những ghi chú này vào một ngày khác.

Đây là đầu sách minh họa, không phải trích đoạn của một ấn bản thương mại.',1,N'Tiếng Việt',N'Bìa cứng',N'14 x 20.5 cm',N'',N'');
 COMMIT TRANSACTION;
END TRY
BEGIN CATCH
 IF @@TRANCOUNT>0 ROLLBACK TRANSACTION;
 THROW;
END CATCH;
GO
SELECT COUNT(*) AS TongSoSach FROM dbo.Books;
GO
