USE [Online_Quiz]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [fullname], [email], [phone], [password], [gender], [status]) VALUES (1, N'Phạm Hồng Dương', N'hongduong5441@gmail.com', N'0839169667', N'admin123', 1, 1)
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

INSERT [dbo].[Subject] ([id], [cid], [thumbnail], [title], [tagline], [origin_price], [sale_price], [contact], [description], [status]) VALUES (1, 1, N'https://codelearn.io/CodeCamp/CodeCamp/Upload/Course/eab2e064afab4d8aa5f0b0d408cef9e0.jpg', N'C cho người mới bắt đầu', N'lập trình C', 0.0000, 0.0000, N'TuanLQ7', N'Khóa học lập trình C cho người mới bắt đầu. Khóa học này sẽ cung cấp những kiến thức cơ bản và là nền tảng để bạn đi xa hơn trên con đường lập trình.', 1)
INSERT [dbo].[Subject] ([id], [cid], [thumbnail], [title], [tagline], [origin_price], [sale_price], [contact], [description], [status]) VALUES (2, 2, N'https://codelearn.io/CodeCamp/CodeCamp/Upload/Course/fa2bdb40f4e449dca4514de8c8bca52d.jpg', N'Lập trình hướng đối tượng trong C++', N'demo', 0.0000, 0.0000, N'TuanLQ7', N'Khóa học lập trình C cho người mới bắt đầu. Khóa học này sẽ cung cấp những kiến thức cơ bản và là nền tảng để bạn đi xa hơn trên con đường lập trình.', 1)
INSERT [dbo].[Subject] ([id], [cid], [thumbnail], [title], [tagline], [origin_price], [sale_price], [contact], [description], [status]) VALUES (3, 3, N'https://codelearn.io/CodeCamp/CodeCamp/Upload/Course/39d6cf7a07b94a0991fe3e68641417b4.jpg', N'Làm quen với SQL', N'demo', 0.0000, 0.0000, N'TuanLQ7', N'Khóa học lập trình C cho người mới bắt đầu. Khóa học này sẽ cung cấp những kiến thức cơ bản và là nền tảng để bạn đi xa hơn trên con đường lập trình.', 1)
INSERT [dbo].[Subject] ([id], [cid], [thumbnail], [title], [tagline], [origin_price], [sale_price], [contact], [description], [status]) VALUES (4, 4, N'https://codelearn.io/CodeCamp/CodeCamp/Upload/Course/3aa5f5e3e4cb4cb381288840a93c99eb.jpg', N'C# cơ bản', N'demo', 0.0000, 0.0000, N'TuanLQ7', N'Khóa học lập trình C cho người mới bắt đầu. Khóa học này sẽ cung cấp những kiến thức cơ bản và là nền tảng để bạn đi xa hơn trên con đường lập trình.', 1)
INSERT [dbo].[Subject] ([id], [cid], [thumbnail], [title], [tagline], [origin_price], [sale_price], [contact], [description], [status]) VALUES (5, 5, N'https://codelearn.io/CodeCamp/CodeCamp/Upload/Course/8c4eed15a33744e996461692464ebc7f.jpg', N'JavaScript cơ bản', N'demo', 0.0000, 0.0000, N'TuanLQ7', N'Khóa học lập trình C cho người mới bắt đầu. Khóa học này sẽ cung cấp những kiến thức cơ bản và là nền tảng để bạn đi xa hơn trên con đường lập trình.', 1)
INSERT [dbo].[Subject] ([id], [cid], [thumbnail], [title], [tagline], [origin_price], [sale_price], [contact], [description], [status]) VALUES (6, 6, N'https://codelearn.io/CodeCamp/CodeCamp/Upload/Course/1e746fe3cbe448bda850d8b953a78954.jpg', N'Java cơ bản', N'demo', 0.0000, 0.0000, N'TuanLQ7', N'Khóa học lập trình C cho người mới bắt đầu. Khóa học này sẽ cung cấp những kiến thức cơ bản và là nền tảng để bạn đi xa hơn trên con đường lập trình.', 1)
INSERT [dbo].[Subject] ([id], [cid], [thumbnail], [title], [tagline], [origin_price], [sale_price], [contact], [description], [status]) VALUES (7, 7, N'https://codelearn.io/CodeCamp/CodeCamp/Upload/Course/cf55489ccd434e8c81c61e6fffc9433f.jpg', N'Python cơ bản', N'demo', 0.0000, 0.0000, N'TuanLQ7', N'Khóa học lập trình C cho người mới bắt đầu. Khóa học này sẽ cung cấp những kiến thức cơ bản và là nền tảng để bạn đi xa hơn trên con đường lập trình.', 1)
INSERT [dbo].[Subject] ([id], [cid], [thumbnail], [title], [tagline], [origin_price], [sale_price], [contact], [description], [status]) VALUES (8, 8, N'https://codelearn.io/CodeCamp/CodeCamp/Upload/Course/e0a85ff6c0c64720ad582bdec3741cd1.jpg', N'Cấu trúc dữ liệu và giải thuật', N'demo', 0.0000, 0.0000, N'TuanLQ7', N'Khóa học lập trình C cho người mới bắt đầu. Khóa học này sẽ cung cấp những kiến thức cơ bản và là nền tảng để bạn đi xa hơn trên con đường lập trình.', 1)
INSERT [dbo].[Subject] ([id], [cid], [thumbnail], [title], [tagline], [origin_price], [sale_price], [contact], [description], [status]) VALUES (9, 9, N'https://codelearn.io/CodeCamp/CodeCamp/Upload/Course/b7fa55b1f69c4852a59543c47d908229.jpg', N'Điện toán đám mây', N'demo', 0.0000, 0.0000, N'TuanLQ7', N'Khóa học lập trình C cho người mới bắt đầu. Khóa học này sẽ cung cấp những kiến thức cơ bản và là nền tảng để bạn đi xa hơn trên con đường lập trình.', 1)
SET IDENTITY_INSERT [dbo].[Subject] OFF
GO
SET IDENTITY_INSERT [dbo].[Permission] ON 

