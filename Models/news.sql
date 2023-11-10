USE master;
GO
drop database news1
go
CREATE DATABASE news1;
GO

USE news1;
GO

CREATE TABLE NguoiDung (
    UserID int NOT NULL PRIMARY KEY IDENTITY(1,1),
    vaitro VARCHAR(10) NOT NULL,
    hovaten NVARCHAR(50) NOT NULL
);

CREATE TABLE tags (
    TagID int NOT NULL PRIMARY KEY,
    Name_Tags NVARCHAR(50)
);

CREATE TABLE images (
    imagesID int NOT NULL PRIMARY KEY,
    Name_file_images NVARCHAR(MAX) NOT NULL,
    Caption_images NVARCHAR(MAX),
    PostID int
);

CREATE TABLE Post (
    PostID INT PRIMARY KEY IDENTITY(1,1),
    Post_Title NVARCHAR(MAX) ,
    Author NVARCHAR(50) ,
    Post_Date SMALLDATETIME ,
    Teaser_Post NVARCHAR(MAX) ,
    Content_Post NVARCHAR(MAX) ,
    Post_Tags int ,
    AnhBia nvarchar(max) ,
    luotthich INT 
);

CREATE TABLE KhachHang (
    KhID int NOT NULL PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    hovaten NVARCHAR(50) NOT NULL
);

CREATE TABLE ADMIN (
    AdminID int PRIMARY KEY ,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    hovaten NVARCHAR(50) NOT NULL
);

CREATE TABLE PostImages (
    PostID INT not NULL,
    ImageID int NOT NULL
);

ALTER TABLE NguoiDung
ADD CONSTRAINT UQ_hovaten UNIQUE (hovaten);



ALTER TABLE Post
ADD CONSTRAINT FK_post_tags FOREIGN KEY (Post_Tags) REFERENCES tags(TagID);
    
ALTER TABLE ADMIN
ADD CONSTRAINT FK_ad_nguoidung FOREIGN KEY (AdminID) REFERENCES NguoiDung(UserID),
    CONSTRAINT FK_ad_nguoidung_hoten FOREIGN KEY (hovaten) REFERENCES NguoiDung(hovaten);

ALTER TABLE images
ADD CONSTRAINT FK_images_post FOREIGN KEY (PostID) REFERENCES Post(PostID);

ALTER TABLE PostImages
ADD CONSTRAINT PK_PostImages PRIMARY KEY (ImageID),
    CONSTRAINT FK_PostImages_Post FOREIGN KEY (PostID) REFERENCES Post(PostID),
    CONSTRAINT FK_PostImages_Images FOREIGN KEY (ImageID) REFERENCES images(imagesID);




INSERT INTO NguoiDung(hovaten, vaitro)
values('Albert AnhDung', 'Admin');

INSERT INTO ADMIN(AdminID,hovaten,password,username)
values(1,'Albert AnhDung','ntd', 'ntd');
INSERT INTO KhachHang(username,password,hovaten)
Values('dung','dung','Nguyen Tien Dung');

select * from NguoiDung
select * from KhachHang
select * from ADMIN






























---------------------------------------------------------------------------------------

INSERT INTO NguoiDung(vaitro,hovaten)
VALUES
    ('Writer', N'Nguyễn Tiến Dũng'),
    ('Admin', N'Lương Nguyễn Khôi'),
    ('User', N'Trần Thị B'),
    ('User', N'Phạm Văn C'),
    ('Admin', N'Nguyễn Duy Dũng'),
    ('User', N'Nguyễn Văn E'),
    ('User', N'Hoàng Thị F'),
    ('Admin', N'Vũ Văn G'),
    ('User', N'Nguyễn Thị H'),
    ('User', N'Hoàng Văn I'),
    ('Admin', N'Lê Thị K'),
	('Writer',N'Thế Duyệt'),
	('Writer',N'Khánh Sơn'),
	('Writer',N'Tuấn Nguyễn'),
	('Writer',N'Bằng Bằng'),
	('Writer',N'Mạnh Kiên'),
	('Writer',N'Nhật Minh');
---------------------------------------------------------------------------------------

INSERT INTO KhachHang(username,password,hovaten)
VALUES
    ('dung','dung','Nguyen Tien Dung'),
    ('user1', 'password1', N'Nguyễn Văn A'),
    ('user2', 'password2', N'Trần Thị B'),
    ('user3', 'password3', N'Phạm Văn C'),
    ('user4', 'password4', N'Lê Thị D'),
    ('user5', 'password5', N'Nguyễn Văn E'),
    ('user6', 'password6', N'Hoàng Thị F'),
    ('user7', 'password7', N'Vũ Văn G'),
    ('user8', 'password8', N'Nguyễn Thị H'),
    ('user9', 'password9', N'Hoàng Văn I'),
    ('user10', 'password10', N'Lê Thị K');

---------------------------------------------------------------------------------------

INSERT INTO ADMIN (AdminID, username, password, hovaten)
VALUES
    (3, 'lnk', 'lnk', N'Lương Nguyễn Khôi'),
    (6, 'ndd', 'ndd', N'Nguyễn Duy Dũng');
    
select * from ADMIN
select * from NguoiDung
---------------------------------------------------------------------------------------

INSERT INTO tags (TagID, Name_Tags)
VALUES
    (1, N'Iphone'),
    (2, N'Nokia'),
    (3, N'Xiaomi'),
    (4, N'Samsung'),
    (5, N'Redmi'),
    (6, N'Vivo'),
	(7, N'Apple'),
	(8, N'Realme'),
	(9, N'OPPO'),
	(10, N'NothingPhone'),
	(11, N'Huawei'),
	(12, N'NVIDIA'),
	(13, N'Asus'),
	(14, N'Acer'),
	(15, N'Microsoft')

---------------------------------------------------------------------------------------

INSERT INTO images (imagesID, Name_file_images, Caption_images,PostID)
VALUES
    (1, 'News1/news1-pic1.png', 'Zack Nelson, chủ kênh YouTube JerryRigEverything đã phải dùng máy cưa cầm tay để cắt ngang bộ khung titan của iPhone 15 Pro',1),
    (2, 'News1/news1-pic2.png', 'Hai lớp màu sắc khác nhau cho thấy sự khác biệt giữa 2 chất liệu kim loại làm nên khung sườn iPhone 15 Pro, lớp bên ngoài là Titan, lớp bên trong là nhôm',1),
    (3, 'News1/news1-pic3.png', 'Lớp Titan bên ngoài không thể là mạ khi có độ dày đến 1mm',1),
    (4, 'News2/news2-pic1.png', 'Một chiếc Iphone vô tri',2),
    (5, 'News2/news2-pic2.png', ' Nhiệt độ của Iphone khi test',2),
    (6, 'News3/news3-pic1.png', 'Xiaomi với 3 màu sắc cực đẹp',3),
    (7, 'News3/news3-pic2.png', 'Hiển thị sắc nét',3),
    (8, 'News4/news4-pic2.png', 'Hệ thống dây chuyền sản xuất và Test sản phẩm',4),
    (9, 'News4/news4-pic3.png', 'Chi Tiết bên trong máy',4),
    (10, 'News5/news5-pic1.png', 'Nhiệt độ của iPhone 15 Pro trong các bài thử nghiệm lúc nào cũng nóng hơn đối thủ.',5),
    (11, 'News5/news5-pic2.png', 'Nhiệt độ đo được sau khoảng thời gian dùng máy',5),
    (12, 'News5/news5-pic3.png', 'Một số mẫu sản phẩm được bày bán',5),
    (13, 'News5/news5-pic4.png', 'Caption for Image 4',5),
    (14, 'News6/news6-pic1.png', 'Giới thiệu sản phẩm mới của Nokia',6),
    (15, 'News6/news6-pic2.png', 'Sản phẩm sẽ sắp ra mắt',6),
    (16, 'News7/news7-pic1.png', 'Chân dung chiếc G22 sắp ra mắt',7),
    (17, 'News7/news7-pic2.png', '"Mổ xẻ" chiếc Nokia G22',7),
    (18, 'News7/news7-pic3.png', 'Chi tiết hệ thống máy của Nokia G22',7),
    (19, 'News8/news8-pic1.png', 'Redmi Pad SE',8),
    (20, 'News8/news8-pic2.png', 'Caption for Image 2',8),
    (21, 'News9/news9-pic1.png', 'Redmi K60 Ultra (hay Ultimate Edition) là mẫu smartphone mới nhất của Xiaomi thuộc dòng K60 series. Dù dòng sản phẩm này đã ra mắt được gần một năm, nhưng phải tới tận bây giờ, một phiên bản cao cấp với phần cứng mạnh mẽ nhất mới được Xiaomi giới thiệu tới người dùng',9),
    (22, 'News9/news9-pic2.png', 'Về cơ bản, dù mang trong mình phần cứng rất mạnh mẽ, nhưng Redmi K60 Ultra vẫn chỉ được định vị ở phân khúc cận cao cấp. Bởi vậy so với các dòng flagship của Xiaomi thì các yếu tố về ngoại hình hay camera đều không "cao cấp" bằng',9),
    (23, 'News9/news9-pic3.png', 'Redmi K60 Ultra có mặt lưng hoàn thiện từ kính bề mặt dạng bóng, khá tương đồng với 2 phiên bản tiêu chuẩn và bản Pro ra mắt hồi đầu năm nay. Mặt lưng này được thiết kế cong ở 2 cạnh bên giúp cảm giác cầm nắm thoải má',9),
    (24, 'News9/news9-pic4.png', 'Cụm camera của Redmi K60 Ultra về cơ bản có cách thiết kế giống 2 phiên bản tiêu chuẩn và Pro, tuy nhiên có kích thước mô-đun lớn hơn. Xiaomi đặt vào đây 3 ống kính: góc rộng 50MP sử dụng cảm biến Sony IMX800, góc siêu rộng 8MP và macro 2MP. Chất lượng camera của các mẫu điện thoại Redmi ở mức ổn, không quá xuất sắc như những dòng flagship Mi vốn có sự tinh chỉnh của Leica',9),
    (25, 'News9/news9-pic5.png', 'Ở mặt trước, Redmi K60 Ultra được trang bị một màn hình AMOLED có kích thước 6,67 inch, sử dụng độ phân giải QHD+, tần số quét 144Hz. Màn hình này có camera selfie 20MP "nốt ruồi" cũng như có cảm biến vân tay quang học phía dưới',9),
    (26, 'News9/news9-pic6.png', 'Xiaomi cho biết Redmi K60 Ultra tích hợp con chip X7 được phát triển bới Pixelworks nhằm hỗ trợ chơi game ở độ phân giải 144Hz với 30 tựa game khác nhau. Bởi vậy trong cài đặt màn hình, phần tần số quét được hiển thị là "lên tới 144Hz"',9),
    (27, 'News9/news9-pic7.png', 'Như đã đề cập, Redmi K60 Ultra là chiếc smartphone thuộc dòng cận cao cấp nên phần khung viền của máy hoàn thiện từ nhựa. Đây là nơi đặt các cổng kết nối, phím bấm vật lý, dải loa, mic thu âm... Máy vẫn được trang bị "mắt thần" hồng ngoại nhưng không có jack tai nghe 3.5mm',9),
    (28, 'News9/news9-pic8.png', '',9),
    (29, 'News9/news9-pic9.png', '',9),
    (30, 'News9/news9-pic10.png', 'Về hiệu năng, Redmi K60 Ultra trang bị con chip Dimensity 9200+ mạnh mẽ nhất tới từ MediaTek. Con chip này cho hiệu năng có thể so sánh ngang với Snapdragon 8 Gen 2',9),
    (31, 'News10/news10-pic1.png', '',10),
    (32, 'News10/news10-pic2.png', '',10),
    (33, 'News11/news11-pic1.png', '',11),
    (34, 'News11/news11-pic2.png', '',11),
    (35, 'News12/news12-pic1.png', '',12),
    (36, 'News12/news12-pic2.png', '',12),
    (37, 'News13/news13-pic1.png', '',13),
	(38, 'News13/news13-pic3.png', '',13),
	(39, 'News13/news13-pic3.png', '',13),
	(40, 'News14/news14-pic1.png', '',14),
	(41, 'News14/news14-pic2.png', '',14),
	(42, 'News14/news14-pic3.png', '',14),
	(43, 'News15/news15-pic1.png', 'DSX1000',15),
	(44, 'News15/news15-pic2.png', 'Đó là tính năng ổn định dịch chuyển cảm biến mà iPhone 15 đang sử dụng để ổn định camera',15),
	(45, 'News15/news15-pic3.png', 'Cận cảnh cảm biến 48MP',15),
	(46, 'News15/news15-pic4.png', 'Ảnh phóng to 1640x cho thấy mỗi ô vuông nhỏ chứa 2x2 photosite, hay còn gọi là một cụm quad-pixel',15),
	(47, 'News15/news15-pic5.png', 'Các photoshite bị mờ bởi một lớp bộ lọc màu và microlens. Bức ảnh này được chụp độ phóng đại 7000x!',15),
	(48, 'News15/news15-pic6.png', 'Cảm biến của iPhone 15 Pro (trái) so với iPhone 15',15),
	(49, 'News15/news15-pic7.png', 'Nam châm điện bên trong Taptic Engine',15),
	(50, 'News15/news15-pic8.png', 'Lớp keo dán mặt sau máy',15),
	(51, 'News16/news16-pic1.png', 'Hình ảnh iPhone 15 Pro Max bị vỡ kính, hư 2 camera sau khi thả rơi từ độ cao 1,8m',16),
	(52, 'News17/news17-pic1.png', '',17),
	(53, 'News18/news18-pic1.png', 'Thông báo Apple Pay bị lỗi sau khi sạc không dây trên xe BMW',18),
	(54, 'News19/news19-pic1.png', 'iOS 17.0.3 chính thức được Apple tung ra ngày hôm nay',18),
	(55, 'News19/news19-pic2.png', 'Nguồn: 9to5Mac',19),
	(56, 'News19/news19-pic3.png', 'Hơi bất ngờ là điểm số lại thấp hơn hẳn so với iOS 17.0.2, Apple đã bóp hiệu năng chăng?',19),
	(57, 'News19/news19-pic4.png', 'Sau khi trở về nhiệt độ ổn định, máy đã cho kết quả đáng ngạc nhiên',19),
	(58, 'News19/news19-pic5.png', 'Kể từ khi ra mắt, iPhone 15 Pro/Pro Max vướng phải nhiều tranh cãi, 
	từ câu chuyện mạ viền titanium, lượng titanium không đủ nhiều như quảng cáo, hay như giờ đây 
	là hiện tượng quá nhiệt. Tất cả những vấn đề này hiện đã và đang được giải thích và xử lý triệt 
	để giúp cho người dùng an tâm hơn trong quá trình sử dụng',19),
	(59, 'News20/news20-pic1.png', 'Điện thoại có sạc nhanh hơn khi ở chế độ Tiết kiệm pin không? (Ảnh minh họa)',20),
	(60, 'News21/news21-pic1.png', '',21),
	(61, 'News21/news21-pic2.png', '',21),
	(62, 'News21/news21-pic3.png', '',21),
	(63, 'News22/news22-pic1.png', '',22),
	(64, 'News22/news22-pic2.png', 'CEO Tim Cook của Apple đến làm chứng trong vụ kiện chống độc quyền của Google',22),
	(65, 'News22/news22-pic3.png', '',22),
	(66, 'News22/news22-pic4.png', '',22),
	(67, 'News23/news23-pic1.png', 'Apple sử dụng robot Daisy để tháo linh kiện iPhone',23),
	(68, 'News23/news23-pic2.png', 'Apple Watch là sản phẩm trung hòa carbon',23),
	(69, 'News24/news24-pic1.png', '',24),
	(70, 'News24/news24-pic2.png', '',24),
	(71, 'News24/news24-pic3.png', '',24),
	(72, 'News24/news24-pic4.png', '',24),
	(73, 'News24/news24-pic5.png', '',24),
	(74, 'News24/news24-pic6.png', '',24),
	(75, 'News24/news24-pic7.png', '',24),
	(76, 'News24/news24-pic8.png', '',24),
	(77, 'News24/news24-pic9.png', '',24),
	(78, 'News25/news25-pic1.png', '',25),
	(79, 'News25/news25-pic2.png', '',25),
	(80, 'News25/news25-pic3.png', '',25),
	(81, 'News25/news25-pic4.png', '',25),
	(82, 'News25/news25-pic5.png', '',25);

---------------------------------------------------------------------------------------

INSERT INTO PostImages (PostID, ImageID)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 4),
    (2, 5),
    (3, 6),
    (3, 7),
    (4, 8),
    (4, 9),
    (5, 10),
    (5, 11),
    (5, 12),
    (5, 13),
    (6, 14),
    (6, 15),
    (7, 16),
    (7, 17),
    (7, 18),
    (8, 19),
    (8, 20),
    (9, 21),
    (9, 22),
    (9, 23),
    (9, 24),
    (9, 25),
    (9, 26),
    (9, 27),
    (9, 28),
    (9, 29),
    (9, 30),
    (10, 31),
    (10, 32),
    (11, 33),
    (11, 34),
    (12, 35),
    (12, 36),
    (13, 37),
	(13, 38),
	(13, 39),
	(14, 40),
	(14, 41),
	(14, 42),
	(15, 43),
	(15, 44),
	(15, 45),
	(15, 46),
	(15, 47),
	(15, 48),
	(15, 49),
	(15, 50),
	(16, 51),
	(17, 52),
	(18, 53),
	(19, 54),
	(19, 55),
	(19, 56),
	(19, 57),
	(19, 58),
	(20, 59),
	(21, 60),
	(21, 61),
	(21, 62),
	(22, 63),
	(22, 64),
	(22, 65),
	(22, 66),
	(23, 67),
	(23, 68),
	(24, 69),
	(24, 70),
	(24, 71),
	(24, 72),
	(24, 73),
	(24, 74),
	(24, 75),
	(24, 76),
	(24, 77),
	(25, 78),
	(25, 79),
	(25, 80),
	(25, 81),
	(25, 82);
