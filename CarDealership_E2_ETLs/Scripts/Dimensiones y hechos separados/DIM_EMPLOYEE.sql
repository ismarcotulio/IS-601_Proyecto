USE [CarDealership_OLAP1]
GO

/****** Object:  Table [dbo].[DIM_EMPLOYEE]    Script Date: 28/11/2021 10:38:01 a.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_EMPLOYEE](
	[Id_PK] [int] NOT NULL,
	[name] [nvarchar](243) NULL,
	[dni] [nvarchar](13) NULL,
	[dat_of_birth] [date] NULL,
	[gender] [nvarchar](25) NULL,
	[country] [nvarchar](60) NULL,
	[departament] [nvarchar](60) NULL,
	[city] [nvarchar](60) NULL,
	[suburn] [nvarchar](60) NULL,
	[reference] [nvarchar](max) NULL,
	[code] [nvarchar](10) NULL,
	[area] [nvarchar](60) NULL,
	[salary_in_contract] [money] NULL,
	[position] [nvarchar](60) NULL,
	[date_hire] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


