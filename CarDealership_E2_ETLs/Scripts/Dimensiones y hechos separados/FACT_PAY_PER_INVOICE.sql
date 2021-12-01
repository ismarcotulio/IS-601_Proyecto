CREATE TABLE [CarDealership_OLAP1].[dbo].[FACT_PAY_PER_INVOICE](
	[payment_id][bigint] PRIMARY KEY,
	[date_FK][datetime] NULL,
	[branch_office_FK][tinyint] NULL REFERENCES [CarDealership_OLAP1].[dbo].[DIM_BRANCH_OFFICE](Id_PK),
	[service_transaction_FK][bigint] NULL REFERENCES [CarDealership_OLAP1].[dbo].[DIM_SERVICE_TRANSACTION](id_PK),
	[client_FK] [bigint] NULL  REFERENCES [CarDealership_OLAP1].[dbo].[DIM_CLIENT](Id_PK),
	[invoice_FK] [bigint] NULL REFERENCES [CarDealership_OLAP1].[dbo].[DIM_INVOICE](id_PK),
	[amount][decimal](10, 4),
	[type_of_pay_method][nvarchar](30),
);