---------------------------------------------------------------------------------------


select * from NguoiDung
select * from KhachHang



select max(luotthich) from Post 
---------------------------------------------------------------------------------------


INSERT INTO Post (Post_Title, Author, Post_Date, Teaser_Post, Content_Post, Post_Tags, AnhBia,luotthich)
VALUES (
    N'Không có chuyện bộ khung iPhone 15 Pro "mạ titan"',
    N'Nguyễn Hải',
    '2023-09-28',
    N'Dù khó có thể phân biệt được bằng mắt thường, nhưng clip bóc tách iPhone 15 Pro của một YouTuber giúp người dùng thấy ấn tượng thế nào về độ dày của lớp Titan trong iPhone 15 Pro.',
    N'Một trong các vấn đề gây tranh cãi nhất đối với người dùng Việt kể từ khi iPhone 15 Pro và Pro Max ra mắt lại là bộ khung titan của bộ đôi smartphone mới này. Trong sự kiện, Apple khẳng định các iPhone 15 cao cấp là những iPhone đầu tiên được trang bị bộ khung làm bằng hợp kim Titan Hạng 5 (chính xác hơn là hợp kim Ti-6Al-4V), tương tự như loại vật liệu được sử dụng trong chế tạo máy bay Boeing hay ngành hàng không vũ trụ.

Tuy nhiên, nhiều người cho rằng thực chất bộ khung này chỉ làm bằng kim loại thông thường và được mạ một lớp Titan bên ngoài. Quả thật nếu nhìn bằng mắt thường cùng với lớp màu bao phủ ngoài thân máy, thật khó phân biệt được 2 loại vật liệu này với nhau. Nhưng mới đây, kênh YouTube JerryRigEverything đã có màn mổ xẻ chiếc iPhone 15 Pro Max vừa ra mắt, để người dùng có cái nhìn rõ ràng hơn về loại vật liệu làm nên bộ khung của thiết bị này.

Trong khi phải rất vất vả mới có thể tháo rời toàn bộ mọi linh kiện trong chiếc iPhone 15 Pro Max mới này, nhưng để biết được có thật sự Apple sử dụng hợp kim titan cho thiết bị này hay không, YouTuber nổi tiếng này quyết định cắt ngang bộ khung kim loại của nó để có được cái nhìn rõ ràng hơn các thành phần làm nên bộ khung của iPhone 15 Pro Max.

Một chi tiết đáng chú ý của quá trình này là JerryRigEverything đã phải dùng đến một máy cưa cầm tay để cắt xuyên ngang bộ khung kim loại này thay vì dùng các dụng cụ thông thường. Trong phần giới thiệu về bộ khung Titan này, Apple cho biết nó được tạo nên bằng phương pháp khuếch tán chất rắn để kết hợp giữa lớp vỏ hợp kim Titan bên ngoài với lớp nhôm bên trong, giúp tăng cường sức mạnh của kết cấu đồng thời làm giảm trọng lượng.

Quả thật, trong clip của JerryRigEverything, sau khi cắt ngang bộ khung iPhone 15 Pro mọi người có thể nhận thấy 2 lớp kim loại được nén chặt với nhau dựa trên sự khác biệt về màu sắc, với lớp nhôm trắng bạc ở bên trong và lớp hợp kim Titan có màu sẫm hơn ở bên ngoài. Độ dày của lớp Titan đo được khoảng 1mm.

Như có thể thấy trong clip của JerryRigEverything, kết cấu của lớp Titan bọc bên ngoài và độ dày của nó cho thấy gần như chắc chắn đây không thể là lớp kim loại mạ. Nếu chỉ là một lớp Titan mạ bên ngoài, thông thường độ dày sẽ chỉ khoảng 100 micromet đổ lại (bằng 0,1 mm) mà thôi. Với độ dày đến 1mm như trong clip của JerryRigEverything, các nhà sản xuất sẽ phải dùng đến cả tấm kim loại chứ không thể mạ như đồn đại.

Hơn thế nữa, một chi tiết khác trong clip kể trên lớp Titan này chỉ bao phủ quanh bộ khung sườn iPhone, còn mặt lưng vẫn chỉ là vỏ nhôm kim loại thông thường. Theo lời giải thích của Apple, điều này sẽ giúp tản nhiệt tốt hơn cũng như giúp mặt lưng kính dễ thay thế hơn. Bộ khung sườn là nơi bảo vệ các linh kiện bên trong iPhone do vậy, nó cần được gia cố tốt hơn để tránh hư hỏng trong các tình huống va chạm mạnh hoặc thả rơi.

Đó cũng là lý do vì sao Apple sử dụng phương pháp khuếch tán chất rắn để gắn chặt bộ khung Titan vào sườn dòng iPhone 15 Pro và Pro Max trong khi không trang bị lớp vỏ Titan này cho mặt lưng thiết bị.',
    1,
    'News1/news1-pic1.png',
	200
);


---------------------------------------------------------------------------------------
INSERT INTO Post (Post_Title, Author, Post_Date, Teaser_Post, Content_Post, Post_Tags, AnhBia,luotthich)
VALUES (
    
    N'iPhone 15 bị lỗi quá nhiệt trên diện rộng, chuyên gia nói ‘không thể khắc phục được’ trừ khi Apple chịu làm 1 điều',
    N'Đức Nam',
    '2023-09-28',
    N'Apple chưa bao giờ hết rắc rối với những chiếc iPhone mới ra mắt.',
    N'Ngày càng có nhiều những bài đăng trên mạng phàn nàn về tình trạng quá nhiệt trên iPhone 15 và có vẻ như hiện tượng này xảy ra với tất cả model.

“Chiếc iPhone 15 Pro Max của tôi gần như bị quá nóng để có thể chạm vào khi sạc. Ban đầu tôi tưởng mọi người nói quá nhưng không, nó thực sự không tốt chút nào. Khi mức sạc vượt 70%, chiếc máy có vẻ bớt nóng (vẫn nóng nhưng có thể cầm trên tay được). Ở giai đoạn 25-60% là tệ nhất”, người dùng có nickname Zelbo nói.

Một số người khác cho hay họ gặp tình trạng này ngay cả khi không sạc mà chỉ dùng các tác vụ thông thường như lướt mạng xã hội.

Cần lưu ý rằng hiện tượng iPhone bị nóng trong vòng 24h đầu khi kích hoạt không hiếm, đặc biệt là khi người dùng thực hiện việc cài đặt ban đầu cho máy như khôi phục bản backup trên iCloud. Lúc này, máy có rất nhiều ứng dụng chạy nền.

Tuy nhiên, những báo cáo gần đây, gồm cả phàn nàn từ các reviewer cho thấy máy bị nóng bất thường không liên quan đến cài đặt ban đầu.

YouTuber người Hàn Quốc BullsLab đã thử đo nhiệt độ của máy với camera FLIR và khẳng định máy gặp tình trạng quá nhiệt. Trong thử nghiệm của anh ta, nhiệt độ đo được là 46,7 độ C khi chơi game và chạy các bài benchmark.

Một số người cho biết những chiếc iPhone 15 Pro của họ có thể nóng đến mức gây ra bỏng cấp độ 1. Một số khác khẳng định khi chiếc máy bắt đầu nóng lên, họ không thể cầm máy nếu không có ốp.

Ban đầu, một số ý kiến cho rằng con chip A17 Pro do TSMC sản xuất là nguyên nhân chính dẫn đến hiện tượng nóng máy nhưng nhà phân tích Ming-Chi Kuo – người thường xuyên cung cấp các thông tin về Apple lại có lập luận khác.

Ông tin rằng điều này xảy ra là do Apple. Theo đó, một số quyết định về thiết kế của Apple để giúp máy nhẹ hơn đã phản tác dụng và khiến chiếc máy khó tản nhiệt hơn. iPhone 15 rõ ràng có diện tích tản nhiệt nhỏ hơn và khung titan đã làm giảm hiệu suất tản nhiệt của dòng sản phẩm mới.

Kuo tin rằng Apple sẽ sớm tung ra bản cập nhật phần mềm để giải quyết vấn đề này nhưng tình trạng nóng máy có thể không biến mất hoàn toàn. Để thực sự khắc phục, Apple có thể phải hạ thấp hiệu năng của chip A17 Pro, vốn không nhanh hơn nhiều so với chip A16 Bionic.

Kuo còn khẳng định nếu Apple không giải quyết vấn đề một cách hợp lý, nó có thể ảnh hưởng đến nhu cầu mua iPhone của người dùng.

Vấn đề quá nhiệt không phải rắc rối duy nhất với iPhone 15 của Apple. Một số máy ngay khi bán ra đã bị lỗi về thẩm mĩ, đồng thời cũng có những lo ngại cho rằng chúng kém bền hơn so với dòng iPhone 14 Pro/Pro Max.',
	1,
    'News2/news2-pic1.png',
    700
);
---------------------------------------------------------------------------------------
INSERT INTO Post (Post_Title, Author, Post_Date, Teaser_Post, Content_Post, Post_Tags, AnhBia,luotthich)
VALUES (

    N'Xiaomi 13T series chính thức: Camera Leica, chống nước IP68, giá từ 12,99 triệu đồng',
    N'Thế Duyệt',
    '2023-09-27',
    N'Xiaomi 13T series là dòng sản phẩm T-series đầu tiên của Xiaomi được trang bị camera Leica chất lượng cao.',
    N'Tại sự kiện ra mắt sản phẩm mới tổ chức tối ngày 26/9 theo giờ Việt Nam, Xiaomi chính thức giới thiệu dòng sản phẩm Xiaomi 13T series, bao gồm 2 phiên bản: Xiaomi 13T và Xiaomi 13T Pro. Dòng 13T năm nay mang tới nhiều nâng cấp về thiết kế, camera cũng như phần cứng, trong khi có mức giá tương đối dễ chịu.

Về cơ bản, cả 2 phiên bản Xiaomi 13T và Xiaomi 13T Pro đều có ngoại hình tương tự nhau và giống với chiếc Redmi K60 Ultra, phiên bản bán tại thị trường nội địa. Máy có mặt lưng hoàn thiện từ chất liệu kính kèm khung viền nhựa, tuy nhiên vẫn mang dáng vẻ cao cấp.

Ở mặt trước, Xiaomi 13T và 13T Pro được trang bị màn hình 6,67 inch, sử dụng tấm nền AMOLED 12-bit, có độ phân giải 1220 x 2712 kèm tần số quét 144Hz. Màn hình này có độ sáng 2600 nits và có thiết kế dạng "nốt ruồi", nơi đặt camera selfie 20MP, Ngoài ra, Xiaomi cũng tích hợp cả cảm biến vân tay trong màn hình dạng quang học phía dưới.

Camera là một ưu điểm nâng cấp đáng chú ý khi năm nay là năm đầu tiên Xiaomi trang bị hệ thống camera Leica cao cấp cho dòng T-series thay vì dòng flagship. Về thông số, cả 2 phiên bản đều được trang bị camera góc rộng 50MP, camera góc siêu rộng 12MP và camera tele 50MP.

Xiaomi 13T series mang đến hai phong cách chụp ảnh Leica nguyên bản: Leica Authentic Look và Leica Vibrant Look, với khả năng tái tạo màu sắc tự nhiên, độ tương phản và độ phân giải cao, song hành cùng tính thẩm mỹ của hình ảnh Leica cổ điển. Sáu bộ lọc Leica thể hiện sự tôn vinh với các hiệu ứng hình ảnh Leica huyền thoại, bao gồm cả Leica Sepia và Leica Blue mới nhất được chuyển thể từ Chế độ phim Leica M - Typ 240. Xiaomi 13T Pro và Xiaomi 13T cũng bổ sung thêm các lựa chọn sáng tạo cho người dùng bằng cách cung cấp bốn dấu mờ độc quyền Leica mới, mang đến nhiều lựa chọn hơn về bố cục ảnh và kích thước khung hình.

Về hiệu năng, Xiaomi 13T phiên bản tiêu chuẩn được trang bị con chip Dimensity 8200 Ultra, còn bản Pro trang bị chip Dimensity 9200+ mạnh mẽ, tương tự Redmi K60 Ultra. Máy có dung lượng RAM lên tới 16GB, bộ nhớ lưu trữ lên tới 1TB.

Về thời lượng pin, Xiaomi trang bị cho Xiaomi 13T series viên pin dung lượng 5000mAh, hỗ trợ sạc nhanh 67W và 120W tương ứng với bản tiêu chuẩn và bản Pro.

Tại Việt Nam, Xiaomi 13T và Xiaomi 13T Pro lên kệ với mức giá niêm yết lần lượt từ 12,99 triệu đồng và 16,99 triệu đồng. Máy có 3 tuỳ chọn màu sắc là đen, xanh dương và xanh ngọc.',
	3,
    'News3/news3-pic2.png',
    3261
);

