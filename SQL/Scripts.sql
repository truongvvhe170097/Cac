USE [master]
GO
/****** Object:  Database [Assgn_PRJ_Tour_DL]    Script Date: 3/17/2024 11:36:41 PM ******/
CREATE DATABASE [Assgn_PRJ_Tour_DL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assgn_PRJ_Tour_DL', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Assgn_PRJ_Tour_DL.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assgn_PRJ_Tour_DL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Assgn_PRJ_Tour_DL_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assgn_PRJ_Tour_DL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET  MULTI_USER 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET QUERY_STORE = ON
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Assgn_PRJ_Tour_DL]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/17/2024 11:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[isSell] [int] NULL,
	[isAdmin] [int] NULL,
	[active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/17/2024 11:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[AccountID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/17/2024 11:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/17/2024 11:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[productName] [nvarchar](255) NULL,
	[productImage] [nvarchar](255) NULL,
	[productPrice] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/17/2024 11:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[totalPrice] [float] NULL,
	[note] [nvarchar](255) NULL,
	[create_date] [date] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 3/17/2024 11:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[sell_ID] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 3/17/2024 11:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (1, N'admin', N'123', 1, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (2, N'minh', N'123', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (3, N'mai', N'123', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (4, N'phuong', N'1234', 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'Miền Bắc')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'Miền Trung')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'Miền Nam')
SET IDENTITY_INSERT [dbo].[Category] OFF


GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (1, N'Tour Ninh Bình', N'https://th.bing.com/th/id/OIP.UaEffQ1PBEL8VSVslpu9yAHaE8?rs=1&pid=ImgDetMain', 1000.0000, N'Hoa Lư - Tam Cốc - Hang Múa (1 Ngày)', N'Cố đô Hoa Lư là một vùng đất thuộc xã Trường Yên, huyện Hoa Lư, tỉnh Ninh Bình ngày nay. Hoa Lư xưa được xây dựng nguy nga, tráng lệ. Người xưa còn ví Kinh Đô Hoa Lư giống như thành Tràng An, Trung Quốc thời bấy giờ.

Hang Múa – Một điểm tuyệt đẹp để check-in, bạn có thể ngắm toàn cảnh Tam Cốc từ đỉnh Hang Múa. Du khách tới đây sẽ có vô vàn những tấm ảnh đẹp mang về.

Tam Cốc – Quý khách đi thuyền xuôi theo dòng sông Ngô Đồng thơ mộng, nước trong vắt tới đấy để chiêm ngưỡng lần lượt 3 hang. Khung cảnh Tam Cốc nổi bật bởi sự kết hợp hài hòa của đá và nước. Các ngọn núi với ở đây mang những hình thù đa dạng, nối tiếp nhau, ngọn này đến ngọn khác tạo nên một bức tranh thiên nhiên tuyệt đẹp

', 1, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (2, N'Tour Lào Cai', N'https://th.bing.com/th/id/OIP.mE0AX8eTixvPXCUhGysZZgHaE8?rs=1&pid=ImgDetMain', 1500.0000, N'Cổng trời Ô Quý Hồ Sa Pa - Thung lũng Mường Hoa - Núi Hàm Rồng', N'Sa Pa là một điểm du lịch cách trung tâm thành phố Lào Cai khoảng hơn 30 km. Nằm ở độ cao trung bình 1500 – 1800 m so với mặt nước biển, Thị Trấn Sapa luôn chìm trong làn mây bồng bềnh, tạo nên một bức tranh huyền ảo đẹp đến kỳ lạ. Nơi đây, có thứ tài nguyên vô giá đó là khí hậu quanh năm trong lành mát mẻ, với nhiệt độ trung bình 15-18°C.

Khách du lịch đến đây không chỉ để tận hưởng không khí trong lành, sự yên bình giản dị của một vùng đất phía Tây Bắc, mà Sapa còn là điểm đến để bạn chiêm ngưỡng những vẻ đẹp hoang sơ của những ruộng bậc thang, thác nước, những ngọn vúi hùng vĩ, khám phá những phong tục tập quán, nét đẹp văn hóa của các dân tộc trên núi như : H’Mong đen, Dzao đỏ, Tày, Dzáy…', 1, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (3, N'Tour Hà Nội', N'https://img1.kienthucvui.vn/uploads/2019/07/19/hinh-anh-lang-bac-ho-o-ha-noi_112812656.jpg', 500.0000, N'Lăng Bác - Chùa 1 Cột - Nhà Sàn Chủ Tịch Hồ Chí Minh', N'Lăng Chủ tịch Hồ Chí Minh, còn gọi là Lăng Hồ Chủ tịch, Lăng Bác, là nơi gìn giữ di hài Chủ tịch Hồ Chí Minh. Lăng được chính thức khởi công ngày 2 tháng 9 năm 1973, tại vị trí của lễ đài cũ giữa Quảng trường Ba Đình, nơi Hồ Chí Minh từng chủ trì các cuộc gặp mặt quan trọng.

Lăng được khánh thành vào ngày 29 tháng 8 năm 1975, gồm 3 lớp với chiều cao 21,6 mét, chiều rộng 41,2 mét lớp dưới tạo dáng bậc thềm tam cấp, lớp giữa là kết cấu trung tâm của lăng gồm phòng thi hài và những hành lang, những cầu thang. Bên ngoài lăng được ốp bằng đá granite xám, bên trong làm bằng đá xám và đỏ được đánh bóng. Quanh bốn mặt là những hàng cột vuông bằng đá hoa cương, lớp trên cùng là mái lăng hình tam cấp. Ở mặt chính có dòng chữ: "CHỦ TỊCH HỒ-CHÍ-MINH" bằng đá hồng màu mận chín. Xung quanh lăng là các khu vườn nơi hơn 250 loài thực vật được trồng từ khắp mọi miền của Việt Nam.

Trong di chúc, Chủ tịch Hồ Chí Minh muốn được hỏa táng và đặt tro tại ba miền đất nước.[1] Tuy nhiên với lý do tuân theo nguyện vọng và tình cảm của người dân, Bộ Chính trị Ban Chấp hành Trung ương Đảng khóa III quyết định giữ gìn lâu dài thi hài chủ tịch Hồ Chí Minh để sau này người dân cả nước, nhất là người dân miền Nam, du khách quốc tế có thể tới viếng.', 1, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (4, N'Tour Tây Nguyên', N'https://gonatour.vn/vnt_upload/news/08_2021/du_lich_da_lat.jpg', 3000.0000, N'Thác Datanla Đà Lạt - Thung Lũng Vàng Đà Lạt - Núi Langbiang Đà Lạt', N'Thành phố ngàn hoa – Đà Lạt chính là địa điểm được rất nhiều du khách quan tâm. Nơi đây nổi tiếng với khí hậu ôn hòa, dễ chịu, cảnh sắc thiên nhiên thơ mộng, lãng mạn, nhiều khu nghỉ dưỡng, vui chơi. Đà Lạt cũng chính là điểm đến mơ ước của các tín đồ mê du lịch, của cả du khách trong và ngoài nước. Vậy Đà Lạt có gì mà khiến bao người say đắm, mê mẩn đến vậy', 2, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (5, N'Tour Đắc Lắc', N'https://dulichdongque.com/wp-content/uploads/2019/03/mo-vua-san-voi-khun-ju-nop.jpg', 1000.0000, N'Khu du lịch sinh thái Bản Đôn – Ánh Dương', N'Dak Lak một tỉnh thành nổi bật trong du  lịch Việt. Một nơi có thiên nhiên hùng vĩ, một nơi có quang cảnh hoang sơ, kì bí, nơi để con người hòa mình với thiên nhiên, để thả hồn theo những điệu nhạc của hồn quê. Một nơi mang nhiều màu sắc mới lạ cho du lịch, một nơi thú vị để khám phá. Dak Lak có nhiều điểm đến thú vị để khám phá. Một trong số đó phải kể đến Mộ vua săn bắt voi (Kunjunob) một nơi linh thiêng giữa núi rừng. Là nơi tưởng niệm được nhiều du khách quan tâm, nơi mà có ý nghĩa với người dân và buôn làng của núi rừng Tây Nguyên.', 2, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (6, N'Tour Lâm Đồng', N'https://th.bing.com/th/id/OIP.1Nj35VeYCktkc2VdOX3RLwHaE8?rs=1&pid=ImgDetMain', 2000.0000, N'Cao Nguyên Hoa Đà Lạt', N'Nằm tại đỉnh đèo Tà Nung, Cao Nguyên Hoa Đà Lạt mở ra một thế giới tuyệt vời, là điểm check-in lý tưởng giữa xứ sở ngàn hoa. Với khung cảnh thiên nhiên hùng vĩ và không khí bí ẩn, đây không chỉ là địa điểm thu hút đông đảo du khách, đặc biệt là vào những ngày cuối tuần.
Tựa lưng vào rừng thông xanh biếc, Cao Nguyên Hoa ở Đà Lạt độc đáo với thiết kế sinh thái đặc sắc. Mặc dù đã trở thành điểm du lịch, nhưng nơi này vẫn giữ được vẻ hoang sơ và tĩnh lặng của thiên nhiên.
Không gian ở đây được thiết kế mở rộng, chia thành nhiều khu vực lý tưởng để du khách có thể hoà mình vào thiên nhiên, tạo điều kiện tuyệt vời cho những ngày nghỉ ngơi sau những hành trình bận rộ. Hơn nữa, việc sử dụng vật liệu chủ yếu từ gỗ tạo nên cảm giác thân thuộc, mộc mạc cho du khách. Cao Nguyên Hoa không chỉ là nơi thư giãn, mà còn là điểm đến để trải nghiệm những khoảnh khắc thú vị và độc đáo.', 2, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (7, N'Tour Hồ Chí Minh', N'https://dinhdoclap.gov.vn/wp-content/uploads/2018/03/fa212208-808f-4552-bd91-68df6b5e973d.jpg', 4000.0000, N'Dinh Độc Lập - Hội trường Thống Nhất', N'Dinh Độc Lập là một điểm check-in tuyệt đẹp tại Sài Gòn. Kiến trúc phong thủy của Dinh Độc Lập mang hơi hướng phương Đông, tuy nhiên, từng chi tiết của công trình cũng thể hiện được nét hiện đại độc đáo. Tại đây, bạn có thể tận mắt chứng kiến từng vật phẩm ở chế độ cũ được lưu lại theo thời gian. Địa điểm du lịch Sài Gòn này thu hút đông đảo du khách dịp 30/4 và 1/5 hằng năm. ', 3, 1)
SET IDENTITY_INSERT [dbo].[product] OFF

GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_create_date]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_product] FOREIGN KEY([AccountID])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_product]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Account]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_Category] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_Category]
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_Order_OrderDetail]
GO
USE [master]
GO
ALTER DATABASE [Assgn_PRJ_Tour_DL] SET  READ_WRITE 
GO