INSERT [dbo].[Permission] ([id], [per_name]) VALUES (1, N'ADMIN1')
SET IDENTITY_INSERT [dbo].[Permission] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Permission] ON 

INSERT [dbo].[User_Permission] ([id], [account_id], [permission_id], [license]) VALUES (1, 1, 1, N'1')
SET IDENTITY_INSERT [dbo].[User_Permission] OFF
GO
SET IDENTITY_INSERT [dbo].[Action] ON 

INSERT [dbo].[Action] ([id], [action_name], [action_code]) VALUES (1, N'Access Homepage', N'ACCESS_HMP')
INSERT [dbo].[Action] ([id], [action_name], [action_code]) VALUES (2, N'Create Blog', N'CREATE_BLOG')
INSERT [dbo].[Action] ([id], [action_name], [action_code]) VALUES (3, N'Full Controll', N'FULL')
SET IDENTITY_INSERT [dbo].[Action] OFF
GO
SET IDENTITY_INSERT [dbo].[Permission_Action] ON 

INSERT [dbo].[Permission_Action] ([id], [permission_id], [action_id]) VALUES (3, 1, 1)
INSERT [dbo].[Permission_Action] ([id], [permission_id], [action_id]) VALUES (2, 1, 2)
INSERT [dbo].[Permission_Action] ([id], [permission_id], [action_id]) VALUES (1, 1, 3)
SET IDENTITY_INSERT [dbo].[Permission_Action] OFF
GO
SET IDENTITY_INSERT [dbo].[Post_Category] ON 