---------------------------------------------------------------------------------------
INSERT INTO Post (Post_Title, Author, Post_Date, Teaser_Post, Content_Post, Post_Tags, AnhBia,luotthich)
VALUES (
    N'Điểm nhấn cốt lõi làm nên giá trị vượt bậc của Galaxy Z Series',
    N'Huy Nguyễn',
    '2023-09-28',
    N'Tập trung đầu tư, dám đổi mới sáng tạo nhằm hoàn thiện mọi trải nghiệm dù là nhỏ nhất chính là cách để Galaxy Z Series ghi dấu trong lòng người yêu công nghệ.',
	N'Dù điện thoại gập được trang bị nhiều tính năng đột phá, mang đến những trải nghiệm mới mẻ, nhưng độ bền của dòng điện thoại này luôn là mối bận tâm lớn nhất khiến người dùng phải băn khoăn mỗi khi muốn "rút ví" sở hữu. Phần lớn nỗi lo đến từ thiết kế gập, đặc biệt là khu vực bản lề - "xương sống" tạo nên sự khác biệt hoàn toàn của dòng sản phẩm này so với những mẫu smartphone thông thường.

Thế nhưng trái ngược với những nỗi lo ấy, Samsung đã dày công nghiên cứu và không ngừng cải tiến qua từng thế hệ Galaxy Z Series; không chỉ xua tan nỗi lo về độ bền, mà còn mang đến những giá trị vượt bậc khác, nhằm nâng tầm trải nghiệm người dùng tốt nhất.

Khẳng định độ bền cùng trải nghiệm gập mở đột phá ngay từ thế hệ đầu tiên

Sự ra đời của Galaxy Fold thế hệ đầu tiên vào năm 2019 mang theo gánh nặng của một sản phẩm tiên phong đồng thời dấy lên những hoài nghi của người dùng về tính khả dụng cũng như độ bền bỉ trong quá trình hoạt động. Cần phải nhớ rằng ở thời điểm đó, một thiết bị với thiết kế màn hình có thể gập mở "linh hoạt" như Galaxy Fold vẫn nằm ngoài những tiêu chuẩn vật lý vốn có với một sản phẩm smartphone thông thường.

Bằng khả năng chế tác chính xác, hoàn thiện tỉ mỉ dựa trên cơ cấu bánh răng với các chi tiết siêu nhỏ, Samsung đã tự tin tuyên bố bản lề của siêu phẩm Galaxy Fold có thể chịu đến 200.000 lần gập, nghĩa là tương đương với 5 năm sử dụng. Và điều đó đã được chứng minh khi rất nhiều hãng như SquareTrade đã làm các thử nghiệm gập mở với robot và sau 120.000 lần thì "bản lề vẫn có thể hoạt động tốt". Cây viết Raymond Wong đến từ Mashable còn nhận xét: "Bản lề của Galaxy Fold cho cảm giác thanh lịch và mở ra êm ái."

Thế hệ thứ 2 - cuộc cách mạng thay đổi khả năng tương tác

Với một cơ chế phức tạp và tinh vi, bụi bẩn luôn là kẻ thù của bản lề. Những kinh nghiệm quý báu này đã tiếp thêm động lực to lớn để Samsung nhanh chóng lắng nghe, mạnh dạn thay đổi theo ý kiến người dùng bằng việc cho ra mắt Galaxy Z Flip và Galaxy Z Fold2, cải tiến gần như hoàn toàn những hạn chế của thế hệ trước đồng thời khẳng định đầu tư một cách nghiêm túc vào điện thoại gập.

Trong đó, bản lề Hideaway sở hữu nhiều cải tiến không chỉ giúp tăng cường độ bền, khả năng ổn định khi thao tác mà còn mở ra một chương mới cho trải nghiệm gập mở linh hoạt, sáng tạo hơn. Qua những đánh giá của Youtuber JerryRigEverything có thể thấy, bản lề trên chiếc máy này dù có bị bẻ ngược lại, hay trong điều kiện khắc nghiệt đầy bụi cát vẫn có thể đảm bảo khả năng hoạt động hoàn hảo. Và đương nhiên, bản lề này vẫn được Samsung bảo đảm với 200.000 lần gập mở, như một tiêu chuẩn riêng của dòng sản phẩm gập.

Với việc sử dụng cơ chế CAM kép, bản lề cho phép người dùng mở và cố định điện thoại ở mọi góc độ tạo nên một cuộc cách mạng trong khả năng tương tác. Người dùng hoàn toàn yên tâm khi gập, xoay và cố định thiết bị tại bất cứ đâu, dễ dàng hơn khi xem video giải trí một cách rảnh tay. Hoặc tự tin ghi lại những bức hình hoàn hảo, dù là chụp ảnh selfie hay "bắt ngay" những khoảnh khắc đáng nhớ bên bạn bè mà không cần phải chạm vào máy.

Đột phá khả năng chống nước, khai mở nhiều trải nghiệm mới

Với những thành công của thế hệ thứ 2, bản lề trên Galaxy Z Series thế hệ thứ 3 và thế hệ thứ 4 đã được thừa hưởng một nền tảng vững vàng để tự do phát triển, tối ưu kích thước đồng thời nâng cao hiệu suất, tăng cường độ bền sản phẩm lên một cấp độ mới. Bằng các tinh chỉnh trong cơ cấu bản lề kết hợp với việc ứng dụng các loại vật liệu mới như kính Gorilla Glass Victus hay khung hợp kim Armor Aluminium, khả năng chịu đựng va đập cũng như tính ổn định của thiết bị được nâng lên đáng kể.

Không những vậy, đây cũng là lần đầu tiên đánh dấu khả năng chống nước IPX8 được ứng dụng trên bản lề gập mở, tạo bước đột phá giúp tăng cường khả năng hoạt động ở bất cứ đâu. Từ đây, những chiếc Galaxy Z Series đã có thể tự tin để sánh vai cùng bất cứ mẫu smartphone nào, loại bỏ hoàn toàn định kiến về một mẫu điện thoại gập cao cấp nhưng mỏng manh.

Bản lề gập phẳng, thay đổi giúp Galaxy Z Series thế hệ thứ 5 trở nên hoàn hảo

Để đến Galaxy Z Series thế hệ thứ 5, Samsung đã lại một lần nữa khiến cho người yêu công nghệ thích thú khi mang tới một bản lề hoàn toàn mới, được gọi là bản lề Flex. Điểm khác biệt lớn nhất của bản lề này so với thế hệ trước chính là việc nó giúp cho chiếc máy giờ đây được gập phẳng hoàn toàn hạn chế tối đa khe hở khi đóng lại, giúp mang đến một trải nghiệm gập mở mượt mà và cực kỳ hoàn chỉnh.

Không chỉ sở hữu độ bền cao hơn, bản lề mới còn cải thiện kích thước tổng thể giúp cho Galaxy Z Fold5 lẫn Z Flip5 trở nên nhẹ nhàng gọn gàng hơn so với người tiền nhiệm, dễ dàng để bỏ vào túi xách, balo hay thậm chí là túi quần áo mỗi khi di chuyển. Kết hợp với khả năng gập phẳng hoàn toàn, Galaxy Z Series thế hệ thứ 5 trở nên cao cấp hơn với vẻ đẹp có phân tinh tế hiện đại và sang trọng hơn trông thấy.

Ngoài ra, cải tiến lớn về bản lề còn giúp giảm đến độ mỏng nếp gấp màn hình lên đến 40%. Biên tập viên công nghệ tiêu dùng Samuel Gibbs của Theguardian nhận định "bản lề mới là một cải tiến lớn. Máy mỏng và nhẹ hơn so với người tiền nhiệm, đồng thời nếp gấp màn hình cũng ít lộ rõ hơn". Điều này không chỉ mang tới trải nghiệm hình ảnh thú vị hấp dẫn mà hơn hết các thao tác vuốt chạm trên Galaxy Z Flip5 sẽ trở nên liền mạch, trơn tru và hoàn thiện hơn.

Có thể thấy, Galaxy Z Series thế hệ thứ 5 đã thực sự làm làm dậy sóng ngành công nghiệp điện thoại thông minh với từ những chi tiết được xem là "căn bản" nhất. Đó cũng là minh chứng cho những nỗ lực không ngừng nghỉ của Samsung trong việc kiến tạo ra những sản phẩm, nâng tầm trải nghiệm người dùng một cách trọn vẹn nhất.
',
	4,
    'News4/news4-pic2.png',
    2000
);

---------------------------------------------------------------------------------------
INSERT INTO Post (Post_Title, Author, Post_Date, Teaser_Post, Content_Post, Post_Tags, AnhBia,luotthich)
VALUES (
    N'Ai sắp mua iPhone 15 phải đọc ngay: Thử nghiệm mới vạch trần 2 lỗi bất thường trên phiên bản Pro và Pro Max',
    N'Mạnh Kiên',
    '2023-09-28',
    N'Các thử nghiệm mới nhất cho thấy iPhone 15 Pro và Pro Max ghi nhận nhiệt độ lên tới 47 độ C, quá nóng để có thể cầm trên tay. Thậm chí, sạc pin qua cổng USB-C mới cũng rất nóng.',
    N'Các thử nghiệm mới nhất cho thấy iPhone 15 Pro và Pro Max ghi nhận nhiệt độ lên tới 47 độ C, quá nóng để có thể cầm trên tay. Thậm chí, sạc pin qua cổng USB-C mới cũng rất nóng.

Dòng iPhone 15 chỉ vừa mới lên kệ nhưng đã có nhiều phàn nàn từ người dùng về việc thiết bị gặp tình trạng nóng bất thường. Các ghi nhận từ người dùng tập trung vào phiên bản iPhone 15 Pro và Pro Max, khiến lý do bị đổi lỗi là chip xử lý A17 Pro mới.

Tuy nhiên, cũng có cũng có các báo cáo về việc điện thoại cũng gặp tình trạng quá nhiệt khi sạc, điều được cho là khá lạ thường bởi công suất sạc tối đa của máy chỉ là 20W, khá thấp so với các đối thủ Android.

Trước tranh cãi này, trang Android Authority đã tiến hành các bài thử nghiệm trên iPhone 15 Pro để xem điều gì đã xảy ra.

Chip A17 Pro của Apple thực sự có vấn đề?

Android Authority đã sử dụng súng đo nhiệt độ để ghi lại nhiệt độ cao nhất ở mặt sau iPhone 15 Pro khi sử dụng các tác vụ khác nhau, cũng như tiến hành các thử nghiệm tương tự trên Google Pixel 7 Pro và Samsung Galaxy S23 Ultra để so sánh.

Tất cả đều không sử dụng ốp lưng, không có tác vụ nền và thời gian hạ nhiệt giữa các lần tiến hành.

Đầu tiên, iPhone 15 ấm hơn một chút so với S23 Ultra và Pixel 7 Pro khi chạy các tác vụ công việc hàng ngày như phát video và lướt web. Tuy nhiên, biên độ không quá rộng đến mức đáng lo ngại. Mức nhiệt duy trì ở dưới 30 độ C và được coi là bình thường.

Đẩy CPU mạnh hơn với Geekbench 6 cũng ghi nhận tình trạng tương tự. Điện thoại của Apple ấm hơn đối thủ 1 hoặc 2 độ C. iPhone 15 Pro nóng lên khi chạy các tác vụ phức tạp, nhưng không gây khó chịu và cũng không khác biệt quá nhiều so với hai thiết bị cùng so sánh.

Trung bình, iPhone 15 Pro nóng hơn từ 2,5% đến 5% trong các thử nghiệm này.

Tuy nhiên, khi chuyển sang các tác vụ phức tạp hơn, chip A17 Pro lộ rõ vấn đề. Khi GPU sáu lõi hoạt động, nhiệt độ tăng vọt nhanh chóng. IPhone 15 Pro vượt qua mốc 40 độ C trong vòng năm phút sau khi chạy bài kiểm tra 3DMark Wild Life.

Khi kết thúc quá trình chạy 20 phút, nhiệt độ cao nhất trên điện thoại được ghi nhận là 47 độ C, quá nóng để có thể cầm trên tay. Galaxy S23 Ultra cũng tăng nhiệt, nhưng iPhone 15 Pro nóng hơn điện thoại này đến 5,7%.

Trên thực tế, mọi thiết bị cầm tay đạt mức nhiệt gần 50 độ C dù là hoạt động với bất kỳ tác vụ nào đều đáng lo ngại.

Thử nghiệm quay video 4K/60 cho thấy sự khác biệt đáng kể nhất. Chỉ sau năm phút, iPhone 15 Pro nóng hơn khoảng 7 độ C so với S23 Ultra và nóng hơn 4 độ C so với Pixel 7 Pro, một mẫu điện thoại vốn đã bị coi là quá nóng trước đó.

Nhìn qua kết quả, iPhone 15 Pro luôn nóng hơn Galaxy S23 Ultra và Pixel 7 Pro trong tất cả các thử nghiệm. Đôi khi chênh lệch nhỏ, nhưng xu hướng chung là càng đẩy con chip hoạt động hết công suất, nhiệt độ càng tăng mạnh.

Rõ ràng, những lời phàn nàn về việc iPhone 15 Pro và Pro Max cầm trên tay quá nóng là có cơ sở.

Sạc iPhone 15 USB-C cũng nóng

Chip của iPhone 15 Pro nhìn chung gặp vấn đề về nhiệt, vậy còn chuyện nóng lên khi sạc pin thì sao?

Android Authority đã ghi lại nhiệt độ cao nhất của vỏ bên ngoài điện thoại trong lúc sạc, sử dụng bộ cáp sạc USB-C 30W chính thức của Apple.

Dù sạc công suất thấp hơn nhưng iPhone 15 Pro và Pro Max sạc vẫn nóng hơn so với các đối thủ.

So sánh nhiệt độ của iPhone 15 Pro với Samsung Galaxy S23 Ultra là thấy rõ vấn đề. Cần nhớ rằng, mức sạc cao nhất của Apple ở khoảng 20W trong khi S23 Ultra xử lý công suất lên tới 45W.

Nhiệt độ bên trong cao nhất của Samsung là 35,5 độ C thấp hơn so với nhiệt độ của Apple, ước tính đạt khoảng từ 38 độ C đến 40 độ C. Hơn nữa, iPhone 15 Pro cũng ghi nhận tình trạng nóng lên nhanh hơn nhiều, điều cho thấy có vấn đề về tản nhiệt

iPhone 15 có bị quá nhiệt không?

Không thể phủ nhận iPhone 15 Pro trong thử nghiệm nói trên có hiện tượng quá nóng. Mặc dù về mặt lý thuyết, chipset A17 Pro có lợi thế về mặt sản xuất hơn so với các đối thủ.

Con chip được xây dựng trên tiến trình 3nm hiệu quả hơn so với 4nm của Snapdragon 8 Gen 2 bên trong Galaxy S23 Ultra và 5nm của Tensor G2 trên Pixel 7 Pro.

Tuy nhiên, Apple dường như đã tận dụng lợi thế này để đẩy hiệu suất bổ sung (như lõi GPU bổ sung), dẫn đến nhiệt độ cao khi chip làm việc hết công suất

Tương tự, các ghi nhận về sạc của điện thoại cũng đáng thất vọng so với các đối thủ Android hàng đầu. Không chỉ sạc chậm mà điện thoại còn nóng hơn, điều được cho là không tốt cho tuổi thọ pin. Trong đó, iPhone 15 Pro Max gặp vấn đề nặng nhất.

Đối với người dùng bình thường, hiện tượng trên không phải vấn đề quá lớn, nhưng các game thủ, người làm các tác vụ nặng có thể cảm thấy khó chịu khi cầm điện thoại trên tay.

Nếu đang nghĩ đến việc sở hữu chiếc iPhone mới nhất, người dùng có lẽ nên đợi để xem Apple có thể giải quyết vấn đề này thế nào trong bản cập nhật phần mềm sắp tới.

Nếu đã sở hữu iPhone 15 Pro, lời khuyên tốt nhất là hãy tháo ốp lưng ra khi sạc và cho điện thoại thời gian hạ nhiệt sau khi chạy các ứng dụng nặng.

Theo nhà phân tích cao cấp Ming-Chi Kuo, vấn đề quá nhiệt của dòng iPhone 15 Pro có thể không liên quan đến con chip mới.

"Nguyên nhân chính có nhiều khả năng là do sự thỏa hiệp trong thiết kế hệ thống nhiệt để đạt được trọng lượng nhẹ hơn, chẳng hạn như giảm diện tích tản nhiệt và sử dụng khung titan, điều tác động tiêu cực đến hiệu suất tản nhiệt".

Nhà phân tích cho rằng Apple sẽ giải quyết vấn đề này thông qua các bản cập nhật phần mềm, nhưng lưu ý rằng hãng chỉ có thể thay đổi bằng cách giảm hiệu suất chip xử lý.

Nếu không giải quyết vấn đề một cách thích hợp, tình trạng quá nhiệt "có thể tác động tiêu cực đến việc xuất xưởng trong suốt vòng đời sản phẩm của dòng iPhone 15 Pro", Kuo nhận định.',
	1,
    'News5/news5-pic1.png',
    5000
);

