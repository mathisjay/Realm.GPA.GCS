
ALTER TABLE dbo.[Realm.GPA.GCS.Carriers]
	DROP COLUMN image_url
GO


CREATE TABLE [dbo].[Realm.GPA.GCS.Carrier_Images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[carrier_id] [int] NOT NULL,
	[image_url] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Realm.GPA.GCS.Carrier_Images] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Realm.GPA.GCS.Carrier_Images]  WITH CHECK ADD  CONSTRAINT [FK_Realm.GPA.GCS.Carrier_Images_Realm.GPA.GCS.Carriers] FOREIGN KEY([carrier_id])
REFERENCES [dbo].[Realm.GPA.GCS.Carriers] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
