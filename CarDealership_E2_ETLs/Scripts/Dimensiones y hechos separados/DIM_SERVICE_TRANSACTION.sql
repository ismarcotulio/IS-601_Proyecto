USE [CarDealership_OLAP1]
GO

/****** Object:  Table [dbo].[DIM_SERVICE_TRANSACTION]    Script Date: 28/11/2021 15:17:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_SERVICE_TRANSACTION](
	[id_PK] [bigint] NOT NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[subtotal] [numeric](10, 4) NULL,
	[discount] [tinyint] NULL,
	[reduction] [numeric](10, 4) NULL,
	[total] [numeric](10, 4) NULL,
	[total_isv] [numeric](10, 2) NULL,
	[limit_property] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


