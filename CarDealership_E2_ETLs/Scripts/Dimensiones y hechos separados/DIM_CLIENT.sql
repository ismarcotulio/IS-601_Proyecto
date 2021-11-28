USE [CarDealership_OLAP1]
GO

/****** Object:  Table [dbo].[DIM_CLIENT]    Script Date: 28/11/2021 10:37:31 a.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_CLIENT](
	[Id_PK] [bigint] IDENTITY(1,1) NOT NULL,
	[country] [nvarchar](60) NULL,
	[departament] [nvarchar](60) NULL,
	[city] [nvarchar](60) NULL,
	[suburn] [nvarchar](60) NULL,
	[reference] [nvarchar](max) NULL,
	[name] [nvarchar](max) NULL,
	[type_of_client] [nvarchar](7) NULL,
	[code] [nvarchar](20) NULL,
	[rtn] [nvarchar](14) NULL,
	[oltp_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