---------------------------------------------------------------------------------------
INSERT INTO Post (Post_Title, Author, Post_Date, Teaser_Post, Content_Post, Post_Tags, AnhBia,luotthich)
VALUES (
    
    
    N'Nokia tung mẫu điện thoại cực khủng, chấp cả vòi phun của lính cứu hỏa, đe dọa đánh bại Samsung',
    N'Nhật Minh',
    '2023-08-28',
    N'Nó bền tới mức có thể chịu được nước từ vòi phun với áp suất lên tới 100 bar và nhiệt độ nước lên tới 80 độ C" – Đại diện Nokia nói về mẫu điện thoại mới.',
    N'Nokia thông báo sẽ phát hành mẫu điện thoại thông minh mới có thể vượt qua những thử thách khắc nghiệt nhất.

Nếu bạn đã nhiều lần làm vỡ smartphone của mình thì Nokia có thể giúp bạn khắc phục điều đó với chiếc XR21 siêu bền bỉ.

Mẫu smartphone này được làm từ vật liệu cứng cáp với khung nhôm, thiết kế được bao phủ bởi kính cường lực Corning Gorilla Glass Victus. Nokia cho biết, XR21 đã trải qua một số bài kiểm tra chuyên sâu bao gồm thả rơi, ngâm trong nước, thậm chí chịu lực nước rất lớn từ vòi phun mạnh như thiết bị của lính cứu hỏa.

Dù với tất cả những bài kiểm tra khắc nghiệt đó, Nokia vẫn tự tin rằng chiếc XR21 của mình sống sốt "không một vết xước".

Để giúp người dùng yên tâm hơn, nhà cung cấp cho biết họ sẽ bảo hành 3 năm cho phần cứng điện thoại và bảo hành 1 năm cho màn hình của XR21. Điều đó có nghĩa người dùng có thể sửa chữa các vết nứt vỡ miễn phí nếu máy bị hỏng.

Cùng với thiết kế chắc chắn, XR21 còn có tất cả các tính năng thông thường mà bạn mong muốn tìm thấy trên một chiếc điện thoại thông minh hiện đại.

Người dùng sẽ được tận hưởng màn hình FHD+ 6,49 inch pixel với tốc độ làm mới lên tới 120Hz. Ngoài ra điện thoại còn có camera kép với chế độ chụp đêm chuyên dụng, cho phép chụp những bức ảnh chất lượng cao dù mặt trời đã lặn.

XR21 trang bị bộ vi xử lý Snapdragon, pin 4800mAh và dung lượng lưu trữ 128GB. Các tính năng bổ sung khác bao gồm sạc nhanh, jack cắm 3,5mm dành cho tai nghe và 3 năm nâng cấp hệ điều hành để đảm bảo thiết bị của bạn luôn cập nhật các tính năng mới nhất từ Google.

Nokia còn có các nút "Truy cập nhanh" (Quick Access) cho phép người dùng truy cập các tính năng yêu thích mà không cần phải chạm vào màn hình.

Hiện XR21 có hai màu sắc để lựa chọn, gồm màu xanh và màu đen.

"Đây là phiên bản điện thoại thông minh của mẫu Nokia 3310 ''nồi đồng cối đá'' trước đây" – Adam Ferguson, Trưởng bộ phận Tiếp thị Sản phẩm của điện thoại Nokia cho biết – "Nó bền tới mức có thể chịu được nước từ vòi phun với áp suất lên tới 100 bar và nhiệt độ nước lên tới 80 độ C. Chúng tôi tin tưởng vào ''người hùng'' của mình tới mức sẵn sàng cung cấp bảo hành thay thế màn hình trong 1 năm nếu điều tồi tệ nhất xảy ra".

XR21 sẽ "lên kệ" vào đầu tháng 6 tới nhưng hiện chưa rõ kế hoạch phân phối trên thị trường quốc tế của HMD Global. Dự kiến, XR21 sẽ có giá từ 499 bảng Anh (tương đương 14,72 triệu đồng).',
	2,
    'News6/news6-pic1.png',
    9912
);

---------------------------------------------------------------------------------------
INSERT INTO Post (Post_Title, Author, Post_Date, Teaser_Post, Content_Post, Post_Tags, AnhBia,luotthich)
VALUES (
    N'"Mổ xẻ" mẫu G22 cực dị của Nokia: Giá chưa đến 4 triệu đồng nhưng có nên mua? – Đáp án nằm ở 1 chi tiết ít người chú ý',
    N'Nhật Minh',
    '2023-06-28',
    N'Nokia G22 trở thành cái tên thu hút nhiều sự chú ý trong thời gian qua bởi theo nhà cung cấp, người dùng có thể tự sửa chữa điện thoại một cách dễ dàng.',
    N'HMD - thương hiệu sản xuất những chiếc điện thoại mới mang nhãn hiệu của Nokia – đã tung ra thị trường mẫu điện thoại thông minh G22 với thiết kế đặc biệt, cho phép người dùng có thể tự sửa chữa khi cần.

HMD tuyên bố: "Bắt đầu từ Nokia G22, chúng tôi sẽ thiết kế và chế tạo những chiếc điện thoại thông minh dễ sửa chữa hơn".

Thật tuyệt khi thấy một hãng điện thoại tìm cách tạo ra những thiết kế dễ sửa chữa để nâng tầm trải nghiệm người dùng. Thế nhưng, theo chuyên gia công nghệ Ron Amadeo đến từ New Jersey (Mỹ), tính năng "dễ sửa chữa" của G22 có vẻ đã được nâng tầm hơn so với thực tế.

Mẫu điện thoại này có giá 179 USD (tại Việt Nam, G22 đang được bán với giá 3.690.000 đồng, theo website Thế giới di động), trang bị màn hình LCD 6.52 inch, tốc độ làm mới màn hình 90Hz, chip Unisoc T606, RAM 4GB, dung lượng lưu trữ 64GB, pin 5050 mAh với sạc 20W.

Điện thoại có đầu đọc dấu vân tay, jack cắm tai nghe, khe cắm MicroSD, hệ điều hành Android 12 kèm theo chính sách hỗ trợ 2 năm cập nhật hệ điều hành và 3 năm cập nhật bảo mật hàng tháng. Với một mẫu điện thoại giá rẻ thì đây là chính sách hỗ trợ tốt.

Tương tự như Google và Samsung, HMD đã hợp tác với iFixit để cung cấp các bộ phận sửa chữa chính hãng, bao gồm màn hình (53 USD), pin (26 USD), cổng sạc (20 USD), mặt lưng bằng nhựa (26 USD). Ngoài ra còn có các hướng dẫn chi tiết từ iFixit để người dùng biết phải xử lý, thay thế các bộ phận đó ra sao.

Theo Amadeo, tất cả các nỗ lực của HMD đều rất tuyệt vời và xứng đáng được đánh giá cao. Mỗi nhà sản xuất đều nên cung cấp các bộ phận thay thế cho điện thoại, cùng hướng dẫn đi kèm. Song, nếu xem xét kỹ Nokia G22, bạn có lẽ sẽ không thấy thỏa mãn.

Mẫu smartphone giá rẻ đi kèm thủ thuật bán hàng mới

Khi mở mặt lưng của điện thoại, bạn sẽ thấy một khay chứa pin được dán vào. Chỉ cần vài thao tác nhỏ là đã có thể nhấc viên pin cũ ra ngoài. Tuy nhiên, thao tác lắp ráp lại có vẻ gây lúng túng hơn.

Trong đoạn video do PCMag đăng tải, nhân viên kỹ thuật của iFixit đã mất hơn 3 phút để lắp ráp lại chiếc điện thoại trở lại trạng thái ban đầu sau khi tháo pin. Có lẽ vì vậy mà trong thông báo của mình, HDM cũng ước tính thời gian để người dùng có thể tự thay pin là 5 phút.

Thay thế màn hình là một trong những nhu cầu sửa chữa phổ biến nhất, nhưng ở G22, tất cả các thành phần đều được gắn vào mặt sau của màn hình. Như vậy, để thay màn hình, bạn sẽ phải tháo rời gần như tất cả các linh kiện ra ngoài.

Hướng dẫn chính thức của iFixit đã liệt kê 39 bước để thay thế màn hình Nokia G22, điều này có vẻ phức tạp hơn mức cần thiết nếu xét tới các thiết bị cho phép người dùng có thể tự sửa chữa trên thị trường hiện nay. HMD ước tính người dùng cần 20 phút để thực hiện các thao tác thay màn hình.

Đáng nói, theo Amadeo, có một điều ít người để ý. Đó là nếu nhìn vào chiếc G22 đã tháo tung, bạn sẽ thấy nó không khác gì so với "người tiền nhiệm" G21. Thay đổi duy nhất khiến G22 tương xứng hơn với mục tiêu tiếp thị "tự sửa chữa" là mặt lưng nhựa tháo rời, thay vì dán keo.

Chuyên gia Mỹ nhận định, đây là một bước đi đúng hướng của HMD, tuy nhiên, có vẻ nhà cung cấp này đã dành nhiều nỗ lực cho việc tiếp thị hơn là đầu tư nhiều hơn nữa vào khả năng sửa chữa của điện thoại trên thực tế.

Một thiết kế thân thiện với sửa chữa sẽ trông giống như iPhone 14. Apple không hướng tới mục tiêu này nhưng thiết kế vật lý của iPhone lại mang tới cảm nhận đó. Tất cả các thành phần của iPhone được gắn vào một khung trung tâm bên trong máy. Việc này cho phép tháo rời các tấm mặt trước và mặt sau máy chỉ trong 2-3 bước.

Người dùng cũng có thể chọn tháo tấm nào trước. Ví dụ, nếu cần thay màn hình, chỉ cần tháo rời màn hình phía trước và thay thế.

Theo Amadeo, chúng ta thực sự nên đánh giá cao những thiết kế có thể sữa chữa dễ dàng nhưng mẫu Nokia G22 của HMD trông giống như một chiếc điện thoại giá rẻ bình thường, đi kèm theo một số linh kiện và những thủ thuật bán hàng mới.',
	2,
    'News7/news7-pic1.png',
    500
);

---------------------------------------------------------------------------------------
INSERT INTO Post (Post_Title, Author, Post_Date, Teaser_Post, Content_Post, Post_Tags, AnhBia,luotthich)
VALUES (
    N'Xiaomi ra mắt máy tính bảng giá rẻ: Màn hình 11 inch, pin 8000mAh, giá dưới 5 triệu đồng',
    N'Thế Duyệt',
    '2023-02-10',
    N'Redmi Pad SE là mẫu máy tính bảng thuộc phân khúc giá rẻ tới từ Xiaomi, nổi bật với ưu điểm có màn hình lớn, pin dung lượng cao và giá dễ tiếp cận.',
    N'Xiaomi mới đây đã giới thiệu mẫu máy tính bảng mới tại thị trường Việt Nam có tên Redmi Pad SE. Đây là chiếc tablet thuộc phân khúc giá rẻ, trang bị nhiều ưu điểm đáp ứng nhu cầu sử dụng của đại đa số người dùng.

Dù có giá thành dễ tiếp cận tuy nhiên toàn bộ thân máy của Redmi Pad SE vẫn được hoàn thiện từ chất liệu kim loại nguyên khối, cụ thể là nhôm ở cả mặt lưng và khung viền. Thiết kế tổng thể có phần giống với dòng Xiaomi Pad cao cấp hơn.

Ở mặt trước, Redmi Pad SE có màn hình 11 inch, sử dụng tấm nền LCD IPS, độ phân giải 1200 x 1920 kèm tần số quét 90Hz. Màn hình này có độ sáng khoảng 400 nits và có tỷ lệ hiển thị là 16:10. Viền màn hình được thiết kế mỏng đều ở 4 cạnh.

Ở mặt lưng, Redmi Pad SE có camera đơn 8MP để chụp "chống cháy" và một camera selfie 5MP ở mặt trước dùng để gọi điện video. Máy có tới 3 tuỳ chọn màu sắc để người dùng lựa chọn: Tím oải hương, Xám than chì và Xanh bạc hà.

Về hiệu năng, Redmi Pad SE trang bị con chip Snapdragon 680, một con chip tầm trung cho hiệu năng khá, đủ đáp nhu cầu sử dụng của người dùng cơ bản. Phiên bản chính hãng Việt Nam có 2 tuỳ chọn RAM là 4GB và 6GB, bộ nhớ lưu trữ 128GB chung cho cả 2 bản. Máy có viên pin 8000mAh, tuy nhiên lại chỉ hỗ trợ sạc 10W chứ không phải sạc nhanh.',
	3,
    'News8/news8-pic1.png',
    9000
);

---------------------------------------------------------------------------------------
INSERT INTO Post (Post_Title, Author, Post_Date, Teaser_Post, Content_Post, Post_Tags, AnhBia,luotthich)
VALUES (
    N'Trên tay smartphone Xiaomi có RAM 24GB, sạc 120W giá chưa tới 12 triệu đồng',
    N'Thế Duyệt',
    '2023-08-28',
    N'Redmi K60 Ultra là mẫu smartphone rẻ nhất trên thị trường trang bị RAM lên tới 24GB, đi kèm hiệu năng phần cứng mạnh mẽ.',
    N'Redmi K60 Ultra (hay Ultimate Edition) là mẫu smartphone mới nhất của Xiaomi thuộc dòng K60 series. Dù dòng sản phẩm này đã ra mắt được gần một năm, nhưng phải tới tận bây giờ, một phiên bản cao cấp với phần cứng mạnh mẽ nhất mới được Xiaomi giới thiệu tới người dùng.

Về cơ bản, dù mang trong mình phần cứng rất mạnh mẽ, nhưng Redmi K60 Ultra vẫn chỉ được định vị ở phân khúc cận cao cấp. Bởi vậy so với các dòng flagship của Xiaomi thì các yếu tố về ngoại hình hay camera đều không "cao cấp" bằng.

Redmi K60 Ultra có mặt lưng hoàn thiện từ kính bề mặt dạng bóng, khá tương đồng với 2 phiên bản tiêu chuẩn và bản Pro ra mắt hồi đầu năm nay. Mặt lưng này được thiết kế cong ở 2 cạnh bên giúp cảm giác cầm nắm thoải má.

Cụm camera của Redmi K60 Ultra về cơ bản có cách thiết kế giống 2 phiên bản tiêu chuẩn và Pro, tuy nhiên có kích thước mô-đun lớn hơn. Xiaomi đặt vào đây 3 ống kính: góc rộng 50MP sử dụng cảm biến Sony IMX800, góc siêu rộng 8MP và macro 2MP. Chất lượng camera của các mẫu điện thoại Redmi ở mức ổn, không quá xuất sắc như những dòng flagship Mi vốn có sự tinh chỉnh của Leica.

Ở mặt trước, Redmi K60 Ultra được trang bị một màn hình AMOLED có kích thước 6,67 inch, sử dụng độ phân giải QHD+, tần số quét 144Hz. Màn hình này có camera selfie 20MP "nốt ruồi" cũng như có cảm biến vân tay quang học phía dưới.

Xiaomi cho biết Redmi K60 Ultra tích hợp con chip X7 được phát triển bới Pixelworks nhằm hỗ trợ chơi game ở độ phân giải 144Hz với 30 tựa game khác nhau. Bởi vậy trong cài đặt màn hình, phần tần số quét được hiển thị là "lên tới 144Hz".

Như đã đề cập, Redmi K60 Ultra là chiếc smartphone thuộc dòng cận cao cấp nên phần khung viền của máy hoàn thiện từ nhựa. Đây là nơi đặt các cổng kết nối, phím bấm vật lý, dải loa, mic thu âm... Máy vẫn được trang bị "mắt thần" hồng ngoại nhưng không có jack tai nghe 3.5mm.

Về hiệu năng, Redmi K60 Ultra trang bị con chip Dimensity 9200+ mạnh mẽ nhất tới từ MediaTek. Con chip này cho hiệu năng có thể so sánh ngang với Snapdragon 8 Gen 2 phiên bản ép xung trang bị trên các máy smartphone gaming.

Với 1,4 triệu điểm hiệu năng, con chip Dimensity 9200+ trên Redmi K60 Ultra cho hiệu năng mạnh mẽ ngang ngửa Snapdragon 8 Gen 2 phiên bản ép xung trang bị trên các máy smartphone gaming.

Redmi K60 Ultra có thể cân mượt tất cả các tựa game nặng nhẹ khác nhau trên thị trường với mức đồ hoạ cao. Chúng tôi sẽ có bài đánh giá hiệu năng chơi game chi tiết của Redmi K60 Ultra trong thời gian tới.

Điểm đặc biệt là Redmi K60 Ultra là mẫu smartphone hiếm hoi trên thị trường trang bị dung lượng RAM lên tới 24GB vật lý. Phiên bản này có mức giá chưa tới 12 triệu nếu tính theo tỷ giá chuyển đổi ngoại tệ. Ngoài ra thì bộ nhớ lưu trữ của phiên bản 24GB RAM cũng sẽ là 1TB.

Xiaomi trang bị viên pin dung lượng 5000mAh, hỗ trợ sạc nhanh 120W TurboCharge. Máy tặng kèm sẵn sạc nhanh theo máy nên người dùng không cần phải mua thêm.

Do là phiên bản nội địa, Redmi K60 Ultra sẽ không được cài đặt sẵn các dịch vụ của Google như kho ứng dụng Google Play, người dùng sẽ cần phải cài đặt thủ công. Ngoài ra, máy cũng sẽ không hỗ trợ hiển thị ngôn ngữ tiếng Việt. Người dùng cần cân nhắc lựa chọn nơi bán uy tín để được hỗ trợ các vấn đề này, khâu bảo hành cũng sẽ tuỳ chọn vào nơi bán.

Tham khảo tại một số cửa hàng, Redmi K60 Ultra được bán tại Việt Nam với mức giá khởi điểm từ 9,4 triệu đồng. Phiên bản cao cấp nhất 24GB/1TB sẽ có giá chênh lệch với giá tại thị trường nội địa khoảng 1 - 1,5 triệu đồng.',
	3,
    'News9/news9-pic1.png',
    7000
);


