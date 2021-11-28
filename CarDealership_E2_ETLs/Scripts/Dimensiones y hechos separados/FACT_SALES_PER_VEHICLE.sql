

CREATE TABLE [CarDealership_OLAP1].[dbo].[FACT_SELL_PER_VEHICLE](
	[id_PK] BIGINT PRIMARY KEY IDENTITY(1,1),
	[date_FK] DATETIME,
	[vehicle_FK] NVARCHAR(45),
	[seller_FK] BIGINT,
	[amount] DECIMAL(10,2),
	[vehicle_mileage] DECIMAL(12,4),
	FOREIGN KEY(date_FK) REFERENCES [CarDealership_OLAP1].[dbo].[DIM_DATE](PK_Fecha),
	FOREIGN KEY(vehicle_FK) REFERENCES [CarDealership_OLAP1].[dbo].[DIM_VEHICLE](vin),
	FOREIGN KEY(seller_FK) REFERENCES [CarDealership_OLAP1].[dbo].[DIM_SELLER](id_PK)
);