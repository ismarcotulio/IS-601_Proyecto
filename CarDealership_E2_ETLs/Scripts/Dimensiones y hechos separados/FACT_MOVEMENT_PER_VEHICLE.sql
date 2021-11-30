USE [CarDealership_OLAP1]
GO

CREATE TABLE [CarDealership_OLAP1].[dbo].[FACT_MOVEMENT_PER_VEHICLE](
	[big_id_PK] [bigint] NOT NULL, 
	[dim_date_FK] [datetime] NOT NULL, FOREIGN KEY (dim_date_FK) REFERENCES [CarDealership_OLAP1].[dbo].[DIM_DATE](PK_Fecha),
	[dim_type_movement_FK] [tinyint] NOT NULL, FOREIGN KEY (dim_type_movement_FK)  REFERENCES [CarDealership_OLAP1].[dbo].[DIM_TYPE_MOVEMENT](Id_PK),
	[dim_branch_FK] [tinyint] NOT NULL, FOREIGN KEY (dim_branch_FK)  REFERENCES [CarDealership_OLAP1].[dbo].[DIM_BRANCH_OFFICE](Id_PK),
	[dim_vehicle_FK] [nvarchar](45) NOT NULL, FOREIGN KEY (dim_vehicle_FK) REFERENCES [CarDealership_OLAP1].[dbo].[DIM_VEHICLE](vin) 
	);


SET IDENTITY_INSERT FACT_MOVEMENT_PER_VEHICLE ON;



