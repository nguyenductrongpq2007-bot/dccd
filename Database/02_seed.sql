USE BookStoreOnline;
GO
-- Original illustrative data, not an actual commercial catalog.
INSERT INTO Categories(Name) VALUES (N'Văn học'),(N'Kinh tế'),(N'Kỹ năng sống'),(N'Thiếu nhi');
INSERT INTO Authors(Name) VALUES (N'An Nhiên'),(N'Minh Hạ'),(N'Hoàng Duy'),(N'Linh Chi'),(N'Quang Lâm'),(N'Mai Vy');
INSERT INTO Publishers(Name) VALUES (N'NXB Mộc Tri Thức (mẫu)'),(N'NXB Trang Mới (mẫu)'),(N'NXB Hành Trình (mẫu)');
INSERT INTO Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive) VALUES (N'Những mùa ta lớn lên',N'Những mùa ta lớn lên là một đầu sách minh họa trong tủ sách Mộc Books. Những trang viết nhẹ nhàng đưa người đọc đến với các câu chuyện về sự trưởng thành, khám phá và những lựa chọn trong cuộc sống.

Cuốn sách phù hợp với bạn đọc yêu thích thể loại văn học. Dữ liệu, giá và bìa được tạo riêng cho đồ án để bạn kiểm thử đầy đủ các chức năng.',N'DEMO-0001',1,1,1,89000,115000,31,224,2026,N'/images/book-1.svg',N'LỜI MỞ ĐẦU

Có những buổi sáng, chúng ta thức dậy và nhận ra mình đã đi rất xa mà chưa kịp nhìn lại con đường. Một cuốn sách không hứa thay đổi cuộc đời trong một ngày. Nó chỉ mở ra một khoảng lặng để chúng ta bắt đầu đặt câu hỏi.

Cuốn sách “Những mùa ta lớn lên” được bắt đầu từ một câu hỏi nhỏ: điều gì khiến một ngày bình thường trở nên đáng nhớ? Có thể là cuộc trò chuyện với người bạn cũ, một quyết định can đảm, hay việc ta dành vài phút thật lòng cho chính mình.

Trang mẫu này do dự án biên soạn để minh họa chức năng đọc thử.
---PAGE---
CHƯƠNG 1 · NHỮNG ĐIỀU NHỎ BÉ

Buổi chiều hôm ấy, con đường về nhà không có gì khác thường. Hàng cây vẫn đứng đó, quán nhỏ vẫn mở cửa, và người bán hàng vẫn mỉm cười với khách quen. Nhưng khi đi chậm hơn một chút, ta nghe được tiếng gió qua tán lá mà bao lần trước đã bỏ qua.

Không phải mọi hành trình đều bắt đầu bằng một kế hoạch lớn. Đôi khi, nó bắt đầu từ việc ghi lại một ý tưởng, mở trang đầu tiên hoặc học thêm một điều mới. Sự thay đổi trở nên bền vững khi ta có thể lặp lại bước nhỏ ấy mỗi ngày.

Hãy chọn một điều nhỏ bạn muốn thử hôm nay và dành cho nó mười phút.
---PAGE---
CHƯƠNG 1 · MỘT KHỞI ĐẦU MỚI

Khi một việc chưa như mong đợi, ta thường nhìn vào kết quả mà quên mất những gì mình đã học. Mỗi lần thử mang lại một thông tin mới: cách nào phù hợp, điều gì cần điều chỉnh, ai có thể giúp ta đi tiếp.

Hãy giữ một cuốn sổ nhỏ. Cuối ngày, viết xuống điều bạn đã làm tốt, điều bạn muốn cải thiện và một câu hỏi cho ngày mai. Sau một thời gian, bạn sẽ nhìn thấy một bản đồ được tạo nên từ chính những bước chân của mình.

Hết phần đọc thử minh họa. Cảm ơn bạn đã dành thời gian cho trang sách này.',1);
INSERT INTO Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive) VALUES (N'Đi qua miền nắng',N'Đi qua miền nắng là một đầu sách minh họa trong tủ sách Mộc Books. Những trang viết nhẹ nhàng đưa người đọc đến với các câu chuyện về sự trưởng thành, khám phá và những lựa chọn trong cuộc sống.

Cuốn sách phù hợp với bạn đọc yêu thích thể loại văn học. Dữ liệu, giá và bìa được tạo riêng cho đồ án để bạn kiểm thử đầy đủ các chức năng.',N'DEMO-0002',1,2,2,109000,139000,32,272,2026,N'/images/book-2.svg',N'LỜI MỞ ĐẦU

Có những buổi sáng, chúng ta thức dậy và nhận ra mình đã đi rất xa mà chưa kịp nhìn lại con đường. Một cuốn sách không hứa thay đổi cuộc đời trong một ngày. Nó chỉ mở ra một khoảng lặng để chúng ta bắt đầu đặt câu hỏi.

Cuốn sách “Đi qua miền nắng” được bắt đầu từ một câu hỏi nhỏ: điều gì khiến một ngày bình thường trở nên đáng nhớ? Có thể là cuộc trò chuyện với người bạn cũ, một quyết định can đảm, hay việc ta dành vài phút thật lòng cho chính mình.

Trang mẫu này do dự án biên soạn để minh họa chức năng đọc thử.
---PAGE---
CHƯƠNG 1 · NHỮNG ĐIỀU NHỎ BÉ

Buổi chiều hôm ấy, con đường về nhà không có gì khác thường. Hàng cây vẫn đứng đó, quán nhỏ vẫn mở cửa, và người bán hàng vẫn mỉm cười với khách quen. Nhưng khi đi chậm hơn một chút, ta nghe được tiếng gió qua tán lá mà bao lần trước đã bỏ qua.

Không phải mọi hành trình đều bắt đầu bằng một kế hoạch lớn. Đôi khi, nó bắt đầu từ việc ghi lại một ý tưởng, mở trang đầu tiên hoặc học thêm một điều mới. Sự thay đổi trở nên bền vững khi ta có thể lặp lại bước nhỏ ấy mỗi ngày.

Hãy chọn một điều nhỏ bạn muốn thử hôm nay và dành cho nó mười phút.
---PAGE---
CHƯƠNG 1 · MỘT KHỞI ĐẦU MỚI

Khi một việc chưa như mong đợi, ta thường nhìn vào kết quả mà quên mất những gì mình đã học. Mỗi lần thử mang lại một thông tin mới: cách nào phù hợp, điều gì cần điều chỉnh, ai có thể giúp ta đi tiếp.

Hãy giữ một cuốn sổ nhỏ. Cuối ngày, viết xuống điều bạn đã làm tốt, điều bạn muốn cải thiện và một câu hỏi cho ngày mai. Sau một thời gian, bạn sẽ nhìn thấy một bản đồ được tạo nên từ chính những bước chân của mình.

Hết phần đọc thử minh họa. Cảm ơn bạn đã dành thời gian cho trang sách này.',1);
INSERT INTO Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive) VALUES (N'Một ngày sống chậm',N'Một ngày sống chậm là một đầu sách minh họa trong tủ sách Mộc Books. Những trang viết nhẹ nhàng đưa người đọc đến với các câu chuyện về sự trưởng thành, khám phá và những lựa chọn trong cuộc sống.

Cuốn sách phù hợp với bạn đọc yêu thích thể loại kỹ năng sống. Dữ liệu, giá và bìa được tạo riêng cho đồ án để bạn kiểm thử đầy đủ các chức năng.',N'DEMO-0003',3,1,1,79000,99000,33,192,2026,N'/images/book-3.svg',N'LỜI MỞ ĐẦU

Có những buổi sáng, chúng ta thức dậy và nhận ra mình đã đi rất xa mà chưa kịp nhìn lại con đường. Một cuốn sách không hứa thay đổi cuộc đời trong một ngày. Nó chỉ mở ra một khoảng lặng để chúng ta bắt đầu đặt câu hỏi.

Cuốn sách “Một ngày sống chậm” được bắt đầu từ một câu hỏi nhỏ: điều gì khiến một ngày bình thường trở nên đáng nhớ? Có thể là cuộc trò chuyện với người bạn cũ, một quyết định can đảm, hay việc ta dành vài phút thật lòng cho chính mình.

Trang mẫu này do dự án biên soạn để minh họa chức năng đọc thử.
---PAGE---
CHƯƠNG 1 · NHỮNG ĐIỀU NHỎ BÉ

Buổi chiều hôm ấy, con đường về nhà không có gì khác thường. Hàng cây vẫn đứng đó, quán nhỏ vẫn mở cửa, và người bán hàng vẫn mỉm cười với khách quen. Nhưng khi đi chậm hơn một chút, ta nghe được tiếng gió qua tán lá mà bao lần trước đã bỏ qua.

Không phải mọi hành trình đều bắt đầu bằng một kế hoạch lớn. Đôi khi, nó bắt đầu từ việc ghi lại một ý tưởng, mở trang đầu tiên hoặc học thêm một điều mới. Sự thay đổi trở nên bền vững khi ta có thể lặp lại bước nhỏ ấy mỗi ngày.

Hãy chọn một điều nhỏ bạn muốn thử hôm nay và dành cho nó mười phút.
---PAGE---
CHƯƠNG 1 · MỘT KHỞI ĐẦU MỚI

Khi một việc chưa như mong đợi, ta thường nhìn vào kết quả mà quên mất những gì mình đã học. Mỗi lần thử mang lại một thông tin mới: cách nào phù hợp, điều gì cần điều chỉnh, ai có thể giúp ta đi tiếp.

Hãy giữ một cuốn sổ nhỏ. Cuối ngày, viết xuống điều bạn đã làm tốt, điều bạn muốn cải thiện và một câu hỏi cho ngày mai. Sau một thời gian, bạn sẽ nhìn thấy một bản đồ được tạo nên từ chính những bước chân của mình.

Hết phần đọc thử minh họa. Cảm ơn bạn đã dành thời gian cho trang sách này.',1);
INSERT INTO Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive) VALUES (N'Tư duy từ con số không',N'Tư duy từ con số không là một đầu sách minh họa trong tủ sách Mộc Books. Những trang viết nhẹ nhàng đưa người đọc đến với các câu chuyện về sự trưởng thành, khám phá và những lựa chọn trong cuộc sống.

Cuốn sách phù hợp với bạn đọc yêu thích thể loại kinh tế. Dữ liệu, giá và bìa được tạo riêng cho đồ án để bạn kiểm thử đầy đủ các chức năng.',N'DEMO-0004',2,3,3,129000,169000,34,320,2026,N'/images/book-4.svg',N'LỜI MỞ ĐẦU

Có những buổi sáng, chúng ta thức dậy và nhận ra mình đã đi rất xa mà chưa kịp nhìn lại con đường. Một cuốn sách không hứa thay đổi cuộc đời trong một ngày. Nó chỉ mở ra một khoảng lặng để chúng ta bắt đầu đặt câu hỏi.

Cuốn sách “Tư duy từ con số không” được bắt đầu từ một câu hỏi nhỏ: điều gì khiến một ngày bình thường trở nên đáng nhớ? Có thể là cuộc trò chuyện với người bạn cũ, một quyết định can đảm, hay việc ta dành vài phút thật lòng cho chính mình.

Trang mẫu này do dự án biên soạn để minh họa chức năng đọc thử.
---PAGE---
CHƯƠNG 1 · NHỮNG ĐIỀU NHỎ BÉ

Buổi chiều hôm ấy, con đường về nhà không có gì khác thường. Hàng cây vẫn đứng đó, quán nhỏ vẫn mở cửa, và người bán hàng vẫn mỉm cười với khách quen. Nhưng khi đi chậm hơn một chút, ta nghe được tiếng gió qua tán lá mà bao lần trước đã bỏ qua.

Không phải mọi hành trình đều bắt đầu bằng một kế hoạch lớn. Đôi khi, nó bắt đầu từ việc ghi lại một ý tưởng, mở trang đầu tiên hoặc học thêm một điều mới. Sự thay đổi trở nên bền vững khi ta có thể lặp lại bước nhỏ ấy mỗi ngày.

Hãy chọn một điều nhỏ bạn muốn thử hôm nay và dành cho nó mười phút.
---PAGE---
CHƯƠNG 1 · MỘT KHỞI ĐẦU MỚI

Khi một việc chưa như mong đợi, ta thường nhìn vào kết quả mà quên mất những gì mình đã học. Mỗi lần thử mang lại một thông tin mới: cách nào phù hợp, điều gì cần điều chỉnh, ai có thể giúp ta đi tiếp.

Hãy giữ một cuốn sổ nhỏ. Cuối ngày, viết xuống điều bạn đã làm tốt, điều bạn muốn cải thiện và một câu hỏi cho ngày mai. Sau một thời gian, bạn sẽ nhìn thấy một bản đồ được tạo nên từ chính những bước chân của mình.

Hết phần đọc thử minh họa. Cảm ơn bạn đã dành thời gian cho trang sách này.',1);
INSERT INTO Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive) VALUES (N'Khu vườn của những giấc mơ',N'Khu vườn của những giấc mơ là một đầu sách minh họa trong tủ sách Mộc Books. Những trang viết nhẹ nhàng đưa người đọc đến với các câu chuyện về sự trưởng thành, khám phá và những lựa chọn trong cuộc sống.

Cuốn sách phù hợp với bạn đọc yêu thích thể loại thiếu nhi. Dữ liệu, giá và bìa được tạo riêng cho đồ án để bạn kiểm thử đầy đủ các chức năng.',N'DEMO-0005',4,4,2,69000,85000,35,96,2026,N'/images/book-5.svg',N'LỜI MỞ ĐẦU

Có những buổi sáng, chúng ta thức dậy và nhận ra mình đã đi rất xa mà chưa kịp nhìn lại con đường. Một cuốn sách không hứa thay đổi cuộc đời trong một ngày. Nó chỉ mở ra một khoảng lặng để chúng ta bắt đầu đặt câu hỏi.

Cuốn sách “Khu vườn của những giấc mơ” được bắt đầu từ một câu hỏi nhỏ: điều gì khiến một ngày bình thường trở nên đáng nhớ? Có thể là cuộc trò chuyện với người bạn cũ, một quyết định can đảm, hay việc ta dành vài phút thật lòng cho chính mình.

Trang mẫu này do dự án biên soạn để minh họa chức năng đọc thử.
---PAGE---
CHƯƠNG 1 · NHỮNG ĐIỀU NHỎ BÉ

Buổi chiều hôm ấy, con đường về nhà không có gì khác thường. Hàng cây vẫn đứng đó, quán nhỏ vẫn mở cửa, và người bán hàng vẫn mỉm cười với khách quen. Nhưng khi đi chậm hơn một chút, ta nghe được tiếng gió qua tán lá mà bao lần trước đã bỏ qua.

Không phải mọi hành trình đều bắt đầu bằng một kế hoạch lớn. Đôi khi, nó bắt đầu từ việc ghi lại một ý tưởng, mở trang đầu tiên hoặc học thêm một điều mới. Sự thay đổi trở nên bền vững khi ta có thể lặp lại bước nhỏ ấy mỗi ngày.

Hãy chọn một điều nhỏ bạn muốn thử hôm nay và dành cho nó mười phút.
---PAGE---
CHƯƠNG 1 · MỘT KHỞI ĐẦU MỚI

Khi một việc chưa như mong đợi, ta thường nhìn vào kết quả mà quên mất những gì mình đã học. Mỗi lần thử mang lại một thông tin mới: cách nào phù hợp, điều gì cần điều chỉnh, ai có thể giúp ta đi tiếp.

Hãy giữ một cuốn sổ nhỏ. Cuối ngày, viết xuống điều bạn đã làm tốt, điều bạn muốn cải thiện và một câu hỏi cho ngày mai. Sau một thời gian, bạn sẽ nhìn thấy một bản đồ được tạo nên từ chính những bước chân của mình.

Hết phần đọc thử minh họa. Cảm ơn bạn đã dành thời gian cho trang sách này.',1);
INSERT INTO Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive) VALUES (N'Bản đồ của trái tim',N'Bản đồ của trái tim là một đầu sách minh họa trong tủ sách Mộc Books. Những trang viết nhẹ nhàng đưa người đọc đến với các câu chuyện về sự trưởng thành, khám phá và những lựa chọn trong cuộc sống.

Cuốn sách phù hợp với bạn đọc yêu thích thể loại văn học. Dữ liệu, giá và bìa được tạo riêng cho đồ án để bạn kiểm thử đầy đủ các chức năng.',N'DEMO-0006',1,2,1,99000,129000,36,256,2026,N'/images/book-6.svg',N'LỜI MỞ ĐẦU

Có những buổi sáng, chúng ta thức dậy và nhận ra mình đã đi rất xa mà chưa kịp nhìn lại con đường. Một cuốn sách không hứa thay đổi cuộc đời trong một ngày. Nó chỉ mở ra một khoảng lặng để chúng ta bắt đầu đặt câu hỏi.

Cuốn sách “Bản đồ của trái tim” được bắt đầu từ một câu hỏi nhỏ: điều gì khiến một ngày bình thường trở nên đáng nhớ? Có thể là cuộc trò chuyện với người bạn cũ, một quyết định can đảm, hay việc ta dành vài phút thật lòng cho chính mình.

Trang mẫu này do dự án biên soạn để minh họa chức năng đọc thử.
---PAGE---
CHƯƠNG 1 · NHỮNG ĐIỀU NHỎ BÉ

Buổi chiều hôm ấy, con đường về nhà không có gì khác thường. Hàng cây vẫn đứng đó, quán nhỏ vẫn mở cửa, và người bán hàng vẫn mỉm cười với khách quen. Nhưng khi đi chậm hơn một chút, ta nghe được tiếng gió qua tán lá mà bao lần trước đã bỏ qua.

Không phải mọi hành trình đều bắt đầu bằng một kế hoạch lớn. Đôi khi, nó bắt đầu từ việc ghi lại một ý tưởng, mở trang đầu tiên hoặc học thêm một điều mới. Sự thay đổi trở nên bền vững khi ta có thể lặp lại bước nhỏ ấy mỗi ngày.

Hãy chọn một điều nhỏ bạn muốn thử hôm nay và dành cho nó mười phút.
---PAGE---
CHƯƠNG 1 · MỘT KHỞI ĐẦU MỚI

Khi một việc chưa như mong đợi, ta thường nhìn vào kết quả mà quên mất những gì mình đã học. Mỗi lần thử mang lại một thông tin mới: cách nào phù hợp, điều gì cần điều chỉnh, ai có thể giúp ta đi tiếp.

Hãy giữ một cuốn sổ nhỏ. Cuối ngày, viết xuống điều bạn đã làm tốt, điều bạn muốn cải thiện và một câu hỏi cho ngày mai. Sau một thời gian, bạn sẽ nhìn thấy một bản đồ được tạo nên từ chính những bước chân của mình.

Hết phần đọc thử minh họa. Cảm ơn bạn đã dành thời gian cho trang sách này.',1);
INSERT INTO Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive) VALUES (N'Thói quen nhỏ, thay đổi lớn',N'Thói quen nhỏ, thay đổi lớn là một đầu sách minh họa trong tủ sách Mộc Books. Những trang viết nhẹ nhàng đưa người đọc đến với các câu chuyện về sự trưởng thành, khám phá và những lựa chọn trong cuộc sống.

Cuốn sách phù hợp với bạn đọc yêu thích thể loại kỹ năng sống. Dữ liệu, giá và bìa được tạo riêng cho đồ án để bạn kiểm thử đầy đủ các chức năng.',N'DEMO-0007',3,3,3,119000,149000,37,288,2026,N'/images/book-7.svg',N'LỜI MỞ ĐẦU

Có những buổi sáng, chúng ta thức dậy và nhận ra mình đã đi rất xa mà chưa kịp nhìn lại con đường. Một cuốn sách không hứa thay đổi cuộc đời trong một ngày. Nó chỉ mở ra một khoảng lặng để chúng ta bắt đầu đặt câu hỏi.

Cuốn sách “Thói quen nhỏ, thay đổi lớn” được bắt đầu từ một câu hỏi nhỏ: điều gì khiến một ngày bình thường trở nên đáng nhớ? Có thể là cuộc trò chuyện với người bạn cũ, một quyết định can đảm, hay việc ta dành vài phút thật lòng cho chính mình.

Trang mẫu này do dự án biên soạn để minh họa chức năng đọc thử.
---PAGE---
CHƯƠNG 1 · NHỮNG ĐIỀU NHỎ BÉ

Buổi chiều hôm ấy, con đường về nhà không có gì khác thường. Hàng cây vẫn đứng đó, quán nhỏ vẫn mở cửa, và người bán hàng vẫn mỉm cười với khách quen. Nhưng khi đi chậm hơn một chút, ta nghe được tiếng gió qua tán lá mà bao lần trước đã bỏ qua.

Không phải mọi hành trình đều bắt đầu bằng một kế hoạch lớn. Đôi khi, nó bắt đầu từ việc ghi lại một ý tưởng, mở trang đầu tiên hoặc học thêm một điều mới. Sự thay đổi trở nên bền vững khi ta có thể lặp lại bước nhỏ ấy mỗi ngày.

Hãy chọn một điều nhỏ bạn muốn thử hôm nay và dành cho nó mười phút.
---PAGE---
CHƯƠNG 1 · MỘT KHỞI ĐẦU MỚI

Khi một việc chưa như mong đợi, ta thường nhìn vào kết quả mà quên mất những gì mình đã học. Mỗi lần thử mang lại một thông tin mới: cách nào phù hợp, điều gì cần điều chỉnh, ai có thể giúp ta đi tiếp.

Hãy giữ một cuốn sổ nhỏ. Cuối ngày, viết xuống điều bạn đã làm tốt, điều bạn muốn cải thiện và một câu hỏi cho ngày mai. Sau một thời gian, bạn sẽ nhìn thấy một bản đồ được tạo nên từ chính những bước chân của mình.

Hết phần đọc thử minh họa. Cảm ơn bạn đã dành thời gian cho trang sách này.',1);
INSERT INTO Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive) VALUES (N'Chuyện kể dưới tán cây',N'Chuyện kể dưới tán cây là một đầu sách minh họa trong tủ sách Mộc Books. Những trang viết nhẹ nhàng đưa người đọc đến với các câu chuyện về sự trưởng thành, khám phá và những lựa chọn trong cuộc sống.

Cuốn sách phù hợp với bạn đọc yêu thích thể loại thiếu nhi. Dữ liệu, giá và bìa được tạo riêng cho đồ án để bạn kiểm thử đầy đủ các chức năng.',N'DEMO-0008',4,4,2,75000,95000,38,120,2026,N'/images/book-8.svg',N'LỜI MỞ ĐẦU

Có những buổi sáng, chúng ta thức dậy và nhận ra mình đã đi rất xa mà chưa kịp nhìn lại con đường. Một cuốn sách không hứa thay đổi cuộc đời trong một ngày. Nó chỉ mở ra một khoảng lặng để chúng ta bắt đầu đặt câu hỏi.

Cuốn sách “Chuyện kể dưới tán cây” được bắt đầu từ một câu hỏi nhỏ: điều gì khiến một ngày bình thường trở nên đáng nhớ? Có thể là cuộc trò chuyện với người bạn cũ, một quyết định can đảm, hay việc ta dành vài phút thật lòng cho chính mình.

Trang mẫu này do dự án biên soạn để minh họa chức năng đọc thử.
---PAGE---
CHƯƠNG 1 · NHỮNG ĐIỀU NHỎ BÉ

Buổi chiều hôm ấy, con đường về nhà không có gì khác thường. Hàng cây vẫn đứng đó, quán nhỏ vẫn mở cửa, và người bán hàng vẫn mỉm cười với khách quen. Nhưng khi đi chậm hơn một chút, ta nghe được tiếng gió qua tán lá mà bao lần trước đã bỏ qua.

Không phải mọi hành trình đều bắt đầu bằng một kế hoạch lớn. Đôi khi, nó bắt đầu từ việc ghi lại một ý tưởng, mở trang đầu tiên hoặc học thêm một điều mới. Sự thay đổi trở nên bền vững khi ta có thể lặp lại bước nhỏ ấy mỗi ngày.

Hãy chọn một điều nhỏ bạn muốn thử hôm nay và dành cho nó mười phút.
---PAGE---
CHƯƠNG 1 · MỘT KHỞI ĐẦU MỚI

Khi một việc chưa như mong đợi, ta thường nhìn vào kết quả mà quên mất những gì mình đã học. Mỗi lần thử mang lại một thông tin mới: cách nào phù hợp, điều gì cần điều chỉnh, ai có thể giúp ta đi tiếp.

Hãy giữ một cuốn sổ nhỏ. Cuối ngày, viết xuống điều bạn đã làm tốt, điều bạn muốn cải thiện và một câu hỏi cho ngày mai. Sau một thời gian, bạn sẽ nhìn thấy một bản đồ được tạo nên từ chính những bước chân của mình.

Hết phần đọc thử minh họa. Cảm ơn bạn đã dành thời gian cho trang sách này.',1);
INSERT INTO Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive) VALUES (N'Kinh doanh bằng sự tử tế',N'Kinh doanh bằng sự tử tế là một đầu sách minh họa trong tủ sách Mộc Books. Những trang viết nhẹ nhàng đưa người đọc đến với các câu chuyện về sự trưởng thành, khám phá và những lựa chọn trong cuộc sống.

Cuốn sách phù hợp với bạn đọc yêu thích thể loại kinh tế. Dữ liệu, giá và bìa được tạo riêng cho đồ án để bạn kiểm thử đầy đủ các chức năng.',N'DEMO-0009',2,5,3,139000,179000,39,304,2026,N'/images/book-9.svg',N'LỜI MỞ ĐẦU

Có những buổi sáng, chúng ta thức dậy và nhận ra mình đã đi rất xa mà chưa kịp nhìn lại con đường. Một cuốn sách không hứa thay đổi cuộc đời trong một ngày. Nó chỉ mở ra một khoảng lặng để chúng ta bắt đầu đặt câu hỏi.

Cuốn sách “Kinh doanh bằng sự tử tế” được bắt đầu từ một câu hỏi nhỏ: điều gì khiến một ngày bình thường trở nên đáng nhớ? Có thể là cuộc trò chuyện với người bạn cũ, một quyết định can đảm, hay việc ta dành vài phút thật lòng cho chính mình.

Trang mẫu này do dự án biên soạn để minh họa chức năng đọc thử.
---PAGE---
CHƯƠNG 1 · NHỮNG ĐIỀU NHỎ BÉ

Buổi chiều hôm ấy, con đường về nhà không có gì khác thường. Hàng cây vẫn đứng đó, quán nhỏ vẫn mở cửa, và người bán hàng vẫn mỉm cười với khách quen. Nhưng khi đi chậm hơn một chút, ta nghe được tiếng gió qua tán lá mà bao lần trước đã bỏ qua.

Không phải mọi hành trình đều bắt đầu bằng một kế hoạch lớn. Đôi khi, nó bắt đầu từ việc ghi lại một ý tưởng, mở trang đầu tiên hoặc học thêm một điều mới. Sự thay đổi trở nên bền vững khi ta có thể lặp lại bước nhỏ ấy mỗi ngày.

Hãy chọn một điều nhỏ bạn muốn thử hôm nay và dành cho nó mười phút.
---PAGE---
CHƯƠNG 1 · MỘT KHỞI ĐẦU MỚI

Khi một việc chưa như mong đợi, ta thường nhìn vào kết quả mà quên mất những gì mình đã học. Mỗi lần thử mang lại một thông tin mới: cách nào phù hợp, điều gì cần điều chỉnh, ai có thể giúp ta đi tiếp.

Hãy giữ một cuốn sổ nhỏ. Cuối ngày, viết xuống điều bạn đã làm tốt, điều bạn muốn cải thiện và một câu hỏi cho ngày mai. Sau một thời gian, bạn sẽ nhìn thấy một bản đồ được tạo nên từ chính những bước chân của mình.

Hết phần đọc thử minh họa. Cảm ơn bạn đã dành thời gian cho trang sách này.',1);
INSERT INTO Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive) VALUES (N'Hẹn nhau ở một ngày xanh',N'Hẹn nhau ở một ngày xanh là một đầu sách minh họa trong tủ sách Mộc Books. Những trang viết nhẹ nhàng đưa người đọc đến với các câu chuyện về sự trưởng thành, khám phá và những lựa chọn trong cuộc sống.

Cuốn sách phù hợp với bạn đọc yêu thích thể loại văn học. Dữ liệu, giá và bìa được tạo riêng cho đồ án để bạn kiểm thử đầy đủ các chức năng.',N'DEMO-0010',1,6,1,95000,125000,40,240,2026,N'/images/book-10.svg',N'LỜI MỞ ĐẦU

Có những buổi sáng, chúng ta thức dậy và nhận ra mình đã đi rất xa mà chưa kịp nhìn lại con đường. Một cuốn sách không hứa thay đổi cuộc đời trong một ngày. Nó chỉ mở ra một khoảng lặng để chúng ta bắt đầu đặt câu hỏi.

Cuốn sách “Hẹn nhau ở một ngày xanh” được bắt đầu từ một câu hỏi nhỏ: điều gì khiến một ngày bình thường trở nên đáng nhớ? Có thể là cuộc trò chuyện với người bạn cũ, một quyết định can đảm, hay việc ta dành vài phút thật lòng cho chính mình.

Trang mẫu này do dự án biên soạn để minh họa chức năng đọc thử.
---PAGE---
CHƯƠNG 1 · NHỮNG ĐIỀU NHỎ BÉ

Buổi chiều hôm ấy, con đường về nhà không có gì khác thường. Hàng cây vẫn đứng đó, quán nhỏ vẫn mở cửa, và người bán hàng vẫn mỉm cười với khách quen. Nhưng khi đi chậm hơn một chút, ta nghe được tiếng gió qua tán lá mà bao lần trước đã bỏ qua.

Không phải mọi hành trình đều bắt đầu bằng một kế hoạch lớn. Đôi khi, nó bắt đầu từ việc ghi lại một ý tưởng, mở trang đầu tiên hoặc học thêm một điều mới. Sự thay đổi trở nên bền vững khi ta có thể lặp lại bước nhỏ ấy mỗi ngày.

Hãy chọn một điều nhỏ bạn muốn thử hôm nay và dành cho nó mười phút.
---PAGE---
CHƯƠNG 1 · MỘT KHỞI ĐẦU MỚI

Khi một việc chưa như mong đợi, ta thường nhìn vào kết quả mà quên mất những gì mình đã học. Mỗi lần thử mang lại một thông tin mới: cách nào phù hợp, điều gì cần điều chỉnh, ai có thể giúp ta đi tiếp.

Hãy giữ một cuốn sổ nhỏ. Cuối ngày, viết xuống điều bạn đã làm tốt, điều bạn muốn cải thiện và một câu hỏi cho ngày mai. Sau một thời gian, bạn sẽ nhìn thấy một bản đồ được tạo nên từ chính những bước chân của mình.

Hết phần đọc thử minh họa. Cảm ơn bạn đã dành thời gian cho trang sách này.',1);
INSERT INTO Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive) VALUES (N'Lắng nghe chính mình',N'Lắng nghe chính mình là một đầu sách minh họa trong tủ sách Mộc Books. Những trang viết nhẹ nhàng đưa người đọc đến với các câu chuyện về sự trưởng thành, khám phá và những lựa chọn trong cuộc sống.

Cuốn sách phù hợp với bạn đọc yêu thích thể loại kỹ năng sống. Dữ liệu, giá và bìa được tạo riêng cho đồ án để bạn kiểm thử đầy đủ các chức năng.',N'DEMO-0011',3,6,2,89000,119000,41,216,2026,N'/images/book-11.svg',N'LỜI MỞ ĐẦU

Có những buổi sáng, chúng ta thức dậy và nhận ra mình đã đi rất xa mà chưa kịp nhìn lại con đường. Một cuốn sách không hứa thay đổi cuộc đời trong một ngày. Nó chỉ mở ra một khoảng lặng để chúng ta bắt đầu đặt câu hỏi.

Cuốn sách “Lắng nghe chính mình” được bắt đầu từ một câu hỏi nhỏ: điều gì khiến một ngày bình thường trở nên đáng nhớ? Có thể là cuộc trò chuyện với người bạn cũ, một quyết định can đảm, hay việc ta dành vài phút thật lòng cho chính mình.

Trang mẫu này do dự án biên soạn để minh họa chức năng đọc thử.
---PAGE---
CHƯƠNG 1 · NHỮNG ĐIỀU NHỎ BÉ

Buổi chiều hôm ấy, con đường về nhà không có gì khác thường. Hàng cây vẫn đứng đó, quán nhỏ vẫn mở cửa, và người bán hàng vẫn mỉm cười với khách quen. Nhưng khi đi chậm hơn một chút, ta nghe được tiếng gió qua tán lá mà bao lần trước đã bỏ qua.

Không phải mọi hành trình đều bắt đầu bằng một kế hoạch lớn. Đôi khi, nó bắt đầu từ việc ghi lại một ý tưởng, mở trang đầu tiên hoặc học thêm một điều mới. Sự thay đổi trở nên bền vững khi ta có thể lặp lại bước nhỏ ấy mỗi ngày.

Hãy chọn một điều nhỏ bạn muốn thử hôm nay và dành cho nó mười phút.
---PAGE---
CHƯƠNG 1 · MỘT KHỞI ĐẦU MỚI

Khi một việc chưa như mong đợi, ta thường nhìn vào kết quả mà quên mất những gì mình đã học. Mỗi lần thử mang lại một thông tin mới: cách nào phù hợp, điều gì cần điều chỉnh, ai có thể giúp ta đi tiếp.

Hãy giữ một cuốn sổ nhỏ. Cuối ngày, viết xuống điều bạn đã làm tốt, điều bạn muốn cải thiện và một câu hỏi cho ngày mai. Sau một thời gian, bạn sẽ nhìn thấy một bản đồ được tạo nên từ chính những bước chân của mình.

Hết phần đọc thử minh họa. Cảm ơn bạn đã dành thời gian cho trang sách này.',1);
INSERT INTO Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive) VALUES (N'Khởi đầu thông minh',N'Khởi đầu thông minh là một đầu sách minh họa trong tủ sách Mộc Books. Những trang viết nhẹ nhàng đưa người đọc đến với các câu chuyện về sự trưởng thành, khám phá và những lựa chọn trong cuộc sống.

Cuốn sách phù hợp với bạn đọc yêu thích thể loại kinh tế. Dữ liệu, giá và bìa được tạo riêng cho đồ án để bạn kiểm thử đầy đủ các chức năng.',N'DEMO-0012',2,5,3,149000,189000,42,336,2026,N'/images/book-12.svg',N'LỜI MỞ ĐẦU

Có những buổi sáng, chúng ta thức dậy và nhận ra mình đã đi rất xa mà chưa kịp nhìn lại con đường. Một cuốn sách không hứa thay đổi cuộc đời trong một ngày. Nó chỉ mở ra một khoảng lặng để chúng ta bắt đầu đặt câu hỏi.

Cuốn sách “Khởi đầu thông minh” được bắt đầu từ một câu hỏi nhỏ: điều gì khiến một ngày bình thường trở nên đáng nhớ? Có thể là cuộc trò chuyện với người bạn cũ, một quyết định can đảm, hay việc ta dành vài phút thật lòng cho chính mình.

Trang mẫu này do dự án biên soạn để minh họa chức năng đọc thử.
---PAGE---
CHƯƠNG 1 · NHỮNG ĐIỀU NHỎ BÉ

Buổi chiều hôm ấy, con đường về nhà không có gì khác thường. Hàng cây vẫn đứng đó, quán nhỏ vẫn mở cửa, và người bán hàng vẫn mỉm cười với khách quen. Nhưng khi đi chậm hơn một chút, ta nghe được tiếng gió qua tán lá mà bao lần trước đã bỏ qua.

Không phải mọi hành trình đều bắt đầu bằng một kế hoạch lớn. Đôi khi, nó bắt đầu từ việc ghi lại một ý tưởng, mở trang đầu tiên hoặc học thêm một điều mới. Sự thay đổi trở nên bền vững khi ta có thể lặp lại bước nhỏ ấy mỗi ngày.

Hãy chọn một điều nhỏ bạn muốn thử hôm nay và dành cho nó mười phút.
---PAGE---
CHƯƠNG 1 · MỘT KHỞI ĐẦU MỚI

Khi một việc chưa như mong đợi, ta thường nhìn vào kết quả mà quên mất những gì mình đã học. Mỗi lần thử mang lại một thông tin mới: cách nào phù hợp, điều gì cần điều chỉnh, ai có thể giúp ta đi tiếp.

Hãy giữ một cuốn sổ nhỏ. Cuối ngày, viết xuống điều bạn đã làm tốt, điều bạn muốn cải thiện và một câu hỏi cho ngày mai. Sau một thời gian, bạn sẽ nhìn thấy một bản đồ được tạo nên từ chính những bước chân của mình.

Hết phần đọc thử minh họa. Cảm ơn bạn đã dành thời gian cho trang sách này.',1);
INSERT INTO Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive) VALUES (N'Chú mèo và mặt trăng',N'Chú mèo và mặt trăng là một đầu sách minh họa trong tủ sách Mộc Books. Những trang viết nhẹ nhàng đưa người đọc đến với các câu chuyện về sự trưởng thành, khám phá và những lựa chọn trong cuộc sống.

Cuốn sách phù hợp với bạn đọc yêu thích thể loại thiếu nhi. Dữ liệu, giá và bìa được tạo riêng cho đồ án để bạn kiểm thử đầy đủ các chức năng.',N'DEMO-0013',4,4,2,65000,80000,43,80,2026,N'/images/book-13.svg',N'LỜI MỞ ĐẦU

Có những buổi sáng, chúng ta thức dậy và nhận ra mình đã đi rất xa mà chưa kịp nhìn lại con đường. Một cuốn sách không hứa thay đổi cuộc đời trong một ngày. Nó chỉ mở ra một khoảng lặng để chúng ta bắt đầu đặt câu hỏi.

Cuốn sách “Chú mèo và mặt trăng” được bắt đầu từ một câu hỏi nhỏ: điều gì khiến một ngày bình thường trở nên đáng nhớ? Có thể là cuộc trò chuyện với người bạn cũ, một quyết định can đảm, hay việc ta dành vài phút thật lòng cho chính mình.

Trang mẫu này do dự án biên soạn để minh họa chức năng đọc thử.
---PAGE---
CHƯƠNG 1 · NHỮNG ĐIỀU NHỎ BÉ

Buổi chiều hôm ấy, con đường về nhà không có gì khác thường. Hàng cây vẫn đứng đó, quán nhỏ vẫn mở cửa, và người bán hàng vẫn mỉm cười với khách quen. Nhưng khi đi chậm hơn một chút, ta nghe được tiếng gió qua tán lá mà bao lần trước đã bỏ qua.

Không phải mọi hành trình đều bắt đầu bằng một kế hoạch lớn. Đôi khi, nó bắt đầu từ việc ghi lại một ý tưởng, mở trang đầu tiên hoặc học thêm một điều mới. Sự thay đổi trở nên bền vững khi ta có thể lặp lại bước nhỏ ấy mỗi ngày.

Hãy chọn một điều nhỏ bạn muốn thử hôm nay và dành cho nó mười phút.
---PAGE---
CHƯƠNG 1 · MỘT KHỞI ĐẦU MỚI

Khi một việc chưa như mong đợi, ta thường nhìn vào kết quả mà quên mất những gì mình đã học. Mỗi lần thử mang lại một thông tin mới: cách nào phù hợp, điều gì cần điều chỉnh, ai có thể giúp ta đi tiếp.

Hãy giữ một cuốn sổ nhỏ. Cuối ngày, viết xuống điều bạn đã làm tốt, điều bạn muốn cải thiện và một câu hỏi cho ngày mai. Sau một thời gian, bạn sẽ nhìn thấy một bản đồ được tạo nên từ chính những bước chân của mình.

Hết phần đọc thử minh họa. Cảm ơn bạn đã dành thời gian cho trang sách này.',1);
INSERT INTO Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive) VALUES (N'Những chuyến đi không vội',N'Những chuyến đi không vội là một đầu sách minh họa trong tủ sách Mộc Books. Những trang viết nhẹ nhàng đưa người đọc đến với các câu chuyện về sự trưởng thành, khám phá và những lựa chọn trong cuộc sống.

Cuốn sách phù hợp với bạn đọc yêu thích thể loại văn học. Dữ liệu, giá và bìa được tạo riêng cho đồ án để bạn kiểm thử đầy đủ các chức năng.',N'DEMO-0014',1,2,1,105000,135000,44,280,2026,N'/images/book-14.svg',N'LỜI MỞ ĐẦU

Có những buổi sáng, chúng ta thức dậy và nhận ra mình đã đi rất xa mà chưa kịp nhìn lại con đường. Một cuốn sách không hứa thay đổi cuộc đời trong một ngày. Nó chỉ mở ra một khoảng lặng để chúng ta bắt đầu đặt câu hỏi.

Cuốn sách “Những chuyến đi không vội” được bắt đầu từ một câu hỏi nhỏ: điều gì khiến một ngày bình thường trở nên đáng nhớ? Có thể là cuộc trò chuyện với người bạn cũ, một quyết định can đảm, hay việc ta dành vài phút thật lòng cho chính mình.

Trang mẫu này do dự án biên soạn để minh họa chức năng đọc thử.
---PAGE---
CHƯƠNG 1 · NHỮNG ĐIỀU NHỎ BÉ

Buổi chiều hôm ấy, con đường về nhà không có gì khác thường. Hàng cây vẫn đứng đó, quán nhỏ vẫn mở cửa, và người bán hàng vẫn mỉm cười với khách quen. Nhưng khi đi chậm hơn một chút, ta nghe được tiếng gió qua tán lá mà bao lần trước đã bỏ qua.

Không phải mọi hành trình đều bắt đầu bằng một kế hoạch lớn. Đôi khi, nó bắt đầu từ việc ghi lại một ý tưởng, mở trang đầu tiên hoặc học thêm một điều mới. Sự thay đổi trở nên bền vững khi ta có thể lặp lại bước nhỏ ấy mỗi ngày.

Hãy chọn một điều nhỏ bạn muốn thử hôm nay và dành cho nó mười phút.
---PAGE---
CHƯƠNG 1 · MỘT KHỞI ĐẦU MỚI

Khi một việc chưa như mong đợi, ta thường nhìn vào kết quả mà quên mất những gì mình đã học. Mỗi lần thử mang lại một thông tin mới: cách nào phù hợp, điều gì cần điều chỉnh, ai có thể giúp ta đi tiếp.

Hãy giữ một cuốn sổ nhỏ. Cuối ngày, viết xuống điều bạn đã làm tốt, điều bạn muốn cải thiện và một câu hỏi cho ngày mai. Sau một thời gian, bạn sẽ nhìn thấy một bản đồ được tạo nên từ chính những bước chân của mình.

Hết phần đọc thử minh họa. Cảm ơn bạn đã dành thời gian cho trang sách này.',1);
INSERT INTO Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive) VALUES (N'Học cách học mỗi ngày',N'Học cách học mỗi ngày là một đầu sách minh họa trong tủ sách Mộc Books. Những trang viết nhẹ nhàng đưa người đọc đến với các câu chuyện về sự trưởng thành, khám phá và những lựa chọn trong cuộc sống.

Cuốn sách phù hợp với bạn đọc yêu thích thể loại kỹ năng sống. Dữ liệu, giá và bìa được tạo riêng cho đồ án để bạn kiểm thử đầy đủ các chức năng.',N'DEMO-0015',3,3,3,115000,145000,45,264,2026,N'/images/book-15.svg',N'LỜI MỞ ĐẦU

Có những buổi sáng, chúng ta thức dậy và nhận ra mình đã đi rất xa mà chưa kịp nhìn lại con đường. Một cuốn sách không hứa thay đổi cuộc đời trong một ngày. Nó chỉ mở ra một khoảng lặng để chúng ta bắt đầu đặt câu hỏi.

Cuốn sách “Học cách học mỗi ngày” được bắt đầu từ một câu hỏi nhỏ: điều gì khiến một ngày bình thường trở nên đáng nhớ? Có thể là cuộc trò chuyện với người bạn cũ, một quyết định can đảm, hay việc ta dành vài phút thật lòng cho chính mình.

Trang mẫu này do dự án biên soạn để minh họa chức năng đọc thử.
---PAGE---
CHƯƠNG 1 · NHỮNG ĐIỀU NHỎ BÉ

Buổi chiều hôm ấy, con đường về nhà không có gì khác thường. Hàng cây vẫn đứng đó, quán nhỏ vẫn mở cửa, và người bán hàng vẫn mỉm cười với khách quen. Nhưng khi đi chậm hơn một chút, ta nghe được tiếng gió qua tán lá mà bao lần trước đã bỏ qua.

Không phải mọi hành trình đều bắt đầu bằng một kế hoạch lớn. Đôi khi, nó bắt đầu từ việc ghi lại một ý tưởng, mở trang đầu tiên hoặc học thêm một điều mới. Sự thay đổi trở nên bền vững khi ta có thể lặp lại bước nhỏ ấy mỗi ngày.

Hãy chọn một điều nhỏ bạn muốn thử hôm nay và dành cho nó mười phút.
---PAGE---
CHƯƠNG 1 · MỘT KHỞI ĐẦU MỚI

Khi một việc chưa như mong đợi, ta thường nhìn vào kết quả mà quên mất những gì mình đã học. Mỗi lần thử mang lại một thông tin mới: cách nào phù hợp, điều gì cần điều chỉnh, ai có thể giúp ta đi tiếp.

Hãy giữ một cuốn sổ nhỏ. Cuối ngày, viết xuống điều bạn đã làm tốt, điều bạn muốn cải thiện và một câu hỏi cho ngày mai. Sau một thời gian, bạn sẽ nhìn thấy một bản đồ được tạo nên từ chính những bước chân của mình.

Hết phần đọc thử minh họa. Cảm ơn bạn đã dành thời gian cho trang sách này.',1);
INSERT INTO Books(Title,Description,Isbn,CategoryId,AuthorId,PublisherId,Price,ListPrice,Stock,Pages,Year,ImagePath,SampleText,IsActive) VALUES (N'Thành phố của ký ức',N'Thành phố của ký ức là một đầu sách minh họa trong tủ sách Mộc Books. Những trang viết nhẹ nhàng đưa người đọc đến với các câu chuyện về sự trưởng thành, khám phá và những lựa chọn trong cuộc sống.

Cuốn sách phù hợp với bạn đọc yêu thích thể loại văn học. Dữ liệu, giá và bìa được tạo riêng cho đồ án để bạn kiểm thử đầy đủ các chức năng.',N'DEMO-0016',1,6,1,119000,155000,46,312,2026,N'/images/book-16.svg',N'LỜI MỞ ĐẦU

Có những buổi sáng, chúng ta thức dậy và nhận ra mình đã đi rất xa mà chưa kịp nhìn lại con đường. Một cuốn sách không hứa thay đổi cuộc đời trong một ngày. Nó chỉ mở ra một khoảng lặng để chúng ta bắt đầu đặt câu hỏi.

Cuốn sách “Thành phố của ký ức” được bắt đầu từ một câu hỏi nhỏ: điều gì khiến một ngày bình thường trở nên đáng nhớ? Có thể là cuộc trò chuyện với người bạn cũ, một quyết định can đảm, hay việc ta dành vài phút thật lòng cho chính mình.

Trang mẫu này do dự án biên soạn để minh họa chức năng đọc thử.
---PAGE---
CHƯƠNG 1 · NHỮNG ĐIỀU NHỎ BÉ

Buổi chiều hôm ấy, con đường về nhà không có gì khác thường. Hàng cây vẫn đứng đó, quán nhỏ vẫn mở cửa, và người bán hàng vẫn mỉm cười với khách quen. Nhưng khi đi chậm hơn một chút, ta nghe được tiếng gió qua tán lá mà bao lần trước đã bỏ qua.

Không phải mọi hành trình đều bắt đầu bằng một kế hoạch lớn. Đôi khi, nó bắt đầu từ việc ghi lại một ý tưởng, mở trang đầu tiên hoặc học thêm một điều mới. Sự thay đổi trở nên bền vững khi ta có thể lặp lại bước nhỏ ấy mỗi ngày.

Hãy chọn một điều nhỏ bạn muốn thử hôm nay và dành cho nó mười phút.
---PAGE---
CHƯƠNG 1 · MỘT KHỞI ĐẦU MỚI

Khi một việc chưa như mong đợi, ta thường nhìn vào kết quả mà quên mất những gì mình đã học. Mỗi lần thử mang lại một thông tin mới: cách nào phù hợp, điều gì cần điều chỉnh, ai có thể giúp ta đi tiếp.

Hãy giữ một cuốn sổ nhỏ. Cuối ngày, viết xuống điều bạn đã làm tốt, điều bạn muốn cải thiện và một câu hỏi cho ngày mai. Sau một thời gian, bạn sẽ nhìn thấy một bản đồ được tạo nên từ chính những bước chân của mình.

Hết phần đọc thử minh họa. Cảm ơn bạn đã dành thời gian cho trang sách này.',1);
GO
