USE [CarDealership_OLAP1]
GO

/****** Object:  Table [dbo].[DIM_BRANCH_OFFICE]    Script Date: 28/11/2021 10:36:34 a.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_BRANCH_OFFICE](
	[Id_PK] [tinyint] NOT NULL,
	[name] [nvarchar](50) NULL,
	[country] [nvarchar](60) NULL,
	[departament] [nvarchar](60) NULL,
	[city] [nvarchar](60) NULL,
	[suburn] [nvarchar](60) NULL,
	[reference] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