---------------------------------------------------------------------------------------
INSERT INTO Post (Post_Title, Author, Post_Date, Teaser_Post, Content_Post, Post_Tags, AnhBia,luotthich)
VALUES (
    
    N'Vivo ra mắt smartphone tầm trung thiết kế độc đáo, có màn hình cong, camera 50MP',
    N'Thế Duyệt',
    '2023-09-27',
    N'vivo V29e là mẫu smartphone tầm trung với thiết kế mặt lưng khá đẹp mắt.',
    N'Vivo mới đây đã giới thiệu chiếc vivo V29e tại thị trường Ấn Độ. Đây là dòng sản phẩm tầm trung nằm trong dòng V-series, có ưu điểm nổi bật tới từ thiết kế ngoại hình, trang bị màn hình cong cạnh và có camera 50MP kèm hiệu năng khá.

Vivo V29e có mặt lưng hoàn thiện từ kính, mặt lưng này được chia thành 2 mảng màu khác nhau với công nghệ đổi màu khi được chiếu dưới tia UV. Nổi bật ở mặt lưng này còn là hệ thống camera kép gồm ống kính góc rộng 64MP và góc siêu rộng 8MP.

Ở mặt trước, vivo trang bị cho V29e màn hình kích thước 6,78 inch, sử dụng tấm nền AMOLED cong 2 cạnh bên. Màn hình này có độ phân giải FHD+ kèm tần số quét 120Hz, sử dụng thiết kế "nốt ruồi" với camera selfie 50MP.

Về hiệu năng, vivo V29e trang bị vi xử lý Snapdragon 695 phổ biến cho hiệu năng khá. Máy có RAM 8GB, bộ nhớ lưu trữ 128GB/256GB, hỗ trợ thẻ nhớ microSD mở rộng. Viên pin của máy có dung lượng 5000mAh, hỗ trợ sạc nhanh 44W.

vivo V29e lên kệ tại Ấn Độ với 2 màu đỏ và xanh, giá khởi điểm từ 26.999 INR, tương đương 7,9 triệu đồng.',
	6,
    'News10/news10-pic1.png',
    10000
);

---------------------------------------------------------------------------------------
INSERT INTO Post (Post_Title, Author, Post_Date, Teaser_Post, Content_Post, Post_Tags, AnhBia,luotthich)
VALUES (
    
    N'Realme ra mắt smartphone sạc 240W, chip Snapdragon 8 Gen 2, RAM 24GB, giá chưa tới 13 triệu đồng',
    N'Thế Duyệt',
    '2023-08-28',
    N'Realme GT5 240W là một trong những chiếc smartphone có hiệu năng mạnh mẽ nhất trong phân khúc giá dưới 13 triệu đồng.',
    N'Realme mới đây đã giới thiệu chiếc realme GT5 tại thị trường Trung Quốc. Đây là mẫu flagship mới nhất của realme, trang bị loạt ưu điểm về phần cứng như chip Snapdragon 8 Gen 2 mạnh mẽ, RAM lên tới 24GB đi kèm công suất sạc siêu nhanh 240W.

	realme GT5 được chia làm 2 phiên bản dựa trên công suất sạc là 150W và 240W. Cả 2 model này về cơ bản giống nhau về ngoại hình, khác biệt chỉ tới từ bộ nhớ và công suất sạc nhanh. Máy có thiết kế khá giống chiếc realme GT Neo 5 ra mắt cách đây 
	
	nửa năm, gồm mặt lưng kính, khung viền kim loại, cụm camera chính kích thước lớn và có một phần mô hình chip Snapdragon với đèn LED ở bên cạnh.
	
	Ở mặt trước, realme trang bị cho GT5 màn hình 6,74 inch, sử dụng tấm nền AMOLED với độ phân giải 1240 x 2772, tần số quét 144Hz. Màn hình này có thiết kế "nốt ruồi" với camera selfie 16MP, tích hợp cảm biến vân tay quang học phía dưới.
	
	Cụm camera chính của realme GT5 gồm 3 ống kính: góc rộng 50MP sử dụng cảm biến Sony IMX890, góc siêu rộng 8MP và macro 2MP, không có ống kính tele. Chất lượng camera ở mức tốt.
	
	Về hiệu năng, realme GT5 đi kèm vi xử lý Snapdragon 8 Gen 2 mạnh mẽ, dung lượng RAM 12GB/16GB, bộ nhớ 256GB/512GB cho mode 150W và 24GB/1TB cho bản 240W. Máy có viên pin 5240mAh, sạc nhanh 150W và 4600mAh, sạc nhanh 240W tương ứng với 2 model.
	
	Về giá bán, realme GT5 lên kệ tại thị trường Trung Quốc với giá bán khởi điểm từ 2999 tệ, tương đương 9,9 triệu đồng cho bản 150W. Tuỳ chọn 240W có giá 3799 tệ, tương đương 12,6 triệu đồng.
	',
	5,
    'News11/news11-pic1.png',
    12000
);




---------------------------------------------------------------------------------------
INSERT INTO Post (Post_Title, Author, Post_Date, Teaser_Post, Content_Post, Post_Tags, AnhBia,luotthich)
VALUES (
    
    N'OPPO ra mắt Find N3 Flip: Smartphone "vỏ sò" đầu tiên có 3 camera chính, giá rẻ hơn Galaxy Z Flip5',
    N'Thế Duyệt',
    '2023-08-24',
    N'Thế hệ smartphone gập "vò sỏ" tiếp theo của OPPO trang bị những nâng cấp đáng kể về camera và hiệu năng.',
    N'Sau sự thành công của chiếc Find N2 Flip, OPPO mới đây đã ra mắt thế hệ kế nhiệm Find N3 Flip. Phiên bản mới cải tiến về thiết kế, nâng cấp hiệu năng cũng như camera, biến đây trở thành chiếc smartphone gập "vỏ sò" đầu tiên trên thế giới có hệ thống 3 camera chính chất lượng cao.

	Thiết kế của Find N3 Flip vẫn tương tự như thế hệ tiền nhiệm. Máy có phần mặt lưng hoàn thiện từ nhựa, khung viền làm từ kim loại chắc chắn, trang bị 2 màn hình chính và phụ, trong đó màn hình chính có kích thước 6,8 inch, sử dụng tấm nền LTPO AMOLED 120Hz, độ phân giải Full HD+, 
	
	độ sáng tối đa 1600 nits. Màn hình này sử dụng công nghệ bản lề "giọt nước" cho phép hạn chế nếp gấp và khe hở giữa 2 nửa màn hình. 
	
	Với màn hình phụ, kích thước của màn hình này vẫn là 3,26 inch, độ sáng 900 nits và độ phân giải 382 x 720. Do có kích thước lớn, người dùng có thể sử dụng nhiều ứng dụng một cách khá thoải mái trên màn hình này. OPPO cũng thiết kế giao diện sử dụng riêng cho từng tác vụ cũng như 
	
	trang bị nhiều widget để tận dụng sự tiện lợi của màn hình phụ.

	Camera là điểm nâng cấp đáng chú ý. Máy trang bị hệ thống 3 camera chính gồm camera góc rộng 50MP f/1.8, camera góc siêu rộng 48MP góc nhìn 114 độ và camera tele 2X 32MP. Find N3 Flip là mẫu smartphone gập "vỏ sò" đầu tiên có camera tele. Ngoài ra, Find N3 Flip vẫn có 
	
	camera selfie 32MP ở màn hình chính.

	Về hiệu năng, Find N3 Flip tiếp tục trung thành với MediaTek khi trang bị vi xử lý Dimensity 9200, một con chip flagship mạnh mẽ và là đối thủ của Snapdragon 8 Gen 2. Máy có RAM 12GB, hai tuỳ chọn bộ nhớ 256GB/512GB. Viên pin có dung lượng 4300mAh, hỗ trợ sạc nhanh 44W. 
	
	Máy sẽ chạy trên Android 13 với giao diện ColorOS 13.2.

	OPPO Find N3 Flip lên kệ tại thị trường Trung Quốc với 3 tuỳ chọn màu sắc đen, vàng và hồng, giá khởi điểm từ 6799 tệ, tương đương 22,5 triệu đồng.
	',
	9,
    'News12/news12-pic2.png',
    13000
);


---------------------------------------------------------------------------------------
INSERT INTO Post (Post_Title, Author, Post_Date, Teaser_Post, Content_Post, Post_Tags, AnhBia,luotthich)
VALUES (
    
    N'Huawei ra mắt Mate60 Pro: Màn hình 3 "nốt ruồi", hỗ trợ 5G, giá 23 triệu đồng',
    N'Thế Duyệt',
    '2023-09-28',
    N'Mate60 Pro đánh dấu sự trở lại của 5G trên các smartphone Huawei sau nhiều năm cấm vận.',
    N'Huawei mới đây đã giới thiệu chiếc Mate60 Pro một cách khá âm thầm. Mate60 Pro là dòng sản phẩm cao cấp của Huawei, tập trung vào thiết kế ngoại hình, hiệu năng cũng như hiệu suất camera. 
	
	Ở thế hệ lần này, máy có một thiết kế mới nhưng vẫn đặc trưng, nâng cấp hiệu năng và đặc biệt là đã hỗ trợ mạng 5G dù lệnh cấm vận của Chính phủ Hoa Kỳ vẫn còn hiệu lực.
	
	Huawei Mate60 Pro có mặt lưng được thiết kế với 2 mảng màu khác nhau, mặt lưng này hoàn thiện từ kính, nổi bật với cụm camera mô-đun tròn kích thước lớn. Sẽ có khá nhiều tuỳ chọn màu sắc 
	
	để người dùng lựa chọn như màu xanh, trắng, tím, đen...

	Ở mặt trước, Mate60 Pro có màn hình LTPO OLED 10-bit màu, kích thước 6,82 inch, độ phân giải 1212 x 2616 kèm tần số quét 120Hz. Màn hình này có thiết kế 3 "nốt ruồi", là nơi đặt camera selfie 
	
	góc rộng kèm hệ thống cảm biến 3D ToF dùng để mở khoá khuôn mặt tương tự iPhone. Huawei sử dụng kính cường lực "nhà tự trồng" là Kunlun Glass 2 để bảo vệ cho màn hình này.

	Về camera, Mate60 Pro trang bị hệ thống 3 camera chính ở mặt lưng gồm camera góc rộng 50MP có khẩu độ biến thiên f/1.4 - 4.0, camera góc siêu rộng 12MP góc nhìn 120 độ và camera tele tiềm vọng 3,5X độ phân giải 48MP.

Về hiệu năng, Huawei trang bị cho Mate60 Pro con chip Kirin 9000S 5nm. Một số nguồn tin cho biết con chip này được tích hợp sẵn modem 5G, mang tới khả năng hỗ trợ 5G cho smartphone của Huawei sau nhiều năm bị cấm vận. 
Máy có RAM 12GB, bộ nhớ tối đa 1TB. Viên pin có dung lượng 5000mAh, hỗ trợ sạc nhanh 88W có dây và 50W không dây. Máy chạy trên hệ điều hành HarmonyOS 4.0. Ngoài ra, đây cũng là chiếc smartphone có hỗ trợ khả năng liên lạc vệ tinh.

	',
	11,
    'News13/news13-pic1.png',
    20000
);




---------------------------------------------------------------------------------------
INSERT INTO Post (Post_Title, Author, Post_Date, Teaser_Post, Content_Post, Post_Tags, AnhBia,luotthich)
VALUES (
    
    N'Samsung ra mắt điện thoại pin 6000mAh, màn hình 120Hz, camera 50MP, giá 7,9 triệu đồng',
    N'Thế Duyệt',
    '2023-10-1',
    N'Galaxy M34 5G có ưu điểm mạnh mẽ về thời lượng pin, màn hình đẹp kèm camera chụp ảnh đẹp.',
    N'Samsung mới đây đã giới thiệu mẫu smartphone tầm trung mới có tên Galaxy M34 5G. Đây là một chiếc điện thoại 
	thuộc dòng M-series, vốn được ưu tiên về thời lượng pin cũng như trang bị hiệu năng khá, hướng tới đối tượng cần một chiếc smartphone có trải nghiệm sử dụng bền bỉ.

	Galaxy M34 5G có ngôn ngữ thiết kế khá quen thuộc với bộ vỏ hoàn thiện từ nhựa, khung viền cũng làm từ nhựa. Máy có 2 tuỳ chọn màu sắc là xanh ánh kim và xanh đại dương.

Mặt lưng của M34 5G nổi bật với hệ thống 3 camera chính gồm camera góc rộng 50MP, camera góc siêu rộng 8MP kèm camera macro 2MP. Chất lượng ảnh chụp của smartphone Samsung tầm trung từ trước nay vẫn rất ổn, đáp ứng nhu cầu sử dụng cơ bản của người dùng phổ thông.

Ở mặt trước, Galaxy M34 5G trang bị màn hình kích thước 6,5 inch với ưu điểm là sử dụng tấm nền Super AMOLED cho chất lượng hiển thị cao cấp, màu sắc rực rỡ và nịnh mắt. Màn hình này có độ phân giải FHD+ và có tần số quét cao 120Hz, kèm theo đó là độ sáng cao 1000 nits. Thiết kế màn hình là dạng "giọt nước" Infinity-U, nơi đặt camera selfie 13MP.

Về hiệu năng Galaxy M34 5G được Samsung tích hợp con chip Exynos 1280 5nm, con chip từng được trang bị trên Galaxy A53 5G ra mắt vào năm ngoái. Đây vẫn là một con chip cho hiệu năng tương đối ổn, đủ để chơi mượt một số tựa game phổ biến trên thị trường hiện nay. Phiên bản chính hãng Việt Nam sẽ có dung lượng RAM 8GB, bộ nhớ lưu trữ 128GB và có hỗ trợ thẻ nhớ mở rộng. Máy có viên pin 6000mAh, hỗ trợ sạc nhanh 25W. Ngoài ra, Samsung cũng cài đặt sẵn giao diện OneUI 5.1 cho Galaxy M34 5G, cam kết cập nhật 4 phiên bản hệ điều hành và 5 năm bảo mật.

Galaxy M34 5G mở bán từ ngày 1/10/2023 với giá bán lẻ đề nghị là 7.990.000 đồng, đi kèm nhiều ưu đãi hấp dẫn như: Trả góp 0%, Ưu đãi 300K, Ưu đãi 40% gói bảo hành Samsung Care+, Quà tặng miễn phí 2 tháng sử dụng YouTube Premium trên Galaxy Gift.

	',
	4,
    'News14/news14-pic1.png',
    1800
);





