/****** Object:  Table [dbo].[Realm.GPA.GCS.Carriers]    Script Date: 4/9/2014 3:37:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Realm.GPA.GCS.Carriers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[website_url] [nvarchar](250) NULL,
 CONSTRAINT [PK_Realm.GPA.GCS.Carriers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Realm.GPA.GCS.Ports]    Script Date: 4/9/2014 3:37:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Realm.GPA.GCS.Ports](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[region_id] [int] NULL,
 CONSTRAINT [PK_Realm.GPA.GCS.Ports] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Realm.GPA.GCS.Regions]    Script Date: 4/9/2014 3:37:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Realm.GPA.GCS.Regions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[x] [int] NOT NULL,
	[y] [int] NOT NULL,
	[radius] [int] NOT NULL,
	[domestic] [bit] NOT NULL,
 CONSTRAINT [PK_Realm.GPA.GCS.Regions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Realm.GPA.GCS.Services]    Script Date: 4/9/2014 3:37:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Realm.GPA.GCS.Services](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[turnaround_days] [int] NOT NULL,
	[frequency] [int] NOT NULL,
	[number_of_vessels] [int] NOT NULL,
	[avg_capacity] [int] NOT NULL,
	[image_url] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Realm.GPA.GCS.Services] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Realm.GPA.GCS.Services_Carriers]    Script Date: 4/9/2014 3:37:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Realm.GPA.GCS.Services_Carriers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[service_id] [int] NOT NULL,
	[carrier_id] [int] NOT NULL,
 CONSTRAINT [PK_Realm.GPA.GCS.Services_Carriers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Realm.GPA.GCS.Services_Ports]    Script Date: 4/9/2014 3:37:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Realm.GPA.GCS.Services_Ports](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[service_id] [int] NOT NULL,
	[port_id] [int] NOT NULL,
	[days_to_savannah] [int] NULL,
	[days_from_savannah] [int] NULL,
	[order] [int] NULL,
	[days_to_next_port] [int] NULL,
 CONSTRAINT [PK_Realm.GPA.GCS.Services_Ports] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Realm.GPA.GCS.US_Cities]    Script Date: 4/9/2014 3:37:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Realm.GPA.GCS.US_Cities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[rail_time_to] [int] NOT NULL,
	[rail_time_from] [int] NOT NULL,
	[truck_time_to] [int] NOT NULL,
	[truck_time_from] [int] NOT NULL,
 CONSTRAINT [PK_Realm.GPA.GCS.US_Cities] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Realm.GPA.GCS.Carriers] ON 

GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (1, N'China Shipping', N'http://www.chinashippingna.com/')
GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (2, N'United Arab Shipping Company', N'http://www.uasc.net/')
GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (3, N'CMA CGM', N'http://www.cma-cgm.com/')
GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (4, N'Evergreen Line', N'http://www.evergreen-line.com/')
GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (5, N'Hanjin', N'http://www.hanjin.com/hanjin/CUP_HOM_1001.do')
GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (6, N'Cosco', N'http://www.cosco-usa.com/')
GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (7, N'K Line', N'http://www.kline.com/')
GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (8, N'Yang Ming', N'http://www.yangming.com/english/ASP/index.asp')
GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (9, N'Hapag Llyod', N'http://www.hapag-lloyd.com/en/home.html')
GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (10, N'NYK', N'http://www2.nykline.com/')
GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (11, N'OOCL', N'http://www.oocl.com/usa/eng/Pages/default.aspx')
GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (12, N'APL', N'http://www.oocl.com/usa/eng/Pages/default.aspx')
GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (13, N'Hyundai', N'http://www.hmm21.com/cms/business/usa/index.jsp')
GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (14, N'MOL', N'http://cms.molpower.com/')
GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (15, N'ZIM', N'http://www.zim.com/pages/default.aspx')
GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (16, N'Maersk Line', N'http://www.maerskline.com/?page=home')
GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (17, N'MSC', N'http://www.mscgva.com/')
GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (18, N'SAFMARINE', N'http://www.safmarine.com/')
GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (19, N'Turkon', N'http://www.turkonamerica.com/')
GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (20, N'FESCO', N'http://www.fesco.ru/en/')
GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (21, N'CSAV', N'http://www.csav.com/en/Pages/Home.aspx')
GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (22, N'ACL', N'http://www.aclcargo.com/')
GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (23, N'ANL', N'http://www.anl.com.au/')
GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (24, N'Marfret', N'http://www.marfret.fr/en/')
GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (25, N'Wallenius Wilhemen Logistics', N'http://www.2wglobal.com/www/wep/')
GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (26, N'Bahri', N'http://www.bahri.sa/home')
GO
INSERT [dbo].[Realm.GPA.GCS.Carriers] ([id], [name], [website_url]) VALUES (27, N'CSAL', N'http://www.csaline.com/')
GO
SET IDENTITY_INSERT [dbo].[Realm.GPA.GCS.Carriers] OFF
GO
SET IDENTITY_INSERT [dbo].[Realm.GPA.GCS.Ports] ON 

GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (1, N'Brisbane', 3)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (2, N'Noumea', 3)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (3, N'Lautoka', 3)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (4, N'Papeete', 3)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (5, N'Sydney', 3)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (6, N'Shanghai', 4)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (7, N'Xiamen', 4)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (8, N'Yantian', 4)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (9, N'Hong Kong', 4)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (10, N'Norfolk', 2)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (11, N'NY / NJ', 2)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (12, N'Savannah', 2)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (13, N'Taipei', 4)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (14, N'Kaohsiung', 4)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (15, N'Baltimore', 2)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (16, N'Colon', 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (17, N'Jacksonville', 2)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (18, N'Ensenada', 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (19, N'Pusan', 4)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (20, N'Ningbo', 4)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (21, N'Wilmington', 2)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (22, N'Manzanillo', 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (23, N'Charleston', 2)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (24, N'Qingdao', 4)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (25, N'Kingston', 2)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (26, N'Da Chan Bay', 4)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (27, N'Balboa', 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (28, N'Halifax', 2)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (29, N'Los Angeles', 2)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (30, N'Oakland', 2)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (31, N'Vostochnyy', 4)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (32, N'Chiwan', 4)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (33, N'Kobe', 4)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (34, N'Tokyo', 4)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (35, N'Miami', 2)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (36, N'Antwerp', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (37, N'Bremerhaven', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (38, N'Rotterdam', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (39, N'Le Havre', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (40, N'Freeport', 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (41, N'Haifa', 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (42, N'Colombo', 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (43, N'Singapore', 4)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (44, N'Salalah', 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (45, N'Port Tangier', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (46, N'Jeddah', 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (47, N'Tanjung Pelepas', 4)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (48, N'Yokohama', 4)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (49, N'Algeciras', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (50, N'Jebel Ali', 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (51, N'Port Qasim', 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (52, N'Pipavav', 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (53, N'Jawaharlal Nehru', 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (54, N'Houston', 2)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (55, N'Port Said', 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (56, N'Djibouti', 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (57, N'Aqaba', 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (58, N'Cai Mep', 4)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (59, N'Shekou', 4)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (60, N'Cagliari', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (61, N'Damietta', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (62, N'Laem Chabang', 4)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (63, N'Nhava Sheva', 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (64, N'Mundra', 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (65, N'Valencia', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (66, N'Genoa', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (67, N'Khor Fakkan', 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (68, N'Port Said East', 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (69, N'La Spezia', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (70, N'Fos', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (71, N'Barcelona', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (72, N'Malta', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (73, N'Livorno', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (74, N'Mersin', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (75, N'Alexandria', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (76, N'Istanbul', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (77, N'Evyap', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (78, N'Gemlik', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (79, N'Izmir', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (80, N'Salerno', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (81, N'Tarragonna', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (82, N'Ashdod', 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (83, N'Piraeus', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (84, N'Gioia Tauro', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (85, N'Naples', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (86, N'Sines', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (87, N'Boston', 2)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (88, N'Felixstowe', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (89, N'Veracruz', 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (90, N'Altamira', 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (91, N'Mobile', 2)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (92, N'New Orleans', 2)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (93, N'Port Everglades', 2)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (94, N'Guayaquil', 8)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (95, N'Cristobal', 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (96, N'Southampton', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (97, N'Cartagena', 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (98, N'Melbourne', 3)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (99, N'Tauranga', 3)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (100, N'Napier', 3)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (101, N'Lyttelton', 3)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (102, N'Philadelphia', 2)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (103, N'Tilbury', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (104, N'Dunkirk', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (105, N'Caucedo', 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (106, N'Santos', 8)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (107, N'Navegantes', 8)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (108, N'Rio de Janeiro', 8)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (109, N'Vitoria', 8)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (110, N'Buenos Aires', 8)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (111, N'Montevideo', 8)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (112, N'Rio Grande', 8)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (113, N'Itaguai', 8)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (114, N'Salvador', 8)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (115, N'Suape', 8)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (116, N'Santo Tomas', 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (117, N'Puerto Cortes', 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (118, N'Puerto Moin', 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (119, N'Barranquilla', 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (120, N'Santa Marta', 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (121, N'Rio Haina', 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (122, N'San Juan', 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (123, N'Philipsburg', 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (124, N'Fort de France', 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (125, N'Vieux Fort', 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (126, N'Point Lisas', 8)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (127, N'Port of Spain', 8)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (128, N'Bridgetown', 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (129, N'St. Johns', 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (130, N'Galveston', 2)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (131, N'Auckland', 3)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (132, N'Port Kembla', 3)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (133, N'Adelaide', 3)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (134, N'Fremantle', 3)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (135, N'Nagoya', 4)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (136, N'Long Beach', 2)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (137, N'Lazaro Cardenas', 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (138, N'Zeebrugge', 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (139, N'Tacoma', 2)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (140, N'Jubail', 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (141, N'Dammam', 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (142, N'Shuwaikh', 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (143, N'Mumbai', 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (144, N'Takoradi', 6)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (145, N'Tin Can Island', 6)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (146, N'Onne', 6)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (147, N'Douala', 6)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (148, N'Abidjan', 6)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (149, N'Camden', 2)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (150, N'Dakar', 6)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (151, N'Tema', 6)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (152, N'Lome', 6)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (153, N'Cotonoua', 6)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (154, N'Lagos', 6)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (155, N'Walvis Bay', 6)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (156, N'Cape Town', 6)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (157, N'Richards Bay', 6)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (158, N'Durban', 6)
GO
INSERT [dbo].[Realm.GPA.GCS.Ports] ([id], [name], [region_id]) VALUES (159, N'Montreal', 2)
GO
SET IDENTITY_INSERT [dbo].[Realm.GPA.GCS.Ports] OFF
GO
SET IDENTITY_INSERT [dbo].[Realm.GPA.GCS.Regions] ON 

GO
INSERT [dbo].[Realm.GPA.GCS.Regions] ([id], [name], [x], [y], [radius], [domestic]) VALUES (2, N'United States', 130, 120, 30, 1)
GO
INSERT [dbo].[Realm.GPA.GCS.Regions] ([id], [name], [x], [y], [radius], [domestic]) VALUES (3, N'Australia', 650, 290, 60, 0)
GO
INSERT [dbo].[Realm.GPA.GCS.Regions] ([id], [name], [x], [y], [radius], [domestic]) VALUES (4, N'Asia Pacific', 620, 140, 90, 0)
GO
INSERT [dbo].[Realm.GPA.GCS.Regions] ([id], [name], [x], [y], [radius], [domestic]) VALUES (5, N'Middle East & India', 480, 170, 40, 0)
GO
INSERT [dbo].[Realm.GPA.GCS.Regions] ([id], [name], [x], [y], [radius], [domestic]) VALUES (6, N'Africa', 390, 260, 60, 0)
GO
INSERT [dbo].[Realm.GPA.GCS.Regions] ([id], [name], [x], [y], [radius], [domestic]) VALUES (7, N'Europe', 370, 100, 60, 0)
GO
INSERT [dbo].[Realm.GPA.GCS.Regions] ([id], [name], [x], [y], [radius], [domestic]) VALUES (8, N'South America', 180, 280, 80, 0)
GO
INSERT [dbo].[Realm.GPA.GCS.Regions] ([id], [name], [x], [y], [radius], [domestic]) VALUES (9, N'Central America', 130, 180, 35, 0)
GO
SET IDENTITY_INSERT [dbo].[Realm.GPA.GCS.Regions] OFF
GO
SET IDENTITY_INSERT [dbo].[Realm.GPA.GCS.Services] ON 

GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (1, N'AAE1', N'Asia America East Loop 1', 70, 7, 10, 4200, N'/DesktopModules/Realm.GPA.GCS/maps/aae1.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (2, N'AUE', N'Asia US East Coast', 70, 7, 10, 4200, N'/DesktopModules/Realm.GPA.GCS/maps/aue.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (3, N'AWE1', N'All Water North Loop', 70, 7, 10, 4200, N'/DesktopModules/Realm.GPA.GCS/maps/awe1.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (4, N'AWE3', N'All Water Yang Ming Lane', 63, 7, 9, 4400, N'/DesktopModules/Realm.GPA.GCS/maps/awe3.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (5, N'AWE7', N'Asia US East Loop 7', 70, 7, 10, 4200, N'/DesktopModules/Realm.GPA.GCS/maps/awe7.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (6, N'AWE5', N'Asia US East Loop 5', 70, 7, 10, 4300, N'/DesktopModules/Realm.GPA.GCS/maps/awe5.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (7, N'NCE', N'North  & Central China East Coast Express', 63, 7, 9, 4900, N'/DesktopModules/Realm.GPA.GCS/maps/nce.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (8, N'SCE', N'South China East Coast Express', 63, 7, 9, 4900, N'/DesktopModules/Realm.GPA.GCS/maps/sce.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (9, N'NYE', N'Savannah New York Express', 70, 7, 10, 4700, N'/DesktopModules/Realm.GPA.GCS/maps/nye.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (10, N'NYE/SCE - Winter', N'New York Express / South China Express - Winter', 70, 7, 10, 4800, N'/DesktopModules/Realm.GPA.GCS/maps/nye_sce-winter.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (11, N'ZCP', N'ZIM Container Pacific', 77, 7, 11, 5000, N'/DesktopModules/Realm.GPA.GCS/maps/zcp.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (12, N'APX', N'Atlantic Pacific Express', 91, 7, 13, 4700, N'/DesktopModules/Realm.GPA.GCS/maps/apx.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (13, N'MSC FE', N'Golden Gate Service', 91, 7, 13, 8500, N'/DesktopModules/Realm.GPA.GCS/maps/msc-fe.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (14, N'TP7', N'Transpacific', 84, 7, 12, 6500, N'/DesktopModules/Realm.GPA.GCS/maps/tp7.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (15, N'TP3', N'Transpacific / Columbus Loop', 112, 7, 16, 8400, N'/DesktopModules/Realm.GPA.GCS/maps/tp3.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (16, N'MECL1', N'Middle East Colombo 1', 56, 7, 8, 6200, N'/DesktopModules/Realm.GPA.GCS/maps/mecl1.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (17, N'MECL2', N'Middle East Colombo 2', 70, 7, 10, 4800, N'/DesktopModules/Realm.GPA.GCS/maps/mecl2.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (18, N'CEC', N'China East Coast Express', 77, 7, 11, 8400, N'/DesktopModules/Realm.GPA.GCS/maps/cec.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (19, N'SVS', N'South China - Vietnam - US South East Coast', 70, 7, 10, 6400, N'/DesktopModules/Realm.GPA.GCS/maps/svs.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (20, N'AZX', N'Asia Suez Express', 70, 7, 10, 6000, N'/DesktopModules/Realm.GPA.GCS/maps/azx.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (21, N'INDAMEX', N'India America Express', 56, 7, 8, 4400, N'/DesktopModules/Realm.GPA.GCS/maps/indamex.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (22, N'AWE4', N'All Water K Line Lane', 77, 7, 11, 5800, N'/DesktopModules/Realm.GPA.GCS/maps/awe4.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (23, N'MINA', N'Middle East India North America', 77, 7, 11, 4000, N'/DesktopModules/Realm.GPA.GCS/maps/mina.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (24, N'Amerigo', N'Amerigo Express', 42, 7, 6, 3500, N'/DesktopModules/Realm.GPA.GCS/maps/amerigo.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (25, N'Turkon', N'Turkon US Line', 42, 7, 5, 1800, N'/DesktopModules/Realm.GPA.GCS/maps/turkon.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (26, N'ZCA', N'ZIM Container Atlantic', 49, 7, 7, 4200, N'/DesktopModules/Realm.GPA.GCS/maps/zca.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (27, N'MSC MD', N'West Mediterrean North Atlantic', 42, 7, 6, 4900, N'/DesktopModules/Realm.GPA.GCS/maps/msc-md.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (28, N'MSC EU', N'North Europe / United Kingdom / South Atlantic / Gulf', 49, 7, 7, 6200, N'/DesktopModules/Realm.GPA.GCS/maps/msc-eu.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (29, N'MSC EQ NWC', N'Ecuador to North West Continent', 49, 7, 7, 4300, N'/DesktopModules/Realm.GPA.GCS/maps/msc-eq-nwc.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (30, N'GAX', N'Gulf Atlantic Sprint', 35, 7, 5, 3200, N'/DesktopModules/Realm.GPA.GCS/maps/gax.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (31, N'TA2', N'Transatlantic', 35, 7, 5, 4700, N'/DesktopModules/Realm.GPA.GCS/maps/ta2.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (32, N'RTW PAN', N'Round the World Panama Direct', 91, 7, 13, 2600, N'/DesktopModules/Realm.GPA.GCS/maps/rdw-pan.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (33, N'ANS', N'Atlantic North South ', 42, 7, 6, 2700, N'/DesktopModules/Realm.GPA.GCS/maps/ans.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (34, N'MSC ESCA', N'East Coast Soth America String 1', 56, 7, 8, 6800, N'/DesktopModules/Realm.GPA.GCS/maps/msc-esca.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (35, N'SAE', N'South Atlantic Express', 28, 7, 4, 1350, N'/DesktopModules/Realm.GPA.GCS/maps/sae.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (36, N'CAGEMA ML', N'Cagema Mainliner', 28, 7, 4, 1200, N'/DesktopModules/Realm.GPA.GCS/maps/cagema-ml.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (37, N'WWL', N'Round the World Ro-Ro', 120, 10, 12, 1, N'/DesktopModules/Realm.GPA.GCS/maps/wwl.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (38, N'North America Ro-Ro', N'North America Ro-Ro', 100, 25, 4, 2300, N'/DesktopModules/Realm.GPA.GCS/maps/north-america-ro-ro.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (39, N'WAF USA', N'West Africa Multi Purpose', 75, 25, 3, 1050, N'/DesktopModules/Realm.GPA.GCS/maps/waf-usa.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (40, N'USAWA', N'USA-West Africa Multi-Purpose', 40, 14, 3, 800, N'/DesktopModules/Realm.GPA.GCS/maps/usawa.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (41, N'CSAL', N'Canada States Africa Multi-Purpose', 70, 30, 2, 700, N'/DesktopModules/Realm.GPA.GCS/maps/csal.jpg')
GO
SET IDENTITY_INSERT [dbo].[Realm.GPA.GCS.Services] OFF
GO
SET IDENTITY_INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ON 

GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (5, 1, 3)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (6, 1, 1)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (7, 1, 2)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (8, 2, 4)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (9, 3, 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (10, 3, 6)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (11, 3, 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (12, 3, 8)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (13, 4, 8)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (14, 4, 6)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (15, 4, 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (16, 4, 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (17, 5, 6)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (18, 5, 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (19, 5, 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (20, 5, 8)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (21, 6, 6)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (22, 6, 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (23, 6, 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (24, 6, 8)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (25, 7, 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (26, 7, 10)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (27, 7, 11)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (28, 7, 12)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (29, 7, 13)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (30, 7, 14)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (31, 8, 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (32, 8, 10)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (33, 8, 11)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (34, 8, 12)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (35, 8, 13)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (36, 8, 14)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (37, 8, 15)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (38, 9, 12)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (39, 9, 13)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (40, 9, 14)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (41, 9, 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (42, 9, 10)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (43, 9, 11)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (44, 10, 12)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (45, 10, 13)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (46, 10, 14)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (47, 10, 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (48, 10, 10)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (49, 10, 11)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (50, 10, 15)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (51, 11, 15)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (52, 11, 1)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (53, 12, 12)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (54, 12, 13)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (55, 12, 14)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (56, 12, 16)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (57, 12, 3)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (58, 13, 17)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (59, 14, 16)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (60, 15, 16)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (61, 15, 3)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (62, 16, 16)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (63, 16, 18)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (64, 17, 16)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (65, 17, 18)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (66, 18, 12)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (67, 18, 13)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (68, 18, 14)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (69, 18, 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (70, 18, 10)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (71, 18, 11)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (72, 18, 15)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (73, 19, 12)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (74, 19, 13)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (75, 19, 14)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (76, 19, 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (77, 19, 10)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (78, 19, 11)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (79, 19, 4)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (80, 20, 12)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (81, 20, 13)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (82, 20, 14)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (83, 20, 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (84, 20, 10)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (85, 20, 11)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (86, 20, 15)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (87, 21, 3)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (88, 21, 12)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (89, 21, 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (90, 21, 10)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (91, 21, 11)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (92, 22, 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (93, 22, 6)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (94, 22, 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (95, 22, 8)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (96, 23, 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (97, 23, 2)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (98, 23, 8)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (99, 23, 7)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (100, 23, 6)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (101, 23, 1)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (102, 24, 3)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (103, 24, 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (104, 24, 12)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (105, 25, 19)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (106, 25, 20)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (107, 26, 15)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (108, 26, 1)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (109, 26, 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (110, 26, 6)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (111, 27, 17)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (112, 28, 17)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (113, 29, 17)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (114, 29, 21)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (115, 30, 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (116, 30, 10)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (117, 30, 11)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (118, 30, 22)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (119, 31, 16)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (120, 31, 3)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (121, 31, 12)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (122, 31, 13)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (123, 31, 14)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (124, 32, 3)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (125, 32, 23)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (126, 32, 24)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (127, 33, 10)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (128, 33, 4)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (129, 33, 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (130, 33, 8)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (131, 33, 9)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (132, 33, 13)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (133, 34, 17)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (134, 34, 21)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (135, 34, 3)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (136, 34, 15)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (137, 35, 16)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (138, 36, 3)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (139, 37, 25)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (140, 38, 26)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (141, 39, 18)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (142, 40, 22)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] ([id], [service_id], [carrier_id]) VALUES (143, 41, 27)
GO
SET IDENTITY_INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] OFF
GO
SET IDENTITY_INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ON 

GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (1, 1, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (2, 1, 7, 35, 33, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (3, 1, 9, 34, 34, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (4, 1, 8, 33, 35, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (5, 1, 6, 30, 38, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (6, 1, 11, 4, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (7, 1, 10, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (8, 2, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (9, 2, 11, NULL, 2, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (10, 2, 15, NULL, 4, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (11, 2, 16, 4, 11, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (12, 2, 13, 31, 38, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (13, 2, 9, 30, 40, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (14, 2, 8, 29, 40, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (15, 2, 14, 27, 42, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (16, 3, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (17, 3, 17, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (18, 3, 18, NULL, 16, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (19, 3, 15, NULL, 35, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (20, 3, 20, 31, 38, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (21, 3, 6, 29, 39, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (22, 3, 19, 27, 35, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (23, 3, 11, 4, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (24, 3, 21, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (25, 4, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (26, 4, 11, NULL, 3, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (27, 4, 21, NULL, 5, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (28, 4, 19, 22, 34, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (29, 4, 20, 25, 36, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (30, 4, 6, 24, 37, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (31, 4, 22, 8, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (32, 4, 16, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (33, 5, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (34, 5, 23, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (35, 5, 19, 26, 32, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (36, 5, 14, 33, 35, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (37, 5, 7, 32, 38, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (38, 5, 9, 30, 39, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (39, 5, 8, 29, 40, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (40, 5, 11, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (41, 6, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (42, 6, 11, NULL, 3, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (43, 6, 21, NULL, 6, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (44, 6, 23, NULL, 7, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (45, 6, 19, 22, 36, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (46, 6, 7, 29, 40, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (47, 6, 8, 28, 41, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (48, 6, 20, 25, 43, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (49, 6, 6, 24, 44, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (50, 7, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (51, 7, 19, 35, 26, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (52, 7, 24, 34, 28, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (53, 7, 20, 32, 30, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (54, 7, 6, 30, 31, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (55, 7, 11, 4, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (56, 7, 10, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (57, 8, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (58, 8, 23, NULL, 2, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (59, 8, 25, 3, 5, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (60, 8, 22, 5, 8, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (61, 8, 7, 31, 30, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (62, 8, 14, 30, 31, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (63, 8, 26, 29, 33, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (64, 8, 9, 28, 34, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (65, 8, 8, 27, 35, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (66, 9, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (67, 9, 11, NULL, 2, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (68, 9, 10, NULL, 4, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (69, 9, 17, NULL, 6, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (70, 9, 22, 4, 11, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (71, 9, 27, NULL, 12, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (72, 9, 19, 23, 36, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (73, 9, 14, 28, 40, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (74, 9, 20, 26, 42, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (75, 9, 6, 25, 43, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (76, 10, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (77, 10, 23, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (78, 10, 11, NULL, 4, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (79, 10, 10, NULL, 5, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (80, 10, 17, NULL, 8, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (81, 10, 25, 2, 10, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (82, 10, 22, 4, 12, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (83, 10, 27, NULL, 13, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (84, 10, 19, 23, 34, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (85, 10, 7, 31, 37, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (86, 10, 14, 30, 38, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (87, 10, 9, 29, 40, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (88, 10, 8, 28, 40, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (89, 10, 6, 25, 43, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (90, 11, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (91, 11, 10, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (92, 11, 11, NULL, 2, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (93, 11, 28, NULL, 5, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (94, 11, 25, 2, 10, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (95, 11, 29, NULL, 20, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (96, 11, 30, NULL, 22, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (97, 11, 31, 35, 36, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (98, 11, 24, 31, 44, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (99, 11, 20, 29, 46, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (100, 11, 6, 28, 48, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (101, 11, 19, 26, 49, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (102, 11, 27, 6, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (103, 12, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (105, 12, 32, 31, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (106, 12, 9, 30, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (107, 12, 14, 29, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (108, 12, 19, 27, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (109, 12, 33, 25, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (110, 12, 34, 24, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (111, 12, 27, 7, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (112, 12, 22, 6, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (113, 12, 35, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (114, 12, 17, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (115, 12, 23, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (116, 12, 11, NULL, 3, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (117, 12, 36, NULL, 11, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (118, 12, 37, NULL, 13, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (119, 12, 38, NULL, 14, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (120, 12, 39, NULL, 16, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (121, 13, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (122, 13, 23, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (123, 13, 40, NULL, 2, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (124, 13, 10, NULL, 7, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (125, 13, 41, 16, 22, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (126, 13, 42, NULL, 30, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (127, 13, 43, 30, 40, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (128, 13, 32, 35, 46, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (129, 13, 9, 42, 47, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (130, 13, 20, 40, 49, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (131, 13, 6, 38, 51, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (132, 13, 8, 34, 55, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (133, 13, 44, 23, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (134, 13, 11, 6, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (135, 13, 10, 4, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (136, 13, 15, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (137, 14, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (138, 14, 23, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (139, 14, 35, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (140, 14, 45, 9, 14, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (141, 14, 46, 56, 26, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (142, 14, 14, 38, 45, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (143, 14, 20, 35, 47, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (144, 14, 6, 34, 49, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (145, 14, 8, 31, 52, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (146, 14, 9, 30, 53, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (147, 14, 47, 26, 56, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (148, 15, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (149, 15, 47, 27, 30, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (150, 15, 9, 32, 36, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (151, 15, 8, 31, 37, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (152, 15, 6, 37, 40, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (153, 15, 19, NULL, 43, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (154, 15, 48, 40, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (155, 15, 20, 36, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (156, 15, 11, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (157, 15, 10, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (158, 16, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (159, 16, 10, NULL, 2, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (160, 16, 11, 3, 4, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (161, 16, 49, 10, 12, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (162, 16, 50, 30, 25, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (163, 16, 51, 28, 28, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (164, 16, 52, 26, 29, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (165, 16, 53, 24, 31, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (166, 16, 44, 20, 36, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (167, 16, 23, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (168, 17, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (169, 17, 54, NULL, 4, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (170, 17, 35, NULL, 8, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (171, 17, 49, 11, 19, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (172, 17, 55, 16, 24, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (173, 17, 56, 41, 29, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (174, 17, 50, 35, 33, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (175, 17, 42, 30, 39, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (176, 17, 44, 25, 44, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (177, 17, 46, 22, 48, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (178, 17, 57, 20, 50, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (179, 17, 11, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (180, 18, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (181, 18, 23, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (182, 18, 10, NULL, 4, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (183, 18, 46, NULL, 21, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (184, 18, 43, 27, 33, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (185, 18, 58, 36, 38, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (186, 18, 9, 34, 41, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (187, 18, 59, 33, 42, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (188, 18, 8, 31, 44, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (189, 18, 11, 4, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (190, 19, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (191, 19, 17, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (192, 19, 23, NULL, 2, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (193, 19, 49, 10, 12, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (194, 19, 42, NULL, 27, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (195, 19, 43, 26, 31, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (196, 19, 58, 34, 34, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (197, 19, 9, 32, 37, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (198, 19, 8, 30, 38, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (199, 19, 10, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (200, 20, 10, NULL, 2, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (201, 20, 60, 13, 12, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (202, 20, 61, 16, 15, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (203, 20, 50, 44, 24, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (204, 20, 43, NULL, 33, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (205, 20, 62, 32, 36, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (206, 20, 43, 29, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (207, 20, 42, 25, 43, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (208, 20, 28, 5, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (209, 20, 11, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (210, 21, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (211, 21, 23, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (212, 21, 55, 38, 17, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (213, 21, 46, 35, 20, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (214, 21, 51, 29, 26, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (215, 21, 63, 26, 29, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (216, 21, 64, 24, 31, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (217, 21, 61, 16, 39, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (218, 21, 11, 4, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (219, 21, 10, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (220, 22, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (221, 22, 43, 28, 33, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (222, 22, 58, 37, 38, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (223, 22, 14, 34, 41, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (224, 22, 9, 33, 43, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (225, 22, 8, 31, 43, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (226, 22, 11, 5, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (227, 22, 10, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (228, 23, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (229, 23, 49, 13, 11, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (230, 23, 65, 15, 13, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (231, 23, 66, 20, 15, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (232, 23, 55, 27, 20, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (233, 23, 46, 30, 23, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (234, 23, 67, 45, 30, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (235, 23, 50, 44, 32, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (236, 23, 51, 40, 35, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (237, 23, 63, 38, 37, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (238, 23, 68, 27, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (239, 23, 69, 22, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (240, 23, 70, 18, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (241, 23, 71, 17, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (242, 23, 11, 4, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (243, 23, 10, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (244, 24, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (245, 24, 45, 30, 10, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (246, 24, 65, 16, 12, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (247, 24, 72, 24, 16, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (248, 24, 73, 21, 19, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (249, 24, 66, 20, 20, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (250, 24, 70, 19, 21, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (251, 24, 71, 17, 23, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (252, 24, 11, 6, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (253, 24, 10, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (254, 25, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (255, 25, 74, 27, 16, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (256, 25, 75, 25, 18, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (257, 25, 76, 23, 20, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (258, 25, 77, 22, 21, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (259, 25, 78, 21, 22, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (260, 25, 79, 20, 23, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (261, 25, 80, 18, 25, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (262, 25, 11, 4, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (263, 25, 10, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (264, 26, 25, NULL, 3, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (265, 26, 11, 2, 8, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (266, 26, 81, 12, 20, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (267, 26, 82, 22, 26, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (268, 26, 41, 20, 28, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (269, 26, 83, 18, 31, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (270, 26, 66, 14, 34, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (271, 26, 28, 4, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (272, 27, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (273, 27, 23, NULL, 10, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (274, 27, 65, 18, 11, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (275, 27, 84, 27, 13, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (276, 27, 85, 25, 15, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (277, 27, 73, 23, 17, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (278, 27, 69, 20, 19, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (279, 27, 86, 15, 15, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (280, 27, 87, 9, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (281, 27, 11, 7, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (282, 27, 15, 4, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (283, 27, 10, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (284, 28, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (285, 28, 23, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (286, 28, 36, NULL, 11, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (287, 28, 38, NULL, 13, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (288, 28, 88, NULL, 14, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (289, 28, 37, NULL, 16, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (290, 28, 39, NULL, 19, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (291, 28, 89, 14, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (292, 28, 90, 12, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (293, 28, 54, 9, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (294, 28, 92, 6, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (295, 28, 91, 4, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (296, 28, 40, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (297, 29, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (298, 29, 93, NULL, 2, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (299, 29, 27, NULL, 8, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (300, 29, 94, NULL, 13, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (301, 29, 37, 16, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (302, 29, 38, 15, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (303, 29, 36, 13, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (304, 29, 39, 11, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (305, 30, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (306, 30, 85, NULL, 2, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (307, 30, 36, 22, 11, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (308, 30, 37, 21, 12, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (309, 30, 96, 19, 14, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (310, 30, 23, 9, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (311, 30, 93, 7, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (312, 30, 54, 4, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (313, 31, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (314, 31, 54, NULL, 4, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (315, 31, 91, NULL, 6, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (316, 31, 35, NULL, 8, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (317, 31, 10, NULL, 11, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (318, 31, 38, 15, 19, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (319, 31, 88, 14, 20, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (320, 31, 37, 12, 22, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (321, 31, 11, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (322, 31, 23, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (323, 32, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (324, 32, 25, 3, 3, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (325, 32, 97, 58, 5, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (326, 32, 4, 45, 18, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (327, 32, 3, 39, 24, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (328, 32, 2, 36, 27, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (329, 32, 5, 32, 31, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (330, 32, 98, 30, 33, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (331, 32, 99, 24, 39, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (332, 32, 100, 22, 41, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (333, 32, 101, 21, 42, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (334, 32, 22, 5, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (335, 32, 102, NULL, 3, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (336, 32, 103, 16, 12, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (337, 32, 38, 15, 13, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (338, 32, 104, 13, 15, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (339, 32, 39, 12, 16, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (340, 32, 11, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (341, 33, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (342, 33, 72, NULL, 3, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (343, 33, 105, 9, 6, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (344, 33, 106, 24, 17, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (345, 33, 107, 22, 19, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (346, 33, 108, 20, 21, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (347, 33, 109, 18, 23, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (348, 33, 10, 4, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (349, 33, 11, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (350, 34, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (351, 34, 40, 10, 1, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (352, 34, 105, 14, 4, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (353, 34, 106, 27, 15, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (354, 34, 110, 35, 19, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (355, 34, 111, 33, 21, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (356, 34, 112, 31, 23, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (357, 34, 107, 29, 25, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (358, 34, 113, 26, 28, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (359, 34, 114, 23, 31, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (360, 34, 115, 22, 33, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (361, 34, 14, 12, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (362, 34, 10, 7, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (363, 34, 11, 4, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (364, 34, 15, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (365, 35, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (366, 35, 10, NULL, 2, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (367, 35, 21, NULL, 4, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (368, 35, 116, 5, 8, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (369, 35, 117, 4, 9, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (370, 35, 118, 16, 12, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (371, 35, 22, 8, 13, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (372, 35, 97, 13, 15, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (373, 35, 119, 12, 16, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (374, 35, 120, 11, 16, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (375, 36, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (376, 36, 17, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (377, 36, 35, NULL, 3, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (378, 36, 25, 22, 5, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (379, 36, 121, 20, 7, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (380, 36, 123, 18, 9, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (381, 36, 124, 17, 10, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (382, 36, 125, 16, 11, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (383, 36, 126, 14, 13, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (384, 36, 127, 13, 14, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (385, 36, 128, 11, 16, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (386, 36, 129, 9, 18, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (387, 36, 11, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (388, 36, 10, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (389, 37, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (390, 37, 130, NULL, 3, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (391, 37, 22, NULL, 4, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (392, 37, 4, NULL, 15, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (393, 37, 131, NULL, 21, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (394, 37, 2, NULL, 24, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (395, 37, 1, NULL, 26, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (396, 37, 132, NULL, 28, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (397, 37, 98, NULL, 30, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (398, 37, 133, NULL, 32, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (399, 37, 134, NULL, 36, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (400, 37, 43, 44, 42, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (401, 37, 33, 30, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (402, 37, 135, 29, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (403, 37, 48, 27, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (404, 37, 139, 16, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (405, 37, 136, 13, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (406, 37, 137, 10, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (407, 37, 22, 4, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (408, 37, 10, NULL, 2, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (409, 37, 15, 3, 3, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (410, 37, 138, 13, 14, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (411, 37, 37, 18, 16, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (412, 37, 96, 14, 11, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (413, 38, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (414, 38, 21, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (415, 38, 15, 14, 3, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (416, 38, 11, NULL, 5, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (417, 38, 28, NULL, 7, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (418, 38, 46, 36, 25, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (419, 38, 50, 61, 33, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (420, 38, 140, 59, 35, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (421, 38, 141, 57, 37, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (422, 38, 142, 53, 41, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (423, 38, 143, 48, 46, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (424, 38, 64, 43, 51, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (425, 38, 73, 30, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (426, 38, 54, 7, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (427, 39, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (428, 39, 54, NULL, 5, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (429, 39, 144, 39, 28, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (430, 39, 145, 35, 32, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (431, 39, 146, 31, 36, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (432, 39, 147, 28, 39, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (433, 39, 148, 24, 43, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (434, 39, 149, 5, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (435, 39, 102, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (436, 40, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (437, 40, 15, NULL, 2, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (438, 40, 11, NULL, 5, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (439, 40, 150, 26, 14, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (440, 40, 151, 21, 18, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (441, 40, 152, 19, 20, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (442, 40, 153, 18, 21, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (443, 40, 154, 17, 22, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (444, 40, 17, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (445, 41, 12, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (446, 41, 155, 30, 20, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (447, 41, 158, 35, 26, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (448, 41, 157, 38, 28, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (449, 41, 156, 32, 36, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (450, 41, 159, 9, NULL, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to_savannah], [days_from_savannah], [order], [days_to_next_port]) VALUES (451, 41, 15, 2, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Realm.GPA.GCS.Services_Ports] OFF
GO
SET IDENTITY_INSERT [dbo].[Realm.GPA.GCS.US_Cities] ON 

GO
INSERT [dbo].[Realm.GPA.GCS.US_Cities] ([id], [name], [rail_time_to], [rail_time_from], [truck_time_to], [truck_time_from]) VALUES (1, N'Savannah, GA', 0, 0, 0, 0)
GO
INSERT [dbo].[Realm.GPA.GCS.US_Cities] ([id], [name], [rail_time_to], [rail_time_from], [truck_time_to], [truck_time_from]) VALUES (2, N'Atlanta, GA', 3, 3, 1, 1)
GO
INSERT [dbo].[Realm.GPA.GCS.US_Cities] ([id], [name], [rail_time_to], [rail_time_from], [truck_time_to], [truck_time_from]) VALUES (3, N'Greenville, SC', 4, 4, 1, 1)
GO
INSERT [dbo].[Realm.GPA.GCS.US_Cities] ([id], [name], [rail_time_to], [rail_time_from], [truck_time_to], [truck_time_from]) VALUES (4, N'Orlando, FL', 4, 4, 1, 1)
GO
INSERT [dbo].[Realm.GPA.GCS.US_Cities] ([id], [name], [rail_time_to], [rail_time_from], [truck_time_to], [truck_time_from]) VALUES (5, N'Tampa, FL', 4, 4, 1, 1)
GO
INSERT [dbo].[Realm.GPA.GCS.US_Cities] ([id], [name], [rail_time_to], [rail_time_from], [truck_time_to], [truck_time_from]) VALUES (6, N'Miami, FL', 4, 4, 1, 1)
GO
INSERT [dbo].[Realm.GPA.GCS.US_Cities] ([id], [name], [rail_time_to], [rail_time_from], [truck_time_to], [truck_time_from]) VALUES (7, N'Dothan, AL', 4, 4, 1, 1)
GO
INSERT [dbo].[Realm.GPA.GCS.US_Cities] ([id], [name], [rail_time_to], [rail_time_from], [truck_time_to], [truck_time_from]) VALUES (8, N'New Orleans, LA', 5, 5, 2, 2)
GO
SET IDENTITY_INSERT [dbo].[Realm.GPA.GCS.US_Cities] OFF
GO
ALTER TABLE [dbo].[Realm.GPA.GCS.Ports]  WITH CHECK ADD  CONSTRAINT [FK_Realm.GPA.GCS.Ports_Realm.GPA.GCS.Regions] FOREIGN KEY([region_id])
REFERENCES [dbo].[Realm.GPA.GCS.Regions] ([id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Realm.GPA.GCS.Ports] CHECK CONSTRAINT [FK_Realm.GPA.GCS.Ports_Realm.GPA.GCS.Regions]
GO
ALTER TABLE [dbo].[Realm.GPA.GCS.Services_Carriers]  WITH CHECK ADD  CONSTRAINT [FK_Realm.GPA.GCS.Services_Carriers_Realm.GPA.GCS.Carriers] FOREIGN KEY([carrier_id])
REFERENCES [dbo].[Realm.GPA.GCS.Carriers] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Realm.GPA.GCS.Services_Carriers] CHECK CONSTRAINT [FK_Realm.GPA.GCS.Services_Carriers_Realm.GPA.GCS.Carriers]
GO
ALTER TABLE [dbo].[Realm.GPA.GCS.Services_Carriers]  WITH CHECK ADD  CONSTRAINT [FK_Realm.GPA.GCS.Services_Carriers_Realm.GPA.GCS.Services] FOREIGN KEY([service_id])
REFERENCES [dbo].[Realm.GPA.GCS.Services] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Realm.GPA.GCS.Services_Carriers] CHECK CONSTRAINT [FK_Realm.GPA.GCS.Services_Carriers_Realm.GPA.GCS.Services]
GO
ALTER TABLE [dbo].[Realm.GPA.GCS.Services_Ports]  WITH CHECK ADD  CONSTRAINT [FK_Realm.GPA.GCS.Services_Ports_Realm.GPA.GCS.Ports] FOREIGN KEY([port_id])
REFERENCES [dbo].[Realm.GPA.GCS.Ports] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Realm.GPA.GCS.Services_Ports] CHECK CONSTRAINT [FK_Realm.GPA.GCS.Services_Ports_Realm.GPA.GCS.Ports]
GO
ALTER TABLE [dbo].[Realm.GPA.GCS.Services_Ports]  WITH CHECK ADD  CONSTRAINT [FK_Realm.GPA.GCS.Services_Ports_Realm.GPA.GCS.Services] FOREIGN KEY([service_id])
REFERENCES [dbo].[Realm.GPA.GCS.Services] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Realm.GPA.GCS.Services_Ports] CHECK CONSTRAINT [FK_Realm.GPA.GCS.Services_Ports_Realm.GPA.GCS.Services]
GO