INSERT [dbo].[Post_Category] ([id], [name]) VALUES (1, N'programming')
INSERT [dbo].[Post_Category] ([id], [name]) VALUES (2, N'math')
INSERT [dbo].[Post_Category] ([id], [name]) VALUES (3, N'programming')
INSERT [dbo].[Post_Category] ([id], [name]) VALUES (4, N'algorithm')
INSERT [dbo].[Post_Category] ([id], [name]) VALUES (5, N'freelance')
INSERT [dbo].[Post_Category] ([id], [name]) VALUES (6, N'career-advice')
SET IDENTITY_INSERT [dbo].[Post_Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([id], [cid], [post_title], [biref], [details], [author], [update_date], [contact], [thumbnail]) VALUES (1, 1, N'Top 15 ngôn ngữ lập trình phổ biến nhất thế giới, bạn đã biết hết chưa?', N'Những ngôn ngữ phổ biến hiện nay là', N'Kỹ sư phần mềm đang là một trong những nghề nhu cầu cao nhất hiện nay – ngay cả thực tập sinh tại các công ty công nghệ cũng có thể nhận một mức lương đáng ghen tị.

Giữa hàng triệu nhà phát triển với đủ mọi loại kỹ năng khác nhau, nhiều công ty công nghệ đang bắt đầu quay sang GitHub - startup 2 tỷ USD được mệnh danh là “Facebook của giới lập trình viên” - để tìm kiếm các nhân tài code.

Nếu bạn là một lập trình viên đang tìm kiếm cơ hội việc làm trong các công ty này thì hãy nghía xem danh sách các ngôn ngữ lập trình hot nhất trên GitHub dưới đây (Danh sách dựa trên thống kê thực của GitHub) để xem những ngôn ngữ nào đang được săn đón nhiều nhất nhé.

15. TypeScript



Là một nhánh của JavaScript, TypeScript là ngôn ngữ lập trình do Microsoft phát triển. Xuất hiện từ năm 2012, TypeScript đã được nhiều lập trình viên yêu thích bởi khả năng xây dựng các ứng dụng lớn trên nền web hiện đại.

14. Swift



Ngôn ngữ lập trình cho iPhone do Apple phát triển này mới chỉ khởi nguồn từ năm 2014 nhưng đã thu hút một lượng lớn các nhà phát triển. Lyft - đối thủ của Uber tại Mỹ - cũng vừa mới viết lại toàn bộ ứng dụng iPhone của mình bằng Swift và đang chứng kiến những tiến bộ đáng kể về hiệu năng và trải nghiệm.

13. Scala



Bắt đầu lên sóng từ năm 2001, Scala được phát triển nhằm giúp các lập trình viên code nhanh và dễ dàng hơn so với khi viết bằng Java. Các công ty như Airbnb và Apple cũng từng sử dụng Scala cho các ứng dụng của mình.

12. Objective-C



Ngôn ngữ lập trình C thuở đầu đã có ảnh hưởng sâu rộng đến mức tạo đà cho hàng loạt ngôn ngữ lập trình tiền nhiệm cùng tên ra đời. Lấy cảm hứng từ C nhưng những ngôn ngữ này còn được lồng thêm nhiều tính năng từ các ngôn ngữ khác. Objective-C có thể được dùng vào thiết kế ứng dụng iOS, vẫn phổ biến hơn Swift dù Swift cũng đang tăng trưởng rất nhanh.

11. Shell



Là một cái tên có vẻ khá lạ lùng so với số còn lại trong danh sách, Shell không hẳn là một ngôn ngữ lập trình mà là một chương trình phổ biến hay một chuỗi các hoạt động lặp lại trong hệ điều hành. Các chuyên viên IT trong công ty bạn có thể sẽ dùng những đoạn script Shell để tự động hóa việc cập nhật các chương trình của công ty.

10. Go



Google phát triển Go để giúp các nhà phát triển của mình xây dựng các hệ thống cho lượng người dùng cực lớn. Go cũng được rất nhiều lập trình viên yêu thích vì tính dễ đọc và dễ nhân rộng.

9. C



Ngôn ngữ kinh điển này được sáng chế ra vào năm 1972 và vẫn thịnh hành cho đến ngày nay, không chỉ bởi khả năng hoạt động trên tất cả các nền tảng điện toán mà còn bởi tính ổn định và dễ hiểu với hầu hết các lập trình viên từ khắp nơi trên thế giới.

8. C#



C# được đọc là “C-sharp”, tương tự như một nốt trong âm nhạc. C# được Microsoft phát triển và cũng là một biến thể của ngôn ngữ C. C# được yêu chuộng vì khả năng đưa những ý tưởng “rất Java” vào cách lập trình của mình.

7. CSS



Viết tắt của “Cascading Style Sheets”, CSS là ngôn ngữ dùng cho thiết kế định dạng và layout website. Rất nhiều menu trên website và ứng dụng di động đều được viết bởi CSS kết hợp cùng JavaScript và HTML.

6. C++



Được phát minh ra vào năm 1983 như một lựa chọn thay thế ngôn ngữ C truyền thống, C++ thực sự rất phổ biến với các nhà phát triển trên toàn cầu. Microsoft Windows, Google Chrome hay các phần mềm cho phi cơ chiến đấu đều được viết bằng C++.

5. PHP



PHP đã quá phổ biến trong thiết kế website. Theo một ước tính không chính thức, PHP hiện được sử dụng cho 1/3 số lượng website trên toàn cầu. Các nền tảng lớn như WordPress, Facebook, Yahoo đều được phát triển bằng PHP. Tuy vậy cũng có không ít người ghét PHP, điển hình là nhà sáng lập Stack Exchange Jeff Atwood khi khẳng định “PHP không phải một ngôn ngữ lập trình mà đúng hơn phải là một đống tạp nham các từ khóa và function.”

4. Ruby



Các nhà phát triển yêu thích ngôn ngữ lập trình 24 năm tuổi này bởi độ dễ đọc, dễ viết. Đi kèm với nó là Rails, một framework add-on giúp cho việc xây dựng ứng dụng web trở nên dễ dàng hơn bao giờ hết. Khẩu hiệu của Ruby chính là “người bạn tốt nhất của các lập trình viên.”

3. Python



Với xuất phát điểm từ năm 1989, cũng như Ruby, Python được ưa chuộng bởi tính dễ đọc. Nhiều lập trình viên còn cho rằng đây là ngôn ngữ dễ học nhất bên cạnh Ruby.

2. Java



Được Oracle phát minh ra vào năm 1991, Java nay đã trở thành ngôn ngữ lập trình phổ biến nhất thế giới. Java chính là phần thiết yếu trong phát triển ứng dụng Android, phần mềm doanh nghiệp hay TV thông minh.

1. JavaScript



Ngôn ngữ lập trình siêu phổ biến này thường được dùng vào thiết kế ứng dụng web. Tuy tên giống nhau nhưng JavaScript không liên quan gì nhiều đến Java. JavaScript chạy trên web hiện đại nhưng đôi khi nó cũng là thủ phạm làm chậm tốc độ trình duyệt hay đẩy người dùng vào nhiều lỗ hổng bảo mật hơn.

Mặc dù danh sách đã ngã ngũ nhưng các ngôn ngữ trên lại đang có tốc độ phát triển khác nhau. GitHub cho biết “JavaScript, C# và Go đã chứng kiến mức tăng trưởng cao gấp đôi. Trong khi đó, Swift và TypeScript cũng đang bứt phá với mức phổ biến tăng gấp 3,5 lần."', N'duong', CAST(N'2022-05-26T00:00:00.000' AS DateTime), N'abc@gmail.com', NULL)
INSERT [dbo].[Post] ([id], [cid], [post_title], [biref], [details], [author], [update_date], [contact], [thumbnail]) VALUES (2, 1, N'Top 15 ngôn ngữ lập trình phổ biến nhất thế giới, bạn đã biết hết chưa?', N'Những ngôn ngữ phổ biến hiện nay là', N'Kỹ sư phần mềm đang là một trong những nghề nhu cầu cao nhất hiện nay – ngay cả thực tập sinh tại các công ty công nghệ cũng có thể nhận một mức lương đáng ghen tị.

Giữa hàng triệu nhà phát triển với đủ mọi loại kỹ năng khác nhau, nhiều công ty công nghệ đang bắt đầu quay sang GitHub - startup 2 tỷ USD được mệnh danh là “Facebook của giới lập trình viên” - để tìm kiếm các nhân tài code.

Nếu bạn là một lập trình viên đang tìm kiếm cơ hội việc làm trong các công ty này thì hãy nghía xem danh sách các ngôn ngữ lập trình hot nhất trên GitHub dưới đây (Danh sách dựa trên thống kê thực của GitHub) để xem những ngôn ngữ nào đang được săn đón nhiều nhất nhé.

15. TypeScript



Là một nhánh của JavaScript, TypeScript là ngôn ngữ lập trình do Microsoft phát triển. Xuất hiện từ năm 2012, TypeScript đã được nhiều lập trình viên yêu thích bởi khả năng xây dựng các ứng dụng lớn trên nền web hiện đại.

14. Swift



Ngôn ngữ lập trình cho iPhone do Apple phát triển này mới chỉ khởi nguồn từ năm 2014 nhưng đã thu hút một lượng lớn các nhà phát triển. Lyft - đối thủ của Uber tại Mỹ - cũng vừa mới viết lại toàn bộ ứng dụng iPhone của mình bằng Swift và đang chứng kiến những tiến bộ đáng kể về hiệu năng và trải nghiệm.

13. Scala



Bắt đầu lên sóng từ năm 2001, Scala được phát triển nhằm giúp các lập trình viên code nhanh và dễ dàng hơn so với khi viết bằng Java. Các công ty như Airbnb và Apple cũng từng sử dụng Scala cho các ứng dụng của mình.

12. Objective-C



Ngôn ngữ lập trình C thuở đầu đã có ảnh hưởng sâu rộng đến mức tạo đà cho hàng loạt ngôn ngữ lập trình tiền nhiệm cùng tên ra đời. Lấy cảm hứng từ C nhưng những ngôn ngữ này còn được lồng thêm nhiều tính năng từ các ngôn ngữ khác. Objective-C có thể được dùng vào thiết kế ứng dụng iOS, vẫn phổ biến hơn Swift dù Swift cũng đang tăng trưởng rất nhanh.

11. Shell



Là một cái tên có vẻ khá lạ lùng so với số còn lại trong danh sách, Shell không hẳn là một ngôn ngữ lập trình mà là một chương trình phổ biến hay một chuỗi các hoạt động lặp lại trong hệ điều hành. Các chuyên viên IT trong công ty bạn có thể sẽ dùng những đoạn script Shell để tự động hóa việc cập nhật các chương trình của công ty.

10. Go



Google phát triển Go để giúp các nhà phát triển của mình xây dựng các hệ thống cho lượng người dùng cực lớn. Go cũng được rất nhiều lập trình viên yêu thích vì tính dễ đọc và dễ nhân rộng.

9. C



Ngôn ngữ kinh điển này được sáng chế ra vào năm 1972 và vẫn thịnh hành cho đến ngày nay, không chỉ bởi khả năng hoạt động trên tất cả các nền tảng điện toán mà còn bởi tính ổn định và dễ hiểu với hầu hết các lập trình viên từ khắp nơi trên thế giới.

8. C#



C# được đọc là “C-sharp”, tương tự như một nốt trong âm nhạc. C# được Microsoft phát triển và cũng là một biến thể của ngôn ngữ C. C# được yêu chuộng vì khả năng đưa những ý tưởng “rất Java” vào cách lập trình của mình.

7. CSS



Viết tắt của “Cascading Style Sheets”, CSS là ngôn ngữ dùng cho thiết kế định dạng và layout website. Rất nhiều menu trên website và ứng dụng di động đều được viết bởi CSS kết hợp cùng JavaScript và HTML.

6. C++



Được phát minh ra vào năm 1983 như một lựa chọn thay thế ngôn ngữ C truyền thống, C++ thực sự rất phổ biến với các nhà phát triển trên toàn cầu. Microsoft Windows, Google Chrome hay các phần mềm cho phi cơ chiến đấu đều được viết bằng C++.

5. PHP



PHP đã quá phổ biến trong thiết kế website. Theo một ước tính không chính thức, PHP hiện được sử dụng cho 1/3 số lượng website trên toàn cầu. Các nền tảng lớn như WordPress, Facebook, Yahoo đều được phát triển bằng PHP. Tuy vậy cũng có không ít người ghét PHP, điển hình là nhà sáng lập Stack Exchange Jeff Atwood khi khẳng định “PHP không phải một ngôn ngữ lập trình mà đúng hơn phải là một đống tạp nham các từ khóa và function.”

4. Ruby



Các nhà phát triển yêu thích ngôn ngữ lập trình 24 năm tuổi này bởi độ dễ đọc, dễ viết. Đi kèm với nó là Rails, một framework add-on giúp cho việc xây dựng ứng dụng web trở nên dễ dàng hơn bao giờ hết. Khẩu hiệu của Ruby chính là “người bạn tốt nhất của các lập trình viên.”

3. Python



Với xuất phát điểm từ năm 1989, cũng như Ruby, Python được ưa chuộng bởi tính dễ đọc. Nhiều lập trình viên còn cho rằng đây là ngôn ngữ dễ học nhất bên cạnh Ruby.

2. Java



Được Oracle phát minh ra vào năm 1991, Java nay đã trở thành ngôn ngữ lập trình phổ biến nhất thế giới. Java chính là phần thiết yếu trong phát triển ứng dụng Android, phần mềm doanh nghiệp hay TV thông minh.

1. JavaScript



Ngôn ngữ lập trình siêu phổ biến này thường được dùng vào thiết kế ứng dụng web. Tuy tên giống nhau nhưng JavaScript không liên quan gì nhiều đến Java. JavaScript chạy trên web hiện đại nhưng đôi khi nó cũng là thủ phạm làm chậm tốc độ trình duyệt hay đẩy người dùng vào nhiều lỗ hổng bảo mật hơn.

Mặc dù danh sách đã ngã ngũ nhưng các ngôn ngữ trên lại đang có tốc độ phát triển khác nhau. GitHub cho biết “JavaScript, C# và Go đã chứng kiến mức tăng trưởng cao gấp đôi. Trong khi đó, Swift và TypeScript cũng đang bứt phá với mức phổ biến tăng gấp 3,5 lần."', N'duong', CAST(N'2022-05-26T00:00:00.000' AS DateTime), N'abc@gmail.com', NULL)
INSERT [dbo].[Post] ([id], [cid], [post_title], [biref], [details], [author], [update_date], [contact], [thumbnail]) VALUES (3, 1, N'Top 15 ngôn ngữ lập trình phổ biến nhất thế giới, bạn đã biết hết chưa?', N'Những ngôn ngữ phổ biến hiện nay là', N'Kỹ sư phần mềm đang là một trong những nghề nhu cầu cao nhất hiện nay – ngay cả thực tập sinh tại các công ty công nghệ cũng có thể nhận một mức lương đáng ghen tị.

Giữa hàng triệu nhà phát triển với đủ mọi loại kỹ năng khác nhau, nhiều công ty công nghệ đang bắt đầu quay sang GitHub - startup 2 tỷ USD được mệnh danh là “Facebook của giới lập trình viên” - để tìm kiếm các nhân tài code.

Nếu bạn là một lập trình viên đang tìm kiếm cơ hội việc làm trong các công ty này thì hãy nghía xem danh sách các ngôn ngữ lập trình hot nhất trên GitHub dưới đây (Danh sách dựa trên thống kê thực của GitHub) để xem những ngôn ngữ nào đang được săn đón nhiều nhất nhé.

15. TypeScript



Là một nhánh của JavaScript, TypeScript là ngôn ngữ lập trình do Microsoft phát triển. Xuất hiện từ năm 2012, TypeScript đã được nhiều lập trình viên yêu thích bởi khả năng xây dựng các ứng dụng lớn trên nền web hiện đại.

14. Swift



Ngôn ngữ lập trình cho iPhone do Apple phát triển này mới chỉ khởi nguồn từ năm 2014 nhưng đã thu hút một lượng lớn các nhà phát triển. Lyft - đối thủ của Uber tại Mỹ - cũng vừa mới viết lại toàn bộ ứng dụng iPhone của mình bằng Swift và đang chứng kiến những tiến bộ đáng kể về hiệu năng và trải nghiệm.

13. Scala



Bắt đầu lên sóng từ năm 2001, Scala được phát triển nhằm giúp các lập trình viên code nhanh và dễ dàng hơn so với khi viết bằng Java. Các công ty như Airbnb và Apple cũng từng sử dụng Scala cho các ứng dụng của mình.

12. Objective-C



Ngôn ngữ lập trình C thuở đầu đã có ảnh hưởng sâu rộng đến mức tạo đà cho hàng loạt ngôn ngữ lập trình tiền nhiệm cùng tên ra đời. Lấy cảm hứng từ C nhưng những ngôn ngữ này còn được lồng thêm nhiều tính năng từ các ngôn ngữ khác. Objective-C có thể được dùng vào thiết kế ứng dụng iOS, vẫn phổ biến hơn Swift dù Swift cũng đang tăng trưởng rất nhanh.

11. Shell



Là một cái tên có vẻ khá lạ lùng so với số còn lại trong danh sách, Shell không hẳn là một ngôn ngữ lập trình mà là một chương trình phổ biến hay một chuỗi các hoạt động lặp lại trong hệ điều hành. Các chuyên viên IT trong công ty bạn có thể sẽ dùng những đoạn script Shell để tự động hóa việc cập nhật các chương trình của công ty.

10. Go



Google phát triển Go để giúp các nhà phát triển của mình xây dựng các hệ thống cho lượng người dùng cực lớn. Go cũng được rất nhiều lập trình viên yêu thích vì tính dễ đọc và dễ nhân rộng.

9. C



Ngôn ngữ kinh điển này được sáng chế ra vào năm 1972 và vẫn thịnh hành cho đến ngày nay, không chỉ bởi khả năng hoạt động trên tất cả các nền tảng điện toán mà còn bởi tính ổn định và dễ hiểu với hầu hết các lập trình viên từ khắp nơi trên thế giới.

8. C#



C# được đọc là “C-sharp”, tương tự như một nốt trong âm nhạc. C# được Microsoft phát triển và cũng là một biến thể của ngôn ngữ C. C# được yêu chuộng vì khả năng đưa những ý tưởng “rất Java” vào cách lập trình của mình.

7. CSS



Viết tắt của “Cascading Style Sheets”, CSS là ngôn ngữ dùng cho thiết kế định dạng và layout website. Rất nhiều menu trên website và ứng dụng di động đều được viết bởi CSS kết hợp cùng JavaScript và HTML.

6. C++



Được phát minh ra vào năm 1983 như một lựa chọn thay thế ngôn ngữ C truyền thống, C++ thực sự rất phổ biến với các nhà phát triển trên toàn cầu. Microsoft Windows, Google Chrome hay các phần mềm cho phi cơ chiến đấu đều được viết bằng C++.

5. PHP



PHP đã quá phổ biến trong thiết kế website. Theo một ước tính không chính thức, PHP hiện được sử dụng cho 1/3 số lượng website trên toàn cầu. Các nền tảng lớn như WordPress, Facebook, Yahoo đều được phát triển bằng PHP. Tuy vậy cũng có không ít người ghét PHP, điển hình là nhà sáng lập Stack Exchange Jeff Atwood khi khẳng định “PHP không phải một ngôn ngữ lập trình mà đúng hơn phải là một đống tạp nham các từ khóa và function.”

4. Ruby



Các nhà phát triển yêu thích ngôn ngữ lập trình 24 năm tuổi này bởi độ dễ đọc, dễ viết. Đi kèm với nó là Rails, một framework add-on giúp cho việc xây dựng ứng dụng web trở nên dễ dàng hơn bao giờ hết. Khẩu hiệu của Ruby chính là “người bạn tốt nhất của các lập trình viên.”

3. Python



Với xuất phát điểm từ năm 1989, cũng như Ruby, Python được ưa chuộng bởi tính dễ đọc. Nhiều lập trình viên còn cho rằng đây là ngôn ngữ dễ học nhất bên cạnh Ruby.

2. Java



Được Oracle phát minh ra vào năm 1991, Java nay đã trở thành ngôn ngữ lập trình phổ biến nhất thế giới. Java chính là phần thiết yếu trong phát triển ứng dụng Android, phần mềm doanh nghiệp hay TV thông minh.

1. JavaScript



Ngôn ngữ lập trình siêu phổ biến này thường được dùng vào thiết kế ứng dụng web. Tuy tên giống nhau nhưng JavaScript không liên quan gì nhiều đến Java. JavaScript chạy trên web hiện đại nhưng đôi khi nó cũng là thủ phạm làm chậm tốc độ trình duyệt hay đẩy người dùng vào nhiều lỗ hổng bảo mật hơn.

Mặc dù danh sách đã ngã ngũ nhưng các ngôn ngữ trên lại đang có tốc độ phát triển khác nhau. GitHub cho biết “JavaScript, C# và Go đã chứng kiến mức tăng trưởng cao gấp đôi. Trong khi đó, Swift và TypeScript cũng đang bứt phá với mức phổ biến tăng gấp 3,5 lần."', N'duong', CAST(N'2022-05-26T00:00:00.000' AS DateTime), N'abc@gmail.com', NULL)
INSERT [dbo].[Post] ([id], [cid], [post_title], [biref], [details], [author], [update_date], [contact], [thumbnail]) VALUES (4, 1, N'Top 15 ngôn ngữ lập trình phổ biến nhất thế giới, bạn đã biết hết chưa?', N'Những ngôn ngữ phổ biến hiện nay là', N'Kỹ sư phần mềm đang là một trong những nghề nhu cầu cao nhất hiện nay – ngay cả thực tập sinh tại các công ty công nghệ cũng có thể nhận một mức lương đáng ghen tị.

Giữa hàng triệu nhà phát triển với đủ mọi loại kỹ năng khác nhau, nhiều công ty công nghệ đang bắt đầu quay sang GitHub - startup 2 tỷ USD được mệnh danh là “Facebook của giới lập trình viên” - để tìm kiếm các nhân tài code.

Nếu bạn là một lập trình viên đang tìm kiếm cơ hội việc làm trong các công ty này thì hãy nghía xem danh sách các ngôn ngữ lập trình hot nhất trên GitHub dưới đây (Danh sách dựa trên thống kê thực của GitHub) để xem những ngôn ngữ nào đang được săn đón nhiều nhất nhé.

15. TypeScript



Là một nhánh của JavaScript, TypeScript là ngôn ngữ lập trình do Microsoft phát triển. Xuất hiện từ năm 2012, TypeScript đã được nhiều lập trình viên yêu thích bởi khả năng xây dựng các ứng dụng lớn trên nền web hiện đại.

14. Swift



Ngôn ngữ lập trình cho iPhone do Apple phát triển này mới chỉ khởi nguồn từ năm 2014 nhưng đã thu hút một lượng lớn các nhà phát triển. Lyft - đối thủ của Uber tại Mỹ - cũng vừa mới viết lại toàn bộ ứng dụng iPhone của mình bằng Swift và đang chứng kiến những tiến bộ đáng kể về hiệu năng và trải nghiệm.

13. Scala



Bắt đầu lên sóng từ năm 2001, Scala được phát triển nhằm giúp các lập trình viên code nhanh và dễ dàng hơn so với khi viết bằng Java. Các công ty như Airbnb và Apple cũng từng sử dụng Scala cho các ứng dụng của mình.

12. Objective-C



Ngôn ngữ lập trình C thuở đầu đã có ảnh hưởng sâu rộng đến mức tạo đà cho hàng loạt ngôn ngữ lập trình tiền nhiệm cùng tên ra đời. Lấy cảm hứng từ C nhưng những ngôn ngữ này còn được lồng thêm nhiều tính năng từ các ngôn ngữ khác. Objective-C có thể được dùng vào thiết kế ứng dụng iOS, vẫn phổ biến hơn Swift dù Swift cũng đang tăng trưởng rất nhanh.

11. Shell



Là một cái tên có vẻ khá lạ lùng so với số còn lại trong danh sách, Shell không hẳn là một ngôn ngữ lập trình mà là một chương trình phổ biến hay một chuỗi các hoạt động lặp lại trong hệ điều hành. Các chuyên viên IT trong công ty bạn có thể sẽ dùng những đoạn script Shell để tự động hóa việc cập nhật các chương trình của công ty.

10. Go



Google phát triển Go để giúp các nhà phát triển của mình xây dựng các hệ thống cho lượng người dùng cực lớn. Go cũng được rất nhiều lập trình viên yêu thích vì tính dễ đọc và dễ nhân rộng.

9. C



Ngôn ngữ kinh điển này được sáng chế ra vào năm 1972 và vẫn thịnh hành cho đến ngày nay, không chỉ bởi khả năng hoạt động trên tất cả các nền tảng điện toán mà còn bởi tính ổn định và dễ hiểu với hầu hết các lập trình viên từ khắp nơi trên thế giới.

8. C#



C# được đọc là “C-sharp”, tương tự như một nốt trong âm nhạc. C# được Microsoft phát triển và cũng là một biến thể của ngôn ngữ C. C# được yêu chuộng vì khả năng đưa những ý tưởng “rất Java” vào cách lập trình của mình.

7. CSS



Viết tắt của “Cascading Style Sheets”, CSS là ngôn ngữ dùng cho thiết kế định dạng và layout website. Rất nhiều menu trên website và ứng dụng di động đều được viết bởi CSS kết hợp cùng JavaScript và HTML.

6. C++



Được phát minh ra vào năm 1983 như một lựa chọn thay thế ngôn ngữ C truyền thống, C++ thực sự rất phổ biến với các nhà phát triển trên toàn cầu. Microsoft Windows, Google Chrome hay các phần mềm cho phi cơ chiến đấu đều được viết bằng C++.

5. PHP



PHP đã quá phổ biến trong thiết kế website. Theo một ước tính không chính thức, PHP hiện được sử dụng cho 1/3 số lượng website trên toàn cầu. Các nền tảng lớn như WordPress, Facebook, Yahoo đều được phát triển bằng PHP. Tuy vậy cũng có không ít người ghét PHP, điển hình là nhà sáng lập Stack Exchange Jeff Atwood khi khẳng định “PHP không phải một ngôn ngữ lập trình mà đúng hơn phải là một đống tạp nham các từ khóa và function.”

4. Ruby



Các nhà phát triển yêu thích ngôn ngữ lập trình 24 năm tuổi này bởi độ dễ đọc, dễ viết. Đi kèm với nó là Rails, một framework add-on giúp cho việc xây dựng ứng dụng web trở nên dễ dàng hơn bao giờ hết. Khẩu hiệu của Ruby chính là “người bạn tốt nhất của các lập trình viên.”

3. Python



Với xuất phát điểm từ năm 1989, cũng như Ruby, Python được ưa chuộng bởi tính dễ đọc. Nhiều lập trình viên còn cho rằng đây là ngôn ngữ dễ học nhất bên cạnh Ruby.

2. Java



Được Oracle phát minh ra vào năm 1991, Java nay đã trở thành ngôn ngữ lập trình phổ biến nhất thế giới. Java chính là phần thiết yếu trong phát triển ứng dụng Android, phần mềm doanh nghiệp hay TV thông minh.

1. JavaScript



Ngôn ngữ lập trình siêu phổ biến này thường được dùng vào thiết kế ứng dụng web. Tuy tên giống nhau nhưng JavaScript không liên quan gì nhiều đến Java. JavaScript chạy trên web hiện đại nhưng đôi khi nó cũng là thủ phạm làm chậm tốc độ trình duyệt hay đẩy người dùng vào nhiều lỗ hổng bảo mật hơn.

Mặc dù danh sách đã ngã ngũ nhưng các ngôn ngữ trên lại đang có tốc độ phát triển khác nhau. GitHub cho biết “JavaScript, C# và Go đã chứng kiến mức tăng trưởng cao gấp đôi. Trong khi đó, Swift và TypeScript cũng đang bứt phá với mức phổ biến tăng gấp 3,5 lần."', N'duong', CAST(N'2022-05-26T00:00:00.000' AS DateTime), N'abc@gmail.com', NULL)
INSERT [dbo].[Post] ([id], [cid], [post_title], [biref], [details], [author], [update_date], [contact], [thumbnail]) VALUES (5, 1, N'Top 15 ngôn ngữ lập trình phổ biến nhất thế giới, bạn đã biết hết chưa?', N'Những ngôn ngữ phổ biến hiện nay là', N'Kỹ sư phần mềm đang là một trong những nghề nhu cầu cao nhất hiện nay – ngay cả thực tập sinh tại các công ty công nghệ cũng có thể nhận một mức lương đáng ghen tị.

Giữa hàng triệu nhà phát triển với đủ mọi loại kỹ năng khác nhau, nhiều công ty công nghệ đang bắt đầu quay sang GitHub - startup 2 tỷ USD được mệnh danh là “Facebook của giới lập trình viên” - để tìm kiếm các nhân tài code.

Nếu bạn là một lập trình viên đang tìm kiếm cơ hội việc làm trong các công ty này thì hãy nghía xem danh sách các ngôn ngữ lập trình hot nhất trên GitHub dưới đây (Danh sách dựa trên thống kê thực của GitHub) để xem những ngôn ngữ nào đang được săn đón nhiều nhất nhé.

15. TypeScript



Là một nhánh của JavaScript, TypeScript là ngôn ngữ lập trình do Microsoft phát triển. Xuất hiện từ năm 2012, TypeScript đã được nhiều lập trình viên yêu thích bởi khả năng xây dựng các ứng dụng lớn trên nền web hiện đại.

14. Swift



Ngôn ngữ lập trình cho iPhone do Apple phát triển này mới chỉ khởi nguồn từ năm 2014 nhưng đã thu hút một lượng lớn các nhà phát triển. Lyft - đối thủ của Uber tại Mỹ - cũng vừa mới viết lại toàn bộ ứng dụng iPhone của mình bằng Swift và đang chứng kiến những tiến bộ đáng kể về hiệu năng và trải nghiệm.

13. Scala



Bắt đầu lên sóng từ năm 2001, Scala được phát triển nhằm giúp các lập trình viên code nhanh và dễ dàng hơn so với khi viết bằng Java. Các công ty như Airbnb và Apple cũng từng sử dụng Scala cho các ứng dụng của mình.

12. Objective-C



Ngôn ngữ lập trình C thuở đầu đã có ảnh hưởng sâu rộng đến mức tạo đà cho hàng loạt ngôn ngữ lập trình tiền nhiệm cùng tên ra đời. Lấy cảm hứng từ C nhưng những ngôn ngữ này còn được lồng thêm nhiều tính năng từ các ngôn ngữ khác. Objective-C có thể được dùng vào thiết kế ứng dụng iOS, vẫn phổ biến hơn Swift dù Swift cũng đang tăng trưởng rất nhanh.

11. Shell



Là một cái tên có vẻ khá lạ lùng so với số còn lại trong danh sách, Shell không hẳn là một ngôn ngữ lập trình mà là một chương trình phổ biến hay một chuỗi các hoạt động lặp lại trong hệ điều hành. Các chuyên viên IT trong công ty bạn có thể sẽ dùng những đoạn script Shell để tự động hóa việc cập nhật các chương trình của công ty.

10. Go



Google phát triển Go để giúp các nhà phát triển của mình xây dựng các hệ thống cho lượng người dùng cực lớn. Go cũng được rất nhiều lập trình viên yêu thích vì tính dễ đọc và dễ nhân rộng.

9. C



Ngôn ngữ kinh điển này được sáng chế ra vào năm 1972 và vẫn thịnh hành cho đến ngày nay, không chỉ bởi khả năng hoạt động trên tất cả các nền tảng điện toán mà còn bởi tính ổn định và dễ hiểu với hầu hết các lập trình viên từ khắp nơi trên thế giới.

8. C#



C# được đọc là “C-sharp”, tương tự như một nốt trong âm nhạc. C# được Microsoft phát triển và cũng là một biến thể của ngôn ngữ C. C# được yêu chuộng vì khả năng đưa những ý tưởng “rất Java” vào cách lập trình của mình.

7. CSS



Viết tắt của “Cascading Style Sheets”, CSS là ngôn ngữ dùng cho thiết kế định dạng và layout website. Rất nhiều menu trên website và ứng dụng di động đều được viết bởi CSS kết hợp cùng JavaScript và HTML.

6. C++



Được phát minh ra vào năm 1983 như một lựa chọn thay thế ngôn ngữ C truyền thống, C++ thực sự rất phổ biến với các nhà phát triển trên toàn cầu. Microsoft Windows, Google Chrome hay các phần mềm cho phi cơ chiến đấu đều được viết bằng C++.

5. PHP



PHP đã quá phổ biến trong thiết kế website. Theo một ước tính không chính thức, PHP hiện được sử dụng cho 1/3 số lượng website trên toàn cầu. Các nền tảng lớn như WordPress, Facebook, Yahoo đều được phát triển bằng PHP. Tuy vậy cũng có không ít người ghét PHP, điển hình là nhà sáng lập Stack Exchange Jeff Atwood khi khẳng định “PHP không phải một ngôn ngữ lập trình mà đúng hơn phải là một đống tạp nham các từ khóa và function.”

4. Ruby



Các nhà phát triển yêu thích ngôn ngữ lập trình 24 năm tuổi này bởi độ dễ đọc, dễ viết. Đi kèm với nó là Rails, một framework add-on giúp cho việc xây dựng ứng dụng web trở nên dễ dàng hơn bao giờ hết. Khẩu hiệu của Ruby chính là “người bạn tốt nhất của các lập trình viên.”

3. Python



Với xuất phát điểm từ năm 1989, cũng như Ruby, Python được ưa chuộng bởi tính dễ đọc. Nhiều lập trình viên còn cho rằng đây là ngôn ngữ dễ học nhất bên cạnh Ruby.

2. Java



Được Oracle phát minh ra vào năm 1991, Java nay đã trở thành ngôn ngữ lập trình phổ biến nhất thế giới. Java chính là phần thiết yếu trong phát triển ứng dụng Android, phần mềm doanh nghiệp hay TV thông minh.

1. JavaScript



Ngôn ngữ lập trình siêu phổ biến này thường được dùng vào thiết kế ứng dụng web. Tuy tên giống nhau nhưng JavaScript không liên quan gì nhiều đến Java. JavaScript chạy trên web hiện đại nhưng đôi khi nó cũng là thủ phạm làm chậm tốc độ trình duyệt hay đẩy người dùng vào nhiều lỗ hổng bảo mật hơn.

Mặc dù danh sách đã ngã ngũ nhưng các ngôn ngữ trên lại đang có tốc độ phát triển khác nhau. GitHub cho biết “JavaScript, C# và Go đã chứng kiến mức tăng trưởng cao gấp đôi. Trong khi đó, Swift và TypeScript cũng đang bứt phá với mức phổ biến tăng gấp 3,5 lần."', N'duong', CAST(N'2022-05-26T00:00:00.000' AS DateTime), N'abc@gmail.com', NULL)
INSERT [dbo].[Post] ([id], [cid], [post_title], [biref], [details], [author], [update_date], [contact], [thumbnail]) VALUES (6, 1, N'Ngôn ng?', N'Top các ngôn ng? ph? bi?n', N'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', N'test', CAST(N'2022-05-26T02:43:38.807' AS DateTime), N'abc@gmail.com', N'aaaa')
INSERT [dbo].[Post] ([id], [cid], [post_title], [biref], [details], [author], [update_date], [contact], [thumbnail]) VALUES (7, 1, N'Ngôn ngữ', N'Top các ngôn ngữ phổ biến', N'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', N'test', CAST(N'2022-05-26T02:44:32.903' AS DateTime), N'abc@gmail.com', N'aaaa')
INSERT [dbo].[Post] ([id], [cid], [post_title], [biref], [details], [author], [update_date], [contact], [thumbnail]) VALUES (8, 1, N'Kỹ sư cao cấp Google tiết lộ Ngôn ngữ lập trình tốt nhất năm 2022', N'Học ngôn ngữ lập trình nào?', N'
Lời khuyên của tôi là: “Chẳng riêng một ngôn ngữ nào mới là tốt nhất cả!”', N'Phanhtrinh', CAST(N'2022-02-10T00:00:00.000' AS DateTime), N'Phanhtrinh@gmail.com', NULL)
INSERT [dbo].[Post] ([id], [cid], [post_title], [biref], [details], [author], [update_date], [contact], [thumbnail]) VALUES (9, 3, N'Bạn đã chuẩn bị gì để bắt đầu sự nghiệp của một Freelancer??', N'Học ngôn ngữ lập trình nào?', N'
Lời khuyên của tôi là: “Chẳng riêng một ngôn ngữ nào mới là tốt nhất cả!”', N'Phanhtrinh', CAST(N'2021-02-10T00:00:00.000' AS DateTime), N'Phanhtrinh@gmail.com', NULL)
INSERT [dbo].[Post] ([id], [cid], [post_title], [biref], [details], [author], [update_date], [contact], [thumbnail]) VALUES (10, 2, N'Giải Mã Lời Gọi Hàm std::sort() Trong C++?', N'Học ngôn ngữ lập trình nào?', N'
Lời khuyên của tôi là: “Chẳng riêng một ngôn ngữ nào mới là tốt nhất cả!”', N'Phanhtrinh', CAST(N'2021-02-10T00:00:00.000' AS DateTime), N'Phanhtrinh@gmail.com', NULL)
INSERT [dbo].[Post] ([id], [cid], [post_title], [biref], [details], [author], [update_date], [contact], [thumbnail]) VALUES (11, 4, N'Rì-viu 5 Phút: Các Mẫu Kiến Trúc Phần Mềm Không Thể Bỏ Qua', N'Học ngôn ngữ lập trình nào?', N'
Lời khuyên của tôi là: “Chẳng riêng một ngôn ngữ nào mới là tốt nhất cả!”', N'Phanhtrinh', CAST(N'2022-06-10T00:00:00.000' AS DateTime), N'Phanhtrinh@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