---------------------------------------------------------------------------------------
INSERT INTO Post (Post_Title, Author, Post_Date, Teaser_Post, Content_Post, Post_Tags, AnhBia,luotthich)
VALUES (
    
    N'iFixit dùng kính hiển vi để phân tích khả năng sửa chữa của iPhone 15, chấm 4 điểm',
    N'Tuấn Nguyễn',
    '2023-10-12',
    N'Ở độ phóng đại 7000x, những linh kiện thông thường trên iPhone 15 cũng trở nên kỳ lạ.',
    N'
	iFixit là cái tên đã quá nổi tiếng với những video “mổ xẻ” smartphone, đồng thời đánh giá khả năng sửa chữa của thiết bị. Với chiếc iPhone 15 mới ra mắt, iFixit đã nghĩ ra một phương pháp khá thú vị để soi vào thế giới hiển vi bên trong máy.

Bằng cách sử dụng kính hiển vi công nghiệp DSX1000, quá trình mổ xẻ iPhone 15 của iFixit cho chúng ta thấy bên trong của chiếc điện thoại theo cách mà trước đây chưa từng được biết, từ độ phức tạp tại các điểm liên kết, cho đến phóng to 7000x vào cảm biến camera chính 48MP.
	
	Hãy quên đi những hình ảnh bung máy mà bạn thường thấy. Ngay cả những linh kiện quen thuộc cũng trông rất hấp dẫn khi bạn nhìn chúng dưới kính hiển vi.

Hệ thống chống rung quang học

Chụp ảnh trong điều kiện thiếu sáng hoặc cầm điện thoại quay video là rất khó. Để ổn định hình ảnh, bạn có thể thực hiện bằng kỹ thuật số hoặc quang học (hoặc cả hai). Với ổn định hình ảnh quang học (OIS), hay còn gọi là chống rung quang học, thì cảm biến vẫn có thể cho hình ảnh ổn định trước những rung lắc nhỏ qua một hệ thống đặc biệt.
	
	Máy ảnh sử dụng bốn nam châm điện để dịch chuyển cảm biến, giúp hình ảnh giữ nguyên vị trí. Công nghệ này có giới hạn về mức độ ổn định - nó chỉ có thể dịch chuyển cảm biến theo hai trục, điều chỉnh những rung lắc nhỏ.

iFixit cho biết đây là lần đầu tiên họ thấy hệ thống này hoạt động một cách chi tiết như vậy, và có lẽ bạn cũng thế.

Trung tâm của cảm biến

Camera chính của iPhone 15 có cảm biến CMOS 48 megapixel.

CMOS là viết tắt của Complimentary Metal Oxide Semiconductor, hay công nghệ kim loại-oxit-bán dẫn bù. Chuỗi thuật ngữ kỹ thuật dài này mô tả công nghệ được sử dụng để chế tạo cảm biến. CMOS đã trở thành phương pháp chủ đạo để chế tạo chip và cảm biến hiện đại.
	
	Một pixel trên cảm biến máy ảnh được gọi là photosite (điểm thu sáng). Đó là một khối mạch thu ánh sáng trong một khu vực nhỏ trên cảm biến. Mỗi photosite có một microlens với bộ lọc màu. Bên dưới đó, có một điốt quang nhạy sáng được bao quanh bởi mạch điện hỗ trợ đọc điốt quang.

Bạn có thể nghĩ photosite giống như một mạng lưới rộng lớn các trạm thời tiết đo mưa nhỏ, mỗi trạm có một thùng thu gom. Khi trời mưa, các thùng thu thập những hạt mưa. Mạch điện của trạm sẽ đọc mức độ đầy của thùng, truyền giá trị đó đến bộ xử lý trung tâm.
	
	Cảm biến camera chính của iPhone 15 có 48 triệu photosite này, nhưng khả năng thu ánh sáng ở mỗi photosite rất nhỏ. Tương tự như lượng mưa, nếu có lượng mưa lớn, rất có thể mỗi thùng sẽ thu được một lượng nước lớn. Về mặt nhiếp ảnh, điều này tương đương với một môi trường sáng sủa, trong đó mỗi photosite có thể xuất ra dữ liệu hình ảnh cao. Nếu có đủ ánh sáng, số điểm ảnh cao hơn có thể mang lại những bức ảnh chi tiết hơn.

Tuy nhiên, nếu lượng mưa ít - tương đương với môi trường tối - thì những chiếc thùng nhỏ sẽ trở thành vấn đề: chúng không thể thu đủ nước để đo chính xác. Về mặt hình ảnh, điều này có nghĩa là ảnh bị nhiễu hạt trong điều kiện thiếu sáng.

Vậy làm thế nào để khắc phục vấn đề này? Chuyện gì sẽ xảy ra nếu bốn trạm đổ nước thu được vào một thùng? Điều này sẽ làm cho việc đo lượng nước trở nên dễ dàng hơn.
	
	Phương pháp hợp nhất này được gọi là gộp pixel và iPhone chắc chắn không phải là thiết bị đầu tiên áp dụng công nghệ này. Thiết kế này khá khéo léo trong việc chống nhiễu trong ánh sáng yếu, nhưng không thể vượt qua rào cản vật lý. Photosite càng lớn thì bạn càng thu thập được nhiều photon và bạn sẽ nhận được hình ảnh càng đẹp.

Nhưng Apple đã cắt giảm chi phí trên iPhone cơ bản và thu nhỏ cảm biến này xuống cho phù hợp. Đây là lý do tại sao, mặc dù cả mẫu 15 và 15 Pro đều có camera 48 megapixel nhưng chúng sẽ không có hiệu suất thu ánh sáng như nhau. Nhóm 4 pixel 2,0 micromet nhỏ hơn trong iPhone 15 sẽ không hoạt động tốt trong điều kiện ánh sáng yếu khi so sánh với nhóm 4 pixel 2,44 micromet có trong cảm biến 15 Pro.

	Phần còn lại của video khá giống với các video mổ xẻ khác, với một số cảnh phóng to vào linh kiện ví dụ như nam châm điện bên trong Taptic Engine hay lớp keo dán mặt sau máy.


	',
	7,
    'News15/news15-pic1.png',
    30000
);







---------------------------------------------------------------------------------------
INSERT INTO Post (Post_Title, Author, Post_Date, Teaser_Post, Content_Post, Post_Tags, AnhBia,luotthich)
VALUES (
    
    N'Thả rơi và nhúng nước iPhone 15 Pro Max và một loạt smartphone đắt tiền nhất, người thử nghiệm nhận kết quả bất ngờ',
    N'KENTT',
    '2023-10-12',
    N'Mới đây, Allstate Protection Plans drop test gây chú ý khi tiến hành thả rơi và ngâm nước một loạt smartphone đắt tiền nhất hiện tại.',
    N'
	ác thử nghiệm độ bền thiết bị hay còn được gọi là drop test hiện tại đã không còn xa lạ với nhiều người. Trên YouTube, không thiếu các clip drop test thiết bị công nghệ đắt tiền. Tuy nhiên các thử nghiệm này thường không có tính chặt chẽ cao về mặt khoa học.

Mới đây, Allstate Protection Plans đã có một thử nghiệm drop test gây chú ý khi tiến hành thả rơi và ngâm nước một loạt smartphone đắt tiền nhất hiện tại. Đây có lẽ là những trường hợp sự cố thường gặp nhất khi dùng smartphone. Họ gọi đây là thí nghiệm "những chiếc điện thoại đắt nhất trong năm" với sự góp mặt của: iPhone 15 Pro Max (giá 1.199 USD), Samsung Galaxy S23 Ultra (1.199 USD), Samsung Galaxy Z Fold5 (1.799 USD) và Google Pixel Fold (1.799 USD).

Đầu tiên là thử nghiệm ngâm nước trong vòng 30 phút dưới độ sâu khoảng 1,8m. Không quá bất ngờ khi cả 4 chiếc điện thoại đắt đỏ này đều có thể dễ dàng vượt qua.

Tuy nhiên bất ngờ đã xảy ra với bài test thả rơi thiết bị. Cả 4 chiếc điện thoại được thả từ độ cao khoảng 1,8m xuống vỉa hè. Tuy nhiên, bất ngờ đã xảy ra khi cả iPhone 15 Pro Max và 3 chiếc smartphone còn lại đều gặp sự cố.

Trong lần đầu tiên thả rơi với màn hình phía trước, iPhone 15 Pro Max và Galaxy S23 Ultra đều có hiện tượng vỡ kính và không sử dụng được một số tính năng.

Với riêng iPhone 15 Pro Max, thí nghiệm này đã khiến camera chính và camera siêu rộng bị vỡ. Các tính năng còn lại vẫn có thể sử dụng bình thường. Do đó, người dùng nên trang bị ốp lưng cho iPhone 15 Pro Max để tránh các trường hợp rơi vỡ dẫn đến hỏng thiết bị.

Ngoài ra, khung titan trên iPhone 15 Pro Max cũng tương tự như các smartphone cao cấp khác trong bài test. Nó không giúp thiết bị giảm thiểu hư hại quá lớn trong các trường hợp rơi vỡ.
	',
	1,
    'News16/news16-pic1.png',
    5000
);




---------------------------------------------------------------------------------------
INSERT INTO Post (Post_Title, Author, Post_Date, Teaser_Post, Content_Post, Post_Tags, AnhBia,luotthich)
VALUES (
    
    N'Những thứ không bao giờ nên lưu trữ trên điện thoại để tránh bị rò rỉ thông tin cá nhân',
    N'Minh Tiến',
    '2023-10-08',
    N'Hiện nay, nhiều người thường lưu trữ một số thông tin cá nhân trên điện thoại. Tuy nhiên, điều này có thể gây ra nhiều rắc rối.',
    N'
	Mật khẩu

Ghi chú hoặc lưu lại mật khẩu ngay trên điện thoại mà không thông qua các biện pháp bảo mật có thể gây ra một số rắc tối. Nếu làm mất hoặc cho người khác mượn điện thoại, họ có thể lén xem và đánh cắp mật khẩu.

Bất kỳ hình ảnh nào chứa thông tin cá nhân

Nhiều người thường có thói quen chụp lại hình ảnh của thẻ tín dụng, các loại giấy tờ tùy 
thân…, việc này cũng vô tình tạo điều kiện cho kẻ gian có thêm thông tin để đánh cắp tiền 
hoặc giả mạo danh tính. Chính vì vậy, người dùng nên lưu trữ những dữ liệu này trong một 
thư mục hoặc phần mềm được bảo vệ bằng mật khẩu.

Ảnh và video cá nhân

Không nên lưu ảnh và video cá nhân trên điện thoại mà nên lưu trữ trên đám mây hoặc máy tính. Đồng thời, cần sử dụng các phần mềm bảo vệ để đặt mật khẩu cho những nội dung này.

Địa chỉ nhà

Lưu trữ địa chỉ nhà trên các ứng dụng điều hướng (bản đồ) hoặc đặt xe sẽ giúp việc di chuyển thuận lợi hơn. Tuy nhiên, nếu kẻ gian lấy được điện thoại, họ có thể biết được địa chỉ nhà riêng, cơ quan của người dùng. Hơn nữa, kẻ gian có thể biết được lộ trình di chuyển, thói quen, thời điểm ra khỏi nhà… từ đó tìm cách đột nhập vào nhà của bạn

Tài khoản ngân hàng

Người dùng nên đặt mật khẩu cẩn trọng và không lưu trữ chúng trên điện thoại. Nếu làm rơi, mất điện thoại, tài khoản ngân hàng cũng không bị rò rỉ.
	',
	15,
    'News17/news17-pic1.png',
    4000
);



---------------------------------------------------------------------------------------
INSERT INTO Post (Post_Title, Author, Post_Date, Teaser_Post, Content_Post, Post_Tags, AnhBia,luotthich)
VALUES (
    
    N'iPhone 15 vừa mua đã hỏng chỉ vì... xe BMW',
    N'Vũ Quang ',
    '2023-10-02',
    N'Nếu bạn sở hữu iPhone 15 và xe BMW, đây là điều bạn nên tránh nếu không muốn làm ảnh hưởng tới chiếc iPhone.',
    N'
	Trong tuần qua, một số chủ sở hữu xe BMW đã phàn nàn rằng chip NFC trên iPhone 15 của họ không còn hoạt động sau khi sạc thiết bị bằng đế sạc không dây của xe. Những khách hàng bị ảnh hưởng cho biết iPhone chuyển sang chế độ khôi phục dữ liệu với màn hình trắng và chip NFC không còn hoạt động sau khi thiết bị khởi động lại.

Trong iPhone, chip NFC hỗ trợ các tính năng như Apple Pay và chìa khóa ô tô kỹ thuật số. Người dùng bị ảnh hưởng nhận được thông báo lỗi "Không thể thiết lập Apple Pay" trong ứng dụng Wallet (Ví) và dường như không có cách nào để khắc phục sự cố. Một số khách hàng cho biết Apple đã thay thế iPhone của họ sau khi xác nhận chip NFC bị lỗi, nhưng chiếc iPhone sau đó cũng dễ gặp vấn đề tương tự.

	Mặc dù các khiếu nại cho đến nay đều đến từ người dùng iPhone 15 Pro và iPhone 15 Pro Max, nhưng có thể iPhone 15 và iPhone 15 Plus cũng bị ảnh hưởng. Vì vậy chủ sở hữu của bất kỳ mẫu iPhone 15 nào cũng nên thận trọng cho đến khi vấn đề này được giải quyết.

Hiện chưa rõ nguyên nhân cụ thể của vấn đề là gì, có bao nhiêu khách hàng bị ảnh hưởng và mẫu xe BMW nào gây ra vấn đề.
	',
	1,
    'News18/news18-pic1.png',
    2500
);



---------------------------------------------------------------------------------------
INSERT INTO Post (Post_Title, Author, Post_Date, Teaser_Post, Content_Post, Post_Tags, AnhBia,luotthich)
VALUES (
    
    N'iOS 17.0.3: iPhone hết nóng nhưng hiệu năng có bị giảm sút?',
    N'Tuấn Lê',
    '2023-10-05',
    N'Hôm nay Apple đã chính thức tung bản cập nhật iOS 17.0.3 để xử lý tình trạng quá nhiệt trên dòng iPhone 15 Pro và 15 Pro Max.',
    N'
	Sau một loạt than phiền của người dùng về hiện tượng quá nhiệt trên phiên bản iPhone mới, Apple ngày hôm nay đã chính thức tung ra bản cập nhật mới để khắc phục. Trước đó, Apple cũng xác nhận sản phẩm mới có hiện tượng này, tuy nhiên là do vấn đề ở phần mềm chứ không phải phần cứng hay là lỗi thiết kế.
	
	Bên cạnh đó, cũng có một số đồn đoán cho rằng nếu muốn giải quyết tình trạng quá nhiệt này Apple có thể phải bóp hiệu năng của chip A17 Pro lại, và điều này có thể khiến một số người dùng không hài lòng. Vậy Apple có thật sự bóp hiệu năng để giảm bớt độ nóng của máy hay không? Tôi đã thử tải về bản cập nhật mới sáng nay và đã làm một vài bài kiểm tra như sau.
	
	Để phần so sánh được trực quan và công tâm hơn, tôi có tham khảo thử kết quả GeekBench mà trang 9to5Mac ghi nhận, phiên bản iOS 17.0.1 và 17.0.2 đang có điểm số đơn nhân là 2914 và đa nhân là 7199.

Còn ở phiên bản iOS 17.0.3 khi vừa mới nâng cấp, điểm số mà tôi có được khi thử với GeekBench là 2856 cho đơn nhân và 6983 cho đa nhân:
	
	Tuy nhiên, tôi đã thử chờ thêm 15 phút cho máy nguội hẳn (vì sau khi cập nhật khả năng máy vẫn còn nóng) thì kết quả giờ đã khác:
	
	Có thể thấy điểm số giờ đã lên 2952 cho đơn nhân và 7340 cho đa nhân, tức còn cao hơn ghi nhận ở phiên bản trước đây. Cần lưu ý là điểm số có thể chênh lệch một chút tùy thuộc vào từng điều kiện và nhiệt độ của máy, nhiệt độ môi trường xung quanh, cho nên khả năng cao thông tin Apple bóp hiệu năng của chip A17 Pro là không có.
	
	Vậy hiện tượng quá nhiệt có còn tồn tại không? Từ lúc cập nhật phiên bản này và sử dụng được nửa ngày, bản thân người viết chưa nhận thấy máy nóng lên quá bất thường như trước đây, ứng dụng như Instagram - một trong những nguyên nhân là app thứ 3 gây nóng máy rất nhanh cũng đã được fix với bản cập nhật mới.

Liệu rằng còn ứng dụng nào khác gây nên hiện tượng nóng máy này? Chúng ta cần thêm thời gian sử dụng và tự đánh giá, nhưng việc bóp hiệu năng của con chip có lẽ là không có rồi đấy.
	',
	7,
    'News19/news19-pic1.png',
    2500
);





