
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

	CREATE TABLE [CarDealership_OLAP1].[dbo].[DIM_BRANCH_OFFICE](
		[Id_PK] [tinyint] PRIMARY KEY,
		[name] [nvarchar](50) NULL,
		[country] [nvarchar](60) NULL,
		[departament] [nvarchar](60) NULL,
		[city] [nvarchar](60) NULL,
		[suburn] [nvarchar](60) NULL,
		[reference] [nvarchar](max) NULL
	);

	CREATE TABLE [CarDealership_OLAP1].[dbo].[DIM_CLIENT](
		[Id_PK] [bigint] IDENTITY(1,1) PRIMARY KEY,
		[country] [nvarchar](60) NULL,
		[departament] [nvarchar](60) NULL,
		[city] [nvarchar](60) NULL,
		[suburn] [nvarchar](60) NULL,
		[reference] [nvarchar](max) NULL,
		[name] [nvarchar](max) NULL,
		[type_of_client] [nvarchar](7) NULL,
		[code] [nvarchar](20) NULL,
		[rtn] [nvarchar](14) NULL,
		[oltp_id] [bigint] NULL
	);

	CREATE TABLE [CarDealership_OLAP1].[dbo].[DIM_EMPLOYEE](
		[Id_PK] [int] PRIMARY KEY,
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
		[date_hire] [date] NULL
	);

	CREATE TABLE [CarDealership_OLAP1].[dbo].[FACT_PAY_EMPLOYEE_SALARY](
		[employee_FK] [int] NULL REFERENCES [CarDealership_OLAP1].[dbo].[DIM_EMPLOYEE] ([Id_PK]),
		[branch_office_FK] [tinyint] NULL REFERENCES [CarDealership_OLAP1].[dbo].[DIM_BRANCH_OFFICE] ([Id_PK]),
		[salary_per_hour] [money] NOT NULL,
		[date_FK] [datetime] NOT NULL,
		[area] [int] NOT NULL,
		[net_salary] [money] NOT NULL,
		[salary_id] [int] PRIMARY KEY
	);

	CREATE TABLE [CarDealership_OLAP1].[dbo].[DIM_SERVICE_TRANSACTION](
		[id_PK] [bigint] PRIMARY KEY,
		[start_date] [date] NULL,
		[end_date] [date] NULL,
		[subtotal] [numeric](10, 4) NULL,
		[discount] [tinyint] NULL,
		[reduction] [numeric](10, 4) NULL,
		[total] [numeric](10, 4) NULL,
		[total_isv] [numeric](10, 2) NULL,
		[limit_property] [date] NULL,
	);

	CREATE TABLE [CarDealership_OLAP1].[dbo].[DIM_INVOICE](
		[id_PK] [bigint] PRIMARY KEY,
		[CAI] [nvarchar](45) NULL,
		[deadline] [date] NULL,
		[correlative_number] [int] NULL,
		[document_type] [nvarchar](60) NULL,
		[document_type_number] [int] NULL,
		[printing_authorization_number] [nvarchar](16) NULL,
		[printing_code] [nvarchar](14) NULL,
		[emission_point_number] [int] NULL,
		[emission_point_modality] [nvarchar](255) NULL,
		[starting_range] [int] NULL,
		[final_range] [int] NULL,
		[current_number] [int] NULL,
	);

	--USE CarDealership_OLAP1
	--ALTER TABLE dbo.[FACT_PAY_EMPLOYEE_SALARY] ADD FOREIGN KEY ([date_FK]) REFERENCES dbo.DIM_DATE(PK_Fecha)