/*
CREATE DATABASE CarDealership_OLTP1
GO

USE CarDealership_OLTP1
GO

CREATE SCHEMA LOGISTIC
GO

CREATE SCHEMA HUMAN_R;

*/


 IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'COLOR')
	CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[COLOR] (
		 int_id_PK INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		 var_name VARCHAR(50) NOT NULL UNIQUE,
	 );
	 
 IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'TYPE_MOVEMENT')
	 CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[TYPE_MOVEMENT](
		 tin_id_PK TINYINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		 var_name VARCHAR(50) NOT NULL UNIQUE,
		 tex_description TEXT DEFAULT ''
	 );


IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'MANUFACTURER')
	 CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[MANUFACTURER](
		 int_id_PK INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		 var_name VARCHAR(50) NOT NULL,
		 var_commonName VARCHAR(50) DEFAULT '',
		 var_postalCode VARCHAR(50) DEFAULT '',
		 tin_location_FK TINYINT DEFAULT 0,
	 );


IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'BRAND')
	CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[BRAND](
		 big_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		 var_name VARCHAR(50) NOT NULL UNIQUE,
		 tex_description TEXT DEFAULT '',
		 int_manufacturer_FK INT NOT NULL, FOREIGN KEY (int_manufacturer_FK) REFERENCES [CarDealership_OLTP1].[LOGISTIC].[MANUFACTURER](int_id_PK),
	);


IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'BODY_CLASS')
	 CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[BODY_CLASS](
		 int_id_PK INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		 var_name VARCHAR(50) NOT NULL,
		 tex_description TEXT DEFAULT ''
 );

 IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'VEHICLE_TYPE')
	 CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[VEHICLE_TYPE](
		 int_id_PK INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		 var_name VARCHAR(50) NOT NULL,
		 tex_description TEXT DEFAULT ''
 );

 IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'FUEL_TYPE')
	 CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[FUEL_TYPE](
		 tin_id_PK TINYINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		 var_name VARCHAR(50) NOT NULL,
		 tex_description TEXT DEFAULT ''
 );


IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'MODEL')
	 CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[MODEL](
		 int_id_PK INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		 var_name VARCHAR(50) NOT NULL,
		 tex_description TEXT DEFAULT '',
		 big_brand_FK BIGINT NOT NULL, FOREIGN KEY (big_brand_FK) REFERENCES [CarDealership_OLTP1].[LOGISTIC].[BRAND](big_id_PK),
		 int_body_class_FK INT NOT NULL, FOREIGN KEY (int_body_class_FK) REFERENCES [CarDealership_OLTP1].[LOGISTIC].[BODY_CLASS](int_id_PK)
 );


 IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'VEHICLE')
	 CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[VEHICLE](
		  big_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		  var_vin VARCHAR(45) NOT NULL UNIQUE,
		  var_engine VARCHAR(100) DEFAULT '',
		  var_brake_system VARCHAR(50) DEFAULT '',
		  tin_number_cylinders TINYINT DEFAULT 4,
		  dec_displacement_cc DECIMAL(10,3) DEFAULT 0,
		  var_gvwr VARCHAR(100) DEFAULT 0,
		  bit_use_state BIT DEFAULT 1,
		  tex_description TEXT DEFAULT '',
		  var_series VARCHAR(50) DEFAULT '',
		  int_year INT DEFAULT 2021,
		  tin_doors TINYINT DEFAULT 4,
		  int_color_FK INT NOT NULL,
		  int_model_FK INT NOT NULL,
		  tin_fuel_type_FK TINYINT NOT NULL,
		  int_vehicle_type_FK INT NOT NULL, 
		  FOREIGN KEY (int_vehicle_type_FK) REFERENCES [CarDealership_OLTP1].[LOGISTIC].[VEHICLE_TYPE](int_id_PK),
		  FOREIGN KEY (int_color_FK) REFERENCES [CarDealership_OLTP1].[LOGISTIC].[COLOR](int_id_PK),
		  FOREIGN KEY (int_model_FK) REFERENCES [CarDealership_OLTP1].[LOGISTIC].[MODEL](int_id_PK),
		  FOREIGN KEY (tin_fuel_type_FK) REFERENCES [CarDealership_OLTP1].[LOGISTIC].[FUEL_TYPE](tin_id_PK)
	  );

   IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'HUMAN_R' and t.name = 'BRANCH_OFFICES')
	   CREATE TABLE [CarDealership_OLTP1].[HUMAN_R].[BRANCH_OFFICES](
		  tin_id_branch_PK TINYINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		  var_name VARCHAR(50) NOT NULL,
		  int_id_address_FK INT DEFAULT 0,
	  );
   
   
   IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'MOVEMENT')
	   CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[MOVEMENT](
		  tin_id_PK TINYINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		  dat_dueDateTime DATETIME NOT NULL,
		  tin_type_movement_FK TINYINT, FOREIGN KEY(tin_type_movement_FK) REFERENCES [CarDealership_OLTP1].[LOGISTIC].[TYPE_MOVEMENT](tin_id_PK),
		  tin_branch_FK TINYINT, FOREIGN KEY (tin_branch_FK) REFERENCES [CarDealership_OLTP1].[HUMAN_R].[BRANCH_OFFICES](tin_id_branch_PK),
		  big_vehicle_FK BIGINT, FOREIGN KEY(big_vehicle_FK) REFERENCES [CarDealership_OLTP1].[LOGISTIC].[VEHICLE](big_id_PK),
	  );

  


 


 