---------------------------------------------------------------------------------------
INSERT INTO Post (Post_Title, Author, Post_Date, Teaser_Post, Content_Post, Post_Tags, AnhBia,luotthich)
VALUES (
    
    N'Điện thoại sạc nhanh hơn khi ở chế độ tiết kiệm pin?',
    N'Khánh Sơn',
    '2023-09-28',
    N'"Điện thoại có sạc nhanh hơn khi ở chế độ tiết kiệm pin không?" là câu hỏi hầu hết ai cũng thắc mắc.',
    N'
	Chế độ năng lượng thấp (Low Power Mode - LPM) là tính năng trên iPhone hoặc iPad, giúp duy trì tuổi thọ của pin bằng cách giảm hoặc thay đổi một số chức năng.

Battery Saver Mode hay Power Save Mode là tính năng tiết kiệm pin trên điện thoại Android. Khi chế độ này được kích hoạt, điện thoại sẽ sử dụng ít năng lượng hơn, pin điện thoại kéo dài lâu hơn so với bình thường

Tuy nhiên, do pin tiêu thu ít năng lượng hơn nên nhiều người dùng băn khoăn rằng liệu điện thoại có sạc nhanh hơn khi ở chế độ này không.

Chế độ năng lượng thấp (hoặc Chế độ Nguồn điện thấp) giúp tăng thời lượng pin bằng cách giảm lượng điện năng mà điện thoại của bạn tiêu thụ. Chế độ này sẽ vô hiệu hóa hoặc làm chậm một số chức năng cần nhiều pin hơn để hoạt động, bao gồm: làm mới ứng dụng nền, độ sáng màn hình và sử dụng dữ liệu để cải thiện thời lượng pin khả dụng.

Hầu hết các điện thoại thông minh sẽ thông báo hoặc tự động chuyển sang chế độ tiết kiệm pin khi mức pin đạt 20% hoặc ở mức thấp hơn là 10%. Biểu tượng chế độ tiết kiệm pin luôn hiển thị ở góc trên cùng bên phải của điện thoại khi nó đã được kích hoạt. Khi được kết nối với nguồn điện, điện thoại sẽ ngay lập tức thoát khỏi chế độ này.

Ở đây, có một lưu ý quan trọng là chế độ tiết kiệm pin không ảnh hưởng đến khả năng sử dụng các tác vụ quan trọng của điện thoại như truy cập web, nghe và gọi điện thoại hoặc gửi và nhận tin nhắn cũng như email.

Cách kích hoạt chế độ này cũng khá đơn giản, bạn chỉ cần vào mục cài đặt chọn vào phần "Pin" (Battery) sau đó bật "Tiết kiệm pin" (Battery Saver) trên điện thoại Android hoặc "Chế độ nguồn điện thấp" (Low Power Mode) trên iPhone.

Điện thoại sạc nhanh ở chế độ nào?

Ở chế độ nguồn điện thấp hoặc chế độ tiết kiệm pin, tất cả các quy trình hoặc ứng dụng trong điện thoại cần nhiều năng lượng pin đều bị tắt, và toàn bộ mức năng lượng của bộ sạc chỉ được sử dụng để sạc pin.

Khi bạn lựa chọn chế độ này, đồng nghĩa với việc điện thoại của bạn sẽ sử dụng ít tác vụ hơn. Như vậy nó có thể tiết kiệm được nhiều năng lượng hơn để sạc điện thoại của bạn nhanh hơn.

Trong khi đó, ở chế độ bình thường, các quá trình nền cũng tiêu hao một phần năng lượng này, khiến pin phải được sạc trong thời gian dài hơn để bù đắp cho mức tiêu thu năng lượng. Tuy nhiên, do năng lượng cần thiết tiêu thụ cho hoạt động nền là rất nhỏ trong hầu hết các điện thoại thông minh hiện đại nên không có sự khác biệt đáng kể về thời gian sạc giữa chế độ năng lượng thấp và chế độ tiêu chuẩn.

Do đó, kết luận cuối cùng - điện thoại thông minh mất ít thời gian sạc hơn khi bật chế độ tiết kiệm pin hoặc nguồn điện thấp và nhiều thời gian hơn ở chế độ thông thường.

Một mẹo nhỏ nếu bạn muốn sạc điện thoại nhanh hơn thì bạn nên để thiết bị của mình ở chế độ máy bay hoặc tắt nguồn. Khi đó, tốc độ sạc sẽ nhanh hơn đáng kể so với khi bạn bật chế độ tiết kiệm pin trên điện thoại.

Bài viết trên đã giải đáp thắc mắc cho bạn rồi chứ? Hy vọng bài viết có thể giúp ích cho bạn hiểu biết thêm về nhiều thông tin về điện thoại thông minh của bạn.
	',
	13,
    'News20/news20-pic1.png',
    2500
);




---------------------------------------------------------------------------------------
INSERT INTO Post (Post_Title, Author, Post_Date, Teaser_Post, Content_Post, Post_Tags, AnhBia,luotthich)
VALUES (
    
    N'Bao lâu nên khởi động lại smartphone một lần?',
    N'Khánh Sơn',
    '2023-09-28',
    N'"Khởi động lại điện thoại giúp cải thiện hiệu suất, chạy mượt, tăng tuổi thọ máy, tuy nhiên nhiều người không biết bao lâu nên khởi động lại máy một lần.',
    N'
	Điện thoại được xem là vật bất ly thân đối với mỗi người. Chúng hầu hết được sử dụng ngày này qua ngày nọ mà ít khi khởi động lại. Điều này khiến nhiều ứng dụng hoạt động trong nền, tăng bộ nhớ đệm và gây xung đột với hệ thống.

Vậy theo các bạn, bao lâu nên reset điện thoại? Cùng tìm câu trả lời cho câu hỏi đó qua bài viết sau đây.

Bao lâu nên khởi động lại điện thoại một lần?

Theo các chuyên gia, bạn nên khởi động lại điện thoại ít nhất 1 lần mỗi tuần. Tuy nhiên, không nên lạm dụng việc khởi động lại điện thoại quá nhiều.

Việc khởi động lại thiết bị góp phần nhỏ trong việc cải thiện hiệu suất, cũng như giúp máy chạy mượt mà và tăng tuổi thọ thiết bị hơn. Khi được khởi động lại, điện thoại sẽ tắt đi các ứng dụng đang chạy ngầm và việc đó cũng giúp loại bỏ những yếu tố gây ảnh hưởng đến pin.

Một số trường hợp cần thiết khởi động lại điện thoại như: Cập nhật hệ điều hành, lỗi phần mềm, đóng nhanh các ứng dụng đang hoạt động, giải phóng RAM, nóng máy...

Cách khởi động điện thoại Android

Bạn hãy nhấn giữ phím nguồn khoảng 5s để mở menu tắt nguồn. Sau đó chọn vào mục Khởi động lại thiết bị.
	Cách khởi động lại điện thoại iPhone

Để khởi động lại iPhone các dòng iPhone 8, iPhone 8 Plus, iPhone X, iPhone SE (thế hệ 2), iPhone XR, iPhone Xs, iPhone Xs Max, iPhone 11, iPhone 11 Pro, iPhone 11 Pro Max, iPhone 12, iPhone 12 Mini, iPhone 12 Pro, iPhone 12 Pro Max,...bạn chỉ việc bấm giữ cùng lúc phím Nguồn và phím tăng giảm âm lượng cho đến khi đến khi menu tắt nguồn hiện lên.

Đối với các dòng máy từ iPhone 5, iPhone 6, iPhone SE (thế hệ 1) bạn nhấn giữ nút home và nút nguồn, đối với iPhone 7, iPhone 7 Plus thì bạn chỉ việc bấm giữ đồng thời nút giảm âm lượng và phím nguồn để hiện menu tắt nguồn.

Trên đây là những thông tin giúp bạn trả lời câu hỏi bao lâu nên khởi động lại điện thoại, điều này có giúp máy hoạt động mượt mà hơn hay không? Hy vọng rằng bài viết trên đã mang đến cho các bạn những thông tin thực sự hữu ích.
	',
	14,
    'News21/news21-pic1.png',
    1000
);





---------------------------------------------------------------------------------------
INSERT INTO Post (Post_Title, Author, Post_Date, Teaser_Post, Content_Post, Post_Tags, AnhBia,luotthich)
VALUES (
    N'Thảm cảnh của Apple: Nguy cơ mất khoản lệ phí hàng tỷ USD từ Google giữa lúc tình hình iPhone 15 đối mặt thách thức',
    N'Bằng Bằng',
    '2023-08-10',
    N'Cổ phiếu của Apple đã giảm hơn 7% trong 3 tháng qua vì hàng loạt những thông tin tiêu cực.',
    N'Tờ Wall Street Journal (WSJ) đánh giá Apple đang ở trong tình cảnh đối mặt nhiều thách thức khi vụ kiện chống độc quyền với Google diễn ra tại thời điểm tình hình kinh doanh iPhone 15 không được thuận lợi.

Mặc dù là đối thủ của nhau ở mảng hệ điều hành smartphone, giữa iOS và Android nhưng Google lại trả hàng tỷ USD mỗi năm để được làm công cụ tìm kiếm mặc định cho Apple.

Chính điều này đã cho phép Google được tiếp cận lượng người dùng khổng lồ của nhà táo khuyết trong lĩnh vực tìm kiếm trực tuyến, đồng thời đóng góp đến 21% tổng doanh thu và 35% tổng lợi nhuận mảng kinh doanh dịch vụ của Apple.

Tờ WSJ nhận định mặc dù vụ kiện có thể kéo dài nhiều năm không đi đến hồi kết nhưng cũng sẽ ảnh hưởng đến nguồn thu từ Google của Apple.

Tệ hơn, mọi chuyện diễn ra trong lúc tình hình kinh doanh của nhà táo khuyết tại Trung Quốc đang gặp nhiều thách thức.

Trong 3 tháng qua, giá cổ phiếu Apple đã giảm hơn 7% và trở thành cổ phiếu có thành tích tệ nhất trong số các Big Tech. Sự sụt giảm này tương đương với khoản bốc hơi hơn 220 tỷ USD vốn hóa trên thị trường chứng khoán.

Theo WSJ, câu hỏi về tình hình kinh doanh của iPhone 15 tại Trung Quốc có thể sẽ được trả lời trong ngắn hạn khi Apple phải công bố báo cáo kết quả kinh doanh tài khóa quý IV/2023 vào ngày 2/11/2023, qua đó cho thấy có đúng là nhà táo khuyết đang bị Huawei thách thức trở lại hay không.

Những tin đồn về việc chính phủ Trung Quốc cấm các nhân viên quan chức dùng smartphone nước ngoài hay App Store của Apple bị siết quản lý theo tiêu chuẩn mới, cùng với đó là việc Huawei ra mắt dòng điện thoại 5G mới khiến nhiều nhà đầu tư lo ngại.

Tuy nhiên, câu hỏi về dòng tiền hàng tỷ USD mỗi năm từ Google thì lại chẳng thể có lời giải đáp trong ngắn hạn.

Báo cáo của Google cho thấy công ty mẹ Alphabet mỗi năm đã chi gần 50 tỷ USD tiền lệ phí thanh toán cho các nền tảng bên thứ 3 đã giúp công cụ tìm kiếm của họ thu được lợi nhuận (TAC), ví dụ như Apple.

Thậm chí, nhà táo khuyết còn được cho là chiếm phần lớn trong khoản thanh toán này với lượng người dùng khổng lồ.

Số liệu cuối cùng được công khai là vào năm 2018 khi Apple nhận được 12,6 tỷ USD từ Google, sau đó hãng này không công bố chi tiết các khoản của TAC nữa.

Dẫu vậy, số liệu cho thấy chi phí TAC của Google đã tăng bình quân 34% mỗi năm trong giai đoạn 5 năm đến năm 2018.

Mặc dù cả 2 tập đoàn đều không tiết lộ con số cụ thể nhưng các công tố viên ước tính chúng có thể lên đến hơn 10 tỷ USD mỗi năm.

Trong khi đó chuyên gia phân tích Eric Sheridan của Goldman Sachs dự đoán con số có thể rơi vào khoảng 16-17 tỷ USD hàng năm.

Nếu đây là sự thật thì số tiền này tương đương 20% doanh thu mảng dịch vụ trong năm tài khóa này của Apple và sự thiếu hụt nguồn thu trên do rắc rối của vụ kiện Google có thể làm xấu báo cáo tài chính của nhà táo khuyết trong bối cảnh các cổ đông đang lo lắng vì tình hình kinh doanh iPhone 15 ở Trung Quốc.

Đối với Apple, nguồn thu từ Google là một khoản “béo bở” khi không cần quá nhiều chi phí như những mảng dịch vụ đang kinh doanh khác, đồng thời doanh thu cũng cao hơn các mảng Apple Music hay TV+.

Dự đoán của Goldman Sachs cho thấy nếu mất khoản thu từ Google thì hệ số lợi nhuận trên mỗi cổ phiếu (P/E) của Apple sẽ giảm 15% trong năm tài khóa 2025. Tuy nhiên con số này có thể giới hạn ở 10% nếu vụ việc chỉ giới hạn ở thị trường Mỹ.

Hướng đi nào cho tương lai?

Tờ WSJ nhận định Apple đang khá bối rồi vì phải rất cẩn trọng trong việc quyết định bước đi tiếp theo.

Việc thay thế công cụ tìm kiếm Bing của Microsoft cho Google không hề đơn giản và cũng chưa chắc đem lại nguồn thu tương đương bởi vụ kiện chống độc quyền trên có thể giới hạn các thương vụ như vậy.

Mặc dù Apple được cho là đã tự nghiên cứu phát triển công cụ tìm kiếm của bản thân hàng năm trời nhưng chưa có một dấu hiệu nào chứng minh nhà táo khuyết thực sự hứng thú với mảng này.

Thậm chí một số nguồn tin thân cận còn cho biết Microsoft đã dự đính bán Bing và công nghệ tìm kiếm trực tuyến của mình cho Apple nhưng vẫn bị từ chối.

Theo các chuyên gia, Apple dường như chỉ dùng Microsoft như là mồi nhử để Google tăng khoản phí phải trả.

Bằng chứng là sau khi có giai đoạn đàm phán với Microsoft năm 2013-2017, nhà táo khuyết đã quay lại với bản hợp đồng mới từ Google cùng thỏa thuận phân chia phần trăm doanh thu mới.

Ngoài ra, Apple cũng không muốn tốn thêm chi phí phát triển công cụ tìm kiếm trực tuyến khi Google đã làm quá tốt ở mảng này.

Xin được nhắc rằng Google có 25 năm đi trước nhà táo khuyết trong mảng dịch vụ tìm kiếm online.

Hơn nữa Apple cũng đã học được bài học tương tự từ thất bại ê chề khi cố gắng phát triển dòng chip điện tử cho riêng mình nhưng không thành công.

Tuy nhiên theo WSJ, vụ kiện chống độc quyền Google có lẽ sẽ là bước ngoặt để thúc đẩy Apple bắt đầu hành trình tìm con đường mới cho riêng mình.',
	1,
    'News22/news22-pic1.png',
    1000
);




---------------------------------------------------------------------------------------
INSERT INTO Post (Post_Title, Author, Post_Date, Teaser_Post, Content_Post, Post_Tags, AnhBia,luotthich)
VALUES (
    N'Tim Cook giải thích tại sao Apple luôn bán iPhone mới mỗi năm, dù đề cao bảo vệ môi trường',
    N'Tuấn Nguyễn',
    '2023-10-10',
    N'Đây là cách Apple ra iPhone mới hàng năm nhưng vẫn bảo vệ môi trường.',
    N'
	Đã qua lâu rồi cái thời mà các công ty bán thiết bị của mình trong những chiếc hộp to bự, lỉnh kỉnh linh kiện. Ngày nay, xu hướng đang là đóng gói thân thiện với môi trường, sử dụng lượng giấy, nhựa, và linh kiện ít nhất có thể. Apple là một trong những người đi đầu xu hướng này trên thị trường smartphone. Công ty luôn đề cao giá trị môi trường trong những năm qua, nhưng Apple vẫn thường niên ra mắt dòng iPhone mới, đưa thêm hàng triệu thiết bị điện tử vào lưu hành.

Trong một cuộc phỏng vấn gần đây với Brut. Magazine, CEO Apple Tim Cook đã trả lời một số câu hỏi xoay quanh cách công ty và cá nhân ông thực hiện bảo vệ môi trường.

Tim Cook đã mở đầu bằng cách giải thích lý do tại sao Apple lại sản xuất iPhone mới mỗi năm.

“Tôi nghĩ việc có một chiếc iPhone hàng năm là điều tuyệt vời đối với những người muốn có nó. Và những gì chúng tôi làm là cho phép mọi người đổi điện thoại của họ. Và vì vậy chúng tôi sẽ bán lại chiếc điện thoại đó nếu nó vẫn hoạt động. Và nếu nó không hoạt động, chúng tôi sẽ có cách tháo rời và lấy nguyên liệu để tạo ra một chiếc iPhone mới.”
	
	Minh chứng cho việc này, trên thực tế Apple cho biết dòng iPhone 15 đã sử dụng nhiều vật liệu tái chế hơn, với 100% cô-ban tái chế trong pin và 100% đồng tái chế trong bảng mạch logic chính, dây đồng trong Taptic Engine và lá đồng bộ sạc MagSafe. Chúng bao gồm 100% nguyên tố đất hiếm tái chế trong tất cả các nam châm, và 100% vàng tái chế trong cổng kết nối USB‑C, cũng như lớp mạ vàng và hàn thiếc trong nhiều bảng mạch in. iPhone 15 và 15 Plus cũng bao gồm 75% nhôm tái chế trong phần vỏ máy.

Hơn 99% bao bì làm từ sợi, giúp Apple tiến gần hơn đến mục tiêu loại bỏ hoàn toàn nhựa khỏi bao bì vào năm 2025.
	
	Một câu hỏi thú vị nữa được đặt ra cho Tim Cook là liệu ông nghĩ iPhone sẽ như thế nào trong 20-30 năm nữa. Tất nhiên, Tim Cook đã thận trọng khi trả lời, thay vào đó ông tập trung vào tác động của iPhone với môi trường trong 30 năm sau:

“Tôi nghĩ nó sẽ trung hòa carbon. Tôi nghĩ tất nhiên là nó sẽ vượt rất nhiều so với hiện tại, nhưng tôi không muốn cung cấp tất cả bí mật của chúng tôi. Tôi sẽ chỉ nói từ quan điểm môi trường, nó sẽ trung hòa carbon.”

Tim Cook cũng nhấn mạnh rằng Apple thực sự quan tâm đến môi trường, không phải là hành vi “tẩy xanh”. Ông dẫn chứng việc Apple giảm đáng kể vận tải hàng không và chuyển sang đường biển, hay thu nhỏ bao bì, loại bỏ nhựa. Ông cho biết Apple Watch hiện đã trung hòa carbon, và đến năm 2023 nhiều dòng sản phẩm của công ty sẽ đủ điều kiện trung hòa carbon.

Về cá nhân, Cook chia sẻ những hành động bảo vệ môi trường của mình bao gồm đi xe điện, tránh dùng bao bì, chai vỏ nhựa. Ông tích cực tái chế rác thải, và khẳng định mọi hành động của mình đều hướng tới mục tiêu giảm lượng khí carbon được thải vào môi trường.
	
	',
	7,
    'News23/news23-pic1.png',
    20000
);

