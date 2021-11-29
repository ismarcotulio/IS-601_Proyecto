USE [CarDealership_OLAP1]
GO

/****** Object:  Table [dbo].[DIM_SELLER]    Script Date: 28/11/2021 5:45:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_SELLER](
	[id_PK] [bigint] IDENTITY(1,1) NOT NULL,
	[seller] [nvarchar](80) NULL,
	[sell_location] [nvarchar](80) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

