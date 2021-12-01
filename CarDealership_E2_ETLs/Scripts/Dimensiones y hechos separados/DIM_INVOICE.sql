USE [CarDealership_OLAP1]
GO

/****** Object:  Table [dbo].[DIM_INVOICE]    Script Date: 1/12/2021 10:55:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_INVOICE](
	[id_PK] [bigint] NOT NULL,
	[CAI] [nvarchar](45) NULL,
	[deadline] [date] NULL,
	[correlative_number] [int] NULL,
	[document_type] [nvarchar](60) NULL,
	[printing_authorization_number] [nvarchar](16) NULL,
	[emission_point_number] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