---------------------------------------------------------------------------------------
INSERT INTO Post (Post_Title, Author, Post_Date, Teaser_Post, Content_Post, Post_Tags, AnhBia,luotthich)
VALUES (
    N'Sạc điện thoại tối đa bao nhiêu lần trong ngày là tốt nhất, câu trả lời khiến bạn bất ngờ',
    N'Sơn Trần',
    '2023-10-10',
    N'Pin được xem "trái tim" của smartphone, đồng thời cũng là một trong các yếu tố quan trọng quyết định chất lượng trải nghiệm của người dùng thiết bị. Vậy thì câu hỏi đặt ra là bạn nên sạc điện thoại tối đa bao nhiêu lần trong ngày là tốt nhất? Làm cách nào để kéo dài thời lượng pin?',
    N'
	Sạc điện thoại tối đa bao nhiêu lần trong ngày là tốt nhất?

Hiện nay, hầu như những chiếc điện thoại đều dùng pin Lithium-ion và không tuân theo quy tắc giống như pin truyền thống. Tình trạng pin điện thoại của bạn sẽ không bị ảnh hưởng bởi số lần sạc trong một ngày. Thay vào đó, nó sẽ bị ảnh hưởng bởi chu kỳ sạc mà nó trải qua trong suốt quá trình sử dụng. Chu kỳ sạc chính là số lần mà pin được sạc 100% pin. Thông thường, pin điện thoại có khoảng 300-500 chu kỳ sạc trước khi cần thay pin. Mỗi chu kỳ sạc tiếp theo sẽ khiến cho pin đến gần hơn với việc giảm tuổi thọ pin.

Tốt nhất, bạn nên sạc pin điện thoại đủ lần để duy trì mức pin từ 30% đến 80% để kéo dài tuổi thọ pin. Nếu như giảm xuống mức dưới 20%, pin sẽ giảm nhanh hơn. Hơn thế nữa, nếu bạn thường xuyên sạc điện thoại và tiêu thụ nhiều chu kỳ sạc, thì thời lượng pin sẽ giảm nhanh hơn và bạn cần phải sạc điện thoại thường xuyên hơn để duy trì mức pin từ 30% đến 80%.
	
	Pin điện thoại nên kéo dài bao lâu trong một ngày?

Thời lượng pin của điện thoại thường sẽ nằm ở mức 24 giờ. Nhưng việc này còn phụ thuộc vào số lần sạc mà pin của bạn đã trải qua cũng như số lượng ứng dụng và phần mềm đang chạy trong nền. Từng chu kỳ sạc sẽ làm giảm tuổi thọ của pin điện thoại. Khi đạt đến giới hạn số lần sạc, pin sẽ cần phải được thay thế.

	Dùng điện thoại trong lúc sạc có hại không?

Khi bạn cắm điện thoại vào sạc và sử dụng cùng lúc, điện thoại sẽ tự động sử dụng phần lớn nguồn điện từ nguồn sạc để duy trì hoạt động của điện thoại, trong khi nguồn còn lại sẽ được sử dụng để sạc pin. Việc này có gậy chậm quá trình sạc, nhưng hỗ trợ quản lý tiêu thụ điện hiệu quả hơn.
	
	Sạc điện thoại cả đêm có hại pin không?

Hầu hết những chiếc pin điện thoại đều được tích hợp sẵn hệ thống quản lý pin, chúng sẽ dừng sạc tự động ngay khi pin đạt đến 100%. Chính vì thế, việc cắm pin điện thoại vào sạc cả đêm sẽ không ảnh hưởng đến tình trạng pin của bạn.
	
	Cách giúp cho pin điện thoại được bền hơn

Tắt ứng dụng không cần thiết chạy ngầm: Những ứng dụng chạy ngầm trên điện thoại thường là một trong các nguyên nhân chính gây hao pin nhanh. Kể cả khi bạn không cần dùng những ứng dụng đó, chúng vẫn có thể hoạt động một số tính năng và tiêu tốn năng lượng từ pin. Do đó, việc tắt những tính năng này sẽ giúp bạn tăng thời lượng pin đáng kể.
	
	Tắt Bluetooth và WiFi: Bluetooth và Wi-Fi có thể làm tiêu tốn rất nhiều pin điện thoại của bạn. Tắt những ứng dụng này sẽ giúp bạn tiết kiệm đáng kể năng lượng pin.
	
	Bật chế độ Nguồn điện thấp: Chế độ Nguồn điện thấp chắc chắn sẽ hoạt động và giúp bạn tiết kiệm rất nhiều pin, nhưng việc này đôi khi đi kèm với việc giảm hiệu suất tạm thời và tắt một số tính năng. Sau đây là một vài tính năng sẽ bị ảnh hưởng khi bạn bật chế độ tiết kiệm năng lượng. Chẳng hạn như làm mới ứng dụng nền, hiệu ứng hình ảnh, giảm khả năng sử dụng 5G (ngoại trừ việc phát trực tuyến video).

	Tắt GPS của bạn: GPS là một tính năng khác dẫn đến tình trạng tiêu tốn nhiều pin kể cả khi không cần thiết phải sử dụng. Việc tắt tính năng này sẽ hỗ trợ gia tăng tuổi thọ pin đáng kể.
	
	Tắt chế độ rung: Tính năng rung tiêu tốn nhiều pin hơn so với nhạc chuông nên để kéo dài pin sắp cạn thì bạn hãy tắt chế độ này.
	
	Tránh nhiệt độ khắc nghiệt: Nhiệt độ quá cao cũng tác động tiêu cực đến tuổi thọ của pin điện thoại, đặc biệt khi nhiệt độ vượt quá mức an toàn. Để điện thoại được bảo quản tốt, người dùng nên tránh đặt chúng ở môi trường nhiệt độ cao. Nhiệt độ cao sẽ gây giảm hiệu suất pin của điện thoại và gây hỏng. Để bảo quản điện thoại tốt nhất thì bạn nên duy trì ở nhiệt độ trong khoảng từ -20°C đến 60°C.
	',
	15,
    'News24/news24-pic1.png',
    25000
);




---------------------------------------------------------------------------------------
INSERT INTO Post (Post_Title, Author, Post_Date, Teaser_Post, Content_Post, Post_Tags, AnhBia,luotthich)
VALUES (
    N'Smartphone Android cao cấp sẽ bị đánh giá như thế nào nếu có cấu hình ngang iPhone 15',
    N'Tuấn Nguyễn',
    '2023-10-12',
    N'Câu chuyện giả tưởng tại một chiều không gian khác, khi thị trường năm 2023 xuất hiện một chiếc smartphone Android cao cấp có cấu hình tương đương iPhone 15.',
    N'
	
	Smartphone Android cao cấp ra mắt vào năm 2023 sẽ không thể

Khác với Android, iPhone không có sự cạnh tranh ở mặt hệ điều hành vì là lựa chọn duy nhất dành cho người dùng iOS, có chăng là sự cạnh tranh giữa các mẫu iPhone với nhau mà dù kết thúc như thế nào, Apple vẫn là người hưởng lợi.

Sự phổ biến của iPhone gần như đã tạo nên một “nền văn hóa” trong đó những người dùng iPhone có các tính năng riêng để sử dụng với nhau như FaceTime, iMessage, hay thậm chí chỉ cần là logo quả táo. Và đó là những gì đã giúp iPhone dễ dàng tìm được đường đi vào túi người dùng, trong khi thông số kỹ thuật không phải là điểm quá vượt trội. Điển hình là chiếc iPhone 15 chứa đầy những tính năng đã cũ, mà không chiếc điện thoại Android nào cùng phân khúc có thể khiến người dùng chấp nhận được.

Hãy xem mức giá $799 sẽ mang lại cho bạn những gì.

Sản phẩm “hạng hai”

Ngay từ cái nhìn đầu tiên, những chiếc iPhone 15 đã toát lên vẻ một sản phẩm cấp dưới. Nếu xem mẫu Pro của Apple là sản phẩm “đầy đủ”, thì những chiếc iPhone thường lại là “thiếu thốn”. Chúng thua về màn hình, chipset, v.v. với chất lượng mà chúng ta sẽ thẳng thừng phàn nàn trên các sản phẩm Android cùng phân khúc. Đây là lý do tại sao iPhone 15 lại mang đến cảm giác là một chiếc iPhone 14 Pro Minus mà không nhà sản xuất Android nào dám “học hỏi”, dù đó là cách mang lại lợi nhuận trên sản phẩm cao hơn.

Màn hình thất vọng

Nếu bạn đang mong đợi iPhone 15 có màn hình giống như dòng iPhone 14 Pro năm 2022 thì đáng tiếc là không phải như vậy. Nó có thêm Dynamic Island, nhưng chỉ vậy thôi.

iPhone 15 vẫn không có màn hình luôn bật (AoD). Apple phải mất 14 thế hệ để áp dụng trong khi các OEM Android đang đưa tính năng này đến các thiết bị tầm trung. Cho tới nay, Apple vẫn chỉ trang bị AoD cho các mẫu máy Pro.

Xét cho cùng, lý do Apple mang đến nhiều nâng cấp màn hình khóa là để bạn có thể thưởng thức chúng trên màn hình AoD. Các tiện ích, đồng hồ có thể tùy chỉnh và tùy chọn đều được thiết kế để thể hiện ra ngoài, tuy nhiên không có cách nào để xem chúng trên iPhone 15 mà không bật hoàn toàn màn hình lên. Và tại thời điểm đó, tốt hơn hết bạn nên mở khóa điện thoại để sử dụng các tiện ích có kích thước đầy đủ thay vì các biểu tượng màn hình khóa nhỏ.

Tiếp tục với thiếu sót về màn hình của iPhone 15, tốc độ làm mới 60Hz là quá kém và Apple đã “giậm chân tại chỗ” quá lâu. Google ra mắt Pixel 6a với màn hình 60Hz vào năm 2021 và người dùng đã phàn nàn về điều đó, tuy nhiên Apple vẫn tiếp tục duy trì tốc độ làm mới thấp này vào năm 2023. Việc so sánh với Pixel 6a thậm chí còn tệ hơn khi xét đến mức giá tầm trung 449 USD so với mức 799 USD của iPhone 15. Kể từ đó, Google đã rút ra được một số bài học khi nâng Pixel 7a lên màn hình 90Hz, nhưng có vẻ như Apple cho rằng người dùng của mình vẫn hài lòng với 60Hz.

Chipset từ năm ngoái

Apple đang thiết lập một tiêu chuẩn mà chúng ta chưa hề thấy ở một nhà sản xuất lớn nào khác. A16 Bionic chắc chắn là một con chip tốt và mạnh mẽ, điều này đã thể hiện rõ trên iPhone 14 Pro và là một sự nâng cấp đáng kể so với chip trên iPhone 13, nhưng vấn đề nằm ở chỗ đó. Apple đang sử dụng chipset của thế hệ trước trong thiết bị trị giá 799 USD của thế hệ này. Nếu Samsung xuất xưởng Galaxy S23 và S23 Plus với Snapdragon 8 Gen 1 trong khi Galaxy S23 Ultra với Snapdragon 8 Gen 2, chắc chắn họ sẽ bị phê phán mạnh mẽ. Nhưng Apple dường như không bận tâm.


Các dòng sản phẩm khác, như Pixel của Google, sử dụng cùng một chipset trên cả dòng sản phẩm hàng đầu, dòng A tầm trung và thậm chí cả Pixel Fold siêu cao cấp. Google tìm những cách khác để phân biệt các dòng thiết bị của mình – kích thước màn hình, máy ảnh, RAM và bộ lưu trữ – nhưng chipset gần như là một sự cân bằng tuyệt vời nhất có thể.

Trong quá khứ, Apple đã từng giữ cho chipset nhất quán trong các dòng sản phẩm của mình, cho đến dòng iPhone 13.

Tất nhiên, việc Apple kiểm soát thiết kế chipset và tối ưu hóa iOS 17 nghĩa là hãng có thể tận dụng tối đa nguồn sức mạnh cuối cùng của A16 Bionic, đó là lý do tại sao iPhone có xu hướng có ít RAM hơn các thiết bị Android tương đương. A16 Bionic không phải là một chipset tồi, mà là một trong những chipset tốt nhất. Tuy nhiên, sự chậm trễ về thế hệ có vẻ như là một chiến thuật nữa để Apple buộc bạn phải chi thêm tiền vào dòng sản phẩm Pro.

Chuẩn USB từ thập kỷ trước

Sau nhiều năm dù muốn hay không, Apple về cơ bản đã buộc phải áp dụng USB-C trên iPhone và họ đã làm như vậy theo cách “Apple” nhất có thể. Giống như màn hình, chipset và nút Action, USB-C trên iPhone thường có những hạn chế lớn.
	
	Đầu tiên, cổng USB-C của iPhone 15 chỉ hỗ trợ giao thức 2.0 so với cổng USB-C 3.2 trên những phiên bản Pro. Điều đó có nghĩa là nó đạt tốc độ truyền dữ liệu tối đa là 480Mbps, trong khi các mẫu cao cấp có thể đạt tốc độ 20Gbps. Điều này có thể không quan trọng với bạn nếu bạn chỉ gửi một vài bức ảnh, nhưng khoảng cách sẽ mở rộng đáng kể ngay khi bạn muốn chuyển các tệp lớn hơn như video.

Ngoài việc truyền tập tin, bạn cũng có thể gặp phải một số khó khăn khi sạc iPhone 15. Đáng chú ý nhất là thiết bị trị giá 799 USD chỉ đạt tốc độ 20W khi sạc có dây. Dù không quá xa so với tốc độ 25W của Samsung trên Galaxy S23, nhưng vẫn còn quá xa để có thể cạnh tranh với Motorola với tính năng sạc có dây 68W trên Edge Plus (2023) hoặc OnePlus với tốc độ 80W trên OnePlus 11 – khi cả hai mẫu máy vừa nêu đều có mức giá tương đương iPhone mới.

Nếu ngày nay một chiếc flagship Android ra mắt với USB 2.0, có lẽ nó sẽ trở thành thiết bị đáng xấu hổ nhất, nhưng Apple vẫn tự tin trang bị cho iPhone 15.
	

	Vì iOS là sân chơi riêng của Apple, nên họ có thể thoải mái làm như vậy mà không lo có sự cạnh tranh. Nhưng ngay cả chỉ so sánh trong thế giới iPhone, thì iPhone 15 vẫn có nhiều thua kém.

Có thể bạn muốn những vật liệu nhẹ hơn trên iPhone 15, hoặc có thể bạn không quan tâm đến titan, nút Action hoặc hệ thống camera mới. Nhưng nếu đúng như vậy, iPhone 14 Pro có lẽ sẽ là lựa chọn tốt hơn, với ống kính tele bổ sung và màn hình 120Hz mượt mà hơn, hoặc bạn có thể chọn một chiếc smartphone Android cùng tầm giá nhưng trang bị nhiều hơn. Sẽ như thế nào nếu một nhà sản xuất Android “can đảm” ra mắt smartphone giá 800 USD với màn hình 60Hz, USB 2.0, chipset cũ và thiếu AoD? Đơn giản là họ không thể cạnh tranh được nếu làm như vậy.

Tuy nhiên, đối với người dùng iOS thông thường, thì Android đơn giản không phải là iPhone và iPhone 14 Pro chỉ là mẫu iPhone cũ, do đó, iPhone 15 sẽ vẫn có được tệp khách hàng muốn một chiếc iPhone “thế hệ mới”.
	
	',
	15,
    'News25/news25-pic1.png',
    50000
);