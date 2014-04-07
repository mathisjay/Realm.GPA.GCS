
/****** Object:  Table [dbo].[Realm.GPA.GCS.Carriers]    Script Date: 4/7/2014 7:35:20 AM ******/
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
/****** Object:  Table [dbo].[Realm.GPA.GCS.Ports]    Script Date: 4/7/2014 7:35:20 AM ******/
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
/****** Object:  Table [dbo].[Realm.GPA.GCS.Regions]    Script Date: 4/7/2014 7:35:20 AM ******/
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
/****** Object:  Table [dbo].[Realm.GPA.GCS.Services]    Script Date: 4/7/2014 7:35:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Realm.GPA.GCS.Services](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[turnaround_days] [int] NOT NULL,
	[frequency] [nvarchar](50) NOT NULL,
	[number_of_vessels] [int] NOT NULL,
	[avg_capacity] [int] NOT NULL,
	[image_url] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Realm.GPA.GCS.Services] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Realm.GPA.GCS.Services_Carriers]    Script Date: 4/7/2014 7:35:20 AM ******/
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
/****** Object:  Table [dbo].[Realm.GPA.GCS.Services_Ports]    Script Date: 4/7/2014 7:35:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Realm.GPA.GCS.Services_Ports](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[service_id] [int] NOT NULL,
	[port_id] [int] NOT NULL,
	[days_to] [int] NULL,
	[days_from] [int] NULL,
 CONSTRAINT [PK_Realm.GPA.GCS.Services_Ports] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Realm.GPA.GCS.US_Cities]    Script Date: 4/7/2014 7:35:20 AM ******/
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
SET IDENTITY_INSERT [dbo].[Realm.GPA.GCS.Ports] OFF
GO
SET IDENTITY_INSERT [dbo].[Realm.GPA.GCS.Regions] ON 

GO
INSERT [dbo].[Realm.GPA.GCS.Regions] ([id], [name], [x], [y], [radius], [domestic]) VALUES (2, N'Southeast United States', 130, 120, 30, 1)
GO
INSERT [dbo].[Realm.GPA.GCS.Regions] ([id], [name], [x], [y], [radius], [domestic]) VALUES (3, N'Australia', 650, 290, 60, 0)
GO
INSERT [dbo].[Realm.GPA.GCS.Regions] ([id], [name], [x], [y], [radius], [domestic]) VALUES (4, N'Southeast Asia', 620, 140, 90, 0)
GO
INSERT [dbo].[Realm.GPA.GCS.Regions] ([id], [name], [x], [y], [radius], [domestic]) VALUES (5, N'Middle East', 480, 170, 40, 0)
GO
INSERT [dbo].[Realm.GPA.GCS.Regions] ([id], [name], [x], [y], [radius], [domestic]) VALUES (6, N'Africa', 390, 260, 60, 0)
GO
INSERT [dbo].[Realm.GPA.GCS.Regions] ([id], [name], [x], [y], [radius], [domestic]) VALUES (7, N'Euope', 370, 100, 60, 0)
GO
INSERT [dbo].[Realm.GPA.GCS.Regions] ([id], [name], [x], [y], [radius], [domestic]) VALUES (8, N'South America', 180, 280, 80, 0)
GO
INSERT [dbo].[Realm.GPA.GCS.Regions] ([id], [name], [x], [y], [radius], [domestic]) VALUES (9, N'Central America', 130, 180, 35, 0)
GO
SET IDENTITY_INSERT [dbo].[Realm.GPA.GCS.Regions] OFF
GO
SET IDENTITY_INSERT [dbo].[Realm.GPA.GCS.Services] ON 

GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (1, N'AAE1', N'Asia America East Loop 1', 70, N'Weekly', 10, 4200, N'/DesktopModules/Realm.GPA.GCS/maps/aae1.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (2, N'AUE', N'Asia US East Coast', 70, N'Weekly', 10, 4200, N'/DesktopModules/Realm.GPA.GCS/maps/aue.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (3, N'AWE1', N'All Water North Loop', 70, N'Weekly', 10, 4200, N'/DesktopModules/Realm.GPA.GCS/maps/awe1.jpg')
GO
INSERT [dbo].[Realm.GPA.GCS.Services] ([id], [name], [description], [turnaround_days], [frequency], [number_of_vessels], [avg_capacity], [image_url]) VALUES (4, N'AWE3', N'All Water Yang Ming Lane', 63, N'Weekly', 9, 4400, N'/DesktopModules/Realm.GPA.GCS/maps/awe3.jpg')
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
SET IDENTITY_INSERT [dbo].[Realm.GPA.GCS.Services_Carriers] OFF
GO
SET IDENTITY_INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ON 

GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (1, 1, 12, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (2, 1, 7, 35, 33)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (3, 1, 9, 34, 34)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (4, 1, 8, 33, 35)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (5, 1, 6, 30, 38)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (6, 1, 11, 4, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (7, 1, 10, 2, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (8, 2, 12, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (9, 2, 11, NULL, 2)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (10, 2, 15, NULL, 4)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (11, 2, 16, 4, 11)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (12, 2, 13, 31, 38)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (13, 2, 9, 30, 40)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (14, 2, 8, 29, 40)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (15, 2, 14, 27, 42)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (16, 3, 12, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (17, 3, 17, NULL, 1)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (18, 3, 18, NULL, 16)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (19, 3, 15, NULL, 35)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (20, 3, 20, 31, 38)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (21, 3, 6, 29, 39)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (22, 3, 19, 27, 35)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (23, 3, 11, 4, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (24, 3, 21, 1, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (25, 4, 12, NULL, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (26, 4, 11, NULL, 3)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (27, 4, 21, NULL, 5)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (28, 4, 19, 22, 34)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (29, 4, 20, 25, 36)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (30, 4, 6, 24, 37)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (31, 4, 22, 8, NULL)
GO
INSERT [dbo].[Realm.GPA.GCS.Services_Ports] ([id], [service_id], [port_id], [days_to], [days_from]) VALUES (32, 4, 16, 3, NULL)
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
