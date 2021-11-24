
CREATE DATABASE [CarDealership_OLAP1]
GO

      CREATE TABLE [CarDealership_OLAP1].[dbo].[DIM_VEHICLE] (
		[id_SK] [bigint] IDENTITY(1,1),
		[id_PK] [bigint] PRIMARY KEY,
		[start_date] [DATE],
		[end_date] [DATE],
		[craiglist_post_date] [DATE],
		[price] [decimal](10, 2),
		[vin] [nvarchar](45),
		[engine] [nvarchar](100),
		[brake_system] [nvarchar](50),
		[number_cylinders] [tinyint],
		[displacement_cc] [decimal](10, 2),
		[gvwr] [nvarchar](100),
		[use_state] [nvarchar](50),
		[model_year] [int],
		[doors] [tinyint],
		[color] [nvarchar](50),
		[model] [nvarchar](50),
		[fuel_type] [nvarchar](50),
		[vehicle_type] [nvarchar](100),
		[transaction_state] [nvarchar](50),
		[brand] [nvarchar](50),
		[manufacturer] [nvarchar](50),
		[body_class] [nvarchar](50)
	  );

	  CREATE TABLE [CarDealership_OLAP1].[dbo].[DIM_TYPE_MOVEMENT](
		[id_PK] [tinyint] IDENTITY(1,1) NOT NULL,
		[name] [nvarchar](50) NOT NULL
	);