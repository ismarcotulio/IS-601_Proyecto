USE [CarDealership_OLAP1]
GO

/****** Object:  Table [dbo].[DIM_VEHICLE]    Script Date: 28/11/2021 5:44:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_VEHICLE](
	[id_SK] [bigint] IDENTITY(1,1) NOT NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[craiglist_post_date] [date] NULL,
	[price] [decimal](10, 2) NULL,
	[vin] [nvarchar](45) NOT NULL,
	[engine] [nvarchar](100) NULL,
	[brake_system] [nvarchar](50) NULL,
	[number_cylinders] [tinyint] NULL,
	[displacement_cc] [decimal](10, 2) NULL,
	[gvwr] [nvarchar](100) NULL,
	[use_state] [nvarchar](50) NULL,
	[model_year] [int] NULL,
	[doors] [tinyint] NULL,
	[color] [nvarchar](50) NULL,
	[model] [nvarchar](50) NULL,
	[fuel_type] [nvarchar](50) NULL,
	[vehicle_type] [nvarchar](100) NULL,
	[transaction_state] [nvarchar](50) NULL,
	[brand] [nvarchar](50) NULL,
	[manufacturer] [nvarchar](50) NULL,
	[body_class] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[vin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


