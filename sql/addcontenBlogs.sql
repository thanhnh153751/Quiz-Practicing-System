USE [Online_Quiz]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [fullname], [email], [phone], [password], [gender], [status], [avatar]) VALUES (2, N'dung', N'thanhnhhe153751@fpt.edu.vn', N'123123', N'123', 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject_Category] ON 

INSERT [dbo].[Subject_Category] ([id], [name]) VALUES (1, N'C')
INSERT [dbo].[Subject_Category] ([id], [name]) VALUES (2, N'C++')
INSERT [dbo].[Subject_Category] ([id], [name]) VALUES (3, N'SQL')
INSERT [dbo].[Subject_Category] ([id], [name]) VALUES (4, N'C#')
INSERT [dbo].[Subject_Category] ([id], [name]) VALUES (5, N'javaScript')
INSERT [dbo].[Subject_Category] ([id], [name]) VALUES (6, N'java')
INSERT [dbo].[Subject_Category] ([id], [name]) VALUES (7, N'python')
INSERT [dbo].[Subject_Category] ([id], [name]) VALUES (8, N'Cấu trúc dữ liệu')
INSERT [dbo].[Subject_Category] ([id], [name]) VALUES (9, N'Điện toán đám mấy')
SET IDENTITY_INSERT [dbo].[Subject_Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([id], [cid], [thumbnail], [title], [tagline], [origin_price], [sale_price], [contact], [description], [status]) VALUES (1, 1, N'https://codelearn.io/CodeCamp/CodeCamp/Upload/Course/eab2e064afab4d8aa5f0b0d408cef9e0.jpg', N'C cho người mới bắt đầu', N'Khóa học lập trình C cho người mới bắt đầu. Khóa học này sẽ cung cấp những kiến thức cơ bản và là nền tảng để bạn đi xa hơn trên con đường lập trình.', 0.0000, 0.0000, N'TuanLQ7', N'Khóa học lập trình C cho người mới bắt đầu. Khóa học này sẽ cung cấp những kiến thức cơ bản và là nền tảng để bạn đi xa hơn trên con đường lập trình.begin', 1)
INSERT [dbo].[Subject] ([id], [cid], [thumbnail], [title], [tagline], [origin_price], [sale_price], [contact], [description], [status]) VALUES (2, 2, N'https://codelearn.io/CodeCamp/CodeCamp/Upload/Course/fa2bdb40f4e449dca4514de8c8bca52d.jpg', N'Lập trình hướng đối tượng trong C++', N'Lập trình hướng đối tượng (Object-Oriented-Programming) là phương pháp lập trình dựa trên đối tượng để tìm ra bản chất của vấn đề. Khóa học C++ OOP giúp các lập trình viên học được kỹ thuật lập trình mà tất cả logic,...', 0.0000, 0.0000, N'TuanLQ7', N'Khóa học lập trình C cho người mới bắt đầu. Khóa học này sẽ cung cấp những kiến thức cơ bản và là nền tảng để bạn đi xa hơn trên con đường lập trình.', 1)
INSERT [dbo].[Subject] ([id], [cid], [thumbnail], [title], [tagline], [origin_price], [sale_price], [contact], [description], [status]) VALUES (3, 3, N'https://codelearn.io/CodeCamp/CodeCamp/Upload/Course/39d6cf7a07b94a0991fe3e68641417b4.jpg', N'Làm quen với SQL', N'Khóa học này sẽ giúp các lập trình viên nắm được nguyên tắc, cú pháp và cách thức hoạt động của SQL (Structured Query Language).', 0.0000, 0.0000, N'TuanLQ7', N'Khóa học lập trình C cho người mới bắt đầu. Khóa học này sẽ cung cấp những kiến thức cơ bản và là nền tảng để bạn đi xa hơn trên con đường lập trình.', 1)
INSERT [dbo].[Subject] ([id], [cid], [thumbnail], [title], [tagline], [origin_price], [sale_price], [contact], [description], [status]) VALUES (4, 4, N'https://codelearn.io/CodeCamp/CodeCamp/Upload/Course/3aa5f5e3e4cb4cb381288840a93c99eb.jpg', N'C# cơ bản', N'Khóa học lập trình C# kèm thực hành, khóa học sẽ giúp bạn làm quen với lập trình cũng như tạo nền tảng tư duy và kỹ năng cơ bản khi giải các bài tập.', 0.0000, 0.0000, N'TuanLQ7', N'Khóa học lập trình C cho người mới bắt đầu. Khóa học này sẽ cung cấp những kiến thức cơ bản và là nền tảng để bạn đi xa hơn trên con đường lập trình.', 1)
INSERT [dbo].[Subject] ([id], [cid], [thumbnail], [title], [tagline], [origin_price], [sale_price], [contact], [description], [status]) VALUES (5, 5, N'https://codelearn.io/CodeCamp/CodeCamp/Upload/Course/8c4eed15a33744e996461692464ebc7f.jpg', N'JavaScript cơ bản', N'Giúp học viên nắm vững các nguyên tắc và cú pháp cơ bản trong Javascript - ngôn ngữ lập trình phổ biến nhất trên thế giới.', 0.0000, 0.0000, N'TuanLQ7', N'Khóa học lập trình C cho người mới bắt đầu. Khóa học này sẽ cung cấp những kiến thức cơ bản và là nền tảng để bạn đi xa hơn trên con đường lập trình.', 1)
INSERT [dbo].[Subject] ([id], [cid], [thumbnail], [title], [tagline], [origin_price], [sale_price], [contact], [description], [status]) VALUES (6, 6, N'https://codelearn.io/CodeCamp/CodeCamp/Upload/Course/1e746fe3cbe448bda850d8b953a78954.jpg', N'Java cơ bản', N'Khóa học lập trình Java cơ bản cho người mới bắt đầu, khóa học này sẽ là nền tảng cho khóa Java nâng cao để tiến tới Java Web hay lập trình Android,', 0.0000, 0.0000, N'TuanLQ7', N'Khóa học lập trình C cho người mới bắt đầu. Khóa học này sẽ cung cấp những kiến thức cơ bản và là nền tảng để bạn đi xa hơn trên con đường lập trình.', 1)
INSERT [dbo].[Subject] ([id], [cid], [thumbnail], [title], [tagline], [origin_price], [sale_price], [contact], [description], [status]) VALUES (7, 7, N'https://codelearn.io/CodeCamp/CodeCamp/Upload/Course/cf55489ccd434e8c81c61e6fffc9433f.jpg', N'Python cơ bản', N'Khóa học lập trình Python cơ bản với các bài tập và lý thuyết dễ hiểu, học xong bạn có thể tự tin để tới với các chủ đề nâng cao hơn của Python.', 0.0000, 0.0000, N'TuanLQ7', N'Khóa học lập trình C cho người mới bắt đầu. Khóa học này sẽ cung cấp những kiến thức cơ bản và là nền tảng để bạn đi xa hơn trên con đường lập trình.', 1)
INSERT [dbo].[Subject] ([id], [cid], [thumbnail], [title], [tagline], [origin_price], [sale_price], [contact], [description], [status]) VALUES (8, 8, N'https://codelearn.io/CodeCamp/CodeCamp/Upload/Course/e0a85ff6c0c64720ad582bdec3741cd1.jpg', N'Cấu trúc dữ liệu và giải thuật', N'Khóa học này sẽ giúp các bạn hiểu thuật toán cũng như hiểu rõ bản chất của các cấu trúc dữ liệu - điều kiện để trở thành lập trình viên giỏi.', 0.0000, 0.0000, N'TuanLQ7', N'Khóa học lập trình C cho người mới bắt đầu. Khóa học này sẽ cung cấp những kiến thức cơ bản và là nền tảng để bạn đi xa hơn trên con đường lập trình.', 1)
INSERT [dbo].[Subject] ([id], [cid], [thumbnail], [title], [tagline], [origin_price], [sale_price], [contact], [description], [status]) VALUES (9, 9, N'https://codelearn.io/CodeCamp/CodeCamp/Upload/Course/b7fa55b1f69c4852a59543c47d908229.jpg', N'Điện toán đám mây', N'Khóa học sẽ cung cấp cái nhìn cơ bản và tổng quan về lĩnh vực điện toán đám mây và các công nghệ điện toán đám mây nổi bật', 0.0000, 0.0000, N'TuanLQ7', N'Khóa học lập trình C cho người mới bắt đầu. Khóa học này sẽ cung cấp những kiến thức cơ bản và là nền tảng để bạn đi xa hơn trên con đường lập trình.advanced', 1)
SET IDENTITY_INSERT [dbo].[Subject] OFF
GO
SET IDENTITY_INSERT [dbo].[Post_Category] ON 

INSERT [dbo].[Post_Category] ([id], [name]) VALUES (1, N'programming')
INSERT [dbo].[Post_Category] ([id], [name]) VALUES (2, N'algorithm')
INSERT [dbo].[Post_Category] ([id], [name]) VALUES (3, N'freelance')
INSERT [dbo].[Post_Category] ([id], [name]) VALUES (4, N'career-advice')
SET IDENTITY_INSERT [dbo].[Post_Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([id], [cid], [post_title], [biref], [details], [author], [update_date], [contact], [thumbnail]) VALUES (1, 1, N'Kỹ sư cao cấp Google tiết lộ Ngôn ngữ lập trình tốt nhất năm 2022', N'Học ngôn ngữ lập trình nào?', N'“Học ngôn ngữ lập trình nào?” dường như là câu hỏi mà Minhaz - Một kỹ sư cao cấp của Google thường xuyên nhận được.

Đôi khi, câu hỏi này lại có nghĩa là: “Tôi nên chọn học Java, Python hay JavaScript?”

Thành thực mà nói, tác giả viết bài này sau khi đọc rất nhiều những câu hỏi và bài viết tương tự cùng chủ đề, và quyết định đưa ra một cái nhìn rất khác, một câu trả lời rất khác. Bạn sẽ cảm thấy “bị lừa” với tiêu đề đầy “kinh điển” phía trên.

Vậy thì, Học cái nào bây giờ nhỉ?
Lời khuyên của tôi là: “Chẳng riêng một ngôn ngữ nào mới là tốt nhất cả!”

Không thành vấn đề nếu bạn bắt đầu với C++, Java, Python hay Javascript hay bất kỳ một ngôn ngữ nào khác. Học một ngôn ngữ mới không mất nhiều thời gian và nó cũng không phải là ưu tiên số 1 trong việc học lập trình.

Ngôn ngữ lập trình là phương tiện cuối cùng bạn dùng đến trong hành trình này. Và trong thực tế, chúng ta có xu hướng tiếp tục chuyển sang ngôn ngữ này hoặc ngôn ngữ khác để hoàn thành công việc chứ không chỉ đóng đinh ở một ngôn ngữ duy nhất.

Tôi bắt đầu hành trình của mình với C++ ở trường trung học, nhưng lại dành phần lớn thời gian để làm bằng Javascript ở trường đại học. Công việc của tôi tại Microsoft đòi hỏi tôi phải làm rất nhiều C#/.Net và Typescript và khi chuyển sang Google, tôi bắt đầu làm việc trên Android Camera App - vì vậy tôi bắt đầu làm việc với Java. Ngay sau đó tôi chuyển sang lĩnh vực chụp ảnh tính toán của máy ảnh và những ngày này tôi dùng rất nhiều C++ (mã sản xuất) và Python để tạo mẫu.

Và trong suốt cuộc hành trình này, học một ngôn ngữ mới chưa bao giờ là vấn đề gì đó quá lớn cả.

Tôi phải thừa nhận rằng theo thời gian, chúng ta đã xây dựng các “loại” ngôn ngữ lập trình khác nhau dựa theo cách chúng được sử dụng. Một số ngôn ngữ được sử dụng hoàn toàn để đánh dấu như HTML hoặc XML, trong khi những ngôn ngữ khác hoàn toàn dành cho các tập lệnh như shell script hoặc bat scripts, một số có bản chất chức năng, những ngôn ngữ khác thì không, v.v.

Sẽ phải đánh đổi nhiều thứ khi chuyển từ “loại” này sang “loại” khác. Nhưng một khi bạn có hiểu biết cơ bản về những “loại” này, rào cản trong việc học một ngôn ngữ mới sẽ trở nên không còn đáng kể.

Ơ thế thì… Chúng ta nên làm gì?
Theo ý kiến của tôi, kỹ năng quan trọng nhất để làm việc chính là khả năng giải quyết bất kỳ vấn đề nào gặp phải.

Nếu cần làm một ứng dụng web, bạn có thể tạo nó không?
Bạn có một ứng dụng Android, bạn có thể cải thiện hiệu suất không?
Bạn có một vấn đề có thể giải quyết được với trained neural network - bạn có thể tiếp tục làm được không?
Ngay cả khi bạn “chưa bao giờ” làm những việc đó trước đây nhưng bạn lại cần phải làm nó bằng bất cứ giá nào (nếu không thì điểm thấp, thì sếp chửi, thì vân vân và mây mây...)

Cuối cùng, tất cả đều giống nhau, vì vậy hãy tiếp tục và tập trung vào việc học các công nghệ mới, cố gắng đào sâu hơn vào các khái niệm phức tạp, ngay từ đầu, hãy cố gắng khám phá nhiều thể loại khác nhau cho đến khi tất cả bắt đầu giống giống nhau. Cuối cùng, hãy chọn thứ gì đó mà bạn thực sự thích và đi sâu!', N'Phanhtrinh', CAST(N'2022-02-10T00:00:00.000' AS DateTime), N'Phanhtrinh@gmail.com', N'https://codelearn.io/Upload/Blog/ky-su-google-ngon-ngu-tot-nhat-2022-63780082801.5831.jpg')
INSERT [dbo].[Post] ([id], [cid], [post_title], [biref], [details], [author], [update_date], [contact], [thumbnail]) VALUES (2, 3, N'Bạn đã chuẩn bị gì để bắt đầu sự nghiệp của một Freelancer??', N'Bài viết lược dịch từ blog của Dave Smith trên website DEV Community (dev.to)', N'Freelance không phải là một giải pháp cho mọi vấn đề của công việc “làm công ăn lương”. - Dave Smith said.

Có nhiều người yêu thích và thậm chí đã thành công với kiểu làm việc “tự kiếm sống” (self-employed) như freelancer. Có thể đối với bản thân họ đó là sự lựa chọn phù hợp. Nhưng không phải bất kỳ ai, nó cũng là sự lựa chọn đúng đắn.

Gần đây có rất nhiều khoá học cổ vũ người ta rời bỏ những công việc “làm công ăn lương” để đi làm công việc self-employed. Những khoá học này mô tả rằng freelance chính là giải pháp cho tất cả những vấn đề khó chịu mà công việc full-time mang lại.

Không thích chế độ làm việc “9-5” (nine five – 09 tiếng một ngày và 05 ngày một tuần). Đi làm Freelance!!

Không muốn làm việc theo khung giờ cố định?? Đi làm Freelance!!

Ghét sếp?? Đi làm Freelance!!

Muốn ở bên gia đình?? Đi làm Freelance!!

……..

Hay đôi khi bạn muốn thực hiện bất kỳ một ý tưởng điên rồ nào (mà nhiều khả năng sẽ không được tập thể chấp nhận)?? Đi làm Freelance!!

Tuy nhiên, những ý tưởng điên rồ kia đôi khi lại …. được công chúng đón nhận theo một cách nào đó – giống như trên Dead Parrot

Ta cũng cần phải khẳng định rằng sự nghiệp của chúng ta nên được xây dựng trên nền tảng những công việc mà chúng ta yêu thích, và việc học tập để thay đổi công việc, chuyển đổi nghề nghiệp theo ý muốn là điều nằm trong khả năng của tất cả mọi người.

Kể cả những khoá học cổ vũ người ta đi làm freelance, nó cũng là những khoá học không hề kém về chất lượng, và đã được xây dựng dựa trên kinh nghiệm của một tác giả đã thành công trên con đường freelance. Khoá học đó truyền tải những kiến thức, kinh nghiệm, tiếp lửa những đam mê cho những người đi sau muốn tiếp bước thành công của họ.

Tuy những khoá học đó truyền tải những kiến thức, kinh nghiệm có thể rất bổ ích. Nhưng sự thật là chẳng có con đường thành công chung nào cho tất cả mọi người. Và những kinh nghiệm của người tạo ra các khoá học nhiều khi chỉ ứng nghiệm với một số ít người có hoàn cảnh, khả năng giống họ mà thôi', N'Phanhtrinh', CAST(N'2021-02-10T00:00:00.000' AS DateTime), N'Phanhtrinh@gmail.com', N'https://codelearn.io/Upload/Blog/chuan-bi-gi-cho-su-nghiep-freelancer-63772494934.7101.jpg')
INSERT [dbo].[Post] ([id], [cid], [post_title], [biref], [details], [author], [update_date], [contact], [thumbnail]) VALUES (3, 2, N'Giải Mã Lời Gọi Hàm std::sort() Trong C++?', N'Bài viết nói về thuật toán Intro Sort - thuật toán được sử dụng trong thư viện chuẩn STL trong C++.', N'1. Ý tưởng thuật toán
Trước hết, chắc hẳn chúng ta đều biết trong trường hợp xấu nhất(worst case), Quick Sort có độ phức tạp là O(n2)(trường hợp này xảy ra khi dãy đã được sắp xếp và khi sắp xếp chúng ta chọn pivot là phần tử đầu tiên hay cuối cùng của dãy).



(link ảnh: Lecture 28, November 25, 1996 (dartmouth.edu))

Để khắc phục vấn đề trên, 1 giải pháp được đưa ra là phương pháp median-of-3. Phương pháp này nghĩa là trong quá trình chọn pivot, chúng ta sẽ lấy phần tử đầu tiên, phần tử ở giữa và phần tử cuối cùng của dãy sau đó chọn ra trung vị của 3 phần tử này để làm pivot.



Tuy nhiên, vẫn tồn tại 1 số dãy mà phương pháp median-of-3 cho độ phức tạp O(n2), những dãy như vậy được gọi là "median-of-3 killer".



1 ví dụ về "median-of-3 killer"

Intro Sort được tác giả David R. Musser lần đầu giới thiệu vào năm 1997 để giải quyết vấn đề trên. Và theo như thử nghiệm của tác giả trong trường hợp sắp xếp 1 dãy "median-of-3 killer" có kích thước 100,000 phần tử, Intro Sort cho tốc độ nhanh gấp 200 lần so với Quick Sort có sử dụng median-of-3.

Như mình đã từng đề cập ở bài viết Đâu Mới Là Thuật Toán Sắp Xếp Tốt Nhất? (codelearn.io), mỗi thuật toán sắp xếp sẽ thích hợp với 1 số loại dữ liệu đầu vào. Do đó, Intro Sort lợi dụng tư tưởng trên để tối ưu thuật toán, tùy vào dữ liệu đầu vào mà sẽ dùng thuật toán thích hợp để sắp xếp, mà cụ thể ở đây là 3 thuật toán(Insertion Sort, Heap Sort và Quick Sort).

2. Triển khai thuật toán
Lưu đồ của thuật toán Intro Sort có thể biểu diễn như sau:



Trước hết như chúng ta đã biết, Insertion Sort sẽ cho tốc độ rẩt nhanh với mảng có kích thước nhỏ, do đó khi số lượng phần tử trong mảng nhỏ hơn hoặc bằng 16, Insertion Sort là thuật toán được lựa chọn để sắp xếp mảng.

Tại sao lại là Heap Sort mà không phải Merge Sort được sử dụng để tránh worst case của Quick Sort? Câu trả lời đơn giản là vì Merge Sort sẽ tốn thêm bộ nhớ khi sắp xếp, trong khi Heap Sort thì không.

Tại sao lại là 16 và 2 * log2N? Đây là những con số mang tính gần đúng và được tính ra dựa trên các kết quả thực nghiệm.', N'Phanhtrinh', CAST(N'2021-02-10T00:00:00.000' AS DateTime), N'Phanhtrinh@gmail.com', N'https://codelearn.io/Upload/Blog/introsort-63764178069.3743.jpg')
INSERT [dbo].[Post] ([id], [cid], [post_title], [biref], [details], [author], [update_date], [contact], [thumbnail]) VALUES (4, 4, N'Rì-viu 5 Phút: Các Mẫu Kiến Trúc Phần Mềm Không Thể Bỏ Qua', N'Tại sao bạn nên học các Mẫu kiến trúc cơ bản như một Kỹ sư phần mềm? Tôi tin rằng có rất nhiều câu trả lời cho câu hỏi này, nhưng tôi sẽ đưa ra một vài lý do để bạn cân nhắc', N'Khi ai đó đào sâu vào thế giới của Kiến trúc Phần mềm, một ngày nào đó họ sẽ cần học những kiến thức cơ bản về các mẫu Kiến trúc Phần mềm. Khi tôi mới học code, tôi không biết tìm đâu ra nguồn tài liệu để học, nhất là các tài liệu cụ thể và dễ hiểu.

Mãi cho tới khi tôi tìm thấy cuốn sách Software Architecture Patterns của Mark Richards. Dưới đây, tôi sẽ chia sẻ cho các bạn một số phần quan trọng của cuốn sách và các mẫu kiến trúc. Để có cái nhìn toàn diện và kiến thức cụ thể hơn, tôi vẫn khuyên các bạn nên đọc sách nhé!

Tại sao bạn nên học các Mẫu kiến trúc cơ bản như một Kỹ sư phần mềm?
Tôi tin rằng có rất nhiều câu trả lời cho câu hỏi này, nhưng tôi sẽ đưa ra một vài lý do để bạn cân nhắc. Trước hết, nếu bạn biết những kiến thức cơ bản về các mẫu kiến trúc thì bạn sẽ dễ dàng thực hiện theo yêu cầu của kiến trúc sư hơn. Thứ hai, biết những mẫu đó sẽ giúp bạn đưa ra quyết định trong code của mình. Ví dụ: nếu thiết kế ứng dụng dựa trên các dịch vụ nhỏ hướng sự kiện, với tư cách là một kỹ sư phần mềm, bạn phải tách code của mình thành một dịch vụ riêng biệt nếu bạn nhận thấy sự phức tạp ngày càng tăng và trách nhiệm của logic trong dịch vụ hiện có. (Nếu bạn không hiểu phần này, chỉ cần làm theo văn bản, nơi mẫu này được giải thích ngắn gọn).

Có 5 mẫu được mô tả trong cuốn sách của Mark Richards:

Kiến trúc phân lớp
Kiến trúc hướng sự kiện
Kiến trúc microkernel (hoặc kiến trúc Plugin)
Kiến trúc microservices
Kiến trúc dựa trên không gian (hoặc mẫu kiến trúc đám mây)
1. Kiến trúc phân lớp
Đây là kiến trúc phổ biến nhất cho các ứng dụng nguyên khối. Ý tưởng cơ bản đằng sau mô hình là chia logic ứng dụng thành nhiều lớp, mỗi lớp đóng gói vai trò cụ thể. Ví dụ: lớp Persistence sẽ chịu trách nhiệm giao tiếp ứng dụng với công cụ cơ sở dữ liệu..



2. Kiến trúc hướng sự kiện
Ý tưởng đằng sau mẫu này là tách logic ứng dụng thành các thành phần xử lý sự kiện có mục đích duy nhất nhận và xử lý các sự kiện một cách không đồng bộ. Mẫu này là một trong những mẫu kiến trúc không đồng bộ phân tán phổ biến được biết đến với khả năng mở rộng và khả năng thích ứng cao.



3. Kiến trúc Microkernel 
Kiến trúc Mikrokernel, còn được gọi là kiến trúc Plugin, là mô hình thiết kế với hai thành phần chính: một hệ thống lõi và các mô-đun plug-in (hoặc phần mở rộng). Một ví dụ tuyệt vời sẽ là trình duyệt Web (hệ thống lõi) nơi bạn có thể cài đặt các tiện ích mở rộng (hoặc plugin) vô tận.



4. Kiến trúc Microservices
Kiến trúc microservices bao gồm các dịch vụ được triển khai riêng biệt, trong đó mỗi dịch vụ sẽ có một trách nhiệm lý tưởng. Các dịch vụ đó độc lập với nhau và nếu một dịch vụ bị lỗi thì các dịch vụ khác sẽ không ngừng chạy.



5. Kiến trúc dựa trên không gian
Ý tưởng chính đằng sau mô hình dựa trên không gian là bộ nhớ được chia sẻ phân tán để giảm thiểu các vấn đề thường xuyên xảy ra ở cấp cơ sở dữ liệu. Giả định là bằng cách xử lý hầu hết các hoạt động sử dụng dữ liệu trong bộ nhớ, chúng ta có thể tránh các hoạt động bổ sung trong cơ sở dữ liệu, do đó bất kỳ vấn đề nào trong tương lai có thể phát triển từ đó (ví dụ: nếu thực thể dữ liệu hoạt động người dùng của bạn đã thay đổi, bạn không cần để thay đổi một loạt mã liên tục và truy xuất dữ liệu đó từ DB).

Cách tiếp cận cơ bản là tách ứng dụng thành các đơn vị xử lý (có thể tự động tăng và giảm quy mô dựa trên nhu cầu), nơi dữ liệu sẽ được sao chép và xử lý giữa các đơn vị đó mà không cần bất kỳ sự ổn định nào đối với cơ sở dữ liệu trung tâm (mặc dù sẽ có các kho lưu trữ cục bộ cho nhân sự cố hệ thống).



Bạn có thể tìm thấy các ví dụ đơn giản nhất cho một số mẫu kiến trúc đó trong tài khoản GitHub dưới đây:

Layered pattern (Java)
Mikrokernel or Plugin pattern (Go/Golang)
Microservices pattern (Go)', N'Phanhtrinh', CAST(N'2022-06-10T00:00:00.000' AS DateTime), N'Phanhtrinh@gmail.com', N'	https://codelearn.io/Upload/Blog/cac-mau-kien-truc-phan-mem-63769109687.7058.jpg')
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
