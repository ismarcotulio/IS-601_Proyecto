

CREATE TABLE [CarDealership_OLAP1].[dbo].[FACT_PAY_EMPLOYEE_SALARY](
		[employee_FK] [int] NULL REFERENCES [CarDealership_OLAP1].[dbo].[DIM_EMPLOYEE] ([Id_PK]),
		[branch_office_FK] [tinyint] NULL REFERENCES [CarDealership_OLAP1].[dbo].[DIM_BRANCH_OFFICE] ([Id_PK]),
		[salary_per_hour] [money] NOT NULL,
		[date_FK] [datetime] NOT NULL,
		[area] [int] NOT NULL,
		[net_salary] [money] NOT NULL,
		[salary_id] [int] PRIMARY KEY,
		FOREIGN KEY(date_FK) REFERENCES [CarDealership_OLAP1].[dbo].[DIM_DATE](PK_Fecha),
	);