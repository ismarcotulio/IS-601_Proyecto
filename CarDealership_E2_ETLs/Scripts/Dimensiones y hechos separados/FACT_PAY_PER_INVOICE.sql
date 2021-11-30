CREATE TABLE [CarDealership_OLAP1].[dbo].[FACT_PAY_PER_INVOICE](
	[date_FK] DATETIME,
	[branch_office_FK] TINYINT,
	[service_transaction_FK] BIGINT,
	[client_FK] BIGINT,
	[invoice_FK] BIGINT,
	[amount] DECIMAL(10,2),
	[type_of_pay_method] NVARCHAR(30),
	FOREIGN KEY(branch_office_FK) REFERENCES [CarDealership_OLAP1].[dbo].[DIM_BRANCH_OFFICE](Id_PK),
	FOREIGN KEY(service_transaction_FK) REFERENCES [CarDealership_OLAP1].[dbo].[DIM_SERVICE_TRANSACTION](id_PK),
	FOREIGN KEY(client_FK) REFERENCES [CarDealership_OLAP1].[dbo].[DIM_CLIENT](Id_PK),
	FOREIGN KEY(invoice_FK) REFERENCES [CarDealership_OLAP1].[dbo].[DIM_INVOICE](id_PK),
	PRIMARY KEY(branch_office_FK, service_transaction_FK, client_FK, invoice_FK)
);
